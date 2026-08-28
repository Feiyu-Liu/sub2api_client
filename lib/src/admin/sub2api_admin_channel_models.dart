import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';
import 'sub2api_admin_user_models.dart';

typedef Sub2ApiAdminChannelPage = Sub2ApiPage<Sub2ApiAdminChannel>;

enum Sub2ApiAdminChannelStatus { active, disabled }

enum Sub2ApiAdminChannelBillingModelSource {
  requested,
  upstream,
  channelMapped,
  responseModel,
}

enum Sub2ApiAdminChannelBillingMode { token, perRequest, image }

enum Sub2ApiAdminChannelSortField { id, name, status, createdAt }

enum Sub2ApiAdminChannelSortOrder { ascending, descending }

enum Sub2ApiAdminChannelPricingPlatform {
  anthropic,
  openAi,
  gemini,
  antigravity,
  grok,
  kimi,
  zhipu,
  deepseek,
}

final class Sub2ApiAdminChannelListQuery {
  const Sub2ApiAdminChannelListQuery({
    this.page,
    this.pageSize,
    this.status,
    this.search,
    this.sortBy,
    this.sortOrder,
  });

  final int? page;
  final int? pageSize;
  final Sub2ApiAdminChannelStatus? status;
  final String? search;
  final Sub2ApiAdminChannelSortField? sortBy;
  final Sub2ApiAdminChannelSortOrder? sortOrder;
}

final class Sub2ApiAdminChannel {
  Sub2ApiAdminChannel({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.billingModelSource,
    required this.restrictModels,
    required this.features,
    required this.featuresConfig,
    required List<int> groupIds,
    required List<Sub2ApiAdminChannelModelPricing> modelPricing,
    required Map<String, Map<String, String>> modelMapping,
    required this.applyPricingToAccountStats,
    required List<Sub2ApiAdminChannelAccountStatsPricingRule>
    accountStatsPricingRules,
    required this.createdAt,
    required this.updatedAt,
  }) : groupIds = List.unmodifiable(groupIds),
       modelPricing = List.unmodifiable(modelPricing),
       modelMapping = _nestedStringMap(modelMapping),
       accountStatsPricingRules = List.unmodifiable(accountStatsPricingRules);

  final int id;
  final String name;
  final String description;
  final Sub2ApiAdminChannelStatus status;
  final Sub2ApiAdminChannelBillingModelSource billingModelSource;
  final bool restrictModels;
  final String features;
  final Sub2ApiAdminJsonObject? featuresConfig;
  final List<int> groupIds;
  final List<Sub2ApiAdminChannelModelPricing> modelPricing;
  final Map<String, Map<String, String>> modelMapping;
  final bool applyPricingToAccountStats;
  final List<Sub2ApiAdminChannelAccountStatsPricingRule>
  accountStatsPricingRules;
  final DateTime createdAt;
  final DateTime updatedAt;
}

final class Sub2ApiAdminChannelModelPricing {
  Sub2ApiAdminChannelModelPricing({
    required this.id,
    required this.platform,
    required List<String> models,
    required this.billingMode,
    required List<Sub2ApiAdminChannelPricingInterval> intervals,
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
  }) : models = List.unmodifiable(models),
       intervals = List.unmodifiable(intervals);

  final int id;
  final String platform;
  final List<String> models;
  final Sub2ApiAdminChannelBillingMode billingMode;
  final Sub2ApiDecimal? inputPrice;
  final Sub2ApiDecimal? outputPrice;
  final Sub2ApiDecimal? cacheWritePrice;
  final Sub2ApiDecimal? cacheReadPrice;
  final Sub2ApiDecimal? fastMultiplier;
  final Sub2ApiDecimal? flexMultiplier;
  final Sub2ApiDecimal? imageInputPrice;
  final Sub2ApiDecimal? imageOutputPrice;
  final Sub2ApiDecimal? perRequestPrice;
  final List<Sub2ApiAdminChannelPricingInterval> intervals;
  final Sub2ApiAdminChannelTimePricing? timePricing;
}

final class Sub2ApiAdminChannelPricingInterval {
  const Sub2ApiAdminChannelPricingInterval({
    required this.id,
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
  });

  final int id;
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
}

final class Sub2ApiAdminChannelTimePricing {
  Sub2ApiAdminChannelTimePricing({
    required this.timezone,
    required this.weekdaysOnly,
    required List<Sub2ApiAdminChannelTimePricingPeriod> periods,
  }) : periods = List.unmodifiable(periods);

  final String timezone;
  final bool weekdaysOnly;
  final List<Sub2ApiAdminChannelTimePricingPeriod> periods;
}

final class Sub2ApiAdminChannelTimePricingPeriod {
  const Sub2ApiAdminChannelTimePricingPeriod({
    required this.startTime,
    required this.endTime,
    required this.multiplier,
  });

  final String startTime;
  final String endTime;
  final Sub2ApiDecimal multiplier;
}

final class Sub2ApiAdminChannelAccountStatsPricingRule {
  Sub2ApiAdminChannelAccountStatsPricingRule({
    required this.id,
    required this.name,
    required List<int> groupIds,
    required List<int> accountIds,
    required List<Sub2ApiAdminChannelModelPricing> pricing,
  }) : groupIds = List.unmodifiable(groupIds),
       accountIds = List.unmodifiable(accountIds),
       pricing = List.unmodifiable(pricing);

  final int id;
  final String name;
  final List<int> groupIds;
  final List<int> accountIds;
  final List<Sub2ApiAdminChannelModelPricing> pricing;
}

final class Sub2ApiAdminChannelModelPricingInput {
  Sub2ApiAdminChannelModelPricingInput({
    required List<String> models,
    this.platform,
    this.billingMode = Sub2ApiAdminChannelBillingMode.token,
    this.inputPrice,
    this.outputPrice,
    this.cacheWritePrice,
    this.cacheReadPrice,
    this.fastMultiplier,
    this.flexMultiplier,
    this.imageInputPrice,
    this.imageOutputPrice,
    this.perRequestPrice,
    List<Sub2ApiAdminChannelPricingIntervalInput> intervals = const [],
    this.timePricing,
  }) : models = List.unmodifiable(models),
       intervals = List.unmodifiable(intervals);

  final String? platform;
  final List<String> models;
  final Sub2ApiAdminChannelBillingMode billingMode;
  final Sub2ApiDecimal? inputPrice;
  final Sub2ApiDecimal? outputPrice;
  final Sub2ApiDecimal? cacheWritePrice;
  final Sub2ApiDecimal? cacheReadPrice;
  final Sub2ApiDecimal? fastMultiplier;
  final Sub2ApiDecimal? flexMultiplier;
  final Sub2ApiDecimal? imageInputPrice;
  final Sub2ApiDecimal? imageOutputPrice;
  final Sub2ApiDecimal? perRequestPrice;
  final List<Sub2ApiAdminChannelPricingIntervalInput> intervals;
  final Sub2ApiAdminChannelTimePricingInput? timePricing;
}

final class Sub2ApiAdminChannelPricingIntervalInput {
  const Sub2ApiAdminChannelPricingIntervalInput({
    required this.minTokens,
    this.maxTokens,
    this.tierLabel = '',
    this.inputPrice,
    this.outputPrice,
    this.cacheWritePrice,
    this.cacheReadPrice,
    this.inputMultiplier,
    this.outputMultiplier,
    this.cacheWriteMultiplier,
    this.cacheReadMultiplier,
    this.perRequestPrice,
    this.sortOrder = 0,
  });

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
}

final class Sub2ApiAdminChannelTimePricingInput {
  Sub2ApiAdminChannelTimePricingInput({
    required this.timezone,
    required List<Sub2ApiAdminChannelTimePricingPeriod> periods,
    this.weekdaysOnly = false,
  }) : periods = List.unmodifiable(periods);

  final String timezone;
  final bool weekdaysOnly;
  final List<Sub2ApiAdminChannelTimePricingPeriod> periods;
}

final class Sub2ApiAdminChannelAccountStatsPricingRuleInput {
  Sub2ApiAdminChannelAccountStatsPricingRuleInput({
    required this.name,
    required List<int> groupIds,
    required List<int> accountIds,
    required List<Sub2ApiAdminChannelModelPricingInput> pricing,
  }) : groupIds = List.unmodifiable(groupIds),
       accountIds = List.unmodifiable(accountIds),
       pricing = List.unmodifiable(pricing);

  final String name;
  final List<int> groupIds;
  final List<int> accountIds;
  final List<Sub2ApiAdminChannelModelPricingInput> pricing;
}

final class Sub2ApiAdminCreateChannelRequest {
  Sub2ApiAdminCreateChannelRequest({
    required this.name,
    this.description = '',
    List<int> groupIds = const [],
    List<Sub2ApiAdminChannelModelPricingInput> modelPricing = const [],
    Map<String, Map<String, String>> modelMapping = const {},
    this.billingModelSource,
    this.restrictModels = false,
    this.features = '',
    this.featuresConfig,
    this.applyPricingToAccountStats = false,
    List<Sub2ApiAdminChannelAccountStatsPricingRuleInput>
        accountStatsPricingRules =
        const [],
  }) : groupIds = List.unmodifiable(groupIds),
       modelPricing = List.unmodifiable(modelPricing),
       modelMapping = _nestedStringMap(modelMapping),
       accountStatsPricingRules = List.unmodifiable(accountStatsPricingRules);

  final String name;
  final String description;
  final List<int> groupIds;
  final List<Sub2ApiAdminChannelModelPricingInput> modelPricing;
  final Map<String, Map<String, String>> modelMapping;
  final Sub2ApiAdminChannelBillingModelSource? billingModelSource;
  final bool restrictModels;
  final String features;
  final Sub2ApiAdminJsonObject? featuresConfig;
  final bool applyPricingToAccountStats;
  final List<Sub2ApiAdminChannelAccountStatsPricingRuleInput>
  accountStatsPricingRules;
}

final class Sub2ApiAdminUpdateChannelRequest {
  Sub2ApiAdminUpdateChannelRequest({
    this.name,
    this.description,
    this.status,
    List<int>? groupIds,
    List<Sub2ApiAdminChannelModelPricingInput>? modelPricing,
    Map<String, Map<String, String>>? modelMapping,
    this.billingModelSource,
    this.restrictModels,
    this.features,
    this.featuresConfig,
    this.applyPricingToAccountStats,
    List<Sub2ApiAdminChannelAccountStatsPricingRuleInput>?
    accountStatsPricingRules,
  }) : groupIds = groupIds == null ? null : List.unmodifiable(groupIds),
       modelPricing = modelPricing == null
           ? null
           : List.unmodifiable(modelPricing),
       modelMapping = modelMapping == null
           ? null
           : _nestedStringMap(modelMapping),
       accountStatsPricingRules = accountStatsPricingRules == null
           ? null
           : List.unmodifiable(accountStatsPricingRules);

  final String? name;
  final String? description;
  final Sub2ApiAdminChannelStatus? status;
  final List<int>? groupIds;
  final List<Sub2ApiAdminChannelModelPricingInput>? modelPricing;
  final Map<String, Map<String, String>>? modelMapping;
  final Sub2ApiAdminChannelBillingModelSource? billingModelSource;
  final bool? restrictModels;
  final String? features;
  final Sub2ApiAdminJsonObject? featuresConfig;
  final bool? applyPricingToAccountStats;
  final List<Sub2ApiAdminChannelAccountStatsPricingRuleInput>?
  accountStatsPricingRules;
}

final class Sub2ApiAdminChannelDefaultPricing {
  const Sub2ApiAdminChannelDefaultPricing({
    required this.found,
    this.inputPrice,
    this.outputPrice,
    this.cacheWritePrice,
    this.cacheReadPrice,
    this.imageInputPrice,
    this.imageOutputPrice,
  });

  final bool found;
  final Sub2ApiDecimal? inputPrice;
  final Sub2ApiDecimal? outputPrice;
  final Sub2ApiDecimal? cacheWritePrice;
  final Sub2ApiDecimal? cacheReadPrice;
  final Sub2ApiDecimal? imageInputPrice;
  final Sub2ApiDecimal? imageOutputPrice;
}

final class Sub2ApiAdminChannelPricingModels {
  Sub2ApiAdminChannelPricingModels({required List<String> models})
    : models = List.unmodifiable(models);

  final List<String> models;
}

final class Sub2ApiAdminDeleteChannelResult {
  const Sub2ApiAdminDeleteChannelResult({required this.message});

  final String message;
}

Map<String, Map<String, String>> _nestedStringMap(
  Map<String, Map<String, String>> source,
) => Map.unmodifiable(
  source.map(
    (key, value) => MapEntry(key, Map<String, String>.unmodifiable(value)),
  ),
);
