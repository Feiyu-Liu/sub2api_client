import 'package:dio/dio.dart';
import 'package:sub2api_client/src/auth/models/sub2api_auth_models.dart';
import 'package:sub2api_client/src/auth/sub2api_authentication_client.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/session/session_coordinator.dart';
import 'package:sub2api_client/src/shared/session/sub2api_session.dart';
import 'package:sub2api_client/src/shared/transport/request_executor_impl.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  const authenticatedSession = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('current-user-access-sentinel'),
    refreshToken: Sub2ApiRefreshToken('current-user-refresh-sentinel'),
    scope: 'https://sub2api.test',
  );

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

  test('promo validation preserves the exact registration bonus', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: readFixture('auth/validate_promo_code_valid.json'),
      ),
    );
    final client = _client(adapter);

    final result = await client.validatePromoCode(
      const Sub2ApiPromoCodeValidationRequest(code: ' PROMO-25 '),
    );

    expect(result.isValid, isTrue);
    expect(result.bonusAmount.toString(), '12.5');
    _expectPublicRequest(
      adapter.requests.single,
      path: '/api/v1/auth/validate-promo-code',
      data: const {'code': 'PROMO-25'},
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

  test(
    'current user returns the authenticated role and identity facts',
    () async {
      final adapter = JsonResponseAdapter(
        (_) =>
            JsonResponse(body: readFixture('auth/current_user_success.json')),
      );
      final store = RecordingSessionStore(authenticatedSession);
      final client = _client(adapter, store: store);

      final current = await client.getCurrentUser();

      expect(current.id, 42);
      expect(current.role, 'admin');
      expect(current.runMode, 'standard');
      expect(current.identities.linuxDo.bound, isTrue);
      expect(current.identities.linuxDo.providerKey, 'linuxdo');
      expect(
        current.balanceNotifyExtraEmails.single.email,
        'alerts@example.test',
      );
      final request = adapter.requests.single;
      expect(request.method, 'GET');
      expect(request.path, '/api/v1/auth/me');
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer current-user-access-sentinel'),
      );
    },
  );

  test(
    'current user normalizes nullable profile lists from the live handler',
    () async {
      final fixture = readFixture('auth/current_user_success.json');
      final data = Map<String, Object?>.from(fixture['data']! as Map)
        ..['allowed_groups'] = null
        ..['balance_notify_extra_emails'] = null
        ..['balance_notify_threshold'] = null
        ..['username'] = '';
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: <String, Object?>{
            'code': 0,
            'message': 'success',
            'data': data,
          },
        ),
      );
      final client = _client(
        adapter,
        store: RecordingSessionStore(authenticatedSession),
      );

      final current = await client.getCurrentUser();

      expect(current.allowedGroups, isEmpty);
      expect(current.balanceNotifyExtraEmails, isEmpty);
      expect(current.balanceNotifyThreshold, isNull);
      expect(current.username, isEmpty);
    },
  );

  test(
    'revoke all sessions is non-replayable and clears local tokens',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('auth/revoke_all_sessions_success.json'),
        ),
      );
      final store = RecordingSessionStore(authenticatedSession);
      final client = _client(adapter, store: store);

      final result = await client.revokeAllSessions();

      expect(result.message, contains('All sessions have been revoked'));
      expect(store.session, isNull);
      expect(store.clearCount, 1);
      final request = adapter.requests.single;
      expect(request.method, 'POST');
      expect(request.path, '/api/v1/auth/revoke-all-sessions');
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer current-user-access-sentinel'),
      );
    },
  );

  test('current user fails closed when a required field is missing', () async {
    final fixture = readFixture('auth/current_user_success.json');
    final data = Map<String, Object?>.from(fixture['data']! as Map)
      ..remove('run_mode');
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: <String, Object?>{'code': 0, 'message': 'success', 'data': data},
      ),
    );
    final client = _client(
      adapter,
      store: RecordingSessionStore(authenticatedSession),
    );

    await expectLater(
      client.getCurrentUser(),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'protocol.invalid_current_user_response',
        ),
      ),
    );
  });

  test(
    'revoke all sessions clears local tokens before a server failure',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => const JsonResponse(
          statusCode: 503,
          body: <String, Object?>{
            'code': 503,
            'message': 'service unavailable',
          },
        ),
      );
      final store = RecordingSessionStore(authenticatedSession);
      final client = _client(adapter, store: store);

      await expectLater(
        client.revokeAllSessions(),
        throwsA(isA<Sub2ApiException>()),
      );

      expect(store.session, isNull);
      expect(store.clearCount, 1);
      expect(adapter.requests, hasLength(1));
    },
  );

  test('registration, 2FA completion, and refresh use fixed routes', () async {
    final registerAdapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('auth/login_authenticated.json')),
    );
    final registerClient = _client(registerAdapter);
    await registerClient.register(
      const Sub2ApiRegistrationRequest(
        email: 'new@example.test',
        password: Sub2ApiPassword('registration-password-sentinel'),
      ),
    );
    expect(registerAdapter.requests.single.path, '/api/v1/auth/register');

    final twoFactorAdapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('auth/login_authenticated.json')),
    );
    final twoFactorClient = _client(twoFactorAdapter);
    await twoFactorClient.completeTwoFactorLogin(
      const Sub2ApiTwoFactorLoginRequest(
        temporaryToken: Sub2ApiTwoFactorTemporaryToken('2fa-temp-sentinel'),
        totpCode: Sub2ApiVerificationCode('123456'),
      ),
    );
    expect(twoFactorAdapter.requests.single.path, '/api/v1/auth/login/2fa');

    final refreshAdapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('auth/refresh_rotated_pair.json')),
    );
    final refreshClient = _client(
      refreshAdapter,
      store: RecordingSessionStore(authenticatedSession),
    );
    await refreshClient.refreshCurrentSession();
    expect(refreshAdapter.requests.single.path, '/api/v1/auth/refresh');
  });
}

Sub2ApiAuthenticationClient _client(
  JsonResponseAdapter adapter, {
  RecordingSessionStore? store,
}) {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );
  final sessions = Sub2ApiSessionCoordinator(store ?? RecordingSessionStore());
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
