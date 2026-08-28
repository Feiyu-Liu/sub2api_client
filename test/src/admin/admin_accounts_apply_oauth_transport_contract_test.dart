import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_account_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_user_models.dart';
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
    accessToken: Sub2ApiAccessToken('admin-apply-oauth-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops applies typed OAuth credentials without leaking secrets', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(_accountData())),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final updated = await client.accounts.applyOAuthCredentials(42, _request);

    expect(updated.id, 42);
    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/admin/accounts/42/apply-oauth-credentials');
    expect(sent.data, <String, Object?>{
      'type': 'oauth',
      'credentials': <String, Object?>{
        'access_token': 'new-access-token',
        'refresh_token': 'new-refresh-token',
        'email': 'operator@example.com',
      },
      'extra': <String, Object?>{'project_id': 'project-1'},
    });
    expect(
      sent.headers,
      containsPair('x-api-key', 'admin-apply-oauth-key-sentinel'),
    );
    expect(sent.headers, isNot(contains('Authorization')));
  });

  test('setup-token reauthorization preserves the fixed wire type', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(_accountData())),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await client.accounts.applyOAuthCredentials(
      42,
      Sub2ApiAdminApplyOAuthCredentialsRequest(
        type: Sub2ApiAdminAccountType.setupToken,
        credentials: _credentials(),
      ),
    );

    expect(adapter.requests.single.data, containsPair('type', 'setup-token'));
  });

  test('Admin JWT apply OAuth runs after role checks', () async {
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _success(_accountData()));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.accounts.applyOAuthCredentials(42, _request);

    expect(
      adapter.requests.map((sent) => '${sent.method} ${sent.path}'),
      <String>[
        'GET /api/v1/auth/me',
        'POST /api/v1/admin/accounts/42/apply-oauth-credentials',
      ],
    );
    for (final sent in adapter.requests) {
      expect(
        sent.headers,
        containsPair('Authorization', 'Bearer admin-apply-oauth-jwt-sentinel'),
      );
      expect(sent.headers, isNot(contains('x-api-key')));
    }
  });

  test('apply OAuth preserves business and key failures', () async {
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
        client.accounts.applyOAuthCredentials(42, _request),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('apply OAuth rejects malformed success data', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(null)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.accounts.applyOAuthCredentials(42, _request),
      throwsA(_code('protocol.invalid_admin_account_response')),
    );
  });

  test('apply OAuth validates restricted input before I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.applyOAuthCredentials(0, _request),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.applyOAuthCredentials(
        42,
        Sub2ApiAdminApplyOAuthCredentialsRequest(
          type: Sub2ApiAdminAccountType.apiKey,
          credentials: _credentials(),
        ),
      ),
      throwsA(_code('admin.accounts.invalid_oauth_account_type')),
    );
    expect(
      () => client.accounts.applyOAuthCredentials(
        42,
        Sub2ApiAdminApplyOAuthCredentialsRequest(
          type: Sub2ApiAdminAccountType.oauth,
          credentials: Sub2ApiAdminCredentialSet(const []),
        ),
      ),
      throwsA(_code('admin.accounts.credentials_required')),
    );
    expect(
      () => client.accounts.applyOAuthCredentials(
        42,
        Sub2ApiAdminApplyOAuthCredentialsRequest(
          type: Sub2ApiAdminAccountType.oauth,
          credentials: _credentials(),
          extra: const Sub2ApiAdminJsonObject(<String, Sub2ApiAdminJsonValue>{
            'ollama_cloud_usage_session': Sub2ApiAdminJsonString('forbidden'),
          }),
        ),
      ),
      throwsA(_code('admin.accounts.managed_extra_not_writable')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('apply OAuth disables automatic replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-apply-oauth-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-apply-oauth-jwt'),
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
      client.accounts.applyOAuthCredentials(42, _request),
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
            sent.path == '/api/v1/admin/accounts/42/apply-oauth-credentials',
      ),
      hasLength(1),
    );
  });
}

final _request = Sub2ApiAdminApplyOAuthCredentialsRequest(
  type: Sub2ApiAdminAccountType.oauth,
  credentials: _credentials(),
  extra: const Sub2ApiAdminJsonObject(<String, Sub2ApiAdminJsonValue>{
    'project_id': Sub2ApiAdminJsonString('project-1'),
  }),
);

Sub2ApiAdminCredentialSet _credentials() => Sub2ApiAdminCredentialSet(const [
  Sub2ApiAdminCredentialEntry(
    name: 'access_token',
    value: Sub2ApiAdminCredentialSecretValue(
      Sub2ApiAdminCredentialSecret('new-access-token'),
    ),
  ),
  Sub2ApiAdminCredentialEntry(
    name: 'refresh_token',
    value: Sub2ApiAdminCredentialSecretValue(
      Sub2ApiAdminCredentialSecret('new-refresh-token'),
    ),
  ),
  Sub2ApiAdminCredentialEntry(
    name: 'email',
    value: Sub2ApiAdminCredentialStringValue('operator@example.com'),
  ),
]);

Map<String, Object?> _accountData() {
  final source = readFixture('admin/account_read_surface.json');
  final raw = source['account'];
  if (raw is! Map) throw const FormatException();
  return raw.map<String, Object?>((key, value) {
    if (key is! String) throw const FormatException();
    return MapEntry(key, value);
  });
}

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
    Sub2ApiAdminApiKey('admin-apply-oauth-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
