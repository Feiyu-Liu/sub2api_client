// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_wire_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityBindingInstructionWireDto _$IdentityBindingInstructionWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'IdentityBindingInstructionWireDto',
  json,
  ($checkedConvert) {
    final val = IdentityBindingInstructionWireDto(
      authorizeUrl: $checkedConvert('authorize_url', (v) => v as String),
      method: $checkedConvert('method', (v) => v as String),
      provider: $checkedConvert('provider', (v) => v as String),
      useBrowserRedirect: $checkedConvert(
        'use_browser_redirect',
        (v) => v as bool,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'authorizeUrl': 'authorize_url',
    'useBrowserRedirect': 'use_browser_redirect',
  },
);

IdentityCodeSentWireDto _$IdentityCodeSentWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('IdentityCodeSentWireDto', json, ($checkedConvert) {
  final val = IdentityCodeSentWireDto(
    message: $checkedConvert('message', (v) => v as String),
  );
  return val;
});
