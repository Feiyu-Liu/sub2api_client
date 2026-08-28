import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_gemini_oauth_models.dart';
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
    accessToken: Sub2ApiAccessToken('admin-gemini-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops completes all typed Gemini OAuth routes', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _successForRequest(request)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final capabilities = await client.geminiOAuth.getCapabilities();
    final authorization = await client.geminiOAuth.generateAuthorization(
      proxyId: 7,
      projectId: ' project-fixture ',
      oauthType: Sub2ApiAdminGeminiOAuthType.googleOne,
      tierId: 'google_ai_pro',
    );
    final token = await client.geminiOAuth.exchangeCode(
      Sub2ApiAdminGeminiExchangeCodeRequest(
        sessionId: authorization.sessionId,
        state: authorization.state,
        code: const Sub2ApiOAuthAuthorizationCode('gemini-code'),
        proxyId: 7,
        oauthType: Sub2ApiAdminGeminiOAuthType.googleOne,
        tierId: 'google_ai_pro',
      ),
    );

    expect(capabilities.aiStudioOAuthEnabled, isTrue);
    expect(capabilities.requiredRedirectUris.single.host, 'localhost');
    expect(authorization.authorizationUrl.host, 'accounts.google.com');
    expect(token.accessToken.reveal(), 'gemini-access-token-sentinel');
    expect(token.refreshToken?.reveal(), 'gemini-refresh-token-sentinel');
    expect(token.oauthType, Sub2ApiAdminGeminiOAuthType.googleOne);
    expect(token.tierId, 'google_ai_pro');
    expect(token.driveStorage?.limitBytes, 2199023255552);
    expect(token.driveStorage?.usageBytes, 1073741824);
    expect(token.toString(), isNot(contains('access-token-sentinel')));
    expect(
      adapter.requests.map((request) => '${request.method} ${request.path}'),
      <String>[
        'GET /api/v1/admin/gemini/oauth/capabilities',
        'POST /api/v1/admin/gemini/oauth/auth-url',
        'POST /api/v1/admin/gemini/oauth/exchange-code',
      ],
    );
    expect(adapter.requests[1].data, <String, Object?>{
      'proxy_id': 7,
      'project_id': 'project-fixture',
      'oauth_type': 'google_one',
      'tier_id': 'google_ai_pro',
    });
    expect(adapter.requests[2].data, <String, Object?>{
      'session_id': 'gemini-session-sentinel',
      'state': 'gemini-state-sentinel',
      'code': 'gemini-code',
      'proxy_id': 7,
      'oauth_type': 'google_one',
      'tier_id': 'google_ai_pro',
    });
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('x-api-key', 'admin-gemini-key-sentinel'),
      );
      expect(request.headers, isNot(contains('Authorization')));
    }
  });

  test('Gemini defaults send code_assist and omit empty optionals', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _successForRequest(request)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await client.geminiOAuth.generateAuthorization(projectId: ' ', tierId: ' ');

    expect(adapter.requests.single.data, <String, Object?>{
      'oauth_type': 'code_assist',
    });
  });

  test('Admin JWT Gemini OAuth runs after role checks', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _successForRequest(request));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.geminiOAuth.getCapabilities();

    expect(
      adapter.requests.where((request) => request.path == '/api/v1/auth/me'),
      hasLength(1),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer admin-gemini-jwt-sentinel'),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test('Gemini OAuth preserves business and key failures', () async {
    for (final failure in <({int status, Object body, String code})>[
      (
        status: 400,
        body: const <String, Object?>{
          'code': 'OAUTH_CLIENT_NOT_CONFIGURED',
          'message': 'client missing',
        },
        code: 'server.oauth_client_not_configured',
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
        client.geminiOAuth.generateAuthorization(),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('Gemini OAuth rejects malformed success contracts', () async {
    final malformed = <String, Object?>{
      ...Map<String, Object?>.from(_fixture()['token']! as Map),
      'extra': <String, Object?>{'drive_storage_limit': 1},
    };
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(malformed)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.geminiOAuth.exchangeCode(
        const Sub2ApiAdminGeminiExchangeCodeRequest(
          sessionId: Sub2ApiAdminOAuthSessionId('session'),
          state: Sub2ApiAdminOAuthState('state'),
          code: Sub2ApiOAuthAuthorizationCode('code'),
        ),
      ),
      throwsA(_code('protocol.invalid_admin_gemini_oauth_response')),
    );
  });

  test('Gemini OAuth validates secrets and options before I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.geminiOAuth.generateAuthorization(proxyId: 0),
      throwsA(_code('admin.gemini.invalid_proxy_id')),
    );
    expect(
      () => client.geminiOAuth.generateAuthorization(tierId: 'bad tier'),
      throwsA(_code('admin.gemini.invalid_tier_id')),
    );
    expect(
      () => client.geminiOAuth.exchangeCode(
        const Sub2ApiAdminGeminiExchangeCodeRequest(
          sessionId: Sub2ApiAdminOAuthSessionId(' '),
          state: Sub2ApiAdminOAuthState('state'),
          code: Sub2ApiOAuthAuthorizationCode('code'),
        ),
      ),
      throwsA(_code('admin.gemini.oauth_session_id_required')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('Gemini OAuth POST disables automatic refresh replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-gemini-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-gemini-jwt'),
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
      client.geminiOAuth.generateAuthorization(),
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

Map<String, Object?> _fixture() => readFixture('admin/gemini_oauth.json');

Object _successForRequest(RequestOptions request) => switch (request.path) {
  '/api/v1/admin/gemini/oauth/capabilities' => _success(
    _fixture()['capabilities'],
  ),
  '/api/v1/admin/gemini/oauth/auth-url' => _success(
    _fixture()['authorization'],
  ),
  '/api/v1/admin/gemini/oauth/exchange-code' => _success(_fixture()['token']),
  _ => throw StateError('unexpected route: ${request.path}'),
};

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
    Sub2ApiAdminApiKey('admin-gemini-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
