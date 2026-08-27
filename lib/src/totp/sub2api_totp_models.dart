import 'package:freezed_annotation/freezed_annotation.dart';

import '../shared/models/sensitive_value.dart';

part 'sub2api_totp_models.freezed.dart';

/// Identity proof required for TOTP enrollment or removal.
enum Sub2ApiTotpVerificationMethod { email, password }

/// Identity proof used to enroll or remove TOTP.
sealed class Sub2ApiTotpIdentityProof {
  const Sub2ApiTotpIdentityProof();

  const factory Sub2ApiTotpIdentityProof.email(Sub2ApiVerificationCode code) =
      Sub2ApiTotpEmailProof;

  const factory Sub2ApiTotpIdentityProof.password(Sub2ApiPassword password) =
      Sub2ApiTotpPasswordProof;

  @override
  String toString() => 'Sub2ApiTotpIdentityProof(<redacted>)';
}

/// Email-code identity proof for a regular user.
final class Sub2ApiTotpEmailProof extends Sub2ApiTotpIdentityProof {
  const Sub2ApiTotpEmailProof(this.code);

  final Sub2ApiVerificationCode code;
}

/// Password identity proof, always required for administrator accounts.
final class Sub2ApiTotpPasswordProof extends Sub2ApiTotpIdentityProof {
  const Sub2ApiTotpPasswordProof(this.password);

  final Sub2ApiPassword password;
}

/// Sensitive authority returned while enrolling a TOTP authenticator.
final class Sub2ApiTotpSetupResult {
  const Sub2ApiTotpSetupResult({
    required this.secret,
    required this.qrCodeUri,
    required this.setupToken,
    required this.expiresIn,
  });

  final Duration expiresIn;
  final Sub2ApiTotpQrCodeUri qrCodeUri;
  final Sub2ApiTotpSecret secret;
  final Sub2ApiTotpSetupToken setupToken;

  @override
  String toString() =>
      'Sub2ApiTotpSetupResult(secret: <redacted>, qrCodeUri: <redacted>, '
      'setupToken: <redacted>, expiresIn: $expiresIn)';
}

/// Credentials that complete a pending TOTP enrollment.
final class Sub2ApiEnableTotpRequest {
  const Sub2ApiEnableTotpRequest({
    required this.code,
    required this.setupToken,
  });

  final Sub2ApiVerificationCode code;
  final Sub2ApiTotpSetupToken setupToken;

  @override
  String toString() => 'Sub2ApiEnableTotpRequest(<redacted>)';
}

/// Current TOTP feature availability and enrollment state.
@freezed
abstract class Sub2ApiTotpStatus with _$Sub2ApiTotpStatus {
  const factory Sub2ApiTotpStatus({
    required bool enabled,
    required bool featureEnabled,
    DateTime? enabledAt,
  }) = _Sub2ApiTotpStatus;
}

/// Session-bound authorization window granted after TOTP step-up.
@freezed
abstract class Sub2ApiTotpStepUpGrant with _$Sub2ApiTotpStepUpGrant {
  const factory Sub2ApiTotpStepUpGrant({
    required bool verified,
    required Duration expiresIn,
  }) = _Sub2ApiTotpStepUpGrant;
}
