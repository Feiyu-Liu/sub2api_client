enum Sub2ApiAdminUserAttributeType {
  text,
  textarea,
  number,
  email,
  url,
  date,
  select,
  multiSelect,
}

final class Sub2ApiAdminUserAttributeOption {
  const Sub2ApiAdminUserAttributeOption({
    required this.value,
    required this.label,
  });
  final String value;
  final String label;
}

final class Sub2ApiAdminUserAttributeValidation {
  const Sub2ApiAdminUserAttributeValidation({
    this.minLength,
    this.maxLength,
    this.min,
    this.max,
    this.pattern,
    this.message,
  });
  final int? minLength;
  final int? maxLength;
  final int? min;
  final int? max;
  final String? pattern;
  final String? message;
}

final class Sub2ApiAdminUserAttributeDefinition {
  Sub2ApiAdminUserAttributeDefinition({
    required this.id,
    required this.key,
    required this.name,
    required this.description,
    required this.type,
    required List<Sub2ApiAdminUserAttributeOption> options,
    required this.required,
    required this.validation,
    required this.placeholder,
    required this.displayOrder,
    required this.enabled,
    required this.createdAt,
    required this.updatedAt,
  }) : options = List.unmodifiable(options);
  final int id;
  final String key;
  final String name;
  final String description;
  final Sub2ApiAdminUserAttributeType type;
  final List<Sub2ApiAdminUserAttributeOption> options;
  final bool required;
  final Sub2ApiAdminUserAttributeValidation validation;
  final String placeholder;
  final int displayOrder;
  final bool enabled;
  final DateTime createdAt;
  final DateTime updatedAt;
}

final class Sub2ApiAdminCreateUserAttributeDefinitionRequest {
  Sub2ApiAdminCreateUserAttributeDefinitionRequest({
    required this.key,
    required this.name,
    required this.type,
    this.description = '',
    List<Sub2ApiAdminUserAttributeOption> options = const [],
    this.required = false,
    this.validation = const Sub2ApiAdminUserAttributeValidation(),
    this.placeholder = '',
    this.enabled = false,
  }) : options = List.unmodifiable(options);
  final String key;
  final String name;
  final String description;
  final Sub2ApiAdminUserAttributeType type;
  final List<Sub2ApiAdminUserAttributeOption> options;
  final bool required;
  final Sub2ApiAdminUserAttributeValidation validation;
  final String placeholder;
  final bool enabled;
}

final class Sub2ApiAdminUpdateUserAttributeDefinitionRequest {
  Sub2ApiAdminUpdateUserAttributeDefinitionRequest({
    this.name,
    this.description,
    this.type,
    List<Sub2ApiAdminUserAttributeOption>? options,
    this.required,
    this.validation,
    this.placeholder,
    this.enabled,
  }) : options = options == null ? null : List.unmodifiable(options);
  final String? name;
  final String? description;
  final Sub2ApiAdminUserAttributeType? type;
  final List<Sub2ApiAdminUserAttributeOption>? options;
  final bool? required;
  final Sub2ApiAdminUserAttributeValidation? validation;
  final String? placeholder;
  final bool? enabled;
}

final class Sub2ApiAdminUserAttributeSnapshotValue {
  const Sub2ApiAdminUserAttributeSnapshotValue({
    required this.attributeId,
    required this.value,
  });
  final int attributeId;
  final String value;
}

final class Sub2ApiAdminUserAttributeSnapshot {
  Sub2ApiAdminUserAttributeSnapshot({
    required this.userId,
    required List<Sub2ApiAdminUserAttributeSnapshotValue> values,
  }) : values = List.unmodifiable(values);
  final int userId;
  final List<Sub2ApiAdminUserAttributeSnapshotValue> values;
}

final class Sub2ApiAdminUserAttributeActionResult {
  const Sub2ApiAdminUserAttributeActionResult(this.message);
  final String message;
}
