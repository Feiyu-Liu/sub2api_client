import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_channel_models.dart';
import '../sub2api_admin_user_models.dart';

Sub2ApiAdminChannelPage mapAdminChannelPage(Object? data) => _map(() {
  final source = _object(data);
  return Sub2ApiPage<Sub2ApiAdminChannel>(
    items: _list(
      source,
      'items',
    ).map(_object).map(_channel).toList(growable: false),
    total: _nonNegativeInteger(source, 'total'),
    page: _positiveInteger(source, 'page'),
    pageSize: _positiveInteger(source, 'page_size'),
    pages: _positiveInteger(source, 'pages'),
  );
});

Sub2ApiAdminChannel mapAdminChannel(Object? data) =>
    _map(() => _channel(_object(data)));

Sub2ApiAdminChannelDefaultPricing mapAdminChannelDefaultPricing(Object? data) =>
    _map(() {
      final source = _object(data);
      final found = _boolean(source, 'found');
      return Sub2ApiAdminChannelDefaultPricing(
        found: found,
        inputPrice: _nullableDecimal(source, 'input_price'),
        outputPrice: _nullableDecimal(source, 'output_price'),
        cacheWritePrice: _nullableDecimal(source, 'cache_write_price'),
        cacheReadPrice: _nullableDecimal(source, 'cache_read_price'),
        imageInputPrice: _nullableDecimal(source, 'image_input_price'),
        imageOutputPrice: _nullableDecimal(source, 'image_output_price'),
      );
    });

Sub2ApiAdminChannelPricingModels mapAdminChannelPricingModels(Object? data) =>
    _map(() {
      final source = _object(data);
      return Sub2ApiAdminChannelPricingModels(
        models: _stringList(source['models']),
      );
    });

Sub2ApiAdminDeleteChannelResult mapAdminDeleteChannelResult(Object? data) =>
    _map(
      () => Sub2ApiAdminDeleteChannelResult(
        message: _nonEmptyString(_object(data), 'message'),
      ),
    );

Sub2ApiAdminChannel _channel(Map<String, Object?> source) =>
    Sub2ApiAdminChannel(
      id: _positiveInteger(source, 'id'),
      name: _nonEmptyString(source, 'name'),
      description: _string(source, 'description'),
      status: _status(_nonEmptyString(source, 'status')),
      billingModelSource: _billingModelSource(
        _nonEmptyString(source, 'billing_model_source'),
      ),
      restrictModels: _boolean(source, 'restrict_models'),
      features: _string(source, 'features'),
      featuresConfig: source['features_config'] == null
          ? null
          : _jsonObject(source['features_config']),
      groupIds: _positiveIntegerList(source['group_ids']),
      modelPricing: _list(
        source,
        'model_pricing',
      ).map(_object).map(_pricing).toList(growable: false),
      modelMapping: _nestedStringMap(source['model_mapping']),
      applyPricingToAccountStats: _boolean(
        source,
        'apply_pricing_to_account_stats',
      ),
      accountStatsPricingRules: _list(
        source,
        'account_stats_pricing_rules',
      ).map(_object).map(_accountStatsRule).toList(growable: false),
      createdAt: _dateTime(source, 'created_at'),
      updatedAt: _dateTime(source, 'updated_at'),
    );

Sub2ApiAdminChannelModelPricing _pricing(Map<String, Object?> source) =>
    Sub2ApiAdminChannelModelPricing(
      id: _positiveInteger(source, 'id'),
      platform: _nonEmptyString(source, 'platform'),
      models: _stringList(source['models'], requireNonEmpty: true),
      billingMode: _billingMode(_nonEmptyString(source, 'billing_mode')),
      inputPrice: _nullableDecimal(source, 'input_price'),
      outputPrice: _nullableDecimal(source, 'output_price'),
      cacheWritePrice: _nullableDecimal(source, 'cache_write_price'),
      cacheReadPrice: _nullableDecimal(source, 'cache_read_price'),
      fastMultiplier: _nullableDecimal(source, 'fast_multiplier'),
      flexMultiplier: _nullableDecimal(source, 'flex_multiplier'),
      imageInputPrice: _nullableDecimal(source, 'image_input_price'),
      imageOutputPrice: _nullableDecimal(source, 'image_output_price'),
      perRequestPrice: _nullableDecimal(source, 'per_request_price'),
      intervals: _list(
        source,
        'intervals',
      ).map(_object).map(_interval).toList(growable: false),
      timePricing: source['time_pricing'] == null
          ? null
          : _timePricing(_object(source['time_pricing'])),
    );

Sub2ApiAdminChannelPricingInterval _interval(Map<String, Object?> source) =>
    Sub2ApiAdminChannelPricingInterval(
      id: _positiveInteger(source, 'id'),
      minTokens: _nonNegativeInteger(source, 'min_tokens'),
      maxTokens: _nullableNonNegativeInteger(source, 'max_tokens'),
      tierLabel: _string(source, 'tier_label'),
      inputPrice: _nullableDecimal(source, 'input_price'),
      outputPrice: _nullableDecimal(source, 'output_price'),
      cacheWritePrice: _nullableDecimal(source, 'cache_write_price'),
      cacheReadPrice: _nullableDecimal(source, 'cache_read_price'),
      inputMultiplier: _nullableDecimal(source, 'input_multiplier'),
      outputMultiplier: _nullableDecimal(source, 'output_multiplier'),
      cacheWriteMultiplier: _nullableDecimal(source, 'cache_write_multiplier'),
      cacheReadMultiplier: _nullableDecimal(source, 'cache_read_multiplier'),
      perRequestPrice: _nullableDecimal(source, 'per_request_price'),
      sortOrder: _integer(source, 'sort_order'),
    );

Sub2ApiAdminChannelTimePricing _timePricing(Map<String, Object?> source) =>
    Sub2ApiAdminChannelTimePricing(
      timezone: _nonEmptyString(source, 'timezone'),
      weekdaysOnly: _boolean(source, 'weekdays_only'),
      periods: _list(source, 'periods')
          .map(_object)
          .map(
            (period) => Sub2ApiAdminChannelTimePricingPeriod(
              startTime: _nonEmptyString(period, 'start_time'),
              endTime: _nonEmptyString(period, 'end_time'),
              multiplier: _decimal(period, 'multiplier'),
            ),
          )
          .toList(growable: false),
    );

Sub2ApiAdminChannelAccountStatsPricingRule _accountStatsRule(
  Map<String, Object?> source,
) => Sub2ApiAdminChannelAccountStatsPricingRule(
  id: _positiveInteger(source, 'id'),
  name: _string(source, 'name'),
  groupIds: _positiveIntegerList(source['group_ids']),
  accountIds: _positiveIntegerList(source['account_ids']),
  pricing: _list(
    source,
    'pricing',
  ).map(_object).map(_pricing).toList(growable: false),
);

Sub2ApiAdminChannelStatus _status(String value) => switch (value) {
  'active' => Sub2ApiAdminChannelStatus.active,
  'disabled' => Sub2ApiAdminChannelStatus.disabled,
  _ => throw const FormatException(),
};

Sub2ApiAdminChannelBillingModelSource _billingModelSource(String value) =>
    switch (value) {
      'requested' => Sub2ApiAdminChannelBillingModelSource.requested,
      'upstream' => Sub2ApiAdminChannelBillingModelSource.upstream,
      'channel_mapped' => Sub2ApiAdminChannelBillingModelSource.channelMapped,
      'response_model' => Sub2ApiAdminChannelBillingModelSource.responseModel,
      _ => throw const FormatException(),
    };

Sub2ApiAdminChannelBillingMode _billingMode(String value) => switch (value) {
  'token' => Sub2ApiAdminChannelBillingMode.token,
  'per_request' => Sub2ApiAdminChannelBillingMode.perRequest,
  'image' => Sub2ApiAdminChannelBillingMode.image,
  _ => throw const FormatException(),
};

Sub2ApiAdminJsonObject _jsonObject(Object? value) {
  final source = _object(value);
  return Sub2ApiAdminJsonObject(
    source.map((key, item) => MapEntry(key, _jsonValue(item))),
  );
}

Sub2ApiAdminJsonValue _jsonValue(Object? value) {
  if (value == null) return const Sub2ApiAdminJsonNull();
  if (value is bool) return Sub2ApiAdminJsonBool(value);
  if (value is num) {
    return Sub2ApiAdminJsonNumber(Sub2ApiDecimal.fromJson(value));
  }
  if (value is String) return Sub2ApiAdminJsonString(value);
  if (value is List) {
    return Sub2ApiAdminJsonArray(value.map(_jsonValue).toList(growable: false));
  }
  if (value is Map) return _jsonObject(value);
  throw const FormatException();
}

Map<String, Map<String, String>> _nestedStringMap(Object? value) {
  final source = _object(value);
  return source.map((key, nested) {
    final nestedSource = _object(nested);
    return MapEntry(
      key,
      nestedSource.map((nestedKey, item) {
        if (item is! String) throw const FormatException();
        return MapEntry(nestedKey, item);
      }),
    );
  });
}

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

List<Object?> _list(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

List<String> _stringList(Object? value, {bool requireNonEmpty = false}) {
  if (value is! List) throw const FormatException();
  final result = value
      .map((item) {
        if (item is! String || (requireNonEmpty && item.trim().isEmpty)) {
          throw const FormatException();
        }
        return item;
      })
      .toList(growable: false);
  if (requireNonEmpty && result.isEmpty) throw const FormatException();
  return result;
}

List<int> _positiveIntegerList(Object? value) {
  if (value is! List) throw const FormatException();
  return value
      .map((item) {
        if (item is! int || item <= 0) throw const FormatException();
        return item;
      })
      .toList(growable: false);
}

String _string(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! String) throw const FormatException();
  return value;
}

String _nonEmptyString(Map<String, Object?> source, String key) {
  final value = _string(source, key);
  if (value.trim().isEmpty) throw const FormatException();
  return value;
}

bool _boolean(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! bool) throw const FormatException();
  return value;
}

int _integer(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! int) throw const FormatException();
  return value;
}

int _positiveInteger(Map<String, Object?> source, String key) {
  final value = _integer(source, key);
  if (value <= 0) throw const FormatException();
  return value;
}

int _nonNegativeInteger(Map<String, Object?> source, String key) {
  final value = _integer(source, key);
  if (value < 0) throw const FormatException();
  return value;
}

int? _nullableNonNegativeInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! int || value < 0) throw const FormatException();
  return value;
}

Sub2ApiDecimal _decimal(Map<String, Object?> source, String key) =>
    Sub2ApiDecimal.fromJson(source[key]);

Sub2ApiDecimal? _nullableDecimal(Map<String, Object?> source, String key) =>
    source[key] == null ? null : Sub2ApiDecimal.fromJson(source[key]);

DateTime _dateTime(Map<String, Object?> source, String key) =>
    DateTime.parse(_nonEmptyString(source, key)).toUtc();

T _map<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_channel_response',
  retryable: false,
);
