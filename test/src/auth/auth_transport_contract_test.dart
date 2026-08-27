import 'package:dio/dio.dart';
import 'package:sub2api_client/src/auth/models/sub2api_auth_models.dart';
import 'package:sub2api_client/src/auth/sub2api_authentication_client.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/session/session_coordinator.dart';
import 'package:sub2api_client/src/shared/transport/request_executor_impl.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  test(
    'email verification uses the fixed public path, body, and envelope',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('auth/send_verify_code_success.json'),
        ),
      );
      final client = _client(adapter);

      final sent = await client.sendEmailVerificationCode(
        const Sub2ApiEmailVerificationCodeRequest(
          email: 'user@example.test',
          captcha: Sub2ApiCaptchaProof(
            tencentCaptchaTicket: 'ticket-sentinel',
            tencentCaptchaRandstr: '@randstr-sentinel',
          ),
        ),
      );

      expect(sent.cooldown, const Duration(seconds: 60));
      _expectPublicRequest(
        adapter.requests.single,
        path: '/api/v1/auth/send-verify-code',
        data: const {
          'email': 'user@example.test',
          'tencent_captcha_randstr': '@randstr-sentinel',
          'tencent_captcha_ticket': 'ticket-sentinel',
        },
      );
    },
  );

  test('invitation validation uses the fixed public path and body', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: readFixture('auth/validate_invitation_code_invalid.json'),
      ),
    );
    final client = _client(adapter);

    final result = await client.validateInvitationCode(
      const Sub2ApiInvitationCodeValidationRequest(code: 'invite-sentinel'),
    );

    expect(result.isValid, isFalse);
    expect(result.errorCode, 'INVITATION_CODE_USED');
    _expectPublicRequest(
      adapter.requests.single,
      path: '/api/v1/auth/validate-invitation-code',
      data: const {'code': 'invite-sentinel'},
    );
  });

  test('forgot-password uses the fixed public path and body', () async {
    final adapter = JsonResponseAdapter(
      (_) =>
          JsonResponse(body: readFixture('auth/forgot_password_success.json')),
    );
    final client = _client(adapter);

    final result = await client.forgotPassword(
      const Sub2ApiForgotPasswordRequest(
        email: 'user@example.test',
        captcha: Sub2ApiCaptchaProof(
          challengeToken: 'aliyun-or-turnstile-sentinel',
        ),
      ),
    );

    expect(result.message, contains('password reset link'));
    _expectPublicRequest(
      adapter.requests.single,
      path: '/api/v1/auth/forgot-password',
      data: const {
        'email': 'user@example.test',
        'turnstile_token': 'aliyun-or-turnstile-sentinel',
      },
    );
  });

  test(
    'reset-password sends redacted credentials to the fixed public path',
    () async {
      final adapter = JsonResponseAdapter(
        (_) =>
            JsonResponse(body: readFixture('auth/reset_password_success.json')),
      );
      final client = _client(adapter);
      const request = Sub2ApiResetPasswordRequest(
        email: 'user@example.test',
        newPassword: Sub2ApiPassword('new-password-sentinel'),
        token: Sub2ApiPasswordResetToken('reset-token-sentinel'),
      );

      final result = await client.resetPassword(request);

      expect(result.message, contains('password has been reset'));
      expect(request.toString(), isNot(contains('new-password-sentinel')));
      expect(request.toString(), isNot(contains('reset-token-sentinel')));
      _expectPublicRequest(
        adapter.requests.single,
        path: '/api/v1/auth/reset-password',
        data: const {
          'email': 'user@example.test',
          'new_password': 'new-password-sentinel',
          'token': 'reset-token-sentinel',
        },
      );
    },
  );
}

Sub2ApiAuthenticationClient _client(JsonResponseAdapter adapter) {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );
  final sessions = Sub2ApiSessionCoordinator(RecordingSessionStore());
  final executor = Sub2ApiRequestExecutorImpl(
    configuration: configuration,
    refreshSession: (_) => throw StateError('refresh must not run'),
    sessions: sessions,
  );
  final dio = Dio(BaseOptions(baseUrl: configuration.origin.toString()))
    ..httpClientAdapter = adapter;
  return createSub2ApiAuthenticationClient(
    configuration: configuration,
    dio: dio,
    requestExecutor: executor,
    sessions: sessions,
  );
}

void _expectPublicRequest(
  RequestOptions request, {
  required String path,
  required Map<String, Object?> data,
}) {
  expect(request.method, 'POST');
  expect(request.path, path);
  expect(request.headers, isNot(contains('Authorization')));
  expect(request.data, data);
}
