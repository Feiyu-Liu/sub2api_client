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

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class Sub2ApiUsageErrorDto {
  const Sub2ApiUsageErrorDto({
    required this.id,
    required this.createdAt,
    required this.model,
    required this.inboundEndpoint,
    required this.statusCode,
    required this.category,
    required this.platform,
    required this.message,
    required this.keyName,
    required this.keyDeleted,
    required this.stream,
    this.clientIp,
    this.groupName,
    this.requestType,
    this.userAgent,
  });

  factory Sub2ApiUsageErrorDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiUsageErrorDtoFromJson(json);

  final int id;
  final DateTime createdAt;
  final String model;
  final String inboundEndpoint;
  final int statusCode;
  final String category;
  final String platform;
  final String message;
  final String keyName;
  final bool keyDeleted;
  final String? clientIp;
  final String? groupName;
  final int? requestType;
  final bool stream;
  final String? userAgent;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class Sub2ApiUsageErrorDetailDto {
  const Sub2ApiUsageErrorDetailDto({
    required this.id,
    required this.createdAt,
    required this.model,
    required this.inboundEndpoint,
    required this.statusCode,
    required this.category,
    required this.platform,
    required this.message,
    required this.keyName,
    required this.keyDeleted,
    required this.stream,
    required this.errorBody,
    this.clientIp,
    this.groupName,
    this.requestType,
    this.userAgent,
    this.upstreamStatusCode,
  });

  factory Sub2ApiUsageErrorDetailDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiUsageErrorDetailDtoFromJson(json);

  final int id;
  final DateTime createdAt;
  final String model;
  final String inboundEndpoint;
  final int statusCode;
  final String category;
  final String platform;
  final String message;
  final String keyName;
  final bool keyDeleted;
  final String? clientIp;
  final String? groupName;
  final int? requestType;
  final bool stream;
  final String? userAgent;
  final String errorBody;
  final int? upstreamStatusCode;

  Sub2ApiUsageErrorDto toSummary() => Sub2ApiUsageErrorDto(
    id: id,
    createdAt: createdAt,
    model: model,
    inboundEndpoint: inboundEndpoint,
    statusCode: statusCode,
    category: category,
    platform: platform,
    message: message,
    keyName: keyName,
    keyDeleted: keyDeleted,
    clientIp: clientIp,
    groupName: groupName,
    requestType: requestType,
    stream: stream,
    userAgent: userAgent,
  );
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class Sub2ApiUsagePlatformStatsDto {
  const Sub2ApiUsagePlatformStatsDto({
    required this.platform,
    required this.totalRequests,
    required this.totalTokens,
    required this.totalActualCost,
    required this.todayRequests,
    required this.todayTokens,
    required this.todayActualCost,
  });

  factory Sub2ApiUsagePlatformStatsDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiUsagePlatformStatsDtoFromJson(json);

  final String platform;
  final int totalRequests;
  final int totalTokens;
  final num totalActualCost;
  final int todayRequests;
  final int todayTokens;
  final num todayActualCost;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class Sub2ApiUsageDashboardStatsDto {
  const Sub2ApiUsageDashboardStatsDto({
    required this.totalApiKeys,
    required this.activeApiKeys,
    required this.totalRequests,
    required this.totalInputTokens,
    required this.totalOutputTokens,
    required this.totalCacheCreationTokens,
    required this.totalCacheReadTokens,
    required this.totalTokens,
    required this.totalCost,
    required this.totalActualCost,
    required this.todayRequests,
    required this.todayInputTokens,
    required this.todayOutputTokens,
    required this.todayCacheCreationTokens,
    required this.todayCacheReadTokens,
    required this.todayTokens,
    required this.todayCost,
    required this.todayActualCost,
    required this.averageDurationMs,
    required this.rpm,
    required this.tpm,
    this.byPlatform = const <Sub2ApiUsagePlatformStatsDto>[],
  });

  factory Sub2ApiUsageDashboardStatsDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiUsageDashboardStatsDtoFromJson(json);

  final int totalApiKeys;
  final int activeApiKeys;
  final int totalRequests;
  final int totalInputTokens;
  final int totalOutputTokens;
  final int totalCacheCreationTokens;
  final int totalCacheReadTokens;
  final int totalTokens;
  final num totalCost;
  final num totalActualCost;
  final int todayRequests;
  final int todayInputTokens;
  final int todayOutputTokens;
  final int todayCacheCreationTokens;
  final int todayCacheReadTokens;
  final int todayTokens;
  final num todayCost;
  final num todayActualCost;
  final num averageDurationMs;
  final int rpm;
  final int tpm;
  final List<Sub2ApiUsagePlatformStatsDto> byPlatform;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class Sub2ApiUsageTrendPointDto {
  const Sub2ApiUsageTrendPointDto({
    required this.date,
    required this.requests,
    required this.inputTokens,
    required this.outputTokens,
    required this.cacheCreationTokens,
    required this.cacheReadTokens,
    required this.totalTokens,
    required this.cost,
    required this.actualCost,
  });

  factory Sub2ApiUsageTrendPointDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiUsageTrendPointDtoFromJson(json);

  final String date;
  final int requests;
  final int inputTokens;
  final int outputTokens;
  final int cacheCreationTokens;
  final int cacheReadTokens;
  final int totalTokens;
  final num cost;
  final num actualCost;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class Sub2ApiUsageModelStatsDto {
  const Sub2ApiUsageModelStatsDto({
    required this.model,
    required this.requests,
    required this.inputTokens,
    required this.outputTokens,
    required this.cacheCreationTokens,
    required this.cacheReadTokens,
    required this.totalTokens,
    required this.cost,
    required this.actualCost,
  });

  factory Sub2ApiUsageModelStatsDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiUsageModelStatsDtoFromJson(json);

  final String model;
  final int requests;
  final int inputTokens;
  final int outputTokens;
  final int cacheCreationTokens;
  final int cacheReadTokens;
  final int totalTokens;
  final num cost;
  final num actualCost;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class Sub2ApiUsageGroupStatsDto {
  const Sub2ApiUsageGroupStatsDto({
    required this.groupId,
    required this.groupName,
    required this.requests,
    required this.totalTokens,
    required this.cost,
    required this.actualCost,
  });

  factory Sub2ApiUsageGroupStatsDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiUsageGroupStatsDtoFromJson(json);

  final int groupId;
  final String groupName;
  final int requests;
  final int totalTokens;
  final num cost;
  final num actualCost;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class Sub2ApiUsageTrendDto {
  const Sub2ApiUsageTrendDto({
    required this.trend,
    required this.startDate,
    required this.endDate,
    required this.granularity,
  });

  factory Sub2ApiUsageTrendDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiUsageTrendDtoFromJson(json);

  final List<Sub2ApiUsageTrendPointDto> trend;
  final String startDate;
  final String endDate;
  final String granularity;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class Sub2ApiUsageModelsDto {
  const Sub2ApiUsageModelsDto({
    required this.models,
    required this.startDate,
    required this.endDate,
  });

  factory Sub2ApiUsageModelsDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiUsageModelsDtoFromJson(json);

  final List<Sub2ApiUsageModelStatsDto> models;
  final String startDate;
  final String endDate;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class Sub2ApiUsageDashboardSnapshotDto {
  const Sub2ApiUsageDashboardSnapshotDto({
    required this.generatedAt,
    required this.startDate,
    required this.endDate,
    required this.granularity,
    this.trend,
    this.models,
    this.groups,
  });

  factory Sub2ApiUsageDashboardSnapshotDto.fromJson(
    Map<String, Object?> json,
  ) => _$Sub2ApiUsageDashboardSnapshotDtoFromJson(json);

  final DateTime generatedAt;
  final String startDate;
  final String endDate;
  final String granularity;
  final List<Sub2ApiUsageTrendPointDto>? trend;
  final List<Sub2ApiUsageModelStatsDto>? models;
  final List<Sub2ApiUsageGroupStatsDto>? groups;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
final class Sub2ApiUsageApiKeyStatsDto {
  const Sub2ApiUsageApiKeyStatsDto({
    required this.apiKeyId,
    required this.todayActualCost,
    required this.totalActualCost,
  });

  factory Sub2ApiUsageApiKeyStatsDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiUsageApiKeyStatsDtoFromJson(json);

  final int apiKeyId;
  final num todayActualCost;
  final num totalActualCost;
}

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake)
final class Sub2ApiUsageApiKeysRequestDto {
  const Sub2ApiUsageApiKeysRequestDto(this.apiKeyIds);

  final List<int> apiKeyIds;

  Map<String, Object?> toJson() => _$Sub2ApiUsageApiKeysRequestDtoToJson(this);
}
