import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../sub2api_admin_setting_models.dart';

Sub2ApiAdminApiKeyStatus mapAdminApiKeyStatus(Object? data) => _guard(() {
  final source = _object(data);
  final exists = _boolean(source['exists']);
  final masked = source['masked_key'];
  if (masked != null && masked is! String) throw const FormatException();
  if (exists && (masked is! String || masked.trim().isEmpty)) {
    throw const FormatException();
  }
  return Sub2ApiAdminApiKeyStatus(
    exists: exists,
    maskedKey: masked is String && masked.isNotEmpty
        ? Sub2ApiAdminMaskedCredential(masked)
        : null,
  );
});

Sub2ApiAdminApiKeyRegenerationResult mapAdminApiKeyRegeneration(Object? data) =>
    _guard(() {
      final key = _required(_object(data)['key']);
      if (!key.startsWith('admin-')) throw const FormatException();
      return Sub2ApiAdminApiKeyRegenerationResult(key: Sub2ApiAdminApiKey(key));
    });

Sub2ApiAdminSettingActionResult mapAdminSettingAction(Object? data) => _guard(
  () => Sub2ApiAdminSettingActionResult(
    message: _required(_object(data)['message']),
  ),
);

Sub2ApiAdminEmailTemplateList mapAdminEmailTemplateList(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminEmailTemplateList(
        events: _list(source['events']).map(_object).map((event) {
          return Sub2ApiAdminEmailTemplateEvent(
            value: _required(event['value']),
            label: _text(event['label']),
            description: _text(event['description']),
            category: _text(event['category']),
            optional: _optionalBool(event['optional']),
          );
        }).toList(),
        locales: _list(source['locales']).map(_required).toList(),
        templates: _list(source['templates']).map(_object).map((template) {
          return Sub2ApiAdminEmailTemplateSummary(
            event: _required(template['event']),
            locale: _required(template['locale']),
            subject: _required(template['subject']),
            isCustom: _optionalBool(template['is_custom']),
            updatedAt: _optionalDate(template['updated_at']),
          );
        }).toList(),
        placeholders: _list(source['placeholders']).map(_required).toList(),
      );
    });

Sub2ApiAdminEmailTemplateDetail mapAdminEmailTemplateDetail(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminEmailTemplateDetail(
        event: _required(source['event']),
        locale: _required(source['locale']),
        subject: _required(source['subject']),
        html: Sub2ApiAdminEmailTemplateContent(_required(source['html'])),
        isCustom: _optionalBool(source['is_custom']),
        updatedAt: _optionalDate(source['updated_at']),
        placeholders: _list(source['placeholders']).map(_required).toList(),
      );
    });

Sub2ApiAdminEmailTemplatePreview mapAdminEmailTemplatePreview(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminEmailTemplatePreview(
        subject: _required(source['subject']),
        html: Sub2ApiAdminEmailTemplateContent(_required(source['html'])),
      );
    });

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

bool _boolean(Object? value) {
  if (value is! bool) throw const FormatException();
  return value;
}

bool _optionalBool(Object? value) => value == null ? false : _boolean(value);

List<Object?> _list(Object? value) {
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

String _text(Object? value) {
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

String _required(Object? value) {
  if (value is! String || value.trim().isEmpty) throw const FormatException();
  return value;
}

DateTime? _optionalDate(Object? value) {
  final text = _text(value);
  if (text.isEmpty) return null;
  return DateTime.parse(text).toUtc();
}

T _guard<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_setting_response',
  retryable: false,
);
