import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_antigravity_oauth_models.dart';
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
    accessToken: Sub2ApiAccessToken('admin-antigravity-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops completes all typed Antigravity OAuth operations', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _successForRequest(request)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final authorization = await client.antigravityOAuth.generateAuthorization(
      proxyId: 7,
    );
    final exchanged = await client.antigravityOAuth.exchangeCode(
      Sub2ApiAdminAntigravityExchangeCodeRequest(
        sessionId: authorization.sessionId,
        state: authorization.state,
        code: const Sub2ApiOAuthAuthorizationCode(
          'antigravity-authorization-code',
        ),
        proxyId: 7,
      ),
    );
    final refreshed = await client.antigravityOAuth.validateRefreshToken(
      const Sub2ApiRefreshToken('antigravity-refresh-input'),
      proxyId: 7,
    );

    expect(authorization.authorizationUrl.host, 'accounts.google.com');
    expect(authorization.sessionId.toString(), '<redacted>');
    expect(authorization.state.toString(), '<redacted>');
    for (final token in <Sub2ApiAdminAntigravityTokenInfo>[
      exchanged,
      refreshed,
    ]) {
      expect(token.accessToken.reveal(), 'antigravity-access-token-sentinel');
      expect(
        token.refreshToken?.reveal(),
        'antigravity-refresh-token-sentinel',
      );
      expect(token.expiresIn, const Duration(hours: 1));
      expect(
        token.expiresAt,
        DateTime.fromMillisecondsSinceEpoch(1910000000000, isUtc: true),
      );
      expect(token.email, 'antigravity@example.test');
      expect(token.projectId, 'antigravity-project-fixture');
      expect(token.toString(), isNot(contains('access-token-sentinel')));
      expect(token.toString(), isNot(contains('refresh-token-sentinel')));
    }
    expect(
      adapter.requests.map((request) => '${request.method} ${request.path}'),
      <String>[
        'POST /api/v1/admin/antigravity/oauth/auth-url',
        'POST /api/v1/admin/antigravity/oauth/exchange-code',
        'POST /api/v1/admin/antigravity/oauth/refresh-token',
      ],
    );
    expect(adapter.requests[0].data, <String, Object?>{'proxy_id': 7});
    expect(adapter.requests[1].data, <String, Object?>{
      'session_id': 'antigravity-session-sentinel',
      'state': 'antigravity-state-sentinel',
      'code': 'antigravity-authorization-code',
      'proxy_id': 7,
    });
    expect(adapter.requests[2].data, <String, Object?>{
      'refresh_token': 'antigravity-refresh-input',
      'proxy_id': 7,
    });
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('x-api-key', 'admin-antigravity-key-sentinel'),
      );
      expect(request.headers, isNot(contains('Authorization')));
    }
  });

  test('omitted proxy IDs send explicit objects without proxy_id', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _successForRequest(request)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await client.antigravityOAuth.generateAuthorization();
    await client.antigravityOAuth.validateRefreshToken(
      const Sub2ApiRefreshToken('refresh-token'),
    );

    expect(adapter.requests[0].data, <String, Object?>{});
    expect(adapter.requests[1].data, <String, Object?>{
      'refresh_token': 'refresh-token',
    });
  });

  test('Admin JWT Antigravity OAuth runs after role checks', () async {
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

    await client.antigravityOAuth.generateAuthorization();

    expect(
      adapter.requests.where((request) => request.path == '/api/v1/auth/me'),
      hasLength(1),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer admin-antigravity-jwt-sentinel'),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test('Antigravity OAuth preserves business and key failures', () async {
    for (final failure in <({int status, Object body, String code})>[
      (
        status: 400,
        body: const <String, Object?>{
          'code': 'INVALID_GRANT',
          'message': 'invalid grant',
        },
        code: 'server.invalid_grant',
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
        client.antigravityOAuth.validateRefreshToken(
          const Sub2ApiRefreshToken('refresh-token'),
        ),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('Antigravity OAuth rejects malformed success contracts', () async {
    final malformed = <String, Object?>{
      ...Map<String, Object?>.from(_fixture()['token']! as Map),
      'access_token': '',
    };
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(malformed)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.antigravityOAuth.validateRefreshToken(
        const Sub2ApiRefreshToken('refresh-token'),
      ),
      throwsA(_code('protocol.invalid_admin_antigravity_oauth_response')),
    );
  });

  test('Antigravity OAuth validates secrets and proxy IDs before I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.antigravityOAuth.generateAuthorization(proxyId: 0),
      throwsA(_code('admin.antigravity.invalid_proxy_id')),
    );
    expect(
      () => client.antigravityOAuth.exchangeCode(
        const Sub2ApiAdminAntigravityExchangeCodeRequest(
          sessionId: Sub2ApiAdminOAuthSessionId(' '),
          state: Sub2ApiAdminOAuthState('state'),
          code: Sub2ApiOAuthAuthorizationCode('code'),
        ),
      ),
      throwsA(_code('admin.antigravity.oauth_session_id_required')),
    );
    expect(
      () => client.antigravityOAuth.validateRefreshToken(
        const Sub2ApiRefreshToken(' '),
      ),
      throwsA(_code('admin.antigravity.refresh_token_required')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('every Antigravity OAuth POST disables refresh replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-antigravity-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-antigravity-jwt'),
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
      client.antigravityOAuth.generateAuthorization(),
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

Map<String, Object?> _fixture() => readFixture('admin/antigravity_oauth.json');

Object _successForRequest(RequestOptions request) => switch (request.path) {
  '/api/v1/admin/antigravity/oauth/auth-url' => _success(
    _fixture()['authorization'],
  ),
  '/api/v1/admin/antigravity/oauth/exchange-code' ||
  '/api/v1/admin/antigravity/oauth/refresh-token' => _success(
    _fixture()['token'],
  ),
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
    Sub2ApiAdminApiKey('admin-antigravity-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
