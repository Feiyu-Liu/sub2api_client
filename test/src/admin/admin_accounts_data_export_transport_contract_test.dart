import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_account_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/session/sub2api_session.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );
  const session = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('admin-data-export-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'Admin JWT exports a redacted credential archive after role check',
    () async {
      final adapter = JsonResponseAdapter((request) {
        if (request.path == '/api/v1/auth/me') {
          return JsonResponse(
            body: readFixture('auth/current_user_success.json'),
          );
        }
        return JsonResponse(
          body: readFixture('admin/account_data_export.json'),
        );
      });
      final client = createSub2ApiAdminClientForTesting(
        configuration: configuration,
        sessionStore: RecordingSessionStore(session),
        dio: _dio(adapter),
      );
      addTearDown(client.close);

      final exported = await client.accounts.exportData(
        query: Sub2ApiAdminAccountDataExportQuery(
          selector: Sub2ApiAdminBulkAccountSelector.ids([42, 43, 42]),
          includeProxies: false,
          sortBy: Sub2ApiAdminAccountSort.priority,
          sortDescending: true,
        ),
      );

      expect(exported.exportedAt, DateTime.utc(2026, 8, 27, 3, 4, 5));
      expect(exported.proxyCount, 1);
      expect(exported.accountCount, 1);
      expect(exported.skippedShadowCount, 1);
      expect(
        exported.toString(),
        isNot(contains('export-access-token-sentinel')),
      );
      expect(exported.archive.toString(), '<redacted>');
      final revealed =
          jsonDecode(exported.archive.reveal()) as Map<String, Object?>;
      final accounts = revealed['accounts']! as List<Object?>;
      final account = accounts.single as Map<String, Object?>;
      final credentials = account['credentials']! as Map<String, Object?>;
      expect(credentials['access_token'], 'export-access-token-sentinel');

      expect(
        adapter.requests.map((request) => '${request.method} ${request.path}'),
        <String>['GET /api/v1/auth/me', 'GET /api/v1/admin/accounts/data'],
      );
      final sent = adapter.requests.last;
      expect(sent.queryParameters, <String, dynamic>{
        'ids': '42,43',
        'sort_by': 'priority',
        'sort_order': 'desc',
        'include_proxies': false,
      });
      for (final request in adapter.requests) {
        expect(
          request.headers,
          containsPair(
            'Authorization',
            'Bearer admin-data-export-jwt-sentinel',
          ),
        );
        expect(request.headers, isNot(contains('x-api-key')));
      }
    },
  );

  test('export maps typed filters without raw path or JSON input', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: readFixture('admin/account_data_export.json'));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.accounts.exportData(
      query: const Sub2ApiAdminAccountDataExportQuery(
        selector: Sub2ApiAdminBulkAccountSelector.filters(
          Sub2ApiAdminBulkAccountFilters(
            platform: Sub2ApiAdminAccountPlatform.openAi,
            type: Sub2ApiAdminAccountType.oauth,
            status: Sub2ApiAdminAccountStatus.active,
            group: Sub2ApiAdminBulkGroupFilter.ungrouped(),
            search: 'primary',
            privacyMode: 'blocked',
          ),
        ),
        sortBy: Sub2ApiAdminAccountSort.createdAt,
      ),
    );

    expect(adapter.requests.last.queryParameters, <String, dynamic>{
      'platform': 'openai',
      'type': 'oauth',
      'status': 'active',
      'search': 'primary',
      'privacy_mode': 'blocked',
      'group': 'ungrouped',
      'sort_by': 'created_at',
      'sort_order': 'asc',
    });
  });

  test('Ops rejects credential-bearing export before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('step-up rejection must be local'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.exportData(),
      throwsA(_code('auth.step_up_admin_api_key_forbidden')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('export preserves step-up and business failures', () async {
    for (final failure in <({int status, Object body, String code})>[
      (
        status: 403,
        body: const <String, Object?>{
          'code': 'STEP_UP_REQUIRED',
          'message': 'recent verification required',
        },
        code: 'auth.step_up_required',
      ),
      (
        status: 400,
        body: const <String, Object?>{
          'code': 'INVALID_GROUP_FILTER',
          'message': 'invalid group filter',
        },
        code: 'server.invalid_group_filter',
      ),
    ]) {
      final adapter = JsonResponseAdapter((request) {
        if (request.path == '/api/v1/auth/me') {
          return JsonResponse(
            body: readFixture('auth/current_user_success.json'),
          );
        }
        return JsonResponse(statusCode: failure.status, body: failure.body);
      });
      final client = createSub2ApiAdminClientForTesting(
        configuration: configuration,
        sessionStore: RecordingSessionStore(session),
        dio: _dio(adapter),
      );
      addTearDown(client.close);

      await expectLater(
        client.accounts.exportData(),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('export rejects malformed secret-bearing success data', () async {
    final fixture = readFixture('admin/account_data_export.json');
    final data = Map<String, Object?>.from(fixture['data']! as Map)
      ..['accounts'] = <Object?>[
        <String, Object?>{
          'name': 'bad',
          'platform': 'openai',
          'type': 'oauth',
          'credentials': 'secret-must-not-become-a-raw-string',
          'concurrency': 3,
          'priority': 50,
        },
      ];
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(
        body: <String, Object?>{'code': 0, 'message': 'success', 'data': data},
      );
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await expectLater(
      client.accounts.exportData(),
      throwsA(_code('protocol.invalid_admin_account_response')),
    );
  });

  test('export validates selectors before role or network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    expect(
      () => client.accounts.exportData(
        query: Sub2ApiAdminAccountDataExportQuery(
          selector: Sub2ApiAdminBulkAccountSelector.ids([]),
        ),
      ),
      throwsA(_code('admin.accounts.account_ids_required')),
    );
    expect(
      () => client.accounts.exportData(
        query: const Sub2ApiAdminAccountDataExportQuery(
          selector: Sub2ApiAdminBulkAccountSelector.filters(
            Sub2ApiAdminBulkAccountFilters(
              group: Sub2ApiAdminBulkGroupFilter.id(0),
            ),
          ),
        ),
      ),
      throwsA(_code('admin.accounts.invalid_group_id')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('export disables automatic refresh and replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-data-export-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-data-export-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      if (request.path == '/api/v1/auth/refresh') {
        return JsonResponse(
          body: readFixture('auth/refresh_rotated_pair.json'),
        );
      }
      return JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      );
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(refreshableSession),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await expectLater(
      client.accounts.exportData(),
      throwsA(isA<Sub2ApiException>()),
    );

    expect(
      adapter.requests.where(
        (request) => request.path == '/api/v1/auth/refresh',
      ),
      isEmpty,
    );
    expect(
      adapter.requests.where(
        (request) => request.path == '/api/v1/admin/accounts/data',
      ),
      hasLength(1),
    );
  });
}

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-data-export-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
