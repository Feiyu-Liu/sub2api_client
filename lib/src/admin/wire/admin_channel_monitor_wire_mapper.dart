import '../../commerce/wire/monitor_wire_mapper.dart';
import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_channel_monitor_models.dart';
import '../sub2api_admin_user_models.dart';

Sub2ApiAdminChannelMonitorPage mapAdminChannelMonitorPage(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiPage<Sub2ApiAdminChannelMonitor>(
        items: _list(
          source['items'],
        ).map(_object).map(_monitor).toList(growable: false),
        total: _nonNegativeInt(source['total']),
        page: _positiveInt(source['page']),
        pageSize: _positiveInt(source['page_size']),
        pages: _positiveInt(source['pages']),
      );
    });

Sub2ApiAdminChannelMonitor mapAdminChannelMonitor(Object? data) =>
    _guard(() => _monitor(_object(data)));

List<Sub2ApiAdminChannelMonitorCheckResult> mapAdminChannelMonitorRun(
  Object? data,
) => _guard(
  () => _list(
    _object(data)['results'],
  ).map(_object).map(_checkResult).toList(growable: false),
);

List<Sub2ApiAdminChannelMonitorHistoryItem> mapAdminChannelMonitorHistory(
  Object? data,
) => _guard(
  () => _list(
    _object(data)['items'],
  ).map(_object).map(_historyItem).toList(growable: false),
);

void mapAdminDeletedChannelMonitor(Object? data) {
  if (data != null) throw _invalid;
}

Sub2ApiAdminChannelMonitor _monitor(Map<String, Object?> source) =>
    Sub2ApiAdminChannelMonitor(
      id: _positiveInt(source['id']),
      name: _requiredText(source['name']),
      provider: _provider(_requiredText(source['provider'])),
      apiMode: _apiMode(_requiredText(source['api_mode'])),
      endpoint: _endpoint(_text(source['endpoint'])),
      apiKeyMasked: Sub2ApiAdminMaskedCredential(
        _text(source['api_key_masked']),
      ),
      apiKeyDecryptFailed: _bool(source['api_key_decrypt_failed']),
      primaryModel: _requiredText(source['primary_model']),
      extraModels: _stringList(source['extra_models']),
      groupName: _text(source['group_name']),
      enabled: _bool(source['enabled']),
      intervalSeconds: _positiveInt(source['interval_seconds']),
      jitterSeconds: _nonNegativeInt(source['jitter_seconds']),
      lastCheckedAt: _optionalDate(source['last_checked_at']),
      createdBy: _nonNegativeInt(source['created_by']),
      createdAt: _date(source['created_at']),
      updatedAt: _date(source['updated_at']),
      primaryStatus: _text(source['primary_status']),
      primaryLatencyMs: _optionalNonNegativeInt(source['primary_latency_ms']),
      availability7d: Sub2ApiDecimal.fromJson(source['availability_7d']),
      extraModelsStatus: _optionalList(source['extra_models_status'])
          .map(_object)
          .map(
            (item) => Sub2ApiAdminChannelMonitorExtraStatus(
              model: _requiredText(item['model']),
              status: _requiredText(item['status']),
              latencyMs: _optionalNonNegativeInt(item['latency_ms']),
            ),
          )
          .toList(growable: false),
      templateId: _optionalPositiveInt(source['template_id']),
      extraHeaders: _headers(source['extra_headers']),
      bodyOverrideMode: _bodyMode(_requiredText(source['body_override_mode'])),
      bodyOverride: source['body_override'] == null
          ? null
          : _jsonObject(source['body_override']),
      checkMode: _checkMode(_requiredText(source['check_mode'])),
      accountId: _optionalPositiveInt(source['account_id']),
      latestQuota: source['latest_quota'] == null
          ? null
          : mapMonitorQuotaSnapshot(source['latest_quota']),
    );

Sub2ApiAdminChannelMonitorCheckResult _checkResult(
  Map<String, Object?> source,
) => Sub2ApiAdminChannelMonitorCheckResult(
  model: _requiredText(source['model']),
  status: _requiredText(source['status']),
  latencyMs: _optionalNonNegativeInt(source['latency_ms']),
  pingLatencyMs: _optionalNonNegativeInt(source['ping_latency_ms']),
  message: _text(source['message']),
  checkedAt: _date(source['checked_at']),
  quota: source['quota'] == null
      ? null
      : mapMonitorQuotaSnapshot(source['quota']),
);

Sub2ApiAdminChannelMonitorHistoryItem _historyItem(
  Map<String, Object?> source,
) => Sub2ApiAdminChannelMonitorHistoryItem(
  id: _positiveInt(source['id']),
  model: _requiredText(source['model']),
  status: _requiredText(source['status']),
  latencyMs: _optionalNonNegativeInt(source['latency_ms']),
  pingLatencyMs: _optionalNonNegativeInt(source['ping_latency_ms']),
  message: _text(source['message']),
  checkedAt: _date(source['checked_at']),
  quota: source['quota'] == null
      ? null
      : mapMonitorQuotaSnapshot(source['quota']),
);

Sub2ApiAdminChannelMonitorProvider _provider(String value) => switch (value) {
  'openai' => Sub2ApiAdminChannelMonitorProvider.openAi,
  'anthropic' => Sub2ApiAdminChannelMonitorProvider.anthropic,
  'gemini' => Sub2ApiAdminChannelMonitorProvider.gemini,
  'grok' => Sub2ApiAdminChannelMonitorProvider.grok,
  'antigravity' => Sub2ApiAdminChannelMonitorProvider.antigravity,
  'kimi' => Sub2ApiAdminChannelMonitorProvider.kimi,
  'zhipu' => Sub2ApiAdminChannelMonitorProvider.zhipu,
  'deepseek' => Sub2ApiAdminChannelMonitorProvider.deepseek,
  _ => throw const FormatException(),
};

Sub2ApiAdminChannelMonitorApiMode _apiMode(String value) => switch (value) {
  'chat_completions' => Sub2ApiAdminChannelMonitorApiMode.chatCompletions,
  'responses' => Sub2ApiAdminChannelMonitorApiMode.responses,
  _ => throw const FormatException(),
};

Sub2ApiAdminChannelMonitorBodyMode _bodyMode(String value) => switch (value) {
  'off' => Sub2ApiAdminChannelMonitorBodyMode.off,
  'merge' => Sub2ApiAdminChannelMonitorBodyMode.merge,
  'replace' => Sub2ApiAdminChannelMonitorBodyMode.replace,
  _ => throw const FormatException(),
};

Sub2ApiAdminChannelMonitorCheckMode _checkMode(String value) => switch (value) {
  'probe' => Sub2ApiAdminChannelMonitorCheckMode.probe,
  'quota' => Sub2ApiAdminChannelMonitorCheckMode.quota,
  'quota_probe' => Sub2ApiAdminChannelMonitorCheckMode.quotaProbe,
  _ => throw const FormatException(),
};

Uri? _endpoint(String value) {
  if (value.isEmpty) return null;
  final uri = Uri.parse(value);
  if (uri.scheme != 'https' || !uri.hasAuthority) throw const FormatException();
  return uri;
}

Sub2ApiAdminJsonObject _jsonObject(Object? value) {
  final source = _object(value);
  return Sub2ApiAdminJsonObject(
    source.map((key, item) => MapEntry(key, _jsonValue(item))),
  );
}

Sub2ApiAdminJsonValue _jsonValue(Object? value) {
  if (value == null) return const Sub2ApiAdminJsonNull();
  if (value is bool) return Sub2ApiAdminJsonBool(value);
  if (value is num) {
    return Sub2ApiAdminJsonNumber(Sub2ApiDecimal.fromJson(value));
  }
  if (value is String) return Sub2ApiAdminJsonString(value);
  if (value is List) {
    return Sub2ApiAdminJsonArray(value.map(_jsonValue).toList(growable: false));
  }
  if (value is Map) return _jsonObject(value);
  throw const FormatException();
}

Map<String, String> _headers(Object? value) {
  if (value == null) return const {};
  final source = _object(value);
  return source.map((key, item) {
    if (item is! String) throw const FormatException();
    return MapEntry(key, item);
  });
}

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

List<Object?> _list(Object? value) {
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

List<Object?> _optionalList(Object? value) =>
    value == null ? const [] : _list(value);

List<String> _stringList(Object? value) =>
    _list(value).map(_requiredText).toList(growable: false);

String _text(Object? value) {
  if (value is! String) throw const FormatException();
  return value;
}

String _requiredText(Object? value) {
  final text = _text(value);
  if (text.trim().isEmpty) throw const FormatException();
  return text;
}

bool _bool(Object? value) {
  if (value is! bool) throw const FormatException();
  return value;
}

int _positiveInt(Object? value) {
  if (value is! int || value <= 0) throw const FormatException();
  return value;
}

int _nonNegativeInt(Object? value) {
  if (value is! int || value < 0) throw const FormatException();
  return value;
}

int? _optionalPositiveInt(Object? value) =>
    value == null ? null : _positiveInt(value);

int? _optionalNonNegativeInt(Object? value) =>
    value == null ? null : _nonNegativeInt(value);

DateTime _date(Object? value) => DateTime.parse(_requiredText(value)).toUtc();

DateTime? _optionalDate(Object? value) => value == null ? null : _date(value);

T _guard<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_channel_monitor_response',
  retryable: false,
);
