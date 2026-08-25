import 'package:dio/dio.dart';
import 'package:sub2api_client/src/auth/models/sub2api_auth_models.dart';
import 'package:sub2api_client/src/auth/sub2api_authentication_client.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/session/session_coordinator.dart';
import 'package:sub2api_client/src/shared/transport/request_executor_impl.dart';
import 'package:test/test.dart';

import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  test(
    'Retrofit spike sends login body and maps an authenticated union',
    () async {
      final adapter = JsonResponseAdapter(
        (request) => const JsonResponse(
          body: <String, Object?>{
            'code': 0,
            'message': 'success',
            'data': <String, Object?>{
              'access_token': 'access-sentinel',
              'refresh_token': 'refresh-sentinel',
              'expires_in': 3600,
              'token_type': 'Bearer',
              'user': <String, Object?>{
                'id': 1,
                'email': 'user@example.test',
                'role': 'user',
                'username': 'user',
              },
            },
          },
        ),
      );
      final configuration = Sub2ApiConfiguration(
        origin: Uri.parse('https://example.test'),
      );
      final dio = Dio(BaseOptions(baseUrl: configuration.origin.toString()))
        ..httpClientAdapter = adapter;
      final sessions = Sub2ApiSessionCoordinator(RecordingSessionStore());
      final client = createSub2ApiAuthenticationClient(
        configuration: configuration,
        dio: dio,
        requestExecutor: _executor(configuration, sessions),
        sessions: sessions,
      );

      final result = await client.login(
        const Sub2ApiLoginRequest(
          email: 'user@example.test',
          password: Sub2ApiPassword('password-sentinel'),
        ),
      );

      expect(result, isA<Sub2ApiAuthenticated>());
      expect(adapter.requests, hasLength(1));
      final request = adapter.requests.single;
      expect(request.method, 'POST');
      expect(request.path, '/api/v1/auth/login');
      expect(request.data, <String, Object?>{
        'email': 'user@example.test',
        'password': 'password-sentinel',
      });
      expect(request.headers, isNot(contains('Authorization')));
    },
  );
}

Sub2ApiRequestExecutorImpl _executor(
  Sub2ApiConfiguration configuration,
  Sub2ApiSessionCoordinator sessions,
) => Sub2ApiRequestExecutorImpl(
  configuration: configuration,
  refreshSession: (_) => throw StateError('refresh should not run'),
  sessions: sessions,
);
