import 'package:json_annotation/json_annotation.dart';

import '../../shared/errors/sub2api_exception.dart';
import '../sub2api_identity_models.dart';

part 'identity_wire_dtos.g.dart';

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class IdentityBindingInstructionWireDto {
  const IdentityBindingInstructionWireDto({
    required this.authorizeUrl,
    required this.method,
    required this.provider,
    required this.useBrowserRedirect,
  });

  factory IdentityBindingInstructionWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$IdentityBindingInstructionWireDtoFromJson(json);

  final String authorizeUrl;
  final String method;
  final String provider;
  final bool useBrowserRedirect;

  Sub2ApiIdentityBindingInstruction toPublicModel() {
    try {
      final uri = Uri.parse(authorizeUrl);
      if (authorizeUrl.isEmpty || method.isEmpty || uri.path.isEmpty) {
        throw invalidIdentityBindingInstruction;
      }
      return Sub2ApiIdentityBindingInstruction(
        authorizeUri: uri,
        method: method,
        provider: Sub2ApiIdentityProvider.fromWire(provider),
        useBrowserRedirect: useBrowserRedirect,
      );
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw invalidIdentityBindingInstruction;
    }
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class IdentityCodeSentWireDto {
  const IdentityCodeSentWireDto({required this.message});

  factory IdentityCodeSentWireDto.fromJson(Map<String, Object?> json) =>
      _$IdentityCodeSentWireDtoFromJson(json);

  final String message;

  Sub2ApiIdentityCodeSent toPublicModel() {
    if (message.isEmpty) throw invalidIdentityCodeSent;
    return Sub2ApiIdentityCodeSent(message: message);
  }
}

const invalidIdentityBindingInstruction = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_identity_binding_instruction',
  retryable: false,
);

const invalidIdentityCodeSent = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_identity_code_sent',
  retryable: false,
);
