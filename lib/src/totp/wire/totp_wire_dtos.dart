import 'package:json_annotation/json_annotation.dart';

import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../sub2api_totp_models.dart';

part 'totp_wire_dtos.g.dart';

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class TotpStatusWireDto {
  const TotpStatusWireDto({
    required this.enabled,
    required this.featureEnabled,
    this.enabledAt,
  });

  factory TotpStatusWireDto.fromJson(Map<String, Object?> json) =>
      _$TotpStatusWireDtoFromJson(json);

  final bool enabled;
  final int? enabledAt;
  final bool featureEnabled;

  Sub2ApiTotpStatus toPublicModel() {
    if (enabledAt != null && enabledAt! < 0) throw invalidTotpStatus;
    return Sub2ApiTotpStatus(
      enabled: enabled,
      enabledAt: enabledAt == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(
              enabledAt! * Duration.millisecondsPerSecond,
              isUtc: true,
            ),
      featureEnabled: featureEnabled,
    );
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class TotpVerificationMethodWireDto {
  const TotpVerificationMethodWireDto({required this.method});

  factory TotpVerificationMethodWireDto.fromJson(Map<String, Object?> json) =>
      _$TotpVerificationMethodWireDtoFromJson(json);

  final String method;

  Sub2ApiTotpVerificationMethod toPublicModel() => switch (method) {
    'email' => Sub2ApiTotpVerificationMethod.email,
    'password' => Sub2ApiTotpVerificationMethod.password,
    _ => throw invalidTotpVerificationMethod,
  };
}

@JsonSerializable(createToJson: false, checked: true)
final class TotpSuccessWireDto {
  const TotpSuccessWireDto({required this.success});

  factory TotpSuccessWireDto.fromJson(Map<String, Object?> json) =>
      _$TotpSuccessWireDtoFromJson(json);

  final bool success;

  void requireSuccess() {
    if (!success) throw invalidTotpMutationResponse;
  }
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class TotpSetupWireDto {
  const TotpSetupWireDto({
    required this.countdown,
    required this.qrCodeUrl,
    required this.secret,
    required this.setupToken,
  });

  factory TotpSetupWireDto.fromJson(Map<String, Object?> json) =>
      _$TotpSetupWireDtoFromJson(json);

  final int countdown;
  final String qrCodeUrl;
  final String secret;
  final String setupToken;

  Sub2ApiTotpSetupResult toPublicModel() {
    final uri = Uri.tryParse(qrCodeUrl);
    if (countdown <= 0 ||
        secret.isEmpty ||
        setupToken.isEmpty ||
        uri == null ||
        uri.scheme != 'otpauth') {
      throw invalidTotpSetupResponse;
    }
    return Sub2ApiTotpSetupResult(
      expiresIn: Duration(seconds: countdown),
      qrCodeUri: Sub2ApiTotpQrCodeUri(qrCodeUrl),
      secret: Sub2ApiTotpSecret(secret),
      setupToken: Sub2ApiTotpSetupToken(setupToken),
    );
  }
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class TotpStepUpWireDto {
  const TotpStepUpWireDto({required this.expiresIn, required this.verified});

  factory TotpStepUpWireDto.fromJson(Map<String, Object?> json) =>
      _$TotpStepUpWireDtoFromJson(json);

  final int expiresIn;
  final bool verified;

  Sub2ApiTotpStepUpGrant toPublicModel() {
    if (!verified || expiresIn <= 0) throw invalidTotpStepUpResponse;
    return Sub2ApiTotpStepUpGrant(
      expiresIn: Duration(seconds: expiresIn),
      verified: verified,
    );
  }
}

const invalidTotpStatus = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_totp_status',
  retryable: false,
);

const invalidTotpVerificationMethod = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_totp_verification_method',
  retryable: false,
);

const invalidTotpMutationResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_totp_mutation_response',
  retryable: false,
);

const invalidTotpSetupResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_totp_setup_response',
  retryable: false,
);

const invalidTotpStepUpResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_totp_step_up_response',
  retryable: false,
);
