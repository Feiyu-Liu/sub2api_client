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

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

bool _boolean(Object? value) {
  if (value is! bool) throw const FormatException();
  return value;
}

String _required(Object? value) {
  if (value is! String || value.trim().isEmpty) throw const FormatException();
  return value;
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
