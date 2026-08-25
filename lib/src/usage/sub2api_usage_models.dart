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
