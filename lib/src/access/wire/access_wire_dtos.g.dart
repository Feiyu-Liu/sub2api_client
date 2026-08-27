// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_wire_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReasoningEffortMappingWireDto _$ReasoningEffortMappingWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReasoningEffortMappingWireDto', json, ($checkedConvert) {
  final val = ReasoningEffortMappingWireDto(
    from: $checkedConvert('from', (v) => v as String),
    to: $checkedConvert('to', (v) => v as String),
  );
  return val;
});

AvailableGroupWireDto _$AvailableGroupWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AvailableGroupWireDto',
  json,
  ($checkedConvert) {
    final val = AvailableGroupWireDto(
      allowBatchImageGeneration: $checkedConvert(
        'allow_batch_image_generation',
        (v) => v as bool,
      ),
      allowImageGeneration: $checkedConvert(
        'allow_image_generation',
        (v) => v as bool,
      ),
      allowLive: $checkedConvert('allow_live', (v) => v as bool),
      allowMessagesDispatch: $checkedConvert(
        'allow_messages_dispatch',
        (v) => v as bool,
      ),
      audioRealtimePricePerMin: $checkedConvert(
        'audio_realtime_price_per_min',
        (v) => v as num?,
      ),
      audioSttPricePerHour: $checkedConvert(
        'audio_stt_price_per_hour',
        (v) => v as num?,
      ),
      audioTtsPricePerMillionChars: $checkedConvert(
        'audio_tts_price_per_million_chars',
        (v) => v as num?,
      ),
      batchImageDiscountMultiplier: $checkedConvert(
        'batch_image_discount_multiplier',
        (v) => v as num,
      ),
      batchImageHoldMultiplier: $checkedConvert(
        'batch_image_hold_multiplier',
        (v) => v as num,
      ),
      claudeCodeOnly: $checkedConvert('claude_code_only', (v) => v as bool),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      dailyLimitUsd: $checkedConvert('daily_limit_usd', (v) => v as num?),
      description: $checkedConvert('description', (v) => v as String),
      fallbackGroupId: $checkedConvert(
        'fallback_group_id',
        (v) => (v as num?)?.toInt(),
      ),
      fallbackGroupIdOnInvalidRequest: $checkedConvert(
        'fallback_group_id_on_invalid_request',
        (v) => (v as num?)?.toInt(),
      ),
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      imagePrice1k: $checkedConvert('image_price_1k', (v) => v as num?),
      imagePrice2k: $checkedConvert('image_price_2k', (v) => v as num?),
      imagePrice4k: $checkedConvert('image_price_4k', (v) => v as num?),
      imageRateIndependent: $checkedConvert(
        'image_rate_independent',
        (v) => v as bool,
      ),
      imageRateMultiplier: $checkedConvert(
        'image_rate_multiplier',
        (v) => v as num,
      ),
      isExclusive: $checkedConvert('is_exclusive', (v) => v as bool),
      longContextPricingEnabled: $checkedConvert(
        'long_context_pricing_enabled',
        (v) => v as bool,
      ),
      maxReasoningEffort: $checkedConvert(
        'max_reasoning_effort',
        (v) => v as String,
      ),
      monthlyLimitUsd: $checkedConvert('monthly_limit_usd', (v) => v as num?),
      name: $checkedConvert('name', (v) => v as String),
      peakEnd: $checkedConvert('peak_end', (v) => v as String),
      peakRateEnabled: $checkedConvert('peak_rate_enabled', (v) => v as bool),
      peakRateMultiplier: $checkedConvert(
        'peak_rate_multiplier',
        (v) => v as num,
      ),
      peakStart: $checkedConvert('peak_start', (v) => v as String),
      platform: $checkedConvert('platform', (v) => v as String),
      rateMultiplier: $checkedConvert('rate_multiplier', (v) => v as num),
      reasoningEffortMappings: $checkedConvert(
        'reasoning_effort_mappings',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => ReasoningEffortMappingWireDto.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      requireOAuthOnly: $checkedConvert('require_oauth_only', (v) => v as bool),
      requirePrivacySet: $checkedConvert(
        'require_privacy_set',
        (v) => v as bool,
      ),
      rpmLimit: $checkedConvert('rpm_limit', (v) => (v as num).toInt()),
      searchPricePer1k: $checkedConvert(
        'search_price_per_1k',
        (v) => v as num?,
      ),
      status: $checkedConvert('status', (v) => v as String),
      subscriptionType: $checkedConvert(
        'subscription_type',
        (v) => v as String,
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      videoModelPrices: $checkedConvert(
        'video_model_prices',
        (v) =>
            (v as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(k, Map<String, num>.from(e as Map)),
            ) ??
            {},
      ),
      videoPrice1080p: $checkedConvert('video_price_1080p', (v) => v as num?),
      videoPrice480p: $checkedConvert('video_price_480p', (v) => v as num?),
      videoPrice720p: $checkedConvert('video_price_720p', (v) => v as num?),
      videoRateIndependent: $checkedConvert(
        'video_rate_independent',
        (v) => v as bool,
      ),
      videoRateMultiplier: $checkedConvert(
        'video_rate_multiplier',
        (v) => v as num,
      ),
      webSearchPricePerCall: $checkedConvert(
        'web_search_price_per_call',
        (v) => v as num?,
      ),
      weeklyLimitUsd: $checkedConvert('weekly_limit_usd', (v) => v as num?),
    );
    return val;
  },
  fieldKeyMap: const {
    'allowBatchImageGeneration': 'allow_batch_image_generation',
    'allowImageGeneration': 'allow_image_generation',
    'allowLive': 'allow_live',
    'allowMessagesDispatch': 'allow_messages_dispatch',
    'audioRealtimePricePerMin': 'audio_realtime_price_per_min',
    'audioSttPricePerHour': 'audio_stt_price_per_hour',
    'audioTtsPricePerMillionChars': 'audio_tts_price_per_million_chars',
    'batchImageDiscountMultiplier': 'batch_image_discount_multiplier',
    'batchImageHoldMultiplier': 'batch_image_hold_multiplier',
    'claudeCodeOnly': 'claude_code_only',
    'createdAt': 'created_at',
    'dailyLimitUsd': 'daily_limit_usd',
    'fallbackGroupId': 'fallback_group_id',
    'fallbackGroupIdOnInvalidRequest': 'fallback_group_id_on_invalid_request',
    'imagePrice1k': 'image_price_1k',
    'imagePrice2k': 'image_price_2k',
    'imagePrice4k': 'image_price_4k',
    'imageRateIndependent': 'image_rate_independent',
    'imageRateMultiplier': 'image_rate_multiplier',
    'isExclusive': 'is_exclusive',
    'longContextPricingEnabled': 'long_context_pricing_enabled',
    'maxReasoningEffort': 'max_reasoning_effort',
    'monthlyLimitUsd': 'monthly_limit_usd',
    'peakEnd': 'peak_end',
    'peakRateEnabled': 'peak_rate_enabled',
    'peakRateMultiplier': 'peak_rate_multiplier',
    'peakStart': 'peak_start',
    'rateMultiplier': 'rate_multiplier',
    'reasoningEffortMappings': 'reasoning_effort_mappings',
    'requireOAuthOnly': 'require_oauth_only',
    'requirePrivacySet': 'require_privacy_set',
    'rpmLimit': 'rpm_limit',
    'searchPricePer1k': 'search_price_per_1k',
    'subscriptionType': 'subscription_type',
    'updatedAt': 'updated_at',
    'videoModelPrices': 'video_model_prices',
    'videoPrice1080p': 'video_price_1080p',
    'videoPrice480p': 'video_price_480p',
    'videoPrice720p': 'video_price_720p',
    'videoRateIndependent': 'video_rate_independent',
    'videoRateMultiplier': 'video_rate_multiplier',
    'webSearchPricePerCall': 'web_search_price_per_call',
    'weeklyLimitUsd': 'weekly_limit_usd',
  },
);

PlatformQuotaWireDto _$PlatformQuotaWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PlatformQuotaWireDto',
  json,
  ($checkedConvert) {
    final val = PlatformQuotaWireDto(
      dailyLimitUsd: $checkedConvert('daily_limit_usd', (v) => v as num?),
      dailyUsageUsd: $checkedConvert('daily_usage_usd', (v) => v as num),
      monthlyLimitUsd: $checkedConvert('monthly_limit_usd', (v) => v as num?),
      monthlyUsageUsd: $checkedConvert('monthly_usage_usd', (v) => v as num),
      platform: $checkedConvert('platform', (v) => v as String),
      weeklyLimitUsd: $checkedConvert('weekly_limit_usd', (v) => v as num?),
      weeklyUsageUsd: $checkedConvert('weekly_usage_usd', (v) => v as num),
      dailyWindowResetsAt: $checkedConvert(
        'daily_window_resets_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      monthlyWindowResetsAt: $checkedConvert(
        'monthly_window_resets_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      weeklyWindowResetsAt: $checkedConvert(
        'weekly_window_resets_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'dailyLimitUsd': 'daily_limit_usd',
    'dailyUsageUsd': 'daily_usage_usd',
    'monthlyLimitUsd': 'monthly_limit_usd',
    'monthlyUsageUsd': 'monthly_usage_usd',
    'weeklyLimitUsd': 'weekly_limit_usd',
    'weeklyUsageUsd': 'weekly_usage_usd',
    'dailyWindowResetsAt': 'daily_window_resets_at',
    'monthlyWindowResetsAt': 'monthly_window_resets_at',
    'weeklyWindowResetsAt': 'weekly_window_resets_at',
  },
);

PlatformQuotasWireDto _$PlatformQuotasWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PlatformQuotasWireDto',
  json,
  ($checkedConvert) {
    final val = PlatformQuotasWireDto(
      platformQuotas: $checkedConvert(
        'platform_quotas',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) =>
                      PlatformQuotaWireDto.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
      ),
    );
    return val;
  },
  fieldKeyMap: const {'platformQuotas': 'platform_quotas'},
);

ChannelGroupWireDto _$ChannelGroupWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ChannelGroupWireDto',
      json,
      ($checkedConvert) {
        final val = ChannelGroupWireDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          isExclusive: $checkedConvert('is_exclusive', (v) => v as bool),
          name: $checkedConvert('name', (v) => v as String),
          peakEnd: $checkedConvert('peak_end', (v) => v as String),
          peakRateEnabled: $checkedConvert(
            'peak_rate_enabled',
            (v) => v as bool,
          ),
          peakRateMultiplier: $checkedConvert(
            'peak_rate_multiplier',
            (v) => v as num,
          ),
          peakStart: $checkedConvert('peak_start', (v) => v as String),
          platform: $checkedConvert('platform', (v) => v as String),
          rateMultiplier: $checkedConvert('rate_multiplier', (v) => v as num),
          subscriptionType: $checkedConvert(
            'subscription_type',
            (v) => v as String,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'isExclusive': 'is_exclusive',
        'peakEnd': 'peak_end',
        'peakRateEnabled': 'peak_rate_enabled',
        'peakRateMultiplier': 'peak_rate_multiplier',
        'peakStart': 'peak_start',
        'rateMultiplier': 'rate_multiplier',
        'subscriptionType': 'subscription_type',
      },
    );

PricingIntervalWireDto _$PricingIntervalWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PricingIntervalWireDto',
  json,
  ($checkedConvert) {
    final val = PricingIntervalWireDto(
      cacheReadPrice: $checkedConvert('cache_read_price', (v) => v as num?),
      cacheWritePrice: $checkedConvert('cache_write_price', (v) => v as num?),
      inputPrice: $checkedConvert('input_price', (v) => v as num?),
      maxTokens: $checkedConvert('max_tokens', (v) => (v as num?)?.toInt()),
      minTokens: $checkedConvert('min_tokens', (v) => (v as num).toInt()),
      outputPrice: $checkedConvert('output_price', (v) => v as num?),
      perRequestPrice: $checkedConvert('per_request_price', (v) => v as num?),
      tierLabel: $checkedConvert('tier_label', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'cacheReadPrice': 'cache_read_price',
    'cacheWritePrice': 'cache_write_price',
    'inputPrice': 'input_price',
    'maxTokens': 'max_tokens',
    'minTokens': 'min_tokens',
    'outputPrice': 'output_price',
    'perRequestPrice': 'per_request_price',
    'tierLabel': 'tier_label',
  },
);

SupportedModelPricingWireDto _$SupportedModelPricingWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SupportedModelPricingWireDto',
  json,
  ($checkedConvert) {
    final val = SupportedModelPricingWireDto(
      billingMode: $checkedConvert('billing_mode', (v) => v as String),
      cacheReadPrice: $checkedConvert('cache_read_price', (v) => v as num?),
      cacheWritePrice: $checkedConvert('cache_write_price', (v) => v as num?),
      imageInputPrice: $checkedConvert('image_input_price', (v) => v as num?),
      imageOutputPrice: $checkedConvert('image_output_price', (v) => v as num?),
      inputPrice: $checkedConvert('input_price', (v) => v as num?),
      intervals: $checkedConvert(
        'intervals',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => PricingIntervalWireDto.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      outputPrice: $checkedConvert('output_price', (v) => v as num?),
      perRequestPrice: $checkedConvert('per_request_price', (v) => v as num?),
    );
    return val;
  },
  fieldKeyMap: const {
    'billingMode': 'billing_mode',
    'cacheReadPrice': 'cache_read_price',
    'cacheWritePrice': 'cache_write_price',
    'imageInputPrice': 'image_input_price',
    'imageOutputPrice': 'image_output_price',
    'inputPrice': 'input_price',
    'outputPrice': 'output_price',
    'perRequestPrice': 'per_request_price',
  },
);

SupportedModelWireDto _$SupportedModelWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SupportedModelWireDto', json, ($checkedConvert) {
  final val = SupportedModelWireDto(
    name: $checkedConvert('name', (v) => v as String),
    platform: $checkedConvert('platform', (v) => v as String),
    pricing: $checkedConvert(
      'pricing',
      (v) => v == null
          ? null
          : SupportedModelPricingWireDto.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

ChannelPlatformSectionWireDto _$ChannelPlatformSectionWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ChannelPlatformSectionWireDto',
  json,
  ($checkedConvert) {
    final val = ChannelPlatformSectionWireDto(
      groups: $checkedConvert(
        'groups',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) =>
                      ChannelGroupWireDto.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
      ),
      platform: $checkedConvert('platform', (v) => v as String),
      supportedModels: $checkedConvert(
        'supported_models',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) =>
                      SupportedModelWireDto.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
      ),
    );
    return val;
  },
  fieldKeyMap: const {'supportedModels': 'supported_models'},
);

AvailableChannelWireDto _$AvailableChannelWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AvailableChannelWireDto', json, ($checkedConvert) {
  final val = AvailableChannelWireDto(
    description: $checkedConvert('description', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
    platforms: $checkedConvert(
      'platforms',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => ChannelPlatformSectionWireDto.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    ),
  );
  return val;
});

ApiKeyDailyUsagePointWireDto _$ApiKeyDailyUsagePointWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ApiKeyDailyUsagePointWireDto',
  json,
  ($checkedConvert) {
    final val = ApiKeyDailyUsagePointWireDto(
      actualCost: $checkedConvert('actual_cost', (v) => v as num),
      cacheReadTokens: $checkedConvert(
        'cache_read_tokens',
        (v) => (v as num).toInt(),
      ),
      cacheWriteTokens: $checkedConvert(
        'cache_write_tokens',
        (v) => (v as num).toInt(),
      ),
      cost: $checkedConvert('cost', (v) => v as num),
      date: $checkedConvert('date', (v) => v as String),
      inputTokens: $checkedConvert('input_tokens', (v) => (v as num).toInt()),
      outputTokens: $checkedConvert('output_tokens', (v) => (v as num).toInt()),
      requests: $checkedConvert('requests', (v) => (v as num).toInt()),
      totalTokens: $checkedConvert('total_tokens', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'actualCost': 'actual_cost',
    'cacheReadTokens': 'cache_read_tokens',
    'cacheWriteTokens': 'cache_write_tokens',
    'inputTokens': 'input_tokens',
    'outputTokens': 'output_tokens',
    'totalTokens': 'total_tokens',
  },
);

ApiKeyDailyUsageWireDto _$ApiKeyDailyUsageWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ApiKeyDailyUsageWireDto',
  json,
  ($checkedConvert) {
    final val = ApiKeyDailyUsageWireDto(
      days: $checkedConvert('days', (v) => (v as num).toInt()),
      endDate: $checkedConvert('end_date', (v) => v as String),
      items: $checkedConvert(
        'items',
        (v) => (v as List<dynamic>)
            .map(
              (e) => ApiKeyDailyUsagePointWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      startDate: $checkedConvert('start_date', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'endDate': 'end_date', 'startDate': 'start_date'},
);
