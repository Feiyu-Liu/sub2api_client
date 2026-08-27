import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/models/sub2api_auth_models.dart';
import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/session/sub2api_session.dart';

part 'sub2api_oauth_models.freezed.dart';

/// OAuth login providers with a public start endpoint in v0.1.183.
enum Sub2ApiOAuthProvider {
  github('github'),
  google('google'),
  linuxDo('linuxdo'),
  dingTalk('dingtalk'),
  weChat('wechat'),
  oidc('oidc');

  const Sub2ApiOAuthProvider(this.wireName);

  final String wireName;
}

/// Web OAuth mode used only by the WeChat provider.
enum Sub2ApiWeChatOAuthMode {
  open('open'),
  mp('mp');

  const Sub2ApiWeChatOAuthMode(this.wireName);

  final String wireName;
}

/// Typed request for a provider OAuth login start.
final class Sub2ApiOAuthStartRequest {
  const Sub2ApiOAuthStartRequest({
    required this.provider,
    this.redirectTo = '/dashboard',
    this.captcha = const Sub2ApiCaptchaProof(),
    this.promoCode,
    this.affiliateCode,
    this.weChatMode,
  });

  final String? affiliateCode;
  final Sub2ApiCaptchaProof captcha;
  final String? promoCode;
  final Sub2ApiOAuthProvider provider;
  final String redirectTo;
  final Sub2ApiWeChatOAuthMode? weChatMode;
}

/// Browser navigation facts returned by a provider OAuth start.
final class Sub2ApiOAuthStartInstruction {
  const Sub2ApiOAuthStartInstruction({
    required this.provider,
    required this.authorizeUri,
    required this.requiresBrowserCookieContinuity,
  });

  final Uri authorizeUri;
  final Sub2ApiOAuthProvider provider;

  /// Whether callback success depends on the browser retaining start cookies.
  final bool requiresBrowserCookieContinuity;
}

/// Request for a current-user third-party identity browser bind.
final class Sub2ApiOAuthBindingStartRequest {
  const Sub2ApiOAuthBindingStartRequest({
    required this.provider,
    this.redirectTo = '/profile',
    this.weChatMode,
  });

  final Sub2ApiOAuthProvider provider;
  final String redirectTo;
  final Sub2ApiWeChatOAuthMode? weChatMode;
}

/// Typed browser route facts for a redirect-based OAuth operation.
final class Sub2ApiOAuthBrowserInstruction {
  const Sub2ApiOAuthBrowserInstruction({
    required this.uri,
    required this.requiresSameUserAgentCookieContext,
    required this.requiresPreparedBindingCookie,
    required this.supportsCaptchaProof,
  });

  final bool requiresPreparedBindingCookie;
  final bool requiresSameUserAgentCookieContext;
  final bool supportsCaptchaProof;
  final Uri uri;
}

/// WeChat payment methods accepted by the payment OAuth start route.
enum Sub2ApiWeChatPaymentType {
  wxpay('wxpay'),
  wxpayDirect('wxpay_direct');

  const Sub2ApiWeChatPaymentType(this.wireName);
  final String wireName;
}

/// Order context preserved across WeChat payment OAuth.
enum Sub2ApiOAuthPaymentOrderType {
  balance('balance'),
  subscription('subscription');

  const Sub2ApiOAuthPaymentOrderType(this.wireName);
  final String wireName;
}

/// WeChat authorization scope used for payment OpenID acquisition.
enum Sub2ApiWeChatPaymentScope {
  base('snsapi_base'),
  userInfo('snsapi_userinfo');

  const Sub2ApiWeChatPaymentScope(this.wireName);
  final String wireName;
}

/// Typed query context for the WeChat payment OAuth browser route.
final class Sub2ApiWeChatPaymentOAuthStartRequest {
  const Sub2ApiWeChatPaymentOAuthStartRequest({
    required this.paymentType,
    this.redirectTo = '/purchase',
    this.amount,
    this.orderType,
    this.planId,
    this.scope = Sub2ApiWeChatPaymentScope.base,
  });

  final Sub2ApiDecimal? amount;
  final Sub2ApiOAuthPaymentOrderType? orderType;
  final Sub2ApiWeChatPaymentType paymentType;
  final int? planId;
  final String redirectTo;
  final Sub2ApiWeChatPaymentScope scope;
}

/// Request to send an email code inside a pending OAuth account flow.
final class Sub2ApiOAuthPendingEmailCodeRequest {
  const Sub2ApiOAuthPendingEmailCodeRequest({
    required this.email,
    this.captcha = const Sub2ApiCaptchaProof(),
    this.legacyPendingAuthToken,
    this.legacyPendingOAuthToken,
  });

  final Sub2ApiCaptchaProof captcha;
  final String email;
  final Sub2ApiOAuthPendingToken? legacyPendingAuthToken;
  final Sub2ApiOAuthPendingToken? legacyPendingOAuthToken;

  @override
  String toString() => 'Sub2ApiOAuthPendingEmailCodeRequest(<redacted>)';
}

/// Credentials used to create an account from a pending OAuth identity.
final class Sub2ApiCreatePendingOAuthAccountRequest {
  const Sub2ApiCreatePendingOAuthAccountRequest({
    required this.email,
    required this.password,
    this.verificationCode,
    this.captcha = const Sub2ApiCaptchaProof(),
    this.invitationCode,
    this.affiliateCode,
    this.adoptionDecision = const Sub2ApiOAuthAdoptionDecision(),
  });

  final Sub2ApiOAuthAdoptionDecision adoptionDecision;
  final String? affiliateCode;
  final Sub2ApiCaptchaProof captcha;
  final String email;
  final String? invitationCode;
  final Sub2ApiPassword password;
  final Sub2ApiVerificationCode? verificationCode;

  @override
  String toString() => 'Sub2ApiCreatePendingOAuthAccountRequest(<redacted>)';
}

/// Existing-account credentials used to bind a pending OAuth identity.
final class Sub2ApiBindPendingOAuthLoginRequest {
  const Sub2ApiBindPendingOAuthLoginRequest({
    required this.email,
    required this.password,
    this.adoptionDecision = const Sub2ApiOAuthAdoptionDecision(),
  });

  final Sub2ApiOAuthAdoptionDecision adoptionDecision;
  final String email;
  final Sub2ApiPassword password;

  @override
  String toString() => 'Sub2ApiBindPendingOAuthLoginRequest(<redacted>)';
}

/// Provider-specific legacy registration completion request.
sealed class Sub2ApiCompleteOAuthRegistrationRequest {
  const Sub2ApiCompleteOAuthRegistrationRequest();

  Sub2ApiOAuthProvider get provider;
}

/// GitHub/Google completion, which creates a local password credential.
final class Sub2ApiCompleteEmailOAuthRegistrationRequest
    extends Sub2ApiCompleteOAuthRegistrationRequest {
  const Sub2ApiCompleteEmailOAuthRegistrationRequest({
    required this.provider,
    required this.password,
    this.invitationCode,
    this.affiliateCode,
  }) : assert(
         provider == Sub2ApiOAuthProvider.github ||
             provider == Sub2ApiOAuthProvider.google,
         'Email OAuth completion only supports GitHub or Google.',
       );

  @override
  final Sub2ApiOAuthProvider provider;
  final Sub2ApiPassword password;
  final String? invitationCode;
  final String? affiliateCode;

  @override
  String toString() =>
      'Sub2ApiCompleteEmailOAuthRegistrationRequest(<redacted>)';
}

/// LinuxDo/OIDC/WeChat/DingTalk completion using an invitation code.
final class Sub2ApiCompleteIdentityOAuthRegistrationRequest
    extends Sub2ApiCompleteOAuthRegistrationRequest {
  const Sub2ApiCompleteIdentityOAuthRegistrationRequest({
    required this.provider,
    required this.invitationCode,
    this.affiliateCode,
    this.adoptionDecision = const Sub2ApiOAuthAdoptionDecision(),
  }) : assert(
         provider == Sub2ApiOAuthProvider.linuxDo ||
             provider == Sub2ApiOAuthProvider.oidc ||
             provider == Sub2ApiOAuthProvider.weChat ||
             provider == Sub2ApiOAuthProvider.dingTalk,
         'Identity OAuth completion does not support GitHub or Google.',
       );

  final Sub2ApiOAuthAdoptionDecision adoptionDecision;
  final String? affiliateCode;
  final String invitationCode;
  @override
  final Sub2ApiOAuthProvider provider;
}

/// Result of requesting a pending OAuth email verification code.
@freezed
sealed class Sub2ApiOAuthPendingEmailCodeResult
    with _$Sub2ApiOAuthPendingEmailCodeResult {
  /// A verification code was sent.
  const factory Sub2ApiOAuthPendingEmailCodeResult.codeSent({
    required String message,
    required Duration cooldown,
  }) = Sub2ApiOAuthPendingEmailCodeSent;

  /// The email resolves to an existing account and another action is required.
  const factory Sub2ApiOAuthPendingEmailCodeResult.actionRequired({
    required Sub2ApiOAuthPendingAction action,
  }) = Sub2ApiOAuthPendingEmailActionRequired;
}

/// Optional profile-adoption choices applied during pending OAuth completion.
@freezed
abstract class Sub2ApiOAuthAdoptionDecision
    with _$Sub2ApiOAuthAdoptionDecision {
  const factory Sub2ApiOAuthAdoptionDecision({
    bool? adoptDisplayName,
    bool? adoptAvatar,
  }) = _Sub2ApiOAuthAdoptionDecision;
}

/// Non-terminal action facts returned by a pending OAuth exchange.
@freezed
abstract class Sub2ApiOAuthPendingAction with _$Sub2ApiOAuthPendingAction {
  const factory Sub2ApiOAuthPendingAction({
    String? step,
    String? error,
    String? provider,
    String? intent,
    String? email,
    String? resolvedEmail,
    Uri? redirectUri,
    bool? adoptionRequired,
    String? suggestedDisplayName,
    String? suggestedAvatarUrl,
    bool? createAccountAllowed,
    bool? forceEmailOnSignup,
    bool? emailBindingRequired,
    bool? existingAccountBindable,
    bool? requiresEmailCompletion,
    String? choiceReason,
  }) = _Sub2ApiOAuthPendingAction;
}

/// Result of exchanging the browser-bound pending OAuth session.
@freezed
sealed class Sub2ApiOAuthPendingCompletion
    with _$Sub2ApiOAuthPendingCompletion {
  /// OAuth login issued a normal package session.
  const factory Sub2ApiOAuthPendingCompletion.authenticated({
    required Sub2ApiSession session,
    Uri? redirectUri,
    String? authResult,
  }) = Sub2ApiOAuthAuthenticated;

  /// Existing-account binding requires a separate TOTP challenge.
  const factory Sub2ApiOAuthPendingCompletion.twoFactorRequired({
    required Sub2ApiTwoFactorTemporaryToken temporaryToken,
    required String userEmailMasked,
    Uri? redirectUri,
  }) = Sub2ApiOAuthTwoFactorRequired;

  /// The caller must collect another account, email, invitation, or choice step.
  const factory Sub2ApiOAuthPendingCompletion.actionRequired({
    required Sub2ApiOAuthPendingAction action,
  }) = Sub2ApiOAuthActionRequired;

  /// A current-user identity bind completed without issuing login tokens.
  const factory Sub2ApiOAuthPendingCompletion.bindingCompleted({
    Uri? redirectUri,
    String? authResult,
  }) = Sub2ApiOAuthBindingCompleted;
}
