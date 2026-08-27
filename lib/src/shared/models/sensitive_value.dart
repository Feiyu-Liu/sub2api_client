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

/// Single-use authorization code returned by an OAuth provider.
final class Sub2ApiOAuthAuthorizationCode extends _SensitiveValue {
  const Sub2ApiOAuthAuthorizationCode(super.value);
}

/// Browser session key used for cookie-assisted OAuth authorization.
final class Sub2ApiOAuthCookieSessionKey extends _SensitiveValue {
  const Sub2ApiOAuthCookieSessionKey(super.value);
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
