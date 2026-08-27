import 'package:freezed_annotation/freezed_annotation.dart';

import '../shared/models/sub2api_decimal.dart';

part 'sub2api_access_models.freezed.dart';

/// Exact OpenAI/Codex reasoning effort rewrite configured by a group.
@freezed
abstract class Sub2ApiReasoningEffortMapping
    with _$Sub2ApiReasoningEffortMapping {
  const factory Sub2ApiReasoningEffortMapping({
    required String from,
    required String to,
  }) = _Sub2ApiReasoningEffortMapping;
}

/// Complete user-visible group contract returned by `/groups/available`.
@freezed
abstract class Sub2ApiAvailableGroup with _$Sub2ApiAvailableGroup {
  const factory Sub2ApiAvailableGroup({
    required int id,
    required String name,
    required String description,
    required String platform,
    required Sub2ApiDecimal rateMultiplier,
    required bool isExclusive,
    required String status,
    required String subscriptionType,
    required Sub2ApiDecimal? dailyLimitUsd,
    required Sub2ApiDecimal? weeklyLimitUsd,
    required Sub2ApiDecimal? monthlyLimitUsd,
    required bool longContextPricingEnabled,
    required bool allowImageGeneration,
    required bool allowBatchImageGeneration,
    required bool imageRateIndependent,
    required Sub2ApiDecimal imageRateMultiplier,
    required Sub2ApiDecimal batchImageDiscountMultiplier,
    required Sub2ApiDecimal batchImageHoldMultiplier,
    required bool videoRateIndependent,
    required Sub2ApiDecimal videoRateMultiplier,
    required bool peakRateEnabled,
    required String peakStart,
    required String peakEnd,
    required Sub2ApiDecimal peakRateMultiplier,
    required Sub2ApiDecimal? imagePrice1k,
    required Sub2ApiDecimal? imagePrice2k,
    required Sub2ApiDecimal? imagePrice4k,
    required Sub2ApiDecimal? videoPrice480p,
    required Sub2ApiDecimal? videoPrice720p,
    required Sub2ApiDecimal? videoPrice1080p,
    required Map<String, Map<String, Sub2ApiDecimal>> videoModelPrices,
    required Sub2ApiDecimal? webSearchPricePerCall,
    required Sub2ApiDecimal? searchPricePer1k,
    required Sub2ApiDecimal? audioRealtimePricePerMin,
    required Sub2ApiDecimal? audioTtsPricePerMillionChars,
    required Sub2ApiDecimal? audioSttPricePerHour,
    required bool claudeCodeOnly,
    required int? fallbackGroupId,
    required int? fallbackGroupIdOnInvalidRequest,
    required bool allowMessagesDispatch,
    required bool allowLive,
    required bool requireOAuthOnly,
    required bool requirePrivacySet,
    required int rpmLimit,
    required String maxReasoningEffort,
    required List<Sub2ApiReasoningEffortMapping> reasoningEffortMappings,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Sub2ApiAvailableGroup;
}

/// One daily, weekly, or monthly platform quota window.
@freezed
abstract class Sub2ApiPlatformQuotaWindow with _$Sub2ApiPlatformQuotaWindow {
  const factory Sub2ApiPlatformQuotaWindow({
    required Sub2ApiDecimal? limit,
    required Sub2ApiDecimal usage,
    DateTime? resetsAt,
  }) = _Sub2ApiPlatformQuotaWindow;
}

/// Current user's quota state for one upstream platform.
@freezed
abstract class Sub2ApiPlatformQuota with _$Sub2ApiPlatformQuota {
  const factory Sub2ApiPlatformQuota({
    required String platform,
    required Sub2ApiPlatformQuotaWindow daily,
    required Sub2ApiPlatformQuotaWindow weekly,
    required Sub2ApiPlatformQuotaWindow monthly,
  }) = _Sub2ApiPlatformQuota;
}

/// User-visible group summary embedded in an available channel section.
@freezed
abstract class Sub2ApiChannelGroup with _$Sub2ApiChannelGroup {
  const factory Sub2ApiChannelGroup({
    required int id,
    required String name,
    required String platform,
    required String subscriptionType,
    required Sub2ApiDecimal rateMultiplier,
    required bool peakRateEnabled,
    required String peakStart,
    required String peakEnd,
    required Sub2ApiDecimal peakRateMultiplier,
    required bool isExclusive,
  }) = _Sub2ApiChannelGroup;
}

/// One token range in tiered model pricing.
@freezed
abstract class Sub2ApiPricingInterval with _$Sub2ApiPricingInterval {
  const factory Sub2ApiPricingInterval({
    required int minTokens,
    required int? maxTokens,
    required String? tierLabel,
    required Sub2ApiDecimal? inputPrice,
    required Sub2ApiDecimal? outputPrice,
    required Sub2ApiDecimal? cacheWritePrice,
    required Sub2ApiDecimal? cacheReadPrice,
    required Sub2ApiDecimal? perRequestPrice,
  }) = _Sub2ApiPricingInterval;
}

/// User-visible supported-model pricing.
@freezed
abstract class Sub2ApiSupportedModelPricing
    with _$Sub2ApiSupportedModelPricing {
  const factory Sub2ApiSupportedModelPricing({
    required String billingMode,
    required Sub2ApiDecimal? inputPrice,
    required Sub2ApiDecimal? outputPrice,
    required Sub2ApiDecimal? cacheWritePrice,
    required Sub2ApiDecimal? cacheReadPrice,
    required Sub2ApiDecimal? imageInputPrice,
    required Sub2ApiDecimal? imageOutputPrice,
    required Sub2ApiDecimal? perRequestPrice,
    required List<Sub2ApiPricingInterval> intervals,
  }) = _Sub2ApiSupportedModelPricing;
}

/// One supported model within an available channel platform section.
@freezed
abstract class Sub2ApiSupportedModel with _$Sub2ApiSupportedModel {
  const factory Sub2ApiSupportedModel({
    required String name,
    required String platform,
    required Sub2ApiSupportedModelPricing? pricing,
  }) = _Sub2ApiSupportedModel;
}

/// One platform-specific section of an available channel.
@freezed
abstract class Sub2ApiChannelPlatformSection
    with _$Sub2ApiChannelPlatformSection {
  const factory Sub2ApiChannelPlatformSection({
    required String platform,
    required List<Sub2ApiChannelGroup> groups,
    required List<Sub2ApiSupportedModel> supportedModels,
  }) = _Sub2ApiChannelPlatformSection;
}

/// User-visible channel with platform-grouped models and pricing.
@freezed
abstract class Sub2ApiAvailableChannel with _$Sub2ApiAvailableChannel {
  const factory Sub2ApiAvailableChannel({
    required String name,
    required String description,
    required List<Sub2ApiChannelPlatformSection> platforms,
  }) = _Sub2ApiAvailableChannel;
}

/// Query for one current-user API key's daily usage.
final class Sub2ApiApiKeyDailyUsageRequest {
  const Sub2ApiApiKeyDailyUsageRequest({
    required this.apiKeyId,
    this.days = 30,
    this.timezone,
  });

  final int apiKeyId;
  final int days;
  final String? timezone;
}

/// One calendar day's usage for an API key.
@freezed
abstract class Sub2ApiApiKeyDailyUsagePoint
    with _$Sub2ApiApiKeyDailyUsagePoint {
  const factory Sub2ApiApiKeyDailyUsagePoint({
    required DateTime date,
    required int requests,
    required int inputTokens,
    required int outputTokens,
    required int cacheReadTokens,
    required int cacheWriteTokens,
    required int totalTokens,
    required Sub2ApiDecimal cost,
    required Sub2ApiDecimal actualCost,
  }) = _Sub2ApiApiKeyDailyUsagePoint;
}

/// Daily usage range returned for an API key.
@freezed
abstract class Sub2ApiApiKeyDailyUsage with _$Sub2ApiApiKeyDailyUsage {
  const factory Sub2ApiApiKeyDailyUsage({
    required List<Sub2ApiApiKeyDailyUsagePoint> items,
    required int days,
    required DateTime startDate,
    required DateTime endDate,
  }) = _Sub2ApiApiKeyDailyUsage;
}
