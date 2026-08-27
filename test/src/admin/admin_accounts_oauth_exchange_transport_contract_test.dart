import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_account_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_accounts_client.dart';
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
    accessToken: Sub2ApiAccessToken('admin-oauth-exchange-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops exchanges all four OAuth credential flows', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(_tokenData())),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final results = <Sub2ApiAdminOAuthTokenInfo>[];
    for (final route in _routes) {
      results.add(await route.invoke(client.accounts));
    }

    for (final token in results) {
      expect(token.accessToken.reveal(), 'access-token-sentinel');
      expect(token.accessToken.toString(), '<redacted>');
      expect(token.refreshToken?.reveal(), 'refresh-token-sentinel');
      expect(token.refreshToken.toString(), '<redacted>');
      expect(token.tokenType, 'Bearer');
      expect(token.expiresIn, const Duration(hours: 1));
      expect(
        token.expiresAt,
        DateTime.fromMillisecondsSinceEpoch(1700000000000, isUtc: true),
      );
      expect(token.organizationUuid, 'org-uuid');
    }
    expect(
      adapter.requests.map((sent) => '${sent.method} ${sent.path}'),
      _routes.map((route) => '${route.method} ${route.path}'),
    );
    expect(adapter.requests[0].data, <String, Object?>{
      'session_id': 'oauth-session-id',
      'code': 'oauth-authorization-code',
      'proxy_id': 7,
    });
    expect(adapter.requests[1].data, adapter.requests[0].data);
    expect(adapter.requests[2].data, <String, Object?>{
      'code': 'oauth-cookie-session',
      'proxy_id': 7,
    });
    expect(adapter.requests[3].data, adapter.requests[2].data);
    for (final sent in adapter.requests) {
      expect(
        sent.headers,
        containsPair('x-api-key', 'admin-oauth-exchange-key-sentinel'),
      );
      expect(sent.headers, isNot(contains('Authorization')));
    }
  });

  test('Admin JWT OAuth exchanges run after role checks', () async {
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _success(_tokenData()));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    for (final route in _routes) {
      await route.invoke(client.accounts);
    }

    expect(
      adapter.requests.where((sent) => sent.path == '/api/v1/auth/me'),
      hasLength(_routes.length),
    );
    for (final sent in adapter.requests) {
      expect(
        sent.headers,
        containsPair(
          'Authorization',
          'Bearer admin-oauth-exchange-jwt-sentinel',
        ),
      );
      expect(sent.headers, isNot(contains('x-api-key')));
    }
  });

  test('OAuth exchanges preserve business and key failures', () async {
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

      for (final route in _routes) {
        await expectLater(
          route.invoke(client.accounts),
          throwsA(_code(failure.code)),
          reason: route.name,
        );
      }
    }
  });

  test('OAuth exchanges reject malformed token responses', () async {
    for (final data in <Object?>[
      null,
      <String, Object?>{..._tokenData(), 'access_token': ''},
      <String, Object?>{..._tokenData(), 'expires_in': 0},
      <String, Object?>{..._tokenData(), 'expires_at': -1},
    ]) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: _success(data)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      await expectLater(
        _routes.first.invoke(client.accounts),
        throwsA(_code('protocol.invalid_admin_account_response')),
      );
    }
  });

  test('OAuth exchanges validate secrets and proxy IDs before I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.exchangeOAuthCode(
        const Sub2ApiAdminOAuthCodeExchangeRequest(
          sessionId: Sub2ApiAdminOAuthSessionId(' '),
          code: Sub2ApiOAuthAuthorizationCode('code'),
        ),
      ),
      throwsA(_code('admin.accounts.oauth_session_id_required')),
    );
    expect(
      () => client.accounts.exchangeSetupTokenCode(
        const Sub2ApiAdminOAuthCodeExchangeRequest(
          sessionId: Sub2ApiAdminOAuthSessionId('session'),
          code: Sub2ApiOAuthAuthorizationCode(' '),
        ),
      ),
      throwsA(_code('admin.accounts.oauth_code_required')),
    );
    expect(
      () => client.accounts.authenticateOAuthCookie(
        const Sub2ApiAdminOAuthCookieExchangeRequest(
          sessionKey: Sub2ApiOAuthCookieSessionKey(' '),
        ),
      ),
      throwsA(_code('admin.accounts.oauth_cookie_session_required')),
    );
    expect(
      () => client.accounts.authenticateSetupTokenCookie(
        const Sub2ApiAdminOAuthCookieExchangeRequest(
          sessionKey: Sub2ApiOAuthCookieSessionKey('session'),
          proxyId: 0,
        ),
      ),
      throwsA(_code('admin.accounts.invalid_proxy_id')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('every OAuth exchange POST disables automatic replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-oauth-exchange-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-oauth-exchange-jwt'),
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

    for (final route in _routes) {
      await expectLater(
        route.invoke(client.accounts),
        throwsA(isA<Sub2ApiException>()),
        reason: route.name,
      );
    }

    expect(
      adapter.requests.where((sent) => sent.path == '/api/v1/auth/refresh'),
      isEmpty,
    );
    for (final route in _routes) {
      expect(
        adapter.requests.where((sent) => sent.path == route.path),
        hasLength(1),
      );
    }
  });
}

final _routes = <_OAuthExchangeRoute>[
  _OAuthExchangeRoute(
    'exchange OAuth code',
    'POST',
    '/api/v1/admin/accounts/exchange-code',
    (accounts) => accounts.exchangeOAuthCode(_codeRequest),
  ),
  _OAuthExchangeRoute(
    'exchange setup-token code',
    'POST',
    '/api/v1/admin/accounts/exchange-setup-token-code',
    (accounts) => accounts.exchangeSetupTokenCode(_codeRequest),
  ),
  _OAuthExchangeRoute(
    'authenticate OAuth cookie',
    'POST',
    '/api/v1/admin/accounts/cookie-auth',
    (accounts) => accounts.authenticateOAuthCookie(_cookieRequest),
  ),
  _OAuthExchangeRoute(
    'authenticate setup-token cookie',
    'POST',
    '/api/v1/admin/accounts/setup-token-cookie-auth',
    (accounts) => accounts.authenticateSetupTokenCookie(_cookieRequest),
  ),
];

const _codeRequest = Sub2ApiAdminOAuthCodeExchangeRequest(
  sessionId: Sub2ApiAdminOAuthSessionId('oauth-session-id'),
  code: Sub2ApiOAuthAuthorizationCode('oauth-authorization-code'),
  proxyId: 7,
);

const _cookieRequest = Sub2ApiAdminOAuthCookieExchangeRequest(
  sessionKey: Sub2ApiOAuthCookieSessionKey('oauth-cookie-session'),
  proxyId: 7,
);

Map<String, Object?> _tokenData() => <String, Object?>{
  'access_token': 'access-token-sentinel',
  'token_type': 'Bearer',
  'expires_in': 3600,
  'expires_at': 1700000000,
  'refresh_token': 'refresh-token-sentinel',
  'scope': 'user:inference',
  'org_uuid': 'org-uuid',
  'account_uuid': 'account-uuid',
  'email_address': 'operator@example.com',
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
    Sub2ApiAdminApiKey('admin-oauth-exchange-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

final class _OAuthExchangeRoute {
  const _OAuthExchangeRoute(this.name, this.method, this.path, this.invoke);

  final String name;
  final String method;
  final String path;
  final Future<Sub2ApiAdminOAuthTokenInfo> Function(
    Sub2ApiAdminAccountsClient accounts,
  )
  invoke;
}
