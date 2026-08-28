import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../auth/models/sub2api_auth_models.dart';
import '../shared/configuration/sub2api_configuration.dart';
import '../shared/contract/sub2api_browser_route.dart';
import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/session/session_coordinator.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_oauth_models.dart';
import 'wire/oauth_wire_dtos.dart';
import 'wire/oauth_wire_service.dart';

/// Provides browser-oriented OAuth login and pending-account operations.
abstract interface class Sub2ApiOAuthClient {
  /// Builds the legacy browser GET login route (no captcha body support).
  Sub2ApiOAuthBrowserInstruction buildLegacyLoginStart(
    Sub2ApiOAuthStartRequest request,
  );

  /// Builds a current-user browser bind route after cookie preparation.
  Sub2ApiOAuthBrowserInstruction buildBindingStart(
    Sub2ApiOAuthBindingStartRequest request,
  );

  /// Builds the WeChat payment OAuth browser route.
  Sub2ApiOAuthBrowserInstruction buildWeChatPaymentStart(
    Sub2ApiWeChatPaymentOAuthStartRequest request,
  );

  /// Copies the current Bearer token into the short-lived bind-start cookie.
  Future<void> prepareBindingCookie({Sub2ApiRequestOptions? requestOptions});

  /// Binds the pending OAuth identity to an existing password account.
  Future<Sub2ApiOAuthPendingCompletion> bindPendingLogin(
    Sub2ApiBindPendingOAuthLoginRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Uses a provider-guarded compatibility alias for existing-account binding.
  Future<Sub2ApiOAuthPendingCompletion> bindPendingLoginForProvider(
    Sub2ApiOAuthProvider provider,
    Sub2ApiBindPendingOAuthLoginRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Completes a provider-specific legacy pending registration.
  Future<Sub2ApiOAuthPendingCompletion> completeRegistration(
    Sub2ApiCompleteOAuthRegistrationRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Creates and logs in an account from the browser-bound pending identity.
  Future<Sub2ApiOAuthPendingCompletion> createPendingAccount(
    Sub2ApiCreatePendingOAuthAccountRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Uses a provider-guarded compatibility alias for account creation.
  Future<Sub2ApiOAuthPendingCompletion> createPendingAccountForProvider(
    Sub2ApiOAuthProvider provider,
    Sub2ApiCreatePendingOAuthAccountRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Exchanges the browser-bound pending session into its next typed state.
  Future<Sub2ApiOAuthPendingCompletion> exchangePendingCompletion({
    Sub2ApiOAuthAdoptionDecision decision =
        const Sub2ApiOAuthAdoptionDecision(),
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Sends an email code or returns an existing-account action transition.
  Future<Sub2ApiOAuthPendingEmailCodeResult> sendPendingEmailCode(
    Sub2ApiOAuthPendingEmailCodeRequest request, {
    String? locale,
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Starts a provider login and returns its browser authorization URL.
  Future<Sub2ApiOAuthStartInstruction> start(
    Sub2ApiOAuthStartRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

/// Creates the package-internal OAuth implementation.
Sub2ApiOAuthClient createSub2ApiOAuthClient({
  required Sub2ApiConfiguration configuration,
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiSessionCoordinator sessions,
}) => _Sub2ApiOAuthClient(
  configuration: configuration,
  dio: dio,
  requestExecutor: requestExecutor,
  sessions: sessions,
);

final class _Sub2ApiOAuthClient implements Sub2ApiOAuthClient {
  _Sub2ApiOAuthClient({
    required Sub2ApiConfiguration configuration,
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiSessionCoordinator sessions,
  }) : _requestExecutor = requestExecutor,
       _origin = configuration.origin,
       _scope = configuration.origin.toString(),
       _service = OAuthWireService(dio),
       _sessions = sessions;

  final Sub2ApiRequestExecutor _requestExecutor;
  final Uri _origin;
  final String _scope;
  final OAuthWireService _service;
  final Sub2ApiSessionCoordinator _sessions;

  @override
  @Sub2ApiBrowserRoute('GET', '/api/v1/auth/oauth/github/start')
  @Sub2ApiBrowserRoute('GET', '/api/v1/auth/oauth/google/start')
  @Sub2ApiBrowserRoute('GET', '/api/v1/auth/oauth/linuxdo/start')
  @Sub2ApiBrowserRoute('GET', '/api/v1/auth/oauth/dingtalk/start')
  @Sub2ApiBrowserRoute('GET', '/api/v1/auth/oauth/wechat/start')
  @Sub2ApiBrowserRoute('GET', '/api/v1/auth/oauth/oidc/start')
  Sub2ApiOAuthBrowserInstruction buildLegacyLoginStart(
    Sub2ApiOAuthStartRequest request,
  ) {
    if (_hasCaptcha(request.captcha)) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'oauth.get_start_captcha_not_supported',
        retryable: false,
      );
    }
    if (request.provider != Sub2ApiOAuthProvider.weChat &&
        request.weChatMode != null) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'oauth.wechat_mode_not_allowed',
        retryable: false,
      );
    }
    final promoCode = _trimmed(request.promoCode);
    final affiliateCode =
        request.provider == Sub2ApiOAuthProvider.github ||
            request.provider == Sub2ApiOAuthProvider.google
        ? _trimmed(request.affiliateCode)
        : null;
    final mode = request.provider == Sub2ApiOAuthProvider.weChat
        ? request.weChatMode?.wireName
        : null;
    final query = <String, String>{
      'redirect': _redirect(request.redirectTo),
      'intent': 'login',
      'promo_code': ?promoCode,
      'aff_code': ?affiliateCode,
      'mode': ?mode,
    };
    return _browserInstruction(
      _browserUri(_loginStartPath(request.provider), query),
      supportsCaptchaProof: false,
    );
  }

  @override
  @Sub2ApiBrowserRoute('GET', '/api/v1/auth/oauth/linuxdo/bind/start')
  @Sub2ApiBrowserRoute('GET', '/api/v1/auth/oauth/dingtalk/bind/start')
  @Sub2ApiBrowserRoute('GET', '/api/v1/auth/oauth/wechat/bind/start')
  @Sub2ApiBrowserRoute('GET', '/api/v1/auth/oauth/oidc/bind/start')
  Sub2ApiOAuthBrowserInstruction buildBindingStart(
    Sub2ApiOAuthBindingStartRequest request,
  ) {
    _requireGuardedProvider(request.provider);
    if (request.provider != Sub2ApiOAuthProvider.weChat &&
        request.weChatMode != null) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'oauth.wechat_mode_not_allowed',
        retryable: false,
      );
    }
    final mode = request.provider == Sub2ApiOAuthProvider.weChat
        ? request.weChatMode?.wireName
        : null;
    final query = <String, String>{
      'redirect': _redirect(request.redirectTo),
      'intent': 'bind_current_user',
      'mode': ?mode,
    };
    return _browserInstruction(
      _browserUri(_bindingStartPath(request.provider), query),
      requiresPreparedBindingCookie: true,
      supportsCaptchaProof: false,
    );
  }

  @override
  @Sub2ApiBrowserRoute('GET', '/api/v1/auth/oauth/wechat/payment/start')
  Sub2ApiOAuthBrowserInstruction buildWeChatPaymentStart(
    Sub2ApiWeChatPaymentOAuthStartRequest request,
  ) {
    if (request.planId != null && request.planId! <= 0) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'oauth.invalid_payment_plan_id',
        retryable: false,
      );
    }
    final query = <String, String>{
      'payment_type': request.paymentType.wireName,
      'redirect': _redirect(request.redirectTo),
      if (request.amount != null) 'amount': request.amount!.toJson(),
      if (request.orderType case final orderType?)
        'order_type': orderType.wireName,
      if (request.planId case final planId?) 'plan_id': '$planId',
      'scope': request.scope.wireName,
    };
    return _browserInstruction(
      _browserUri('/api/v1/auth/oauth/wechat/payment/start', query),
      supportsCaptchaProof: false,
    );
  }

  @override
  Future<void> prepareBindingCookie({Sub2ApiRequestOptions? requestOptions}) =>
      _requestExecutor.protectedNonReplayableNoContentRequest(
        send: (cancelToken, options, authorization) =>
            _service.prepareBindingCookie(cancelToken, options, authorization),
        requestOptions: requestOptions,
      );

  @override
  Future<Sub2ApiOAuthPendingCompletion> completeRegistration(
    Sub2ApiCompleteOAuthRegistrationRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    final body = switch (request) {
      Sub2ApiCompleteEmailOAuthRegistrationRequest(
        :final password,
        :final invitationCode,
        :final affiliateCode,
      ) =>
        <String, Object?>{
          'password': _password(password.reveal()),
          'invitation_code': ?_trimmed(invitationCode),
          'aff_code': ?_trimmed(affiliateCode),
        },
      Sub2ApiCompleteIdentityOAuthRegistrationRequest(
        :final invitationCode,
        :final affiliateCode,
        :final adoptionDecision,
      ) =>
        <String, Object?>{
          'invitation_code': _requiredText(
            invitationCode,
            'oauth.invitation_code_required',
          ),
          'aff_code': ?_trimmed(affiliateCode),
          ..._adoptionBody(adoptionDecision),
        },
    };
    final completion = await _requestExecutor
        .publicRequestAllowingRawSuccess<Sub2ApiOAuthPendingCompletion>(
          send: (cancelToken, options, authorization) =>
              _completeRegistrationWire(
                request.provider,
                body,
                cancelToken,
                options,
                authorization,
              ),
          decode: _decodePendingCompletion,
          requestOptions: requestOptions,
        );
    await _persistCompletion(completion);
    return completion;
  }

  @override
  Future<Sub2ApiOAuthPendingCompletion> bindPendingLogin(
    Sub2ApiBindPendingOAuthLoginRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    final completion = await _requestExecutor
        .publicRequestAllowingRawSuccess<Sub2ApiOAuthPendingCompletion>(
          send: (cancelToken, options, authorization) =>
              _service.bindPendingLogin(
                _bindPendingLoginBody(request),
                cancelToken,
                options,
                authorization,
              ),
          decode: _decodePendingCompletion,
          requestOptions: requestOptions,
        );
    await _persistCompletion(completion);
    return completion;
  }

  @override
  Future<Sub2ApiOAuthPendingCompletion> bindPendingLoginForProvider(
    Sub2ApiOAuthProvider provider,
    Sub2ApiBindPendingOAuthLoginRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    _requireGuardedProvider(provider);
    final completion = await _requestExecutor
        .publicRequestAllowingRawSuccess<Sub2ApiOAuthPendingCompletion>(
          send: (cancelToken, options, authorization) =>
              _bindPendingLoginForProviderWire(
                provider,
                _bindPendingLoginBody(request),
                cancelToken,
                options,
                authorization,
              ),
          decode: _decodePendingCompletion,
          requestOptions: requestOptions,
        );
    await _persistCompletion(completion);
    return completion;
  }

  @override
  Future<Sub2ApiOAuthPendingCompletion> createPendingAccount(
    Sub2ApiCreatePendingOAuthAccountRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    final completion = await _requestExecutor
        .publicRequestAllowingRawSuccess<Sub2ApiOAuthPendingCompletion>(
          send: (cancelToken, options, authorization) =>
              _service.createPendingAccount(
                _createPendingAccountBody(request),
                cancelToken,
                options,
                authorization,
              ),
          decode: _decodePendingCompletion,
          requestOptions: requestOptions,
        );
    await _persistCompletion(completion);
    return completion;
  }

  @override
  Future<Sub2ApiOAuthPendingCompletion> createPendingAccountForProvider(
    Sub2ApiOAuthProvider provider,
    Sub2ApiCreatePendingOAuthAccountRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    _requireGuardedProvider(provider);
    final completion = await _requestExecutor
        .publicRequestAllowingRawSuccess<Sub2ApiOAuthPendingCompletion>(
          send: (cancelToken, options, authorization) =>
              _createPendingAccountForProviderWire(
                provider,
                _createPendingAccountBody(request),
                cancelToken,
                options,
                authorization,
              ),
          decode: _decodePendingCompletion,
          requestOptions: requestOptions,
        );
    await _persistCompletion(completion);
    return completion;
  }

  @override
  Future<Sub2ApiOAuthPendingCompletion> exchangePendingCompletion({
    Sub2ApiOAuthAdoptionDecision decision =
        const Sub2ApiOAuthAdoptionDecision(),
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    final completion = await _requestExecutor
        .publicRequest<Sub2ApiOAuthPendingCompletion>(
          send: (cancelToken, options, authorization) =>
              _service.exchangePendingCompletion(
                <String, Object?>{
                  if (decision.adoptDisplayName != null)
                    'adopt_display_name': decision.adoptDisplayName,
                  if (decision.adoptAvatar != null)
                    'adopt_avatar': decision.adoptAvatar,
                },
                cancelToken,
                options,
                authorization,
              ),
          decode: _decodePendingCompletion,
          requestOptions: requestOptions,
        );
    await _persistCompletion(completion);
    return completion;
  }

  @override
  Future<Sub2ApiOAuthPendingEmailCodeResult> sendPendingEmailCode(
    Sub2ApiOAuthPendingEmailCodeRequest request, {
    String? locale,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final email = _email(request.email);
    return _requestExecutor
        .publicRequestAllowingRawSuccess<Sub2ApiOAuthPendingEmailCodeResult>(
          send: (cancelToken, options, authorization) =>
              _service.sendPendingEmailCode(
                <String, Object?>{
                  'email': email,
                  ..._captchaBody(request.captcha),
                  if (request.legacyPendingAuthToken != null)
                    'pending_auth_token': request.legacyPendingAuthToken!
                        .reveal(),
                  if (request.legacyPendingOAuthToken != null)
                    'pending_oauth_token': request.legacyPendingOAuthToken!
                        .reveal(),
                },
                cancelToken,
                options,
                authorization,
                locale,
              ),
          decode: _decodePendingEmailCode,
          requestOptions: requestOptions,
        );
  }

  @override
  Future<Sub2ApiOAuthStartInstruction> start(
    Sub2ApiOAuthStartRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final redirect = _redirect(request.redirectTo);
    if (request.provider != Sub2ApiOAuthProvider.weChat &&
        request.weChatMode != null) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'oauth.wechat_mode_not_allowed',
        retryable: false,
      );
    }
    final promoCode = request.promoCode?.trim();
    final affiliateCode = _trimmed(request.affiliateCode);
    return _requestExecutor.publicRequest<Sub2ApiOAuthStartInstruction>(
      send: (cancelToken, options, authorization) => _startWire(
        request,
        redirect: redirect,
        promoCode: promoCode == null || promoCode.isEmpty ? null : promoCode,
        affiliateCode: affiliateCode,
        cancelToken: cancelToken,
        options: options,
        authorization: authorization,
      ),
      decode: (data) => _decodeStart(request.provider, data),
      requestOptions: requestOptions,
    );
  }

  Future<HttpResponse<Object?>> _startWire(
    Sub2ApiOAuthStartRequest request, {
    required String redirect,
    required String? promoCode,
    required String? affiliateCode,
    required CancelToken cancelToken,
    required Options options,
    required String? authorization,
  }) {
    final body = _captchaBody(request.captcha);
    return switch (request.provider) {
      Sub2ApiOAuthProvider.github => _service.startGitHub(
        redirect,
        'login',
        promoCode,
        affiliateCode,
        body,
        cancelToken,
        options,
        authorization,
      ),
      Sub2ApiOAuthProvider.google => _service.startGoogle(
        redirect,
        'login',
        promoCode,
        affiliateCode,
        body,
        cancelToken,
        options,
        authorization,
      ),
      Sub2ApiOAuthProvider.linuxDo => _service.startLinuxDo(
        redirect,
        'login',
        promoCode,
        body,
        cancelToken,
        options,
        authorization,
      ),
      Sub2ApiOAuthProvider.dingTalk => _service.startDingTalk(
        redirect,
        'login',
        promoCode,
        body,
        cancelToken,
        options,
        authorization,
      ),
      Sub2ApiOAuthProvider.weChat => _service.startWeChat(
        redirect,
        'login',
        request.weChatMode?.wireName,
        promoCode,
        body,
        cancelToken,
        options,
        authorization,
      ),
      Sub2ApiOAuthProvider.oidc => _service.startOidc(
        redirect,
        'login',
        promoCode,
        body,
        cancelToken,
        options,
        authorization,
      ),
    };
  }

  Future<HttpResponse<Object?>> _completeRegistrationWire(
    Sub2ApiOAuthProvider provider,
    Map<String, Object?> body,
    CancelToken cancelToken,
    Options options,
    String? authorization,
  ) => switch (provider) {
    Sub2ApiOAuthProvider.github => _service.completeGitHubRegistration(
      body,
      cancelToken,
      options,
      authorization,
    ),
    Sub2ApiOAuthProvider.google => _service.completeGoogleRegistration(
      body,
      cancelToken,
      options,
      authorization,
    ),
    Sub2ApiOAuthProvider.linuxDo => _service.completeLinuxDoRegistration(
      body,
      cancelToken,
      options,
      authorization,
    ),
    Sub2ApiOAuthProvider.oidc => _service.completeOidcRegistration(
      body,
      cancelToken,
      options,
      authorization,
    ),
    Sub2ApiOAuthProvider.weChat => _service.completeWeChatRegistration(
      body,
      cancelToken,
      options,
      authorization,
    ),
    Sub2ApiOAuthProvider.dingTalk => _service.completeDingTalkRegistration(
      body,
      cancelToken,
      options,
      authorization,
    ),
  };

  Future<HttpResponse<Object?>> _createPendingAccountForProviderWire(
    Sub2ApiOAuthProvider provider,
    Map<String, Object?> body,
    CancelToken cancelToken,
    Options options,
    String? authorization,
  ) => switch (provider) {
    Sub2ApiOAuthProvider.linuxDo => _service.createLinuxDoAccount(
      body,
      cancelToken,
      options,
      authorization,
    ),
    Sub2ApiOAuthProvider.oidc => _service.createOidcAccount(
      body,
      cancelToken,
      options,
      authorization,
    ),
    Sub2ApiOAuthProvider.weChat => _service.createWeChatAccount(
      body,
      cancelToken,
      options,
      authorization,
    ),
    Sub2ApiOAuthProvider.dingTalk => _service.createDingTalkAccount(
      body,
      cancelToken,
      options,
      authorization,
    ),
    Sub2ApiOAuthProvider.github ||
    Sub2ApiOAuthProvider.google => throw const Sub2ApiException(
      kind: Sub2ApiFailureKind.validation,
      code: 'oauth.provider_alias_not_supported',
      retryable: false,
    ),
  };

  Future<HttpResponse<Object?>> _bindPendingLoginForProviderWire(
    Sub2ApiOAuthProvider provider,
    Map<String, Object?> body,
    CancelToken cancelToken,
    Options options,
    String? authorization,
  ) => switch (provider) {
    Sub2ApiOAuthProvider.linuxDo => _service.bindLinuxDoLogin(
      body,
      cancelToken,
      options,
      authorization,
    ),
    Sub2ApiOAuthProvider.oidc => _service.bindOidcLogin(
      body,
      cancelToken,
      options,
      authorization,
    ),
    Sub2ApiOAuthProvider.weChat => _service.bindWeChatLogin(
      body,
      cancelToken,
      options,
      authorization,
    ),
    Sub2ApiOAuthProvider.dingTalk => _service.bindDingTalkLogin(
      body,
      cancelToken,
      options,
      authorization,
    ),
    Sub2ApiOAuthProvider.github ||
    Sub2ApiOAuthProvider.google => throw const Sub2ApiException(
      kind: Sub2ApiFailureKind.validation,
      code: 'oauth.provider_alias_not_supported',
      retryable: false,
    ),
  };

  static Map<String, Object?> _captchaBody(Sub2ApiCaptchaProof captcha) =>
      <String, Object?>{
        if (captcha.wireChallengeToken != null)
          'turnstile_token': captcha.wireChallengeToken,
        if (captcha.tencentCaptchaRandstr != null)
          'tencent_captcha_randstr': captcha.tencentCaptchaRandstr,
        if (captcha.tencentCaptchaTicket != null)
          'tencent_captcha_ticket': captcha.tencentCaptchaTicket,
      };

  static Map<String, Object?> _adoptionBody(
    Sub2ApiOAuthAdoptionDecision decision,
  ) => <String, Object?>{
    if (decision.adoptDisplayName != null)
      'adopt_display_name': decision.adoptDisplayName,
    if (decision.adoptAvatar != null) 'adopt_avatar': decision.adoptAvatar,
  };

  static Map<String, Object?> _createPendingAccountBody(
    Sub2ApiCreatePendingOAuthAccountRequest request,
  ) {
    final password = _password(request.password.reveal());
    final verificationCode = request.verificationCode?.reveal();
    if (verificationCode != null &&
        !RegExp(r'^\d{6}$').hasMatch(verificationCode)) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'oauth.invalid_verification_code',
        retryable: false,
      );
    }
    return <String, Object?>{
      'email': _email(request.email),
      'password': password,
      'verify_code': ?verificationCode,
      ..._captchaBody(request.captcha),
      'invitation_code': ?_trimmed(request.invitationCode),
      'aff_code': ?_trimmed(request.affiliateCode),
      ..._adoptionBody(request.adoptionDecision),
    };
  }

  static Map<String, Object?> _bindPendingLoginBody(
    Sub2ApiBindPendingOAuthLoginRequest request,
  ) {
    final password = request.password.reveal();
    if (password.isEmpty) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'oauth.password_required',
        retryable: false,
      );
    }
    return <String, Object?>{
      'email': _email(request.email),
      'password': password,
      ..._adoptionBody(request.adoptionDecision),
    };
  }

  static void _requireGuardedProvider(Sub2ApiOAuthProvider provider) {
    if (provider == Sub2ApiOAuthProvider.github ||
        provider == Sub2ApiOAuthProvider.google) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'oauth.provider_alias_not_supported',
        retryable: false,
      );
    }
  }

  static Sub2ApiOAuthStartInstruction _decodeStart(
    Sub2ApiOAuthProvider provider,
    Object? data,
  ) {
    try {
      return Sub2ApiOAuthStartInstruction(
        authorizeUri: OAuthStartWireDto.fromJson(
          _objectMap(data),
        ).toAuthorizeUri(),
        provider: provider,
        requiresBrowserCookieContinuity: true,
      );
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidOAuthStartResponse;
    }
  }

  Sub2ApiOAuthPendingCompletion _decodePendingCompletion(Object? data) {
    try {
      return OAuthPendingCompletionWireDto.fromJson(
        _objectMap(data, invalidOAuthPendingCompletion),
      ).toPublicModel(scope: _scope);
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidOAuthPendingCompletion;
    }
  }

  Sub2ApiOAuthPendingEmailCodeResult _decodePendingEmailCode(Object? data) {
    final map = _objectMap(data, invalidOAuthPendingEmailCodeResponse);
    try {
      if (map.containsKey('message') || map.containsKey('countdown')) {
        return OAuthPendingEmailCodeWireDto.fromJson(map).toCodeSent();
      }
      final completion = OAuthPendingCompletionWireDto.fromJson(
        map,
      ).toPublicModel(scope: _scope);
      if (completion case Sub2ApiOAuthActionRequired(:final action)) {
        return Sub2ApiOAuthPendingEmailCodeResult.actionRequired(
          action: action,
        );
      }
      throw invalidOAuthPendingEmailCodeResponse;
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidOAuthPendingEmailCodeResponse;
    }
  }

  static String _redirect(String value) {
    final redirect = value.trim();
    if (redirect.length > 2048 ||
        !redirect.startsWith('/') ||
        redirect.startsWith('//')) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'oauth.invalid_redirect',
        retryable: false,
      );
    }
    return redirect;
  }

  static String _email(String value) {
    final email = value.trim().toLowerCase();
    final at = email.indexOf('@');
    if (at <= 0 || at == email.length - 1 || email.contains(RegExp(r'\s'))) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'oauth.invalid_email',
        retryable: false,
      );
    }
    return email;
  }

  static String _password(String value) {
    if (value.length < 6) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: 'oauth.password_too_short',
        retryable: false,
      );
    }
    return value;
  }

  static String _requiredText(String value, String code) {
    final normalized = value.trim();
    if (normalized.isEmpty) {
      throw Sub2ApiException(
        kind: Sub2ApiFailureKind.validation,
        code: code,
        retryable: false,
      );
    }
    return normalized;
  }

  Sub2ApiOAuthBrowserInstruction _browserInstruction(
    Uri uri, {
    bool requiresPreparedBindingCookie = false,
    required bool supportsCaptchaProof,
  }) => Sub2ApiOAuthBrowserInstruction(
    requiresPreparedBindingCookie: requiresPreparedBindingCookie,
    requiresSameUserAgentCookieContext: true,
    supportsCaptchaProof: supportsCaptchaProof,
    uri: uri,
  );

  Uri _browserUri(String path, Map<String, String> query) => _origin.resolveUri(
    Uri(path: path, queryParameters: query.isEmpty ? null : query),
  );

  static bool _hasCaptcha(Sub2ApiCaptchaProof captcha) =>
      captcha.wireChallengeToken != null ||
      captcha.tencentCaptchaRandstr != null ||
      captcha.tencentCaptchaTicket != null;

  static String _loginStartPath(Sub2ApiOAuthProvider provider) =>
      '/api/v1/auth/oauth/${provider.wireName}/start';

  static String _bindingStartPath(Sub2ApiOAuthProvider provider) =>
      '/api/v1/auth/oauth/${provider.wireName}/bind/start';

  Future<void> _persistCompletion(
    Sub2ApiOAuthPendingCompletion completion,
  ) async {
    if (completion case Sub2ApiOAuthAuthenticated(:final session)) {
      await _sessions.replace(session);
    }
  }

  static String? _trimmed(String? value) {
    final normalized = value?.trim();
    return normalized == null || normalized.isEmpty ? null : normalized;
  }

  static Map<String, Object?> _objectMap(
    Object? value, [
    Sub2ApiException failure = invalidOAuthStartResponse,
  ]) {
    if (value is! Map) throw failure;
    final result = <String, Object?>{};
    for (final entry in value.entries) {
      if (entry.key is! String) throw failure;
      result[entry.key as String] = entry.value;
    }
    return result;
  }
}
