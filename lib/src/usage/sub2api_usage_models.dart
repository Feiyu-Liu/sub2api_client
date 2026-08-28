import 'package:freezed_annotation/freezed_annotation.dart';

import '../shared/models/sub2api_decimal.dart';

part 'sub2api_usage_models.freezed.dart';

/// Filters accepted by the authenticated usage-list and statistics endpoints.
@freezed
abstract class Sub2ApiUsageQuery with _$Sub2ApiUsageQuery {
  const factory Sub2ApiUsageQuery({
    @Default(1) int page,
    @Default(20) int pageSize,
    int? apiKeyId,
    int? groupId,
    String? model,
    String? requestType,
    bool? stream,
    int? billingType,
    String? billingMode,
    DateTime? startDate,
    DateTime? endDate,
    String? timezone,
    @Default('created_at') String sortBy,
    @Default('desc') String sortOrder,
  }) = _Sub2ApiUsageQuery;
}

/// A single user-visible usage record returned by Sub2API.
@freezed
abstract class Sub2ApiUsageRecord with _$Sub2ApiUsageRecord {
  const factory Sub2ApiUsageRecord({
    required int id,
    required int userId,
    required int apiKeyId,
    required int accountId,
    required String requestId,
    required String model,
    String? serviceTier,
    String? reasoningEffort,
    String? inboundEndpoint,
    String? upstreamEndpoint,
    int? groupId,
    int? subscriptionId,
    required int inputTokens,
    required int outputTokens,
    required int cacheCreationTokens,
    required int cacheReadTokens,
    required int cacheCreation5mTokens,
    required int cacheCreation1hTokens,
    required Sub2ApiDecimal inputCost,
    required Sub2ApiDecimal outputCost,
    required Sub2ApiDecimal cacheCreationCost,
    required Sub2ApiDecimal cacheReadCost,
    required Sub2ApiDecimal totalCost,
    required Sub2ApiDecimal actualCost,
    required Sub2ApiDecimal rateMultiplier,
    required bool longContextBillingApplied,
    required int billingType,
    required String requestType,
    required bool stream,
    required bool openAiWsMode,
    int? durationMs,
    int? firstTokenMs,
    required int imageCount,
    String? imageSize,
    String? imageInputSize,
    String? imageOutputSize,
    required int imageOutputTokens,
    required Sub2ApiDecimal imageOutputCost,
    String? imageSizeSource,
    Map<String, int>? imageSizeBreakdown,
    String? mediaType,
    String? userAgent,
    String? ipAddress,
    required bool cacheTtlOverridden,
    String? billingMode,
    required DateTime createdAt,
  }) = _Sub2ApiUsageRecord;
}

/// Aggregate usage values for a user-selected time range.
@freezed
abstract class Sub2ApiUsageStats with _$Sub2ApiUsageStats {
  const factory Sub2ApiUsageStats({
    required int totalRequests,
    required int totalInputTokens,
    required int totalOutputTokens,
    required int totalCacheTokens,
    required int totalCacheCreationTokens,
    required int totalCacheReadTokens,
    required int totalTokens,
    required Sub2ApiDecimal totalCost,
    required Sub2ApiDecimal totalActualCost,
    required Sub2ApiDecimal averageDurationMs,
  }) = _Sub2ApiUsageStats;
}

/// Filters accepted by the current-user failed-request list.
@freezed
abstract class Sub2ApiUsageErrorQuery with _$Sub2ApiUsageErrorQuery {
  const factory Sub2ApiUsageErrorQuery({
    @Default(1) int page,
    @Default(20) int pageSize,
    DateTime? startDate,
    DateTime? endDate,
    String? timezone,
    String? model,
    int? statusCode,
    String? category,
    int? apiKeyId,
    @Default('created_at') String sortBy,
    @Default('desc') String sortOrder,
  }) = _Sub2ApiUsageErrorQuery;
}

/// A redacted failed request owned by the current user.
@freezed
abstract class Sub2ApiUsageError with _$Sub2ApiUsageError {
  const factory Sub2ApiUsageError({
    required int id,
    required DateTime createdAt,
    required String model,
    required String inboundEndpoint,
    required int statusCode,
    required String category,
    required String platform,
    required String message,
    required String keyName,
    required bool keyDeleted,
    String? clientIp,
    String? groupName,
    int? requestType,
    required bool stream,
    String? userAgent,
  }) = _Sub2ApiUsageError;
}

/// Redacted failed-request detail after server-side ownership validation.
@freezed
abstract class Sub2ApiUsageErrorDetail with _$Sub2ApiUsageErrorDetail {
  const factory Sub2ApiUsageErrorDetail({
    required Sub2ApiUsageError summary,
    required String errorBody,
    int? upstreamStatusCode,
  }) = _Sub2ApiUsageErrorDetail;
}

/// One platform row in the current-user dashboard summary.
@freezed
abstract class Sub2ApiUsagePlatformStats with _$Sub2ApiUsagePlatformStats {
  const factory Sub2ApiUsagePlatformStats({
    required String platform,
    required int totalRequests,
    required int totalTokens,
    required Sub2ApiDecimal totalActualCost,
    required int todayRequests,
    required int todayTokens,
    required Sub2ApiDecimal todayActualCost,
  }) = _Sub2ApiUsagePlatformStats;
}

/// Current-user cumulative, daily, and short-window dashboard statistics.
@freezed
abstract class Sub2ApiUsageDashboardStats with _$Sub2ApiUsageDashboardStats {
  const factory Sub2ApiUsageDashboardStats({
    required int totalApiKeys,
    required int activeApiKeys,
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
    required int rpm,
    required int tpm,
    required List<Sub2ApiUsagePlatformStats> byPlatform,
  }) = _Sub2ApiUsageDashboardStats;
}

/// Calendar bucket granularity accepted by user dashboard endpoints.
enum Sub2ApiUsageGranularity { day, hour }

/// Shared filters for user dashboard trend, model, and snapshot endpoints.
@freezed
abstract class Sub2ApiUsageDashboardQuery with _$Sub2ApiUsageDashboardQuery {
  const factory Sub2ApiUsageDashboardQuery({
    DateTime? startDate,
    DateTime? endDate,
    String? period,
    @Default(Sub2ApiUsageGranularity.day) Sub2ApiUsageGranularity granularity,
    int? apiKeyId,
    int? groupId,
    String? model,
    String? requestType,
    bool? stream,
    int? billingType,
    String? billingMode,
    String? timezone,
  }) = _Sub2ApiUsageDashboardQuery;
}

/// One dashboard trend bucket.
@freezed
abstract class Sub2ApiUsageTrendPoint with _$Sub2ApiUsageTrendPoint {
  const factory Sub2ApiUsageTrendPoint({
    required String date,
    required int requests,
    required int inputTokens,
    required int outputTokens,
    required int cacheCreationTokens,
    required int cacheReadTokens,
    required int totalTokens,
    required Sub2ApiDecimal cost,
    required Sub2ApiDecimal actualCost,
  }) = _Sub2ApiUsageTrendPoint;
}

/// User dashboard trend plus the effective server-selected date range.
@freezed
abstract class Sub2ApiUsageTrend with _$Sub2ApiUsageTrend {
  const factory Sub2ApiUsageTrend({
    required List<Sub2ApiUsageTrendPoint> points,
    required DateTime startDate,
    required DateTime endDate,
    required Sub2ApiUsageGranularity granularity,
  }) = _Sub2ApiUsageTrend;
}

/// One requested-model aggregate in the current-user dashboard.
@freezed
abstract class Sub2ApiUsageModelStats with _$Sub2ApiUsageModelStats {
  const factory Sub2ApiUsageModelStats({
    required String model,
    required int requests,
    required int inputTokens,
    required int outputTokens,
    required int cacheCreationTokens,
    required int cacheReadTokens,
    required int totalTokens,
    required Sub2ApiDecimal cost,
    required Sub2ApiDecimal actualCost,
  }) = _Sub2ApiUsageModelStats;
}

/// Requested-model aggregates plus the effective server-selected date range.
@freezed
abstract class Sub2ApiUsageModels with _$Sub2ApiUsageModels {
  const factory Sub2ApiUsageModels({
    required List<Sub2ApiUsageModelStats> models,
    required DateTime startDate,
    required DateTime endDate,
  }) = _Sub2ApiUsageModels;
}

/// One group aggregate optionally included in dashboard snapshot-v2.
@freezed
abstract class Sub2ApiUsageGroupStats with _$Sub2ApiUsageGroupStats {
  const factory Sub2ApiUsageGroupStats({
    required int groupId,
    required String groupName,
    required int requests,
    required int totalTokens,
    required Sub2ApiDecimal cost,
    required Sub2ApiDecimal actualCost,
  }) = _Sub2ApiUsageGroupStats;
}

/// Inclusion flags and filters for dashboard snapshot-v2.
@freezed
abstract class Sub2ApiUsageDashboardSnapshotRequest
    with _$Sub2ApiUsageDashboardSnapshotRequest {
  const factory Sub2ApiUsageDashboardSnapshotRequest({
    @Default(Sub2ApiUsageDashboardQuery()) Sub2ApiUsageDashboardQuery query,
    @Default(true) bool includeTrend,
    @Default(true) bool includeModelStats,
    @Default(false) bool includeGroupStats,
  }) = _Sub2ApiUsageDashboardSnapshotRequest;
}

/// One consistent user-dashboard snapshot produced by the server.
@freezed
abstract class Sub2ApiUsageDashboardSnapshot
    with _$Sub2ApiUsageDashboardSnapshot {
  const factory Sub2ApiUsageDashboardSnapshot({
    required DateTime generatedAt,
    required DateTime startDate,
    required DateTime endDate,
    required Sub2ApiUsageGranularity granularity,
    List<Sub2ApiUsageTrendPoint>? trend,
    List<Sub2ApiUsageModelStats>? models,
    List<Sub2ApiUsageGroupStats>? groups,
  }) = _Sub2ApiUsageDashboardSnapshot;
}

/// Current-day and cumulative usage for one API key.
@freezed
abstract class Sub2ApiUsageApiKeyStats with _$Sub2ApiUsageApiKeyStats {
  const factory Sub2ApiUsageApiKeyStats({
    required int apiKeyId,
    required Sub2ApiDecimal todayActualCost,
    required Sub2ApiDecimal totalActualCost,
  }) = _Sub2ApiUsageApiKeyStats;
}
