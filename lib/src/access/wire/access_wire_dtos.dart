import 'package:json_annotation/json_annotation.dart';

import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../sub2api_access_models.dart';

part 'access_wire_dtos.g.dart';

@JsonSerializable(createToJson: false, checked: true)
final class ReasoningEffortMappingWireDto {
  const ReasoningEffortMappingWireDto({required this.from, required this.to});

  factory ReasoningEffortMappingWireDto.fromJson(Map<String, Object?> json) =>
      _$ReasoningEffortMappingWireDtoFromJson(json);

  final String from;
  final String to;

  Sub2ApiReasoningEffortMapping toPublicModel() {
    if (from.isEmpty || to.isEmpty) throw invalidAvailableGroup;
    return Sub2ApiReasoningEffortMapping(from: from, to: to);
  }
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AvailableGroupWireDto {
  const AvailableGroupWireDto({
    required this.allowBatchImageGeneration,
    required this.allowImageGeneration,
    required this.allowLive,
    required this.allowMessagesDispatch,
    required this.audioRealtimePricePerMin,
    required this.audioSttPricePerHour,
    required this.audioTtsPricePerMillionChars,
    required this.batchImageDiscountMultiplier,
    required this.batchImageHoldMultiplier,
    required this.claudeCodeOnly,
    required this.createdAt,
    required this.dailyLimitUsd,
    required this.description,
    required this.fallbackGroupId,
    required this.fallbackGroupIdOnInvalidRequest,
    required this.id,
    required this.imagePrice1k,
    required this.imagePrice2k,
    required this.imagePrice4k,
    required this.imageRateIndependent,
    required this.imageRateMultiplier,
    required this.isExclusive,
    required this.longContextPricingEnabled,
    required this.maxReasoningEffort,
    required this.monthlyLimitUsd,
    required this.name,
    required this.peakEnd,
    required this.peakRateEnabled,
    required this.peakRateMultiplier,
    required this.peakStart,
    required this.platform,
    required this.rateMultiplier,
    required this.reasoningEffortMappings,
    required this.requireOAuthOnly,
    required this.requirePrivacySet,
    required this.rpmLimit,
    required this.searchPricePer1k,
    required this.status,
    required this.subscriptionType,
    required this.updatedAt,
    required this.videoModelPrices,
    required this.videoPrice1080p,
    required this.videoPrice480p,
    required this.videoPrice720p,
    required this.videoRateIndependent,
    required this.videoRateMultiplier,
    required this.webSearchPricePerCall,
    required this.weeklyLimitUsd,
  });

  factory AvailableGroupWireDto.fromJson(Map<String, Object?> json) =>
      _$AvailableGroupWireDtoFromJson(json);

  final bool allowBatchImageGeneration;
  final bool allowImageGeneration;
  final bool allowLive;
  final bool allowMessagesDispatch;
  final num? audioRealtimePricePerMin;
  final num? audioSttPricePerHour;
  final num? audioTtsPricePerMillionChars;
  final num batchImageDiscountMultiplier;
  final num batchImageHoldMultiplier;
  final bool claudeCodeOnly;
  final DateTime createdAt;
  final num? dailyLimitUsd;
  final String description;
  final int? fallbackGroupId;
  final int? fallbackGroupIdOnInvalidRequest;
  final int id;
  @JsonKey(name: 'image_price_1k')
  final num? imagePrice1k;
  @JsonKey(name: 'image_price_2k')
  final num? imagePrice2k;
  @JsonKey(name: 'image_price_4k')
  final num? imagePrice4k;
  final bool imageRateIndependent;
  final num imageRateMultiplier;
  final bool isExclusive;
  final bool longContextPricingEnabled;
  final String maxReasoningEffort;
  final num? monthlyLimitUsd;
  final String name;
  final String peakEnd;
  final bool peakRateEnabled;
  final num peakRateMultiplier;
  final String peakStart;
  final String platform;
  final num rateMultiplier;
  @JsonKey(defaultValue: <ReasoningEffortMappingWireDto>[])
  final List<ReasoningEffortMappingWireDto> reasoningEffortMappings;
  @JsonKey(name: 'require_oauth_only')
  final bool requireOAuthOnly;
  final bool requirePrivacySet;
  final int rpmLimit;
  @JsonKey(name: 'search_price_per_1k')
  final num? searchPricePer1k;
  final String status;
  final String subscriptionType;
  final DateTime updatedAt;
  @JsonKey(defaultValue: <String, Map<String, num>>{})
  final Map<String, Map<String, num>> videoModelPrices;
  @JsonKey(name: 'video_price_1080p')
  final num? videoPrice1080p;
  @JsonKey(name: 'video_price_480p')
  final num? videoPrice480p;
  @JsonKey(name: 'video_price_720p')
  final num? videoPrice720p;
  final bool videoRateIndependent;
  final num videoRateMultiplier;
  final num? webSearchPricePerCall;
  final num? weeklyLimitUsd;

  Sub2ApiAvailableGroup toPublicModel() {
    if (id <= 0 ||
        name.isEmpty ||
        platform.isEmpty ||
        status.isEmpty ||
        subscriptionType.isEmpty ||
        rpmLimit < 0) {
      throw invalidAvailableGroup;
    }
    return Sub2ApiAvailableGroup(
      allowBatchImageGeneration: allowBatchImageGeneration,
      allowImageGeneration: allowImageGeneration,
      allowLive: allowLive,
      allowMessagesDispatch: allowMessagesDispatch,
      audioRealtimePricePerMin: _decimalOrNull(audioRealtimePricePerMin),
      audioSttPricePerHour: _decimalOrNull(audioSttPricePerHour),
      audioTtsPricePerMillionChars: _decimalOrNull(
        audioTtsPricePerMillionChars,
      ),
      batchImageDiscountMultiplier: Sub2ApiDecimal.fromJson(
        batchImageDiscountMultiplier,
      ),
      batchImageHoldMultiplier: Sub2ApiDecimal.fromJson(
        batchImageHoldMultiplier,
      ),
      claudeCodeOnly: claudeCodeOnly,
      createdAt: createdAt,
      dailyLimitUsd: _decimalOrNull(dailyLimitUsd),
      description: description,
      fallbackGroupId: fallbackGroupId,
      fallbackGroupIdOnInvalidRequest: fallbackGroupIdOnInvalidRequest,
      id: id,
      imagePrice1k: _decimalOrNull(imagePrice1k),
      imagePrice2k: _decimalOrNull(imagePrice2k),
      imagePrice4k: _decimalOrNull(imagePrice4k),
      imageRateIndependent: imageRateIndependent,
      imageRateMultiplier: Sub2ApiDecimal.fromJson(imageRateMultiplier),
      isExclusive: isExclusive,
      longContextPricingEnabled: longContextPricingEnabled,
      maxReasoningEffort: maxReasoningEffort,
      monthlyLimitUsd: _decimalOrNull(monthlyLimitUsd),
      name: name,
      peakEnd: peakEnd,
      peakRateEnabled: peakRateEnabled,
      peakRateMultiplier: Sub2ApiDecimal.fromJson(peakRateMultiplier),
      peakStart: peakStart,
      platform: platform,
      rateMultiplier: Sub2ApiDecimal.fromJson(rateMultiplier),
      reasoningEffortMappings: List<Sub2ApiReasoningEffortMapping>.unmodifiable(
        reasoningEffortMappings.map((mapping) => mapping.toPublicModel()),
      ),
      requireOAuthOnly: requireOAuthOnly,
      requirePrivacySet: requirePrivacySet,
      rpmLimit: rpmLimit,
      searchPricePer1k: _decimalOrNull(searchPricePer1k),
      status: status,
      subscriptionType: subscriptionType,
      updatedAt: updatedAt,
      videoModelPrices: Map<String, Map<String, Sub2ApiDecimal>>.unmodifiable(
        videoModelPrices.map(
          (model, prices) => MapEntry(
            model,
            Map<String, Sub2ApiDecimal>.unmodifiable(
              prices.map(
                (resolution, price) =>
                    MapEntry(resolution, Sub2ApiDecimal.fromJson(price)),
              ),
            ),
          ),
        ),
      ),
      videoPrice1080p: _decimalOrNull(videoPrice1080p),
      videoPrice480p: _decimalOrNull(videoPrice480p),
      videoPrice720p: _decimalOrNull(videoPrice720p),
      videoRateIndependent: videoRateIndependent,
      videoRateMultiplier: Sub2ApiDecimal.fromJson(videoRateMultiplier),
      webSearchPricePerCall: _decimalOrNull(webSearchPricePerCall),
      weeklyLimitUsd: _decimalOrNull(weeklyLimitUsd),
    );
  }
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class PlatformQuotaWireDto {
  const PlatformQuotaWireDto({
    required this.dailyLimitUsd,
    required this.dailyUsageUsd,
    required this.monthlyLimitUsd,
    required this.monthlyUsageUsd,
    required this.platform,
    required this.weeklyLimitUsd,
    required this.weeklyUsageUsd,
    this.dailyWindowResetsAt,
    this.monthlyWindowResetsAt,
    this.weeklyWindowResetsAt,
  });

  factory PlatformQuotaWireDto.fromJson(Map<String, Object?> json) =>
      _$PlatformQuotaWireDtoFromJson(json);

  final num? dailyLimitUsd;
  final num dailyUsageUsd;
  final DateTime? dailyWindowResetsAt;
  final num? monthlyLimitUsd;
  final num monthlyUsageUsd;
  final DateTime? monthlyWindowResetsAt;
  final String platform;
  final num? weeklyLimitUsd;
  final num weeklyUsageUsd;
  final DateTime? weeklyWindowResetsAt;

  Sub2ApiPlatformQuota toPublicModel() {
    if (platform.isEmpty) throw invalidPlatformQuotas;
    return Sub2ApiPlatformQuota(
      daily: Sub2ApiPlatformQuotaWindow(
        limit: _decimalOrNull(dailyLimitUsd),
        resetsAt: dailyWindowResetsAt,
        usage: Sub2ApiDecimal.fromJson(dailyUsageUsd),
      ),
      monthly: Sub2ApiPlatformQuotaWindow(
        limit: _decimalOrNull(monthlyLimitUsd),
        resetsAt: monthlyWindowResetsAt,
        usage: Sub2ApiDecimal.fromJson(monthlyUsageUsd),
      ),
      platform: platform,
      weekly: Sub2ApiPlatformQuotaWindow(
        limit: _decimalOrNull(weeklyLimitUsd),
        resetsAt: weeklyWindowResetsAt,
        usage: Sub2ApiDecimal.fromJson(weeklyUsageUsd),
      ),
    );
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class PlatformQuotasWireDto {
  const PlatformQuotasWireDto({required this.platformQuotas});

  factory PlatformQuotasWireDto.fromJson(Map<String, Object?> json) =>
      _$PlatformQuotasWireDtoFromJson(json);

  @JsonKey(name: 'platform_quotas', defaultValue: <PlatformQuotaWireDto>[])
  final List<PlatformQuotaWireDto> platformQuotas;

  List<Sub2ApiPlatformQuota> toPublicModel() =>
      List<Sub2ApiPlatformQuota>.unmodifiable(
        platformQuotas.map((quota) => quota.toPublicModel()),
      );
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class ChannelGroupWireDto {
  const ChannelGroupWireDto({
    required this.id,
    required this.isExclusive,
    required this.name,
    required this.peakEnd,
    required this.peakRateEnabled,
    required this.peakRateMultiplier,
    required this.peakStart,
    required this.platform,
    required this.rateMultiplier,
    required this.subscriptionType,
  });

  factory ChannelGroupWireDto.fromJson(Map<String, Object?> json) =>
      _$ChannelGroupWireDtoFromJson(json);

  final int id;
  final bool isExclusive;
  final String name;
  final String peakEnd;
  final bool peakRateEnabled;
  final num peakRateMultiplier;
  final String peakStart;
  final String platform;
  final num rateMultiplier;
  final String subscriptionType;

  Sub2ApiChannelGroup toPublicModel() {
    if (id <= 0 || name.isEmpty || platform.isEmpty) {
      throw invalidAvailableChannels;
    }
    return Sub2ApiChannelGroup(
      id: id,
      isExclusive: isExclusive,
      name: name,
      peakEnd: peakEnd,
      peakRateEnabled: peakRateEnabled,
      peakRateMultiplier: Sub2ApiDecimal.fromJson(peakRateMultiplier),
      peakStart: peakStart,
      platform: platform,
      rateMultiplier: Sub2ApiDecimal.fromJson(rateMultiplier),
      subscriptionType: subscriptionType,
    );
  }
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class PricingIntervalWireDto {
  const PricingIntervalWireDto({
    required this.cacheReadPrice,
    required this.cacheWritePrice,
    required this.inputPrice,
    required this.maxTokens,
    required this.minTokens,
    required this.outputPrice,
    required this.perRequestPrice,
    this.tierLabel,
  });

  factory PricingIntervalWireDto.fromJson(Map<String, Object?> json) =>
      _$PricingIntervalWireDtoFromJson(json);

  final num? cacheReadPrice;
  final num? cacheWritePrice;
  final num? inputPrice;
  final int? maxTokens;
  final int minTokens;
  final num? outputPrice;
  final num? perRequestPrice;
  final String? tierLabel;

  Sub2ApiPricingInterval toPublicModel() {
    if (minTokens < 0 || (maxTokens != null && maxTokens! < minTokens)) {
      throw invalidAvailableChannels;
    }
    return Sub2ApiPricingInterval(
      cacheReadPrice: _decimalOrNull(cacheReadPrice),
      cacheWritePrice: _decimalOrNull(cacheWritePrice),
      inputPrice: _decimalOrNull(inputPrice),
      maxTokens: maxTokens,
      minTokens: minTokens,
      outputPrice: _decimalOrNull(outputPrice),
      perRequestPrice: _decimalOrNull(perRequestPrice),
      tierLabel: tierLabel,
    );
  }
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class SupportedModelPricingWireDto {
  const SupportedModelPricingWireDto({
    required this.billingMode,
    required this.cacheReadPrice,
    required this.cacheWritePrice,
    required this.imageInputPrice,
    required this.imageOutputPrice,
    required this.inputPrice,
    required this.intervals,
    required this.outputPrice,
    required this.perRequestPrice,
  });

  factory SupportedModelPricingWireDto.fromJson(Map<String, Object?> json) =>
      _$SupportedModelPricingWireDtoFromJson(json);

  final String billingMode;
  final num? cacheReadPrice;
  final num? cacheWritePrice;
  final num? imageInputPrice;
  final num? imageOutputPrice;
  final num? inputPrice;
  @JsonKey(defaultValue: <PricingIntervalWireDto>[])
  final List<PricingIntervalWireDto> intervals;
  final num? outputPrice;
  final num? perRequestPrice;

  Sub2ApiSupportedModelPricing toPublicModel() {
    if (billingMode.isEmpty) throw invalidAvailableChannels;
    return Sub2ApiSupportedModelPricing(
      billingMode: billingMode,
      cacheReadPrice: _decimalOrNull(cacheReadPrice),
      cacheWritePrice: _decimalOrNull(cacheWritePrice),
      imageInputPrice: _decimalOrNull(imageInputPrice),
      imageOutputPrice: _decimalOrNull(imageOutputPrice),
      inputPrice: _decimalOrNull(inputPrice),
      intervals: List<Sub2ApiPricingInterval>.unmodifiable(
        intervals.map((interval) => interval.toPublicModel()),
      ),
      outputPrice: _decimalOrNull(outputPrice),
      perRequestPrice: _decimalOrNull(perRequestPrice),
    );
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class SupportedModelWireDto {
  const SupportedModelWireDto({
    required this.name,
    required this.platform,
    this.pricing,
  });

  factory SupportedModelWireDto.fromJson(Map<String, Object?> json) =>
      _$SupportedModelWireDtoFromJson(json);

  final String name;
  final String platform;
  final SupportedModelPricingWireDto? pricing;

  Sub2ApiSupportedModel toPublicModel() {
    if (name.isEmpty || platform.isEmpty) throw invalidAvailableChannels;
    return Sub2ApiSupportedModel(
      name: name,
      platform: platform,
      pricing: pricing?.toPublicModel(),
    );
  }
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class ChannelPlatformSectionWireDto {
  const ChannelPlatformSectionWireDto({
    required this.groups,
    required this.platform,
    required this.supportedModels,
  });

  factory ChannelPlatformSectionWireDto.fromJson(Map<String, Object?> json) =>
      _$ChannelPlatformSectionWireDtoFromJson(json);

  @JsonKey(defaultValue: <ChannelGroupWireDto>[])
  final List<ChannelGroupWireDto> groups;
  final String platform;
  @JsonKey(defaultValue: <SupportedModelWireDto>[])
  final List<SupportedModelWireDto> supportedModels;

  Sub2ApiChannelPlatformSection toPublicModel() {
    if (platform.isEmpty) throw invalidAvailableChannels;
    return Sub2ApiChannelPlatformSection(
      groups: List<Sub2ApiChannelGroup>.unmodifiable(
        groups.map((group) => group.toPublicModel()),
      ),
      platform: platform,
      supportedModels: List<Sub2ApiSupportedModel>.unmodifiable(
        supportedModels.map((model) => model.toPublicModel()),
      ),
    );
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class AvailableChannelWireDto {
  const AvailableChannelWireDto({
    required this.description,
    required this.name,
    required this.platforms,
  });

  factory AvailableChannelWireDto.fromJson(Map<String, Object?> json) =>
      _$AvailableChannelWireDtoFromJson(json);

  final String description;
  final String name;
  @JsonKey(defaultValue: <ChannelPlatformSectionWireDto>[])
  final List<ChannelPlatformSectionWireDto> platforms;

  Sub2ApiAvailableChannel toPublicModel() {
    if (name.isEmpty) throw invalidAvailableChannels;
    return Sub2ApiAvailableChannel(
      description: description,
      name: name,
      platforms: List<Sub2ApiChannelPlatformSection>.unmodifiable(
        platforms.map((platform) => platform.toPublicModel()),
      ),
    );
  }
}

Sub2ApiDecimal? _decimalOrNull(num? value) =>
    value == null ? null : Sub2ApiDecimal.fromJson(value);

const invalidAvailableGroup = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_available_group',
  retryable: false,
);

const invalidGroupRates = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_group_rates',
  retryable: false,
);

const invalidPlatformQuotas = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_platform_quotas',
  retryable: false,
);

const invalidAvailableChannels = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_available_channels',
  retryable: false,
);

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class ApiKeyDailyUsagePointWireDto {
  const ApiKeyDailyUsagePointWireDto({
    required this.actualCost,
    required this.cacheReadTokens,
    required this.cacheWriteTokens,
    required this.cost,
    required this.date,
    required this.inputTokens,
    required this.outputTokens,
    required this.requests,
    required this.totalTokens,
  });

  factory ApiKeyDailyUsagePointWireDto.fromJson(Map<String, Object?> json) =>
      _$ApiKeyDailyUsagePointWireDtoFromJson(json);

  final num actualCost;
  final int cacheReadTokens;
  final int cacheWriteTokens;
  final num cost;
  final String date;
  final int inputTokens;
  final int outputTokens;
  final int requests;
  final int totalTokens;

  Sub2ApiApiKeyDailyUsagePoint toPublicModel() {
    if (requests < 0 ||
        inputTokens < 0 ||
        outputTokens < 0 ||
        cacheReadTokens < 0 ||
        cacheWriteTokens < 0 ||
        totalTokens < 0) {
      throw invalidApiKeyDailyUsage;
    }
    return Sub2ApiApiKeyDailyUsagePoint(
      actualCost: Sub2ApiDecimal.fromJson(actualCost),
      cacheReadTokens: cacheReadTokens,
      cacheWriteTokens: cacheWriteTokens,
      cost: Sub2ApiDecimal.fromJson(cost),
      date: _date(date),
      inputTokens: inputTokens,
      outputTokens: outputTokens,
      requests: requests,
      totalTokens: totalTokens,
    );
  }
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class ApiKeyDailyUsageWireDto {
  const ApiKeyDailyUsageWireDto({
    required this.days,
    required this.endDate,
    required this.items,
    required this.startDate,
  });

  factory ApiKeyDailyUsageWireDto.fromJson(Map<String, Object?> json) =>
      _$ApiKeyDailyUsageWireDtoFromJson(json);

  final int days;
  final String endDate;
  final List<ApiKeyDailyUsagePointWireDto> items;
  final String startDate;

  Sub2ApiApiKeyDailyUsage toPublicModel() {
    if (days < 1 || days > 90) throw invalidApiKeyDailyUsage;
    return Sub2ApiApiKeyDailyUsage(
      days: days,
      endDate: _date(endDate),
      items: List<Sub2ApiApiKeyDailyUsagePoint>.unmodifiable(
        items.map((item) => item.toPublicModel()),
      ),
      startDate: _date(startDate),
    );
  }
}

DateTime _date(String value) {
  if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
    throw invalidApiKeyDailyUsage;
  }
  try {
    final parsed = DateTime.parse('${value}T00:00:00Z');
    if (parsed.toIso8601String().substring(0, 10) != value) {
      throw invalidApiKeyDailyUsage;
    }
    return parsed;
  } on Sub2ApiException {
    rethrow;
  } on Object {
    throw invalidApiKeyDailyUsage;
  }
}

const invalidApiKeyDailyUsage = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_api_key_daily_usage',
  retryable: false,
);
