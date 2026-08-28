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
    accessToken: Sub2ApiAccessToken('admin-data-import-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'Ops imports an opaque account archive with explicit idempotency',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('admin/account_data_import_result.json'),
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);
      final request = Sub2ApiAdminAccountDataImportRequest(
        idempotencyKey: 'account-data-import-1',
        archive: _archive(),
        skipDefaultGroupBind: true,
      );

      final result = await client.accounts.importData(request);

      expect(result.proxyCreated, 1);
      expect(result.proxyReused, 1);
      expect(result.proxyFailed, 1);
      expect(result.accountCreated, 2);
      expect(result.accountFailed, 1);
      expect(result.errors, hasLength(2));
      expect(
        result.errors.first.kind,
        Sub2ApiAdminAccountDataImportErrorKind.proxy,
      );
      expect(
        result.errors.last.kind,
        Sub2ApiAdminAccountDataImportErrorKind.account,
      );
      expect(
        request.toString(),
        isNot(contains('export-access-token-sentinel')),
      );
      expect(request.archive.toString(), '<redacted>');

      final sent = adapter.requests.single;
      expect(sent.method, 'POST');
      expect(sent.path, '/api/v1/admin/accounts/data');
      expect(
        sent.headers,
        containsPair('x-api-key', 'admin-data-import-key-sentinel'),
      );
      expect(
        sent.headers,
        containsPair('Idempotency-Key', 'account-data-import-1'),
      );
      expect(sent.headers, isNot(contains('Authorization')));
      final body = sent.data! as Map<String, Object?>;
      expect(body['skip_default_group_bind'], isTrue);
      final data = body['data']! as Map<String, Object?>;
      final accounts = data['accounts']! as List<Object?>;
      final account = accounts.single as Map<String, Object?>;
      final credentials = account['credentials']! as Map<String, Object?>;
      expect(credentials['access_token'], 'export-access-token-sentinel');
    },
  );

  test('Admin JWT import runs after role bootstrap', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(
        body: readFixture('admin/account_data_import_result.json'),
      );
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.accounts.importData(
      Sub2ApiAdminAccountDataImportRequest(
        idempotencyKey: 'account-data-import-admin-1',
        archive: _archive(),
      ),
    );

    expect(
      adapter.requests.map((request) => '${request.method} ${request.path}'),
      <String>['GET /api/v1/auth/me', 'POST /api/v1/admin/accounts/data'],
    );
    expect(
      adapter.requests.last.data,
      isNot(containsPair('skip_default_group_bind', anything)),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer admin-data-import-jwt-sentinel'),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test('import preserves business and invalid API key failures', () async {
    for (final failure in <({int status, Object body, String code})>[
      (
        status: 503,
        body: const <String, Object?>{
          'code': 'IDEMPOTENCY_STORE_UNAVAILABLE',
          'message': 'unavailable',
        },
        code: 'server.idempotency_store_unavailable',
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
        client.accounts.importData(
          Sub2ApiAdminAccountDataImportRequest(
            idempotencyKey: 'account-data-import-failure',
            archive: _archive(),
          ),
        ),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('import rejects malformed success data', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{
            'proxy_created': 1,
            'proxy_reused': 0,
            'proxy_failed': 0,
            'account_created': 1,
            'account_failed': 0,
            'errors': <Object?>[
              <String, Object?>{
                'kind': 'unknown',
                'message': 'unsupported item kind',
              },
            ],
          },
        },
      ),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.accounts.importData(
        Sub2ApiAdminAccountDataImportRequest(
          idempotencyKey: 'account-data-import-malformed',
          archive: _archive(),
        ),
      ),
      throwsA(_code('protocol.invalid_admin_account_response')),
    );
  });

  test('import validates idempotency and archive headers before I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    for (final invalid in <({String key, String archive, String code})>[
      (
        key: '',
        archive: _archive().reveal(),
        code: 'admin.accounts.idempotency_key_required',
      ),
      (
        key: 'invalid-json',
        archive: '{',
        code: 'admin.accounts.invalid_data_archive',
      ),
      (
        key: 'invalid-type',
        archive: jsonEncode(<String, Object?>{
          'type': 'other-product',
          'proxies': <Object?>[],
          'accounts': <Object?>[],
        }),
        code: 'admin.accounts.unsupported_data_archive_type',
      ),
      (
        key: 'invalid-version',
        archive: jsonEncode(<String, Object?>{
          'version': 2,
          'proxies': <Object?>[],
          'accounts': <Object?>[],
        }),
        code: 'admin.accounts.unsupported_data_archive_version',
      ),
      (
        key: 'missing-accounts',
        archive: jsonEncode(<String, Object?>{'proxies': <Object?>[]}),
        code: 'admin.accounts.invalid_data_archive',
      ),
    ]) {
      expect(
        () => client.accounts.importData(
          Sub2ApiAdminAccountDataImportRequest(
            idempotencyKey: invalid.key,
            archive: Sub2ApiAdminAccountDataArchive(invalid.archive),
          ),
        ),
        throwsA(_code(invalid.code)),
      );
    }
    expect(adapter.requests, isEmpty);
  });

  test('import disables automatic refresh and replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-data-import-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-data-import-jwt'),
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
      client.accounts.importData(
        Sub2ApiAdminAccountDataImportRequest(
          idempotencyKey: 'account-data-import-no-replay',
          archive: _archive(),
        ),
      ),
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
        (request) =>
            request.method == 'POST' &&
            request.path == '/api/v1/admin/accounts/data',
      ),
      hasLength(1),
    );
  });
}

Sub2ApiAdminAccountDataArchive _archive() {
  final fixture = readFixture('admin/account_data_export.json');
  return Sub2ApiAdminAccountDataArchive(jsonEncode(fixture['data']));
}

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-data-import-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
