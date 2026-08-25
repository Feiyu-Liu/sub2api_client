import 'package:dio/dio.dart';
import 'package:sub2api_client/src/client/sub2api_client.dart'
    show createSub2ApiClientForTesting;
import 'package:sub2api_client/sub2api_client.dart';
import 'package:test/test.dart';

import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  test('authenticated login atomically persists a redacted session', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: {
          'code': 0,
          'message': 'success',
          'data': {
            'access_token': 'access-sentinel',
            'refresh_token': 'refresh-sentinel',
            'expires_in': 3600,
            'token_type': 'Bearer',
            'user': {
              'id': 7,
              'email': 'user@example.test',
              'role': 'user',
              'username': 'user',
            },
          },
        },
      ),
    );
    final dio = Dio(BaseOptions(baseUrl: 'https://example.test'))
      ..httpClientAdapter = adapter;
    final store = RecordingSessionStore();
    final client = createSub2ApiClientForTesting(
      configuration: Sub2ApiConfiguration(
        origin: Uri.parse('https://example.test'),
      ),
      sessionStore: store,
      dio: dio,
    );

    final result = await client.auth.login(
      const Sub2ApiLoginRequest(
        email: 'user@example.test',
        password: Sub2ApiPassword('password-sentinel'),
      ),
    );

    expect(result, isA<Sub2ApiAuthenticated>());
    expect(store.writeCount, 1);
    expect(store.session?.accessToken.reveal(), 'access-sentinel');
    expect(store.session?.refreshToken?.reveal(), 'refresh-sentinel');
    expect(store.session.toString(), isNot(contains('access-sentinel')));
    expect(store.session.toString(), isNot(contains('refresh-sentinel')));
  });

  test(
    'close is idempotent and does not close external test transport',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => const JsonResponse(
          body: {'code': 0, 'message': 'success', 'data': <String, Object?>{}},
        ),
      );
      final dio = Dio(BaseOptions(baseUrl: 'https://example.test'))
        ..httpClientAdapter = adapter;
      final client = createSub2ApiClientForTesting(
        configuration: Sub2ApiConfiguration(
          origin: Uri.parse('https://example.test'),
        ),
        sessionStore: RecordingSessionStore(),
        dio: dio,
      );

      client.close();
      client.close();

      expect(adapter.closeCount, 0);
      await expectLater(
        client.capabilities.getCapabilities(),
        throwsA(
          isA<Sub2ApiException>().having(
            (error) => error.code,
            'code',
            'client.closed',
          ),
        ),
      );
      expect(adapter.requests, isEmpty);
    },
  );

  test(
    'logout clears local session before an unreachable server response',
    () async {
      const session = Sub2ApiSession(
        accessToken: Sub2ApiAccessToken('logout-access-sentinel'),
        refreshToken: Sub2ApiRefreshToken('logout-refresh-sentinel'),
        scope: 'https://example.test',
      );
      final adapter = JsonResponseAdapter(
        (_) => const JsonResponse(
          statusCode: 503,
          body: <String, Object?>{
            'code': 503,
            'message': 'service unavailable',
          },
        ),
      );
      final dio = Dio(BaseOptions(baseUrl: 'https://example.test'))
        ..httpClientAdapter = adapter;
      final store = RecordingSessionStore(session);
      final client = createSub2ApiClientForTesting(
        configuration: Sub2ApiConfiguration(
          origin: Uri.parse('https://example.test'),
        ),
        sessionStore: store,
        dio: dio,
      );

      await expectLater(client.auth.logout(), throwsA(isA<Sub2ApiException>()));

      expect(store.clearCount, 1);
      expect(store.session, isNull);
      final request = adapter.requests.single;
      expect(request.method, 'POST');
      expect(request.path, '/api/v1/auth/logout');
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer logout-access-sentinel'),
      );
      client.close();
    },
  );
}
