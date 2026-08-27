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

final class Sub2ApiAdminGroupSortOrderUpdate {
  const Sub2ApiAdminGroupSortOrderUpdate({
    required this.groupId,
    required this.sortOrder,
  });

  final int groupId;
  final int sortOrder;
}

final class Sub2ApiAdminUpdateGroupSortOrderRequest {
  Sub2ApiAdminUpdateGroupSortOrderRequest({
    required List<Sub2ApiAdminGroupSortOrderUpdate> updates,
  }) : updates = List.unmodifiable(updates);

  final List<Sub2ApiAdminGroupSortOrderUpdate> updates;
}

final class Sub2ApiAdminDuplicateGroupRequest {
  const Sub2ApiAdminDuplicateGroupRequest({required this.idempotencyKey});

  final String idempotencyKey;
}

final class Sub2ApiAdminCompositeRouteRequest {
  const Sub2ApiAdminCompositeRouteRequest({
    required this.publicModel,
    required this.targetPlatform,
    this.matchType = Sub2ApiAdminCompositeRouteMatchType.exact,
    this.upstreamModel = '',
    this.endpoint = Sub2ApiAdminCompositeRouteEndpoint.any,
    this.priority = 0,
    this.enabled = true,
    this.notes = '',
  });

  final String publicModel;
  final Sub2ApiAdminCompositeRouteMatchType matchType;
  final Sub2ApiAdminGroupPlatform targetPlatform;
  final String upstreamModel;
  final Sub2ApiAdminCompositeRouteEndpoint endpoint;
  final int priority;
  final bool enabled;
  final String notes;
}

final class Sub2ApiAdminCompositeRoutePreviewRequest {
  const Sub2ApiAdminCompositeRoutePreviewRequest({
    required this.model,
    this.endpoint = Sub2ApiAdminCompositeRouteEndpoint.any,
  });

  final String model;
  final Sub2ApiAdminCompositeRouteEndpoint endpoint;
}

final class Sub2ApiAdminCompositeRouteDecision {
  const Sub2ApiAdminCompositeRouteDecision({
    required this.matched,
    required this.source,
    required this.groupId,
    required this.publicModel,
    required this.targetPlatform,
    required this.upstreamModel,
    required this.endpoint,
    required this.reason,
    this.route,
  });

  final bool matched;
  final String source;
  final int groupId;
  final String publicModel;
  final Sub2ApiAdminGroupPlatform targetPlatform;
  final String upstreamModel;
  final Sub2ApiAdminCompositeRouteEndpoint endpoint;
  final Sub2ApiAdminCompositeRoute? route;
  final String reason;
}

final class Sub2ApiAdminGroupRateMultiplierInput {
  const Sub2ApiAdminGroupRateMultiplierInput({
    required this.userId,
    required this.rateMultiplier,
  });

  final int userId;
  final Sub2ApiDecimal rateMultiplier;
}

final class Sub2ApiAdminSetGroupRateMultipliersRequest {
  Sub2ApiAdminSetGroupRateMultipliersRequest({
    required List<Sub2ApiAdminGroupRateMultiplierInput> entries,
  }) : entries = List.unmodifiable(entries);

  final List<Sub2ApiAdminGroupRateMultiplierInput> entries;
}

final class Sub2ApiAdminGroupRpmOverrideInput {
  const Sub2ApiAdminGroupRpmOverrideInput({
    required this.userId,
    this.rpmOverride,
  });

  final int userId;
  final int? rpmOverride;
}

final class Sub2ApiAdminSetGroupRpmOverridesRequest {
  Sub2ApiAdminSetGroupRpmOverridesRequest({
    required List<Sub2ApiAdminGroupRpmOverrideInput> entries,
  }) : entries = List.unmodifiable(entries);

  final List<Sub2ApiAdminGroupRpmOverrideInput> entries;
}

final class Sub2ApiAdminGroupActionResult {
  const Sub2ApiAdminGroupActionResult({required this.message});

  final String message;
}

sealed class Sub2ApiAdminLimitUpdate {
  const Sub2ApiAdminLimitUpdate();

  const factory Sub2ApiAdminLimitUpdate.unchanged() =
      Sub2ApiAdminLimitUnchanged;
  const factory Sub2ApiAdminLimitUpdate.clear() = Sub2ApiAdminLimitClear;
  const factory Sub2ApiAdminLimitUpdate.set(Sub2ApiDecimal value) =
      Sub2ApiAdminLimitSet;
}

final class Sub2ApiAdminLimitUnchanged extends Sub2ApiAdminLimitUpdate {
  const Sub2ApiAdminLimitUnchanged();
}

final class Sub2ApiAdminLimitClear extends Sub2ApiAdminLimitUpdate {
  const Sub2ApiAdminLimitClear();
}

final class Sub2ApiAdminLimitSet extends Sub2ApiAdminLimitUpdate {
  const Sub2ApiAdminLimitSet(this.value);

  final Sub2ApiDecimal value;
}

final class Sub2ApiAdminCreateGroupRequest {
  Sub2ApiAdminCreateGroupRequest({
    required this.name,
    this.description = '',
    this.platform,
    this.rateMultiplier,
    this.isExclusive = false,
    this.subscriptionType,
    this.dailyLimitUsd,
    this.weeklyLimitUsd,
    this.monthlyLimitUsd,
    this.longContextPricingEnabled = false,
    List<Sub2ApiAdminModelPricing> modelPricing = const [],
    this.allowImageGeneration = false,
    this.allowBatchImageGeneration = false,
    this.imageRateIndependent = false,
    this.imageRateMultiplier,
    this.batchImageDiscountMultiplier,
    this.batchImageHoldMultiplier,
    this.videoRateIndependent = false,
    this.videoRateMultiplier,
    this.peakRateEnabled = false,
    this.peakStart = '',
    this.peakEnd = '',
    this.peakRateMultiplier,
    this.profitControlEnabled = false,
    this.profitMinMargin,
    this.profitSafetyBuffer,
    this.imagePrice1k,
    this.imagePrice2k,
    this.imagePrice4k,
    this.videoPrice480p,
    this.videoPrice720p,
    this.videoPrice1080p,
    Map<String, Map<String, Sub2ApiDecimal>> videoModelPrices = const {},
    this.webSearchPricePerCall,
    this.searchPricePer1k,
    this.audioRealtimePricePerMin,
    this.audioTtsPricePerMillionChars,
    this.audioSttPricePerHour,
    this.claudeCodeOnly = false,
    this.fallbackGroupId,
    this.fallbackGroupIdOnInvalidRequest,
    Map<String, List<int>> modelRouting = const {},
    this.modelRoutingEnabled = false,
    this.mcpXmlInject,
    List<String> supportedModelScopes = const [],
    this.allowMessagesDispatch = false,
    this.allowLive = false,
    this.requireOAuthOnly = false,
    this.requirePrivacySet = false,
    this.defaultMappedModel = '',
    Sub2ApiAdminMessagesDispatchModelConfig? messagesDispatchModelConfig,
    Sub2ApiAdminGroupModelsListConfig? modelsListConfig,
    this.rpmLimit = 0,
    this.maxReasoningEffort = '',
    List<Sub2ApiAdminReasoningEffortMapping> reasoningEffortMappings = const [],
    List<int> copyAccountsFromGroupIds = const [],
  }) : modelPricing = List.unmodifiable(modelPricing),
       videoModelPrices = Map.unmodifiable(
         videoModelPrices.map(
           (key, value) =>
               MapEntry(key, Map<String, Sub2ApiDecimal>.unmodifiable(value)),
         ),
       ),
       modelRouting = Map.unmodifiable(
         modelRouting.map(
           (key, value) => MapEntry(key, List<int>.unmodifiable(value)),
         ),
       ),
       supportedModelScopes = List.unmodifiable(supportedModelScopes),
       messagesDispatchModelConfig =
           messagesDispatchModelConfig ??
           Sub2ApiAdminMessagesDispatchModelConfig(
             opusMappedModel: '',
             sonnetMappedModel: '',
             haikuMappedModel: '',
             exactModelMappings: const {},
           ),
       modelsListConfig =
           modelsListConfig ??
           Sub2ApiAdminGroupModelsListConfig(enabled: false, models: const []),
       reasoningEffortMappings = List.unmodifiable(reasoningEffortMappings),
       copyAccountsFromGroupIds = List.unmodifiable(copyAccountsFromGroupIds);

  final String name;
  final String description;
  final Sub2ApiAdminGroupPlatform? platform;
  final Sub2ApiDecimal? rateMultiplier;
  final bool isExclusive;
  final Sub2ApiAdminGroupSubscriptionType? subscriptionType;
  final Sub2ApiDecimal? dailyLimitUsd;
  final Sub2ApiDecimal? weeklyLimitUsd;
  final Sub2ApiDecimal? monthlyLimitUsd;
  final bool longContextPricingEnabled;
  final List<Sub2ApiAdminModelPricing> modelPricing;
  final bool allowImageGeneration;
  final bool allowBatchImageGeneration;
  final bool imageRateIndependent;
  final Sub2ApiDecimal? imageRateMultiplier;
  final Sub2ApiDecimal? batchImageDiscountMultiplier;
  final Sub2ApiDecimal? batchImageHoldMultiplier;
  final bool videoRateIndependent;
  final Sub2ApiDecimal? videoRateMultiplier;
  final bool peakRateEnabled;
  final String peakStart;
  final String peakEnd;
  final Sub2ApiDecimal? peakRateMultiplier;
  final bool profitControlEnabled;
  final Sub2ApiDecimal? profitMinMargin;
  final Sub2ApiDecimal? profitSafetyBuffer;
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
  final Map<String, List<int>> modelRouting;
  final bool modelRoutingEnabled;
  final bool? mcpXmlInject;
  final List<String> supportedModelScopes;
  final bool allowMessagesDispatch;
  final bool allowLive;
  final bool requireOAuthOnly;
  final bool requirePrivacySet;
  final String defaultMappedModel;
  final Sub2ApiAdminMessagesDispatchModelConfig messagesDispatchModelConfig;
  final Sub2ApiAdminGroupModelsListConfig modelsListConfig;
  final int rpmLimit;
  final String maxReasoningEffort;
  final List<Sub2ApiAdminReasoningEffortMapping> reasoningEffortMappings;
  final List<int> copyAccountsFromGroupIds;
}

final class Sub2ApiAdminUpdateGroupRequest {
  Sub2ApiAdminUpdateGroupRequest({
    this.name,
    this.description,
    this.platform,
    this.rateMultiplier,
    this.isExclusive,
    this.status,
    this.subscriptionType,
    this.dailyLimitUsd = const Sub2ApiAdminLimitUpdate.unchanged(),
    this.weeklyLimitUsd = const Sub2ApiAdminLimitUpdate.unchanged(),
    this.monthlyLimitUsd = const Sub2ApiAdminLimitUpdate.unchanged(),
    this.longContextPricingEnabled,
    List<Sub2ApiAdminModelPricing>? modelPricing,
    this.allowImageGeneration,
    this.allowBatchImageGeneration,
    this.imageRateIndependent,
    this.imageRateMultiplier,
    this.batchImageDiscountMultiplier,
    this.batchImageHoldMultiplier,
    this.videoRateIndependent,
    this.videoRateMultiplier,
    this.peakRateEnabled,
    this.peakStart,
    this.peakEnd,
    this.peakRateMultiplier,
    this.profitControlEnabled,
    this.profitMinMargin,
    this.profitSafetyBuffer,
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
    this.claudeCodeOnly,
    this.fallbackGroupId,
    this.fallbackGroupIdOnInvalidRequest,
    Map<String, List<int>>? modelRouting,
    this.modelRoutingEnabled,
    this.mcpXmlInject,
    List<String>? supportedModelScopes,
    this.allowMessagesDispatch,
    this.allowLive,
    this.requireOAuthOnly,
    this.requirePrivacySet,
    this.defaultMappedModel,
    this.messagesDispatchModelConfig,
    this.modelsListConfig,
    this.rpmLimit,
    this.maxReasoningEffort,
    List<Sub2ApiAdminReasoningEffortMapping>? reasoningEffortMappings,
    List<int>? copyAccountsFromGroupIds,
  }) : modelPricing = modelPricing == null
           ? null
           : List.unmodifiable(modelPricing),
       videoModelPrices = videoModelPrices == null
           ? null
           : Map.unmodifiable(
               videoModelPrices.map(
                 (key, value) => MapEntry(
                   key,
                   Map<String, Sub2ApiDecimal>.unmodifiable(value),
                 ),
               ),
             ),
       modelRouting = modelRouting == null
           ? null
           : Map.unmodifiable(
               modelRouting.map(
                 (key, value) => MapEntry(key, List<int>.unmodifiable(value)),
               ),
             ),
       supportedModelScopes = supportedModelScopes == null
           ? null
           : List.unmodifiable(supportedModelScopes),
       reasoningEffortMappings = reasoningEffortMappings == null
           ? null
           : List.unmodifiable(reasoningEffortMappings),
       copyAccountsFromGroupIds = copyAccountsFromGroupIds == null
           ? null
           : List.unmodifiable(copyAccountsFromGroupIds);

  final String? name;
  final String? description;
  final Sub2ApiAdminGroupPlatform? platform;
  final Sub2ApiDecimal? rateMultiplier;
  final bool? isExclusive;
  final Sub2ApiAdminGroupStatus? status;
  final Sub2ApiAdminGroupSubscriptionType? subscriptionType;
  final Sub2ApiAdminLimitUpdate dailyLimitUsd;
  final Sub2ApiAdminLimitUpdate weeklyLimitUsd;
  final Sub2ApiAdminLimitUpdate monthlyLimitUsd;
  final bool? longContextPricingEnabled;
  final List<Sub2ApiAdminModelPricing>? modelPricing;
  final bool? allowImageGeneration;
  final bool? allowBatchImageGeneration;
  final bool? imageRateIndependent;
  final Sub2ApiDecimal? imageRateMultiplier;
  final Sub2ApiDecimal? batchImageDiscountMultiplier;
  final Sub2ApiDecimal? batchImageHoldMultiplier;
  final bool? videoRateIndependent;
  final Sub2ApiDecimal? videoRateMultiplier;
  final bool? peakRateEnabled;
  final String? peakStart;
  final String? peakEnd;
  final Sub2ApiDecimal? peakRateMultiplier;
  final bool? profitControlEnabled;
  final Sub2ApiDecimal? profitMinMargin;
  final Sub2ApiDecimal? profitSafetyBuffer;
  final Sub2ApiDecimal? imagePrice1k;
  final Sub2ApiDecimal? imagePrice2k;
  final Sub2ApiDecimal? imagePrice4k;
  final Sub2ApiDecimal? videoPrice480p;
  final Sub2ApiDecimal? videoPrice720p;
  final Sub2ApiDecimal? videoPrice1080p;
  final Map<String, Map<String, Sub2ApiDecimal>>? videoModelPrices;
  final Sub2ApiDecimal? webSearchPricePerCall;
  final Sub2ApiDecimal? searchPricePer1k;
  final Sub2ApiDecimal? audioRealtimePricePerMin;
  final Sub2ApiDecimal? audioTtsPricePerMillionChars;
  final Sub2ApiDecimal? audioSttPricePerHour;
  final bool? claudeCodeOnly;
  final int? fallbackGroupId;
  final int? fallbackGroupIdOnInvalidRequest;
  final Map<String, List<int>>? modelRouting;
  final bool? modelRoutingEnabled;
  final bool? mcpXmlInject;
  final List<String>? supportedModelScopes;
  final bool? allowMessagesDispatch;
  final bool? allowLive;
  final bool? requireOAuthOnly;
  final bool? requirePrivacySet;
  final String? defaultMappedModel;
  final Sub2ApiAdminMessagesDispatchModelConfig? messagesDispatchModelConfig;
  final Sub2ApiAdminGroupModelsListConfig? modelsListConfig;
  final int? rpmLimit;
  final String? maxReasoningEffort;
  final List<Sub2ApiAdminReasoningEffortMapping>? reasoningEffortMappings;
  final List<int>? copyAccountsFromGroupIds;
}
