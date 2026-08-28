import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../sub2api_admin_ops_alert_models.dart';
import '../sub2api_admin_user_models.dart';

List<Sub2ApiAdminOpsAlertRule> mapAdminOpsAlertRules(Object? data) =>
    _guard(() => _list(data).map(_rule).toList(growable: false));

Sub2ApiAdminOpsAlertRule mapAdminOpsAlertRule(Object? data) =>
    _guard(() => _rule(data));

List<Sub2ApiAdminOpsAlertEvent> mapAdminOpsAlertEvents(Object? data) =>
    _guard(() => _list(data).map(_event).toList(growable: false));

Sub2ApiAdminOpsAlertEvent mapAdminOpsAlertEvent(Object? data) =>
    _guard(() => _event(data));

Sub2ApiAdminOpsAlertMutationResult mapAdminOpsAlertDeleted(Object? data) =>
    _guard(
      () => Sub2ApiAdminOpsAlertMutationResult(
        ok: _bool(_object(data)['deleted']),
      ),
    );

Sub2ApiAdminOpsAlertMutationResult mapAdminOpsAlertUpdated(Object? data) =>
    _guard(
      () => Sub2ApiAdminOpsAlertMutationResult(
        ok: _bool(_object(data)['updated']),
      ),
    );

Sub2ApiAdminOpsAlertSilence mapAdminOpsAlertSilence(Object? data) => _guard(() {
  final source = _object(data);
  return Sub2ApiAdminOpsAlertSilence(
    id: _positive(source['id']),
    ruleId: _positive(source['rule_id']),
    platform: _requiredText(source['platform']),
    groupId: _nullablePositive(source['group_id']),
    region: _optionalText(source['region']),
    until: _date(source['until']),
    reason: _text(source['reason']),
    createdByUserId: _nullablePositive(source['created_by']),
    createdAt: _date(source['created_at']),
  );
});

Sub2ApiAdminOpsAlertRule _rule(Object? value) {
  final source = _object(value);
  return Sub2ApiAdminOpsAlertRule(
    id: _positive(source['id']),
    name: _requiredText(source['name']),
    description: _text(source['description']),
    enabled: _bool(source['enabled']),
    severity: _severity(source['severity']),
    metricType: _metricType(source['metric_type']),
    operator: _operator(source['operator']),
    threshold: Sub2ApiDecimal.fromJson(source['threshold']),
    windowMinutes: _positive(source['window_minutes']),
    sustainedMinutes: _positive(source['sustained_minutes']),
    cooldownMinutes: _nonNegative(source['cooldown_minutes']),
    notifyEmail: _bool(source['notify_email']),
    filters: _jsonObjectOrEmpty(source['filters']),
    lastTriggeredAt: _optionalDate(source['last_triggered_at']),
    createdAt: _date(source['created_at']),
    updatedAt: _date(source['updated_at']),
  );
}

Sub2ApiAdminOpsAlertEvent _event(Object? value) {
  final source = _object(value);
  return Sub2ApiAdminOpsAlertEvent(
    id: _positive(source['id']),
    ruleId: _positive(source['rule_id']),
    severity: _severity(source['severity']),
    status: _status(source['status']),
    title: _requiredText(source['title']),
    description: _text(source['description']),
    metricValue: _optionalDecimal(source['metric_value']),
    thresholdValue: _optionalDecimal(source['threshold_value']),
    dimensions: _jsonObjectOrEmpty(source['dimensions']),
    firedAt: _date(source['fired_at']),
    resolvedAt: _optionalDate(source['resolved_at']),
    emailSent: _bool(source['email_sent']),
    createdAt: _date(source['created_at']),
  );
}

Sub2ApiAdminOpsAlertMetricType _metricType(
  Object? value,
) => switch (_requiredText(value)) {
  'success_rate' => Sub2ApiAdminOpsAlertMetricType.successRate,
  'error_rate' => Sub2ApiAdminOpsAlertMetricType.errorRate,
  'upstream_error_rate' => Sub2ApiAdminOpsAlertMetricType.upstreamErrorRate,
  'cpu_usage_percent' => Sub2ApiAdminOpsAlertMetricType.cpuUsagePercent,
  'memory_usage_percent' => Sub2ApiAdminOpsAlertMetricType.memoryUsagePercent,
  'concurrency_queue_depth' =>
    Sub2ApiAdminOpsAlertMetricType.concurrencyQueueDepth,
  'group_available_accounts' =>
    Sub2ApiAdminOpsAlertMetricType.groupAvailableAccounts,
  'group_available_ratio' => Sub2ApiAdminOpsAlertMetricType.groupAvailableRatio,
  'group_rate_limit_ratio' =>
    Sub2ApiAdminOpsAlertMetricType.groupRateLimitRatio,
  'account_rate_limited_count' =>
    Sub2ApiAdminOpsAlertMetricType.accountRateLimitedCount,
  'account_error_count' => Sub2ApiAdminOpsAlertMetricType.accountErrorCount,
  'account_error_ratio' => Sub2ApiAdminOpsAlertMetricType.accountErrorRatio,
  'account_temp_unscheduled_count' =>
    Sub2ApiAdminOpsAlertMetricType.accountTempUnscheduledCount,
  'overload_account_count' =>
    Sub2ApiAdminOpsAlertMetricType.overloadAccountCount,
  'proxy_expired_count' => Sub2ApiAdminOpsAlertMetricType.proxyExpiredCount,
  'proxy_expiring_soon_count' =>
    Sub2ApiAdminOpsAlertMetricType.proxyExpiringSoonCount,
  _ => throw const FormatException(),
};

Sub2ApiAdminOpsAlertOperator _operator(Object? value) =>
    switch (_requiredText(value)) {
      '>' => Sub2ApiAdminOpsAlertOperator.greaterThan,
      '<' => Sub2ApiAdminOpsAlertOperator.lessThan,
      '>=' => Sub2ApiAdminOpsAlertOperator.greaterThanOrEqual,
      '<=' => Sub2ApiAdminOpsAlertOperator.lessThanOrEqual,
      '==' => Sub2ApiAdminOpsAlertOperator.equal,
      '!=' => Sub2ApiAdminOpsAlertOperator.notEqual,
      _ => throw const FormatException(),
    };

Sub2ApiAdminOpsAlertSeverity _severity(Object? value) =>
    switch (_requiredText(value)) {
      'P0' => Sub2ApiAdminOpsAlertSeverity.p0,
      'P1' => Sub2ApiAdminOpsAlertSeverity.p1,
      'P2' => Sub2ApiAdminOpsAlertSeverity.p2,
      'P3' => Sub2ApiAdminOpsAlertSeverity.p3,
      _ => throw const FormatException(),
    };

Sub2ApiAdminOpsAlertEventStatus _status(Object? value) =>
    switch (_requiredText(value)) {
      'firing' => Sub2ApiAdminOpsAlertEventStatus.firing,
      'resolved' => Sub2ApiAdminOpsAlertEventStatus.resolved,
      'manual_resolved' => Sub2ApiAdminOpsAlertEventStatus.manualResolved,
      _ => throw const FormatException(),
    };

Sub2ApiAdminJsonObject _jsonObjectOrEmpty(Object? value) =>
    value == null ? const Sub2ApiAdminJsonObject({}) : _jsonObject(value);

Sub2ApiAdminJsonObject _jsonObject(Object? value) {
  final source = _object(value);
  return Sub2ApiAdminJsonObject(
    Map.unmodifiable(
      source.map((key, item) => MapEntry(key, _jsonValue(item))),
    ),
  );
}

Sub2ApiAdminJsonValue _jsonValue(Object? value) => switch (value) {
  null => const Sub2ApiAdminJsonNull(),
  bool() => Sub2ApiAdminJsonBool(value),
  num() => Sub2ApiAdminJsonNumber(Sub2ApiDecimal.fromJson(value)),
  String() => Sub2ApiAdminJsonString(value),
  List() => Sub2ApiAdminJsonArray(List.unmodifiable(value.map(_jsonValue))),
  Map() => _jsonObject(value),
  _ => throw const FormatException(),
};

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) throw const FormatException();
    result[entry.key as String] = entry.value;
  }
  return result;
}

List<Object?> _list(Object? value) {
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

String _text(Object? value) {
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

String _requiredText(Object? value) {
  final result = _text(value);
  if (result.trim().isEmpty) throw const FormatException();
  return result;
}

String? _optionalText(Object? value) => value == null ? null : _text(value);

bool _bool(Object? value) {
  if (value is! bool) throw const FormatException();
  return value;
}

int _integer(Object? value) {
  if (value is! int) throw const FormatException();
  return value;
}

int _positive(Object? value) {
  final result = _integer(value);
  if (result <= 0) throw const FormatException();
  return result;
}

int _nonNegative(Object? value) {
  final result = _integer(value);
  if (result < 0) throw const FormatException();
  return result;
}

int? _nullablePositive(Object? value) =>
    value == null ? null : _positive(value);

Sub2ApiDecimal? _optionalDecimal(Object? value) =>
    value == null ? null : Sub2ApiDecimal.fromJson(value);

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
  code: 'protocol.invalid_admin_ops_alert_response',
  retryable: false,
);
