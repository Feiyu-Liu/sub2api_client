import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../sub2api_admin_ops_alert_models.dart';
import '../sub2api_admin_ops_settings_models.dart';
import '../sub2api_admin_user_models.dart';

Sub2ApiAdminOpsEmailNotificationConfig mapAdminOpsEmailConfig(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminOpsEmailNotificationConfig(
        alert: _emailAlert(source['alert']),
        report: _emailReport(source['report']),
      );
    });

Sub2ApiAdminOpsAlertRuntimeSettings mapAdminOpsAlertRuntime(Object? data) =>
    _guard(() {
      final source = _object(data);
      final lock = _object(source['distributed_lock']);
      final silencing = _object(source['silencing']);
      return Sub2ApiAdminOpsAlertRuntimeSettings(
        evaluationIntervalSeconds: _positive(
          source['evaluation_interval_seconds'],
        ),
        distributedLock: Sub2ApiAdminOpsDistributedLockSettings(
          enabled: _bool(lock['enabled']),
          key: _requiredText(lock['key']),
          ttlSeconds: _positive(lock['ttl_seconds']),
        ),
        silencing: Sub2ApiAdminOpsAlertSilencingSettings(
          enabled: _bool(silencing['enabled']),
          globalUntil: _optionalDateText(silencing['global_until_rfc3339']),
          globalReason: _text(silencing['global_reason']),
          entries: _optionalList(
            silencing['entries'],
          ).map(_silenceEntry).toList(growable: false),
        ),
        thresholds: _thresholds(source['thresholds']),
      );
    });

Sub2ApiAdminOpsRuntimeLogConfig mapAdminOpsRuntimeLogging(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminOpsRuntimeLogConfig(
        level: _logLevel(source['level']),
        enableSampling: _bool(source['enable_sampling']),
        samplingInitial: _positive(source['sampling_initial']),
        samplingThereafter: _positive(source['sampling_thereafter']),
        caller: _bool(source['caller']),
        stacktraceLevel: _stacktraceLevel(source['stacktrace_level']),
        retentionDays: _positive(source['retention_days']),
        source: _text(source['source']),
        updatedAt: _optionalDateText(source['updated_at']),
        updatedByUserId: _nullablePositive(source['updated_by_user_id']),
        extra: _jsonObjectOrEmpty(source['extra']),
      );
    });

Sub2ApiAdminOpsAdvancedSettings mapAdminOpsAdvancedSettings(
  Object? data,
) => _guard(() {
  final source = _object(data);
  final retention = _object(source['data_retention']);
  final aggregation = _object(source['aggregation']);
  final autoPause = _object(source['openai_account_quota_auto_pause']);
  return Sub2ApiAdminOpsAdvancedSettings(
    dataRetention: Sub2ApiAdminOpsDataRetentionSettings(
      cleanupEnabled: _bool(retention['cleanup_enabled']),
      cleanupSchedule: _requiredText(retention['cleanup_schedule']),
      errorLogRetentionDays: _nonNegative(
        retention['error_log_retention_days'],
      ),
      minuteMetricsRetentionDays: _nonNegative(
        retention['minute_metrics_retention_days'],
      ),
      hourlyMetricsRetentionDays: _nonNegative(
        retention['hourly_metrics_retention_days'],
      ),
    ),
    aggregation: Sub2ApiAdminOpsAggregationSettings(
      aggregationEnabled: _bool(aggregation['aggregation_enabled']),
    ),
    openAIAccountQuotaAutoPause: Sub2ApiAdminOpsQuotaAutoPauseSettings(
      defaultThreshold5h: Sub2ApiDecimal.fromJson(
        autoPause['default_threshold_5h'],
      ),
      defaultThreshold7d: Sub2ApiDecimal.fromJson(
        autoPause['default_threshold_7d'],
      ),
    ),
    ignoreCountTokensErrors: _bool(source['ignore_count_tokens_errors']),
    ignoreContextCanceled: _bool(source['ignore_context_canceled']),
    ignoreNoAvailableAccounts: _bool(source['ignore_no_available_accounts']),
    ignoreInvalidApiKeyErrors: _bool(source['ignore_invalid_api_key_errors']),
    ignoreInsufficientBalanceErrors: _bool(
      source['ignore_insufficient_balance_errors'],
    ),
    displayOpenAITokenStats: _bool(source['display_openai_token_stats']),
    displayAlertEvents: _bool(source['display_alert_events']),
    autoRefreshEnabled: _bool(source['auto_refresh_enabled']),
    autoRefreshIntervalSeconds: _positive(
      source['auto_refresh_interval_seconds'],
    ),
  );
});

Sub2ApiAdminOpsMetricThresholds mapAdminOpsMetricThresholds(Object? data) =>
    _guard(() => _thresholds(data));

Sub2ApiAdminOpsEmailAlertConfig _emailAlert(Object? value) {
  final source = _object(value);
  final minSeverity = _text(source['min_severity']).trim();
  return Sub2ApiAdminOpsEmailAlertConfig(
    enabled: _bool(source['enabled']),
    recipients: _strings(source['recipients']),
    minSeverity: minSeverity.isEmpty ? null : _emailSeverity(minSeverity),
    rateLimitPerHour: _nonNegative(source['rate_limit_per_hour']),
    batchingWindowSeconds: _nonNegative(source['batching_window_seconds']),
    includeResolvedAlerts: _bool(source['include_resolved_alerts']),
  );
}

Sub2ApiAdminOpsEmailReportConfig _emailReport(Object? value) {
  final source = _object(value);
  return Sub2ApiAdminOpsEmailReportConfig(
    enabled: _bool(source['enabled']),
    recipients: _strings(source['recipients']),
    dailySummaryEnabled: _bool(source['daily_summary_enabled']),
    dailySummarySchedule: _requiredText(source['daily_summary_schedule']),
    weeklySummaryEnabled: _bool(source['weekly_summary_enabled']),
    weeklySummarySchedule: _requiredText(source['weekly_summary_schedule']),
    errorDigestEnabled: _bool(source['error_digest_enabled']),
    errorDigestSchedule: _requiredText(source['error_digest_schedule']),
    errorDigestMinCount: _nonNegative(source['error_digest_min_count']),
    accountHealthEnabled: _bool(source['account_health_enabled']),
    accountHealthSchedule: _requiredText(source['account_health_schedule']),
    accountHealthErrorRateThreshold: Sub2ApiDecimal.fromJson(
      source['account_health_error_rate_threshold'],
    ),
  );
}

Sub2ApiAdminOpsAlertSilenceEntry _silenceEntry(Object? value) {
  final source = _object(value);
  return Sub2ApiAdminOpsAlertSilenceEntry(
    ruleId: _nullablePositive(source['rule_id']),
    severities: _optionalList(
      source['severities'],
    ).map(_alertSeverity).toList(growable: false),
    until: _date(source['until_rfc3339']),
    reason: _text(source['reason']),
  );
}

Sub2ApiAdminOpsMetricThresholds _thresholds(Object? value) {
  final source = _object(value);
  return Sub2ApiAdminOpsMetricThresholds(
    slaPercentMin: _optionalDecimal(source['sla_percent_min']),
    ttftP99MsMax: _optionalDecimal(source['ttft_p99_ms_max']),
    requestErrorRatePercentMax: _optionalDecimal(
      source['request_error_rate_percent_max'],
    ),
    upstreamErrorRatePercentMax: _optionalDecimal(
      source['upstream_error_rate_percent_max'],
    ),
  );
}

Sub2ApiAdminOpsEmailAlertMinSeverity _emailSeverity(String value) =>
    switch (value) {
      'critical' => Sub2ApiAdminOpsEmailAlertMinSeverity.critical,
      'warning' => Sub2ApiAdminOpsEmailAlertMinSeverity.warning,
      'info' => Sub2ApiAdminOpsEmailAlertMinSeverity.info,
      _ => throw const FormatException(),
    };

Sub2ApiAdminOpsAlertSeverity _alertSeverity(Object? value) =>
    switch (_requiredText(value)) {
      'P0' => Sub2ApiAdminOpsAlertSeverity.p0,
      'P1' => Sub2ApiAdminOpsAlertSeverity.p1,
      'P2' => Sub2ApiAdminOpsAlertSeverity.p2,
      'P3' => Sub2ApiAdminOpsAlertSeverity.p3,
      _ => throw const FormatException(),
    };

Sub2ApiAdminOpsRuntimeLogLevel _logLevel(Object? value) =>
    switch (_requiredText(value)) {
      'debug' => Sub2ApiAdminOpsRuntimeLogLevel.debug,
      'info' => Sub2ApiAdminOpsRuntimeLogLevel.info,
      'warn' => Sub2ApiAdminOpsRuntimeLogLevel.warn,
      'error' => Sub2ApiAdminOpsRuntimeLogLevel.error,
      _ => throw const FormatException(),
    };

Sub2ApiAdminOpsStacktraceLevel _stacktraceLevel(Object? value) =>
    switch (_requiredText(value)) {
      'none' => Sub2ApiAdminOpsStacktraceLevel.none,
      'error' => Sub2ApiAdminOpsStacktraceLevel.error,
      'fatal' => Sub2ApiAdminOpsStacktraceLevel.fatal,
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

List<Object?> _optionalList(Object? value) =>
    value == null ? const <Object?>[] : _list(value);

List<String> _strings(Object? value) =>
    _list(value).map(_requiredText).toList(growable: false);

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
    value == null || value == 0 ? null : _positive(value);

Sub2ApiDecimal? _optionalDecimal(Object? value) =>
    value == null ? null : Sub2ApiDecimal.fromJson(value);

DateTime _date(Object? value) => DateTime.parse(_requiredText(value)).toUtc();

DateTime? _optionalDateText(Object? value) {
  final raw = _text(value).trim();
  return raw.isEmpty ? null : DateTime.parse(raw).toUtc();
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
  code: 'protocol.invalid_admin_ops_settings_response',
  retryable: false,
);
