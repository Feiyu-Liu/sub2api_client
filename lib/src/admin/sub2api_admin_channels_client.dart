import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_channel_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'wire/admin_channel_wire_mapper.dart';
import 'wire/admin_channel_wire_service.dart';

abstract interface class Sub2ApiAdminChannelsClient {
  Future<Sub2ApiAdminChannelPage> list({
    Sub2ApiAdminChannelListQuery query = const Sub2ApiAdminChannelListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminChannel> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminChannel> create(
    Sub2ApiAdminCreateChannelRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminChannel> update(
    int id,
    Sub2ApiAdminUpdateChannelRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminDeleteChannelResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminChannelDefaultPricing> getDefaultPricing(
    String model, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminChannelPricingModels> syncPricingModels(
    Sub2ApiAdminChannelPricingPlatform platform, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminChannelsClient createSub2ApiAdminChannelsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminChannelsClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminChannelWireService(dio);

  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminChannelWireService _service;

  @override
  Future<Sub2ApiAdminChannelPage> list({
    Sub2ApiAdminChannelListQuery query = const Sub2ApiAdminChannelListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _page(query.page, query.pageSize);
    final search = query.search?.trim();
    if (search != null && search.runes.length > 100) {
      throw _validation('admin.channels.search_too_long');
    }
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.list(
        <String, dynamic>{
          if (query.page != null) 'page': query.page,
          if (query.pageSize != null) 'page_size': query.pageSize,
          if (query.status != null) 'status': query.status!.name,
          if (search != null && search.isNotEmpty) 'search': search,
          if (query.sortBy != null) 'sort_by': _sortField(query.sortBy!),
          if (query.sortOrder != null)
            'sort_order':
                query.sortOrder == Sub2ApiAdminChannelSortOrder.ascending
                ? 'asc'
                : 'desc',
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminChannelPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminChannel> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.get(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminChannel,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminChannel> create(
    Sub2ApiAdminCreateChannelRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _createBody(request);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.create(
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminChannel,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminChannel> update(
    int id,
    Sub2ApiAdminUpdateChannelRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    final body = _updateBody(request);
    if (body.isEmpty) throw _validation('admin.channels.empty_update');
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.update(
        id,
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminChannel,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminDeleteChannelResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.delete(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminDeleteChannelResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminChannelDefaultPricing> getDefaultPricing(
    String model, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final normalized = model.trim();
    if (normalized.isEmpty) {
      throw _validation('admin.channels.model_required');
    }
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.modelPricing(
        normalized,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminChannelDefaultPricing,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminChannelPricingModels> syncPricingModels(
    Sub2ApiAdminChannelPricingPlatform platform, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, credential) => _service.syncModels(
      _pricingPlatform(platform),
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminChannelPricingModels,
    requestOptions: requestOptions,
  );

  String? _authorization(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

Map<String, Object?> _createBody(Sub2ApiAdminCreateChannelRequest request) {
  final name = _name(request.name);
  _ids(request.groupIds, 'group_id');
  _pricingList(request.modelPricing, allowMultipliers: true);
  _modelMapping(request.modelMapping);
  _rules(request.accountStatsPricingRules);
  return <String, Object?>{
    'name': name,
    'description': request.description.trim(),
    'group_ids': request.groupIds,
    'model_pricing': request.modelPricing.map(_pricingBody).toList(),
    'model_mapping': request.modelMapping,
    if (request.billingModelSource != null)
      'billing_model_source': _billingSource(request.billingModelSource!),
    'restrict_models': request.restrictModels,
    'features': request.features,
    if (request.featuresConfig != null)
      'features_config': request.featuresConfig!.toWire(),
    'apply_pricing_to_account_stats': request.applyPricingToAccountStats,
    'account_stats_pricing_rules': request.accountStatsPricingRules
        .map(_ruleBody)
        .toList(),
  };
}

Map<String, Object?> _updateBody(Sub2ApiAdminUpdateChannelRequest request) {
  if (request.name != null) _name(request.name!);
  if (request.groupIds != null) _ids(request.groupIds!, 'group_id');
  if (request.modelPricing != null) {
    _pricingList(request.modelPricing!, allowMultipliers: true);
  }
  if (request.modelMapping != null) _modelMapping(request.modelMapping!);
  if (request.accountStatsPricingRules != null) {
    _rules(request.accountStatsPricingRules!);
  }
  return <String, Object?>{
    if (request.name != null) 'name': request.name!.trim(),
    if (request.description != null) 'description': request.description!.trim(),
    if (request.status != null) 'status': request.status!.name,
    if (request.groupIds != null) 'group_ids': request.groupIds,
    if (request.modelPricing != null)
      'model_pricing': request.modelPricing!.map(_pricingBody).toList(),
    if (request.modelMapping != null) 'model_mapping': request.modelMapping,
    if (request.billingModelSource != null)
      'billing_model_source': _billingSource(request.billingModelSource!),
    if (request.restrictModels != null)
      'restrict_models': request.restrictModels,
    if (request.features != null) 'features': request.features,
    if (request.featuresConfig != null)
      'features_config': request.featuresConfig!.toWire(),
    if (request.applyPricingToAccountStats != null)
      'apply_pricing_to_account_stats': request.applyPricingToAccountStats,
    if (request.accountStatsPricingRules != null)
      'account_stats_pricing_rules': request.accountStatsPricingRules!
          .map(_ruleBody)
          .toList(),
  };
}

Map<String, Object?> _pricingBody(
  Sub2ApiAdminChannelModelPricingInput pricing,
) => <String, Object?>{
  if (pricing.platform != null) 'platform': pricing.platform!.trim(),
  'models': pricing.models.map((model) => model.trim()).toList(),
  'billing_mode': _billingMode(pricing.billingMode),
  if (pricing.inputPrice != null) 'input_price': _decimal(pricing.inputPrice!),
  if (pricing.outputPrice != null)
    'output_price': _decimal(pricing.outputPrice!),
  if (pricing.cacheWritePrice != null)
    'cache_write_price': _decimal(pricing.cacheWritePrice!),
  if (pricing.cacheReadPrice != null)
    'cache_read_price': _decimal(pricing.cacheReadPrice!),
  if (pricing.fastMultiplier != null)
    'fast_multiplier': _decimal(pricing.fastMultiplier!),
  if (pricing.flexMultiplier != null)
    'flex_multiplier': _decimal(pricing.flexMultiplier!),
  if (pricing.imageInputPrice != null)
    'image_input_price': _decimal(pricing.imageInputPrice!),
  if (pricing.imageOutputPrice != null)
    'image_output_price': _decimal(pricing.imageOutputPrice!),
  if (pricing.perRequestPrice != null)
    'per_request_price': _decimal(pricing.perRequestPrice!),
  'intervals': pricing.intervals.map(_intervalBody).toList(),
  if (pricing.timePricing != null)
    'time_pricing': <String, Object?>{
      'timezone': pricing.timePricing!.timezone.trim(),
      'weekdays_only': pricing.timePricing!.weekdaysOnly,
      'periods': pricing.timePricing!.periods
          .map(
            (period) => <String, Object?>{
              'start_time': period.startTime.trim(),
              'end_time': period.endTime.trim(),
              'multiplier': _decimal(period.multiplier),
            },
          )
          .toList(),
    },
};

Map<String, Object?> _intervalBody(
  Sub2ApiAdminChannelPricingIntervalInput interval,
) => <String, Object?>{
  'min_tokens': interval.minTokens,
  'max_tokens': interval.maxTokens,
  'tier_label': interval.tierLabel.trim(),
  if (interval.inputPrice != null)
    'input_price': _decimal(interval.inputPrice!),
  if (interval.outputPrice != null)
    'output_price': _decimal(interval.outputPrice!),
  if (interval.cacheWritePrice != null)
    'cache_write_price': _decimal(interval.cacheWritePrice!),
  if (interval.cacheReadPrice != null)
    'cache_read_price': _decimal(interval.cacheReadPrice!),
  if (interval.inputMultiplier != null)
    'input_multiplier': _decimal(interval.inputMultiplier!),
  if (interval.outputMultiplier != null)
    'output_multiplier': _decimal(interval.outputMultiplier!),
  if (interval.cacheWriteMultiplier != null)
    'cache_write_multiplier': _decimal(interval.cacheWriteMultiplier!),
  if (interval.cacheReadMultiplier != null)
    'cache_read_multiplier': _decimal(interval.cacheReadMultiplier!),
  if (interval.perRequestPrice != null)
    'per_request_price': _decimal(interval.perRequestPrice!),
  'sort_order': interval.sortOrder,
};

Map<String, Object?> _ruleBody(
  Sub2ApiAdminChannelAccountStatsPricingRuleInput rule,
) => <String, Object?>{
  'name': rule.name.trim(),
  'group_ids': rule.groupIds,
  'account_ids': rule.accountIds,
  'pricing': rule.pricing.map(_pricingBody).toList(),
};

void _pricingList(
  List<Sub2ApiAdminChannelModelPricingInput> values, {
  required bool allowMultipliers,
}) {
  for (final pricing in values) {
    final platform = pricing.platform?.trim();
    if (platform != null && (platform.isEmpty || platform.length > 50)) {
      throw _validation('admin.channels.invalid_platform');
    }
    if (pricing.models.isEmpty || pricing.models.length > 100) {
      throw _validation('admin.channels.invalid_models');
    }
    if (pricing.models.any((model) => model.trim().isEmpty)) {
      throw _validation('admin.channels.invalid_model');
    }
    _nonNegative(pricing.inputPrice, 'input_price');
    _nonNegative(pricing.outputPrice, 'output_price');
    _nonNegative(pricing.cacheWritePrice, 'cache_write_price');
    _nonNegative(pricing.cacheReadPrice, 'cache_read_price');
    _nonNegative(pricing.imageInputPrice, 'image_input_price');
    _nonNegative(pricing.imageOutputPrice, 'image_output_price');
    _nonNegative(pricing.perRequestPrice, 'per_request_price');
    if (allowMultipliers) {
      _positive(pricing.fastMultiplier, 'fast_multiplier');
      _positive(pricing.flexMultiplier, 'flex_multiplier');
    } else if (pricing.fastMultiplier != null ||
        pricing.flexMultiplier != null) {
      throw _validation('admin.channels.pricing_rule_multiplier_unsupported');
    }
    for (final interval in pricing.intervals) {
      if (interval.minTokens < 0 ||
          (interval.maxTokens != null &&
              interval.maxTokens! <= interval.minTokens)) {
        throw _validation('admin.channels.invalid_interval');
      }
      _nonNegative(interval.inputPrice, 'interval_input_price');
      _nonNegative(interval.outputPrice, 'interval_output_price');
      _nonNegative(interval.cacheWritePrice, 'interval_cache_write_price');
      _nonNegative(interval.cacheReadPrice, 'interval_cache_read_price');
      _nonNegative(interval.perRequestPrice, 'interval_per_request_price');
      if (allowMultipliers) {
        _positive(interval.inputMultiplier, 'interval_input_multiplier');
        _positive(interval.outputMultiplier, 'interval_output_multiplier');
        _positive(
          interval.cacheWriteMultiplier,
          'interval_cache_write_multiplier',
        );
        _positive(
          interval.cacheReadMultiplier,
          'interval_cache_read_multiplier',
        );
      } else if (interval.inputMultiplier != null ||
          interval.outputMultiplier != null ||
          interval.cacheWriteMultiplier != null ||
          interval.cacheReadMultiplier != null) {
        throw _validation('admin.channels.pricing_rule_multiplier_unsupported');
      }
    }
    final timePricing = pricing.timePricing;
    if (timePricing != null) {
      if (timePricing.timezone.trim().isEmpty) {
        throw _validation('admin.channels.timezone_required');
      }
      for (final period in timePricing.periods) {
        if (period.startTime.trim().isEmpty || period.endTime.trim().isEmpty) {
          throw _validation('admin.channels.invalid_time_period');
        }
        _positive(period.multiplier, 'time_multiplier');
      }
    }
  }
}

void _rules(List<Sub2ApiAdminChannelAccountStatsPricingRuleInput> rules) {
  for (final rule in rules) {
    if (rule.groupIds.isEmpty && rule.accountIds.isEmpty) {
      throw _validation('admin.channels.pricing_rule_empty_scope');
    }
    _ids(rule.groupIds, 'pricing_rule_group_id');
    _ids(rule.accountIds, 'pricing_rule_account_id');
    if (rule.pricing.isEmpty) {
      throw _validation('admin.channels.pricing_rule_empty_pricing');
    }
    _pricingList(rule.pricing, allowMultipliers: false);
  }
}

void _modelMapping(Map<String, Map<String, String>> mapping) {
  for (final platform in mapping.entries) {
    if (platform.key.trim().isEmpty ||
        platform.value.entries.any(
          (entry) => entry.key.trim().isEmpty || entry.value.trim().isEmpty,
        )) {
      throw _validation('admin.channels.invalid_model_mapping');
    }
  }
}

void _page(int? page, int? pageSize) {
  if (page != null && page <= 0) {
    throw _validation('admin.channels.invalid_page');
  }
  if (pageSize != null && (pageSize <= 0 || pageSize > 1000)) {
    throw _validation('admin.channels.invalid_page_size');
  }
}

void _id(int value) {
  if (value <= 0) throw _validation('admin.channels.invalid_id');
}

void _ids(List<int> values, String field) {
  if (values.any((value) => value <= 0)) {
    throw _validation('admin.channels.invalid_$field');
  }
}

String _name(String value) {
  final normalized = value.trim();
  if (normalized.isEmpty || normalized.runes.length > 100) {
    throw _validation('admin.channels.invalid_name');
  }
  return normalized;
}

void _nonNegative(Sub2ApiDecimal? value, String field) {
  if (value != null && value.compareTo(Sub2ApiDecimal.zero()) < 0) {
    throw _validation('admin.channels.negative_$field');
  }
}

void _positive(Sub2ApiDecimal? value, String field) {
  if (value != null && value.compareTo(Sub2ApiDecimal.zero()) <= 0) {
    throw _validation('admin.channels.non_positive_$field');
  }
}

num _decimal(Sub2ApiDecimal value) => num.parse(value.toJson());

String _billingMode(Sub2ApiAdminChannelBillingMode value) => switch (value) {
  Sub2ApiAdminChannelBillingMode.token => 'token',
  Sub2ApiAdminChannelBillingMode.perRequest => 'per_request',
  Sub2ApiAdminChannelBillingMode.image => 'image',
};

String _billingSource(Sub2ApiAdminChannelBillingModelSource value) =>
    switch (value) {
      Sub2ApiAdminChannelBillingModelSource.requested => 'requested',
      Sub2ApiAdminChannelBillingModelSource.upstream => 'upstream',
      Sub2ApiAdminChannelBillingModelSource.channelMapped => 'channel_mapped',
      Sub2ApiAdminChannelBillingModelSource.responseModel => 'response_model',
    };

String _sortField(Sub2ApiAdminChannelSortField value) => switch (value) {
  Sub2ApiAdminChannelSortField.id => 'id',
  Sub2ApiAdminChannelSortField.name => 'name',
  Sub2ApiAdminChannelSortField.status => 'status',
  Sub2ApiAdminChannelSortField.createdAt => 'created_at',
};

String _pricingPlatform(Sub2ApiAdminChannelPricingPlatform value) =>
    value == Sub2ApiAdminChannelPricingPlatform.openAi ? 'openai' : value.name;

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
