// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub2api_usage_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sub2ApiUsageRecordDto _$Sub2ApiUsageRecordDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiUsageRecordDto(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  apiKeyId: (json['api_key_id'] as num).toInt(),
  accountId: (json['account_id'] as num).toInt(),
  requestId: json['request_id'] as String,
  model: json['model'] as String,
  inputTokens: (json['input_tokens'] as num).toInt(),
  outputTokens: (json['output_tokens'] as num).toInt(),
  cacheCreationTokens: (json['cache_creation_tokens'] as num).toInt(),
  cacheReadTokens: (json['cache_read_tokens'] as num).toInt(),
  cacheCreation5mTokens: (json['cache_creation_5m_tokens'] as num).toInt(),
  cacheCreation1hTokens: (json['cache_creation_1h_tokens'] as num).toInt(),
  inputCost: json['input_cost'] as num,
  outputCost: json['output_cost'] as num,
  cacheCreationCost: json['cache_creation_cost'] as num,
  cacheReadCost: json['cache_read_cost'] as num,
  totalCost: json['total_cost'] as num,
  actualCost: json['actual_cost'] as num,
  rateMultiplier: json['rate_multiplier'] as num,
  longContextBillingApplied: json['long_context_billing_applied'] as bool,
  billingType: (json['billing_type'] as num).toInt(),
  requestType: json['request_type'] as String,
  stream: json['stream'] as bool,
  openAiWsMode: json['openai_ws_mode'] as bool,
  imageCount: (json['image_count'] as num).toInt(),
  imageOutputTokens: (json['image_output_tokens'] as num).toInt(),
  imageOutputCost: json['image_output_cost'] as num,
  cacheTtlOverridden: json['cache_ttl_overridden'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  serviceTier: json['service_tier'] as String?,
  reasoningEffort: json['reasoning_effort'] as String?,
  inboundEndpoint: json['inbound_endpoint'] as String?,
  upstreamEndpoint: json['upstream_endpoint'] as String?,
  groupId: (json['group_id'] as num?)?.toInt(),
  subscriptionId: (json['subscription_id'] as num?)?.toInt(),
  durationMs: (json['duration_ms'] as num?)?.toInt(),
  firstTokenMs: (json['first_token_ms'] as num?)?.toInt(),
  imageSize: json['image_size'] as String?,
  imageInputSize: json['image_input_size'] as String?,
  imageOutputSize: json['image_output_size'] as String?,
  imageSizeSource: json['image_size_source'] as String?,
  imageSizeBreakdown: (json['image_size_breakdown'] as Map<String, dynamic>?)
      ?.map((k, e) => MapEntry(k, (e as num).toInt())),
  mediaType: json['media_type'] as String?,
  userAgent: json['user_agent'] as String?,
  ipAddress: json['ip_address'] as String?,
  billingMode: json['billing_mode'] as String?,
);

Sub2ApiUsageStatsDto _$Sub2ApiUsageStatsDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiUsageStatsDto(
  totalRequests: (json['total_requests'] as num).toInt(),
  totalInputTokens: (json['total_input_tokens'] as num).toInt(),
  totalOutputTokens: (json['total_output_tokens'] as num).toInt(),
  totalCacheTokens: (json['total_cache_tokens'] as num).toInt(),
  totalCacheCreationTokens: (json['total_cache_creation_tokens'] as num)
      .toInt(),
  totalCacheReadTokens: (json['total_cache_read_tokens'] as num).toInt(),
  totalTokens: (json['total_tokens'] as num).toInt(),
  totalCost: json['total_cost'] as num,
  totalActualCost: json['total_actual_cost'] as num,
  averageDurationMs: json['average_duration_ms'] as num,
);
