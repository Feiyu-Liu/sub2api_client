import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/models/sub2api_auth_models.dart';
import '../shared/models/sub2api_decimal.dart';

part 'sub2api_admin_models.freezed.dart';

/// Verified administrator identity returned by the JWT facade bootstrap.
final class Sub2ApiAdminIdentity {
  const Sub2ApiAdminIdentity({required this.currentUser});

  final Sub2ApiCurrentUser currentUser;
}

/// Calendar bucket granularity accepted by Admin dashboard endpoints.
enum Sub2ApiAdminUsageGranularity { day, hour }

/// Typed request category accepted by Admin usage filters.
enum Sub2ApiAdminUsageRequestType {
  unknown,
  sync,
  stream,
  webSocketV2,
  cyber,
  live,
}

/// Billing source accepted by Admin usage filters.
enum Sub2ApiAdminBillingType { balance, subscription }

/// Model name column used by model-oriented Admin dashboard queries.
enum Sub2ApiAdminModelSource { requested, upstream, mapping }

/// Endpoint column used by the per-user breakdown query.
enum Sub2ApiAdminEndpointType { inbound, upstream, path }

/// Server allowlisted ordering for the per-user breakdown query.
enum Sub2ApiAdminUserBreakdownSort {
  totalTokens,
  inputTokens,
  outputTokens,
  cacheTokens,
  requests,
  cost,
  actualCost,
}

/// Filters shared by Admin trend, model, group, and snapshot reads.
@freezed
abstract class Sub2ApiAdminDashboardFilter with _$Sub2ApiAdminDashboardFilter {
  const factory Sub2ApiAdminDashboardFilter({
    DateTime? startDate,
    DateTime? endDate,
    String? timezone,
    int? userId,
    int? apiKeyId,
    int? accountId,
    int? groupId,
    Sub2ApiAdminUsageRequestType? requestType,
    bool? stream,
    Sub2ApiAdminBillingType? billingType,
    bool? upstreamModelMismatch,
  }) = _Sub2ApiAdminDashboardFilter;
}

/// Query for system-wide usage trend buckets.
@freezed
abstract class Sub2ApiAdminUsageTrendQuery with _$Sub2ApiAdminUsageTrendQuery {
  const factory Sub2ApiAdminUsageTrendQuery({
    @Default(Sub2ApiAdminDashboardFilter()) Sub2ApiAdminDashboardFilter filter,
    @Default(Sub2ApiAdminUsageGranularity.day)
    Sub2ApiAdminUsageGranularity granularity,
    String? model,
  }) = _Sub2ApiAdminUsageTrendQuery;
}

/// Query for system-wide requested, upstream, or mapped model aggregates.
@freezed
abstract class Sub2ApiAdminModelStatsQuery with _$Sub2ApiAdminModelStatsQuery {
  const factory Sub2ApiAdminModelStatsQuery({
    @Default(Sub2ApiAdminDashboardFilter()) Sub2ApiAdminDashboardFilter filter,
    @Default(Sub2ApiAdminModelSource.requested)
    Sub2ApiAdminModelSource modelSource,
  }) = _Sub2ApiAdminModelStatsQuery;
}

/// Query for system-wide group aggregates.
@freezed
abstract class Sub2ApiAdminGroupStatsQuery with _$Sub2ApiAdminGroupStatsQuery {
  const factory Sub2ApiAdminGroupStatsQuery({
    @Default(Sub2ApiAdminDashboardFilter()) Sub2ApiAdminDashboardFilter filter,
  }) = _Sub2ApiAdminGroupStatsQuery;
}

/// Query for top API-key or user trend series.
@freezed
abstract class Sub2ApiAdminEntityTrendQuery
    with _$Sub2ApiAdminEntityTrendQuery {
  const factory Sub2ApiAdminEntityTrendQuery({
    DateTime? startDate,
    DateTime? endDate,
    String? timezone,
    @Default(Sub2ApiAdminUsageGranularity.day)
    Sub2ApiAdminUsageGranularity granularity,
    int? limit,
  }) = _Sub2ApiAdminEntityTrendQuery;
}

/// Query for the user spending leaderboard.
@freezed
abstract class Sub2ApiAdminUserSpendingRankingQuery
    with _$Sub2ApiAdminUserSpendingRankingQuery {
  const factory Sub2ApiAdminUserSpendingRankingQuery({
    DateTime? startDate,
    DateTime? endDate,
    String? timezone,
    int? limit,
  }) = _Sub2ApiAdminUserSpendingRankingQuery;
}

/// Query for per-user usage within a selected group, model, or endpoint.
@freezed
abstract class Sub2ApiAdminUserBreakdownQuery
    with _$Sub2ApiAdminUserBreakdownQuery {
  const factory Sub2ApiAdminUserBreakdownQuery({
    DateTime? startDate,
    DateTime? endDate,
    String? timezone,
    int? groupId,
    String? model,
    @Default(Sub2ApiAdminModelSource.requested)
    Sub2ApiAdminModelSource modelSource,
    String? endpoint,
    @Default(Sub2ApiAdminEndpointType.inbound)
    Sub2ApiAdminEndpointType endpointType,
    int? userId,
    int? apiKeyId,
    int? accountId,
    Sub2ApiAdminUsageRequestType? requestType,
    bool? stream,
    Sub2ApiAdminBillingType? billingType,
    Sub2ApiAdminUserBreakdownSort? sortBy,
    @Default(50) int limit,
  }) = _Sub2ApiAdminUserBreakdownQuery;
}

/// Inclusion flags and filters for the aggregated Admin dashboard snapshot.
@freezed
abstract class Sub2ApiAdminDashboardSnapshotRequest
    with _$Sub2ApiAdminDashboardSnapshotRequest {
  const factory Sub2ApiAdminDashboardSnapshotRequest({
    @Default(Sub2ApiAdminDashboardFilter()) Sub2ApiAdminDashboardFilter filter,
    @Default(Sub2ApiAdminUsageGranularity.day)
    Sub2ApiAdminUsageGranularity granularity,
    String? model,
    @Default(true) bool includeStats,
    @Default(true) bool includeTrend,
    @Default(true) bool includeModelStats,
    @Default(false) bool includeGroupStats,
    @Default(false) bool includeUsersTrend,
    @Default(12) int usersTrendLimit,
  }) = _Sub2ApiAdminDashboardSnapshotRequest;
}

/// Requested aggregation interval for a controlled dashboard backfill.
@freezed
abstract class Sub2ApiAdminAggregationBackfillRequest
    with _$Sub2ApiAdminAggregationBackfillRequest {
  const factory Sub2ApiAdminAggregationBackfillRequest({
    required DateTime start,
    required DateTime end,
  }) = _Sub2ApiAdminAggregationBackfillRequest;
}

/// System-wide dashboard totals returned by `/admin/dashboard/stats`.
@freezed
abstract class Sub2ApiAdminDashboardStats with _$Sub2ApiAdminDashboardStats {
  const factory Sub2ApiAdminDashboardStats({
    required int totalUsers,
    required int todayNewUsers,
    required int activeUsers,
    required int hourlyActiveUsers,
    required DateTime statsUpdatedAt,
    required bool statsStale,
    required int totalApiKeys,
    required int activeApiKeys,
    required int totalAccounts,
    required int normalAccounts,
    required int errorAccounts,
    required int rateLimitAccounts,
    required int overloadAccounts,
    required int totalRequests,
    required int totalInputTokens,
    required int totalOutputTokens,
    required int totalCacheCreationTokens,
    required int totalCacheReadTokens,
    required int totalTokens,
    required Sub2ApiDecimal totalCost,
    required Sub2ApiDecimal totalActualCost,
    required int todayRequests,
    required int todayInputTokens,
    required int todayOutputTokens,
    required int todayCacheCreationTokens,
    required int todayCacheReadTokens,
    required int todayTokens,
    required Sub2ApiDecimal todayCost,
    required Sub2ApiDecimal todayActualCost,
    required Sub2ApiDecimal averageDurationMs,
    required int uptime,
    required int rpm,
    required int tpm,
  }) = _Sub2ApiAdminDashboardStats;
}

/// Lightweight real-time counters exposed by the fixed Admin contract.
@freezed
abstract class Sub2ApiAdminDashboardRealtimeMetrics
    with _$Sub2ApiAdminDashboardRealtimeMetrics {
  const factory Sub2ApiAdminDashboardRealtimeMetrics({
    required int activeRequests,
    required int requestsPerMinute,
    required Sub2ApiDecimal averageResponseTime,
    required Sub2ApiDecimal errorRate,
  }) = _Sub2ApiAdminDashboardRealtimeMetrics;
}

/// One system-wide dashboard trend bucket.
@freezed
abstract class Sub2ApiAdminDashboardTrendPoint
    with _$Sub2ApiAdminDashboardTrendPoint {
  const factory Sub2ApiAdminDashboardTrendPoint({
    required String date,
    required int requests,
    required int inputTokens,
    required int outputTokens,
    required int cacheCreationTokens,
    required int cacheReadTokens,
    required int totalTokens,
    required Sub2ApiDecimal cost,
    required Sub2ApiDecimal actualCost,
  }) = _Sub2ApiAdminDashboardTrendPoint;
}

/// System-wide dashboard trend plus the effective server-selected range.
@freezed
abstract class Sub2ApiAdminDashboardTrend with _$Sub2ApiAdminDashboardTrend {
  const factory Sub2ApiAdminDashboardTrend({
    required List<Sub2ApiAdminDashboardTrendPoint> points,
    required DateTime startDate,
    required DateTime endDate,
    required Sub2ApiAdminUsageGranularity granularity,
  }) = _Sub2ApiAdminDashboardTrend;
}

/// One model aggregate, including the upstream account cost.
@freezed
abstract class Sub2ApiAdminDashboardModelStats
    with _$Sub2ApiAdminDashboardModelStats {
  const factory Sub2ApiAdminDashboardModelStats({
    required String model,
    required int requests,
    required int inputTokens,
    required int outputTokens,
    required int cacheCreationTokens,
    required int cacheReadTokens,
    required int totalTokens,
    required Sub2ApiDecimal cost,
    required Sub2ApiDecimal actualCost,
    required Sub2ApiDecimal accountCost,
  }) = _Sub2ApiAdminDashboardModelStats;
}

/// Model aggregates plus the effective server-selected range.
@freezed
abstract class Sub2ApiAdminDashboardModels with _$Sub2ApiAdminDashboardModels {
  const factory Sub2ApiAdminDashboardModels({
    required List<Sub2ApiAdminDashboardModelStats> models,
    required DateTime startDate,
    required DateTime endDate,
  }) = _Sub2ApiAdminDashboardModels;
}

/// One group aggregate, including the upstream account cost.
@freezed
abstract class Sub2ApiAdminDashboardGroupStats
    with _$Sub2ApiAdminDashboardGroupStats {
  const factory Sub2ApiAdminDashboardGroupStats({
    required int groupId,
    required String groupName,
    required int requests,
    required int totalTokens,
    required Sub2ApiDecimal cost,
    required Sub2ApiDecimal actualCost,
    required Sub2ApiDecimal accountCost,
  }) = _Sub2ApiAdminDashboardGroupStats;
}

/// Group aggregates plus the effective server-selected range.
@freezed
abstract class Sub2ApiAdminDashboardGroups with _$Sub2ApiAdminDashboardGroups {
  const factory Sub2ApiAdminDashboardGroups({
    required List<Sub2ApiAdminDashboardGroupStats> groups,
    required DateTime startDate,
    required DateTime endDate,
  }) = _Sub2ApiAdminDashboardGroups;
}

/// One selected API key's usage in a calendar bucket.
@freezed
abstract class Sub2ApiAdminApiKeyUsageTrendPoint
    with _$Sub2ApiAdminApiKeyUsageTrendPoint {
  const factory Sub2ApiAdminApiKeyUsageTrendPoint({
    required String date,
    required int apiKeyId,
    required String keyName,
    required int requests,
    required int tokens,
  }) = _Sub2ApiAdminApiKeyUsageTrendPoint;
}

/// Top API-key trend series plus the effective server-selected range.
@freezed
abstract class Sub2ApiAdminApiKeyUsageTrend
    with _$Sub2ApiAdminApiKeyUsageTrend {
  const factory Sub2ApiAdminApiKeyUsageTrend({
    required List<Sub2ApiAdminApiKeyUsageTrendPoint> points,
    required DateTime startDate,
    required DateTime endDate,
    required Sub2ApiAdminUsageGranularity granularity,
  }) = _Sub2ApiAdminApiKeyUsageTrend;
}

/// One selected user's usage in a calendar bucket.
@freezed
abstract class Sub2ApiAdminUserUsageTrendPoint
    with _$Sub2ApiAdminUserUsageTrendPoint {
  const factory Sub2ApiAdminUserUsageTrendPoint({
    required String date,
    required int userId,
    required String email,
    required String username,
    required int requests,
    required int tokens,
    required Sub2ApiDecimal cost,
    required Sub2ApiDecimal actualCost,
  }) = _Sub2ApiAdminUserUsageTrendPoint;
}

/// Top-user trend series plus the effective server-selected range.
@freezed
abstract class Sub2ApiAdminUserUsageTrend with _$Sub2ApiAdminUserUsageTrend {
  const factory Sub2ApiAdminUserUsageTrend({
    required List<Sub2ApiAdminUserUsageTrendPoint> points,
    required DateTime startDate,
    required DateTime endDate,
    required Sub2ApiAdminUsageGranularity granularity,
  }) = _Sub2ApiAdminUserUsageTrend;
}

/// One row in the user spending leaderboard.
@freezed
abstract class Sub2ApiAdminUserSpendingRankingItem
    with _$Sub2ApiAdminUserSpendingRankingItem {
  const factory Sub2ApiAdminUserSpendingRankingItem({
    required int userId,
    required String email,
    required String username,
    required Sub2ApiDecimal actualCost,
    required int requests,
    required int tokens,
  }) = _Sub2ApiAdminUserSpendingRankingItem;
}

/// User spending leaderboard and range totals.
@freezed
abstract class Sub2ApiAdminUserSpendingRanking
    with _$Sub2ApiAdminUserSpendingRanking {
  const factory Sub2ApiAdminUserSpendingRanking({
    required List<Sub2ApiAdminUserSpendingRankingItem> ranking,
    required Sub2ApiDecimal totalActualCost,
    required int totalRequests,
    required int totalTokens,
    required DateTime startDate,
    required DateTime endDate,
  }) = _Sub2ApiAdminUserSpendingRanking;
}

/// One platform slice in a user's batch usage result.
@freezed
abstract class Sub2ApiAdminPlatformUsage with _$Sub2ApiAdminPlatformUsage {
  const factory Sub2ApiAdminPlatformUsage({
    required String platform,
    required Sub2ApiDecimal todayActualCost,
    required Sub2ApiDecimal totalActualCost,
  }) = _Sub2ApiAdminPlatformUsage;
}

/// Current-day and cumulative usage for one user.
@freezed
abstract class Sub2ApiAdminBatchUserUsageStats
    with _$Sub2ApiAdminBatchUserUsageStats {
  const factory Sub2ApiAdminBatchUserUsageStats({
    required int userId,
    required Sub2ApiDecimal todayActualCost,
    required Sub2ApiDecimal totalActualCost,
    List<Sub2ApiAdminPlatformUsage>? byPlatform,
  }) = _Sub2ApiAdminBatchUserUsageStats;
}

/// Current-day and cumulative usage for one API key.
@freezed
abstract class Sub2ApiAdminBatchApiKeyUsageStats
    with _$Sub2ApiAdminBatchApiKeyUsageStats {
  const factory Sub2ApiAdminBatchApiKeyUsageStats({
    required int apiKeyId,
    required Sub2ApiDecimal todayActualCost,
    required Sub2ApiDecimal totalActualCost,
  }) = _Sub2ApiAdminBatchApiKeyUsageStats;
}

/// One per-user row in a selected usage dimension.
@freezed
abstract class Sub2ApiAdminUserBreakdownItem
    with _$Sub2ApiAdminUserBreakdownItem {
  const factory Sub2ApiAdminUserBreakdownItem({
    required int userId,
    required String email,
    required int requests,
    required int inputTokens,
    required int outputTokens,
    required int cacheTokens,
    required int totalTokens,
    required Sub2ApiDecimal cost,
    required Sub2ApiDecimal actualCost,
    required Sub2ApiDecimal accountCost,
  }) = _Sub2ApiAdminUserBreakdownItem;
}

/// Per-user dimension rows plus the effective server-selected range.
@freezed
abstract class Sub2ApiAdminUserBreakdown with _$Sub2ApiAdminUserBreakdown {
  const factory Sub2ApiAdminUserBreakdown({
    required List<Sub2ApiAdminUserBreakdownItem> users,
    required DateTime startDate,
    required DateTime endDate,
  }) = _Sub2ApiAdminUserBreakdown;
}

/// Full dashboard statistics embedded by snapshot-v2.
@freezed
abstract class Sub2ApiAdminDashboardSnapshotStats
    with _$Sub2ApiAdminDashboardSnapshotStats {
  const factory Sub2ApiAdminDashboardSnapshotStats({
    required int totalUsers,
    required int todayNewUsers,
    required int activeUsers,
    required int hourlyActiveUsers,
    required DateTime statsUpdatedAt,
    required bool statsStale,
    required int totalApiKeys,
    required int activeApiKeys,
    required int totalAccounts,
    required int normalAccounts,
    required int errorAccounts,
    required int rateLimitAccounts,
    required int overloadAccounts,
    required int totalRequests,
    required int totalInputTokens,
    required int totalOutputTokens,
    required int totalCacheCreationTokens,
    required int totalCacheReadTokens,
    required int totalTokens,
    required Sub2ApiDecimal totalCost,
    required Sub2ApiDecimal totalActualCost,
    required Sub2ApiDecimal totalAccountCost,
    required int todayRequests,
    required int todayInputTokens,
    required int todayOutputTokens,
    required int todayCacheCreationTokens,
    required int todayCacheReadTokens,
    required int todayTokens,
    required Sub2ApiDecimal todayCost,
    required Sub2ApiDecimal todayActualCost,
    required Sub2ApiDecimal todayAccountCost,
    required Sub2ApiDecimal averageDurationMs,
    required int rpm,
    required int tpm,
    required int uptime,
  }) = _Sub2ApiAdminDashboardSnapshotStats;
}

/// One consistent system-wide dashboard snapshot.
@freezed
abstract class Sub2ApiAdminDashboardSnapshot
    with _$Sub2ApiAdminDashboardSnapshot {
  const factory Sub2ApiAdminDashboardSnapshot({
    required DateTime generatedAt,
    required DateTime startDate,
    required DateTime endDate,
    required Sub2ApiAdminUsageGranularity granularity,
    Sub2ApiAdminDashboardSnapshotStats? stats,
    List<Sub2ApiAdminDashboardTrendPoint>? trend,
    List<Sub2ApiAdminDashboardModelStats>? models,
    List<Sub2ApiAdminDashboardGroupStats>? groups,
    List<Sub2ApiAdminUserUsageTrendPoint>? usersTrend,
  }) = _Sub2ApiAdminDashboardSnapshot;
}

/// Result returned when an aggregation backfill is accepted.
@freezed
abstract class Sub2ApiAdminAggregationBackfillResult
    with _$Sub2ApiAdminAggregationBackfillResult {
  const factory Sub2ApiAdminAggregationBackfillResult({
    required String status,
  }) = _Sub2ApiAdminAggregationBackfillResult;
}
