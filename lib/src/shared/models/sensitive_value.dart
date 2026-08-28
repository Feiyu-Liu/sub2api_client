sealed class _SensitiveValue {
  const _SensitiveValue(this._value);

  final String _value;

  /// Explicitly reveals the secret for persistence or an authorized operation.
  String reveal() => _value;

  @override
  String toString() => '<redacted>';
}

/// Bearer access token. Stringification is always redacted.
final class Sub2ApiAccessToken extends _SensitiveValue {
  const Sub2ApiAccessToken(super.value);
}

/// Rotating refresh token. Stringification is always redacted.
final class Sub2ApiRefreshToken extends _SensitiveValue {
  const Sub2ApiRefreshToken(super.value);
}

/// API/Installation Key secret. Stringification is always redacted.
final class Sub2ApiApiKeySecret extends _SensitiveValue {
  const Sub2ApiApiKeySecret(super.value);
}

/// Admin API Key used only by [Sub2ApiOpsClient]-style automation entrypoints.
/// Stringification is always redacted.
final class Sub2ApiAdminApiKey extends _SensitiveValue {
  const Sub2ApiAdminApiKey(super.value);
}

/// Checkout value that may itself grant payment authority.
final class Sub2ApiCheckoutSecret extends _SensitiveValue {
  const Sub2ApiCheckoutSecret(super.value);
}

/// A password supplied to an authentication operation.
///
/// Passwords are intentionally not JSON serializable and are always redacted
/// when interpolated into logs or exception messages.
final class Sub2ApiPassword extends _SensitiveValue {
  const Sub2ApiPassword(super.value);
}

/// A one-time verification code supplied to an authentication operation.
final class Sub2ApiVerificationCode extends _SensitiveValue {
  const Sub2ApiVerificationCode(super.value);
}

/// Registration promo code that grants account balance authority.
final class Sub2ApiPromoCode extends _SensitiveValue {
  const Sub2ApiPromoCode(super.value);
}

/// Short-lived token used to complete a two-factor authentication challenge.
final class Sub2ApiTwoFactorTemporaryToken extends _SensitiveValue {
  const Sub2ApiTwoFactorTemporaryToken(super.value);
}

/// A single-use token from a password-reset link.
final class Sub2ApiPasswordResetToken extends _SensitiveValue {
  const Sub2ApiPasswordResetToken(super.value);
}

/// One-time token binding a WebAuthn ceremony to its server-side state.
final class Sub2ApiPasskeySessionToken extends _SensitiveValue {
  const Sub2ApiPasskeySessionToken(super.value);
}

/// Base32 TOTP seed used to enroll an authenticator.
final class Sub2ApiTotpSecret extends _SensitiveValue {
  const Sub2ApiTotpSecret(super.value);
}

/// `otpauth://` enrollment URI containing the TOTP seed.
final class Sub2ApiTotpQrCodeUri extends _SensitiveValue {
  const Sub2ApiTotpQrCodeUri(super.value);
}

/// One-time token binding a TOTP setup attempt to its server-side state.
final class Sub2ApiTotpSetupToken extends _SensitiveValue {
  const Sub2ApiTotpSetupToken(super.value);
}

/// Legacy short-lived token used by an OAuth pending-account flow.
final class Sub2ApiOAuthPendingToken extends _SensitiveValue {
  const Sub2ApiOAuthPendingToken(super.value);
}

/// Short-lived server-side OAuth PKCE session identifier.
final class Sub2ApiAdminOAuthSessionId extends _SensitiveValue {
  const Sub2ApiAdminOAuthSessionId(super.value);
}

/// CSRF state binding an administrator OAuth authorization ceremony.
final class Sub2ApiAdminOAuthState extends _SensitiveValue {
  const Sub2ApiAdminOAuthState(super.value);
}

/// Single-use authorization code returned by an OAuth provider.
final class Sub2ApiOAuthAuthorizationCode extends _SensitiveValue {
  const Sub2ApiOAuthAuthorizationCode(super.value);
}

/// Browser session key used for cookie-assisted OAuth authorization.
final class Sub2ApiOAuthCookieSessionKey extends _SensitiveValue {
  const Sub2ApiOAuthCookieSessionKey(super.value);
}

/// Provider credential value accepted by Admin account write operations.
final class Sub2ApiAdminCredentialSecret extends _SensitiveValue {
  const Sub2ApiAdminCredentialSecret(super.value);
}

/// Server-masked administrator credential preview.
///
/// Even a short prefix is treated as sensitive and redacted from string output.
final class Sub2ApiAdminMaskedCredential extends _SensitiveValue {
  const Sub2ApiAdminMaskedCredential(super.value);
}

/// Content supplied only to an administrator moderation connectivity test.
final class Sub2ApiAdminModerationPrompt extends _SensitiveValue {
  const Sub2ApiAdminModerationPrompt(super.value);
}

/// Image URL or data URL supplied to an administrator moderation test.
final class Sub2ApiAdminModerationImage extends _SensitiveValue {
  const Sub2ApiAdminModerationImage(super.value);
}

/// User-content excerpt visible only in administrator risk-control logs.
final class Sub2ApiAdminModerationExcerpt extends _SensitiveValue {
  const Sub2ApiAdminModerationExcerpt(super.value);
}

/// OpenAI OAuth ID token returned only to privileged management callers.
final class Sub2ApiOpenAIIdToken extends _SensitiveValue {
  const Sub2ApiOpenAIIdToken(super.value);
}

/// Codex `at-*` personal access token used to create an OpenAI account.
final class Sub2ApiOpenAICodexPersonalAccessToken extends _SensitiveValue {
  const Sub2ApiOpenAICodexPersonalAccessToken(super.value);
}

/// Short-lived bridge token embedded in a privileged plugin UI session.
final class Sub2ApiAdminPluginBridgeToken extends _SensitiveValue {
  const Sub2ApiAdminPluginBridgeToken(super.value);
}

/// Capability URL granting temporary access to isolated plugin UI assets.
final class Sub2ApiAdminPluginUiUrl extends _SensitiveValue {
  const Sub2ApiAdminPluginUiUrl(super.value);
}

/// Bearer token configured for a prompt-audit guard endpoint.
final class Sub2ApiAdminPromptAuditEndpointToken extends _SensitiveValue {
  const Sub2ApiAdminPromptAuditEndpointToken(super.value);
}

/// Prompt or preview content visible only to privileged audit operators.
final class Sub2ApiAdminPromptAuditContent extends _SensitiveValue {
  const Sub2ApiAdminPromptAuditContent(super.value);
}

/// Scanner evidence that may contain excerpts from audited prompts.
final class Sub2ApiAdminPromptAuditEvidence extends _SensitiveValue {
  const Sub2ApiAdminPromptAuditEvidence(super.value);
}

/// Short-lived capability proving a prompt-audit filter deletion preview.
final class Sub2ApiAdminPromptAuditDeleteToken extends _SensitiveValue {
  const Sub2ApiAdminPromptAuditDeleteToken(super.value);
}

/// Administrator-visible redeem code granting balance, quota, or subscription value.
final class Sub2ApiRedeemCodeSecret extends _SensitiveValue {
  const Sub2ApiRedeemCodeSecret(super.value);
}

/// CSV export containing administrator-visible redeem codes.
final class Sub2ApiAdminRedeemCodeExport extends _SensitiveValue {
  const Sub2ApiAdminRedeemCodeExport(super.value);
}

/// Checkout URL, QR payload, or QR image returned to a payment administrator.
final class Sub2ApiAdminPaymentCheckoutSecret extends _SensitiveValue {
  const Sub2ApiAdminPaymentCheckoutSecret(super.value);
}

/// Serialized payment audit detail that may contain provider references.
final class Sub2ApiAdminPaymentAuditDetail extends _SensitiveValue {
  const Sub2ApiAdminPaymentAuditDetail(super.value);
}

/// SMTP password used only by an administrator connectivity test.
final class Sub2ApiAdminSmtpPassword extends _SensitiveValue {
  const Sub2ApiAdminSmtpPassword(super.value);
}

/// Administrator-authored or rendered notification email HTML.
final class Sub2ApiAdminEmailTemplateContent extends _SensitiveValue {
  const Sub2ApiAdminEmailTemplateContent(super.value);
}

/// Secret value accepted by the whole-document administrator settings patch.
final class Sub2ApiAdminSettingSecret extends _SensitiveValue {
  const Sub2ApiAdminSettingSecret(super.value);
}

/// Authorization URL containing a Grok OAuth state and PKCE ceremony context.
final class Sub2ApiGrokOAuthAuthorizationUrl extends _SensitiveValue {
  const Sub2ApiGrokOAuthAuthorizationUrl(super.value);
}

/// Server-side session identifier for a single Grok OAuth code exchange.
final class Sub2ApiGrokOAuthSessionId extends _SensitiveValue {
  const Sub2ApiGrokOAuthSessionId(super.value);
}

/// CSRF state returned by a Grok OAuth authorization ceremony.
final class Sub2ApiGrokOAuthState extends _SensitiveValue {
  const Sub2ApiGrokOAuthState(super.value);
}

/// Web SSO cookie token accepted only for an ephemeral Grok conversion.
final class Sub2ApiGrokSsoToken extends _SensitiveValue {
  const Sub2ApiGrokSsoToken(super.value);
}

/// Grok OAuth ID token returned to a privileged management caller.
final class Sub2ApiGrokIdToken extends _SensitiveValue {
  const Sub2ApiGrokIdToken(super.value);
}

/// Error/request content visible only to privileged operations personnel.
final class Sub2ApiAdminOpsErrorContent extends _SensitiveValue {
  const Sub2ApiAdminOpsErrorContent(super.value);
}

/// Client network address visible only to privileged operations personnel.
final class Sub2ApiAdminOpsClientAddress extends _SensitiveValue {
  const Sub2ApiAdminOpsClientAddress(super.value);
}

/// System-log message or structured extra content visible only to operators.
final class Sub2ApiAdminOpsSystemLogContent extends _SensitiveValue {
  const Sub2ApiAdminOpsSystemLogContent(super.value);
}

/// S3 access-key identifier used by backup and image-storage configuration.
final class Sub2ApiAdminBackupAccessKeyId extends _SensitiveValue {
  const Sub2ApiAdminBackupAccessKeyId(super.value);
}

/// S3 secret access key used by backup and image-storage configuration.
final class Sub2ApiAdminBackupSecretAccessKey extends _SensitiveValue {
  const Sub2ApiAdminBackupSecretAccessKey(super.value);
}

/// Object-store key identifying a privileged database backup artifact.
final class Sub2ApiAdminBackupObjectKey extends _SensitiveValue {
  const Sub2ApiAdminBackupObjectKey(super.value);
}

/// Presigned URL granting temporary download access to a database backup.
final class Sub2ApiAdminBackupDownloadUrl extends _SensitiveValue {
  const Sub2ApiAdminBackupDownloadUrl(super.value);
}

/// Local filesystem or Unix-socket path returned by data management.
final class Sub2ApiAdminDataManagementPath extends _SensitiveValue {
  const Sub2ApiAdminDataManagementPath(super.value);
}

/// Authorized account-data archive returned by an administrator export.
///
/// The JSON payload can contain provider credentials and proxy passwords, so
/// stringification is always redacted and access requires an explicit reveal.
final class Sub2ApiAdminAccountDataArchive extends _SensitiveValue {
  const Sub2ApiAdminAccountDataArchive(super.value);
}

/// Codex session, access token, JSONL bundle, or Agent Identity payload.
///
/// The opaque content can contain OAuth tokens or a provider private key.
final class Sub2ApiAdminCodexSessionPayload extends _SensitiveValue {
  const Sub2ApiAdminCodexSessionPayload(super.value);
}

/// Password carried by an administrator proxy-management response or request.
final class Sub2ApiAdminProxyPassword extends _SensitiveValue {
  const Sub2ApiAdminProxyPassword(super.value);
}

/// Authorized proxy-only migration archive containing proxy passwords.
final class Sub2ApiAdminProxyDataArchive extends _SensitiveValue {
  const Sub2ApiAdminProxyDataArchive(super.value);
}

/// Signed token carried by a notification-email unsubscribe link.
final class Sub2ApiNotificationUnsubscribeToken extends _SensitiveValue {
  const Sub2ApiNotificationUnsubscribeToken(super.value);
}

/// Browser Cookie header used to configure the optional Ollama Cloud usage
/// probe. Stringification is always redacted.
final class Sub2ApiOllamaCloudSession extends _SensitiveValue {
  const Sub2ApiOllamaCloudSession(super.value);
}
