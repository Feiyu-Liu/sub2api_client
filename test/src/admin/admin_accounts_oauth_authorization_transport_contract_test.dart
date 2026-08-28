import 'package:dio/dio.dart';
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
    accessToken: Sub2ApiAccessToken('admin-oauth-url-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops generates full and setup-token OAuth authorizations', () async {
    final adapter = JsonResponseAdapter(
      (sent) => JsonResponse(body: _fixtureForRequest(sent)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final full = await client.accounts.generateOAuthAuthorization(proxyId: 7);
    final setup = await client.accounts.generateSetupTokenAuthorization(
      proxyId: 7,
    );

    expect(full.authorizationUrl.host, 'claude.ai');
    expect(full.authorizationUrl.queryParameters['scope'], 'full');
    expect(full.sessionId.reveal(), 'oauth-session-full');
    expect(full.sessionId.toString(), '<redacted>');
    expect(setup.authorizationUrl.queryParameters['scope'], 'inference');
    expect(setup.sessionId.reveal(), 'oauth-session-setup');
    expect(
      adapter.requests.map((sent) => '${sent.method} ${sent.path}'),
      <String>[
        'POST /api/v1/admin/accounts/generate-auth-url',
        'POST /api/v1/admin/accounts/generate-setup-token-url',
      ],
    );
    for (final sent in adapter.requests) {
      expect(sent.data, <String, Object?>{'proxy_id': 7});
      expect(
        sent.headers,
        containsPair('x-api-key', 'admin-oauth-url-key-sentinel'),
      );
      expect(sent.headers, isNot(contains('Authorization')));
    }
  });

  test('omitted OAuth proxy sends an explicit empty object', () async {
    final adapter = JsonResponseAdapter(
      (sent) => JsonResponse(body: _fixtureForRequest(sent)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await client.accounts.generateOAuthAuthorization();

    expect(adapter.requests.single.data, <String, Object?>{});
  });

  test('Admin JWT OAuth authorization runs after role checks', () async {
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _fixtureForRequest(sent));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.accounts.generateOAuthAuthorization();
    await client.accounts.generateSetupTokenAuthorization();

    expect(
      adapter.requests.where((sent) => sent.path == '/api/v1/auth/me'),
      hasLength(2),
    );
    for (final sent in adapter.requests) {
      expect(
        sent.headers,
        containsPair('Authorization', 'Bearer admin-oauth-url-jwt-sentinel'),
      );
      expect(sent.headers, isNot(contains('x-api-key')));
    }
  });

  test('OAuth authorization preserves business and key failures', () async {
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
        client.accounts.generateOAuthAuthorization(),
        throwsA(_code(failure.code)),
      );
      await expectLater(
        client.accounts.generateSetupTokenAuthorization(),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('OAuth authorization rejects malformed success data', () async {
    for (final data in <Object?>[
      null,
      <String, Object?>{
        'auth_url': 'http://claude.ai/oauth/authorize',
        'session_id': 'session',
      },
      <String, Object?>{
        'auth_url': 'https://claude.ai/oauth/authorize',
        'session_id': '',
      },
    ]) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: _success(data)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      await expectLater(
        client.accounts.generateOAuthAuthorization(),
        throwsA(_code('protocol.invalid_admin_account_response')),
      );
    }
  });

  test('OAuth authorization validates proxy IDs before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.generateOAuthAuthorization(proxyId: 0),
      throwsA(_code('admin.accounts.invalid_proxy_id')),
    );
    expect(
      () => client.accounts.generateSetupTokenAuthorization(proxyId: -1),
      throwsA(_code('admin.accounts.invalid_proxy_id')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('every OAuth authorization POST disables automatic replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-oauth-url-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-oauth-url-jwt'),
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
      client.accounts.generateOAuthAuthorization(),
      throwsA(isA<Sub2ApiException>()),
    );
    await expectLater(
      client.accounts.generateSetupTokenAuthorization(),
      throwsA(isA<Sub2ApiException>()),
    );

    expect(
      adapter.requests.where((sent) => sent.path == '/api/v1/auth/refresh'),
      isEmpty,
    );
    for (final path in <String>[
      '/api/v1/admin/accounts/generate-auth-url',
      '/api/v1/admin/accounts/generate-setup-token-url',
    ]) {
      expect(adapter.requests.where((sent) => sent.path == path), hasLength(1));
    }
  });
}

Object? _fixtureForRequest(RequestOptions sent) => switch (sent.path) {
  '/api/v1/admin/accounts/generate-auth-url' => _success(<String, Object?>{
    'auth_url': 'https://claude.ai/oauth/authorize?scope=full',
    'session_id': 'oauth-session-full',
  }),
  '/api/v1/admin/accounts/generate-setup-token-url' =>
    _success(<String, Object?>{
      'auth_url': 'https://claude.ai/oauth/authorize?scope=inference',
      'session_id': 'oauth-session-setup',
    }),
  _ => throw StateError('unexpected request ${sent.method} ${sent.path}'),
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
    Sub2ApiAdminApiKey('admin-oauth-url-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
