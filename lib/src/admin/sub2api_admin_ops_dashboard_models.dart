import '../shared/models/sub2api_decimal.dart';

enum Sub2ApiAdminOpsTimeRange {
  fiveMinutes,
  thirtyMinutes,
  oneHour,
  sixHours,
  twentyFourHours,
  sevenDays,
  thirtyDays,
}

enum Sub2ApiAdminOpsQueryMode { serverDefault, automatic, raw, preAggregated }

final class Sub2ApiAdminOpsDashboardQuery {
  const Sub2ApiAdminOpsDashboardQuery({
    this.timeRange = Sub2ApiAdminOpsTimeRange.oneHour,
    this.startAt,
    this.endAt,
    this.platform,
    this.groupId,
    this.queryMode = Sub2ApiAdminOpsQueryMode.serverDefault,
  });
  final Sub2ApiAdminOpsTimeRange timeRange;
  final DateTime? startAt;
  final DateTime? endAt;
  final String? platform;
  final int? groupId;
  final Sub2ApiAdminOpsQueryMode queryMode;
}

enum Sub2ApiAdminOpsOpenAITimeRange {
  thirtyMinutes,
  oneHour,
  oneDay,
  fifteenDays,
  thirtyDays,
}

final class Sub2ApiAdminOpsOpenAITokenStatsQuery {
  const Sub2ApiAdminOpsOpenAITokenStatsQuery({
    this.timeRange = Sub2ApiAdminOpsOpenAITimeRange.thirtyDays,
    this.platform,
    this.groupId,
    this.page = 1,
    this.pageSize = 20,
    this.topN,
  });
  final Sub2ApiAdminOpsOpenAITimeRange timeRange;
  final String? platform;
  final int? groupId;
  final int page;
  final int pageSize;
  final int? topN;
}

final class Sub2ApiAdminOpsRateSummary {
  const Sub2ApiAdminOpsRateSummary({
    required this.current,
    required this.peak,
    required this.average,
  });
  final Sub2ApiDecimal current;
  final Sub2ApiDecimal peak;
  final Sub2ApiDecimal average;
}

final class Sub2ApiAdminOpsPercentiles {
  const Sub2ApiAdminOpsPercentiles({
    this.p50Ms,
    this.p90Ms,
    this.p95Ms,
    this.p99Ms,
    this.averageMs,
    this.maxMs,
  });
  final int? p50Ms;
  final int? p90Ms;
  final int? p95Ms;
  final int? p99Ms;
  final int? averageMs;
  final int? maxMs;
}

final class Sub2ApiAdminOpsSystemMetrics {
  const Sub2ApiAdminOpsSystemMetrics({
    required this.id,
    required this.createdAt,
    required this.windowMinutes,
    this.cpuUsagePercent,
    this.memoryUsedMb,
    this.memoryTotalMb,
    this.memoryUsagePercent,
    this.databaseOk,
    this.redisOk,
    this.databaseMaxOpenConnections,
    this.redisPoolSize,
    this.redisConnectionsTotal,
    this.redisConnectionsIdle,
    this.databaseConnectionsActive,
    this.databaseConnectionsIdle,
    this.databaseConnectionsWaiting,
    this.goroutineCount,
    this.concurrencyQueueDepth,
    this.accountSwitchCount,
  });
  final int id;
  final DateTime createdAt;
  final int windowMinutes;
  final Sub2ApiDecimal? cpuUsagePercent;
  final int? memoryUsedMb;
  final int? memoryTotalMb;
  final Sub2ApiDecimal? memoryUsagePercent;
  final bool? databaseOk;
  final bool? redisOk;
  final int? databaseMaxOpenConnections;
  final int? redisPoolSize;
  final int? redisConnectionsTotal;
  final int? redisConnectionsIdle;
  final int? databaseConnectionsActive;
  final int? databaseConnectionsIdle;
  final int? databaseConnectionsWaiting;
  final int? goroutineCount;
  final int? concurrencyQueueDepth;
  final int? accountSwitchCount;
}

final class Sub2ApiAdminOpsJobHeartbeat {
  const Sub2ApiAdminOpsJobHeartbeat({
    required this.jobName,
    this.lastRunAt,
    this.lastSuccessAt,
    this.lastErrorAt,
    required this.lastError,
    this.lastDurationMs,
    required this.lastResult,
    required this.updatedAt,
  });
  final String jobName;
  final DateTime? lastRunAt;
  final DateTime? lastSuccessAt;
  final DateTime? lastErrorAt;
  final String lastError;
  final int? lastDurationMs;
  final String lastResult;
  final DateTime updatedAt;
}

final class Sub2ApiAdminOpsDashboardOverview {
  Sub2ApiAdminOpsDashboardOverview({
    required this.startAt,
    required this.endAt,
    required this.platform,
    this.groupId,
    required this.healthScore,
    this.systemMetrics,
    required List<Sub2ApiAdminOpsJobHeartbeat> jobHeartbeats,
    required this.successCount,
    required this.errorCountTotal,
    required this.businessLimitedCount,
    required this.errorCountSla,
    required this.requestCountTotal,
    required this.requestCountSla,
    required this.tokenConsumed,
    required this.sla,
    required this.errorRate,
    required this.upstreamErrorRate,
    required this.upstreamErrorCountExcluding429And529,
    required this.upstream429Count,
    required this.upstream529Count,
    required this.qps,
    required this.tps,
    required this.duration,
    required this.timeToFirstToken,
  }) : jobHeartbeats = List.unmodifiable(jobHeartbeats);
  final DateTime startAt;
  final DateTime endAt;
  final String platform;
  final int? groupId;
  final int healthScore;
  final Sub2ApiAdminOpsSystemMetrics? systemMetrics;
  final List<Sub2ApiAdminOpsJobHeartbeat> jobHeartbeats;
  final int successCount;
  final int errorCountTotal;
  final int businessLimitedCount;
  final int errorCountSla;
  final int requestCountTotal;
  final int requestCountSla;
  final int tokenConsumed;
  final Sub2ApiDecimal sla;
  final Sub2ApiDecimal errorRate;
  final Sub2ApiDecimal upstreamErrorRate;
  final int upstreamErrorCountExcluding429And529;
  final int upstream429Count;
  final int upstream529Count;
  final Sub2ApiAdminOpsRateSummary qps;
  final Sub2ApiAdminOpsRateSummary tps;
  final Sub2ApiAdminOpsPercentiles duration;
  final Sub2ApiAdminOpsPercentiles timeToFirstToken;
}

final class Sub2ApiAdminOpsThroughputPoint {
  const Sub2ApiAdminOpsThroughputPoint({
    required this.bucketStart,
    required this.requestCount,
    required this.tokenConsumed,
    required this.switchCount,
    required this.qps,
    required this.tps,
  });
  final DateTime bucketStart;
  final int requestCount;
  final int tokenConsumed;
  final int switchCount;
  final Sub2ApiDecimal qps;
  final Sub2ApiDecimal tps;
}

final class Sub2ApiAdminOpsThroughputPlatform {
  const Sub2ApiAdminOpsThroughputPlatform({
    required this.platform,
    required this.requestCount,
    required this.tokenConsumed,
  });
  final String platform;
  final int requestCount;
  final int tokenConsumed;
}

final class Sub2ApiAdminOpsThroughputGroup {
  const Sub2ApiAdminOpsThroughputGroup({
    required this.groupId,
    required this.groupName,
    required this.requestCount,
    required this.tokenConsumed,
  });
  final int groupId;
  final String groupName;
  final int requestCount;
  final int tokenConsumed;
}

final class Sub2ApiAdminOpsThroughputTrend {
  Sub2ApiAdminOpsThroughputTrend({
    required this.bucket,
    required List<Sub2ApiAdminOpsThroughputPoint> points,
    required List<Sub2ApiAdminOpsThroughputPlatform> byPlatform,
    required List<Sub2ApiAdminOpsThroughputGroup> topGroups,
  }) : points = List.unmodifiable(points),
       byPlatform = List.unmodifiable(byPlatform),
       topGroups = List.unmodifiable(topGroups);
  final String bucket;
  final List<Sub2ApiAdminOpsThroughputPoint> points;
  final List<Sub2ApiAdminOpsThroughputPlatform> byPlatform;
  final List<Sub2ApiAdminOpsThroughputGroup> topGroups;
}

final class Sub2ApiAdminOpsLatencyBucket {
  const Sub2ApiAdminOpsLatencyBucket({
    required this.range,
    required this.count,
  });
  final String range;
  final int count;
}

final class Sub2ApiAdminOpsLatencyHistogram {
  Sub2ApiAdminOpsLatencyHistogram({
    required this.startAt,
    required this.endAt,
    required this.platform,
    this.groupId,
    required this.totalRequests,
    required List<Sub2ApiAdminOpsLatencyBucket> buckets,
  }) : buckets = List.unmodifiable(buckets);
  final DateTime startAt;
  final DateTime endAt;
  final String platform;
  final int? groupId;
  final int totalRequests;
  final List<Sub2ApiAdminOpsLatencyBucket> buckets;
}

final class Sub2ApiAdminOpsErrorTrendPoint {
  const Sub2ApiAdminOpsErrorTrendPoint({
    required this.bucketStart,
    required this.errorCountTotal,
    required this.businessLimitedCount,
    required this.errorCountSla,
    required this.upstreamErrorCountExcluding429And529,
    required this.upstream429Count,
    required this.upstream529Count,
  });
  final DateTime bucketStart;
  final int errorCountTotal;
  final int businessLimitedCount;
  final int errorCountSla;
  final int upstreamErrorCountExcluding429And529;
  final int upstream429Count;
  final int upstream529Count;
}

final class Sub2ApiAdminOpsErrorTrend {
  Sub2ApiAdminOpsErrorTrend({
    required this.bucket,
    required List<Sub2ApiAdminOpsErrorTrendPoint> points,
  }) : points = List.unmodifiable(points);
  final String bucket;
  final List<Sub2ApiAdminOpsErrorTrendPoint> points;
}

final class Sub2ApiAdminOpsErrorDistributionItem {
  const Sub2ApiAdminOpsErrorDistributionItem({
    required this.statusCode,
    required this.total,
    required this.sla,
    required this.businessLimited,
  });
  final int statusCode;
  final int total;
  final int sla;
  final int businessLimited;
}

final class Sub2ApiAdminOpsErrorDistribution {
  Sub2ApiAdminOpsErrorDistribution({
    required this.total,
    required List<Sub2ApiAdminOpsErrorDistributionItem> items,
  }) : items = List.unmodifiable(items);
  final int total;
  final List<Sub2ApiAdminOpsErrorDistributionItem> items;
}

final class Sub2ApiAdminOpsOpenAITokenStatsItem {
  const Sub2ApiAdminOpsOpenAITokenStatsItem({
    required this.model,
    required this.requestCount,
    this.averageTokensPerSecond,
    this.averageFirstTokenMs,
    required this.totalOutputTokens,
    required this.averageDurationMs,
    required this.requestsWithFirstToken,
  });
  final String model;
  final int requestCount;
  final Sub2ApiDecimal? averageTokensPerSecond;
  final Sub2ApiDecimal? averageFirstTokenMs;
  final int totalOutputTokens;
  final int averageDurationMs;
  final int requestsWithFirstToken;
}

final class Sub2ApiAdminOpsOpenAITokenStats {
  Sub2ApiAdminOpsOpenAITokenStats({
    required this.timeRange,
    required this.startAt,
    required this.endAt,
    required this.platform,
    this.groupId,
    required List<Sub2ApiAdminOpsOpenAITokenStatsItem> items,
    required this.total,
    required this.page,
    required this.pageSize,
    this.topN,
  }) : items = List.unmodifiable(items);
  final String timeRange;
  final DateTime startAt;
  final DateTime endAt;
  final String platform;
  final int? groupId;
  final List<Sub2ApiAdminOpsOpenAITokenStatsItem> items;
  final int total;
  final int page;
  final int pageSize;
  final int? topN;
}

final class Sub2ApiAdminOpsDashboardSnapshot {
  const Sub2ApiAdminOpsDashboardSnapshot({
    required this.generatedAt,
    required this.overview,
    required this.throughputTrend,
    required this.errorTrend,
  });
  final DateTime generatedAt;
  final Sub2ApiAdminOpsDashboardOverview overview;
  final Sub2ApiAdminOpsThroughputTrend throughputTrend;
  final Sub2ApiAdminOpsErrorTrend errorTrend;
}
