// GENERATED CODE - DO NOT MODIFY BY HAND
// Generated from Sub2API v0.1.183 / e8cb019fabf8b55199436229044cbf9aa7a82564.
// dart format off

part of 'sub2api_admin_system_settings_models.dart';

abstract final class Sub2ApiAdminSystemSettingFields {
  static const registrationEnabled = Sub2ApiAdminSystemSettingField<bool>._('registration_enabled', _AdminSettingKind.boolean);
  static const emailVerifyEnabled = Sub2ApiAdminSystemSettingField<bool>._('email_verify_enabled', _AdminSettingKind.boolean);
  static const registrationEmailSuffixWhitelist = Sub2ApiAdminSystemSettingField<List<String>>._('registration_email_suffix_whitelist', _AdminSettingKind.stringList);
  static const registrationEmailDomainQuotaEnabled = Sub2ApiAdminSystemSettingField<bool>._('registration_email_domain_quota_enabled', _AdminSettingKind.boolean);
  static const promoCodeEnabled = Sub2ApiAdminSystemSettingField<bool>._('promo_code_enabled', _AdminSettingKind.boolean);
  static const passwordResetEnabled = Sub2ApiAdminSystemSettingField<bool>._('password_reset_enabled', _AdminSettingKind.boolean);
  static const frontendUrl = Sub2ApiAdminSystemSettingField<String>._('frontend_url', _AdminSettingKind.string);
  static const invitationCodeEnabled = Sub2ApiAdminSystemSettingField<bool>._('invitation_code_enabled', _AdminSettingKind.boolean);
  static const totpEnabled = Sub2ApiAdminSystemSettingField<bool>._('totp_enabled', _AdminSettingKind.boolean);
  static const totpEncryptionKeyConfigured = Sub2ApiAdminSystemSettingField<bool>._('totp_encryption_key_configured', _AdminSettingKind.boolean);
  static const passkeyEnabled = Sub2ApiAdminSystemSettingField<bool>._('passkey_enabled', _AdminSettingKind.boolean);
  static const passkeyConfigured = Sub2ApiAdminSystemSettingField<bool>._('passkey_configured', _AdminSettingKind.boolean);
  static const passkeyRpId = Sub2ApiAdminSystemSettingField<String>._('passkey_rp_id', _AdminSettingKind.string);
  static const passkeyRpOrigins = Sub2ApiAdminSystemSettingField<List<String>>._('passkey_rp_origins', _AdminSettingKind.stringList);
  static const sessionBindingEnabled = Sub2ApiAdminSystemSettingField<bool>._('session_binding_enabled', _AdminSettingKind.boolean);
  static const stepUpEnabled = Sub2ApiAdminSystemSettingField<bool>._('step_up_enabled', _AdminSettingKind.boolean);
  static const auditLogRetentionDays = Sub2ApiAdminSystemSettingField<int>._('audit_log_retention_days', _AdminSettingKind.integer);
  static const loginAgreementEnabled = Sub2ApiAdminSystemSettingField<bool>._('login_agreement_enabled', _AdminSettingKind.boolean);
  static const loginAgreementMode = Sub2ApiAdminSystemSettingField<String>._('login_agreement_mode', _AdminSettingKind.string);
  static const loginAgreementUpdatedAt = Sub2ApiAdminSystemSettingField<String>._('login_agreement_updated_at', _AdminSettingKind.string);
  static const loginAgreementDocuments = Sub2ApiAdminSystemSettingField<List<Sub2ApiAdminLoginAgreementDocument>>._('login_agreement_documents', _AdminSettingKind.loginAgreementList);
  static const smtpHost = Sub2ApiAdminSystemSettingField<String>._('smtp_host', _AdminSettingKind.string);
  static const smtpPort = Sub2ApiAdminSystemSettingField<int>._('smtp_port', _AdminSettingKind.integer);
  static const smtpUsername = Sub2ApiAdminSystemSettingField<String>._('smtp_username', _AdminSettingKind.string);
  static const smtpPasswordConfigured = Sub2ApiAdminSystemSettingField<bool>._('smtp_password_configured', _AdminSettingKind.boolean);
  static const smtpFromEmail = Sub2ApiAdminSystemSettingField<String>._('smtp_from_email', _AdminSettingKind.string);
  static const smtpFromName = Sub2ApiAdminSystemSettingField<String>._('smtp_from_name', _AdminSettingKind.string);
  static const smtpUseTls = Sub2ApiAdminSystemSettingField<bool>._('smtp_use_tls', _AdminSettingKind.boolean);
  static const turnstileEnabled = Sub2ApiAdminSystemSettingField<bool>._('turnstile_enabled', _AdminSettingKind.boolean);
  static const turnstileSiteKey = Sub2ApiAdminSystemSettingField<String>._('turnstile_site_key', _AdminSettingKind.string);
  static const turnstileSecretKeyConfigured = Sub2ApiAdminSystemSettingField<bool>._('turnstile_secret_key_configured', _AdminSettingKind.boolean);
  static const tencentCaptchaEnabled = Sub2ApiAdminSystemSettingField<bool>._('tencent_captcha_enabled', _AdminSettingKind.boolean);
  static const tencentCaptchaAppId = Sub2ApiAdminSystemSettingField<String>._('tencent_captcha_app_id', _AdminSettingKind.string);
  static const tencentCaptchaAppSecretKeyConfigured = Sub2ApiAdminSystemSettingField<bool>._('tencent_captcha_app_secret_key_configured', _AdminSettingKind.boolean);
  static const tencentCaptchaCloudSecretIdConfigured = Sub2ApiAdminSystemSettingField<bool>._('tencent_captcha_cloud_secret_id_configured', _AdminSettingKind.boolean);
  static const tencentCaptchaCloudSecretKeyConfigured = Sub2ApiAdminSystemSettingField<bool>._('tencent_captcha_cloud_secret_key_configured', _AdminSettingKind.boolean);
  static const tencentCaptchaRegion = Sub2ApiAdminSystemSettingField<String>._('tencent_captcha_region', _AdminSettingKind.string);
  static const aliyunCaptchaEnabled = Sub2ApiAdminSystemSettingField<bool>._('aliyun_captcha_enabled', _AdminSettingKind.boolean);
  static const aliyunCaptchaAccessKeyId = Sub2ApiAdminSystemSettingField<String>._('aliyun_captcha_access_key_id', _AdminSettingKind.string);
  static const aliyunCaptchaAccessKeySecretConfigured = Sub2ApiAdminSystemSettingField<bool>._('aliyun_captcha_access_key_secret_configured', _AdminSettingKind.boolean);
  static const aliyunCaptchaSceneId = Sub2ApiAdminSystemSettingField<String>._('aliyun_captcha_scene_id', _AdminSettingKind.string);
  static const aliyunCaptchaPrefix = Sub2ApiAdminSystemSettingField<String>._('aliyun_captcha_prefix', _AdminSettingKind.string);
  static const aliyunCaptchaRegion = Sub2ApiAdminSystemSettingField<String>._('aliyun_captcha_region', _AdminSettingKind.string);
  static const apiKeyAclTrustForwardedIp = Sub2ApiAdminSystemSettingField<bool>._('api_key_acl_trust_forwarded_ip', _AdminSettingKind.boolean);
  static const forwardedClientIpHeaders = Sub2ApiAdminSystemSettingField<List<String>>._('forwarded_client_ip_headers', _AdminSettingKind.stringList);
  static const linuxdoConnectEnabled = Sub2ApiAdminSystemSettingField<bool>._('linuxdo_connect_enabled', _AdminSettingKind.boolean);
  static const linuxdoConnectClientId = Sub2ApiAdminSystemSettingField<String>._('linuxdo_connect_client_id', _AdminSettingKind.string);
  static const linuxdoConnectClientSecretConfigured = Sub2ApiAdminSystemSettingField<bool>._('linuxdo_connect_client_secret_configured', _AdminSettingKind.boolean);
  static const linuxdoConnectRedirectUrl = Sub2ApiAdminSystemSettingField<String>._('linuxdo_connect_redirect_url', _AdminSettingKind.string);
  static const dingtalkConnectEnabled = Sub2ApiAdminSystemSettingField<bool>._('dingtalk_connect_enabled', _AdminSettingKind.boolean);
  static const dingtalkConnectClientId = Sub2ApiAdminSystemSettingField<String>._('dingtalk_connect_client_id', _AdminSettingKind.string);
  static const dingtalkConnectClientSecretConfigured = Sub2ApiAdminSystemSettingField<bool>._('dingtalk_connect_client_secret_configured', _AdminSettingKind.boolean);
  static const dingtalkConnectRedirectUrl = Sub2ApiAdminSystemSettingField<String>._('dingtalk_connect_redirect_url', _AdminSettingKind.string);
  static const dingtalkConnectCorpRestrictionPolicy = Sub2ApiAdminSystemSettingField<String>._('dingtalk_connect_corp_restriction_policy', _AdminSettingKind.string);
  static const dingtalkConnectInternalCorpId = Sub2ApiAdminSystemSettingField<String>._('dingtalk_connect_internal_corp_id', _AdminSettingKind.string);
  static const dingtalkConnectBypassRegistration = Sub2ApiAdminSystemSettingField<bool>._('dingtalk_connect_bypass_registration', _AdminSettingKind.boolean);
  static const dingtalkConnectSyncCorpEmail = Sub2ApiAdminSystemSettingField<bool>._('dingtalk_connect_sync_corp_email', _AdminSettingKind.boolean);
  static const dingtalkConnectSyncDisplayName = Sub2ApiAdminSystemSettingField<bool>._('dingtalk_connect_sync_display_name', _AdminSettingKind.boolean);
  static const dingtalkConnectSyncDept = Sub2ApiAdminSystemSettingField<bool>._('dingtalk_connect_sync_dept', _AdminSettingKind.boolean);
  static const dingtalkConnectSyncCorpEmailAttrKey = Sub2ApiAdminSystemSettingField<String>._('dingtalk_connect_sync_corp_email_attr_key', _AdminSettingKind.string);
  static const dingtalkConnectSyncDisplayNameAttrKey = Sub2ApiAdminSystemSettingField<String>._('dingtalk_connect_sync_display_name_attr_key', _AdminSettingKind.string);
  static const dingtalkConnectSyncDeptAttrKey = Sub2ApiAdminSystemSettingField<String>._('dingtalk_connect_sync_dept_attr_key', _AdminSettingKind.string);
  static const dingtalkConnectSyncCorpEmailAttrName = Sub2ApiAdminSystemSettingField<String>._('dingtalk_connect_sync_corp_email_attr_name', _AdminSettingKind.string);
  static const dingtalkConnectSyncDisplayNameAttrName = Sub2ApiAdminSystemSettingField<String>._('dingtalk_connect_sync_display_name_attr_name', _AdminSettingKind.string);
  static const dingtalkConnectSyncDeptAttrName = Sub2ApiAdminSystemSettingField<String>._('dingtalk_connect_sync_dept_attr_name', _AdminSettingKind.string);
  static const wechatConnectEnabled = Sub2ApiAdminSystemSettingField<bool>._('wechat_connect_enabled', _AdminSettingKind.boolean);
  static const wechatConnectAppId = Sub2ApiAdminSystemSettingField<String>._('wechat_connect_app_id', _AdminSettingKind.string);
  static const wechatConnectAppSecretConfigured = Sub2ApiAdminSystemSettingField<bool>._('wechat_connect_app_secret_configured', _AdminSettingKind.boolean);
  static const wechatConnectOpenAppId = Sub2ApiAdminSystemSettingField<String>._('wechat_connect_open_app_id', _AdminSettingKind.string);
  static const wechatConnectOpenAppSecretConfigured = Sub2ApiAdminSystemSettingField<bool>._('wechat_connect_open_app_secret_configured', _AdminSettingKind.boolean);
  static const wechatConnectMpAppId = Sub2ApiAdminSystemSettingField<String>._('wechat_connect_mp_app_id', _AdminSettingKind.string);
  static const wechatConnectMpAppSecretConfigured = Sub2ApiAdminSystemSettingField<bool>._('wechat_connect_mp_app_secret_configured', _AdminSettingKind.boolean);
  static const wechatConnectMobileAppId = Sub2ApiAdminSystemSettingField<String>._('wechat_connect_mobile_app_id', _AdminSettingKind.string);
  static const wechatConnectMobileAppSecretConfigured = Sub2ApiAdminSystemSettingField<bool>._('wechat_connect_mobile_app_secret_configured', _AdminSettingKind.boolean);
  static const wechatConnectOpenEnabled = Sub2ApiAdminSystemSettingField<bool>._('wechat_connect_open_enabled', _AdminSettingKind.boolean);
  static const wechatConnectMpEnabled = Sub2ApiAdminSystemSettingField<bool>._('wechat_connect_mp_enabled', _AdminSettingKind.boolean);
  static const wechatConnectMobileEnabled = Sub2ApiAdminSystemSettingField<bool>._('wechat_connect_mobile_enabled', _AdminSettingKind.boolean);
  static const wechatConnectMode = Sub2ApiAdminSystemSettingField<String>._('wechat_connect_mode', _AdminSettingKind.string);
  static const wechatConnectScopes = Sub2ApiAdminSystemSettingField<String>._('wechat_connect_scopes', _AdminSettingKind.string);
  static const wechatConnectRedirectUrl = Sub2ApiAdminSystemSettingField<String>._('wechat_connect_redirect_url', _AdminSettingKind.string);
  static const wechatConnectFrontendRedirectUrl = Sub2ApiAdminSystemSettingField<String>._('wechat_connect_frontend_redirect_url', _AdminSettingKind.string);
  static const oidcConnectEnabled = Sub2ApiAdminSystemSettingField<bool>._('oidc_connect_enabled', _AdminSettingKind.boolean);
  static const oidcConnectProviderName = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_provider_name', _AdminSettingKind.string);
  static const oidcConnectClientId = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_client_id', _AdminSettingKind.string);
  static const oidcConnectClientSecretConfigured = Sub2ApiAdminSystemSettingField<bool>._('oidc_connect_client_secret_configured', _AdminSettingKind.boolean);
  static const oidcConnectIssuerUrl = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_issuer_url', _AdminSettingKind.string);
  static const oidcConnectDiscoveryUrl = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_discovery_url', _AdminSettingKind.string);
  static const oidcConnectAuthorizeUrl = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_authorize_url', _AdminSettingKind.string);
  static const oidcConnectTokenUrl = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_token_url', _AdminSettingKind.string);
  static const oidcConnectUserinfoUrl = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_userinfo_url', _AdminSettingKind.string);
  static const oidcConnectJwksUrl = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_jwks_url', _AdminSettingKind.string);
  static const oidcConnectScopes = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_scopes', _AdminSettingKind.string);
  static const oidcConnectRedirectUrl = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_redirect_url', _AdminSettingKind.string);
  static const oidcConnectFrontendRedirectUrl = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_frontend_redirect_url', _AdminSettingKind.string);
  static const oidcConnectTokenAuthMethod = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_token_auth_method', _AdminSettingKind.string);
  static const oidcConnectUsePkce = Sub2ApiAdminSystemSettingField<bool>._('oidc_connect_use_pkce', _AdminSettingKind.boolean);
  static const oidcConnectValidateIdToken = Sub2ApiAdminSystemSettingField<bool>._('oidc_connect_validate_id_token', _AdminSettingKind.boolean);
  static const oidcConnectAllowedSigningAlgs = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_allowed_signing_algs', _AdminSettingKind.string);
  static const oidcConnectClockSkewSeconds = Sub2ApiAdminSystemSettingField<int>._('oidc_connect_clock_skew_seconds', _AdminSettingKind.integer);
  static const oidcConnectRequireEmailVerified = Sub2ApiAdminSystemSettingField<bool>._('oidc_connect_require_email_verified', _AdminSettingKind.boolean);
  static const oidcConnectUserinfoEmailPath = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_userinfo_email_path', _AdminSettingKind.string);
  static const oidcConnectUserinfoIdPath = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_userinfo_id_path', _AdminSettingKind.string);
  static const oidcConnectUserinfoUsernamePath = Sub2ApiAdminSystemSettingField<String>._('oidc_connect_userinfo_username_path', _AdminSettingKind.string);
  static const githubOauthEnabled = Sub2ApiAdminSystemSettingField<bool>._('github_oauth_enabled', _AdminSettingKind.boolean);
  static const githubOauthClientId = Sub2ApiAdminSystemSettingField<String>._('github_oauth_client_id', _AdminSettingKind.string);
  static const githubOauthClientSecretConfigured = Sub2ApiAdminSystemSettingField<bool>._('github_oauth_client_secret_configured', _AdminSettingKind.boolean);
  static const githubOauthRedirectUrl = Sub2ApiAdminSystemSettingField<String>._('github_oauth_redirect_url', _AdminSettingKind.string);
  static const githubOauthFrontendRedirectUrl = Sub2ApiAdminSystemSettingField<String>._('github_oauth_frontend_redirect_url', _AdminSettingKind.string);
  static const googleOauthEnabled = Sub2ApiAdminSystemSettingField<bool>._('google_oauth_enabled', _AdminSettingKind.boolean);
  static const googleOauthClientId = Sub2ApiAdminSystemSettingField<String>._('google_oauth_client_id', _AdminSettingKind.string);
  static const googleOauthClientSecretConfigured = Sub2ApiAdminSystemSettingField<bool>._('google_oauth_client_secret_configured', _AdminSettingKind.boolean);
  static const googleOauthRedirectUrl = Sub2ApiAdminSystemSettingField<String>._('google_oauth_redirect_url', _AdminSettingKind.string);
  static const googleOauthFrontendRedirectUrl = Sub2ApiAdminSystemSettingField<String>._('google_oauth_frontend_redirect_url', _AdminSettingKind.string);
  static const siteName = Sub2ApiAdminSystemSettingField<String>._('site_name', _AdminSettingKind.string);
  static const siteLogo = Sub2ApiAdminSystemSettingField<String>._('site_logo', _AdminSettingKind.string);
  static const siteSubtitle = Sub2ApiAdminSystemSettingField<String>._('site_subtitle', _AdminSettingKind.string);
  static const apiBaseUrl = Sub2ApiAdminSystemSettingField<String>._('api_base_url', _AdminSettingKind.string);
  static const contactInfo = Sub2ApiAdminSystemSettingField<String>._('contact_info', _AdminSettingKind.string);
  static const docUrl = Sub2ApiAdminSystemSettingField<String>._('doc_url', _AdminSettingKind.string);
  static const homeContent = Sub2ApiAdminSystemSettingField<String>._('home_content', _AdminSettingKind.string);
  static const compactHomeEnabled = Sub2ApiAdminSystemSettingField<bool>._('compact_home_enabled', _AdminSettingKind.boolean);
  static const hideCcsImportButton = Sub2ApiAdminSystemSettingField<bool>._('hide_ccs_import_button', _AdminSettingKind.boolean);
  static const purchaseSubscriptionEnabled = Sub2ApiAdminSystemSettingField<bool>._('purchase_subscription_enabled', _AdminSettingKind.boolean);
  static const purchaseSubscriptionUrl = Sub2ApiAdminSystemSettingField<String>._('purchase_subscription_url', _AdminSettingKind.string);
  static const tableDefaultPageSize = Sub2ApiAdminSystemSettingField<int>._('table_default_page_size', _AdminSettingKind.integer);
  static const tablePageSizeOptions = Sub2ApiAdminSystemSettingField<List<int>>._('table_page_size_options', _AdminSettingKind.intList);
  static const customMenuItems = Sub2ApiAdminSystemSettingField<List<Sub2ApiAdminCustomMenuItem>>._('custom_menu_items', _AdminSettingKind.customMenuList);
  static const customEndpoints = Sub2ApiAdminSystemSettingField<List<Sub2ApiAdminCustomEndpoint>>._('custom_endpoints', _AdminSettingKind.customEndpointList);
  static const defaultConcurrency = Sub2ApiAdminSystemSettingField<int>._('default_concurrency', _AdminSettingKind.integer);
  static const defaultBalance = Sub2ApiAdminSystemSettingField<Sub2ApiDecimal>._('default_balance', _AdminSettingKind.decimal);
  static const affiliateRebateRate = Sub2ApiAdminSystemSettingField<Sub2ApiDecimal>._('affiliate_rebate_rate', _AdminSettingKind.decimal);
  static const affiliateRebateFreezeHours = Sub2ApiAdminSystemSettingField<int>._('affiliate_rebate_freeze_hours', _AdminSettingKind.integer);
  static const affiliateRebateDurationDays = Sub2ApiAdminSystemSettingField<int>._('affiliate_rebate_duration_days', _AdminSettingKind.integer);
  static const affiliateRebatePerInviteeCap = Sub2ApiAdminSystemSettingField<Sub2ApiDecimal>._('affiliate_rebate_per_invitee_cap', _AdminSettingKind.decimal);
  static const affiliateAdminRechargeEnabled = Sub2ApiAdminSystemSettingField<bool>._('affiliate_admin_recharge_enabled', _AdminSettingKind.boolean);
  static const defaultUserRpmLimit = Sub2ApiAdminSystemSettingField<int>._('default_user_rpm_limit', _AdminSettingKind.integer);
  static const defaultSubscriptions = Sub2ApiAdminSystemSettingField<List<Sub2ApiAdminDefaultSubscriptionSetting>>._('default_subscriptions', _AdminSettingKind.defaultSubscriptionList);
  static const enableModelFallback = Sub2ApiAdminSystemSettingField<bool>._('enable_model_fallback', _AdminSettingKind.boolean);
  static const fallbackModelAnthropic = Sub2ApiAdminSystemSettingField<String>._('fallback_model_anthropic', _AdminSettingKind.string);
  static const fallbackModelOpenai = Sub2ApiAdminSystemSettingField<String>._('fallback_model_openai', _AdminSettingKind.string);
  static const fallbackModelGemini = Sub2ApiAdminSystemSettingField<String>._('fallback_model_gemini', _AdminSettingKind.string);
  static const fallbackModelAntigravity = Sub2ApiAdminSystemSettingField<String>._('fallback_model_antigravity', _AdminSettingKind.string);
  static const enableIdentityPatch = Sub2ApiAdminSystemSettingField<bool>._('enable_identity_patch', _AdminSettingKind.boolean);
  static const identityPatchPrompt = Sub2ApiAdminSystemSettingField<String>._('identity_patch_prompt', _AdminSettingKind.string);
  static const opsMonitoringEnabled = Sub2ApiAdminSystemSettingField<bool>._('ops_monitoring_enabled', _AdminSettingKind.boolean);
  static const opsRealtimeMonitoringEnabled = Sub2ApiAdminSystemSettingField<bool>._('ops_realtime_monitoring_enabled', _AdminSettingKind.boolean);
  static const opsQueryModeDefault = Sub2ApiAdminSystemSettingField<String>._('ops_query_mode_default', _AdminSettingKind.string);
  static const opsMetricsIntervalSeconds = Sub2ApiAdminSystemSettingField<int>._('ops_metrics_interval_seconds', _AdminSettingKind.integer);
  static const minClaudeCodeVersion = Sub2ApiAdminSystemSettingField<String>._('min_claude_code_version', _AdminSettingKind.string);
  static const maxClaudeCodeVersion = Sub2ApiAdminSystemSettingField<String>._('max_claude_code_version', _AdminSettingKind.string);
  static const allowUngroupedKeyScheduling = Sub2ApiAdminSystemSettingField<bool>._('allow_ungrouped_key_scheduling', _AdminSettingKind.boolean);
  static const backendModeEnabled = Sub2ApiAdminSystemSettingField<bool>._('backend_mode_enabled', _AdminSettingKind.boolean);
  static const enableFingerprintUnification = Sub2ApiAdminSystemSettingField<bool>._('enable_fingerprint_unification', _AdminSettingKind.boolean);
  static const enableMetadataPassthrough = Sub2ApiAdminSystemSettingField<bool>._('enable_metadata_passthrough', _AdminSettingKind.boolean);
  static const enableCchSigning = Sub2ApiAdminSystemSettingField<bool>._('enable_cch_signing', _AdminSettingKind.boolean);
  static const enableClaudeOauthSystemPromptInjection = Sub2ApiAdminSystemSettingField<bool>._('enable_claude_oauth_system_prompt_injection', _AdminSettingKind.boolean);
  static const claudeOauthSystemPrompt = Sub2ApiAdminSystemSettingField<Sub2ApiAdminSettingSecret>._('claude_oauth_system_prompt', _AdminSettingKind.secret);
  static const claudeOauthSystemPromptBlocks = Sub2ApiAdminSystemSettingField<Sub2ApiAdminSettingSecret>._('claude_oauth_system_prompt_blocks', _AdminSettingKind.secret);
  static const enableAnthropicCacheTtl1hInjection = Sub2ApiAdminSystemSettingField<bool>._('enable_anthropic_cache_ttl_1h_injection', _AdminSettingKind.boolean);
  static const rewriteMessageCacheControl = Sub2ApiAdminSystemSettingField<bool>._('rewrite_message_cache_control', _AdminSettingKind.boolean);
  static const enableClientDatelineNormalization = Sub2ApiAdminSystemSettingField<bool>._('enable_client_dateline_normalization', _AdminSettingKind.boolean);
  static const antigravityUserAgentVersion = Sub2ApiAdminSystemSettingField<String>._('antigravity_user_agent_version', _AdminSettingKind.string);
  static const openaiCodexUserAgent = Sub2ApiAdminSystemSettingField<String>._('openai_codex_user_agent', _AdminSettingKind.string);
  static const openaiCodexClientVersion = Sub2ApiAdminSystemSettingField<String>._('openai_codex_client_version', _AdminSettingKind.string);
  static const openaiCodexClientVersionSynced = Sub2ApiAdminSystemSettingField<String>._('openai_codex_client_version_synced', _AdminSettingKind.string);
  static const openaiCodexVersionAutoSyncEnabled = Sub2ApiAdminSystemSettingField<bool>._('openai_codex_version_auto_sync_enabled', _AdminSettingKind.boolean);
  static const minCodexVersion = Sub2ApiAdminSystemSettingField<String>._('min_codex_version', _AdminSettingKind.string);
  static const maxCodexVersion = Sub2ApiAdminSystemSettingField<String>._('max_codex_version', _AdminSettingKind.string);
  static const codexCliOnlyBlacklist = Sub2ApiAdminSystemSettingField<String>._('codex_cli_only_blacklist', _AdminSettingKind.string);
  static const codexCliOnlyWhitelist = Sub2ApiAdminSystemSettingField<String>._('codex_cli_only_whitelist', _AdminSettingKind.string);
  static const codexCliOnlyAllowAppServerClients = Sub2ApiAdminSystemSettingField<bool>._('codex_cli_only_allow_app_server_clients', _AdminSettingKind.boolean);
  static const codexCliOnlyEngineFingerprintSignals = Sub2ApiAdminSystemSettingField<String>._('codex_cli_only_engine_fingerprint_signals', _AdminSettingKind.string);
  static const webSearchEmulationEnabled = Sub2ApiAdminSystemSettingField<bool>._('web_search_emulation_enabled', _AdminSettingKind.boolean);
  static const paymentVisibleMethodAlipaySource = Sub2ApiAdminSystemSettingField<String>._('payment_visible_method_alipay_source', _AdminSettingKind.string);
  static const paymentVisibleMethodWxpaySource = Sub2ApiAdminSystemSettingField<String>._('payment_visible_method_wxpay_source', _AdminSettingKind.string);
  static const paymentVisibleMethodAlipayEnabled = Sub2ApiAdminSystemSettingField<bool>._('payment_visible_method_alipay_enabled', _AdminSettingKind.boolean);
  static const paymentVisibleMethodWxpayEnabled = Sub2ApiAdminSystemSettingField<bool>._('payment_visible_method_wxpay_enabled', _AdminSettingKind.boolean);
  static const openaiLowUpstreamRatePriorityEnabled = Sub2ApiAdminSystemSettingField<bool>._('openai_low_upstream_rate_priority_enabled', _AdminSettingKind.boolean);
  static const openaiOauthSchedulingRateMultiplier = Sub2ApiAdminSystemSettingField<Sub2ApiDecimal>._('openai_oauth_scheduling_rate_multiplier', _AdminSettingKind.decimal);
  static const openaiAdvancedSchedulerEnabled = Sub2ApiAdminSystemSettingField<bool>._('openai_advanced_scheduler_enabled', _AdminSettingKind.boolean);
  static const openaiAdvancedSchedulerStickyWeightedEnabled = Sub2ApiAdminSystemSettingField<bool>._('openai_advanced_scheduler_sticky_weighted_enabled', _AdminSettingKind.boolean);
  static const openaiAdvancedSchedulerSubscriptionPriorityEnabled = Sub2ApiAdminSystemSettingField<bool>._('openai_advanced_scheduler_subscription_priority_enabled', _AdminSettingKind.boolean);
  static const openaiAdvancedSchedulerLbTopK = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_lb_top_k', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightPriority = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_weight_priority', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightLoad = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_weight_load', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightQueue = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_weight_queue', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightErrorRate = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_weight_error_rate', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightTtft = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_weight_ttft', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightReset = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_weight_reset', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightQuotaHeadroom = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_weight_quota_headroom', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightUpstreamCost = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_weight_upstream_cost', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightPreviousResponse = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_weight_previous_response', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightSessionSticky = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_weight_session_sticky', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerEffectiveLbTopK = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_effective_lb_top_k', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerEffectiveWeightPriority = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_effective_weight_priority', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerEffectiveWeightLoad = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_effective_weight_load', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerEffectiveWeightQueue = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_effective_weight_queue', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerEffectiveWeightErrorRate = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_effective_weight_error_rate', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerEffectiveWeightTtft = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_effective_weight_ttft', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerEffectiveWeightReset = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_effective_weight_reset', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerEffectiveWeightQuotaHeadroom = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_effective_weight_quota_headroom', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerEffectiveWeightUpstreamCost = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_effective_weight_upstream_cost', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerEffectiveWeightPreviousResponse = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_effective_weight_previous_response', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerEffectiveWeightSessionSticky = Sub2ApiAdminSystemSettingField<String>._('openai_advanced_scheduler_effective_weight_session_sticky', _AdminSettingKind.string);
  static const paymentEnabled = Sub2ApiAdminSystemSettingField<bool>._('payment_enabled', _AdminSettingKind.boolean);
  static const paymentMinAmount = Sub2ApiAdminSystemSettingField<Sub2ApiDecimal>._('payment_min_amount', _AdminSettingKind.decimal);
  static const paymentMaxAmount = Sub2ApiAdminSystemSettingField<Sub2ApiDecimal>._('payment_max_amount', _AdminSettingKind.decimal);
  static const paymentDailyLimit = Sub2ApiAdminSystemSettingField<Sub2ApiDecimal>._('payment_daily_limit', _AdminSettingKind.decimal);
  static const paymentOrderTimeoutMinutes = Sub2ApiAdminSystemSettingField<int>._('payment_order_timeout_minutes', _AdminSettingKind.integer);
  static const paymentMaxPendingOrders = Sub2ApiAdminSystemSettingField<int>._('payment_max_pending_orders', _AdminSettingKind.integer);
  static const paymentEnabledTypes = Sub2ApiAdminSystemSettingField<List<String>>._('payment_enabled_types', _AdminSettingKind.stringList);
  static const paymentBalanceDisabled = Sub2ApiAdminSystemSettingField<bool>._('payment_balance_disabled', _AdminSettingKind.boolean);
  static const paymentBalanceRechargeMultiplier = Sub2ApiAdminSystemSettingField<Sub2ApiDecimal>._('payment_balance_recharge_multiplier', _AdminSettingKind.decimal);
  static const paymentSubscriptionUsdToCnyRate = Sub2ApiAdminSystemSettingField<Sub2ApiDecimal>._('payment_subscription_usd_to_cny_rate', _AdminSettingKind.decimal);
  static const paymentRechargeFeeRate = Sub2ApiAdminSystemSettingField<Sub2ApiDecimal>._('payment_recharge_fee_rate', _AdminSettingKind.decimal);
  static const paymentLoadBalanceStrategy = Sub2ApiAdminSystemSettingField<String>._('payment_load_balance_strategy', _AdminSettingKind.string);
  static const paymentProductNamePrefix = Sub2ApiAdminSystemSettingField<String>._('payment_product_name_prefix', _AdminSettingKind.string);
  static const paymentProductNameSuffix = Sub2ApiAdminSystemSettingField<String>._('payment_product_name_suffix', _AdminSettingKind.string);
  static const paymentHelpImageUrl = Sub2ApiAdminSystemSettingField<String>._('payment_help_image_url', _AdminSettingKind.string);
  static const paymentHelpText = Sub2ApiAdminSystemSettingField<String>._('payment_help_text', _AdminSettingKind.string);
  static const paymentCancelRateLimitEnabled = Sub2ApiAdminSystemSettingField<bool>._('payment_cancel_rate_limit_enabled', _AdminSettingKind.boolean);
  static const paymentCancelRateLimitMax = Sub2ApiAdminSystemSettingField<int>._('payment_cancel_rate_limit_max', _AdminSettingKind.integer);
  static const paymentCancelRateLimitWindow = Sub2ApiAdminSystemSettingField<int>._('payment_cancel_rate_limit_window', _AdminSettingKind.integer);
  static const paymentCancelRateLimitUnit = Sub2ApiAdminSystemSettingField<String>._('payment_cancel_rate_limit_unit', _AdminSettingKind.string);
  static const paymentCancelRateLimitWindowMode = Sub2ApiAdminSystemSettingField<String>._('payment_cancel_rate_limit_window_mode', _AdminSettingKind.string);
  static const paymentAlipayForceQrcode = Sub2ApiAdminSystemSettingField<bool>._('payment_alipay_force_qrcode', _AdminSettingKind.boolean);
  static const paymentAlipayMobilePrecreateDeepLink = Sub2ApiAdminSystemSettingField<bool>._('payment_alipay_mobile_precreate_deep_link', _AdminSettingKind.boolean);
  static const balanceLowNotifyEnabled = Sub2ApiAdminSystemSettingField<bool>._('balance_low_notify_enabled', _AdminSettingKind.boolean);
  static const balanceLowNotifyThreshold = Sub2ApiAdminSystemSettingField<Sub2ApiDecimal>._('balance_low_notify_threshold', _AdminSettingKind.decimal);
  static const balanceLowNotifyRechargeUrl = Sub2ApiAdminSystemSettingField<String>._('balance_low_notify_recharge_url', _AdminSettingKind.string);
  static const subscriptionExpiryNotifyEnabled = Sub2ApiAdminSystemSettingField<bool>._('subscription_expiry_notify_enabled', _AdminSettingKind.boolean);
  static const accountQuotaNotifyEnabled = Sub2ApiAdminSystemSettingField<bool>._('account_quota_notify_enabled', _AdminSettingKind.boolean);
  static const accountQuotaNotifyEmails = Sub2ApiAdminSystemSettingField<List<Sub2ApiAdminNotifyEmailEntry>>._('account_quota_notify_emails', _AdminSettingKind.notifyEmailList);
  static const channelMonitorEnabled = Sub2ApiAdminSystemSettingField<bool>._('channel_monitor_enabled', _AdminSettingKind.boolean);
  static const channelMonitorMode = Sub2ApiAdminSystemSettingField<String>._('channel_monitor_mode', _AdminSettingKind.string);
  static const channelMonitorDefaultIntervalSeconds = Sub2ApiAdminSystemSettingField<int>._('channel_monitor_default_interval_seconds', _AdminSettingKind.integer);
  static const channelMonitorHideThroughput = Sub2ApiAdminSystemSettingField<bool>._('channel_monitor_hide_throughput', _AdminSettingKind.boolean);
  static const channelMonitorShowQuota = Sub2ApiAdminSystemSettingField<bool>._('channel_monitor_show_quota', _AdminSettingKind.boolean);
  static const grokDefaultTextModel = Sub2ApiAdminSystemSettingField<String>._('grok_default_text_model', _AdminSettingKind.string);
  static const grokCrossClientModelMapEnabled = Sub2ApiAdminSystemSettingField<bool>._('grok_cross_client_model_map_enabled', _AdminSettingKind.boolean);
  static const grokDefaultBaseUrlMode = Sub2ApiAdminSystemSettingField<String>._('grok_default_base_url_mode', _AdminSettingKind.string);
  static const availableChannelsEnabled = Sub2ApiAdminSystemSettingField<bool>._('available_channels_enabled', _AdminSettingKind.boolean);
  static const modelPlazaEnabled = Sub2ApiAdminSystemSettingField<bool>._('model_plaza_enabled', _AdminSettingKind.boolean);
  static const modelPlazaRequireAuth = Sub2ApiAdminSystemSettingField<bool>._('model_plaza_require_auth', _AdminSettingKind.boolean);
  static const modelPlazaDescription = Sub2ApiAdminSystemSettingField<String>._('model_plaza_description', _AdminSettingKind.string);
  static const pluginManagementEnabled = Sub2ApiAdminSystemSettingField<bool>._('plugin_management_enabled', _AdminSettingKind.boolean);
  static const riskControlEnabled = Sub2ApiAdminSystemSettingField<bool>._('risk_control_enabled', _AdminSettingKind.boolean);
  static const cyberSessionBlockEnabled = Sub2ApiAdminSystemSettingField<bool>._('cyber_session_block_enabled', _AdminSettingKind.boolean);
  static const cyberSessionBlockTtlSeconds = Sub2ApiAdminSystemSettingField<int>._('cyber_session_block_ttl_seconds', _AdminSettingKind.integer);
  static const affiliateEnabled = Sub2ApiAdminSystemSettingField<bool>._('affiliate_enabled', _AdminSettingKind.boolean);
  static const openaiFastPolicySettings = Sub2ApiAdminSystemSettingField<Sub2ApiAdminOpenAIFastPolicySettings?>._('openai_fast_policy_settings', _AdminSettingKind.openAIFastPolicy);
  static const defaultPlatformQuotas = Sub2ApiAdminSystemSettingField<Map<String, Sub2ApiAdminPlatformQuota>>._('default_platform_quotas', _AdminSettingKind.quotaMap);
  static const accountSchedulingThresholds = Sub2ApiAdminSystemSettingField<Map<String, int>>._('account_scheduling_thresholds', _AdminSettingKind.intMap);
  static const allowUserViewErrorRequests = Sub2ApiAdminSystemSettingField<bool>._('allow_user_view_error_requests', _AdminSettingKind.boolean);
}

const _adminSystemSettingFields = <Sub2ApiAdminSystemSettingField<Object?>>[
  Sub2ApiAdminSystemSettingFields.registrationEnabled,
  Sub2ApiAdminSystemSettingFields.emailVerifyEnabled,
  Sub2ApiAdminSystemSettingFields.registrationEmailSuffixWhitelist,
  Sub2ApiAdminSystemSettingFields.registrationEmailDomainQuotaEnabled,
  Sub2ApiAdminSystemSettingFields.promoCodeEnabled,
  Sub2ApiAdminSystemSettingFields.passwordResetEnabled,
  Sub2ApiAdminSystemSettingFields.frontendUrl,
  Sub2ApiAdminSystemSettingFields.invitationCodeEnabled,
  Sub2ApiAdminSystemSettingFields.totpEnabled,
  Sub2ApiAdminSystemSettingFields.totpEncryptionKeyConfigured,
  Sub2ApiAdminSystemSettingFields.passkeyEnabled,
  Sub2ApiAdminSystemSettingFields.passkeyConfigured,
  Sub2ApiAdminSystemSettingFields.passkeyRpId,
  Sub2ApiAdminSystemSettingFields.passkeyRpOrigins,
  Sub2ApiAdminSystemSettingFields.sessionBindingEnabled,
  Sub2ApiAdminSystemSettingFields.stepUpEnabled,
  Sub2ApiAdminSystemSettingFields.auditLogRetentionDays,
  Sub2ApiAdminSystemSettingFields.loginAgreementEnabled,
  Sub2ApiAdminSystemSettingFields.loginAgreementMode,
  Sub2ApiAdminSystemSettingFields.loginAgreementUpdatedAt,
  Sub2ApiAdminSystemSettingFields.loginAgreementDocuments,
  Sub2ApiAdminSystemSettingFields.smtpHost,
  Sub2ApiAdminSystemSettingFields.smtpPort,
  Sub2ApiAdminSystemSettingFields.smtpUsername,
  Sub2ApiAdminSystemSettingFields.smtpPasswordConfigured,
  Sub2ApiAdminSystemSettingFields.smtpFromEmail,
  Sub2ApiAdminSystemSettingFields.smtpFromName,
  Sub2ApiAdminSystemSettingFields.smtpUseTls,
  Sub2ApiAdminSystemSettingFields.turnstileEnabled,
  Sub2ApiAdminSystemSettingFields.turnstileSiteKey,
  Sub2ApiAdminSystemSettingFields.turnstileSecretKeyConfigured,
  Sub2ApiAdminSystemSettingFields.tencentCaptchaEnabled,
  Sub2ApiAdminSystemSettingFields.tencentCaptchaAppId,
  Sub2ApiAdminSystemSettingFields.tencentCaptchaAppSecretKeyConfigured,
  Sub2ApiAdminSystemSettingFields.tencentCaptchaCloudSecretIdConfigured,
  Sub2ApiAdminSystemSettingFields.tencentCaptchaCloudSecretKeyConfigured,
  Sub2ApiAdminSystemSettingFields.tencentCaptchaRegion,
  Sub2ApiAdminSystemSettingFields.aliyunCaptchaEnabled,
  Sub2ApiAdminSystemSettingFields.aliyunCaptchaAccessKeyId,
  Sub2ApiAdminSystemSettingFields.aliyunCaptchaAccessKeySecretConfigured,
  Sub2ApiAdminSystemSettingFields.aliyunCaptchaSceneId,
  Sub2ApiAdminSystemSettingFields.aliyunCaptchaPrefix,
  Sub2ApiAdminSystemSettingFields.aliyunCaptchaRegion,
  Sub2ApiAdminSystemSettingFields.apiKeyAclTrustForwardedIp,
  Sub2ApiAdminSystemSettingFields.forwardedClientIpHeaders,
  Sub2ApiAdminSystemSettingFields.linuxdoConnectEnabled,
  Sub2ApiAdminSystemSettingFields.linuxdoConnectClientId,
  Sub2ApiAdminSystemSettingFields.linuxdoConnectClientSecretConfigured,
  Sub2ApiAdminSystemSettingFields.linuxdoConnectRedirectUrl,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectEnabled,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectClientId,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectClientSecretConfigured,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectRedirectUrl,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectCorpRestrictionPolicy,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectInternalCorpId,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectBypassRegistration,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectSyncCorpEmail,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectSyncDisplayName,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectSyncDept,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectSyncCorpEmailAttrKey,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectSyncDisplayNameAttrKey,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectSyncDeptAttrKey,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectSyncCorpEmailAttrName,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectSyncDisplayNameAttrName,
  Sub2ApiAdminSystemSettingFields.dingtalkConnectSyncDeptAttrName,
  Sub2ApiAdminSystemSettingFields.wechatConnectEnabled,
  Sub2ApiAdminSystemSettingFields.wechatConnectAppId,
  Sub2ApiAdminSystemSettingFields.wechatConnectAppSecretConfigured,
  Sub2ApiAdminSystemSettingFields.wechatConnectOpenAppId,
  Sub2ApiAdminSystemSettingFields.wechatConnectOpenAppSecretConfigured,
  Sub2ApiAdminSystemSettingFields.wechatConnectMpAppId,
  Sub2ApiAdminSystemSettingFields.wechatConnectMpAppSecretConfigured,
  Sub2ApiAdminSystemSettingFields.wechatConnectMobileAppId,
  Sub2ApiAdminSystemSettingFields.wechatConnectMobileAppSecretConfigured,
  Sub2ApiAdminSystemSettingFields.wechatConnectOpenEnabled,
  Sub2ApiAdminSystemSettingFields.wechatConnectMpEnabled,
  Sub2ApiAdminSystemSettingFields.wechatConnectMobileEnabled,
  Sub2ApiAdminSystemSettingFields.wechatConnectMode,
  Sub2ApiAdminSystemSettingFields.wechatConnectScopes,
  Sub2ApiAdminSystemSettingFields.wechatConnectRedirectUrl,
  Sub2ApiAdminSystemSettingFields.wechatConnectFrontendRedirectUrl,
  Sub2ApiAdminSystemSettingFields.oidcConnectEnabled,
  Sub2ApiAdminSystemSettingFields.oidcConnectProviderName,
  Sub2ApiAdminSystemSettingFields.oidcConnectClientId,
  Sub2ApiAdminSystemSettingFields.oidcConnectClientSecretConfigured,
  Sub2ApiAdminSystemSettingFields.oidcConnectIssuerUrl,
  Sub2ApiAdminSystemSettingFields.oidcConnectDiscoveryUrl,
  Sub2ApiAdminSystemSettingFields.oidcConnectAuthorizeUrl,
  Sub2ApiAdminSystemSettingFields.oidcConnectTokenUrl,
  Sub2ApiAdminSystemSettingFields.oidcConnectUserinfoUrl,
  Sub2ApiAdminSystemSettingFields.oidcConnectJwksUrl,
  Sub2ApiAdminSystemSettingFields.oidcConnectScopes,
  Sub2ApiAdminSystemSettingFields.oidcConnectRedirectUrl,
  Sub2ApiAdminSystemSettingFields.oidcConnectFrontendRedirectUrl,
  Sub2ApiAdminSystemSettingFields.oidcConnectTokenAuthMethod,
  Sub2ApiAdminSystemSettingFields.oidcConnectUsePkce,
  Sub2ApiAdminSystemSettingFields.oidcConnectValidateIdToken,
  Sub2ApiAdminSystemSettingFields.oidcConnectAllowedSigningAlgs,
  Sub2ApiAdminSystemSettingFields.oidcConnectClockSkewSeconds,
  Sub2ApiAdminSystemSettingFields.oidcConnectRequireEmailVerified,
  Sub2ApiAdminSystemSettingFields.oidcConnectUserinfoEmailPath,
  Sub2ApiAdminSystemSettingFields.oidcConnectUserinfoIdPath,
  Sub2ApiAdminSystemSettingFields.oidcConnectUserinfoUsernamePath,
  Sub2ApiAdminSystemSettingFields.githubOauthEnabled,
  Sub2ApiAdminSystemSettingFields.githubOauthClientId,
  Sub2ApiAdminSystemSettingFields.githubOauthClientSecretConfigured,
  Sub2ApiAdminSystemSettingFields.githubOauthRedirectUrl,
  Sub2ApiAdminSystemSettingFields.githubOauthFrontendRedirectUrl,
  Sub2ApiAdminSystemSettingFields.googleOauthEnabled,
  Sub2ApiAdminSystemSettingFields.googleOauthClientId,
  Sub2ApiAdminSystemSettingFields.googleOauthClientSecretConfigured,
  Sub2ApiAdminSystemSettingFields.googleOauthRedirectUrl,
  Sub2ApiAdminSystemSettingFields.googleOauthFrontendRedirectUrl,
  Sub2ApiAdminSystemSettingFields.siteName,
  Sub2ApiAdminSystemSettingFields.siteLogo,
  Sub2ApiAdminSystemSettingFields.siteSubtitle,
  Sub2ApiAdminSystemSettingFields.apiBaseUrl,
  Sub2ApiAdminSystemSettingFields.contactInfo,
  Sub2ApiAdminSystemSettingFields.docUrl,
  Sub2ApiAdminSystemSettingFields.homeContent,
  Sub2ApiAdminSystemSettingFields.compactHomeEnabled,
  Sub2ApiAdminSystemSettingFields.hideCcsImportButton,
  Sub2ApiAdminSystemSettingFields.purchaseSubscriptionEnabled,
  Sub2ApiAdminSystemSettingFields.purchaseSubscriptionUrl,
  Sub2ApiAdminSystemSettingFields.tableDefaultPageSize,
  Sub2ApiAdminSystemSettingFields.tablePageSizeOptions,
  Sub2ApiAdminSystemSettingFields.customMenuItems,
  Sub2ApiAdminSystemSettingFields.customEndpoints,
  Sub2ApiAdminSystemSettingFields.defaultConcurrency,
  Sub2ApiAdminSystemSettingFields.defaultBalance,
  Sub2ApiAdminSystemSettingFields.affiliateRebateRate,
  Sub2ApiAdminSystemSettingFields.affiliateRebateFreezeHours,
  Sub2ApiAdminSystemSettingFields.affiliateRebateDurationDays,
  Sub2ApiAdminSystemSettingFields.affiliateRebatePerInviteeCap,
  Sub2ApiAdminSystemSettingFields.affiliateAdminRechargeEnabled,
  Sub2ApiAdminSystemSettingFields.defaultUserRpmLimit,
  Sub2ApiAdminSystemSettingFields.defaultSubscriptions,
  Sub2ApiAdminSystemSettingFields.enableModelFallback,
  Sub2ApiAdminSystemSettingFields.fallbackModelAnthropic,
  Sub2ApiAdminSystemSettingFields.fallbackModelOpenai,
  Sub2ApiAdminSystemSettingFields.fallbackModelGemini,
  Sub2ApiAdminSystemSettingFields.fallbackModelAntigravity,
  Sub2ApiAdminSystemSettingFields.enableIdentityPatch,
  Sub2ApiAdminSystemSettingFields.identityPatchPrompt,
  Sub2ApiAdminSystemSettingFields.opsMonitoringEnabled,
  Sub2ApiAdminSystemSettingFields.opsRealtimeMonitoringEnabled,
  Sub2ApiAdminSystemSettingFields.opsQueryModeDefault,
  Sub2ApiAdminSystemSettingFields.opsMetricsIntervalSeconds,
  Sub2ApiAdminSystemSettingFields.minClaudeCodeVersion,
  Sub2ApiAdminSystemSettingFields.maxClaudeCodeVersion,
  Sub2ApiAdminSystemSettingFields.allowUngroupedKeyScheduling,
  Sub2ApiAdminSystemSettingFields.backendModeEnabled,
  Sub2ApiAdminSystemSettingFields.enableFingerprintUnification,
  Sub2ApiAdminSystemSettingFields.enableMetadataPassthrough,
  Sub2ApiAdminSystemSettingFields.enableCchSigning,
  Sub2ApiAdminSystemSettingFields.enableClaudeOauthSystemPromptInjection,
  Sub2ApiAdminSystemSettingFields.claudeOauthSystemPrompt,
  Sub2ApiAdminSystemSettingFields.claudeOauthSystemPromptBlocks,
  Sub2ApiAdminSystemSettingFields.enableAnthropicCacheTtl1hInjection,
  Sub2ApiAdminSystemSettingFields.rewriteMessageCacheControl,
  Sub2ApiAdminSystemSettingFields.enableClientDatelineNormalization,
  Sub2ApiAdminSystemSettingFields.antigravityUserAgentVersion,
  Sub2ApiAdminSystemSettingFields.openaiCodexUserAgent,
  Sub2ApiAdminSystemSettingFields.openaiCodexClientVersion,
  Sub2ApiAdminSystemSettingFields.openaiCodexClientVersionSynced,
  Sub2ApiAdminSystemSettingFields.openaiCodexVersionAutoSyncEnabled,
  Sub2ApiAdminSystemSettingFields.minCodexVersion,
  Sub2ApiAdminSystemSettingFields.maxCodexVersion,
  Sub2ApiAdminSystemSettingFields.codexCliOnlyBlacklist,
  Sub2ApiAdminSystemSettingFields.codexCliOnlyWhitelist,
  Sub2ApiAdminSystemSettingFields.codexCliOnlyAllowAppServerClients,
  Sub2ApiAdminSystemSettingFields.codexCliOnlyEngineFingerprintSignals,
  Sub2ApiAdminSystemSettingFields.webSearchEmulationEnabled,
  Sub2ApiAdminSystemSettingFields.paymentVisibleMethodAlipaySource,
  Sub2ApiAdminSystemSettingFields.paymentVisibleMethodWxpaySource,
  Sub2ApiAdminSystemSettingFields.paymentVisibleMethodAlipayEnabled,
  Sub2ApiAdminSystemSettingFields.paymentVisibleMethodWxpayEnabled,
  Sub2ApiAdminSystemSettingFields.openaiLowUpstreamRatePriorityEnabled,
  Sub2ApiAdminSystemSettingFields.openaiOauthSchedulingRateMultiplier,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerEnabled,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerStickyWeightedEnabled,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerSubscriptionPriorityEnabled,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerLbTopK,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerWeightPriority,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerWeightLoad,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerWeightQueue,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerWeightErrorRate,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerWeightTtft,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerWeightReset,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerWeightQuotaHeadroom,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerWeightUpstreamCost,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerWeightPreviousResponse,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerWeightSessionSticky,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerEffectiveLbTopK,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerEffectiveWeightPriority,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerEffectiveWeightLoad,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerEffectiveWeightQueue,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerEffectiveWeightErrorRate,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerEffectiveWeightTtft,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerEffectiveWeightReset,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerEffectiveWeightQuotaHeadroom,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerEffectiveWeightUpstreamCost,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerEffectiveWeightPreviousResponse,
  Sub2ApiAdminSystemSettingFields.openaiAdvancedSchedulerEffectiveWeightSessionSticky,
  Sub2ApiAdminSystemSettingFields.paymentEnabled,
  Sub2ApiAdminSystemSettingFields.paymentMinAmount,
  Sub2ApiAdminSystemSettingFields.paymentMaxAmount,
  Sub2ApiAdminSystemSettingFields.paymentDailyLimit,
  Sub2ApiAdminSystemSettingFields.paymentOrderTimeoutMinutes,
  Sub2ApiAdminSystemSettingFields.paymentMaxPendingOrders,
  Sub2ApiAdminSystemSettingFields.paymentEnabledTypes,
  Sub2ApiAdminSystemSettingFields.paymentBalanceDisabled,
  Sub2ApiAdminSystemSettingFields.paymentBalanceRechargeMultiplier,
  Sub2ApiAdminSystemSettingFields.paymentSubscriptionUsdToCnyRate,
  Sub2ApiAdminSystemSettingFields.paymentRechargeFeeRate,
  Sub2ApiAdminSystemSettingFields.paymentLoadBalanceStrategy,
  Sub2ApiAdminSystemSettingFields.paymentProductNamePrefix,
  Sub2ApiAdminSystemSettingFields.paymentProductNameSuffix,
  Sub2ApiAdminSystemSettingFields.paymentHelpImageUrl,
  Sub2ApiAdminSystemSettingFields.paymentHelpText,
  Sub2ApiAdminSystemSettingFields.paymentCancelRateLimitEnabled,
  Sub2ApiAdminSystemSettingFields.paymentCancelRateLimitMax,
  Sub2ApiAdminSystemSettingFields.paymentCancelRateLimitWindow,
  Sub2ApiAdminSystemSettingFields.paymentCancelRateLimitUnit,
  Sub2ApiAdminSystemSettingFields.paymentCancelRateLimitWindowMode,
  Sub2ApiAdminSystemSettingFields.paymentAlipayForceQrcode,
  Sub2ApiAdminSystemSettingFields.paymentAlipayMobilePrecreateDeepLink,
  Sub2ApiAdminSystemSettingFields.balanceLowNotifyEnabled,
  Sub2ApiAdminSystemSettingFields.balanceLowNotifyThreshold,
  Sub2ApiAdminSystemSettingFields.balanceLowNotifyRechargeUrl,
  Sub2ApiAdminSystemSettingFields.subscriptionExpiryNotifyEnabled,
  Sub2ApiAdminSystemSettingFields.accountQuotaNotifyEnabled,
  Sub2ApiAdminSystemSettingFields.accountQuotaNotifyEmails,
  Sub2ApiAdminSystemSettingFields.channelMonitorEnabled,
  Sub2ApiAdminSystemSettingFields.channelMonitorMode,
  Sub2ApiAdminSystemSettingFields.channelMonitorDefaultIntervalSeconds,
  Sub2ApiAdminSystemSettingFields.channelMonitorHideThroughput,
  Sub2ApiAdminSystemSettingFields.channelMonitorShowQuota,
  Sub2ApiAdminSystemSettingFields.grokDefaultTextModel,
  Sub2ApiAdminSystemSettingFields.grokCrossClientModelMapEnabled,
  Sub2ApiAdminSystemSettingFields.grokDefaultBaseUrlMode,
  Sub2ApiAdminSystemSettingFields.availableChannelsEnabled,
  Sub2ApiAdminSystemSettingFields.modelPlazaEnabled,
  Sub2ApiAdminSystemSettingFields.modelPlazaRequireAuth,
  Sub2ApiAdminSystemSettingFields.modelPlazaDescription,
  Sub2ApiAdminSystemSettingFields.pluginManagementEnabled,
  Sub2ApiAdminSystemSettingFields.riskControlEnabled,
  Sub2ApiAdminSystemSettingFields.cyberSessionBlockEnabled,
  Sub2ApiAdminSystemSettingFields.cyberSessionBlockTtlSeconds,
  Sub2ApiAdminSystemSettingFields.affiliateEnabled,
  Sub2ApiAdminSystemSettingFields.openaiFastPolicySettings,
  Sub2ApiAdminSystemSettingFields.defaultPlatformQuotas,
  Sub2ApiAdminSystemSettingFields.accountSchedulingThresholds,
  Sub2ApiAdminSystemSettingFields.allowUserViewErrorRequests,
];

abstract final class Sub2ApiAdminSystemSettingUpdates {
  static const registrationEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('registration_enabled', _AdminSettingKind.boolean);
  static const emailVerifyEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('email_verify_enabled', _AdminSettingKind.boolean);
  static const registrationEmailSuffixWhitelist = Sub2ApiAdminSystemSettingUpdate<List<String>>._('registration_email_suffix_whitelist', _AdminSettingKind.stringList);
  static const registrationEmailDomainQuotaEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('registration_email_domain_quota_enabled', _AdminSettingKind.boolean);
  static const promoCodeEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('promo_code_enabled', _AdminSettingKind.boolean);
  static const passwordResetEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('password_reset_enabled', _AdminSettingKind.boolean);
  static const frontendUrl = Sub2ApiAdminSystemSettingUpdate<String>._('frontend_url', _AdminSettingKind.string);
  static const invitationCodeEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('invitation_code_enabled', _AdminSettingKind.boolean);
  static const totpEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('totp_enabled', _AdminSettingKind.boolean);
  static const passkeyEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('passkey_enabled', _AdminSettingKind.boolean);
  static const sessionBindingEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('session_binding_enabled', _AdminSettingKind.boolean);
  static const stepUpEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('step_up_enabled', _AdminSettingKind.boolean);
  static const auditLogRetentionDays = Sub2ApiAdminSystemSettingUpdate<int>._('audit_log_retention_days', _AdminSettingKind.integer);
  static const loginAgreementEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('login_agreement_enabled', _AdminSettingKind.boolean);
  static const loginAgreementMode = Sub2ApiAdminSystemSettingUpdate<String>._('login_agreement_mode', _AdminSettingKind.string);
  static const loginAgreementUpdatedAt = Sub2ApiAdminSystemSettingUpdate<String>._('login_agreement_updated_at', _AdminSettingKind.string);
  static const loginAgreementDocuments = Sub2ApiAdminSystemSettingUpdate<List<Sub2ApiAdminLoginAgreementDocument>>._('login_agreement_documents', _AdminSettingKind.loginAgreementList);
  static const smtpHost = Sub2ApiAdminSystemSettingUpdate<String>._('smtp_host', _AdminSettingKind.string);
  static const smtpPort = Sub2ApiAdminSystemSettingUpdate<int>._('smtp_port', _AdminSettingKind.integer);
  static const smtpUsername = Sub2ApiAdminSystemSettingUpdate<String>._('smtp_username', _AdminSettingKind.string);
  static const smtpPassword = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('smtp_password', _AdminSettingKind.secret);
  static const smtpFromEmail = Sub2ApiAdminSystemSettingUpdate<String>._('smtp_from_email', _AdminSettingKind.string);
  static const smtpFromName = Sub2ApiAdminSystemSettingUpdate<String>._('smtp_from_name', _AdminSettingKind.string);
  static const smtpUseTls = Sub2ApiAdminSystemSettingUpdate<bool>._('smtp_use_tls', _AdminSettingKind.boolean);
  static const turnstileEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('turnstile_enabled', _AdminSettingKind.boolean);
  static const turnstileSiteKey = Sub2ApiAdminSystemSettingUpdate<String>._('turnstile_site_key', _AdminSettingKind.string);
  static const turnstileSecretKey = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('turnstile_secret_key', _AdminSettingKind.secret);
  static const tencentCaptchaEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('tencent_captcha_enabled', _AdminSettingKind.boolean);
  static const tencentCaptchaAppId = Sub2ApiAdminSystemSettingUpdate<String>._('tencent_captcha_app_id', _AdminSettingKind.string);
  static const tencentCaptchaAppSecretKey = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('tencent_captcha_app_secret_key', _AdminSettingKind.secret);
  static const tencentCaptchaCloudSecretId = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('tencent_captcha_cloud_secret_id', _AdminSettingKind.secret);
  static const tencentCaptchaCloudSecretKey = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('tencent_captcha_cloud_secret_key', _AdminSettingKind.secret);
  static const tencentCaptchaRegion = Sub2ApiAdminSystemSettingUpdate<String>._('tencent_captcha_region', _AdminSettingKind.string);
  static const aliyunCaptchaEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('aliyun_captcha_enabled', _AdminSettingKind.boolean);
  static const aliyunCaptchaAccessKeyId = Sub2ApiAdminSystemSettingUpdate<String>._('aliyun_captcha_access_key_id', _AdminSettingKind.string);
  static const aliyunCaptchaAccessKeySecret = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('aliyun_captcha_access_key_secret', _AdminSettingKind.secret);
  static const aliyunCaptchaSceneId = Sub2ApiAdminSystemSettingUpdate<String>._('aliyun_captcha_scene_id', _AdminSettingKind.string);
  static const aliyunCaptchaPrefix = Sub2ApiAdminSystemSettingUpdate<String>._('aliyun_captcha_prefix', _AdminSettingKind.string);
  static const aliyunCaptchaRegion = Sub2ApiAdminSystemSettingUpdate<String>._('aliyun_captcha_region', _AdminSettingKind.string);
  static const apiKeyAclTrustForwardedIp = Sub2ApiAdminSystemSettingUpdate<bool>._('api_key_acl_trust_forwarded_ip', _AdminSettingKind.boolean);
  static const forwardedClientIpHeaders = Sub2ApiAdminSystemSettingUpdate<List<String>>._('forwarded_client_ip_headers', _AdminSettingKind.stringList);
  static const linuxdoConnectEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('linuxdo_connect_enabled', _AdminSettingKind.boolean);
  static const linuxdoConnectClientId = Sub2ApiAdminSystemSettingUpdate<String>._('linuxdo_connect_client_id', _AdminSettingKind.string);
  static const linuxdoConnectClientSecret = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('linuxdo_connect_client_secret', _AdminSettingKind.secret);
  static const linuxdoConnectRedirectUrl = Sub2ApiAdminSystemSettingUpdate<String>._('linuxdo_connect_redirect_url', _AdminSettingKind.string);
  static const dingtalkConnectEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('dingtalk_connect_enabled', _AdminSettingKind.boolean);
  static const dingtalkConnectClientId = Sub2ApiAdminSystemSettingUpdate<String>._('dingtalk_connect_client_id', _AdminSettingKind.string);
  static const dingtalkConnectClientSecret = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('dingtalk_connect_client_secret', _AdminSettingKind.secret);
  static const dingtalkConnectRedirectUrl = Sub2ApiAdminSystemSettingUpdate<String>._('dingtalk_connect_redirect_url', _AdminSettingKind.string);
  static const dingtalkConnectCorpRestrictionPolicy = Sub2ApiAdminSystemSettingUpdate<String>._('dingtalk_connect_corp_restriction_policy', _AdminSettingKind.string);
  static const dingtalkConnectInternalCorpId = Sub2ApiAdminSystemSettingUpdate<String>._('dingtalk_connect_internal_corp_id', _AdminSettingKind.string);
  static const dingtalkConnectBypassRegistration = Sub2ApiAdminSystemSettingUpdate<bool>._('dingtalk_connect_bypass_registration', _AdminSettingKind.boolean);
  static const dingtalkConnectSyncCorpEmail = Sub2ApiAdminSystemSettingUpdate<bool>._('dingtalk_connect_sync_corp_email', _AdminSettingKind.boolean);
  static const dingtalkConnectSyncDisplayName = Sub2ApiAdminSystemSettingUpdate<bool>._('dingtalk_connect_sync_display_name', _AdminSettingKind.boolean);
  static const dingtalkConnectSyncDept = Sub2ApiAdminSystemSettingUpdate<bool>._('dingtalk_connect_sync_dept', _AdminSettingKind.boolean);
  static const dingtalkConnectSyncCorpEmailAttrKey = Sub2ApiAdminSystemSettingUpdate<String>._('dingtalk_connect_sync_corp_email_attr_key', _AdminSettingKind.string);
  static const dingtalkConnectSyncDisplayNameAttrKey = Sub2ApiAdminSystemSettingUpdate<String>._('dingtalk_connect_sync_display_name_attr_key', _AdminSettingKind.string);
  static const dingtalkConnectSyncDeptAttrKey = Sub2ApiAdminSystemSettingUpdate<String>._('dingtalk_connect_sync_dept_attr_key', _AdminSettingKind.string);
  static const dingtalkConnectSyncCorpEmailAttrName = Sub2ApiAdminSystemSettingUpdate<String>._('dingtalk_connect_sync_corp_email_attr_name', _AdminSettingKind.string);
  static const dingtalkConnectSyncDisplayNameAttrName = Sub2ApiAdminSystemSettingUpdate<String>._('dingtalk_connect_sync_display_name_attr_name', _AdminSettingKind.string);
  static const dingtalkConnectSyncDeptAttrName = Sub2ApiAdminSystemSettingUpdate<String>._('dingtalk_connect_sync_dept_attr_name', _AdminSettingKind.string);
  static const wechatConnectEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('wechat_connect_enabled', _AdminSettingKind.boolean);
  static const wechatConnectAppId = Sub2ApiAdminSystemSettingUpdate<String>._('wechat_connect_app_id', _AdminSettingKind.string);
  static const wechatConnectAppSecret = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('wechat_connect_app_secret', _AdminSettingKind.secret);
  static const wechatConnectOpenAppId = Sub2ApiAdminSystemSettingUpdate<String>._('wechat_connect_open_app_id', _AdminSettingKind.string);
  static const wechatConnectOpenAppSecret = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('wechat_connect_open_app_secret', _AdminSettingKind.secret);
  static const wechatConnectMpAppId = Sub2ApiAdminSystemSettingUpdate<String>._('wechat_connect_mp_app_id', _AdminSettingKind.string);
  static const wechatConnectMpAppSecret = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('wechat_connect_mp_app_secret', _AdminSettingKind.secret);
  static const wechatConnectMobileAppId = Sub2ApiAdminSystemSettingUpdate<String>._('wechat_connect_mobile_app_id', _AdminSettingKind.string);
  static const wechatConnectMobileAppSecret = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('wechat_connect_mobile_app_secret', _AdminSettingKind.secret);
  static const wechatConnectOpenEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('wechat_connect_open_enabled', _AdminSettingKind.boolean);
  static const wechatConnectMpEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('wechat_connect_mp_enabled', _AdminSettingKind.boolean);
  static const wechatConnectMobileEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('wechat_connect_mobile_enabled', _AdminSettingKind.boolean);
  static const wechatConnectMode = Sub2ApiAdminSystemSettingUpdate<String>._('wechat_connect_mode', _AdminSettingKind.string);
  static const wechatConnectScopes = Sub2ApiAdminSystemSettingUpdate<String>._('wechat_connect_scopes', _AdminSettingKind.string);
  static const wechatConnectRedirectUrl = Sub2ApiAdminSystemSettingUpdate<String>._('wechat_connect_redirect_url', _AdminSettingKind.string);
  static const wechatConnectFrontendRedirectUrl = Sub2ApiAdminSystemSettingUpdate<String>._('wechat_connect_frontend_redirect_url', _AdminSettingKind.string);
  static const oidcConnectEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('oidc_connect_enabled', _AdminSettingKind.boolean);
  static const oidcConnectProviderName = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_provider_name', _AdminSettingKind.string);
  static const oidcConnectClientId = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_client_id', _AdminSettingKind.string);
  static const oidcConnectClientSecret = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('oidc_connect_client_secret', _AdminSettingKind.secret);
  static const oidcConnectIssuerUrl = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_issuer_url', _AdminSettingKind.string);
  static const oidcConnectDiscoveryUrl = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_discovery_url', _AdminSettingKind.string);
  static const oidcConnectAuthorizeUrl = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_authorize_url', _AdminSettingKind.string);
  static const oidcConnectTokenUrl = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_token_url', _AdminSettingKind.string);
  static const oidcConnectUserinfoUrl = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_userinfo_url', _AdminSettingKind.string);
  static const oidcConnectJwksUrl = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_jwks_url', _AdminSettingKind.string);
  static const oidcConnectScopes = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_scopes', _AdminSettingKind.string);
  static const oidcConnectRedirectUrl = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_redirect_url', _AdminSettingKind.string);
  static const oidcConnectFrontendRedirectUrl = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_frontend_redirect_url', _AdminSettingKind.string);
  static const oidcConnectTokenAuthMethod = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_token_auth_method', _AdminSettingKind.string);
  static const oidcConnectUsePkce = Sub2ApiAdminSystemSettingUpdate<bool>._('oidc_connect_use_pkce', _AdminSettingKind.boolean);
  static const oidcConnectValidateIdToken = Sub2ApiAdminSystemSettingUpdate<bool>._('oidc_connect_validate_id_token', _AdminSettingKind.boolean);
  static const oidcConnectAllowedSigningAlgs = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_allowed_signing_algs', _AdminSettingKind.string);
  static const oidcConnectClockSkewSeconds = Sub2ApiAdminSystemSettingUpdate<int>._('oidc_connect_clock_skew_seconds', _AdminSettingKind.integer);
  static const oidcConnectRequireEmailVerified = Sub2ApiAdminSystemSettingUpdate<bool>._('oidc_connect_require_email_verified', _AdminSettingKind.boolean);
  static const oidcConnectUserinfoEmailPath = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_userinfo_email_path', _AdminSettingKind.string);
  static const oidcConnectUserinfoIdPath = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_userinfo_id_path', _AdminSettingKind.string);
  static const oidcConnectUserinfoUsernamePath = Sub2ApiAdminSystemSettingUpdate<String>._('oidc_connect_userinfo_username_path', _AdminSettingKind.string);
  static const githubOauthEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('github_oauth_enabled', _AdminSettingKind.boolean);
  static const githubOauthClientId = Sub2ApiAdminSystemSettingUpdate<String>._('github_oauth_client_id', _AdminSettingKind.string);
  static const githubOauthClientSecret = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('github_oauth_client_secret', _AdminSettingKind.secret);
  static const githubOauthRedirectUrl = Sub2ApiAdminSystemSettingUpdate<String>._('github_oauth_redirect_url', _AdminSettingKind.string);
  static const githubOauthFrontendRedirectUrl = Sub2ApiAdminSystemSettingUpdate<String>._('github_oauth_frontend_redirect_url', _AdminSettingKind.string);
  static const googleOauthEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('google_oauth_enabled', _AdminSettingKind.boolean);
  static const googleOauthClientId = Sub2ApiAdminSystemSettingUpdate<String>._('google_oauth_client_id', _AdminSettingKind.string);
  static const googleOauthClientSecret = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('google_oauth_client_secret', _AdminSettingKind.secret);
  static const googleOauthRedirectUrl = Sub2ApiAdminSystemSettingUpdate<String>._('google_oauth_redirect_url', _AdminSettingKind.string);
  static const googleOauthFrontendRedirectUrl = Sub2ApiAdminSystemSettingUpdate<String>._('google_oauth_frontend_redirect_url', _AdminSettingKind.string);
  static const siteName = Sub2ApiAdminSystemSettingUpdate<String>._('site_name', _AdminSettingKind.string);
  static const siteLogo = Sub2ApiAdminSystemSettingUpdate<String>._('site_logo', _AdminSettingKind.string);
  static const siteSubtitle = Sub2ApiAdminSystemSettingUpdate<String>._('site_subtitle', _AdminSettingKind.string);
  static const apiBaseUrl = Sub2ApiAdminSystemSettingUpdate<String>._('api_base_url', _AdminSettingKind.string);
  static const contactInfo = Sub2ApiAdminSystemSettingUpdate<String>._('contact_info', _AdminSettingKind.string);
  static const docUrl = Sub2ApiAdminSystemSettingUpdate<String>._('doc_url', _AdminSettingKind.string);
  static const homeContent = Sub2ApiAdminSystemSettingUpdate<String>._('home_content', _AdminSettingKind.string);
  static const compactHomeEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('compact_home_enabled', _AdminSettingKind.boolean);
  static const hideCcsImportButton = Sub2ApiAdminSystemSettingUpdate<bool>._('hide_ccs_import_button', _AdminSettingKind.boolean);
  static const purchaseSubscriptionEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('purchase_subscription_enabled', _AdminSettingKind.boolean);
  static const purchaseSubscriptionUrl = Sub2ApiAdminSystemSettingUpdate<String>._('purchase_subscription_url', _AdminSettingKind.string);
  static const tableDefaultPageSize = Sub2ApiAdminSystemSettingUpdate<int>._('table_default_page_size', _AdminSettingKind.integer);
  static const tablePageSizeOptions = Sub2ApiAdminSystemSettingUpdate<List<int>>._('table_page_size_options', _AdminSettingKind.intList);
  static const customMenuItems = Sub2ApiAdminSystemSettingUpdate<List<Sub2ApiAdminCustomMenuItem>>._('custom_menu_items', _AdminSettingKind.customMenuList);
  static const customEndpoints = Sub2ApiAdminSystemSettingUpdate<List<Sub2ApiAdminCustomEndpoint>>._('custom_endpoints', _AdminSettingKind.customEndpointList);
  static const defaultConcurrency = Sub2ApiAdminSystemSettingUpdate<int>._('default_concurrency', _AdminSettingKind.integer);
  static const defaultBalance = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('default_balance', _AdminSettingKind.decimal);
  static const affiliateRebateRate = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('affiliate_rebate_rate', _AdminSettingKind.decimal);
  static const affiliateRebateFreezeHours = Sub2ApiAdminSystemSettingUpdate<int>._('affiliate_rebate_freeze_hours', _AdminSettingKind.integer);
  static const affiliateRebateDurationDays = Sub2ApiAdminSystemSettingUpdate<int>._('affiliate_rebate_duration_days', _AdminSettingKind.integer);
  static const affiliateRebatePerInviteeCap = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('affiliate_rebate_per_invitee_cap', _AdminSettingKind.decimal);
  static const affiliateAdminRechargeEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('affiliate_admin_recharge_enabled', _AdminSettingKind.boolean);
  static const defaultUserRpmLimit = Sub2ApiAdminSystemSettingUpdate<int>._('default_user_rpm_limit', _AdminSettingKind.integer);
  static const defaultSubscriptions = Sub2ApiAdminSystemSettingUpdate<List<Sub2ApiAdminDefaultSubscriptionSetting>>._('default_subscriptions', _AdminSettingKind.defaultSubscriptionList);
  static const authSourceDefaultEmailBalance = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('auth_source_default_email_balance', _AdminSettingKind.decimal);
  static const authSourceDefaultEmailConcurrency = Sub2ApiAdminSystemSettingUpdate<int>._('auth_source_default_email_concurrency', _AdminSettingKind.integer);
  static const authSourceDefaultEmailSubscriptions = Sub2ApiAdminSystemSettingUpdate<List<Sub2ApiAdminDefaultSubscriptionSetting>>._('auth_source_default_email_subscriptions', _AdminSettingKind.defaultSubscriptionList);
  static const authSourceDefaultEmailGrantOnSignup = Sub2ApiAdminSystemSettingUpdate<bool>._('auth_source_default_email_grant_on_signup', _AdminSettingKind.boolean);
  static const authSourceDefaultEmailGrantOnFirstBind = Sub2ApiAdminSystemSettingUpdate<bool>._('auth_source_default_email_grant_on_first_bind', _AdminSettingKind.boolean);
  static const authSourceDefaultLinuxdoBalance = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('auth_source_default_linuxdo_balance', _AdminSettingKind.decimal);
  static const authSourceDefaultLinuxdoConcurrency = Sub2ApiAdminSystemSettingUpdate<int>._('auth_source_default_linuxdo_concurrency', _AdminSettingKind.integer);
  static const authSourceDefaultLinuxdoSubscriptions = Sub2ApiAdminSystemSettingUpdate<List<Sub2ApiAdminDefaultSubscriptionSetting>>._('auth_source_default_linuxdo_subscriptions', _AdminSettingKind.defaultSubscriptionList);
  static const authSourceDefaultLinuxdoGrantOnSignup = Sub2ApiAdminSystemSettingUpdate<bool>._('auth_source_default_linuxdo_grant_on_signup', _AdminSettingKind.boolean);
  static const authSourceDefaultLinuxdoGrantOnFirstBind = Sub2ApiAdminSystemSettingUpdate<bool>._('auth_source_default_linuxdo_grant_on_first_bind', _AdminSettingKind.boolean);
  static const authSourceDefaultOidcBalance = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('auth_source_default_oidc_balance', _AdminSettingKind.decimal);
  static const authSourceDefaultOidcConcurrency = Sub2ApiAdminSystemSettingUpdate<int>._('auth_source_default_oidc_concurrency', _AdminSettingKind.integer);
  static const authSourceDefaultOidcSubscriptions = Sub2ApiAdminSystemSettingUpdate<List<Sub2ApiAdminDefaultSubscriptionSetting>>._('auth_source_default_oidc_subscriptions', _AdminSettingKind.defaultSubscriptionList);
  static const authSourceDefaultOidcGrantOnSignup = Sub2ApiAdminSystemSettingUpdate<bool>._('auth_source_default_oidc_grant_on_signup', _AdminSettingKind.boolean);
  static const authSourceDefaultOidcGrantOnFirstBind = Sub2ApiAdminSystemSettingUpdate<bool>._('auth_source_default_oidc_grant_on_first_bind', _AdminSettingKind.boolean);
  static const authSourceDefaultWechatBalance = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('auth_source_default_wechat_balance', _AdminSettingKind.decimal);
  static const authSourceDefaultWechatConcurrency = Sub2ApiAdminSystemSettingUpdate<int>._('auth_source_default_wechat_concurrency', _AdminSettingKind.integer);
  static const authSourceDefaultWechatSubscriptions = Sub2ApiAdminSystemSettingUpdate<List<Sub2ApiAdminDefaultSubscriptionSetting>>._('auth_source_default_wechat_subscriptions', _AdminSettingKind.defaultSubscriptionList);
  static const authSourceDefaultWechatGrantOnSignup = Sub2ApiAdminSystemSettingUpdate<bool>._('auth_source_default_wechat_grant_on_signup', _AdminSettingKind.boolean);
  static const authSourceDefaultWechatGrantOnFirstBind = Sub2ApiAdminSystemSettingUpdate<bool>._('auth_source_default_wechat_grant_on_first_bind', _AdminSettingKind.boolean);
  static const authSourceDefaultGithubBalance = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('auth_source_default_github_balance', _AdminSettingKind.decimal);
  static const authSourceDefaultGithubConcurrency = Sub2ApiAdminSystemSettingUpdate<int>._('auth_source_default_github_concurrency', _AdminSettingKind.integer);
  static const authSourceDefaultGithubSubscriptions = Sub2ApiAdminSystemSettingUpdate<List<Sub2ApiAdminDefaultSubscriptionSetting>>._('auth_source_default_github_subscriptions', _AdminSettingKind.defaultSubscriptionList);
  static const authSourceDefaultGithubGrantOnSignup = Sub2ApiAdminSystemSettingUpdate<bool>._('auth_source_default_github_grant_on_signup', _AdminSettingKind.boolean);
  static const authSourceDefaultGithubGrantOnFirstBind = Sub2ApiAdminSystemSettingUpdate<bool>._('auth_source_default_github_grant_on_first_bind', _AdminSettingKind.boolean);
  static const authSourceDefaultGoogleBalance = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('auth_source_default_google_balance', _AdminSettingKind.decimal);
  static const authSourceDefaultGoogleConcurrency = Sub2ApiAdminSystemSettingUpdate<int>._('auth_source_default_google_concurrency', _AdminSettingKind.integer);
  static const authSourceDefaultGoogleSubscriptions = Sub2ApiAdminSystemSettingUpdate<List<Sub2ApiAdminDefaultSubscriptionSetting>>._('auth_source_default_google_subscriptions', _AdminSettingKind.defaultSubscriptionList);
  static const authSourceDefaultGoogleGrantOnSignup = Sub2ApiAdminSystemSettingUpdate<bool>._('auth_source_default_google_grant_on_signup', _AdminSettingKind.boolean);
  static const authSourceDefaultGoogleGrantOnFirstBind = Sub2ApiAdminSystemSettingUpdate<bool>._('auth_source_default_google_grant_on_first_bind', _AdminSettingKind.boolean);
  static const authSourceDefaultDingtalkBalance = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('auth_source_default_dingtalk_balance', _AdminSettingKind.decimal);
  static const authSourceDefaultDingtalkConcurrency = Sub2ApiAdminSystemSettingUpdate<int>._('auth_source_default_dingtalk_concurrency', _AdminSettingKind.integer);
  static const authSourceDefaultDingtalkSubscriptions = Sub2ApiAdminSystemSettingUpdate<List<Sub2ApiAdminDefaultSubscriptionSetting>>._('auth_source_default_dingtalk_subscriptions', _AdminSettingKind.defaultSubscriptionList);
  static const authSourceDefaultDingtalkGrantOnSignup = Sub2ApiAdminSystemSettingUpdate<bool>._('auth_source_default_dingtalk_grant_on_signup', _AdminSettingKind.boolean);
  static const authSourceDefaultDingtalkGrantOnFirstBind = Sub2ApiAdminSystemSettingUpdate<bool>._('auth_source_default_dingtalk_grant_on_first_bind', _AdminSettingKind.boolean);
  static const forceEmailOnThirdPartySignup = Sub2ApiAdminSystemSettingUpdate<bool>._('force_email_on_third_party_signup', _AdminSettingKind.boolean);
  static const enableModelFallback = Sub2ApiAdminSystemSettingUpdate<bool>._('enable_model_fallback', _AdminSettingKind.boolean);
  static const fallbackModelAnthropic = Sub2ApiAdminSystemSettingUpdate<String>._('fallback_model_anthropic', _AdminSettingKind.string);
  static const fallbackModelOpenai = Sub2ApiAdminSystemSettingUpdate<String>._('fallback_model_openai', _AdminSettingKind.string);
  static const fallbackModelGemini = Sub2ApiAdminSystemSettingUpdate<String>._('fallback_model_gemini', _AdminSettingKind.string);
  static const fallbackModelAntigravity = Sub2ApiAdminSystemSettingUpdate<String>._('fallback_model_antigravity', _AdminSettingKind.string);
  static const enableIdentityPatch = Sub2ApiAdminSystemSettingUpdate<bool>._('enable_identity_patch', _AdminSettingKind.boolean);
  static const identityPatchPrompt = Sub2ApiAdminSystemSettingUpdate<String>._('identity_patch_prompt', _AdminSettingKind.string);
  static const opsMonitoringEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('ops_monitoring_enabled', _AdminSettingKind.boolean);
  static const opsRealtimeMonitoringEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('ops_realtime_monitoring_enabled', _AdminSettingKind.boolean);
  static const opsQueryModeDefault = Sub2ApiAdminSystemSettingUpdate<String>._('ops_query_mode_default', _AdminSettingKind.string);
  static const opsMetricsIntervalSeconds = Sub2ApiAdminSystemSettingUpdate<int>._('ops_metrics_interval_seconds', _AdminSettingKind.integer);
  static const minClaudeCodeVersion = Sub2ApiAdminSystemSettingUpdate<String>._('min_claude_code_version', _AdminSettingKind.string);
  static const maxClaudeCodeVersion = Sub2ApiAdminSystemSettingUpdate<String>._('max_claude_code_version', _AdminSettingKind.string);
  static const allowUngroupedKeyScheduling = Sub2ApiAdminSystemSettingUpdate<bool>._('allow_ungrouped_key_scheduling', _AdminSettingKind.boolean);
  static const backendModeEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('backend_mode_enabled', _AdminSettingKind.boolean);
  static const enableFingerprintUnification = Sub2ApiAdminSystemSettingUpdate<bool>._('enable_fingerprint_unification', _AdminSettingKind.boolean);
  static const enableMetadataPassthrough = Sub2ApiAdminSystemSettingUpdate<bool>._('enable_metadata_passthrough', _AdminSettingKind.boolean);
  static const enableCchSigning = Sub2ApiAdminSystemSettingUpdate<bool>._('enable_cch_signing', _AdminSettingKind.boolean);
  static const enableClaudeOauthSystemPromptInjection = Sub2ApiAdminSystemSettingUpdate<bool>._('enable_claude_oauth_system_prompt_injection', _AdminSettingKind.boolean);
  static const claudeOauthSystemPrompt = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('claude_oauth_system_prompt', _AdminSettingKind.secret);
  static const claudeOauthSystemPromptBlocks = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminSettingSecret>._('claude_oauth_system_prompt_blocks', _AdminSettingKind.secret);
  static const enableAnthropicCacheTtl1hInjection = Sub2ApiAdminSystemSettingUpdate<bool>._('enable_anthropic_cache_ttl_1h_injection', _AdminSettingKind.boolean);
  static const rewriteMessageCacheControl = Sub2ApiAdminSystemSettingUpdate<bool>._('rewrite_message_cache_control', _AdminSettingKind.boolean);
  static const enableClientDatelineNormalization = Sub2ApiAdminSystemSettingUpdate<bool>._('enable_client_dateline_normalization', _AdminSettingKind.boolean);
  static const antigravityUserAgentVersion = Sub2ApiAdminSystemSettingUpdate<String>._('antigravity_user_agent_version', _AdminSettingKind.string);
  static const openaiCodexUserAgent = Sub2ApiAdminSystemSettingUpdate<String>._('openai_codex_user_agent', _AdminSettingKind.string);
  static const openaiCodexClientVersion = Sub2ApiAdminSystemSettingUpdate<String>._('openai_codex_client_version', _AdminSettingKind.string);
  static const openaiCodexVersionAutoSyncEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('openai_codex_version_auto_sync_enabled', _AdminSettingKind.boolean);
  static const minCodexVersion = Sub2ApiAdminSystemSettingUpdate<String>._('min_codex_version', _AdminSettingKind.string);
  static const maxCodexVersion = Sub2ApiAdminSystemSettingUpdate<String>._('max_codex_version', _AdminSettingKind.string);
  static const codexCliOnlyBlacklist = Sub2ApiAdminSystemSettingUpdate<String>._('codex_cli_only_blacklist', _AdminSettingKind.string);
  static const codexCliOnlyWhitelist = Sub2ApiAdminSystemSettingUpdate<String>._('codex_cli_only_whitelist', _AdminSettingKind.string);
  static const codexCliOnlyAllowAppServerClients = Sub2ApiAdminSystemSettingUpdate<bool>._('codex_cli_only_allow_app_server_clients', _AdminSettingKind.boolean);
  static const codexCliOnlyEngineFingerprintSignals = Sub2ApiAdminSystemSettingUpdate<String>._('codex_cli_only_engine_fingerprint_signals', _AdminSettingKind.string);
  static const paymentVisibleMethodAlipaySource = Sub2ApiAdminSystemSettingUpdate<String>._('payment_visible_method_alipay_source', _AdminSettingKind.string);
  static const paymentVisibleMethodWxpaySource = Sub2ApiAdminSystemSettingUpdate<String>._('payment_visible_method_wxpay_source', _AdminSettingKind.string);
  static const paymentVisibleMethodAlipayEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('payment_visible_method_alipay_enabled', _AdminSettingKind.boolean);
  static const paymentVisibleMethodWxpayEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('payment_visible_method_wxpay_enabled', _AdminSettingKind.boolean);
  static const openaiLowUpstreamRatePriorityEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('openai_low_upstream_rate_priority_enabled', _AdminSettingKind.boolean);
  static const openaiOauthSchedulingRateMultiplier = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('openai_oauth_scheduling_rate_multiplier', _AdminSettingKind.decimal);
  static const openaiAdvancedSchedulerEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('openai_advanced_scheduler_enabled', _AdminSettingKind.boolean);
  static const openaiAdvancedSchedulerStickyWeightedEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('openai_advanced_scheduler_sticky_weighted_enabled', _AdminSettingKind.boolean);
  static const openaiAdvancedSchedulerSubscriptionPriorityEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('openai_advanced_scheduler_subscription_priority_enabled', _AdminSettingKind.boolean);
  static const openaiAdvancedSchedulerLbTopK = Sub2ApiAdminSystemSettingUpdate<String>._('openai_advanced_scheduler_lb_top_k', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightPriority = Sub2ApiAdminSystemSettingUpdate<String>._('openai_advanced_scheduler_weight_priority', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightLoad = Sub2ApiAdminSystemSettingUpdate<String>._('openai_advanced_scheduler_weight_load', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightQueue = Sub2ApiAdminSystemSettingUpdate<String>._('openai_advanced_scheduler_weight_queue', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightErrorRate = Sub2ApiAdminSystemSettingUpdate<String>._('openai_advanced_scheduler_weight_error_rate', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightTtft = Sub2ApiAdminSystemSettingUpdate<String>._('openai_advanced_scheduler_weight_ttft', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightReset = Sub2ApiAdminSystemSettingUpdate<String>._('openai_advanced_scheduler_weight_reset', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightQuotaHeadroom = Sub2ApiAdminSystemSettingUpdate<String>._('openai_advanced_scheduler_weight_quota_headroom', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightUpstreamCost = Sub2ApiAdminSystemSettingUpdate<String>._('openai_advanced_scheduler_weight_upstream_cost', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightPreviousResponse = Sub2ApiAdminSystemSettingUpdate<String>._('openai_advanced_scheduler_weight_previous_response', _AdminSettingKind.string);
  static const openaiAdvancedSchedulerWeightSessionSticky = Sub2ApiAdminSystemSettingUpdate<String>._('openai_advanced_scheduler_weight_session_sticky', _AdminSettingKind.string);
  static const balanceLowNotifyEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('balance_low_notify_enabled', _AdminSettingKind.boolean);
  static const balanceLowNotifyThreshold = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('balance_low_notify_threshold', _AdminSettingKind.decimal);
  static const balanceLowNotifyRechargeUrl = Sub2ApiAdminSystemSettingUpdate<String>._('balance_low_notify_recharge_url', _AdminSettingKind.string);
  static const subscriptionExpiryNotifyEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('subscription_expiry_notify_enabled', _AdminSettingKind.boolean);
  static const accountQuotaNotifyEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('account_quota_notify_enabled', _AdminSettingKind.boolean);
  static const accountQuotaNotifyEmails = Sub2ApiAdminSystemSettingUpdate<List<Sub2ApiAdminNotifyEmailEntry>>._('account_quota_notify_emails', _AdminSettingKind.notifyEmailList);
  static const paymentEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('payment_enabled', _AdminSettingKind.boolean);
  static const paymentMinAmount = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('payment_min_amount', _AdminSettingKind.decimal);
  static const paymentMaxAmount = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('payment_max_amount', _AdminSettingKind.decimal);
  static const paymentDailyLimit = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('payment_daily_limit', _AdminSettingKind.decimal);
  static const paymentOrderTimeoutMinutes = Sub2ApiAdminSystemSettingUpdate<int>._('payment_order_timeout_minutes', _AdminSettingKind.integer);
  static const paymentMaxPendingOrders = Sub2ApiAdminSystemSettingUpdate<int>._('payment_max_pending_orders', _AdminSettingKind.integer);
  static const paymentEnabledTypes = Sub2ApiAdminSystemSettingUpdate<List<String>>._('payment_enabled_types', _AdminSettingKind.stringList);
  static const paymentBalanceDisabled = Sub2ApiAdminSystemSettingUpdate<bool>._('payment_balance_disabled', _AdminSettingKind.boolean);
  static const paymentBalanceRechargeMultiplier = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('payment_balance_recharge_multiplier', _AdminSettingKind.decimal);
  static const paymentSubscriptionUsdToCnyRate = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('payment_subscription_usd_to_cny_rate', _AdminSettingKind.decimal);
  static const paymentRechargeFeeRate = Sub2ApiAdminSystemSettingUpdate<Sub2ApiDecimal>._('payment_recharge_fee_rate', _AdminSettingKind.decimal);
  static const paymentLoadBalanceStrategy = Sub2ApiAdminSystemSettingUpdate<String>._('payment_load_balance_strategy', _AdminSettingKind.string);
  static const paymentProductNamePrefix = Sub2ApiAdminSystemSettingUpdate<String>._('payment_product_name_prefix', _AdminSettingKind.string);
  static const paymentProductNameSuffix = Sub2ApiAdminSystemSettingUpdate<String>._('payment_product_name_suffix', _AdminSettingKind.string);
  static const paymentHelpImageUrl = Sub2ApiAdminSystemSettingUpdate<String>._('payment_help_image_url', _AdminSettingKind.string);
  static const paymentHelpText = Sub2ApiAdminSystemSettingUpdate<String>._('payment_help_text', _AdminSettingKind.string);
  static const paymentCancelRateLimitEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('payment_cancel_rate_limit_enabled', _AdminSettingKind.boolean);
  static const paymentCancelRateLimitMax = Sub2ApiAdminSystemSettingUpdate<int>._('payment_cancel_rate_limit_max', _AdminSettingKind.integer);
  static const paymentCancelRateLimitWindow = Sub2ApiAdminSystemSettingUpdate<int>._('payment_cancel_rate_limit_window', _AdminSettingKind.integer);
  static const paymentCancelRateLimitUnit = Sub2ApiAdminSystemSettingUpdate<String>._('payment_cancel_rate_limit_unit', _AdminSettingKind.string);
  static const paymentCancelRateLimitWindowMode = Sub2ApiAdminSystemSettingUpdate<String>._('payment_cancel_rate_limit_window_mode', _AdminSettingKind.string);
  static const paymentAlipayForceQrcode = Sub2ApiAdminSystemSettingUpdate<bool>._('payment_alipay_force_qrcode', _AdminSettingKind.boolean);
  static const paymentAlipayMobilePrecreateDeepLink = Sub2ApiAdminSystemSettingUpdate<bool>._('payment_alipay_mobile_precreate_deep_link', _AdminSettingKind.boolean);
  static const channelMonitorEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('channel_monitor_enabled', _AdminSettingKind.boolean);
  static const channelMonitorMode = Sub2ApiAdminSystemSettingUpdate<String>._('channel_monitor_mode', _AdminSettingKind.string);
  static const channelMonitorDefaultIntervalSeconds = Sub2ApiAdminSystemSettingUpdate<int>._('channel_monitor_default_interval_seconds', _AdminSettingKind.integer);
  static const channelMonitorHideThroughput = Sub2ApiAdminSystemSettingUpdate<bool>._('channel_monitor_hide_throughput', _AdminSettingKind.boolean);
  static const channelMonitorShowQuota = Sub2ApiAdminSystemSettingUpdate<bool>._('channel_monitor_show_quota', _AdminSettingKind.boolean);
  static const grokDefaultTextModel = Sub2ApiAdminSystemSettingUpdate<String>._('grok_default_text_model', _AdminSettingKind.string);
  static const grokCrossClientModelMapEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('grok_cross_client_model_map_enabled', _AdminSettingKind.boolean);
  static const grokDefaultBaseUrlMode = Sub2ApiAdminSystemSettingUpdate<String>._('grok_default_base_url_mode', _AdminSettingKind.string);
  static const availableChannelsEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('available_channels_enabled', _AdminSettingKind.boolean);
  static const modelPlazaEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('model_plaza_enabled', _AdminSettingKind.boolean);
  static const modelPlazaRequireAuth = Sub2ApiAdminSystemSettingUpdate<bool>._('model_plaza_require_auth', _AdminSettingKind.boolean);
  static const modelPlazaDescription = Sub2ApiAdminSystemSettingUpdate<String>._('model_plaza_description', _AdminSettingKind.string);
  static const pluginManagementEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('plugin_management_enabled', _AdminSettingKind.boolean);
  static const affiliateEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('affiliate_enabled', _AdminSettingKind.boolean);
  static const riskControlEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('risk_control_enabled', _AdminSettingKind.boolean);
  static const cyberSessionBlockEnabled = Sub2ApiAdminSystemSettingUpdate<bool>._('cyber_session_block_enabled', _AdminSettingKind.boolean);
  static const cyberSessionBlockTtlSeconds = Sub2ApiAdminSystemSettingUpdate<int>._('cyber_session_block_ttl_seconds', _AdminSettingKind.integer);
  static const openaiFastPolicySettings = Sub2ApiAdminSystemSettingUpdate<Sub2ApiAdminOpenAIFastPolicySettings>._('openai_fast_policy_settings', _AdminSettingKind.openAIFastPolicy);
  static const defaultPlatformQuotas = Sub2ApiAdminSystemSettingUpdate<Map<String, Sub2ApiAdminPlatformQuota>>._('default_platform_quotas', _AdminSettingKind.quotaMap);
  static const accountSchedulingThresholds = Sub2ApiAdminSystemSettingUpdate<Map<String, int>>._('account_scheduling_thresholds', _AdminSettingKind.intMap);
  static const authSourceDefaultEmailPlatformQuotas = Sub2ApiAdminSystemSettingUpdate<Map<String, Sub2ApiAdminPlatformQuota>>._('auth_source_default_email_platform_quotas', _AdminSettingKind.quotaMap);
  static const authSourceDefaultLinuxdoPlatformQuotas = Sub2ApiAdminSystemSettingUpdate<Map<String, Sub2ApiAdminPlatformQuota>>._('auth_source_default_linuxdo_platform_quotas', _AdminSettingKind.quotaMap);
  static const authSourceDefaultOidcPlatformQuotas = Sub2ApiAdminSystemSettingUpdate<Map<String, Sub2ApiAdminPlatformQuota>>._('auth_source_default_oidc_platform_quotas', _AdminSettingKind.quotaMap);
  static const authSourceDefaultWechatPlatformQuotas = Sub2ApiAdminSystemSettingUpdate<Map<String, Sub2ApiAdminPlatformQuota>>._('auth_source_default_wechat_platform_quotas', _AdminSettingKind.quotaMap);
  static const authSourceDefaultGithubPlatformQuotas = Sub2ApiAdminSystemSettingUpdate<Map<String, Sub2ApiAdminPlatformQuota>>._('auth_source_default_github_platform_quotas', _AdminSettingKind.quotaMap);
  static const authSourceDefaultGooglePlatformQuotas = Sub2ApiAdminSystemSettingUpdate<Map<String, Sub2ApiAdminPlatformQuota>>._('auth_source_default_google_platform_quotas', _AdminSettingKind.quotaMap);
  static const authSourceDefaultDingtalkPlatformQuotas = Sub2ApiAdminSystemSettingUpdate<Map<String, Sub2ApiAdminPlatformQuota>>._('auth_source_default_dingtalk_platform_quotas', _AdminSettingKind.quotaMap);
  static const allowUserViewErrorRequests = Sub2ApiAdminSystemSettingUpdate<bool>._('allow_user_view_error_requests', _AdminSettingKind.boolean);
}
// dart format on
