import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_proxy_models.dart';
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
    accessToken: Sub2ApiAccessToken('admin-proxy-data-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'Admin JWT exports a redacted proxy-only archive after role check',
    () async {
      final adapter = JsonResponseAdapter((request) {
        if (request.path == '/api/v1/auth/me') {
          return JsonResponse(
            body: readFixture('auth/current_user_success.json'),
          );
        }
        return JsonResponse(body: _success(_fixture()['archive']));
      });
      final client = createSub2ApiAdminClientForTesting(
        configuration: configuration,
        sessionStore: RecordingSessionStore(session),
        dio: _dio(adapter),
      );
      addTearDown(client.close);

      final exported = await client.proxies.exportData(
        query: const Sub2ApiAdminProxyDataExportQuery(
          selector: Sub2ApiAdminProxyDataSelector.filters(
            Sub2ApiAdminProxyDataFilters(
              protocol: Sub2ApiAdminProxyProtocol.socks5,
              status: Sub2ApiAdminProxyStatus.active,
              search: 'primary',
            ),
          ),
          sortBy: Sub2ApiAdminProxySort.accountCount,
          sortDescending: false,
        ),
      );

      expect(exported.exportedAt, DateTime.utc(2026, 8, 27, 5, 6, 7));
      expect(exported.proxyCount, 1);
      expect(
        exported.toString(),
        isNot(contains('proxy-data-password-sentinel')),
      );
      expect(exported.archive.toString(), '<redacted>');
      final archive =
          jsonDecode(exported.archive.reveal()) as Map<String, Object?>;
      final proxy =
          (archive['proxies']! as List<Object?>).single as Map<String, Object?>;
      expect(proxy['password'], 'proxy-data-password-sentinel');
      expect(archive['accounts'], isEmpty);
      expect(adapter.requests.last.queryParameters, <String, dynamic>{
        'protocol': 'socks5',
        'status': 'active',
        'search': 'primary',
        'sort_by': 'account_count',
        'sort_order': 'asc',
      });
    },
  );

  test('Ops rejects proxy data export before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('step-up rejection must be local'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.proxies.exportData(),
      throwsA(_code('auth.step_up_admin_api_key_forbidden')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('proxy export preserves step-up failure without replay', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return const JsonResponse(
        statusCode: 403,
        body: <String, Object?>{
          'code': 'STEP_UP_REQUIRED',
          'message': 'verification required',
        },
      );
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await expectLater(
      client.proxies.exportData(),
      throwsA(_code('auth.step_up_required')),
    );
    expect(
      adapter.requests.where(
        (request) => request.path == '/api/v1/admin/proxies/data',
      ),
      hasLength(1),
    );
  });

  test('Ops imports a proxy-only archive without exposing passwords', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(_fixture()['import_result'])),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);
    final archive = _archive();

    final result = await client.proxies.importData(archive);

    expect(result.created, 1);
    expect(result.reused, 1);
    expect(result.failed, 1);
    expect(result.errors.single.name, 'fallback-proxy');
    expect(archive.toString(), '<redacted>');
    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/admin/proxies/data');
    expect(
      sent.headers,
      containsPair('x-api-key', 'admin-proxy-data-key-sentinel'),
    );
    final body = sent.data! as Map<String, Object?>;
    final data = body['data']! as Map<String, Object?>;
    final proxy =
        (data['proxies']! as List<Object?>).single as Map<String, Object?>;
    expect(proxy['password'], 'proxy-data-password-sentinel');
  });

  test('Admin JWT proxy import runs after role bootstrap', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _success(_fixture()['import_result']));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.proxies.importData(_archive());

    expect(
      adapter.requests.map((request) => '${request.method} ${request.path}'),
      <String>['GET /api/v1/auth/me', 'POST /api/v1/admin/proxies/data'],
    );
  });

  test('proxy import preserves business and invalid key failures', () async {
    for (final failure in <({int status, Object body, String code})>[
      (
        status: 503,
        body: const <String, Object?>{
          'code': 'PROXY_IMPORT_FAILED',
          'message': 'import failed',
        },
        code: 'server.proxy_import_failed',
      ),
      (
        status: 401,
        body: readFixture('admin/account_auth_failure.json'),
        code: 'server.invalid_api_key',
      ),
    ]) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(statusCode: failure.status, body: failure.body),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);
      await expectLater(
        client.proxies.importData(_archive()),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('proxy data routes reject malformed success contracts', () async {
    final exportAdapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(
        body: _success(<String, Object?>{
          'exported_at': '2026-08-27T05:06:07Z',
          'proxies': <Object?>[],
          'accounts': <Object?>[<String, Object?>{}],
        }),
      );
    });
    final admin = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(exportAdapter),
    );
    addTearDown(admin.close);
    await expectLater(
      admin.proxies.exportData(),
      throwsA(_code('protocol.invalid_admin_proxy_response')),
    );

    final importAdapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: _success(<String, Object?>{
          'proxy_created': 1,
          'proxy_reused': 0,
          'proxy_failed': 0,
          'account_created': 1,
          'account_failed': 0,
        }),
      ),
    );
    final ops = _opsClient(configuration, importAdapter);
    addTearDown(ops.close);
    await expectLater(
      ops.proxies.importData(_archive()),
      throwsA(_code('protocol.invalid_admin_proxy_response')),
    );
  });

  test('proxy data validation rejects invalid selectors and archives', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final admin = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(admin.close);
    expect(
      () => admin.proxies.exportData(
        query: Sub2ApiAdminProxyDataExportQuery(
          selector: Sub2ApiAdminProxyDataSelector.ids([]),
        ),
      ),
      throwsA(_code('admin.proxies.proxy_ids_required')),
    );

    final ops = _opsClient(configuration, adapter);
    addTearDown(ops.close);
    for (final invalid in <String>[
      '{',
      jsonEncode(<String, Object?>{
        'proxies': <Object?>[],
        'accounts': <Object?>[1],
      }),
      jsonEncode(<String, Object?>{
        'type': 'other-product',
        'proxies': <Object?>[],
        'accounts': <Object?>[],
      }),
    ]) {
      expect(
        () => ops.proxies.importData(Sub2ApiAdminProxyDataArchive(invalid)),
        throwsA(isA<Sub2ApiException>()),
      );
    }
    expect(adapter.requests, isEmpty);
  });

  test('proxy import disables automatic refresh and replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-proxy-data-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-proxy-data-jwt'),
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
      client.proxies.importData(_archive()),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(
      adapter.requests.where(
        (request) => request.path == '/api/v1/auth/refresh',
      ),
      isEmpty,
    );
  });
}

Map<String, Object?> _fixture() =>
    readFixture('admin/proxy_data_transfer.json');

Sub2ApiAdminProxyDataArchive _archive() =>
    Sub2ApiAdminProxyDataArchive(jsonEncode(_fixture()['archive']));

Map<String, Object?> _success(Object? data) => <String, Object?>{
  'code': 0,
  'message': 'success',
  'data': data,
};

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-proxy-data-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
