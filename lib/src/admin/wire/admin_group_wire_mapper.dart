import '../../keys/internal/key_wire_dtos.dart';
import '../../keys/sub2api_key_models.dart';
import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_group_models.dart';

Sub2ApiAdminGroupPage mapAdminGroupPage(Object? data) => _map(() {
  final source = _object(data);
  return Sub2ApiPage<Sub2ApiAdminGroup>(
    items: _list(
      source,
      'items',
    ).map(_object).map(_group).toList(growable: false),
    total: _integer(source, 'total'),
    page: _integer(source, 'page'),
    pageSize: _integer(source, 'page_size'),
    pages: _integer(source, 'pages'),
  );
});

List<Sub2ApiAdminGroup> mapAdminGroups(Object? data) => _map(
  () => _array(
    data,
  ).map((value) => _group(_object(value))).toList(growable: false),
);

Sub2ApiAdminGroup mapAdminGroup(Object? data) =>
    _map(() => _group(_object(data)));

List<Sub2ApiAdminGroupUsageSummary> mapAdminGroupUsageSummaries(Object? data) =>
    _map(
      () => _array(data)
          .map(_object)
          .map(
            (source) => Sub2ApiAdminGroupUsageSummary(
              groupId: _positiveInteger(source, 'group_id'),
              todayCost: _decimal(source, 'today_cost'),
              yesterdayCost: _decimal(source, 'yesterday_cost'),
              totalCost: _decimal(source, 'total_cost'),
            ),
          )
          .toList(growable: false),
    );

List<Sub2ApiAdminGroupCapacitySummary> mapAdminGroupCapacitySummaries(
  Object? data,
) => _map(
  () => _array(data)
      .map(_object)
      .map(
        (source) => Sub2ApiAdminGroupCapacitySummary(
          groupId: _positiveInteger(source, 'group_id'),
          concurrencyUsed: _nonNegativeInteger(source, 'concurrency_used'),
          concurrencyMax: _nonNegativeInteger(source, 'concurrency_max'),
          sessionsUsed: _nonNegativeInteger(source, 'sessions_used'),
          sessionsMax: _nonNegativeInteger(source, 'sessions_max'),
          rpmUsed: _nonNegativeInteger(source, 'rpm_used'),
          rpmMax: _nonNegativeInteger(source, 'rpm_max'),
        ),
      )
      .toList(growable: false),
);

Sub2ApiAdminGroupLiveCapability mapAdminGroupLiveCapability(Object? data) =>
    _map(() {
      final source = _object(data);
      return Sub2ApiAdminGroupLiveCapability(
        supported: _boolean(source, 'supported'),
        reason: _nullableString(source, 'reason'),
      );
    });

Sub2ApiAdminGroupModelsListCandidates mapAdminGroupModelsListCandidates(
  Object? data,
) => _map(() {
  final source = _object(data);
  return Sub2ApiAdminGroupModelsListCandidates(
    models: _stringList(source['models']),
  );
});

List<Sub2ApiAdminCompositeRoute> mapAdminCompositeRoutes(Object? data) => _map(
  () => _array(data).map(_object).map(_compositeRoute).toList(growable: false),
);

Sub2ApiAdminCompositeRoute mapAdminCompositeRoute(Object? data) =>
    _map(() => _compositeRoute(_object(data)));

Sub2ApiAdminCompositeRouteDecision mapAdminCompositeRouteDecision(
  Object? data,
) => _map(() {
  final source = _object(data);
  return Sub2ApiAdminCompositeRouteDecision(
    matched: _boolean(source, 'matched'),
    source: _string(source, 'source'),
    groupId: _positiveInteger(source, 'group_id'),
    publicModel: _string(source, 'public_model'),
    targetPlatform: _platform(_nonEmptyString(source, 'target_platform')),
    upstreamModel: _string(source, 'upstream_model'),
    endpoint: _endpoint(_nonEmptyString(source, 'endpoint')),
    route: source['route'] == null
        ? null
        : _compositeRoute(_object(source['route'])),
    reason: _optionalString(source, 'reason'),
  );
});

Sub2ApiAdminGroupActionResult mapAdminGroupActionResult(Object? data) =>
    _map(() {
      final message = _nonEmptyString(_object(data), 'message');
      return Sub2ApiAdminGroupActionResult(message: message);
    });

Sub2ApiAdminGroupStats mapAdminGroupStats(Object? data) => _map(() {
  final source = _object(data);
  return Sub2ApiAdminGroupStats(
    totalApiKeys: _nonNegativeInteger(source, 'total_api_keys'),
    activeApiKeys: _nonNegativeInteger(source, 'active_api_keys'),
    totalRequests: _nonNegativeInteger(source, 'total_requests'),
    totalCost: _decimal(source, 'total_cost'),
  );
});

List<Sub2ApiAdminGroupRateEntry> mapAdminGroupRateEntries(Object? data) => _map(
  () => _array(data)
      .map(_object)
      .map(
        (source) => Sub2ApiAdminGroupRateEntry(
          userId: _positiveInteger(source, 'user_id'),
          userName: _string(source, 'user_name'),
          userEmail: _string(source, 'user_email'),
          userNotes: _string(source, 'user_notes'),
          userStatus: _string(source, 'user_status'),
          rateMultiplier: _nullableDecimal(source, 'rate_multiplier'),
          rpmOverride: _nullableInteger(source, 'rpm_override'),
        ),
      )
      .toList(growable: false),
);

Sub2ApiAdminGroupApiKeyPage mapAdminGroupApiKeyPage(Object? data) => _map(() {
  final source = _object(data);
  return Sub2ApiPage<Sub2ApiKeyDetails>(
    items: _list(source, 'items')
        .map((value) => ApiKeyWireDto.fromJson(_object(value)))
        .map(_apiKey)
        .toList(growable: false),
    total: _integer(source, 'total'),
    page: _integer(source, 'page'),
    pageSize: _integer(source, 'page_size'),
    pages: _integer(source, 'pages'),
  );
});

Sub2ApiAdminGroup _group(Map<String, Object?> source) {
  final id = _positiveInteger(source, 'id');
  final rpmLimit = _nonNegativeInteger(source, 'rpm_limit');
  final accountCount = _optionalNonNegativeInteger(source, 'account_count');
  final activeAccountCount = _optionalNonNegativeInteger(
    source,
    'active_account_count',
  );
  final rateLimitedAccountCount = _optionalNonNegativeInteger(
    source,
    'rate_limited_account_count',
  );
  return Sub2ApiAdminGroup(
    id: id,
    name: _nonEmptyString(source, 'name'),
    description: _string(source, 'description'),
    platform: _platform(_nonEmptyString(source, 'platform')),
    rateMultiplier: _decimal(source, 'rate_multiplier'),
    isExclusive: _boolean(source, 'is_exclusive'),
    status: _status(_nonEmptyString(source, 'status')),
    subscriptionType: _subscriptionType(
      _nonEmptyString(source, 'subscription_type'),
    ),
    dailyLimitUsd: _nullableDecimal(source, 'daily_limit_usd'),
    weeklyLimitUsd: _nullableDecimal(source, 'weekly_limit_usd'),
    monthlyLimitUsd: _nullableDecimal(source, 'monthly_limit_usd'),
    longContextPricingEnabled: _boolean(source, 'long_context_pricing_enabled'),
    allowImageGeneration: _boolean(source, 'allow_image_generation'),
    allowBatchImageGeneration: _boolean(source, 'allow_batch_image_generation'),
    imageRateIndependent: _boolean(source, 'image_rate_independent'),
    imageRateMultiplier: _decimal(source, 'image_rate_multiplier'),
    batchImageDiscountMultiplier: _decimal(
      source,
      'batch_image_discount_multiplier',
    ),
    batchImageHoldMultiplier: _decimal(source, 'batch_image_hold_multiplier'),
    videoRateIndependent: _boolean(source, 'video_rate_independent'),
    videoRateMultiplier: _decimal(source, 'video_rate_multiplier'),
    peakRateEnabled: _boolean(source, 'peak_rate_enabled'),
    peakStart: _string(source, 'peak_start'),
    peakEnd: _string(source, 'peak_end'),
    peakRateMultiplier: _decimal(source, 'peak_rate_multiplier'),
    imagePrice1k: _nullableDecimal(source, 'image_price_1k'),
    imagePrice2k: _nullableDecimal(source, 'image_price_2k'),
    imagePrice4k: _nullableDecimal(source, 'image_price_4k'),
    videoPrice480p: _nullableDecimal(source, 'video_price_480p'),
    videoPrice720p: _nullableDecimal(source, 'video_price_720p'),
    videoPrice1080p: _nullableDecimal(source, 'video_price_1080p'),
    videoModelPrices: _videoPrices(source['video_model_prices']),
    webSearchPricePerCall: _nullableDecimal(
      source,
      'web_search_price_per_call',
    ),
    searchPricePer1k: _nullableDecimal(source, 'search_price_per_1k'),
    audioRealtimePricePerMin: _nullableDecimal(
      source,
      'audio_realtime_price_per_min',
    ),
    audioTtsPricePerMillionChars: _nullableDecimal(
      source,
      'audio_tts_price_per_million_chars',
    ),
    audioSttPricePerHour: _nullableDecimal(source, 'audio_stt_price_per_hour'),
    claudeCodeOnly: _boolean(source, 'claude_code_only'),
    fallbackGroupId: _nullableInteger(source, 'fallback_group_id'),
    fallbackGroupIdOnInvalidRequest: _nullableInteger(
      source,
      'fallback_group_id_on_invalid_request',
    ),
    allowMessagesDispatch: _boolean(source, 'allow_messages_dispatch'),
    allowLive: _boolean(source, 'allow_live'),
    requireOAuthOnly: _boolean(source, 'require_oauth_only'),
    requirePrivacySet: _boolean(source, 'require_privacy_set'),
    rpmLimit: rpmLimit,
    maxReasoningEffort: _string(source, 'max_reasoning_effort'),
    reasoningEffortMappings: _optionalList(
      source,
      'reasoning_effort_mappings',
    ).map(_object).map(_reasoningMapping).toList(growable: false),
    profitControlEnabled: _boolean(source, 'profit_control_enabled'),
    profitMinMargin: _decimal(source, 'profit_min_margin'),
    profitSafetyBuffer: _decimal(source, 'profit_safety_buffer'),
    modelPricing: _optionalList(
      source,
      'model_pricing',
    ).map(_object).map(_modelPricing).toList(growable: false),
    modelRouting: _modelRouting(source['model_routing']),
    modelRoutingEnabled: _boolean(source, 'model_routing_enabled'),
    mcpXmlInject: _boolean(source, 'mcp_xml_inject'),
    defaultMappedModel: _string(source, 'default_mapped_model'),
    messagesDispatchModelConfig: _messagesDispatchConfig(
      _optionalObject(source['messages_dispatch_model_config']),
    ),
    modelsListConfig: _modelsListConfig(
      _optionalObject(source['models_list_config']),
    ),
    supportedModelScopes: _optionalStringList(source['supported_model_scopes']),
    accountGroups: _optionalList(
      source,
      'account_groups',
    ).map(_object).map(_accountBinding).toList(growable: false),
    accountCount: accountCount,
    activeAccountCount: activeAccountCount,
    rateLimitedAccountCount: rateLimitedAccountCount,
    sortOrder: _optionalInteger(source, 'sort_order'),
    createdAt: _dateTime(source, 'created_at'),
    updatedAt: _dateTime(source, 'updated_at'),
  );
}

Sub2ApiAdminCompositeRoute _compositeRoute(Map<String, Object?> source) =>
    Sub2ApiAdminCompositeRoute(
      id: _positiveInteger(source, 'id'),
      groupId: _positiveInteger(source, 'group_id'),
      publicModel: _nonEmptyString(source, 'public_model'),
      matchType: _matchType(_nonEmptyString(source, 'match_type')),
      targetPlatform: _platform(_nonEmptyString(source, 'target_platform')),
      upstreamModel: _string(source, 'upstream_model'),
      endpoint: _endpoint(_nonEmptyString(source, 'endpoint')),
      priority: _integer(source, 'priority'),
      enabled: _boolean(source, 'enabled'),
      notes: _string(source, 'notes'),
      createdAt: _dateTime(source, 'created_at'),
      updatedAt: _dateTime(source, 'updated_at'),
    );

Sub2ApiAdminReasoningEffortMapping _reasoningMapping(
  Map<String, Object?> source,
) => Sub2ApiAdminReasoningEffortMapping(
  from: _nonEmptyString(source, 'from'),
  to: _nonEmptyString(source, 'to'),
);

Sub2ApiAdminGroupAccountBinding _accountBinding(Map<String, Object?> source) =>
    Sub2ApiAdminGroupAccountBinding(
      accountId: _positiveInteger(source, 'account_id'),
      groupId: _positiveInteger(source, 'group_id'),
      priority: _integer(source, 'priority'),
      createdAt: _dateTime(source, 'created_at'),
    );

Sub2ApiAdminModelPricing _modelPricing(Map<String, Object?> source) =>
    Sub2ApiAdminModelPricing(
      id: _optionalInteger(source, 'id'),
      channelId: _optionalInteger(source, 'channel_id'),
      platform: _nonEmptyString(source, 'platform'),
      models: _stringList(source['models']),
      billingMode: _nonEmptyString(source, 'billing_mode'),
      inputPrice: _nullableDecimal(source, 'input_price'),
      outputPrice: _nullableDecimal(source, 'output_price'),
      cacheWritePrice: _nullableDecimal(source, 'cache_write_price'),
      cacheReadPrice: _nullableDecimal(source, 'cache_read_price'),
      fastMultiplier: _nullableDecimal(source, 'fast_multiplier'),
      flexMultiplier: _nullableDecimal(source, 'flex_multiplier'),
      imageInputPrice: _nullableDecimal(source, 'image_input_price'),
      imageOutputPrice: _nullableDecimal(source, 'image_output_price'),
      perRequestPrice: _nullableDecimal(source, 'per_request_price'),
      intervals: _optionalList(
        source,
        'intervals',
      ).map(_object).map(_pricingInterval).toList(growable: false),
      timePricing: source['time_pricing'] == null
          ? null
          : _timePricing(_object(source['time_pricing'])),
      createdAt: _nullableDateTime(source, 'created_at'),
      updatedAt: _nullableDateTime(source, 'updated_at'),
    );

Sub2ApiAdminPricingInterval _pricingInterval(Map<String, Object?> source) =>
    Sub2ApiAdminPricingInterval(
      id: _optionalInteger(source, 'id'),
      pricingId: _optionalInteger(source, 'pricing_id'),
      minTokens: _nonNegativeInteger(source, 'min_tokens'),
      maxTokens: _nullableInteger(source, 'max_tokens'),
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
      createdAt: _nullableDateTime(source, 'created_at'),
      updatedAt: _nullableDateTime(source, 'updated_at'),
    );

Sub2ApiAdminTimePricing _timePricing(Map<String, Object?> source) =>
    Sub2ApiAdminTimePricing(
      timezone: _nonEmptyString(source, 'timezone'),
      weekdaysOnly: source['weekdays_only'] == null
          ? false
          : _boolean(source, 'weekdays_only'),
      periods: _list(source, 'periods')
          .map(_object)
          .map(
            (period) => Sub2ApiAdminTimePricingPeriod(
              startTime: _nonEmptyString(period, 'start_time'),
              endTime: _nonEmptyString(period, 'end_time'),
              multiplier: _decimal(period, 'multiplier'),
            ),
          )
          .toList(growable: false),
    );

Sub2ApiAdminMessagesDispatchModelConfig _messagesDispatchConfig(
  Map<String, Object?> source,
) => Sub2ApiAdminMessagesDispatchModelConfig(
  opusMappedModel: _optionalString(source, 'opus_mapped_model'),
  sonnetMappedModel: _optionalString(source, 'sonnet_mapped_model'),
  haikuMappedModel: _optionalString(source, 'haiku_mapped_model'),
  exactModelMappings: _stringMap(source['exact_model_mappings']),
);

Sub2ApiAdminGroupModelsListConfig _modelsListConfig(
  Map<String, Object?> source,
) => Sub2ApiAdminGroupModelsListConfig(
  enabled: source['enabled'] == null ? false : _boolean(source, 'enabled'),
  models: _optionalStringList(source['models']),
);

Sub2ApiKeyDetails _apiKey(ApiKeyWireDto source) => Sub2ApiKeyDetails(
  summary: Sub2ApiKeySummary(
    id: source.id,
    userId: source.userId,
    name: source.name,
    status: source.status,
    ipWhitelist: List.unmodifiable(source.ipWhitelist),
    ipBlacklist: List.unmodifiable(source.ipBlacklist),
    quota: Sub2ApiDecimal.fromJson(source.quota),
    quotaUsed: Sub2ApiDecimal.fromJson(source.quotaUsed),
    currentConcurrency: source.currentConcurrency,
    fiveHourWindow: _keyWindow(
      source.rateLimit5h,
      source.usage5h,
      source.window5hStart,
      source.reset5hAt,
    ),
    oneDayWindow: _keyWindow(
      source.rateLimit1d,
      source.usage1d,
      source.window1dStart,
      source.reset1dAt,
    ),
    sevenDayWindow: _keyWindow(
      source.rateLimit7d,
      source.usage7d,
      source.window7dStart,
      source.reset7dAt,
    ),
    createdAt: source.createdAt.toUtc(),
    updatedAt: source.updatedAt.toUtc(),
    groupId: source.groupId,
    expiresAt: source.expiresAt?.toUtc(),
    lastUsedAt: source.lastUsedAt?.toUtc(),
    lastUsedIp: source.lastUsedIp,
  ),
  secret: Sub2ApiApiKeySecret(source.key),
);

Sub2ApiKeyUsageWindow _keyWindow(
  num limit,
  num used,
  DateTime? startedAt,
  DateTime? resetsAt,
) => Sub2ApiKeyUsageWindow(
  limit: Sub2ApiDecimal.fromJson(limit),
  used: Sub2ApiDecimal.fromJson(used),
  startedAt: startedAt?.toUtc(),
  resetsAt: resetsAt?.toUtc(),
);

Map<String, List<int>> _modelRouting(Object? value) {
  if (value == null) return const {};
  final source = _object(value);
  return source.map((key, item) => MapEntry(key, _integerList(item)));
}

Map<String, Map<String, Sub2ApiDecimal>> _videoPrices(Object? value) {
  if (value == null) return const {};
  return _object(value).map(
    (family, resolutions) => MapEntry(
      family,
      _object(resolutions).map(
        (resolution, price) =>
            MapEntry(resolution, Sub2ApiDecimal.fromJson(_number(price))),
      ),
    ),
  );
}

Sub2ApiAdminGroupPlatform _platform(String value) => switch (value) {
  'anthropic' => Sub2ApiAdminGroupPlatform.anthropic,
  'openai' => Sub2ApiAdminGroupPlatform.openAi,
  'gemini' => Sub2ApiAdminGroupPlatform.gemini,
  'antigravity' => Sub2ApiAdminGroupPlatform.antigravity,
  'grok' => Sub2ApiAdminGroupPlatform.grok,
  'kimi' => Sub2ApiAdminGroupPlatform.kimi,
  'zhipu' => Sub2ApiAdminGroupPlatform.zhipu,
  'deepseek' => Sub2ApiAdminGroupPlatform.deepseek,
  'composite' => Sub2ApiAdminGroupPlatform.composite,
  _ => throw _invalidAdminGroup,
};

Sub2ApiAdminGroupStatus _status(String value) => switch (value) {
  'active' => Sub2ApiAdminGroupStatus.active,
  'inactive' => Sub2ApiAdminGroupStatus.inactive,
  _ => throw _invalidAdminGroup,
};

Sub2ApiAdminGroupSubscriptionType _subscriptionType(String value) =>
    switch (value) {
      'standard' => Sub2ApiAdminGroupSubscriptionType.standard,
      'subscription' => Sub2ApiAdminGroupSubscriptionType.subscription,
      _ => throw _invalidAdminGroup,
    };

Sub2ApiAdminCompositeRouteMatchType _matchType(String value) => switch (value) {
  'exact' => Sub2ApiAdminCompositeRouteMatchType.exact,
  'prefix' => Sub2ApiAdminCompositeRouteMatchType.prefix,
  _ => throw _invalidAdminGroup,
};

Sub2ApiAdminCompositeRouteEndpoint _endpoint(String value) => switch (value) {
  'any' => Sub2ApiAdminCompositeRouteEndpoint.any,
  'messages' => Sub2ApiAdminCompositeRouteEndpoint.messages,
  'count_tokens' => Sub2ApiAdminCompositeRouteEndpoint.countTokens,
  'responses' => Sub2ApiAdminCompositeRouteEndpoint.responses,
  'chat_completions' => Sub2ApiAdminCompositeRouteEndpoint.chatCompletions,
  'embeddings' => Sub2ApiAdminCompositeRouteEndpoint.embeddings,
  'images' => Sub2ApiAdminCompositeRouteEndpoint.images,
  'gemini' => Sub2ApiAdminCompositeRouteEndpoint.gemini,
  _ => throw _invalidAdminGroup,
};

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw _invalidAdminGroup;
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) throw _invalidAdminGroup;
    result[entry.key as String] = entry.value;
  }
  return result;
}

Map<String, Object?> _optionalObject(Object? value) =>
    value == null ? const {} : _object(value);

List<Object?> _array(Object? value) {
  if (value is! List) throw _invalidAdminGroup;
  return List<Object?>.from(value);
}

List<Object?> _list(Map<String, Object?> source, String key) =>
    _array(source[key]);

List<Object?> _optionalList(Map<String, Object?> source, String key) =>
    source[key] == null ? const [] : _array(source[key]);

String _string(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! String) throw _invalidAdminGroup;
  return value;
}

String _nonEmptyString(Map<String, Object?> source, String key) {
  final value = _string(source, key);
  if (value.isEmpty) throw _invalidAdminGroup;
  return value;
}

String _optionalString(Map<String, Object?> source, String key) =>
    source[key] == null ? '' : _string(source, key);

String? _nullableString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! String) throw _invalidAdminGroup;
  return value;
}

bool _boolean(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! bool) throw _invalidAdminGroup;
  return value;
}

int _integer(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! int) throw _invalidAdminGroup;
  return value;
}

int _positiveInteger(Map<String, Object?> source, String key) {
  final value = _integer(source, key);
  if (value <= 0) throw _invalidAdminGroup;
  return value;
}

int _nonNegativeInteger(Map<String, Object?> source, String key) {
  final value = _integer(source, key);
  if (value < 0) throw _invalidAdminGroup;
  return value;
}

int _optionalInteger(Map<String, Object?> source, String key) =>
    source[key] == null ? 0 : _integer(source, key);

int _optionalNonNegativeInteger(Map<String, Object?> source, String key) {
  final value = _optionalInteger(source, key);
  if (value < 0) throw _invalidAdminGroup;
  return value;
}

int? _nullableInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! int) throw _invalidAdminGroup;
  return value;
}

num _number(Object? value) {
  if (value is! num || !value.isFinite) throw _invalidAdminGroup;
  return value;
}

Sub2ApiDecimal _decimal(Map<String, Object?> source, String key) =>
    Sub2ApiDecimal.fromJson(_number(source[key]));

Sub2ApiDecimal? _nullableDecimal(Map<String, Object?> source, String key) =>
    source[key] == null ? null : Sub2ApiDecimal.fromJson(_number(source[key]));

DateTime _dateTime(Map<String, Object?> source, String key) {
  final parsed = DateTime.tryParse(_string(source, key));
  if (parsed == null) throw _invalidAdminGroup;
  return parsed.toUtc();
}

DateTime? _nullableDateTime(Map<String, Object?> source, String key) =>
    source[key] == null ? null : _dateTime(source, key);

List<String> _stringList(Object? value) => _array(value)
    .map((item) {
      if (item is! String) throw _invalidAdminGroup;
      return item;
    })
    .toList(growable: false);

List<String> _optionalStringList(Object? value) =>
    value == null ? const [] : _stringList(value);

List<int> _integerList(Object? value) => _array(value)
    .map((item) {
      if (item is! int) throw _invalidAdminGroup;
      return item;
    })
    .toList(growable: false);

Map<String, String> _stringMap(Object? value) {
  if (value == null) return const {};
  return _object(value).map((key, item) {
    if (item is! String) throw _invalidAdminGroup;
    return MapEntry(key, item);
  });
}

T _map<T>(T Function() convert) {
  try {
    return convert();
  } on Sub2ApiException {
    rethrow;
  } on Object {
    throw _invalidAdminGroup;
  }
}

const _invalidAdminGroup = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_group_response',
  retryable: false,
);
