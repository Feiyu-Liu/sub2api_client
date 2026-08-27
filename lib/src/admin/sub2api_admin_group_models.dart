import '../keys/sub2api_key_models.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';

typedef Sub2ApiAdminGroupPage = Sub2ApiPage<Sub2ApiAdminGroup>;
typedef Sub2ApiAdminGroupApiKeyPage = Sub2ApiPage<Sub2ApiKeyDetails>;

enum Sub2ApiAdminGroupPlatform {
  anthropic,
  openAi,
  gemini,
  antigravity,
  grok,
  kimi,
  zhipu,
  deepseek,
  composite,
}

enum Sub2ApiAdminGroupStatus { active, inactive }

enum Sub2ApiAdminGroupSubscriptionType { standard, subscription }

enum Sub2ApiAdminCompositeRouteMatchType { exact, prefix }

enum Sub2ApiAdminCompositeRouteEndpoint {
  any,
  messages,
  countTokens,
  responses,
  chatCompletions,
  embeddings,
  images,
  gemini,
}

final class Sub2ApiAdminGroupListQuery {
  const Sub2ApiAdminGroupListQuery({
    this.page,
    this.pageSize,
    this.platform,
    this.status,
    this.search,
    this.isExclusive,
    this.sortBy,
    this.sortOrder,
  });

  final int? page;
  final int? pageSize;
  final Sub2ApiAdminGroupPlatform? platform;
  final Sub2ApiAdminGroupStatus? status;
  final String? search;
  final bool? isExclusive;
  final String? sortBy;
  final String? sortOrder;
}

final class Sub2ApiAdminGroup {
  Sub2ApiAdminGroup({
    required this.id,
    required this.name,
    required this.description,
    required this.platform,
    required this.rateMultiplier,
    required this.isExclusive,
    required this.status,
    required this.subscriptionType,
    required this.longContextPricingEnabled,
    required this.allowImageGeneration,
    required this.allowBatchImageGeneration,
    required this.imageRateIndependent,
    required this.imageRateMultiplier,
    required this.batchImageDiscountMultiplier,
    required this.batchImageHoldMultiplier,
    required this.videoRateIndependent,
    required this.videoRateMultiplier,
    required this.peakRateEnabled,
    required this.peakStart,
    required this.peakEnd,
    required this.peakRateMultiplier,
    required this.claudeCodeOnly,
    required this.allowMessagesDispatch,
    required this.allowLive,
    required this.requireOAuthOnly,
    required this.requirePrivacySet,
    required this.rpmLimit,
    required this.maxReasoningEffort,
    required List<Sub2ApiAdminReasoningEffortMapping> reasoningEffortMappings,
    required this.profitControlEnabled,
    required this.profitMinMargin,
    required this.profitSafetyBuffer,
    required List<Sub2ApiAdminModelPricing> modelPricing,
    required Map<String, List<int>> modelRouting,
    required this.modelRoutingEnabled,
    required this.mcpXmlInject,
    required this.defaultMappedModel,
    required this.messagesDispatchModelConfig,
    required this.modelsListConfig,
    required List<String> supportedModelScopes,
    required List<Sub2ApiAdminGroupAccountBinding> accountGroups,
    required this.accountCount,
    required this.activeAccountCount,
    required this.rateLimitedAccountCount,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
    this.dailyLimitUsd,
    this.weeklyLimitUsd,
    this.monthlyLimitUsd,
    this.imagePrice1k,
    this.imagePrice2k,
    this.imagePrice4k,
    this.videoPrice480p,
    this.videoPrice720p,
    this.videoPrice1080p,
    Map<String, Map<String, Sub2ApiDecimal>>? videoModelPrices,
    this.webSearchPricePerCall,
    this.searchPricePer1k,
    this.audioRealtimePricePerMin,
    this.audioTtsPricePerMillionChars,
    this.audioSttPricePerHour,
    this.fallbackGroupId,
    this.fallbackGroupIdOnInvalidRequest,
  }) : reasoningEffortMappings = List.unmodifiable(reasoningEffortMappings),
       modelPricing = List.unmodifiable(modelPricing),
       modelRouting = Map.unmodifiable(
         modelRouting.map(
           (key, value) => MapEntry(key, List<int>.unmodifiable(value)),
         ),
       ),
       supportedModelScopes = List.unmodifiable(supportedModelScopes),
       accountGroups = List.unmodifiable(accountGroups),
       videoModelPrices = videoModelPrices == null
           ? const {}
           : Map.unmodifiable(
               videoModelPrices.map(
                 (key, value) => MapEntry(
                   key,
                   Map<String, Sub2ApiDecimal>.unmodifiable(value),
                 ),
               ),
             );

  final int id;
  final String name;
  final String description;
  final Sub2ApiAdminGroupPlatform platform;
  final Sub2ApiDecimal rateMultiplier;
  final bool isExclusive;
  final Sub2ApiAdminGroupStatus status;
  final Sub2ApiAdminGroupSubscriptionType subscriptionType;
  final Sub2ApiDecimal? dailyLimitUsd;
  final Sub2ApiDecimal? weeklyLimitUsd;
  final Sub2ApiDecimal? monthlyLimitUsd;
  final bool longContextPricingEnabled;
  final bool allowImageGeneration;
  final bool allowBatchImageGeneration;
  final bool imageRateIndependent;
  final Sub2ApiDecimal imageRateMultiplier;
  final Sub2ApiDecimal batchImageDiscountMultiplier;
  final Sub2ApiDecimal batchImageHoldMultiplier;
  final bool videoRateIndependent;
  final Sub2ApiDecimal videoRateMultiplier;
  final bool peakRateEnabled;
  final String peakStart;
  final String peakEnd;
  final Sub2ApiDecimal peakRateMultiplier;
  final Sub2ApiDecimal? imagePrice1k;
  final Sub2ApiDecimal? imagePrice2k;
  final Sub2ApiDecimal? imagePrice4k;
  final Sub2ApiDecimal? videoPrice480p;
  final Sub2ApiDecimal? videoPrice720p;
  final Sub2ApiDecimal? videoPrice1080p;
  final Map<String, Map<String, Sub2ApiDecimal>> videoModelPrices;
  final Sub2ApiDecimal? webSearchPricePerCall;
  final Sub2ApiDecimal? searchPricePer1k;
  final Sub2ApiDecimal? audioRealtimePricePerMin;
  final Sub2ApiDecimal? audioTtsPricePerMillionChars;
  final Sub2ApiDecimal? audioSttPricePerHour;
  final bool claudeCodeOnly;
  final int? fallbackGroupId;
  final int? fallbackGroupIdOnInvalidRequest;
  final bool allowMessagesDispatch;
  final bool allowLive;
  final bool requireOAuthOnly;
  final bool requirePrivacySet;
  final int rpmLimit;
  final String maxReasoningEffort;
  final List<Sub2ApiAdminReasoningEffortMapping> reasoningEffortMappings;
  final bool profitControlEnabled;
  final Sub2ApiDecimal profitMinMargin;
  final Sub2ApiDecimal profitSafetyBuffer;
  final List<Sub2ApiAdminModelPricing> modelPricing;
  final Map<String, List<int>> modelRouting;
  final bool modelRoutingEnabled;
  final bool mcpXmlInject;
  final String defaultMappedModel;
  final Sub2ApiAdminMessagesDispatchModelConfig messagesDispatchModelConfig;
  final Sub2ApiAdminGroupModelsListConfig modelsListConfig;
  final List<String> supportedModelScopes;
  final List<Sub2ApiAdminGroupAccountBinding> accountGroups;
  final int accountCount;
  final int activeAccountCount;
  final int rateLimitedAccountCount;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
}

final class Sub2ApiAdminReasoningEffortMapping {
  const Sub2ApiAdminReasoningEffortMapping({
    required this.from,
    required this.to,
  });

  final String from;
  final String to;
}

final class Sub2ApiAdminMessagesDispatchModelConfig {
  Sub2ApiAdminMessagesDispatchModelConfig({
    required this.opusMappedModel,
    required this.sonnetMappedModel,
    required this.haikuMappedModel,
    required Map<String, String> exactModelMappings,
  }) : exactModelMappings = Map.unmodifiable(exactModelMappings);

  final String opusMappedModel;
  final String sonnetMappedModel;
  final String haikuMappedModel;
  final Map<String, String> exactModelMappings;
}

final class Sub2ApiAdminGroupModelsListConfig {
  Sub2ApiAdminGroupModelsListConfig({
    required this.enabled,
    required List<String> models,
  }) : models = List.unmodifiable(models);

  final bool enabled;
  final List<String> models;
}

final class Sub2ApiAdminGroupAccountBinding {
  const Sub2ApiAdminGroupAccountBinding({
    required this.accountId,
    required this.groupId,
    required this.priority,
    required this.createdAt,
  });

  final int accountId;
  final int groupId;
  final int priority;
  final DateTime createdAt;
}

final class Sub2ApiAdminModelPricing {
  Sub2ApiAdminModelPricing({
    required this.id,
    required this.channelId,
    required this.platform,
    required List<String> models,
    required this.billingMode,
    required List<Sub2ApiAdminPricingInterval> intervals,
    this.inputPrice,
    this.outputPrice,
    this.cacheWritePrice,
    this.cacheReadPrice,
    this.fastMultiplier,
    this.flexMultiplier,
    this.imageInputPrice,
    this.imageOutputPrice,
    this.perRequestPrice,
    this.timePricing,
    this.createdAt,
    this.updatedAt,
  }) : models = List.unmodifiable(models),
       intervals = List.unmodifiable(intervals);

  final int id;
  final int channelId;
  final String platform;
  final String billingMode;
  final List<String> models;
  final Sub2ApiDecimal? inputPrice;
  final Sub2ApiDecimal? outputPrice;
  final Sub2ApiDecimal? cacheWritePrice;
  final Sub2ApiDecimal? cacheReadPrice;
  final Sub2ApiDecimal? fastMultiplier;
  final Sub2ApiDecimal? flexMultiplier;
  final Sub2ApiDecimal? imageInputPrice;
  final Sub2ApiDecimal? imageOutputPrice;
  final Sub2ApiDecimal? perRequestPrice;
  final List<Sub2ApiAdminPricingInterval> intervals;
  final Sub2ApiAdminTimePricing? timePricing;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}

final class Sub2ApiAdminPricingInterval {
  const Sub2ApiAdminPricingInterval({
    required this.id,
    required this.pricingId,
    required this.minTokens,
    required this.tierLabel,
    required this.sortOrder,
    this.maxTokens,
    this.inputPrice,
    this.outputPrice,
    this.cacheWritePrice,
    this.cacheReadPrice,
    this.inputMultiplier,
    this.outputMultiplier,
    this.cacheWriteMultiplier,
    this.cacheReadMultiplier,
    this.perRequestPrice,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final int pricingId;
  final int minTokens;
  final int? maxTokens;
  final String tierLabel;
  final Sub2ApiDecimal? inputPrice;
  final Sub2ApiDecimal? outputPrice;
  final Sub2ApiDecimal? cacheWritePrice;
  final Sub2ApiDecimal? cacheReadPrice;
  final Sub2ApiDecimal? inputMultiplier;
  final Sub2ApiDecimal? outputMultiplier;
  final Sub2ApiDecimal? cacheWriteMultiplier;
  final Sub2ApiDecimal? cacheReadMultiplier;
  final Sub2ApiDecimal? perRequestPrice;
  final int sortOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}

final class Sub2ApiAdminTimePricing {
  Sub2ApiAdminTimePricing({
    required this.timezone,
    required this.weekdaysOnly,
    required List<Sub2ApiAdminTimePricingPeriod> periods,
  }) : periods = List.unmodifiable(periods);

  final String timezone;
  final bool weekdaysOnly;
  final List<Sub2ApiAdminTimePricingPeriod> periods;
}

final class Sub2ApiAdminTimePricingPeriod {
  const Sub2ApiAdminTimePricingPeriod({
    required this.startTime,
    required this.endTime,
    required this.multiplier,
  });

  final String startTime;
  final String endTime;
  final Sub2ApiDecimal multiplier;
}

final class Sub2ApiAdminGroupUsageSummary {
  const Sub2ApiAdminGroupUsageSummary({
    required this.groupId,
    required this.todayCost,
    required this.yesterdayCost,
    required this.totalCost,
  });

  final int groupId;
  final Sub2ApiDecimal todayCost;
  final Sub2ApiDecimal yesterdayCost;
  final Sub2ApiDecimal totalCost;
}

final class Sub2ApiAdminGroupCapacitySummary {
  const Sub2ApiAdminGroupCapacitySummary({
    required this.groupId,
    required this.concurrencyUsed,
    required this.concurrencyMax,
    required this.sessionsUsed,
    required this.sessionsMax,
    required this.rpmUsed,
    required this.rpmMax,
  });

  final int groupId;
  final int concurrencyUsed;
  final int concurrencyMax;
  final int sessionsUsed;
  final int sessionsMax;
  final int rpmUsed;
  final int rpmMax;
}

final class Sub2ApiAdminGroupLiveCapability {
  const Sub2ApiAdminGroupLiveCapability({required this.supported, this.reason});

  final bool supported;
  final String? reason;
}

final class Sub2ApiAdminGroupStats {
  const Sub2ApiAdminGroupStats({
    required this.totalApiKeys,
    required this.activeApiKeys,
    required this.totalRequests,
    required this.totalCost,
  });

  final int totalApiKeys;
  final int activeApiKeys;
  final int totalRequests;
  final Sub2ApiDecimal totalCost;
}

final class Sub2ApiAdminGroupModelsListCandidates {
  Sub2ApiAdminGroupModelsListCandidates({required List<String> models})
    : models = List.unmodifiable(models);

  final List<String> models;
}

final class Sub2ApiAdminGroupRateEntry {
  const Sub2ApiAdminGroupRateEntry({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userNotes,
    required this.userStatus,
    this.rateMultiplier,
    this.rpmOverride,
  });

  final int userId;
  final String userName;
  final String userEmail;
  final String userNotes;
  final String userStatus;
  final Sub2ApiDecimal? rateMultiplier;
  final int? rpmOverride;
}

final class Sub2ApiAdminCompositeRoute {
  const Sub2ApiAdminCompositeRoute({
    required this.id,
    required this.groupId,
    required this.publicModel,
    required this.matchType,
    required this.targetPlatform,
    required this.upstreamModel,
    required this.endpoint,
    required this.priority,
    required this.enabled,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int groupId;
  final String publicModel;
  final Sub2ApiAdminCompositeRouteMatchType matchType;
  final Sub2ApiAdminGroupPlatform targetPlatform;
  final String upstreamModel;
  final Sub2ApiAdminCompositeRouteEndpoint endpoint;
  final int priority;
  final bool enabled;
  final String notes;
  final DateTime createdAt;
  final DateTime updatedAt;
}
