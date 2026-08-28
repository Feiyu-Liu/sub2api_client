import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_user_account.dart';
import '../../shared/session/sub2api_session.dart';

export '../../shared/models/sub2api_user_account.dart';

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

/// Full authenticated-user and role snapshot returned by `/auth/me`.
@freezed
abstract class Sub2ApiCurrentUser with _$Sub2ApiCurrentUser {
  const Sub2ApiCurrentUser._();

  const factory Sub2ApiCurrentUser({
    required Sub2ApiUserAccountSnapshot account,
    required String runMode,
  }) = _Sub2ApiCurrentUser;

  int get id => account.id;
  String get email => account.email;
  String get username => account.username;
  String get role => account.role;
  Sub2ApiDecimal get balance => account.balance;
  Sub2ApiDecimal get frozenBalance => account.frozenBalance;
  int get concurrency => account.concurrency;
  String get status => account.status;
  List<int> get allowedGroups => account.allowedGroups;
  bool get balanceNotifyEnabled => account.balanceNotifyEnabled;
  String get balanceNotifyThresholdType => account.balanceNotifyThresholdType;
  Sub2ApiDecimal? get balanceNotifyThreshold => account.balanceNotifyThreshold;
  List<Sub2ApiNotifyEmailEntry> get balanceNotifyExtraEmails =>
      account.balanceNotifyExtraEmails;
  Sub2ApiDecimal get totalRecharged => account.totalRecharged;
  int get rpmLimit => account.rpmLimit;
  DateTime get createdAt => account.createdAt;
  DateTime get updatedAt => account.updatedAt;
  Sub2ApiUserIdentitySet get identities => account.identities;
  Map<String, Sub2ApiIdentityBinding> get authBindings => account.authBindings;
  Map<String, Sub2ApiIdentityBinding> get identityBindings =>
      account.identityBindings;
  bool get emailBound => account.emailBound;
  bool get linuxDoBound => account.linuxDoBound;
  bool get oidcBound => account.oidcBound;
  bool get weChatBound => account.weChatBound;
  bool get dingTalkBound => account.dingTalkBound;
  DateTime? get lastActiveAt => account.lastActiveAt;
  DateTime? get deletedAt => account.deletedAt;
  String? get avatarUrl => account.avatarUrl;
  Sub2ApiProfileSourceContext? get avatarSource => account.avatarSource;
  Sub2ApiProfileSourceContext? get usernameSource => account.usernameSource;
  Sub2ApiProfileSourceContext? get displayNameSource =>
      account.displayNameSource;
  Sub2ApiProfileSourceContext? get nicknameSource => account.nicknameSource;
  Map<String, Sub2ApiProfileSourceContext>? get profileSources =>
      account.profileSources;
}

/// Acknowledgement after every session for the current user is revoked.
final class Sub2ApiRevokeAllSessionsResult {
  const Sub2ApiRevokeAllSessionsResult({required this.message});

  final String message;
}

/// Captcha proof accepted by the fixed Sub2API authentication endpoints.
final class Sub2ApiCaptchaProof {
  const Sub2ApiCaptchaProof({
    this.challengeToken,
    this.tencentCaptchaRandstr,
    this.tencentCaptchaTicket,
    @Deprecated('Use challengeToken for Turnstile or Aliyun captcha proofs.')
    this.turnstileToken,
  }) : assert(
         challengeToken == null || turnstileToken == null,
         'Provide challengeToken or turnstileToken, not both.',
       );

  /// Opaque proof serialized to Sub2API's legacy `turnstile_token` wire field.
  ///
  /// Sub2API v0.1.183 also uses this field for Aliyun captcha verification.
  final String? challengeToken;
  final String? tencentCaptchaRandstr;
  final String? tencentCaptchaTicket;

  /// Legacy name retained for source compatibility with v0.1.155 callers.
  @Deprecated('Use challengeToken for Turnstile or Aliyun captcha proofs.')
  final String? turnstileToken;

  /// Package-internal value sent through the shared captcha wire field.
  String? get wireChallengeToken => challengeToken ?? turnstileToken;

  @override
  String toString() => 'Sub2ApiCaptchaProof(<redacted>)';
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
  final Sub2ApiVerificationCode? verificationCode;

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
  final Sub2ApiVerificationCode totpCode;

  @override
  String toString() =>
      'Sub2ApiTwoFactorLoginRequest(temporaryToken: <redacted>, totpCode: <redacted>)';
}

/// Request to send the registration email verification code.
final class Sub2ApiEmailVerificationCodeRequest {
  const Sub2ApiEmailVerificationCodeRequest({
    required this.email,
    this.captcha = const Sub2ApiCaptchaProof(),
  });

  /// Captcha proof if the server requires it for this public endpoint.
  final Sub2ApiCaptchaProof captcha;

  /// Destination address for the verification email.
  final String email;

  @override
  String toString() =>
      'Sub2ApiEmailVerificationCodeRequest(email: $email, captcha: <redacted>)';
}

/// Server acknowledgement for an email verification-code delivery attempt.
final class Sub2ApiEmailVerificationCodeSent {
  const Sub2ApiEmailVerificationCodeSent({
    required this.cooldown,
    required this.message,
  });

  /// Minimum wait before requesting another code.
  final Duration cooldown;

  /// Server-supplied non-sensitive acknowledgement.
  final String message;
}

/// Request to validate an invitation code before registration.
final class Sub2ApiInvitationCodeValidationRequest {
  const Sub2ApiInvitationCodeValidationRequest({required this.code});

  /// Invitation code to validate.
  final String code;
}

/// Result of invitation-code validation.
final class Sub2ApiInvitationCodeValidation {
  const Sub2ApiInvitationCodeValidation({
    required this.isValid,
    this.errorCode,
  });

  /// Server error code when [isValid] is false.
  final String? errorCode;

  /// Whether the invitation code may be used for registration.
  final bool isValid;
}

/// Request to validate a registration promo code before account creation.
final class Sub2ApiPromoCodeValidationRequest {
  const Sub2ApiPromoCodeValidationRequest({required this.code});

  final String code;
}

/// Promo-code validity and optional exact registration bonus.
final class Sub2ApiPromoCodeValidation {
  const Sub2ApiPromoCodeValidation({
    required this.isValid,
    this.bonusAmount,
    this.errorCode,
    this.message,
  });

  final Sub2ApiDecimal? bonusAmount;
  final String? errorCode;
  final bool isValid;
  final String? message;
}

/// Request for an email password-reset link.
final class Sub2ApiForgotPasswordRequest {
  const Sub2ApiForgotPasswordRequest({
    required this.email,
    this.captcha = const Sub2ApiCaptchaProof(),
  });

  /// Captcha proof if the server requires it for this public endpoint.
  final Sub2ApiCaptchaProof captcha;

  /// Account email address.
  final String email;

  @override
  String toString() =>
      'Sub2ApiForgotPasswordRequest(email: $email, captcha: <redacted>)';
}

/// Server acknowledgement for a password-reset-link request.
final class Sub2ApiForgotPasswordResult {
  const Sub2ApiForgotPasswordResult({required this.message});

  /// Server-supplied non-sensitive acknowledgement.
  final String message;
}

/// Credentials used to reset a password from a reset-link token.
final class Sub2ApiResetPasswordRequest {
  const Sub2ApiResetPasswordRequest({
    required this.email,
    required this.newPassword,
    required this.token,
  });

  /// Account email address.
  final String email;

  /// Replacement password. It is always redacted when stringified.
  final Sub2ApiPassword newPassword;

  /// Single-use reset token. It is always redacted when stringified.
  final Sub2ApiPasswordResetToken token;

  @override
  String toString() =>
      'Sub2ApiResetPasswordRequest(email: $email, token: <redacted>, '
      'newPassword: <redacted>)';
}

/// Server acknowledgement after a successful password reset.
final class Sub2ApiResetPasswordResult {
  const Sub2ApiResetPasswordResult({required this.message});

  /// Server-supplied non-sensitive acknowledgement.
  final String message;
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
