// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'totp_wire_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotpStatusWireDto _$TotpStatusWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TotpStatusWireDto',
      json,
      ($checkedConvert) {
        final val = TotpStatusWireDto(
          enabled: $checkedConvert('enabled', (v) => v as bool),
          featureEnabled: $checkedConvert('feature_enabled', (v) => v as bool),
          enabledAt: $checkedConvert('enabled_at', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'featureEnabled': 'feature_enabled',
        'enabledAt': 'enabled_at',
      },
    );

TotpVerificationMethodWireDto _$TotpVerificationMethodWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TotpVerificationMethodWireDto', json, ($checkedConvert) {
  final val = TotpVerificationMethodWireDto(
    method: $checkedConvert('method', (v) => v as String),
  );
  return val;
});

TotpSuccessWireDto _$TotpSuccessWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TotpSuccessWireDto', json, ($checkedConvert) {
      final val = TotpSuccessWireDto(
        success: $checkedConvert('success', (v) => v as bool),
      );
      return val;
    });

TotpSetupWireDto _$TotpSetupWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TotpSetupWireDto',
      json,
      ($checkedConvert) {
        final val = TotpSetupWireDto(
          countdown: $checkedConvert('countdown', (v) => (v as num).toInt()),
          qrCodeUrl: $checkedConvert('qr_code_url', (v) => v as String),
          secret: $checkedConvert('secret', (v) => v as String),
          setupToken: $checkedConvert('setup_token', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'qrCodeUrl': 'qr_code_url',
        'setupToken': 'setup_token',
      },
    );

TotpStepUpWireDto _$TotpStepUpWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TotpStepUpWireDto', json, ($checkedConvert) {
      final val = TotpStepUpWireDto(
        expiresIn: $checkedConvert('expires_in', (v) => (v as num).toInt()),
        verified: $checkedConvert('verified', (v) => v as bool),
      );
      return val;
    }, fieldKeyMap: const {'expiresIn': 'expires_in'});
