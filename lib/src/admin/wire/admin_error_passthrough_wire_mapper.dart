import '../../shared/errors/sub2api_exception.dart';
import '../sub2api_admin_error_passthrough_models.dart';

List<Sub2ApiAdminErrorPassthroughRule> mapAdminErrorPassthroughRules(
  Object? data,
) => _map(() {
  if (data is! List) throw const FormatException();
  return data.map(_object).map(_rule).toList(growable: false);
});

Sub2ApiAdminErrorPassthroughRule mapAdminErrorPassthroughRule(Object? data) =>
    _map(() => _rule(_object(data)));

Sub2ApiAdminDeleteErrorPassthroughRuleResult mapAdminDeleteErrorPassthroughRule(
  Object? data,
) => _map(() {
  return Sub2ApiAdminDeleteErrorPassthroughRuleResult(
    _nonEmptyString(_object(data), 'message'),
  );
});

Sub2ApiAdminErrorPassthroughRule _rule(Map<String, Object?> source) =>
    Sub2ApiAdminErrorPassthroughRule(
      id: _positiveInteger(source, 'id'),
      name: _nonEmptyString(source, 'name'),
      enabled: _boolean(source, 'enabled'),
      priority: _integer(source, 'priority'),
      errorCodes: _integerList(source, 'error_codes'),
      keywords: _stringList(source, 'keywords'),
      matchMode: switch (_nonEmptyString(source, 'match_mode')) {
        'any' => Sub2ApiAdminErrorPassthroughMatchMode.any,
        'all' => Sub2ApiAdminErrorPassthroughMatchMode.all,
        _ => throw const FormatException(),
      },
      platforms: _stringList(source, 'platforms'),
      passthroughCode: _boolean(source, 'passthrough_code'),
      responseCode: _nullableInteger(source, 'response_code'),
      passthroughBody: _boolean(source, 'passthrough_body'),
      customMessage: _nullableString(source, 'custom_message'),
      skipMonitoring: _boolean(source, 'skip_monitoring'),
      description: _nullableString(source, 'description'),
      createdAt: _dateTime(source, 'created_at'),
      updatedAt: _dateTime(source, 'updated_at'),
    );

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

String _nonEmptyString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! String || value.trim().isEmpty) throw const FormatException();
  return value;
}

String? _nullableString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! String) throw const FormatException();
  return value;
}

bool _boolean(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! bool) throw const FormatException();
  return value;
}

int _integer(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! int) throw const FormatException();
  return value;
}

int _positiveInteger(Map<String, Object?> source, String key) {
  final value = _integer(source, key);
  if (value <= 0) throw const FormatException();
  return value;
}

int? _nullableInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! int) throw const FormatException();
  return value;
}

List<int> _integerList(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! List || value.any((item) => item is! int)) {
    throw const FormatException();
  }
  return value.cast<int>().toList(growable: false);
}

List<String> _stringList(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! List || value.any((item) => item is! String)) {
    throw const FormatException();
  }
  return value.cast<String>().toList(growable: false);
}

DateTime _dateTime(Map<String, Object?> source, String key) =>
    DateTime.parse(_nonEmptyString(source, key)).toUtc();

T _map<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalidResponse;
  }
}

const _invalidResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_error_passthrough_response',
  retryable: false,
);
