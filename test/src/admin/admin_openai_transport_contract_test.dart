import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_openai_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_user_models.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/models/sub2api_decimal.dart';
import 'package:sub2api_client/src/shared/session/sub2api_session.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );

  test('Ops executes every OpenAI admin route with redacted tokens', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    const sessionId = Sub2ApiAdminOAuthSessionId('openai-session-fixture');
    const code = Sub2ApiOAuthAuthorizationCode('openai-code-fixture');
    const state = Sub2ApiAdminOAuthState('openai-state-fixture');
    const refreshToken = Sub2ApiRefreshToken('openai-refresh-fixture');
    const pat = Sub2ApiOpenAICodexPersonalAccessToken('at-fixture-pat');
    final exchange = Sub2ApiAdminOpenAIExchangeCodeRequest(
      sessionId: sessionId,
      code: code,
      state: state,
      redirectUri: Uri.parse('http://localhost:1455/auth/callback'),
      proxyId: 9,
    );

    final auth = await client.openAI.generateAuthUrl(
      request: Sub2ApiAdminOpenAIAuthUrlRequest(
        proxyId: 9,
        redirectUri: Uri.parse('http://localhost:1455/auth/callback'),
      ),
    );
    final token = await client.openAI.exchangeCode(exchange);
    final refreshed = await client.openAI.refreshToken(
      const Sub2ApiAdminOpenAIRefreshTokenRequest(
        refreshToken: refreshToken,
        clientId: 'app-openai',
        proxyId: 9,
      ),
    );
    final refreshedAccount = await client.openAI.refreshAccountToken(42);
    final oauthAccount = await client.openAI.createFromOAuth(
      Sub2ApiAdminCreateOpenAIFromOAuthRequest(
        exchange: exchange,
        name: ' OpenAI OAuth ',
        concurrency: 3,
        priority: 50,
        groupIds: const <int>[7],
      ),
    );
    final patAccount = await client.openAI.createFromCodexPat(
      Sub2ApiAdminCreateOpenAIFromCodexPatRequest(
        accessToken: pat,
        name: ' Codex PAT ',
        groupIds: const <int>[7],
        proxyId: 9,
        concurrency: 3,
        priority: 50,
        rateMultiplier: Sub2ApiDecimal.parse('0.85'),
        loadFactor: 10,
        expiresAt: DateTime.utc(2026, 9, 30),
        credentialExtras: Sub2ApiAdminJsonObject(
          const <String, Sub2ApiAdminJsonValue>{
            'auth_mode': Sub2ApiAdminJsonString('pat'),
          },
        ),
        extra: Sub2ApiAdminJsonObject(const <String, Sub2ApiAdminJsonValue>{
          'privacy_mode': Sub2ApiAdminJsonString('enabled'),
        }),
        confirmMixedChannelRisk: true,
      ),
    );
    final quota = await client.openAI.getQuota(42);
    final quotaRefresh = await client.openAI.refreshQuota(42);
    final quotaReset = await client.openAI.resetQuota(42);

    expect(auth.sessionId.toString(), '<redacted>');
    expect(token.accessToken.toString(), '<redacted>');
    expect(token.idToken.toString(), '<redacted>');
    expect(refreshed.refreshToken.toString(), '<redacted>');
    expect(refreshedAccount.id, 42);
    expect(oauthAccount.id, 42);
    expect(patAccount.id, 42);
    expect(
      quota.rateLimit?.primaryWindow?.usedPercent,
      Sub2ApiDecimal.parse('25.5'),
    );
    expect(quota.resetCredits?.availableCount, 2);
    expect(quotaRefresh.cachePersisted, isTrue);
    expect(quotaReset.windowsReset, 2);
    expect(pat.toString(), '<redacted>');

    expect(adapter.requests, hasLength(9));
    expect(adapter.requests[0].path, '/api/v1/admin/openai/generate-auth-url');
    expect(adapter.requests[1].path, '/api/v1/admin/openai/exchange-code');
    expect(adapter.requests[2].path, '/api/v1/admin/openai/refresh-token');
    expect(
      adapter.requests[3].path,
      '/api/v1/admin/openai/accounts/42/refresh',
    );
    expect(adapter.requests[4].path, '/api/v1/admin/openai/create-from-oauth');
    expect(
      adapter.requests[5].path,
      '/api/v1/admin/openai/create-from-codex-pat',
    );
    expect(
      (adapter.requests[5].data as Map<String, Object?>)['access_token'],
      pat.reveal(),
    );
    expect(adapter.requests[6].path, '/api/v1/admin/openai/accounts/42/quota');
    expect(
      adapter.requests[7].path,
      '/api/v1/admin/openai/accounts/42/quota/refresh',
    );
    expect(
      adapter.requests[8].path,
      '/api/v1/admin/openai/accounts/42/reset-quota',
    );
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'openai-key-sentinel',
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

  test('OpenAI validation and malformed data fail closed', () async {
    final validationAdapter = JsonResponseAdapter(
      (_) => throw StateError('no io'),
    );
    final validationClient = _client(configuration, validationAdapter);
    addTearDown(validationClient.close);
    expect(
      () => validationClient.openAI.getQuota(0),
      throwsA(_code('admin.openai.invalid_account_id')),
    );
    expect(validationAdapter.requests, isEmpty);

    final malformedAdapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'access_token': ''},
        },
      ),
    );
    final malformedClient = _client(configuration, malformedAdapter);
    addTearDown(malformedClient.close);
    await expectLater(
      malformedClient.openAI.refreshToken(
        const Sub2ApiAdminOpenAIRefreshTokenRequest(
          refreshToken: Sub2ApiRefreshToken('refresh-fixture'),
        ),
      ),
      throwsA(_code('protocol.invalid_admin_openai_response')),
    );
  });

  test('OpenAI mutation is not replayed', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.openAI.resetQuota(42),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT OpenAI read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('openai-admin-jwt'),
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
    await client.openAI.getQuota(42);
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer openai-admin-jwt'),
    );
    expect(adapter.requests.last.headers['x-api-key'], isNull);
  });
}

Map<String, Object?> _fixture() => readFixture('admin/openai.json');
Map<String, Object?> _accountFixture() => Map<String, Object?>.from(
  readFixture('admin/account_read_surface.json')['account']! as Map,
);

Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/generate-auth-url')) {
    data = _fixture()['auth_url'];
  } else if (request.path.endsWith('/exchange-code') ||
      request.path.endsWith('/refresh-token')) {
    data = _fixture()['token'];
  } else if (request.path.endsWith('/quota/refresh')) {
    data = _fixture()['quota_refresh'];
  } else if (request.path.endsWith('/reset-quota')) {
    data = _fixture()['quota_reset'];
  } else if (request.path.endsWith('/quota')) {
    data = _fixture()['quota'];
  } else {
    data = _accountFixture();
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('openai-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
