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
    accessToken: Sub2ApiAccessToken('admin-batch-credentials-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops batch credential updates preserve the fixed field union', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(_resultData())),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final accountUuid = await client.accounts.batchUpdateCredentials(
      _request(const Sub2ApiAdminBatchCredentialUpdate.accountUuid(' acc-1 ')),
    );
    await client.accounts.batchUpdateCredentials(
      _request(const Sub2ApiAdminBatchCredentialUpdate.organizationUuid(null)),
    );
    await client.accounts.batchUpdateCredentials(
      _request(
        const Sub2ApiAdminBatchCredentialUpdate.interceptWarmupRequests(true),
      ),
    );

    expect(accountUuid.successIds, <int>[42]);
    expect(accountUuid.failedIds, <int>[43]);
    expect(accountUuid.results.last.error, 'update failed');
    expect(adapter.requests, hasLength(3));
    expect(adapter.requests[0].data, <String, Object?>{
      'account_ids': <int>[42, 43],
      'field': 'account_uuid',
      'value': 'acc-1',
    });
    expect(adapter.requests[1].data, <String, Object?>{
      'account_ids': <int>[42, 43],
      'field': 'org_uuid',
      'value': null,
    });
    expect(adapter.requests[2].data, <String, Object?>{
      'account_ids': <int>[42, 43],
      'field': 'intercept_warmup_requests',
      'value': true,
    });
    for (final sent in adapter.requests) {
      expect(sent.method, 'POST');
      expect(sent.path, '/api/v1/admin/accounts/batch-update-credentials');
      expect(
        sent.headers,
        containsPair('x-api-key', 'admin-batch-credentials-key-sentinel'),
      );
      expect(sent.headers, isNot(contains('Authorization')));
    }
  });

  test('Admin JWT batch credential update runs after role checks', () async {
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _success(_resultData()));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.accounts.batchUpdateCredentials(
      _request(const Sub2ApiAdminBatchCredentialUpdate.accountUuid('acc-1')),
    );

    expect(
      adapter.requests.map((sent) => '${sent.method} ${sent.path}'),
      <String>[
        'GET /api/v1/auth/me',
        'POST /api/v1/admin/accounts/batch-update-credentials',
      ],
    );
    for (final sent in adapter.requests) {
      expect(
        sent.headers,
        containsPair(
          'Authorization',
          'Bearer admin-batch-credentials-jwt-sentinel',
        ),
      );
      expect(sent.headers, isNot(contains('x-api-key')));
    }
  });

  test('batch credential update preserves business and key failures', () async {
    for (final failure in <({int status, String fixture, String code})>[
      (
        status: 404,
        fixture: 'admin/account_business_failure.json',
        code: 'server.account_not_found',
      ),
      (
        status: 401,
        fixture: 'admin/account_auth_failure.json',
        code: 'server.invalid_api_key',
      ),
    ]) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          statusCode: failure.status,
          body: readFixture(failure.fixture),
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      await expectLater(
        client.accounts.batchUpdateCredentials(
          _request(
            const Sub2ApiAdminBatchCredentialUpdate.accountUuid('acc-1'),
          ),
        ),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('batch credential update rejects inconsistent success data', () async {
    final malformed = _resultData();
    malformed['success_ids'] = <int>[42, 44];
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(malformed)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.accounts.batchUpdateCredentials(
        _request(const Sub2ApiAdminBatchCredentialUpdate.accountUuid('acc-1')),
      ),
      throwsA(_code('protocol.invalid_admin_account_response')),
    );
  });

  test('batch credential update validates before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.batchUpdateCredentials(
        Sub2ApiAdminBatchUpdateCredentialsRequest(
          accountIds: const [],
          update: const Sub2ApiAdminBatchCredentialUpdate.accountUuid('acc'),
        ),
      ),
      throwsA(_code('admin.accounts.account_ids_required')),
    );
    expect(
      () => client.accounts.batchUpdateCredentials(
        Sub2ApiAdminBatchUpdateCredentialsRequest(
          accountIds: const [42, 0],
          update: const Sub2ApiAdminBatchCredentialUpdate.accountUuid('acc'),
        ),
      ),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.batchUpdateCredentials(
        _request(const Sub2ApiAdminBatchCredentialUpdate.accountUuid(' ')),
      ),
      throwsA(_code('admin.accounts.invalid_credential_value')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('batch credential update disables automatic replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-batch-credentials-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-batch-credentials-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      if (sent.path == '/api/v1/auth/refresh') {
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
      client.accounts.batchUpdateCredentials(
        _request(const Sub2ApiAdminBatchCredentialUpdate.accountUuid('acc-1')),
      ),
      throwsA(isA<Sub2ApiException>()),
    );

    expect(
      adapter.requests.where((sent) => sent.path == '/api/v1/auth/refresh'),
      isEmpty,
    );
    expect(
      adapter.requests.where(
        (sent) =>
            sent.method == 'POST' &&
            sent.path == '/api/v1/admin/accounts/batch-update-credentials',
      ),
      hasLength(1),
    );
  });
}

Sub2ApiAdminBatchUpdateCredentialsRequest _request(
  Sub2ApiAdminBatchCredentialUpdate update,
) => Sub2ApiAdminBatchUpdateCredentialsRequest(
  accountIds: const [42, 43, 42],
  update: update,
);

Map<String, Object?> _resultData() => <String, Object?>{
  'success': 1,
  'failed': 1,
  'success_ids': <int>[42],
  'failed_ids': <int>[43],
  'results': <Object?>[
    <String, Object?>{'account_id': 42, 'success': true},
    <String, Object?>{
      'account_id': 43,
      'success': false,
      'error': 'update failed',
    },
  ],
};

Map<String, Object?> _success(Object? data) => <String, Object?>{
  'code': 0,
  'message': 'success',
  'data': data,
};

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-batch-credentials-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
