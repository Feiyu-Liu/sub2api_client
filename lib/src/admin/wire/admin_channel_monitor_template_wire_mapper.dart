import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../sub2api_admin_channel_monitor_template_models.dart';
import '../sub2api_admin_user_models.dart';

List<Sub2ApiAdminChannelMonitorTemplate> mapAdminChannelMonitorTemplates(
  Object? data,
) => _map(() {
  final s = _object(data);
  return _list(s, 'items').map(_object).map(_template).toList(growable: false);
});
Sub2ApiAdminChannelMonitorTemplate mapAdminChannelMonitorTemplate(
  Object? data,
) => _map(() => _template(_object(data)));
List<Sub2ApiAdminAssociatedMonitor> mapAdminAssociatedMonitors(Object? data) =>
    _map(() {
      final s = _object(data);
      return _list(s, 'items')
          .map(_object)
          .map(
            (m) => Sub2ApiAdminAssociatedMonitor(
              id: _positive(m, 'id'),
              name: _nonEmpty(m, 'name'),
              provider: _provider(_nonEmpty(m, 'provider')),
              apiMode: _apiMode(_nonEmpty(m, 'api_mode')),
              enabled: _bool(m, 'enabled'),
            ),
          )
          .toList(growable: false);
    });
Sub2ApiAdminApplyMonitorTemplateResult mapAdminApplyMonitorTemplate(
  Object? data,
) => _map(
  () => Sub2ApiAdminApplyMonitorTemplateResult(
    _nonNegative(_object(data), 'affected'),
  ),
);
void mapAdminDeletedMonitorTemplate(Object? data) {
  if (data != null) throw _invalid;
}

Sub2ApiAdminChannelMonitorTemplate _template(Map<String, Object?> s) =>
    Sub2ApiAdminChannelMonitorTemplate(
      id: _positive(s, 'id'),
      name: _nonEmpty(s, 'name'),
      provider: _provider(_nonEmpty(s, 'provider')),
      apiMode: _apiMode(_nonEmpty(s, 'api_mode')),
      description: _string(s, 'description'),
      extraHeaders: _headers(s['extra_headers']),
      bodyOverrideMode: _bodyMode(_nonEmpty(s, 'body_override_mode')),
      bodyOverride: s['body_override'] == null
          ? null
          : _jsonObject(s['body_override']),
      createdAt: _date(s, 'created_at'),
      updatedAt: _date(s, 'updated_at'),
      associatedMonitors: _nonNegative(s, 'associated_monitors'),
    );
Sub2ApiAdminJsonObject _jsonObject(Object? v) {
  final s = _object(v);
  return Sub2ApiAdminJsonObject(s.map((k, v) => MapEntry(k, _jsonValue(v))));
}

Sub2ApiAdminJsonValue _jsonValue(Object? v) {
  if (v == null) return const Sub2ApiAdminJsonNull();
  if (v is bool) return Sub2ApiAdminJsonBool(v);
  if (v is num) return Sub2ApiAdminJsonNumber(Sub2ApiDecimal.fromJson(v));
  if (v is String) return Sub2ApiAdminJsonString(v);
  if (v is List) return Sub2ApiAdminJsonArray(v.map(_jsonValue).toList());
  if (v is Map) return _jsonObject(v);
  throw const FormatException();
}

Map<String, String> _headers(Object? v) {
  if (v == null) return const {};
  final s = _object(v);
  final result = <String, String>{};
  for (final e in s.entries) {
    if (e.value is! String) throw const FormatException();
    result[e.key] = e.value! as String;
  }
  return result;
}

Sub2ApiAdminMonitorTemplateProvider _provider(String v) => switch (v) {
  'openai' => Sub2ApiAdminMonitorTemplateProvider.openAi,
  'anthropic' => Sub2ApiAdminMonitorTemplateProvider.anthropic,
  'gemini' => Sub2ApiAdminMonitorTemplateProvider.gemini,
  'grok' => Sub2ApiAdminMonitorTemplateProvider.grok,
  _ => throw const FormatException(),
};
Sub2ApiAdminMonitorTemplateApiMode _apiMode(String v) => switch (v) {
  'chat_completions' => Sub2ApiAdminMonitorTemplateApiMode.chatCompletions,
  'responses' => Sub2ApiAdminMonitorTemplateApiMode.responses,
  _ => throw const FormatException(),
};
Sub2ApiAdminMonitorTemplateBodyMode _bodyMode(String v) => switch (v) {
  'off' => Sub2ApiAdminMonitorTemplateBodyMode.off,
  'merge' => Sub2ApiAdminMonitorTemplateBodyMode.merge,
  'replace' => Sub2ApiAdminMonitorTemplateBodyMode.replace,
  _ => throw const FormatException(),
};
Map<String, Object?> _object(Object? v) {
  if (v is! Map) throw const FormatException();
  return Map<String, Object?>.from(v);
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
  code: 'protocol.invalid_admin_channel_monitor_template_response',
  retryable: false,
);
