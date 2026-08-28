import '../shared/models/sub2api_decimal.dart';
import 'sub2api_admin_ops_alert_models.dart';
import 'sub2api_admin_user_models.dart';

enum Sub2ApiAdminOpsEmailAlertMinSeverity { critical, warning, info }

final class Sub2ApiAdminOpsEmailAlertConfig {
  Sub2ApiAdminOpsEmailAlertConfig({
    required this.enabled,
    List<String> recipients = const <String>[],
    this.minSeverity,
    required this.rateLimitPerHour,
    required this.batchingWindowSeconds,
    required this.includeResolvedAlerts,
  }) : recipients = List.unmodifiable(recipients);

  final bool enabled;
  final List<String> recipients;
  final Sub2ApiAdminOpsEmailAlertMinSeverity? minSeverity;
  final int rateLimitPerHour;
  final int batchingWindowSeconds;
  final bool includeResolvedAlerts;
}

final class Sub2ApiAdminOpsEmailReportConfig {
  Sub2ApiAdminOpsEmailReportConfig({
    required this.enabled,
    List<String> recipients = const <String>[],
    required this.dailySummaryEnabled,
    required this.dailySummarySchedule,
    required this.weeklySummaryEnabled,
    required this.weeklySummarySchedule,
    required this.errorDigestEnabled,
    required this.errorDigestSchedule,
    required this.errorDigestMinCount,
    required this.accountHealthEnabled,
    required this.accountHealthSchedule,
    required this.accountHealthErrorRateThreshold,
  }) : recipients = List.unmodifiable(recipients);

  final bool enabled;
  final List<String> recipients;
  final bool dailySummaryEnabled;
  final String dailySummarySchedule;
  final bool weeklySummaryEnabled;
  final String weeklySummarySchedule;
  final bool errorDigestEnabled;
  final String errorDigestSchedule;
  final int errorDigestMinCount;
  final bool accountHealthEnabled;
  final String accountHealthSchedule;
  final Sub2ApiDecimal accountHealthErrorRateThreshold;
}

final class Sub2ApiAdminOpsEmailNotificationConfig {
  const Sub2ApiAdminOpsEmailNotificationConfig({
    required this.alert,
    required this.report,
  });

  final Sub2ApiAdminOpsEmailAlertConfig alert;
  final Sub2ApiAdminOpsEmailReportConfig report;
}

final class Sub2ApiAdminOpsEmailNotificationUpdate {
  const Sub2ApiAdminOpsEmailNotificationUpdate({this.alert, this.report});

  final Sub2ApiAdminOpsEmailAlertConfig? alert;
  final Sub2ApiAdminOpsEmailReportConfig? report;
}

final class Sub2ApiAdminOpsDistributedLockSettings {
  const Sub2ApiAdminOpsDistributedLockSettings({
    required this.enabled,
    required this.key,
    required this.ttlSeconds,
  });

  final bool enabled;
  final String key;
  final int ttlSeconds;
}

final class Sub2ApiAdminOpsAlertSilenceEntry {
  Sub2ApiAdminOpsAlertSilenceEntry({
    this.ruleId,
    List<Sub2ApiAdminOpsAlertSeverity> severities =
        const <Sub2ApiAdminOpsAlertSeverity>[],
    required this.until,
    this.reason = '',
  }) : severities = List.unmodifiable(severities);

  final int? ruleId;
  final List<Sub2ApiAdminOpsAlertSeverity> severities;
  final DateTime until;
  final String reason;
}

final class Sub2ApiAdminOpsAlertSilencingSettings {
  Sub2ApiAdminOpsAlertSilencingSettings({
    required this.enabled,
    this.globalUntil,
    this.globalReason = '',
    List<Sub2ApiAdminOpsAlertSilenceEntry> entries =
        const <Sub2ApiAdminOpsAlertSilenceEntry>[],
  }) : entries = List.unmodifiable(entries);

  final bool enabled;
  final DateTime? globalUntil;
  final String globalReason;
  final List<Sub2ApiAdminOpsAlertSilenceEntry> entries;
}

final class Sub2ApiAdminOpsMetricThresholds {
  const Sub2ApiAdminOpsMetricThresholds({
    this.slaPercentMin,
    this.ttftP99MsMax,
    this.requestErrorRatePercentMax,
    this.upstreamErrorRatePercentMax,
  });

  final Sub2ApiDecimal? slaPercentMin;
  final Sub2ApiDecimal? ttftP99MsMax;
  final Sub2ApiDecimal? requestErrorRatePercentMax;
  final Sub2ApiDecimal? upstreamErrorRatePercentMax;
}

final class Sub2ApiAdminOpsAlertRuntimeSettings {
  const Sub2ApiAdminOpsAlertRuntimeSettings({
    required this.evaluationIntervalSeconds,
    required this.distributedLock,
    required this.silencing,
    required this.thresholds,
  });

  final int evaluationIntervalSeconds;
  final Sub2ApiAdminOpsDistributedLockSettings distributedLock;
  final Sub2ApiAdminOpsAlertSilencingSettings silencing;
  final Sub2ApiAdminOpsMetricThresholds thresholds;
}

enum Sub2ApiAdminOpsRuntimeLogLevel { debug, info, warn, error }

enum Sub2ApiAdminOpsStacktraceLevel { none, error, fatal }

final class Sub2ApiAdminOpsRuntimeLogInput {
  const Sub2ApiAdminOpsRuntimeLogInput({
    required this.level,
    required this.enableSampling,
    required this.samplingInitial,
    required this.samplingThereafter,
    required this.caller,
    required this.stacktraceLevel,
    required this.retentionDays,
  });

  final Sub2ApiAdminOpsRuntimeLogLevel level;
  final bool enableSampling;
  final int samplingInitial;
  final int samplingThereafter;
  final bool caller;
  final Sub2ApiAdminOpsStacktraceLevel stacktraceLevel;
  final int retentionDays;
}

final class Sub2ApiAdminOpsRuntimeLogConfig {
  const Sub2ApiAdminOpsRuntimeLogConfig({
    required this.level,
    required this.enableSampling,
    required this.samplingInitial,
    required this.samplingThereafter,
    required this.caller,
    required this.stacktraceLevel,
    required this.retentionDays,
    required this.source,
    this.updatedAt,
    this.updatedByUserId,
    required this.extra,
  });

  final Sub2ApiAdminOpsRuntimeLogLevel level;
  final bool enableSampling;
  final int samplingInitial;
  final int samplingThereafter;
  final bool caller;
  final Sub2ApiAdminOpsStacktraceLevel stacktraceLevel;
  final int retentionDays;
  final String source;
  final DateTime? updatedAt;
  final int? updatedByUserId;
  final Sub2ApiAdminJsonObject extra;
}

final class Sub2ApiAdminOpsDataRetentionSettings {
  const Sub2ApiAdminOpsDataRetentionSettings({
    required this.cleanupEnabled,
    required this.cleanupSchedule,
    required this.errorLogRetentionDays,
    required this.minuteMetricsRetentionDays,
    required this.hourlyMetricsRetentionDays,
  });

  final bool cleanupEnabled;
  final String cleanupSchedule;
  final int errorLogRetentionDays;
  final int minuteMetricsRetentionDays;
  final int hourlyMetricsRetentionDays;
}

final class Sub2ApiAdminOpsAggregationSettings {
  const Sub2ApiAdminOpsAggregationSettings({required this.aggregationEnabled});

  final bool aggregationEnabled;
}

final class Sub2ApiAdminOpsQuotaAutoPauseSettings {
  const Sub2ApiAdminOpsQuotaAutoPauseSettings({
    required this.defaultThreshold5h,
    required this.defaultThreshold7d,
  });

  final Sub2ApiDecimal defaultThreshold5h;
  final Sub2ApiDecimal defaultThreshold7d;
}

final class Sub2ApiAdminOpsAdvancedSettings {
  const Sub2ApiAdminOpsAdvancedSettings({
    required this.dataRetention,
    required this.aggregation,
    required this.openAIAccountQuotaAutoPause,
    required this.ignoreCountTokensErrors,
    required this.ignoreContextCanceled,
    required this.ignoreNoAvailableAccounts,
    required this.ignoreInvalidApiKeyErrors,
    required this.ignoreInsufficientBalanceErrors,
    required this.displayOpenAITokenStats,
    required this.displayAlertEvents,
    required this.autoRefreshEnabled,
    required this.autoRefreshIntervalSeconds,
  });

  final Sub2ApiAdminOpsDataRetentionSettings dataRetention;
  final Sub2ApiAdminOpsAggregationSettings aggregation;
  final Sub2ApiAdminOpsQuotaAutoPauseSettings openAIAccountQuotaAutoPause;
  final bool ignoreCountTokensErrors;
  final bool ignoreContextCanceled;
  final bool ignoreNoAvailableAccounts;
  final bool ignoreInvalidApiKeyErrors;
  final bool ignoreInsufficientBalanceErrors;
  final bool displayOpenAITokenStats;
  final bool displayAlertEvents;
  final bool autoRefreshEnabled;
  final int autoRefreshIntervalSeconds;
}
