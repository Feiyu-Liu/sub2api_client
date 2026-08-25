import 'package:dio/dio.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/session/session_coordinator.dart';
import 'package:sub2api_client/src/shared/session/sub2api_session.dart';
import 'package:sub2api_client/src/shared/transport/request_executor_impl.dart';
import 'package:sub2api_client/src/user/sub2api_user_client.dart';
import 'package:sub2api_client/src/user/sub2api_user_models.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  const session = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('user-transport-access'),
    scope: 'https://sub2api.test',
  );

  test(
    'profile uses the shared executor envelope and protected GET contract',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: readFixture('user/profile_success.json')),
      );
      final client = _client(adapter, session);

      final profile = await client.getProfile();

      expect(profile.email, 'user@example.test');
      final request = adapter.requests.single;
      expect(request.method, 'GET');
      expect(request.path, '/api/v1/user/profile');
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer user-transport-access'),
      );
    },
  );

  test(
    'profile rejects a success envelope on an unsupported HTTP status',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('user/profile_success.json'),
          statusCode: 201,
        ),
      );
      final client = _client(adapter, session);

      await expectLater(
        client.getProfile(),
        throwsA(
          isA<Sub2ApiException>().having(
            (error) => error.code,
            'code',
            'protocol.unexpected_success_status',
          ),
        ),
      );
    },
  );

  test(
    'password change maps handler errors without exposing credentials',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('errors/handler_integer.json'),
          statusCode: 400,
        ),
      );
      final client = _client(adapter, session);

      await expectLater(
        client.changePassword(
          const Sub2ApiChangePasswordRequest(
            oldPassword: Sub2ApiPassword('old-password-sentinel'),
            newPassword: Sub2ApiPassword('new-password-sentinel'),
          ),
        ),
        throwsA(
          isA<Sub2ApiException>()
              .having(
                (error) => error.kind,
                'kind',
                Sub2ApiFailureKind.validation,
              )
              .having((error) => error.code, 'code', 'server.invalid_amount')
              .having(
                (error) => error.toString(),
                'redaction',
                isNot(contains('password-sentinel')),
              ),
        ),
      );

      final request = adapter.requests.single;
      expect(request.method, 'PUT');
      expect(request.path, '/api/v1/user/password');
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer user-transport-access'),
      );
      expect(request.data, <String, Object?>{
        'old_password': 'old-password-sentinel',
        'new_password': 'new-password-sentinel',
      });
    },
  );
}

Sub2ApiUserClient _client(JsonResponseAdapter adapter, Sub2ApiSession session) {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );
  final sessions = Sub2ApiSessionCoordinator(RecordingSessionStore(session));
  final executor = Sub2ApiRequestExecutorImpl(
    configuration: configuration,
    refreshSession: (_) => throw StateError('refresh must not run'),
    sessions: sessions,
  );
  final dio = Dio(BaseOptions(baseUrl: configuration.origin.toString()))
    ..httpClientAdapter = adapter;
  return createSub2ApiUserClient(dio: dio, requestExecutor: executor);
}
