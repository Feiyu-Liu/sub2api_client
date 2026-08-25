import 'package:json_annotation/json_annotation.dart';

import '../models/sub2api_capabilities.dart';

part 'sub2api_public_settings_dto.g.dart';

/// Internal fixed-contract DTO for `GET /api/v1/settings/public`.
@JsonSerializable(createToJson: false, checked: true)
final class Sub2ApiPublicSettingsDto {
  const Sub2ApiPublicSettingsDto({
    required this.backendModeEnabled,
    required this.dingtalkOAuthEnabled,
    required this.emailVerifyEnabled,
    required this.githubOAuthEnabled,
    required this.googleOAuthEnabled,
    required this.invitationCodeEnabled,
    required this.linuxDoOAuthEnabled,
    required this.oidcOAuthEnabled,
    required this.passwordResetEnabled,
    required this.paymentEnabled,
    required this.registrationEnabled,
    required this.serverTimezone,
    required this.serverUtcOffset,
    required this.totpEnabled,
    required this.turnstileEnabled,
    required this.turnstileSiteKey,
    required this.version,
    required this.wechatOAuthEnabled,
  });

  factory Sub2ApiPublicSettingsDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiPublicSettingsDtoFromJson(json);

  @JsonKey(name: 'backend_mode_enabled')
  final bool backendModeEnabled;
  @JsonKey(name: 'dingtalk_oauth_enabled')
  final bool dingtalkOAuthEnabled;
  @JsonKey(name: 'email_verify_enabled')
  final bool emailVerifyEnabled;
  @JsonKey(name: 'github_oauth_enabled')
  final bool githubOAuthEnabled;
  @JsonKey(name: 'google_oauth_enabled')
  final bool googleOAuthEnabled;
  @JsonKey(name: 'invitation_code_enabled')
  final bool invitationCodeEnabled;
  @JsonKey(name: 'linuxdo_oauth_enabled')
  final bool linuxDoOAuthEnabled;
  @JsonKey(name: 'oidc_oauth_enabled')
  final bool oidcOAuthEnabled;
  @JsonKey(name: 'password_reset_enabled')
  final bool passwordResetEnabled;
  @JsonKey(name: 'payment_enabled')
  final bool paymentEnabled;
  @JsonKey(name: 'registration_enabled')
  final bool registrationEnabled;
  @JsonKey(name: 'server_timezone')
  final String serverTimezone;
  @JsonKey(name: 'server_utc_offset')
  final String serverUtcOffset;
  @JsonKey(name: 'totp_enabled')
  final bool totpEnabled;
  @JsonKey(name: 'turnstile_enabled')
  final bool turnstileEnabled;
  @JsonKey(name: 'turnstile_site_key')
  final String turnstileSiteKey;
  final String version;
  @JsonKey(name: 'wechat_oauth_enabled')
  final bool wechatOAuthEnabled;
}

extension Sub2ApiPublicSettingsDtoMapping on Sub2ApiPublicSettingsDto {
  /// Converts the wire contract to the stable public capability model.
  Sub2ApiCapabilities toPublicModel() => Sub2ApiCapabilities(
    backendModeEnabled: backendModeEnabled,
    emailVerificationEnabled: emailVerifyEnabled,
    invitationCodeEnabled: invitationCodeEnabled,
    oauth: Sub2ApiOAuthCapabilities(
      dingtalk: dingtalkOAuthEnabled,
      github: githubOAuthEnabled,
      google: googleOAuthEnabled,
      linuxDo: linuxDoOAuthEnabled,
      oidc: oidcOAuthEnabled,
      wechat: wechatOAuthEnabled,
    ),
    passwordResetEnabled: passwordResetEnabled,
    paymentEnabled: paymentEnabled,
    registrationEnabled: registrationEnabled,
    serverTimezone: serverTimezone,
    serverUtcOffset: serverUtcOffset,
    totpEnabled: totpEnabled,
    turnstileEnabled: turnstileEnabled,
    turnstileSiteKey: turnstileSiteKey,
    version: version,
  );
}
