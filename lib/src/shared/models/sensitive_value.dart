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

/// Short-lived token used to complete a two-factor authentication challenge.
final class Sub2ApiTwoFactorTemporaryToken extends _SensitiveValue {
  const Sub2ApiTwoFactorTemporaryToken(super.value);
}
