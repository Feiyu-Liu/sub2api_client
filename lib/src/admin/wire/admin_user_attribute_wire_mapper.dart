import '../../shared/errors/sub2api_exception.dart';
import '../sub2api_admin_user_attribute_models.dart';

List<Sub2ApiAdminUserAttributeDefinition> mapAdminUserAttributeDefinitions(
  Object? data,
) => _map(() {
  if (data is! List) throw const FormatException();
  return data.map(_object).map(_definition).toList(growable: false);
});
Sub2ApiAdminUserAttributeDefinition mapAdminUserAttributeDefinition(
  Object? data,
) => _map(() => _definition(_object(data)));
List<Sub2ApiAdminUserAttributeSnapshot> mapAdminUserAttributeSnapshots(
  Object? data,
) => _map(() {
  final root = _object(data);
  final attrs = _object(root['attributes']);
  final result = <Sub2ApiAdminUserAttributeSnapshot>[];
  for (final entry in attrs.entries) {
    final userId = int.tryParse(entry.key);
    if (userId == null || userId <= 0) throw const FormatException();
    final values = _object(entry.value).entries.map((item) {
      final id = int.tryParse(item.key);
      if (id == null || id <= 0 || item.value is! String) {
        throw const FormatException();
      }
      return Sub2ApiAdminUserAttributeSnapshotValue(
        attributeId: id,
        value: item.value! as String,
      );
    }).toList()..sort((a, b) => a.attributeId.compareTo(b.attributeId));
    result.add(
      Sub2ApiAdminUserAttributeSnapshot(userId: userId, values: values),
    );
  }
  result.sort((a, b) => a.userId.compareTo(b.userId));
  return result;
});
Sub2ApiAdminUserAttributeActionResult mapAdminUserAttributeAction(
  Object? data,
) => _map(
  () => Sub2ApiAdminUserAttributeActionResult(
    _nonEmpty(_object(data), 'message'),
  ),
);

Sub2ApiAdminUserAttributeDefinition _definition(Map<String, Object?> s) =>
    Sub2ApiAdminUserAttributeDefinition(
      id: _positive(s, 'id'),
      key: _nonEmpty(s, 'key'),
      name: _nonEmpty(s, 'name'),
      description: _string(s, 'description'),
      type: _type(_nonEmpty(s, 'type')),
      options: _list(s, 'options')
          .map(_object)
          .map(
            (o) => Sub2ApiAdminUserAttributeOption(
              value: _nonEmpty(o, 'value'),
              label: _nonEmpty(o, 'label'),
            ),
          )
          .toList(),
      required: _bool(s, 'required'),
      validation: _validation(_object(s['validation'])),
      placeholder: _string(s, 'placeholder'),
      displayOrder: _nonNegative(s, 'display_order'),
      enabled: _bool(s, 'enabled'),
      createdAt: _date(s, 'created_at'),
      updatedAt: _date(s, 'updated_at'),
    );
Sub2ApiAdminUserAttributeValidation _validation(Map<String, Object?> s) =>
    Sub2ApiAdminUserAttributeValidation(
      minLength: _nullableInt(s, 'min_length'),
      maxLength: _nullableInt(s, 'max_length'),
      min: _nullableInt(s, 'min'),
      max: _nullableInt(s, 'max'),
      pattern: _nullableString(s, 'pattern'),
      message: _nullableString(s, 'message'),
    );
Sub2ApiAdminUserAttributeType _type(String v) => switch (v) {
  'text' => Sub2ApiAdminUserAttributeType.text,
  'textarea' => Sub2ApiAdminUserAttributeType.textarea,
  'number' => Sub2ApiAdminUserAttributeType.number,
  'email' => Sub2ApiAdminUserAttributeType.email,
  'url' => Sub2ApiAdminUserAttributeType.url,
  'date' => Sub2ApiAdminUserAttributeType.date,
  'select' => Sub2ApiAdminUserAttributeType.select,
  'multi_select' => Sub2ApiAdminUserAttributeType.multiSelect,
  _ => throw const FormatException(),
};
Map<String, Object?> _object(Object? v) {
  if (v is! Map) throw const FormatException();
  final result = <String, Object?>{};
  for (final e in v.entries) {
    if (e.key is! String) throw const FormatException();
    result[e.key as String] = e.value;
  }
  return result;
}

List<Object?> _list(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! List) throw const FormatException();
  return v.cast<Object?>();
}

String _string(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! String) throw const FormatException();
  return v;
}

String _nonEmpty(Map<String, Object?> s, String k) {
  final v = _string(s, k);
  if (v.trim().isEmpty) throw const FormatException();
  return v;
}

String? _nullableString(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v == null) return null;
  if (v is! String) throw const FormatException();
  return v;
}

bool _bool(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! bool) throw const FormatException();
  return v;
}

int _positive(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! int || v <= 0) throw const FormatException();
  return v;
}

int _nonNegative(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! int || v < 0) throw const FormatException();
  return v;
}

int? _nullableInt(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v == null) return null;
  if (v is! int) throw const FormatException();
  return v;
}

DateTime _date(Map<String, Object?> s, String k) =>
    DateTime.parse(_nonEmpty(s, k)).toUtc();
T _map<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_user_attribute_response',
  retryable: false,
);
