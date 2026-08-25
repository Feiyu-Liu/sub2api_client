import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/models/sensitive_value.dart';
import '../../shared/session/sub2api_session.dart';

part 'sub2api_auth_models.freezed.dart';

/// Non-sensitive user identity supplied with a successful authentication.
@freezed
abstract class Sub2ApiAuthenticatedUser with _$Sub2ApiAuthenticatedUser {
  const factory Sub2ApiAuthenticatedUser({
    required int id,
    required String email,
    required String role,
    required String username,
  }) = _Sub2ApiAuthenticatedUser;
}

/// Captcha proof accepted by the fixed Sub2API authentication endpoints.
final class Sub2ApiCaptchaProof {
  const Sub2ApiCaptchaProof({
    this.tencentCaptchaRandstr,
    this.tencentCaptchaTicket,
    this.turnstileToken,
  });

  final String? tencentCaptchaRandstr;
  final String? tencentCaptchaTicket;
  final String? turnstileToken;
}

/// Credentials for password login.
final class Sub2ApiLoginRequest {
  const Sub2ApiLoginRequest({
    required this.email,
    required this.password,
    this.captcha = const Sub2ApiCaptchaProof(),
  });

  final Sub2ApiCaptchaProof captcha;
  final String email;
  final Sub2ApiPassword password;

  @override
  String toString() =>
      'Sub2ApiLoginRequest(email: $email, password: <redacted>)';
}

/// Credentials accepted by the password-registration endpoint.
final class Sub2ApiRegistrationRequest {
  const Sub2ApiRegistrationRequest({
    required this.email,
    required this.password,
    this.captcha = const Sub2ApiCaptchaProof(),
    this.affiliateCode,
    this.invitationCode,
    this.promoCode,
    this.verificationCode,
  });

  final String? affiliateCode;
  final Sub2ApiCaptchaProof captcha;
  final String email;
  final String? invitationCode;
  final Sub2ApiPassword password;
  final String? promoCode;
  final String? verificationCode;

  @override
  String toString() =>
      'Sub2ApiRegistrationRequest(email: $email, password: <redacted>)';
}

/// Credentials used to finish a pending two-factor login.
final class Sub2ApiTwoFactorLoginRequest {
  const Sub2ApiTwoFactorLoginRequest({
    required this.temporaryToken,
    required this.totpCode,
  });

  final Sub2ApiTwoFactorTemporaryToken temporaryToken;
  final String totpCode;

  @override
  String toString() =>
      'Sub2ApiTwoFactorLoginRequest(temporaryToken: <redacted>, totpCode: <redacted>)';
}

/// Token pair emitted by a successful refresh operation.
final class Sub2ApiRefreshedTokens {
  const Sub2ApiRefreshedTokens({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.tokenType,
  });

  final Sub2ApiAccessToken accessToken;
  final Duration expiresIn;
  final Sub2ApiRefreshToken refreshToken;
  final String tokenType;

  @override
  String toString() =>
      'Sub2ApiRefreshedTokens(accessToken: <redacted>, refreshToken: <redacted>, '
      'expiresIn: $expiresIn, tokenType: $tokenType)';
}

/// Outcome of password login before a session is written to its store.
@freezed
sealed class Sub2ApiLoginResult with _$Sub2ApiLoginResult {
  /// Login issued a usable authenticated session.
  const factory Sub2ApiLoginResult.authenticated({
    required Sub2ApiAuthenticatedUser user,
    required Sub2ApiSession session,
  }) = Sub2ApiAuthenticated;

  /// Login requires a separate TOTP completion request.
  const factory Sub2ApiLoginResult.twoFactorRequired({
    required Sub2ApiTwoFactorTemporaryToken temporaryToken,
    required String userEmailMasked,
  }) = Sub2ApiTwoFactorRequired;
}
