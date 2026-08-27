// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub2api_public_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sub2ApiPublicSettingsDto _$Sub2ApiPublicSettingsDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'Sub2ApiPublicSettingsDto',
  json,
  ($checkedConvert) {
    final val = Sub2ApiPublicSettingsDto(
      aliyunCaptchaEnabled: $checkedConvert(
        'aliyun_captcha_enabled',
        (v) => v as bool,
      ),
      aliyunCaptchaPrefix: $checkedConvert(
        'aliyun_captcha_prefix',
        (v) => v as String,
      ),
      aliyunCaptchaRegion: $checkedConvert(
        'aliyun_captcha_region',
        (v) => v as String,
      ),
      aliyunCaptchaSceneId: $checkedConvert(
        'aliyun_captcha_scene_id',
        (v) => v as String,
      ),
      backendModeEnabled: $checkedConvert(
        'backend_mode_enabled',
        (v) => v as bool,
      ),
      dingtalkOAuthEnabled: $checkedConvert(
        'dingtalk_oauth_enabled',
        (v) => v as bool,
      ),
      emailVerifyEnabled: $checkedConvert(
        'email_verify_enabled',
        (v) => v as bool,
      ),
      forceEmailOnThirdPartySignup: $checkedConvert(
        'force_email_on_third_party_signup',
        (v) => v as bool,
      ),
      githubOAuthEnabled: $checkedConvert(
        'github_oauth_enabled',
        (v) => v as bool,
      ),
      googleOAuthEnabled: $checkedConvert(
        'google_oauth_enabled',
        (v) => v as bool,
      ),
      invitationCodeEnabled: $checkedConvert(
        'invitation_code_enabled',
        (v) => v as bool,
      ),
      linuxDoOAuthEnabled: $checkedConvert(
        'linuxdo_oauth_enabled',
        (v) => v as bool,
      ),
      oidcOAuthEnabled: $checkedConvert('oidc_oauth_enabled', (v) => v as bool),
      passkeyEnabled: $checkedConvert('passkey_enabled', (v) => v as bool),
      passwordResetEnabled: $checkedConvert(
        'password_reset_enabled',
        (v) => v as bool,
      ),
      paymentEnabled: $checkedConvert('payment_enabled', (v) => v as bool),
      promoCodeEnabled: $checkedConvert('promo_code_enabled', (v) => v as bool),
      registrationEmailDomainQuotaEnabled: $checkedConvert(
        'registration_email_domain_quota_enabled',
        (v) => v as bool,
      ),
      registrationEnabled: $checkedConvert(
        'registration_enabled',
        (v) => v as bool,
      ),
      serverTimezone: $checkedConvert('server_timezone', (v) => v as String),
      serverUtcOffset: $checkedConvert('server_utc_offset', (v) => v as String),
      totpEnabled: $checkedConvert('totp_enabled', (v) => v as bool),
      tencentCaptchaAppId: $checkedConvert(
        'tencent_captcha_app_id',
        (v) => v as String,
      ),
      tencentCaptchaEnabled: $checkedConvert(
        'tencent_captcha_enabled',
        (v) => v as bool,
      ),
      tencentCaptchaRegion: $checkedConvert(
        'tencent_captcha_region',
        (v) => v as String,
      ),
      turnstileEnabled: $checkedConvert('turnstile_enabled', (v) => v as bool),
      turnstileSiteKey: $checkedConvert(
        'turnstile_site_key',
        (v) => v as String,
      ),
      version: $checkedConvert('version', (v) => v as String),
      wechatOAuthEnabled: $checkedConvert(
        'wechat_oauth_enabled',
        (v) => v as bool,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'aliyunCaptchaEnabled': 'aliyun_captcha_enabled',
    'aliyunCaptchaPrefix': 'aliyun_captcha_prefix',
    'aliyunCaptchaRegion': 'aliyun_captcha_region',
    'aliyunCaptchaSceneId': 'aliyun_captcha_scene_id',
    'backendModeEnabled': 'backend_mode_enabled',
    'dingtalkOAuthEnabled': 'dingtalk_oauth_enabled',
    'emailVerifyEnabled': 'email_verify_enabled',
    'forceEmailOnThirdPartySignup': 'force_email_on_third_party_signup',
    'githubOAuthEnabled': 'github_oauth_enabled',
    'googleOAuthEnabled': 'google_oauth_enabled',
    'invitationCodeEnabled': 'invitation_code_enabled',
    'linuxDoOAuthEnabled': 'linuxdo_oauth_enabled',
    'oidcOAuthEnabled': 'oidc_oauth_enabled',
    'passkeyEnabled': 'passkey_enabled',
    'passwordResetEnabled': 'password_reset_enabled',
    'paymentEnabled': 'payment_enabled',
    'promoCodeEnabled': 'promo_code_enabled',
    'registrationEmailDomainQuotaEnabled':
        'registration_email_domain_quota_enabled',
    'registrationEnabled': 'registration_enabled',
    'serverTimezone': 'server_timezone',
    'serverUtcOffset': 'server_utc_offset',
    'totpEnabled': 'totp_enabled',
    'tencentCaptchaAppId': 'tencent_captcha_app_id',
    'tencentCaptchaEnabled': 'tencent_captcha_enabled',
    'tencentCaptchaRegion': 'tencent_captcha_region',
    'turnstileEnabled': 'turnstile_enabled',
    'turnstileSiteKey': 'turnstile_site_key',
    'wechatOAuthEnabled': 'wechat_oauth_enabled',
  },
);
