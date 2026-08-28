import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_grok_oauth_models.dart';
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

  test('Ops executes every Grok OAuth ceremony and token route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    final capabilities = await client.grokOAuth.getCapabilities();
    final auth = await client.grokOAuth.generateAuthUrl(
      Sub2ApiAdminGrokGenerateAuthUrlRequest(
        proxyId: 3,
        redirectUri: Uri.parse('https://app.example.test/oauth/callback'),
      ),
    );
    final exchanged = await client.grokOAuth.exchangeCode(
      const Sub2ApiAdminGrokExchangeCodeRequest(
        sessionId: Sub2ApiGrokOAuthSessionId('session-input'),
        code: Sub2ApiOAuthAuthorizationCode('code-input'),
        state: Sub2ApiGrokOAuthState('state-input'),
        proxyId: 3,
      ),
    );
    final refreshed = await client.grokOAuth.refreshToken(
      const Sub2ApiAdminGrokRefreshTokenRequest(
        refreshToken: Sub2ApiRefreshToken('refresh-input'),
        clientId: ' grok-client ',
        proxyId: 3,
      ),
    );
    final sso = await client.grokOAuth.validateSsoToken(
      const Sub2ApiAdminGrokSsoTokenRequest(
        ssoToken: Sub2ApiGrokSsoToken('sso-input'),
        proxyId: 3,
      ),
    );
    final password = await client.grokOAuth.authorizePassword(
      const Sub2ApiAdminGrokPasswordRequest(
        email: ' grok@example.test ',
        password: Sub2ApiPassword('password-input'),
        proxyId: 3,
      ),
    );

    expect(capabilities.passwordAuthEnabled, isTrue);
    expect(auth.authorizationUrl.toString(), '<redacted>');
    expect(auth.sessionId.toString(), '<redacted>');
    expect(exchanged.accessToken.toString(), '<redacted>');
    expect(exchanged.refreshToken.toString(), '<redacted>');
    expect(exchanged.idToken.toString(), '<redacted>');
    expect(refreshed.email, 'grok@example.test');
    expect(sso.subscriptionTier, 'premium');
    expect(password.entitlementStatus, 'active');
    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/admin/grok/oauth/capabilities',
      '/api/v1/admin/grok/oauth/auth-url',
      '/api/v1/admin/grok/oauth/exchange-code',
      '/api/v1/admin/grok/oauth/refresh-token',
      '/api/v1/admin/grok/oauth/sso-token',
      '/api/v1/admin/grok/oauth/password',
    ]);
    expect(adapter.requests[1].data, containsPair('proxy_id', 3));
    expect(adapter.requests[2].data, containsPair('code', 'code-input'));
    expect(
      adapter.requests[3].data,
      containsPair('refresh_token', 'refresh-input'),
    );
    expect(adapter.requests[4].data, containsPair('sso_token', 'sso-input'));
    expect(
      adapter.requests[5].data,
      containsPair('password', 'password-input'),
    );
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'grok-key-sentinel',
      ),
      isTrue,
    );
    expect(
      adapter.requests.every(
        (request) => request.headers['Authorization'] == null,
      ),
      isTrue,
    );
  });

  test('Grok OAuth validation fails before I/O', () async {
    final adapter = JsonResponseAdapter((_) => throw StateError('no io'));
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    expect(
      () => client.grokOAuth.exchangeCode(
        const Sub2ApiAdminGrokExchangeCodeRequest(
          sessionId: Sub2ApiGrokOAuthSessionId(''),
          code: Sub2ApiOAuthAuthorizationCode('code'),
          state: Sub2ApiGrokOAuthState('state'),
        ),
      ),
      throwsA(_code('admin.grok.session_required')),
    );
    expect(
      () => client.grokOAuth.authorizePassword(
        const Sub2ApiAdminGrokPasswordRequest(
          email: 'invalid',
          password: Sub2ApiPassword('password'),
        ),
      ),
      throwsA(_code('admin.grok.invalid_email')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('malformed Grok token response fails closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'access_token': ''},
        },
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.grokOAuth.refreshToken(
        const Sub2ApiAdminGrokRefreshTokenRequest(
          refreshToken: Sub2ApiRefreshToken('refresh'),
        ),
      ),
      throwsA(_code('protocol.invalid_admin_grok_oauth_response')),
    );
  });

  test('Grok OAuth mutation is not replayed after 401', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.grokOAuth.generateAuthUrl(
        const Sub2ApiAdminGrokGenerateAuthUrlRequest(),
      ),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT Grok read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('grok-admin-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _response(request));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = adapter,
    );
    addTearDown(client.close);
    await client.grokOAuth.getCapabilities();
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer grok-admin-jwt'),
    );
  });
}

Map<String, Object?> _fixture() => readFixture('admin/grok_oauth.json');
Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/capabilities')) {
    data = _fixture()['capabilities'];
  } else if (request.path.endsWith('/auth-url')) {
    data = _fixture()['auth_url'];
  } else {
    data = _fixture()['token'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('grok-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
