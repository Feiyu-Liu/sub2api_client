import 'package:json_annotation/json_annotation.dart';

part 'sub2api_usage_dto.g.dart';

@JsonSerializable(createToJson: false)
final class Sub2ApiUsageRecordDto {
  const Sub2ApiUsageRecordDto({
    required this.id,
    required this.userId,
    required this.apiKeyId,
    required this.accountId,
    required this.requestId,
    required this.model,
    required this.inputTokens,
    required this.outputTokens,
    required this.cacheCreationTokens,
    required this.cacheReadTokens,
    required this.cacheCreation5mTokens,
    required this.cacheCreation1hTokens,
    required this.inputCost,
    required this.outputCost,
    required this.cacheCreationCost,
    required this.cacheReadCost,
    required this.totalCost,
    required this.actualCost,
    required this.rateMultiplier,
    required this.longContextBillingApplied,
    required this.billingType,
    required this.requestType,
    required this.stream,
    required this.openAiWsMode,
    required this.imageCount,
    required this.imageOutputTokens,
    required this.imageOutputCost,
    required this.cacheTtlOverridden,
    required this.createdAt,
    this.serviceTier,
    this.reasoningEffort,
    this.inboundEndpoint,
    this.upstreamEndpoint,
    this.groupId,
    this.subscriptionId,
    this.durationMs,
    this.firstTokenMs,
    this.imageSize,
    this.imageInputSize,
    this.imageOutputSize,
    this.imageSizeSource,
    this.imageSizeBreakdown,
    this.mediaType,
    this.userAgent,
    this.ipAddress,
    this.billingMode,
  });

  factory Sub2ApiUsageRecordDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiUsageRecordDtoFromJson(json);

  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'api_key_id')
  final int apiKeyId;
  @JsonKey(name: 'account_id')
  final int accountId;
  @JsonKey(name: 'request_id')
  final String requestId;
  final String model;
  @JsonKey(name: 'service_tier')
  final String? serviceTier;
  @JsonKey(name: 'reasoning_effort')
  final String? reasoningEffort;
  @JsonKey(name: 'inbound_endpoint')
  final String? inboundEndpoint;
  @JsonKey(name: 'upstream_endpoint')
  final String? upstreamEndpoint;
  @JsonKey(name: 'group_id')
  final int? groupId;
  @JsonKey(name: 'subscription_id')
  final int? subscriptionId;
  @JsonKey(name: 'input_tokens')
  final int inputTokens;
  @JsonKey(name: 'output_tokens')
  final int outputTokens;
  @JsonKey(name: 'cache_creation_tokens')
  final int cacheCreationTokens;
  @JsonKey(name: 'cache_read_tokens')
  final int cacheReadTokens;
  @JsonKey(name: 'cache_creation_5m_tokens')
  final int cacheCreation5mTokens;
  @JsonKey(name: 'cache_creation_1h_tokens')
  final int cacheCreation1hTokens;
  @JsonKey(name: 'input_cost')
  final num inputCost;
  @JsonKey(name: 'output_cost')
  final num outputCost;
  @JsonKey(name: 'cache_creation_cost')
  final num cacheCreationCost;
  @JsonKey(name: 'cache_read_cost')
  final num cacheReadCost;
  @JsonKey(name: 'total_cost')
  final num totalCost;
  @JsonKey(name: 'actual_cost')
  final num actualCost;
  @JsonKey(name: 'rate_multiplier')
  final num rateMultiplier;
  @JsonKey(name: 'long_context_billing_applied')
  final bool longContextBillingApplied;
  @JsonKey(name: 'billing_type')
  final int billingType;
  @JsonKey(name: 'request_type')
  final String requestType;
  final bool stream;
  @JsonKey(name: 'openai_ws_mode')
  final bool openAiWsMode;
  @JsonKey(name: 'duration_ms')
  final int? durationMs;
  @JsonKey(name: 'first_token_ms')
  final int? firstTokenMs;
  @JsonKey(name: 'image_count')
  final int imageCount;
  @JsonKey(name: 'image_size')
  final String? imageSize;
  @JsonKey(name: 'image_input_size')
  final String? imageInputSize;
  @JsonKey(name: 'image_output_size')
  final String? imageOutputSize;
  @JsonKey(name: 'image_output_tokens')
  final int imageOutputTokens;
  @JsonKey(name: 'image_output_cost')
  final num imageOutputCost;
  @JsonKey(name: 'image_size_source')
  final String? imageSizeSource;
  @JsonKey(name: 'image_size_breakdown')
  final Map<String, int>? imageSizeBreakdown;
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @JsonKey(name: 'user_agent')
  final String? userAgent;
  @JsonKey(name: 'ip_address')
  final String? ipAddress;
  @JsonKey(name: 'cache_ttl_overridden')
  final bool cacheTtlOverridden;
  @JsonKey(name: 'billing_mode')
  final String? billingMode;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
}

@JsonSerializable(createToJson: false)
final class Sub2ApiUsageStatsDto {
  const Sub2ApiUsageStatsDto({
    required this.totalRequests,
    required this.totalInputTokens,
    required this.totalOutputTokens,
    required this.totalCacheTokens,
    required this.totalCacheCreationTokens,
    required this.totalCacheReadTokens,
    required this.totalTokens,
    required this.totalCost,
    required this.totalActualCost,
    required this.averageDurationMs,
  });

  factory Sub2ApiUsageStatsDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiUsageStatsDtoFromJson(json);

  @JsonKey(name: 'total_requests')
  final int totalRequests;
  @JsonKey(name: 'total_input_tokens')
  final int totalInputTokens;
  @JsonKey(name: 'total_output_tokens')
  final int totalOutputTokens;
  @JsonKey(name: 'total_cache_tokens')
  final int totalCacheTokens;
  @JsonKey(name: 'total_cache_creation_tokens')
  final int totalCacheCreationTokens;
  @JsonKey(name: 'total_cache_read_tokens')
  final int totalCacheReadTokens;
  @JsonKey(name: 'total_tokens')
  final int totalTokens;
  @JsonKey(name: 'total_cost')
  final num totalCost;
  @JsonKey(name: 'total_actual_cost')
  final num totalActualCost;
  @JsonKey(name: 'average_duration_ms')
  final num averageDurationMs;
}
