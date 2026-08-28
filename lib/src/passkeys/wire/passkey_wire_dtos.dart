import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../sub2api_passkey_models.dart';

part 'passkey_wire_dtos.g.dart';

@JsonSerializable(createToJson: false, checked: true)
final class PasskeyCredentialDescriptorWireDto {
  const PasskeyCredentialDescriptorWireDto({
    required this.id,
    required this.transports,
    required this.type,
  });

  factory PasskeyCredentialDescriptorWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$PasskeyCredentialDescriptorWireDtoFromJson(json);

  final String id;
  @JsonKey(defaultValue: <String>[])
  final List<String> transports;
  final String type;

  Sub2ApiWebAuthnCredentialDescriptor toPublicModel() {
    if (type.isEmpty) throw invalidPasskeyLoginOptions;
    return Sub2ApiWebAuthnCredentialDescriptor(
      type: type,
      id: _decodeBase64Url(id),
      transports: List<String>.unmodifiable(transports),
    );
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class PasskeyRequestOptionsWireDto {
  const PasskeyRequestOptionsWireDto({
    required this.allowedCredentials,
    required this.challenge,
    required this.hints,
    this.relyingPartyId,
    this.timeoutMilliseconds,
    this.userVerification,
  });

  factory PasskeyRequestOptionsWireDto.fromJson(Map<String, Object?> json) =>
      _$PasskeyRequestOptionsWireDtoFromJson(json);

  @JsonKey(
    name: 'allowCredentials',
    defaultValue: <PasskeyCredentialDescriptorWireDto>[],
  )
  final List<PasskeyCredentialDescriptorWireDto> allowedCredentials;
  final String challenge;
  @JsonKey(defaultValue: <String>[])
  final List<String> hints;
  @JsonKey(name: 'rpId')
  final String? relyingPartyId;
  @JsonKey(name: 'timeout')
  final int? timeoutMilliseconds;
  final String? userVerification;

  Sub2ApiWebAuthnRequestOptions toPublicModel() {
    final timeout = timeoutMilliseconds;
    if (timeout != null && timeout <= 0) throw invalidPasskeyLoginOptions;
    return Sub2ApiWebAuthnRequestOptions(
      challenge: _decodeBase64Url(challenge),
      allowedCredentials:
          List<Sub2ApiWebAuthnCredentialDescriptor>.unmodifiable(
            allowedCredentials.map((entry) => entry.toPublicModel()),
          ),
      hints: List<String>.unmodifiable(hints),
      relyingPartyId: relyingPartyId,
      timeout: timeout == null ? null : Duration(milliseconds: timeout),
      userVerification: userVerification,
    );
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class PasskeyAssertionOptionsWireDto {
  const PasskeyAssertionOptionsWireDto({
    required this.publicKey,
    this.mediation,
  });

  factory PasskeyAssertionOptionsWireDto.fromJson(Map<String, Object?> json) =>
      _$PasskeyAssertionOptionsWireDtoFromJson(json);

  final String? mediation;
  final PasskeyRequestOptionsWireDto publicKey;
}

@JsonSerializable(createToJson: false, checked: true)
final class PasskeyLoginChallengeWireDto {
  const PasskeyLoginChallengeWireDto({
    required this.options,
    required this.sessionToken,
  });

  factory PasskeyLoginChallengeWireDto.fromJson(Map<String, Object?> json) =>
      _$PasskeyLoginChallengeWireDtoFromJson(json);

  final PasskeyAssertionOptionsWireDto options;
  @JsonKey(name: 'session_token')
  final String sessionToken;

  Sub2ApiPasskeyLoginChallenge toPublicModel() {
    if (sessionToken.isEmpty) throw invalidPasskeyLoginOptions;
    return Sub2ApiPasskeyLoginChallenge(
      sessionToken: Sub2ApiPasskeySessionToken(sessionToken),
      options: options.publicKey.toPublicModel(),
      mediation: options.mediation,
    );
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class PasskeyRelyingPartyWireDto {
  const PasskeyRelyingPartyWireDto({required this.id, required this.name});

  factory PasskeyRelyingPartyWireDto.fromJson(Map<String, Object?> json) =>
      _$PasskeyRelyingPartyWireDtoFromJson(json);

  final String id;
  final String name;

  Sub2ApiWebAuthnRelyingParty toPublicModel() {
    if (id.isEmpty || name.isEmpty) throw invalidPasskeyRegistrationOptions;
    return Sub2ApiWebAuthnRelyingParty(id: id, name: name);
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class PasskeyUserWireDto {
  const PasskeyUserWireDto({
    required this.displayName,
    required this.id,
    required this.name,
  });

  factory PasskeyUserWireDto.fromJson(Map<String, Object?> json) =>
      _$PasskeyUserWireDtoFromJson(json);

  final String displayName;
  final String id;
  final String name;

  Sub2ApiWebAuthnUser toPublicModel() {
    if (name.isEmpty || displayName.isEmpty) {
      throw invalidPasskeyRegistrationOptions;
    }
    return Sub2ApiWebAuthnUser(
      displayName: displayName,
      id: _decodeBase64Url(id),
      name: name,
    );
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class PasskeyCredentialParameterWireDto {
  const PasskeyCredentialParameterWireDto({
    required this.algorithm,
    required this.type,
  });

  factory PasskeyCredentialParameterWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$PasskeyCredentialParameterWireDtoFromJson(json);

  @JsonKey(name: 'alg')
  final int algorithm;
  final String type;

  Sub2ApiWebAuthnCredentialParameter toPublicModel() {
    if (type.isEmpty) throw invalidPasskeyRegistrationOptions;
    return Sub2ApiWebAuthnCredentialParameter(algorithm: algorithm, type: type);
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class PasskeyAuthenticatorSelectionWireDto {
  const PasskeyAuthenticatorSelectionWireDto({
    this.authenticatorAttachment,
    this.requireResidentKey,
    this.residentKey,
    this.userVerification,
  });

  factory PasskeyAuthenticatorSelectionWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$PasskeyAuthenticatorSelectionWireDtoFromJson(json);

  final String? authenticatorAttachment;
  final bool? requireResidentKey;
  final String? residentKey;
  final String? userVerification;

  Sub2ApiWebAuthnAuthenticatorSelection toPublicModel() =>
      Sub2ApiWebAuthnAuthenticatorSelection(
        authenticatorAttachment: authenticatorAttachment,
        requireResidentKey: requireResidentKey,
        residentKey: residentKey,
        userVerification: userVerification,
      );
}

@JsonSerializable(createToJson: false, checked: true)
final class PasskeyExtensionsInputWireDto {
  const PasskeyExtensionsInputWireDto({this.credentialProperties = false});

  factory PasskeyExtensionsInputWireDto.fromJson(Map<String, Object?> json) =>
      _$PasskeyExtensionsInputWireDtoFromJson(json);

  @JsonKey(name: 'credProps', defaultValue: false)
  final bool credentialProperties;

  Sub2ApiWebAuthnExtensionsInput toPublicModel() =>
      Sub2ApiWebAuthnExtensionsInput(
        credentialProperties: credentialProperties,
      );
}

@JsonSerializable(createToJson: false, checked: true)
final class PasskeyCreationOptionsWireDto {
  const PasskeyCreationOptionsWireDto({
    required this.attestationFormats,
    required this.challenge,
    required this.excludeCredentials,
    required this.hints,
    required this.parameters,
    required this.relyingParty,
    required this.user,
    this.attestation,
    this.authenticatorSelection,
    this.extensions,
    this.timeoutMilliseconds,
  });

  factory PasskeyCreationOptionsWireDto.fromJson(Map<String, Object?> json) =>
      _$PasskeyCreationOptionsWireDtoFromJson(json);

  final String? attestation;
  @JsonKey(name: 'attestationFormats', defaultValue: <String>[])
  final List<String> attestationFormats;
  final PasskeyAuthenticatorSelectionWireDto? authenticatorSelection;
  final String challenge;
  @JsonKey(
    name: 'excludeCredentials',
    defaultValue: <PasskeyCredentialDescriptorWireDto>[],
  )
  final List<PasskeyCredentialDescriptorWireDto> excludeCredentials;
  final PasskeyExtensionsInputWireDto? extensions;
  @JsonKey(defaultValue: <String>[])
  final List<String> hints;
  @JsonKey(name: 'pubKeyCredParams')
  final List<PasskeyCredentialParameterWireDto> parameters;
  @JsonKey(name: 'rp')
  final PasskeyRelyingPartyWireDto relyingParty;
  @JsonKey(name: 'timeout')
  final int? timeoutMilliseconds;
  final PasskeyUserWireDto user;

  Sub2ApiWebAuthnCreationOptions toPublicModel() {
    final timeout = timeoutMilliseconds;
    if (parameters.isEmpty || (timeout != null && timeout <= 0)) {
      throw invalidPasskeyRegistrationOptions;
    }
    return Sub2ApiWebAuthnCreationOptions(
      attestation: attestation,
      attestationFormats: List<String>.unmodifiable(attestationFormats),
      authenticatorSelection: authenticatorSelection?.toPublicModel(),
      challenge: _decodeBase64Url(challenge),
      excludeCredentials:
          List<Sub2ApiWebAuthnCredentialDescriptor>.unmodifiable(
            excludeCredentials.map((entry) => entry.toPublicModel()),
          ),
      extensions:
          extensions?.toPublicModel() ??
          const Sub2ApiWebAuthnExtensionsInput(credentialProperties: false),
      hints: List<String>.unmodifiable(hints),
      parameters: List<Sub2ApiWebAuthnCredentialParameter>.unmodifiable(
        parameters.map((entry) => entry.toPublicModel()),
      ),
      relyingParty: relyingParty.toPublicModel(),
      timeout: timeout == null ? null : Duration(milliseconds: timeout),
      user: user.toPublicModel(),
    );
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class PasskeyCreationWrapperWireDto {
  const PasskeyCreationWrapperWireDto({
    required this.publicKey,
    this.mediation,
  });

  factory PasskeyCreationWrapperWireDto.fromJson(Map<String, Object?> json) =>
      _$PasskeyCreationWrapperWireDtoFromJson(json);

  final String? mediation;
  final PasskeyCreationOptionsWireDto publicKey;
}

@JsonSerializable(createToJson: false, checked: true)
final class PasskeyRegistrationChallengeWireDto {
  const PasskeyRegistrationChallengeWireDto({
    required this.options,
    required this.sessionToken,
  });

  factory PasskeyRegistrationChallengeWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$PasskeyRegistrationChallengeWireDtoFromJson(json);

  final PasskeyCreationWrapperWireDto options;
  @JsonKey(name: 'session_token')
  final String sessionToken;

  Sub2ApiPasskeyRegistrationChallenge toPublicModel() {
    if (sessionToken.isEmpty) throw invalidPasskeyRegistrationOptions;
    return Sub2ApiPasskeyRegistrationChallenge(
      mediation: options.mediation,
      options: options.publicKey.toPublicModel(),
      sessionToken: Sub2ApiPasskeySessionToken(sessionToken),
    );
  }
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class PasskeyCredentialSummaryWireDto {
  const PasskeyCredentialSummaryWireDto({
    required this.backup,
    required this.createdAt,
    required this.id,
    required this.name,
    this.lastUsedAt,
  });

  factory PasskeyCredentialSummaryWireDto.fromJson(Map<String, Object?> json) =>
      _$PasskeyCredentialSummaryWireDtoFromJson(json);

  final bool backup;
  final DateTime createdAt;
  final int id;
  final DateTime? lastUsedAt;
  final String name;

  Sub2ApiPasskeyCredentialSummary toPublicModel() {
    if (id <= 0 || name.isEmpty) {
      throw invalidPasskeyCredentialSummary;
    }
    return Sub2ApiPasskeyCredentialSummary(
      backup: backup,
      createdAt: createdAt,
      id: id,
      lastUsedAt: lastUsedAt,
      name: name,
    );
  }
}

Uint8List _decodeBase64Url(String value) {
  if (value.isEmpty) throw invalidPasskeyLoginOptions;
  try {
    final normalized = value.replaceAll('-', '+').replaceAll('_', '/');
    final padded = normalized.padRight(
      normalized.length + ((4 - normalized.length % 4) % 4),
      '=',
    );
    final bytes = base64Decode(padded);
    if (bytes.isEmpty) throw invalidPasskeyLoginOptions;
    return Uint8List.fromList(bytes);
  } on Sub2ApiException {
    rethrow;
  } on Object {
    throw invalidPasskeyLoginOptions;
  }
}

const invalidPasskeyLoginOptions = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_passkey_login_options',
  retryable: false,
);

const invalidPasskeyRegistrationOptions = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_passkey_registration_options',
  retryable: false,
);

const invalidPasskeyCredentialSummary = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_passkey_credential_summary',
  retryable: false,
);

Map<String, Object?> passkeyFinishLoginBody(
  Sub2ApiFinishPasskeyLoginRequest request,
) {
  final credential = request.credential;
  final response = credential.response;
  return <String, Object?>{
    'session_token': request.sessionToken.reveal(),
    'credential': <String, Object?>{
      'id': credential.id,
      'rawId': _encodeBase64Url(credential.rawId),
      'type': credential.type,
      if (credential.authenticatorAttachment != null)
        'authenticatorAttachment': credential.authenticatorAttachment,
      'clientExtensionResults': _extensionResults(
        credential.clientExtensionResults,
      ),
      'response': <String, Object?>{
        'authenticatorData': _encodeBase64Url(response.authenticatorData),
        'clientDataJSON': _encodeBase64Url(response.clientDataJson),
        'signature': _encodeBase64Url(response.signature),
        'userHandle': response.userHandle == null
            ? null
            : _encodeBase64Url(response.userHandle!),
      },
    },
  };
}

Map<String, Object?> passkeyFinishRegistrationBody(
  Sub2ApiFinishPasskeyRegistrationRequest request,
) {
  final credential = request.credential;
  final response = credential.response;
  return <String, Object?>{
    'session_token': request.sessionToken.reveal(),
    if (request.name != null) 'name': request.name,
    'credential': <String, Object?>{
      'id': credential.id,
      'rawId': _encodeBase64Url(credential.rawId),
      'type': credential.type,
      if (credential.authenticatorAttachment != null)
        'authenticatorAttachment': credential.authenticatorAttachment,
      'clientExtensionResults': _extensionResults(
        credential.clientExtensionResults,
      ),
      'response': <String, Object?>{
        'attestationObject': _encodeBase64Url(response.attestationObject),
        'clientDataJSON': _encodeBase64Url(response.clientDataJson),
        'transports': List<String>.unmodifiable(response.transports),
      },
    },
  };
}

Map<String, Object?> _extensionResults(
  Sub2ApiWebAuthnClientExtensionResults results,
) => <String, Object?>{
  if (results.credentialPropertiesResidentKey != null)
    'credProps': <String, Object?>{
      'rk': results.credentialPropertiesResidentKey,
    },
};

String _encodeBase64Url(List<int> bytes) {
  if (bytes.isEmpty) {
    throw const Sub2ApiException(
      kind: Sub2ApiFailureKind.validation,
      code: 'passkey.empty_credential_bytes',
      retryable: false,
    );
  }
  return base64UrlEncode(bytes).replaceAll('=', '');
}
