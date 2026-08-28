import '../shared/models/sub2api_decimal.dart';
import 'sub2api_admin_ops_dashboard_models.dart';
import 'sub2api_admin_user_models.dart';

enum Sub2ApiAdminOpsAlertMetricType {
  successRate,
  errorRate,
  upstreamErrorRate,
  cpuUsagePercent,
  memoryUsagePercent,
  concurrencyQueueDepth,
  groupAvailableAccounts,
  groupAvailableRatio,
  groupRateLimitRatio,
  accountRateLimitedCount,
  accountErrorCount,
  accountErrorRatio,
  accountTempUnscheduledCount,
  overloadAccountCount,
  proxyExpiredCount,
  proxyExpiringSoonCount,
}

enum Sub2ApiAdminOpsAlertOperator {
  greaterThan,
  lessThan,
  greaterThanOrEqual,
  lessThanOrEqual,
  equal,
  notEqual,
}

enum Sub2ApiAdminOpsAlertSeverity { p0, p1, p2, p3 }

enum Sub2ApiAdminOpsAlertEventStatus { firing, resolved, manualResolved }

enum Sub2ApiAdminOpsAlertResolutionStatus { resolved, manualResolved }

final class Sub2ApiAdminOpsAlertRuleInput {
  const Sub2ApiAdminOpsAlertRuleInput({
    required this.name,
    required this.metricType,
    required this.operator,
    required this.threshold,
    this.description = '',
    this.enabled = true,
    this.severity = Sub2ApiAdminOpsAlertSeverity.p2,
    this.windowMinutes = 1,
    this.sustainedMinutes = 1,
    this.cooldownMinutes = 0,
    this.notifyEmail = true,
    this.filters = const Sub2ApiAdminJsonObject({}),
  });

  final String name;
  final String description;
  final bool enabled;
  final Sub2ApiAdminOpsAlertSeverity severity;
  final Sub2ApiAdminOpsAlertMetricType metricType;
  final Sub2ApiAdminOpsAlertOperator operator;
  final Sub2ApiDecimal threshold;
  final int windowMinutes;
  final int sustainedMinutes;
  final int cooldownMinutes;
  final bool notifyEmail;
  final Sub2ApiAdminJsonObject filters;
}

final class Sub2ApiAdminOpsAlertRule {
  const Sub2ApiAdminOpsAlertRule({
    required this.id,
    required this.name,
    required this.description,
    required this.enabled,
    required this.severity,
    required this.metricType,
    required this.operator,
    required this.threshold,
    required this.windowMinutes,
    required this.sustainedMinutes,
    required this.cooldownMinutes,
    required this.notifyEmail,
    required this.filters,
    this.lastTriggeredAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String description;
  final bool enabled;
  final Sub2ApiAdminOpsAlertSeverity severity;
  final Sub2ApiAdminOpsAlertMetricType metricType;
  final Sub2ApiAdminOpsAlertOperator operator;
  final Sub2ApiDecimal threshold;
  final int windowMinutes;
  final int sustainedMinutes;
  final int cooldownMinutes;
  final bool notifyEmail;
  final Sub2ApiAdminJsonObject filters;
  final DateTime? lastTriggeredAt;
  final DateTime createdAt;
  final DateTime updatedAt;
}

final class Sub2ApiAdminOpsAlertEventQuery {
  const Sub2ApiAdminOpsAlertEventQuery({
    this.limit = 20,
    this.beforeFiredAt,
    this.beforeId,
    this.status,
    this.severity,
    this.emailSent,
    this.timeRange,
    this.startAt,
    this.endAt,
    this.platform,
    this.groupId,
  });

  final int limit;
  final DateTime? beforeFiredAt;
  final int? beforeId;
  final Sub2ApiAdminOpsAlertEventStatus? status;
  final Sub2ApiAdminOpsAlertSeverity? severity;
  final bool? emailSent;
  final Sub2ApiAdminOpsTimeRange? timeRange;
  final DateTime? startAt;
  final DateTime? endAt;
  final String? platform;
  final int? groupId;
}

final class Sub2ApiAdminOpsAlertEvent {
  const Sub2ApiAdminOpsAlertEvent({
    required this.id,
    required this.ruleId,
    required this.severity,
    required this.status,
    required this.title,
    required this.description,
    this.metricValue,
    this.thresholdValue,
    required this.dimensions,
    required this.firedAt,
    this.resolvedAt,
    required this.emailSent,
    required this.createdAt,
  });

  final int id;
  final int ruleId;
  final Sub2ApiAdminOpsAlertSeverity severity;
  final Sub2ApiAdminOpsAlertEventStatus status;
  final String title;
  final String description;
  final Sub2ApiDecimal? metricValue;
  final Sub2ApiDecimal? thresholdValue;
  final Sub2ApiAdminJsonObject dimensions;
  final DateTime firedAt;
  final DateTime? resolvedAt;
  final bool emailSent;
  final DateTime createdAt;
}

final class Sub2ApiAdminOpsAlertMutationResult {
  const Sub2ApiAdminOpsAlertMutationResult({required this.ok});

  final bool ok;
}

final class Sub2ApiAdminOpsAlertSilenceInput {
  const Sub2ApiAdminOpsAlertSilenceInput({
    required this.ruleId,
    required this.platform,
    this.groupId,
    this.region,
    required this.until,
    this.reason = '',
  });

  final int ruleId;
  final String platform;
  final int? groupId;
  final String? region;
  final DateTime until;
  final String reason;
}

final class Sub2ApiAdminOpsAlertSilence {
  const Sub2ApiAdminOpsAlertSilence({
    required this.id,
    required this.ruleId,
    required this.platform,
    this.groupId,
    this.region,
    required this.until,
    required this.reason,
    this.createdByUserId,
    required this.createdAt,
  });

  final int id;
  final int ruleId;
  final String platform;
  final int? groupId;
  final String? region;
  final DateTime until;
  final String reason;
  final int? createdByUserId;
  final DateTime createdAt;
}
