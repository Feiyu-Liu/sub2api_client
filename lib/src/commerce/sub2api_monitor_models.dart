import '../shared/models/sub2api_decimal.dart';

/// Supported passive-monitor time windows.
enum Sub2ApiMonitorRange { ninetyMinutes, day, week, month }

/// Supported matrix aggregation dimensions.
enum Sub2ApiMonitorGroupBy {
  platform,
  platformGroup,
  platformModel,
  platformGroupModel,
}

/// Typed filters shared by passive channel-monitor v2 endpoints.
final class Sub2ApiMonitorFilter {
  const Sub2ApiMonitorFilter({
    this.range = Sub2ApiMonitorRange.day,
    this.platforms = const <String>[],
    this.groupIds = const <int>[],
    this.models = const <String>[],
  });

  final Sub2ApiMonitorRange range;
  final List<String> platforms;
  final List<int> groupIds;
  final List<String> models;
}

/// One normalized quota window from a v1 channel monitor.
final class Sub2ApiMonitorQuotaTier {
  const Sub2ApiMonitorQuotaTier({
    required this.window,
    required this.label,
    required this.usedPercent,
    required this.used,
    required this.limit,
    this.resetAt,
  });

  final String window;
  final String label;
  final Sub2ApiDecimal usedPercent;
  final Sub2ApiDecimal used;
  final Sub2ApiDecimal limit;
  final DateTime? resetAt;
}

/// One currency balance from a v1 quota snapshot.
final class Sub2ApiMonitorBalance {
  const Sub2ApiMonitorBalance({required this.currency, required this.balance});

  final String currency;
  final Sub2ApiDecimal balance;
}

/// Latest normalized quota or balance snapshot for a v1 monitor.
final class Sub2ApiMonitorQuotaSnapshot {
  const Sub2ApiMonitorQuotaSnapshot({
    required this.source,
    required this.success,
    required this.tiers,
    this.balance,
    required this.balances,
    required this.currency,
    required this.planLevel,
    required this.balanceLow,
    required this.credentialInvalid,
    required this.error,
    required this.fetchedAt,
  });

  final String source;
  final bool success;
  final List<Sub2ApiMonitorQuotaTier> tiers;
  final Sub2ApiDecimal? balance;
  final List<Sub2ApiMonitorBalance> balances;
  final String currency;
  final String planLevel;
  final bool balanceLow;
  final bool credentialInvalid;
  final String error;
  final DateTime fetchedAt;
}

/// Latest status for one extra model in a v1 monitor.
final class Sub2ApiMonitorExtraModel {
  const Sub2ApiMonitorExtraModel({
    required this.model,
    required this.status,
    this.latencyMs,
  });

  final String model;
  final String status;
  final int? latencyMs;
}

/// One recent primary-model check in a v1 monitor timeline.
final class Sub2ApiMonitorTimelinePoint {
  const Sub2ApiMonitorTimelinePoint({
    required this.status,
    this.latencyMs,
    this.pingLatencyMs,
    required this.checkedAt,
  });

  final String status;
  final int? latencyMs;
  final int? pingLatencyMs;
  final DateTime checkedAt;
}

/// One current-user read-only v1 monitor overview.
final class Sub2ApiChannelMonitor {
  const Sub2ApiChannelMonitor({
    required this.id,
    required this.name,
    required this.provider,
    required this.groupName,
    required this.primaryModel,
    required this.primaryStatus,
    this.primaryLatencyMs,
    this.primaryPingLatencyMs,
    required this.availability7d,
    required this.extraModels,
    required this.timeline,
    this.latestQuota,
  });

  final int id;
  final String name;
  final String provider;
  final String groupName;
  final String primaryModel;
  final String primaryStatus;
  final int? primaryLatencyMs;
  final int? primaryPingLatencyMs;
  final Sub2ApiDecimal availability7d;
  final List<Sub2ApiMonitorExtraModel> extraModels;
  final List<Sub2ApiMonitorTimelinePoint> timeline;
  final Sub2ApiMonitorQuotaSnapshot? latestQuota;
}

/// V1 multi-window availability for one model.
final class Sub2ApiChannelMonitorModelDetail {
  const Sub2ApiChannelMonitorModelDetail({
    required this.model,
    required this.latestStatus,
    this.latestLatencyMs,
    required this.availability7d,
    required this.availability15d,
    required this.availability30d,
    this.averageLatency7dMs,
  });

  final String model;
  final String latestStatus;
  final int? latestLatencyMs;
  final Sub2ApiDecimal availability7d;
  final Sub2ApiDecimal availability15d;
  final Sub2ApiDecimal availability30d;
  final int? averageLatency7dMs;
}

/// Detailed current-user v1 channel-monitor status.
final class Sub2ApiChannelMonitorDetail {
  const Sub2ApiChannelMonitorDetail({
    required this.id,
    required this.name,
    required this.provider,
    required this.groupName,
    required this.models,
  });

  final int id;
  final String name;
  final String provider;
  final String groupName;
  final List<Sub2ApiChannelMonitorModelDetail> models;
}

/// V2 platform configuration embedded in a snapshot.
final class Sub2ApiMonitorPlatformConfig {
  const Sub2ApiMonitorPlatformConfig({
    required this.platform,
    required this.enabled,
    required this.models,
  });

  final String platform;
  final bool enabled;
  final List<String> models;
}

/// V2 health-score thresholds.
final class Sub2ApiMonitorThresholds {
  const Sub2ApiMonitorThresholds({
    required this.minimumSample,
    required this.warningErrorRate,
    required this.criticalErrorRate,
    required this.targetTtftMs,
    required this.warningTtftMs,
    required this.criticalTtftMs,
    required this.warningCacheRate,
    required this.criticalCacheRate,
    required this.errorWeight,
    required this.ttftWeight,
    required this.cacheWeight,
  });

  final int minimumSample;
  final Sub2ApiDecimal warningErrorRate;
  final Sub2ApiDecimal criticalErrorRate;
  final int targetTtftMs;
  final int warningTtftMs;
  final int criticalTtftMs;
  final Sub2ApiDecimal warningCacheRate;
  final Sub2ApiDecimal criticalCacheRate;
  final Sub2ApiDecimal errorWeight;
  final Sub2ApiDecimal ttftWeight;
  final Sub2ApiDecimal cacheWeight;
}

/// V2 runtime configuration returned in snapshots.
final class Sub2ApiMonitorConfig {
  const Sub2ApiMonitorConfig({
    required this.version,
    required this.enabled,
    required this.refreshIntervalSeconds,
    required this.platforms,
    required this.groupIds,
    required this.healthThresholds,
    required this.ignoredErrorCategories,
    required this.updatedAt,
    this.updatedBy,
  });

  final int version;
  final bool enabled;
  final int refreshIntervalSeconds;
  final List<Sub2ApiMonitorPlatformConfig> platforms;
  final List<int> groupIds;
  final Sub2ApiMonitorThresholds healthThresholds;
  final List<String> ignoredErrorCategories;
  final DateTime updatedAt;
  final int? updatedBy;
}

/// V2 latency distribution.
final class Sub2ApiMonitorLatency {
  const Sub2ApiMonitorLatency({
    required this.sampleCount,
    this.p50Ms,
    this.p90Ms,
    this.p95Ms,
    this.averageMs,
  });

  final int sampleCount;
  final int? p50Ms;
  final int? p90Ms;
  final int? p95Ms;
  final Sub2ApiDecimal? averageMs;
}

/// V2 traffic, token, rate, and latency metrics.
final class Sub2ApiMonitorMetric {
  const Sub2ApiMonitorMetric({
    required this.successRequests,
    required this.errorRequests,
    required this.requestCount,
    required this.inputTokens,
    required this.outputTokens,
    required this.cacheCreationTokens,
    required this.cacheReadTokens,
    required this.tokenCount,
    required this.rpm,
    required this.tpm,
    required this.errorRate,
    required this.successRate,
    required this.cacheRate,
    required this.cacheRateNumerator,
    required this.cacheRateDenominator,
    required this.ttft,
    required this.duration,
    this.upstreamAffectedRequests,
    this.upstreamAttemptCount,
  });

  final int successRequests;
  final int errorRequests;
  final int requestCount;
  final int inputTokens;
  final int outputTokens;
  final int cacheCreationTokens;
  final int cacheReadTokens;
  final int tokenCount;
  final Sub2ApiDecimal rpm;
  final Sub2ApiDecimal tpm;
  final Sub2ApiDecimal errorRate;
  final Sub2ApiDecimal successRate;
  final Sub2ApiDecimal cacheRate;
  final int cacheRateNumerator;
  final int cacheRateDenominator;
  final Sub2ApiMonitorLatency ttft;
  final Sub2ApiMonitorLatency duration;
  final int? upstreamAffectedRequests;
  final int? upstreamAttemptCount;
}

/// V2 health bands and optional numeric scores.
final class Sub2ApiMonitorHealth {
  const Sub2ApiMonitorHealth({
    required this.overall,
    required this.errorRate,
    required this.ttft,
    required this.cache,
    this.score,
    this.errorRateScore,
    this.ttftScore,
    this.cacheScore,
    required this.minimumSample,
    required this.thresholds,
  });

  final String overall;
  final String errorRate;
  final String ttft;
  final String cache;
  final Sub2ApiDecimal? score;
  final Sub2ApiDecimal? errorRateScore;
  final Sub2ApiDecimal? ttftScore;
  final Sub2ApiDecimal? cacheScore;
  final int minimumSample;
  final Sub2ApiMonitorThresholds thresholds;
}

/// Optional first-upgrade aggregation progress.
final class Sub2ApiMonitorBootstrap {
  const Sub2ApiMonitorBootstrap({
    required this.active,
    required this.progressPercent,
    this.coveredFrom,
    this.targetStart,
  });

  final bool active;
  final int progressPercent;
  final DateTime? coveredFrom;
  final DateTime? targetStart;
}

/// V2 aggregation coverage and freshness.
final class Sub2ApiMonitorCoverage {
  const Sub2ApiMonitorCoverage({
    required this.requestedStart,
    required this.requestedEnd,
    required this.coverageStart,
    required this.dataThrough,
    required this.computedAt,
    required this.aggregationLagSeconds,
    required this.coverageComplete,
    required this.bucketSeconds,
    this.bootstrap,
  });

  final DateTime requestedStart;
  final DateTime requestedEnd;
  final DateTime coverageStart;
  final DateTime dataThrough;
  final DateTime computedAt;
  final int aggregationLagSeconds;
  final bool coverageComplete;
  final int bucketSeconds;
  final Sub2ApiMonitorBootstrap? bootstrap;
}

/// One V2 time bucket.
final class Sub2ApiMonitorTrendPoint {
  const Sub2ApiMonitorTrendPoint({
    required this.bucketStart,
    required this.metrics,
    required this.health,
  });

  final DateTime bucketStart;
  final Sub2ApiMonitorMetric metrics;
  final Sub2ApiMonitorHealth health;
}

/// Complete V2 user snapshot.
final class Sub2ApiMonitorSnapshot {
  const Sub2ApiMonitorSnapshot({
    required this.config,
    required this.coverage,
    required this.metrics,
    required this.health,
    required this.trend,
  });

  final Sub2ApiMonitorConfig config;
  final Sub2ApiMonitorCoverage coverage;
  final Sub2ApiMonitorMetric metrics;
  final Sub2ApiMonitorHealth health;
  final List<Sub2ApiMonitorTrendPoint> trend;
}

/// String-valued V2 platform or model dimension.
final class Sub2ApiMonitorDimension {
  const Sub2ApiMonitorDimension({
    required this.value,
    required this.label,
    required this.platform,
    required this.requestCount,
  });

  final String value;
  final String label;
  final String platform;
  final int requestCount;
}

/// Integer-valued V2 group dimension.
final class Sub2ApiMonitorGroupDimension {
  const Sub2ApiMonitorGroupDimension({
    required this.id,
    required this.name,
    required this.platform,
    required this.requestCount,
  });

  final int id;
  final String name;
  final String platform;
  final int requestCount;
}

/// V2 filter dimensions. User responses redact request counts to zero.
final class Sub2ApiMonitorDimensions {
  const Sub2ApiMonitorDimensions({
    required this.platforms,
    required this.groups,
    required this.models,
  });

  final List<Sub2ApiMonitorDimension> platforms;
  final List<Sub2ApiMonitorGroupDimension> groups;
  final List<Sub2ApiMonitorDimension> models;
}

/// One V2 model health row.
final class Sub2ApiMonitorModelRow {
  const Sub2ApiMonitorModelRow({
    required this.platform,
    required this.model,
    required this.metrics,
    required this.health,
  });

  final String platform;
  final String model;
  final Sub2ApiMonitorMetric metrics;
  final Sub2ApiMonitorHealth health;
}

/// Generic V2 list with shared coverage facts.
final class Sub2ApiMonitorList<T> {
  const Sub2ApiMonitorList({required this.coverage, required this.items});

  final Sub2ApiMonitorCoverage coverage;
  final List<T> items;
}

/// One V2 matrix row and its buckets.
final class Sub2ApiMonitorMatrixRow {
  const Sub2ApiMonitorMatrixRow({
    required this.platform,
    this.groupId,
    required this.groupName,
    required this.model,
    required this.metrics,
    required this.health,
    required this.buckets,
  });

  final String platform;
  final int? groupId;
  final String groupName;
  final String model;
  final Sub2ApiMonitorMetric metrics;
  final Sub2ApiMonitorHealth health;
  final List<Sub2ApiMonitorTrendPoint> buckets;
}

/// V2 matrix result.
final class Sub2ApiMonitorMatrix {
  const Sub2ApiMonitorMatrix({
    required this.groupBy,
    required this.coverage,
    required this.items,
  });

  final Sub2ApiMonitorGroupBy groupBy;
  final Sub2ApiMonitorCoverage coverage;
  final List<Sub2ApiMonitorMatrixRow> items;
}

/// One optional admin-only sample detail; user responses normally omit these.
final class Sub2ApiMonitorErrorDetail {
  const Sub2ApiMonitorErrorDetail({
    required this.platform,
    required this.model,
    required this.errorType,
    required this.statusCode,
    required this.upstreamStatusCode,
    required this.message,
    required this.count,
  });

  final String platform;
  final String model;
  final String errorType;
  final int statusCode;
  final int upstreamStatusCode;
  final String message;
  final int count;
}

/// One V2 error-category aggregate.
final class Sub2ApiMonitorErrorRow {
  const Sub2ApiMonitorErrorRow({
    required this.category,
    required this.count,
    required this.rate,
    required this.details,
    required this.ignored,
  });

  final String category;
  final int count;
  final Sub2ApiDecimal rate;
  final List<Sub2ApiMonitorErrorDetail> details;
  final bool ignored;
}

/// One V2 user-ranking row; non-self user identities are redacted server-side.
final class Sub2ApiMonitorUserRow {
  const Sub2ApiMonitorUserRow({
    this.userId,
    required this.rank,
    required this.email,
    required this.username,
    required this.displayLabel,
    required this.isSelf,
    required this.canDrilldown,
    required this.metrics,
  });

  final int? userId;
  final int rank;
  final String email;
  final String username;
  final String displayLabel;
  final bool isSelf;
  final bool canDrilldown;
  final Sub2ApiMonitorMetric metrics;
}
