// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey_wire_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasskeyCredentialDescriptorWireDto _$PasskeyCredentialDescriptorWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PasskeyCredentialDescriptorWireDto', json, (
  $checkedConvert,
) {
  final val = PasskeyCredentialDescriptorWireDto(
    id: $checkedConvert('id', (v) => v as String),
    transports: $checkedConvert(
      'transports',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    ),
    type: $checkedConvert('type', (v) => v as String),
  );
  return val;
});

PasskeyRequestOptionsWireDto _$PasskeyRequestOptionsWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PasskeyRequestOptionsWireDto',
  json,
  ($checkedConvert) {
    final val = PasskeyRequestOptionsWireDto(
      allowedCredentials: $checkedConvert(
        'allowCredentials',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => PasskeyCredentialDescriptorWireDto.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      challenge: $checkedConvert('challenge', (v) => v as String),
      hints: $checkedConvert(
        'hints',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      ),
      relyingPartyId: $checkedConvert('rpId', (v) => v as String?),
      timeoutMilliseconds: $checkedConvert(
        'timeout',
        (v) => (v as num?)?.toInt(),
      ),
      userVerification: $checkedConvert(
        'userVerification',
        (v) => v as String?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'allowedCredentials': 'allowCredentials',
    'relyingPartyId': 'rpId',
    'timeoutMilliseconds': 'timeout',
  },
);

PasskeyAssertionOptionsWireDto _$PasskeyAssertionOptionsWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PasskeyAssertionOptionsWireDto', json, ($checkedConvert) {
  final val = PasskeyAssertionOptionsWireDto(
    publicKey: $checkedConvert(
      'publicKey',
      (v) => PasskeyRequestOptionsWireDto.fromJson(v as Map<String, dynamic>),
    ),
    mediation: $checkedConvert('mediation', (v) => v as String?),
  );
  return val;
});

PasskeyLoginChallengeWireDto _$PasskeyLoginChallengeWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PasskeyLoginChallengeWireDto',
  json,
  ($checkedConvert) {
    final val = PasskeyLoginChallengeWireDto(
      options: $checkedConvert(
        'options',
        (v) =>
            PasskeyAssertionOptionsWireDto.fromJson(v as Map<String, dynamic>),
      ),
      sessionToken: $checkedConvert('session_token', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'sessionToken': 'session_token'},
);

PasskeyRelyingPartyWireDto _$PasskeyRelyingPartyWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PasskeyRelyingPartyWireDto', json, ($checkedConvert) {
  final val = PasskeyRelyingPartyWireDto(
    id: $checkedConvert('id', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
  );
  return val;
});

PasskeyUserWireDto _$PasskeyUserWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PasskeyUserWireDto', json, ($checkedConvert) {
      final val = PasskeyUserWireDto(
        displayName: $checkedConvert('displayName', (v) => v as String),
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

PasskeyCredentialParameterWireDto _$PasskeyCredentialParameterWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PasskeyCredentialParameterWireDto', json, (
  $checkedConvert,
) {
  final val = PasskeyCredentialParameterWireDto(
    algorithm: $checkedConvert('alg', (v) => (v as num).toInt()),
    type: $checkedConvert('type', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'algorithm': 'alg'});

PasskeyAuthenticatorSelectionWireDto
_$PasskeyAuthenticatorSelectionWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PasskeyAuthenticatorSelectionWireDto', json, (
      $checkedConvert,
    ) {
      final val = PasskeyAuthenticatorSelectionWireDto(
        authenticatorAttachment: $checkedConvert(
          'authenticatorAttachment',
          (v) => v as String?,
        ),
        requireResidentKey: $checkedConvert(
          'requireResidentKey',
          (v) => v as bool?,
        ),
        residentKey: $checkedConvert('residentKey', (v) => v as String?),
        userVerification: $checkedConvert(
          'userVerification',
          (v) => v as String?,
        ),
      );
      return val;
    });

PasskeyExtensionsInputWireDto _$PasskeyExtensionsInputWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PasskeyExtensionsInputWireDto',
  json,
  ($checkedConvert) {
    final val = PasskeyExtensionsInputWireDto(
      credentialProperties: $checkedConvert(
        'credProps',
        (v) => v as bool? ?? false,
      ),
    );
    return val;
  },
  fieldKeyMap: const {'credentialProperties': 'credProps'},
);

PasskeyCreationOptionsWireDto _$PasskeyCreationOptionsWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PasskeyCreationOptionsWireDto',
  json,
  ($checkedConvert) {
    final val = PasskeyCreationOptionsWireDto(
      attestationFormats: $checkedConvert(
        'attestationFormats',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      ),
      challenge: $checkedConvert('challenge', (v) => v as String),
      excludeCredentials: $checkedConvert(
        'excludeCredentials',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => PasskeyCredentialDescriptorWireDto.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      hints: $checkedConvert(
        'hints',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      ),
      parameters: $checkedConvert(
        'pubKeyCredParams',
        (v) => (v as List<dynamic>)
            .map(
              (e) => PasskeyCredentialParameterWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      relyingParty: $checkedConvert(
        'rp',
        (v) => PasskeyRelyingPartyWireDto.fromJson(v as Map<String, dynamic>),
      ),
      user: $checkedConvert(
        'user',
        (v) => PasskeyUserWireDto.fromJson(v as Map<String, dynamic>),
      ),
      attestation: $checkedConvert('attestation', (v) => v as String?),
      authenticatorSelection: $checkedConvert(
        'authenticatorSelection',
        (v) => v == null
            ? null
            : PasskeyAuthenticatorSelectionWireDto.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      extensions: $checkedConvert(
        'extensions',
        (v) => v == null
            ? null
            : PasskeyExtensionsInputWireDto.fromJson(v as Map<String, dynamic>),
      ),
      timeoutMilliseconds: $checkedConvert(
        'timeout',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'parameters': 'pubKeyCredParams',
    'relyingParty': 'rp',
    'timeoutMilliseconds': 'timeout',
  },
);

PasskeyCreationWrapperWireDto _$PasskeyCreationWrapperWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PasskeyCreationWrapperWireDto', json, ($checkedConvert) {
  final val = PasskeyCreationWrapperWireDto(
    publicKey: $checkedConvert(
      'publicKey',
      (v) => PasskeyCreationOptionsWireDto.fromJson(v as Map<String, dynamic>),
    ),
    mediation: $checkedConvert('mediation', (v) => v as String?),
  );
  return val;
});

PasskeyRegistrationChallengeWireDto
_$PasskeyRegistrationChallengeWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PasskeyRegistrationChallengeWireDto',
      json,
      ($checkedConvert) {
        final val = PasskeyRegistrationChallengeWireDto(
          options: $checkedConvert(
            'options',
            (v) => PasskeyCreationWrapperWireDto.fromJson(
              v as Map<String, dynamic>,
            ),
          ),
          sessionToken: $checkedConvert('session_token', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'sessionToken': 'session_token'},
    );

PasskeyCredentialSummaryWireDto _$PasskeyCredentialSummaryWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PasskeyCredentialSummaryWireDto',
  json,
  ($checkedConvert) {
    final val = PasskeyCredentialSummaryWireDto(
      backup: $checkedConvert('backup', (v) => v as bool),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      lastUsedAt: $checkedConvert(
        'last_used_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'createdAt': 'created_at', 'lastUsedAt': 'last_used_at'},
);
