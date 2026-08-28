import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../shared/models/sensitive_value.dart';

part 'sub2api_passkey_models.freezed.dart';

/// A credential descriptor accepted by a WebAuthn assertion ceremony.
@freezed
abstract class Sub2ApiWebAuthnCredentialDescriptor
    with _$Sub2ApiWebAuthnCredentialDescriptor {
  const factory Sub2ApiWebAuthnCredentialDescriptor({
    required String type,
    required Uint8List id,
    required List<String> transports,
  }) = _Sub2ApiWebAuthnCredentialDescriptor;
}

/// Typed WebAuthn request options returned by a passkey login begin call.
@freezed
abstract class Sub2ApiWebAuthnRequestOptions
    with _$Sub2ApiWebAuthnRequestOptions {
  const factory Sub2ApiWebAuthnRequestOptions({
    required Uint8List challenge,
    required List<Sub2ApiWebAuthnCredentialDescriptor> allowedCredentials,
    required List<String> hints,
    Duration? timeout,
    String? relyingPartyId,
    String? userVerification,
  }) = _Sub2ApiWebAuthnRequestOptions;
}

/// Server state and typed options required to request a passkey assertion.
@freezed
abstract class Sub2ApiPasskeyLoginChallenge
    with _$Sub2ApiPasskeyLoginChallenge {
  const factory Sub2ApiPasskeyLoginChallenge({
    required Sub2ApiPasskeySessionToken sessionToken,
    required Sub2ApiWebAuthnRequestOptions options,
    String? mediation,
  }) = _Sub2ApiPasskeyLoginChallenge;
}

/// Relying-party identity supplied to a WebAuthn creation ceremony.
@freezed
abstract class Sub2ApiWebAuthnRelyingParty with _$Sub2ApiWebAuthnRelyingParty {
  const factory Sub2ApiWebAuthnRelyingParty({
    required String id,
    required String name,
  }) = _Sub2ApiWebAuthnRelyingParty;
}

/// User identity supplied to a WebAuthn creation ceremony.
@freezed
abstract class Sub2ApiWebAuthnUser with _$Sub2ApiWebAuthnUser {
  const factory Sub2ApiWebAuthnUser({
    required Uint8List id,
    required String name,
    required String displayName,
  }) = _Sub2ApiWebAuthnUser;
}

/// Public-key algorithm accepted by the relying party.
@freezed
abstract class Sub2ApiWebAuthnCredentialParameter
    with _$Sub2ApiWebAuthnCredentialParameter {
  const factory Sub2ApiWebAuthnCredentialParameter({
    required String type,
    required int algorithm,
  }) = _Sub2ApiWebAuthnCredentialParameter;
}

/// Authenticator requirements for a WebAuthn creation ceremony.
@freezed
abstract class Sub2ApiWebAuthnAuthenticatorSelection
    with _$Sub2ApiWebAuthnAuthenticatorSelection {
  const factory Sub2ApiWebAuthnAuthenticatorSelection({
    String? authenticatorAttachment,
    bool? requireResidentKey,
    String? residentKey,
    String? userVerification,
  }) = _Sub2ApiWebAuthnAuthenticatorSelection;
}

/// WebAuthn extension inputs used by the fixed Sub2API contract.
@freezed
abstract class Sub2ApiWebAuthnExtensionsInput
    with _$Sub2ApiWebAuthnExtensionsInput {
  const factory Sub2ApiWebAuthnExtensionsInput({
    required bool credentialProperties,
  }) = _Sub2ApiWebAuthnExtensionsInput;
}

/// Typed WebAuthn options returned by a passkey registration begin call.
@freezed
abstract class Sub2ApiWebAuthnCreationOptions
    with _$Sub2ApiWebAuthnCreationOptions {
  const factory Sub2ApiWebAuthnCreationOptions({
    required Sub2ApiWebAuthnRelyingParty relyingParty,
    required Sub2ApiWebAuthnUser user,
    required Uint8List challenge,
    required List<Sub2ApiWebAuthnCredentialParameter> parameters,
    required List<Sub2ApiWebAuthnCredentialDescriptor> excludeCredentials,
    required List<String> hints,
    required List<String> attestationFormats,
    required Sub2ApiWebAuthnExtensionsInput extensions,
    Duration? timeout,
    Sub2ApiWebAuthnAuthenticatorSelection? authenticatorSelection,
    String? attestation,
  }) = _Sub2ApiWebAuthnCreationOptions;
}

/// Server state and typed options required to create a passkey credential.
@freezed
abstract class Sub2ApiPasskeyRegistrationChallenge
    with _$Sub2ApiPasskeyRegistrationChallenge {
  const factory Sub2ApiPasskeyRegistrationChallenge({
    required Sub2ApiPasskeySessionToken sessionToken,
    required Sub2ApiWebAuthnCreationOptions options,
    String? mediation,
  }) = _Sub2ApiPasskeyRegistrationChallenge;
}

/// Password-gated request to begin passkey enrollment.
final class Sub2ApiBeginPasskeyRegistrationRequest {
  const Sub2ApiBeginPasskeyRegistrationRequest({required this.password});

  final Sub2ApiPassword password;

  @override
  String toString() => 'Sub2ApiBeginPasskeyRegistrationRequest(<redacted>)';
}

/// Password-gated request to delete a passkey credential.
final class Sub2ApiDeletePasskeyRequest {
  const Sub2ApiDeletePasskeyRequest({required this.password});

  final Sub2ApiPassword password;

  @override
  String toString() => 'Sub2ApiDeletePasskeyRequest(<redacted>)';
}

/// WebAuthn client-extension outputs used by the fixed passkey contract.
final class Sub2ApiWebAuthnClientExtensionResults {
  const Sub2ApiWebAuthnClientExtensionResults({
    this.credentialPropertiesResidentKey,
  });

  /// Whether the created credential is client-side discoverable.
  final bool? credentialPropertiesResidentKey;
}

/// Authenticator assertion bytes returned by a platform WebAuthn adapter.
final class Sub2ApiPasskeyAssertionResponse {
  const Sub2ApiPasskeyAssertionResponse({
    required this.authenticatorData,
    required this.clientDataJson,
    required this.signature,
    this.userHandle,
  });

  final Uint8List authenticatorData;
  final Uint8List clientDataJson;
  final Uint8List signature;
  final Uint8List? userHandle;

  @override
  String toString() => 'Sub2ApiPasskeyAssertionResponse(<redacted>)';
}

/// Public-key credential assertion returned by a platform WebAuthn adapter.
final class Sub2ApiPasskeyAssertionCredential {
  const Sub2ApiPasskeyAssertionCredential({
    required this.id,
    required this.rawId,
    required this.type,
    required this.response,
    required this.clientExtensionResults,
    this.authenticatorAttachment,
  });

  final String? authenticatorAttachment;
  final Sub2ApiWebAuthnClientExtensionResults clientExtensionResults;
  final String id;
  final Uint8List rawId;
  final Sub2ApiPasskeyAssertionResponse response;
  final String type;

  @override
  String toString() => 'Sub2ApiPasskeyAssertionCredential(<redacted>)';
}

/// Request that finishes a passkey login ceremony.
final class Sub2ApiFinishPasskeyLoginRequest {
  const Sub2ApiFinishPasskeyLoginRequest({
    required this.sessionToken,
    required this.credential,
  });

  final Sub2ApiPasskeyAssertionCredential credential;
  final Sub2ApiPasskeySessionToken sessionToken;

  @override
  String toString() => 'Sub2ApiFinishPasskeyLoginRequest(<redacted>)';
}

/// Authenticator attestation bytes returned by a platform WebAuthn adapter.
final class Sub2ApiPasskeyAttestationResponse {
  const Sub2ApiPasskeyAttestationResponse({
    required this.attestationObject,
    required this.clientDataJson,
    required this.transports,
  });

  final Uint8List attestationObject;
  final Uint8List clientDataJson;
  final List<String> transports;

  @override
  String toString() => 'Sub2ApiPasskeyAttestationResponse(<redacted>)';
}

/// Public-key credential attestation returned by a platform adapter.
final class Sub2ApiPasskeyRegistrationCredential {
  const Sub2ApiPasskeyRegistrationCredential({
    required this.id,
    required this.rawId,
    required this.type,
    required this.response,
    required this.clientExtensionResults,
    this.authenticatorAttachment,
  });

  final String? authenticatorAttachment;
  final Sub2ApiWebAuthnClientExtensionResults clientExtensionResults;
  final String id;
  final Uint8List rawId;
  final Sub2ApiPasskeyAttestationResponse response;
  final String type;

  @override
  String toString() => 'Sub2ApiPasskeyRegistrationCredential(<redacted>)';
}

/// Request that finishes a passkey registration ceremony.
final class Sub2ApiFinishPasskeyRegistrationRequest {
  const Sub2ApiFinishPasskeyRegistrationRequest({
    required this.sessionToken,
    required this.credential,
    this.name,
  });

  final Sub2ApiPasskeyRegistrationCredential credential;
  final String? name;
  final Sub2ApiPasskeySessionToken sessionToken;

  @override
  String toString() => 'Sub2ApiFinishPasskeyRegistrationRequest(<redacted>)';
}

/// Non-sensitive passkey credential metadata owned by the current user.
@freezed
abstract class Sub2ApiPasskeyCredentialSummary
    with _$Sub2ApiPasskeyCredentialSummary {
  const factory Sub2ApiPasskeyCredentialSummary({
    required int id,
    required String name,
    required DateTime createdAt,
    required bool backup,
    DateTime? lastUsedAt,
  }) = _Sub2ApiPasskeyCredentialSummary;
}
