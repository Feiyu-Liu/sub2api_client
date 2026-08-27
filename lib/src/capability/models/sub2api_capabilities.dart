import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub2api_capabilities.freezed.dart';

/// Publicly advertised OAuth login providers.
@freezed
abstract class Sub2ApiOAuthCapabilities with _$Sub2ApiOAuthCapabilities {
  const factory Sub2ApiOAuthCapabilities({
    required bool dingtalk,
    required bool github,
    required bool google,
    required bool linuxDo,
    required bool oidc,
    required bool wechat,
  }) = _Sub2ApiOAuthCapabilities;
}

/// Server-controlled capabilities returned before authentication.
@freezed
abstract class Sub2ApiCapabilities with _$Sub2ApiCapabilities {
  const factory Sub2ApiCapabilities({
    required bool aliyunCaptchaEnabled,
    required String aliyunCaptchaPrefix,
    required String aliyunCaptchaRegion,
    required String aliyunCaptchaSceneId,
    required bool backendModeEnabled,
    required bool emailVerificationEnabled,
    required bool forceEmailOnThirdPartySignup,
    required bool invitationCodeEnabled,
    required Sub2ApiOAuthCapabilities oauth,
    required bool passkeyEnabled,
    required bool passwordResetEnabled,
    required bool paymentEnabled,
    required bool promoCodeEnabled,
    required bool registrationEmailDomainQuotaEnabled,
    required bool registrationEnabled,
    required String serverTimezone,
    required String serverUtcOffset,
    required bool tencentCaptchaEnabled,
    required String tencentCaptchaAppId,
    required String tencentCaptchaRegion,
    required bool totpEnabled,
    required bool turnstileEnabled,
    required String turnstileSiteKey,
    required String version,
  }) = _Sub2ApiCapabilities;
}
