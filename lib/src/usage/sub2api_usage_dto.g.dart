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

Sub2ApiUsageErrorDto _$Sub2ApiUsageErrorDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiUsageErrorDto(
  id: (json['id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  model: json['model'] as String,
  inboundEndpoint: json['inbound_endpoint'] as String,
  statusCode: (json['status_code'] as num).toInt(),
  category: json['category'] as String,
  platform: json['platform'] as String,
  message: json['message'] as String,
  keyName: json['key_name'] as String,
  keyDeleted: json['key_deleted'] as bool,
  stream: json['stream'] as bool,
  clientIp: json['client_ip'] as String?,
  groupName: json['group_name'] as String?,
  requestType: (json['request_type'] as num?)?.toInt(),
  userAgent: json['user_agent'] as String?,
);

Sub2ApiUsageErrorDetailDto _$Sub2ApiUsageErrorDetailDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiUsageErrorDetailDto(
  id: (json['id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  model: json['model'] as String,
  inboundEndpoint: json['inbound_endpoint'] as String,
  statusCode: (json['status_code'] as num).toInt(),
  category: json['category'] as String,
  platform: json['platform'] as String,
  message: json['message'] as String,
  keyName: json['key_name'] as String,
  keyDeleted: json['key_deleted'] as bool,
  stream: json['stream'] as bool,
  errorBody: json['error_body'] as String,
  clientIp: json['client_ip'] as String?,
  groupName: json['group_name'] as String?,
  requestType: (json['request_type'] as num?)?.toInt(),
  userAgent: json['user_agent'] as String?,
  upstreamStatusCode: (json['upstream_status_code'] as num?)?.toInt(),
);

Sub2ApiUsagePlatformStatsDto _$Sub2ApiUsagePlatformStatsDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiUsagePlatformStatsDto(
  platform: json['platform'] as String,
  totalRequests: (json['total_requests'] as num).toInt(),
  totalTokens: (json['total_tokens'] as num).toInt(),
  totalActualCost: json['total_actual_cost'] as num,
  todayRequests: (json['today_requests'] as num).toInt(),
  todayTokens: (json['today_tokens'] as num).toInt(),
  todayActualCost: json['today_actual_cost'] as num,
);

Sub2ApiUsageDashboardStatsDto _$Sub2ApiUsageDashboardStatsDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiUsageDashboardStatsDto(
  totalApiKeys: (json['total_api_keys'] as num).toInt(),
  activeApiKeys: (json['active_api_keys'] as num).toInt(),
  totalRequests: (json['total_requests'] as num).toInt(),
  totalInputTokens: (json['total_input_tokens'] as num).toInt(),
  totalOutputTokens: (json['total_output_tokens'] as num).toInt(),
  totalCacheCreationTokens: (json['total_cache_creation_tokens'] as num)
      .toInt(),
  totalCacheReadTokens: (json['total_cache_read_tokens'] as num).toInt(),
  totalTokens: (json['total_tokens'] as num).toInt(),
  totalCost: json['total_cost'] as num,
  totalActualCost: json['total_actual_cost'] as num,
  todayRequests: (json['today_requests'] as num).toInt(),
  todayInputTokens: (json['today_input_tokens'] as num).toInt(),
  todayOutputTokens: (json['today_output_tokens'] as num).toInt(),
  todayCacheCreationTokens: (json['today_cache_creation_tokens'] as num)
      .toInt(),
  todayCacheReadTokens: (json['today_cache_read_tokens'] as num).toInt(),
  todayTokens: (json['today_tokens'] as num).toInt(),
  todayCost: json['today_cost'] as num,
  todayActualCost: json['today_actual_cost'] as num,
  averageDurationMs: json['average_duration_ms'] as num,
  rpm: (json['rpm'] as num).toInt(),
  tpm: (json['tpm'] as num).toInt(),
  byPlatform:
      (json['by_platform'] as List<dynamic>?)
          ?.map(
            (e) => Sub2ApiUsagePlatformStatsDto.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <Sub2ApiUsagePlatformStatsDto>[],
);

Sub2ApiUsageTrendPointDto _$Sub2ApiUsageTrendPointDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiUsageTrendPointDto(
  date: json['date'] as String,
  requests: (json['requests'] as num).toInt(),
  inputTokens: (json['input_tokens'] as num).toInt(),
  outputTokens: (json['output_tokens'] as num).toInt(),
  cacheCreationTokens: (json['cache_creation_tokens'] as num).toInt(),
  cacheReadTokens: (json['cache_read_tokens'] as num).toInt(),
  totalTokens: (json['total_tokens'] as num).toInt(),
  cost: json['cost'] as num,
  actualCost: json['actual_cost'] as num,
);

Sub2ApiUsageModelStatsDto _$Sub2ApiUsageModelStatsDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiUsageModelStatsDto(
  model: json['model'] as String,
  requests: (json['requests'] as num).toInt(),
  inputTokens: (json['input_tokens'] as num).toInt(),
  outputTokens: (json['output_tokens'] as num).toInt(),
  cacheCreationTokens: (json['cache_creation_tokens'] as num).toInt(),
  cacheReadTokens: (json['cache_read_tokens'] as num).toInt(),
  totalTokens: (json['total_tokens'] as num).toInt(),
  cost: json['cost'] as num,
  actualCost: json['actual_cost'] as num,
);

Sub2ApiUsageGroupStatsDto _$Sub2ApiUsageGroupStatsDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiUsageGroupStatsDto(
  groupId: (json['group_id'] as num).toInt(),
  groupName: json['group_name'] as String,
  requests: (json['requests'] as num).toInt(),
  totalTokens: (json['total_tokens'] as num).toInt(),
  cost: json['cost'] as num,
  actualCost: json['actual_cost'] as num,
);

Sub2ApiUsageTrendDto _$Sub2ApiUsageTrendDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiUsageTrendDto(
  trend: (json['trend'] as List<dynamic>)
      .map((e) => Sub2ApiUsageTrendPointDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
  granularity: json['granularity'] as String,
);

Sub2ApiUsageModelsDto _$Sub2ApiUsageModelsDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiUsageModelsDto(
  models: (json['models'] as List<dynamic>)
      .map((e) => Sub2ApiUsageModelStatsDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
);

Sub2ApiUsageDashboardSnapshotDto _$Sub2ApiUsageDashboardSnapshotDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiUsageDashboardSnapshotDto(
  generatedAt: DateTime.parse(json['generated_at'] as String),
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
  granularity: json['granularity'] as String,
  trend: (json['trend'] as List<dynamic>?)
      ?.map(
        (e) => Sub2ApiUsageTrendPointDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  models: (json['models'] as List<dynamic>?)
      ?.map(
        (e) => Sub2ApiUsageModelStatsDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  groups: (json['groups'] as List<dynamic>?)
      ?.map(
        (e) => Sub2ApiUsageGroupStatsDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Sub2ApiUsageApiKeyStatsDto _$Sub2ApiUsageApiKeyStatsDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiUsageApiKeyStatsDto(
  apiKeyId: (json['api_key_id'] as num).toInt(),
  todayActualCost: json['today_actual_cost'] as num,
  totalActualCost: json['total_actual_cost'] as num,
);

Map<String, dynamic> _$Sub2ApiUsageApiKeysRequestDtoToJson(
  Sub2ApiUsageApiKeysRequestDto instance,
) => <String, dynamic>{'api_key_ids': instance.apiKeyIds};
