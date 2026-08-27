import 'package:dio/dio.dart';
import 'package:sub2api_client/src/client/sub2api_client.dart'
    show createSub2ApiClientForTesting;
import 'package:sub2api_client/sub2api_client.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  test(
    'GitHub start returns a cookie-continuity browser instruction',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: readFixture('oauth/start_success.json')),
      );
      final client = _client(adapter);
      addTearDown(client.close);
      const request = Sub2ApiOAuthStartRequest(
        provider: Sub2ApiOAuthProvider.github,
        redirectTo: '/dashboard',
        promoCode: 'PROMO-2026',
        captcha: Sub2ApiCaptchaProof(
          tencentCaptchaTicket: 'ticket-sentinel',
          tencentCaptchaRandstr: '@randstr-sentinel',
        ),
      );

      final instruction = await client.oauth.start(request);

      expect(instruction.provider, Sub2ApiOAuthProvider.github);
      expect(instruction.authorizeUri.host, 'github.example.test');
      expect(instruction.requiresBrowserCookieContinuity, isTrue);
      final sent = adapter.requests.single;
      expect(sent.method, 'POST');
      expect(sent.path, '/api/v1/auth/oauth/github/start');
      expect(sent.headers, isNot(contains('Authorization')));
      expect(sent.queryParameters, <String, Object?>{
        'redirect': '/dashboard',
        'intent': 'login',
        'promo_code': 'PROMO-2026',
      });
      expect(sent.data, <String, Object?>{
        'tencent_captcha_randstr': '@randstr-sentinel',
        'tencent_captcha_ticket': 'ticket-sentinel',
      });
    },
  );

  test('all fixed providers use their dedicated POST start route', () async {
    const cases = <Sub2ApiOAuthProvider, String>{
      Sub2ApiOAuthProvider.google: '/api/v1/auth/oauth/google/start',
      Sub2ApiOAuthProvider.linuxDo: '/api/v1/auth/oauth/linuxdo/start',
      Sub2ApiOAuthProvider.dingTalk: '/api/v1/auth/oauth/dingtalk/start',
      Sub2ApiOAuthProvider.weChat: '/api/v1/auth/oauth/wechat/start',
      Sub2ApiOAuthProvider.oidc: '/api/v1/auth/oauth/oidc/start',
    };

    for (final entry in cases.entries) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: readFixture('oauth/start_success.json')),
      );
      final client = _client(adapter);
      final instruction = await client.oauth.start(
        Sub2ApiOAuthStartRequest(
          provider: entry.key,
          weChatMode: entry.key == Sub2ApiOAuthProvider.weChat
              ? Sub2ApiWeChatOAuthMode.open
              : null,
        ),
      );
      client.close();

      expect(instruction.provider, entry.key);
      expect(adapter.requests.single.path, entry.value);
      if (entry.key == Sub2ApiOAuthProvider.weChat) {
        expect(adapter.requests.single.queryParameters['mode'], 'open');
      }
    }
  });

  test('invalid OAuth start inputs fail before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('network must not run'),
    );
    final client = _client(adapter);
    addTearDown(client.close);

    expect(
      () => client.oauth.start(
        const Sub2ApiOAuthStartRequest(
          provider: Sub2ApiOAuthProvider.github,
          redirectTo: 'https://evil.example/redirect',
        ),
      ),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'oauth.invalid_redirect',
        ),
      ),
    );
    expect(
      () => client.oauth.start(
        const Sub2ApiOAuthStartRequest(
          provider: Sub2ApiOAuthProvider.google,
          weChatMode: Sub2ApiWeChatOAuthMode.mp,
        ),
      ),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'oauth.wechat_mode_not_allowed',
        ),
      ),
    );
    expect(adapter.requests, isEmpty);
  });

  test('pending exchange persists an authenticated token pair', () async {
    final adapter = JsonResponseAdapter(
      (_) =>
          JsonResponse(body: readFixture('oauth/exchange_authenticated.json')),
    );
    final store = RecordingSessionStore();
    final client = _client(adapter, store: store);
    addTearDown(client.close);

    final completion = await client.oauth.exchangePendingCompletion();

    expect(completion, isA<Sub2ApiOAuthAuthenticated>());
    expect(store.session?.accessToken.reveal(), 'oauth-access-token-sentinel');
    expect(
      store.session?.refreshToken?.reveal(),
      'oauth-refresh-token-sentinel',
    );
    expect(store.session.toString(), isNot(contains('token-sentinel')));
    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/auth/oauth/pending/exchange');
    expect(sent.headers, isNot(contains('Authorization')));
    expect(sent.data, <String, Object?>{});
  });

  test('pending exchange preserves a typed account-choice action', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: readFixture('oauth/exchange_action_required.json'),
      ),
    );
    final client = _client(adapter);
    addTearDown(client.close);

    final completion = await client.oauth.exchangePendingCompletion(
      decision: const Sub2ApiOAuthAdoptionDecision(
        adoptDisplayName: true,
        adoptAvatar: false,
      ),
    );

    expect(completion, isA<Sub2ApiOAuthActionRequired>());
    final action = (completion as Sub2ApiOAuthActionRequired).action;
    expect(action.step, 'choose_account_action_required');
    expect(action.error, 'invitation_required');
    expect(action.provider, 'oidc');
    expect(action.adoptionRequired, isTrue);
    expect(action.suggestedDisplayName, 'Candidate User');
    expect(adapter.requests.single.data, <String, Object?>{
      'adopt_display_name': true,
      'adopt_avatar': false,
    });
  });

  test('pending exchange exposes a redacted 2FA challenge', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('oauth/exchange_2fa.json')),
    );
    final client = _client(adapter);
    addTearDown(client.close);

    final completion = await client.oauth.exchangePendingCompletion();

    expect(completion, isA<Sub2ApiOAuthTwoFactorRequired>());
    final challenge = completion as Sub2ApiOAuthTwoFactorRequired;
    expect(challenge.temporaryToken.toString(), '<redacted>');
    expect(challenge.userEmailMasked, 'u***@example.test');
  });

  test(
    'pending exchange distinguishes a current-user bind completion',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('oauth/exchange_binding_completed.json'),
        ),
      );
      final client = _client(adapter);
      addTearDown(client.close);

      final completion = await client.oauth.exchangePendingCompletion();

      expect(completion, isA<Sub2ApiOAuthBindingCompleted>());
      final bound = completion as Sub2ApiOAuthBindingCompleted;
      expect(bound.authResult, 'bind_success');
      expect(bound.redirectUri?.path, '/profile');
    },
  );

  test('pending email-code request maps the standard envelope', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('oauth/pending_code_sent.json')),
    );
    final client = _client(adapter);
    addTearDown(client.close);
    const request = Sub2ApiOAuthPendingEmailCodeRequest(
      email: 'candidate@example.test',
      captcha: Sub2ApiCaptchaProof(challengeToken: 'captcha-proof-sentinel'),
    );

    final result = await client.oauth.sendPendingEmailCode(
      request,
      locale: 'en-US',
    );

    expect(result, isA<Sub2ApiOAuthPendingEmailCodeSent>());
    final sentResult = result as Sub2ApiOAuthPendingEmailCodeSent;
    expect(sentResult.cooldown, const Duration(seconds: 60));
    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/auth/oauth/pending/send-verify-code');
    expect(sent.headers, containsPair('Accept-Language', 'en-US'));
    expect(sent.data, <String, Object?>{
      'email': 'candidate@example.test',
      'turnstile_token': 'captcha-proof-sentinel',
    });
  });

  test('pending email-code maps the raw existing-account transition', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: readFixture('oauth/pending_code_existing_account_raw.json'),
      ),
    );
    final client = _client(adapter);
    addTearDown(client.close);

    final result = await client.oauth.sendPendingEmailCode(
      const Sub2ApiOAuthPendingEmailCodeRequest(email: 'existing@example.test'),
    );

    expect(result, isA<Sub2ApiOAuthPendingEmailActionRequired>());
    final action = (result as Sub2ApiOAuthPendingEmailActionRequired).action;
    expect(action.step, 'choose_account_action_required');
    expect(action.existingAccountBindable, isTrue);
    expect(action.email, 'existing@example.test');
  });

  test('pending account creation accepts a raw token-pair success', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: readFixture('oauth/create_account_authenticated_raw.json'),
      ),
    );
    final store = RecordingSessionStore();
    final client = _client(adapter, store: store);
    addTearDown(client.close);
    const request = Sub2ApiCreatePendingOAuthAccountRequest(
      email: 'new@example.test',
      password: Sub2ApiPassword('oauth-password-sentinel'),
      verificationCode: Sub2ApiVerificationCode('123456'),
      invitationCode: 'INVITE-2026',
      affiliateCode: 'AFF-2026',
      adoptionDecision: Sub2ApiOAuthAdoptionDecision(
        adoptDisplayName: true,
        adoptAvatar: false,
      ),
    );

    final completion = await client.oauth.createPendingAccount(request);

    expect(completion, isA<Sub2ApiOAuthAuthenticated>());
    expect(
      store.session?.accessToken.reveal(),
      'oauth-created-access-sentinel',
    );
    expect(request.toString(), isNot(contains('password-sentinel')));
    expect(request.toString(), isNot(contains('123456')));
    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/auth/oauth/pending/create-account');
    expect(sent.data, <String, Object?>{
      'email': 'new@example.test',
      'password': 'oauth-password-sentinel',
      'verify_code': '123456',
      'invitation_code': 'INVITE-2026',
      'aff_code': 'AFF-2026',
      'adopt_display_name': true,
      'adopt_avatar': false,
    });
  });

  test('pending bind-login returns a redacted 2FA challenge', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('oauth/exchange_2fa.json')),
    );
    final client = _client(adapter);
    addTearDown(client.close);
    const request = Sub2ApiBindPendingOAuthLoginRequest(
      email: 'existing@example.test',
      password: Sub2ApiPassword('existing-password-sentinel'),
      adoptionDecision: Sub2ApiOAuthAdoptionDecision(
        adoptDisplayName: false,
        adoptAvatar: true,
      ),
    );

    final completion = await client.oauth.bindPendingLogin(request);

    expect(completion, isA<Sub2ApiOAuthTwoFactorRequired>());
    expect(request.toString(), isNot(contains('password-sentinel')));
    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/auth/oauth/pending/bind-login');
    expect(sent.data, <String, Object?>{
      'email': 'existing@example.test',
      'password': 'existing-password-sentinel',
      'adopt_display_name': false,
      'adopt_avatar': true,
    });
  });

  test(
    'legacy GitHub completion requires password and persists tokens',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('oauth/create_account_authenticated_raw.json'),
        ),
      );
      final store = RecordingSessionStore();
      final client = _client(adapter, store: store);
      addTearDown(client.close);
      const request = Sub2ApiCompleteEmailOAuthRegistrationRequest(
        provider: Sub2ApiOAuthProvider.github,
        password: Sub2ApiPassword('github-password-sentinel'),
        invitationCode: 'INVITE-GH',
        affiliateCode: 'AFF-GH',
      );

      final completion = await client.oauth.completeRegistration(request);

      expect(completion, isA<Sub2ApiOAuthAuthenticated>());
      expect(
        store.session?.accessToken.reveal(),
        'oauth-created-access-sentinel',
      );
      expect(request.toString(), isNot(contains('password-sentinel')));
      final sent = adapter.requests.single;
      expect(sent.path, '/api/v1/auth/oauth/github/complete-registration');
      expect(sent.data, <String, Object?>{
        'password': 'github-password-sentinel',
        'invitation_code': 'INVITE-GH',
        'aff_code': 'AFF-GH',
      });
    },
  );

  test('all legacy completion providers use their fixed route', () async {
    const cases = <Sub2ApiOAuthProvider, String>{
      Sub2ApiOAuthProvider.google:
          '/api/v1/auth/oauth/google/complete-registration',
      Sub2ApiOAuthProvider.linuxDo:
          '/api/v1/auth/oauth/linuxdo/complete-registration',
      Sub2ApiOAuthProvider.oidc:
          '/api/v1/auth/oauth/oidc/complete-registration',
      Sub2ApiOAuthProvider.weChat:
          '/api/v1/auth/oauth/wechat/complete-registration',
      Sub2ApiOAuthProvider.dingTalk:
          '/api/v1/auth/oauth/dingtalk/complete-registration',
    };

    for (final entry in cases.entries) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('oauth/create_account_authenticated_raw.json'),
        ),
      );
      final client = _client(adapter);
      final request = entry.key == Sub2ApiOAuthProvider.google
          ? const Sub2ApiCompleteEmailOAuthRegistrationRequest(
              provider: Sub2ApiOAuthProvider.google,
              password: Sub2ApiPassword('google-password'),
            )
          : Sub2ApiCompleteIdentityOAuthRegistrationRequest(
              provider: entry.key,
              invitationCode: 'INVITE-PROVIDER',
              adoptionDecision: const Sub2ApiOAuthAdoptionDecision(
                adoptDisplayName: true,
              ),
            );

      final completion = await client.oauth.completeRegistration(request);
      client.close();

      expect(completion, isA<Sub2ApiOAuthAuthenticated>());
      expect(adapter.requests.single.path, entry.value);
      if (entry.key != Sub2ApiOAuthProvider.google) {
        expect(
          adapter.requests.single.data,
          containsPair('invitation_code', 'INVITE-PROVIDER'),
        );
      }
    }
  });

  test('provider-guarded create aliases use all four fixed routes', () async {
    const cases = <Sub2ApiOAuthProvider, String>{
      Sub2ApiOAuthProvider.linuxDo: '/api/v1/auth/oauth/linuxdo/create-account',
      Sub2ApiOAuthProvider.oidc: '/api/v1/auth/oauth/oidc/create-account',
      Sub2ApiOAuthProvider.weChat: '/api/v1/auth/oauth/wechat/create-account',
      Sub2ApiOAuthProvider.dingTalk:
          '/api/v1/auth/oauth/dingtalk/create-account',
    };
    const request = Sub2ApiCreatePendingOAuthAccountRequest(
      email: 'new@example.test',
      password: Sub2ApiPassword('provider-password'),
    );

    for (final entry in cases.entries) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('oauth/create_account_authenticated_raw.json'),
        ),
      );
      final client = _client(adapter);
      final completion = await client.oauth.createPendingAccountForProvider(
        entry.key,
        request,
      );
      client.close();

      expect(completion, isA<Sub2ApiOAuthAuthenticated>());
      expect(adapter.requests.single.path, entry.value);
    }
  });

  test('provider-guarded bind aliases use all four fixed routes', () async {
    const cases = <Sub2ApiOAuthProvider, String>{
      Sub2ApiOAuthProvider.linuxDo: '/api/v1/auth/oauth/linuxdo/bind-login',
      Sub2ApiOAuthProvider.oidc: '/api/v1/auth/oauth/oidc/bind-login',
      Sub2ApiOAuthProvider.weChat: '/api/v1/auth/oauth/wechat/bind-login',
      Sub2ApiOAuthProvider.dingTalk: '/api/v1/auth/oauth/dingtalk/bind-login',
    };
    const request = Sub2ApiBindPendingOAuthLoginRequest(
      email: 'existing@example.test',
      password: Sub2ApiPassword('provider-password'),
    );

    for (final entry in cases.entries) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: readFixture('oauth/exchange_2fa.json')),
      );
      final client = _client(adapter);
      final completion = await client.oauth.bindPendingLoginForProvider(
        entry.key,
        request,
      );
      client.close();

      expect(completion, isA<Sub2ApiOAuthTwoFactorRequired>());
      expect(adapter.requests.single.path, entry.value);
    }
  });

  test(
    'prepare binding cookie accepts only the authenticated 204 contract',
    () async {
      const session = Sub2ApiSession(
        accessToken: Sub2ApiAccessToken('oauth-bind-access-sentinel'),
        scope: 'https://sub2api.test',
      );
      final adapter = JsonResponseAdapter(
        (_) => const JsonResponse(body: null, statusCode: 204),
      );
      final client = _client(adapter, store: RecordingSessionStore(session));
      addTearDown(client.close);

      await client.oauth.prepareBindingCookie();

      final sent = adapter.requests.single;
      expect(sent.method, 'POST');
      expect(sent.path, '/api/v1/auth/oauth/bind-token');
      expect(
        sent.headers,
        containsPair('Authorization', 'Bearer oauth-bind-access-sentinel'),
      );
    },
  );

  test('legacy browser login builders cover all six GET start routes', () {
    const cases = <Sub2ApiOAuthProvider, String>{
      Sub2ApiOAuthProvider.github: '/api/v1/auth/oauth/github/start',
      Sub2ApiOAuthProvider.google: '/api/v1/auth/oauth/google/start',
      Sub2ApiOAuthProvider.linuxDo: '/api/v1/auth/oauth/linuxdo/start',
      Sub2ApiOAuthProvider.dingTalk: '/api/v1/auth/oauth/dingtalk/start',
      Sub2ApiOAuthProvider.weChat: '/api/v1/auth/oauth/wechat/start',
      Sub2ApiOAuthProvider.oidc: '/api/v1/auth/oauth/oidc/start',
    };
    final client = _client(
      JsonResponseAdapter((_) => throw StateError('no I/O')),
    );
    addTearDown(client.close);

    for (final entry in cases.entries) {
      final instruction = client.oauth.buildLegacyLoginStart(
        Sub2ApiOAuthStartRequest(
          provider: entry.key,
          redirectTo: '/dashboard',
          weChatMode: entry.key == Sub2ApiOAuthProvider.weChat
              ? Sub2ApiWeChatOAuthMode.mp
              : null,
        ),
      );
      expect(instruction.uri.path, entry.value);
      expect(instruction.requiresSameUserAgentCookieContext, isTrue);
      expect(instruction.supportsCaptchaProof, isFalse);
    }
  });

  test('browser binding builders cover all four GET bind routes', () {
    const cases = <Sub2ApiOAuthProvider, String>{
      Sub2ApiOAuthProvider.linuxDo: '/api/v1/auth/oauth/linuxdo/bind/start',
      Sub2ApiOAuthProvider.dingTalk: '/api/v1/auth/oauth/dingtalk/bind/start',
      Sub2ApiOAuthProvider.weChat: '/api/v1/auth/oauth/wechat/bind/start',
      Sub2ApiOAuthProvider.oidc: '/api/v1/auth/oauth/oidc/bind/start',
    };
    final client = _client(
      JsonResponseAdapter((_) => throw StateError('no I/O')),
    );
    addTearDown(client.close);

    for (final entry in cases.entries) {
      final instruction = client.oauth.buildBindingStart(
        Sub2ApiOAuthBindingStartRequest(
          provider: entry.key,
          redirectTo: '/profile',
          weChatMode: entry.key == Sub2ApiOAuthProvider.weChat
              ? Sub2ApiWeChatOAuthMode.open
              : null,
        ),
      );
      expect(instruction.uri.path, entry.value);
      expect(instruction.requiresPreparedBindingCookie, isTrue);
    }
  });

  test('WeChat payment builder covers the fixed browser start route', () {
    final client = _client(
      JsonResponseAdapter((_) => throw StateError('no I/O')),
    );
    addTearDown(client.close);

    final instruction = client.oauth.buildWeChatPaymentStart(
      const Sub2ApiWeChatPaymentOAuthStartRequest(
        paymentType: Sub2ApiWeChatPaymentType.wxpay,
        redirectTo: '/purchase?from=wechat',
        orderType: Sub2ApiOAuthPaymentOrderType.subscription,
        planId: 7,
        scope: Sub2ApiWeChatPaymentScope.userInfo,
      ),
    );

    expect(instruction.uri.path, '/api/v1/auth/oauth/wechat/payment/start');
    expect(instruction.uri.queryParameters['payment_type'], 'wxpay');
    expect(instruction.uri.queryParameters['order_type'], 'subscription');
    expect(instruction.uri.queryParameters['plan_id'], '7');
    expect(instruction.uri.queryParameters['scope'], 'snsapi_userinfo');
  });
}

Sub2ApiClient _client(
  JsonResponseAdapter adapter, {
  RecordingSessionStore? store,
}) {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );
  final dio = Dio(BaseOptions(baseUrl: configuration.origin.toString()))
    ..httpClientAdapter = adapter;
  return createSub2ApiClientForTesting(
    configuration: configuration,
    sessionStore: store ?? RecordingSessionStore(),
    dio: dio,
  );
}
