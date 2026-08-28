import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_ops_settings_models.dart';
import 'wire/admin_ops_settings_wire_mapper.dart';
import 'wire/admin_ops_settings_wire_service.dart';

abstract interface class Sub2ApiAdminOpsSettingsClient {
  Future<Sub2ApiAdminOpsEmailNotificationConfig> getEmailNotification({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsEmailNotificationConfig> updateEmailNotification(
    Sub2ApiAdminOpsEmailNotificationUpdate update, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsAlertRuntimeSettings> getAlertRuntime({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsAlertRuntimeSettings> updateAlertRuntime(
    Sub2ApiAdminOpsAlertRuntimeSettings settings, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsRuntimeLogConfig> getRuntimeLogging({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsRuntimeLogConfig> updateRuntimeLogging(
    Sub2ApiAdminOpsRuntimeLogInput input, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsRuntimeLogConfig> resetRuntimeLogging({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsAdvancedSettings> getAdvanced({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsAdvancedSettings> updateAdvanced(
    Sub2ApiAdminOpsAdvancedSettings settings, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsMetricThresholds> getMetricThresholds({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsMetricThresholds> updateMetricThresholds(
    Sub2ApiAdminOpsMetricThresholds thresholds, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminOpsSettingsClient createSub2ApiAdminOpsSettingsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminOpsSettingsClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminOpsSettingsWireService(dio);

  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminOpsSettingsWireService _service;

  @override
  Future<Sub2ApiAdminOpsEmailNotificationConfig> getEmailNotification({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, value) => _service.getEmail(
      cancelToken,
      options,
      _authorization(value),
      _key(value),
    ),
    decode: mapAdminOpsEmailConfig,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminOpsEmailNotificationConfig> updateEmailNotification(
    Sub2ApiAdminOpsEmailNotificationUpdate update, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _emailUpdateBody(update);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, value) => _service.updateEmail(
        body,
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsEmailConfig,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsAlertRuntimeSettings> getAlertRuntime({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, value) => _service.getAlertRuntime(
      cancelToken,
      options,
      _authorization(value),
      _key(value),
    ),
    decode: mapAdminOpsAlertRuntime,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminOpsAlertRuntimeSettings> updateAlertRuntime(
    Sub2ApiAdminOpsAlertRuntimeSettings settings, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _alertRuntimeBody(settings);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, value) => _service.updateAlertRuntime(
        body,
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsAlertRuntime,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsRuntimeLogConfig> getRuntimeLogging({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, value) => _service.getLogging(
      cancelToken,
      options,
      _authorization(value),
      _key(value),
    ),
    decode: mapAdminOpsRuntimeLogging,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminOpsRuntimeLogConfig> updateRuntimeLogging(
    Sub2ApiAdminOpsRuntimeLogInput input, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _loggingBody(input);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, value) => _service.updateLogging(
        body,
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsRuntimeLogging,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsRuntimeLogConfig> resetRuntimeLogging({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedNonReplayableRequest(
    send: (cancelToken, options, value) => _service.resetLogging(
      cancelToken,
      options,
      _authorization(value),
      _key(value),
    ),
    decode: mapAdminOpsRuntimeLogging,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminOpsAdvancedSettings> getAdvanced({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, value) => _service.getAdvanced(
      cancelToken,
      options,
      _authorization(value),
      _key(value),
    ),
    decode: mapAdminOpsAdvancedSettings,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminOpsAdvancedSettings> updateAdvanced(
    Sub2ApiAdminOpsAdvancedSettings settings, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _advancedBody(settings);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, value) => _service.updateAdvanced(
        body,
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsAdvancedSettings,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsMetricThresholds> getMetricThresholds({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, value) => _service.getThresholds(
      cancelToken,
      options,
      _authorization(value),
      _key(value),
    ),
    decode: mapAdminOpsMetricThresholds,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminOpsMetricThresholds> updateMetricThresholds(
    Sub2ApiAdminOpsMetricThresholds thresholds, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _thresholdBody(thresholds);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, value) => _service.updateThresholds(
        body,
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsMetricThresholds,
      requestOptions: requestOptions,
    );
  }

  Map<String, Object?> _emailUpdateBody(
    Sub2ApiAdminOpsEmailNotificationUpdate update,
  ) {
    if (update.alert == null && update.report == null) {
      throw _validation('admin.ops.empty_email_notification_update');
    }
    return <String, Object?>{
      'alert': ?update.alert == null ? null : _emailAlertBody(update.alert!),
      'report': ?update.report == null
          ? null
          : _emailReportBody(update.report!),
    };
  }

  Map<String, Object?> _emailAlertBody(Sub2ApiAdminOpsEmailAlertConfig config) {
    if (config.rateLimitPerHour < 0 || config.batchingWindowSeconds < 0) {
      throw _validation('admin.ops.invalid_email_alert_limits');
    }
    return <String, Object?>{
      'enabled': config.enabled,
      'recipients': _recipients(config.recipients),
      'min_severity': config.minSeverity?.name ?? '',
      'rate_limit_per_hour': config.rateLimitPerHour,
      'batching_window_seconds': config.batchingWindowSeconds,
      'include_resolved_alerts': config.includeResolvedAlerts,
    };
  }

  Map<String, Object?> _emailReportBody(
    Sub2ApiAdminOpsEmailReportConfig config,
  ) {
    if (config.errorDigestMinCount < 0) {
      throw _validation('admin.ops.invalid_error_digest_min_count');
    }
    final healthThreshold = _float64Exact(
      config.accountHealthErrorRateThreshold,
      'admin.ops.email_threshold_not_representable',
    );
    if (healthThreshold < 0 || healthThreshold > 100) {
      throw _validation('admin.ops.invalid_account_health_threshold');
    }
    return <String, Object?>{
      'enabled': config.enabled,
      'recipients': _recipients(config.recipients),
      'daily_summary_enabled': config.dailySummaryEnabled,
      'daily_summary_schedule': config.dailySummarySchedule.trim(),
      'weekly_summary_enabled': config.weeklySummaryEnabled,
      'weekly_summary_schedule': config.weeklySummarySchedule.trim(),
      'error_digest_enabled': config.errorDigestEnabled,
      'error_digest_schedule': config.errorDigestSchedule.trim(),
      'error_digest_min_count': config.errorDigestMinCount,
      'account_health_enabled': config.accountHealthEnabled,
      'account_health_schedule': config.accountHealthSchedule.trim(),
      'account_health_error_rate_threshold': healthThreshold,
    };
  }

  Map<String, Object?> _alertRuntimeBody(
    Sub2ApiAdminOpsAlertRuntimeSettings settings,
  ) {
    if (settings.evaluationIntervalSeconds < 1 ||
        settings.evaluationIntervalSeconds > 86400) {
      throw _validation('admin.ops.invalid_alert_evaluation_interval');
    }
    final lock = settings.distributedLock;
    if (lock.enabled &&
        (lock.key.trim().isEmpty ||
            lock.ttlSeconds < 1 ||
            lock.ttlSeconds > 86400)) {
      throw _validation('admin.ops.invalid_distributed_lock');
    }
    for (final entry in settings.silencing.entries) {
      if (entry.ruleId != null && entry.ruleId! <= 0) {
        throw _validation('admin.ops.invalid_alert_rule_id');
      }
    }
    return <String, Object?>{
      'evaluation_interval_seconds': settings.evaluationIntervalSeconds,
      'distributed_lock': <String, Object?>{
        'enabled': lock.enabled,
        'key': lock.key.trim(),
        'ttl_seconds': lock.ttlSeconds,
      },
      'silencing': <String, Object?>{
        'enabled': settings.silencing.enabled,
        'global_until_rfc3339':
            settings.silencing.globalUntil?.toUtc().toIso8601String() ?? '',
        'global_reason': settings.silencing.globalReason.trim(),
        'entries': settings.silencing.entries
            .map(
              (entry) => <String, Object?>{
                'rule_id': ?entry.ruleId,
                'severities': entry.severities
                    .map((severity) => severity.name.toUpperCase())
                    .toList(growable: false),
                'until_rfc3339': entry.until.toUtc().toIso8601String(),
                'reason': entry.reason.trim(),
              },
            )
            .toList(growable: false),
      },
      'thresholds': _thresholdBody(settings.thresholds),
    };
  }

  Map<String, Object?> _loggingBody(Sub2ApiAdminOpsRuntimeLogInput input) {
    if (input.samplingInitial <= 0 || input.samplingThereafter <= 0) {
      throw _validation('admin.ops.invalid_log_sampling');
    }
    if (input.retentionDays < 1 || input.retentionDays > 3650) {
      throw _validation('admin.ops.invalid_log_retention');
    }
    return <String, Object?>{
      'level': input.level.name,
      'enable_sampling': input.enableSampling,
      'sampling_initial': input.samplingInitial,
      'sampling_thereafter': input.samplingThereafter,
      'caller': input.caller,
      'stacktrace_level': input.stacktraceLevel.name,
      'retention_days': input.retentionDays,
    };
  }

  Map<String, Object?> _advancedBody(Sub2ApiAdminOpsAdvancedSettings settings) {
    final retention = settings.dataRetention;
    for (final days in <int>[
      retention.errorLogRetentionDays,
      retention.minuteMetricsRetentionDays,
      retention.hourlyMetricsRetentionDays,
    ]) {
      if (days < 0 || days > 365) {
        throw _validation('admin.ops.invalid_data_retention');
      }
    }
    if (settings.autoRefreshIntervalSeconds < 15 ||
        settings.autoRefreshIntervalSeconds > 300) {
      throw _validation('admin.ops.invalid_auto_refresh_interval');
    }
    final pause5h = _fraction(
      settings.openAIAccountQuotaAutoPause.defaultThreshold5h,
    );
    final pause7d = _fraction(
      settings.openAIAccountQuotaAutoPause.defaultThreshold7d,
    );
    return <String, Object?>{
      'data_retention': <String, Object?>{
        'cleanup_enabled': retention.cleanupEnabled,
        'cleanup_schedule': retention.cleanupSchedule.trim(),
        'error_log_retention_days': retention.errorLogRetentionDays,
        'minute_metrics_retention_days': retention.minuteMetricsRetentionDays,
        'hourly_metrics_retention_days': retention.hourlyMetricsRetentionDays,
      },
      'aggregation': <String, Object?>{
        'aggregation_enabled': settings.aggregation.aggregationEnabled,
      },
      'openai_account_quota_auto_pause': <String, Object?>{
        'default_threshold_5h': pause5h,
        'default_threshold_7d': pause7d,
      },
      'ignore_count_tokens_errors': settings.ignoreCountTokensErrors,
      'ignore_context_canceled': settings.ignoreContextCanceled,
      'ignore_no_available_accounts': settings.ignoreNoAvailableAccounts,
      'ignore_invalid_api_key_errors': settings.ignoreInvalidApiKeyErrors,
      'ignore_insufficient_balance_errors':
          settings.ignoreInsufficientBalanceErrors,
      'display_openai_token_stats': settings.displayOpenAITokenStats,
      'display_alert_events': settings.displayAlertEvents,
      'auto_refresh_enabled': settings.autoRefreshEnabled,
      'auto_refresh_interval_seconds': settings.autoRefreshIntervalSeconds,
    };
  }

  Map<String, Object?> _thresholdBody(
    Sub2ApiAdminOpsMetricThresholds thresholds,
  ) => <String, Object?>{
    'sla_percent_min': ?_optionalPercent(
      thresholds.slaPercentMin,
      'admin.ops.sla_threshold_not_representable',
    ),
    'ttft_p99_ms_max': ?_optionalNonNegative(
      thresholds.ttftP99MsMax,
      'admin.ops.ttft_threshold_not_representable',
    ),
    'request_error_rate_percent_max': ?_optionalPercent(
      thresholds.requestErrorRatePercentMax,
      'admin.ops.request_error_threshold_not_representable',
    ),
    'upstream_error_rate_percent_max': ?_optionalPercent(
      thresholds.upstreamErrorRatePercentMax,
      'admin.ops.upstream_error_threshold_not_representable',
    ),
  };

  String? _authorization(String? value) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? value : null;

  String? _key(String? value) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? value : null;
}

List<String> _recipients(List<String> recipients) => recipients
    .map((value) {
      final trimmed = value.trim();
      if (trimmed.isEmpty) {
        throw _validation('admin.ops.invalid_email_recipient');
      }
      return trimmed;
    })
    .toList(growable: false);

double _fraction(Sub2ApiDecimal value) {
  final result = _float64Exact(
    value,
    'admin.ops.quota_threshold_not_representable',
  );
  if (result < 0 || result > 1) {
    throw _validation('admin.ops.invalid_quota_threshold');
  }
  return result;
}

double? _optionalPercent(Sub2ApiDecimal? value, String code) {
  if (value == null) return null;
  final result = _float64Exact(value, code);
  if (result < 0 || result > 100) {
    throw _validation('admin.ops.invalid_metric_threshold');
  }
  return result;
}

double? _optionalNonNegative(Sub2ApiDecimal? value, String code) {
  if (value == null) return null;
  final result = _float64Exact(value, code);
  if (result < 0) throw _validation('admin.ops.invalid_metric_threshold');
  return result;
}

double _float64Exact(Sub2ApiDecimal value, String code) {
  final result = double.tryParse(value.toJson());
  if (result == null || !result.isFinite) throw _validation(code);
  if (Sub2ApiDecimal.parse(result.toString()) != value) {
    throw _validation(code);
  }
  return result;
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
