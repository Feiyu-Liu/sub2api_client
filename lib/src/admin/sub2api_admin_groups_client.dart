import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_group_models.dart';
import 'sub2api_admin_subscription_models.dart';
import 'wire/admin_group_wire_mapper.dart';
import 'wire/admin_group_wire_service.dart';

abstract interface class Sub2ApiAdminGroupsClient {
  Future<Sub2ApiAdminGroupPage> list({
    Sub2ApiAdminGroupListQuery query = const Sub2ApiAdminGroupListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminGroup>> getAll({
    Sub2ApiAdminGroupPlatform? platform,
    bool includeInactive = false,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminGroupUsageSummary>> getUsageSummary({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminGroupCapacitySummary>> getCapacitySummary({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroupLiveCapability> getLiveCapability({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroupModelsListCandidates> getModelsListCandidates(
    int groupId, {
    Sub2ApiAdminGroupPlatform? platform,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminCompositeRoute>> listCompositeRoutes(
    int groupId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroup> getById(
    int groupId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroupStats> getStats(
    int groupId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminGroupRateEntry>> getRateMultipliers(
    int groupId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroupApiKeyPage> getApiKeys(
    int groupId, {
    int? page,
    int? pageSize,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminSubscriptionPage> getSubscriptions(
    int groupId, {
    int? page,
    int? pageSize,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroup> create(
    Sub2ApiAdminCreateGroupRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroup> update(
    int groupId,
    Sub2ApiAdminUpdateGroupRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroupActionResult> updateSortOrder(
    Sub2ApiAdminUpdateGroupSortOrderRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminCompositeRoute> createCompositeRoute(
    int groupId,
    Sub2ApiAdminCompositeRouteRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminCompositeRouteDecision> previewCompositeRoute(
    int groupId,
    Sub2ApiAdminCompositeRoutePreviewRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminCompositeRoute> updateCompositeRoute(
    int groupId,
    int routeId,
    Sub2ApiAdminCompositeRouteRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroupActionResult> deleteCompositeRoute(
    int groupId,
    int routeId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroup> duplicate(
    int groupId,
    Sub2ApiAdminDuplicateGroupRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroupActionResult> delete(
    int groupId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroupActionResult> setRateMultipliers(
    int groupId,
    Sub2ApiAdminSetGroupRateMultipliersRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroupActionResult> clearRateMultipliers(
    int groupId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroupActionResult> setRpmOverrides(
    int groupId,
    Sub2ApiAdminSetGroupRpmOverridesRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGroupActionResult> clearRpmOverrides(
    int groupId, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminGroupsClient createSub2ApiAdminGroupsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Sub2ApiAdminGroupsClient(
  dio: dio,
  requestExecutor: requestExecutor,
  credentialMode: credentialMode,
);

final class _Sub2ApiAdminGroupsClient implements Sub2ApiAdminGroupsClient {
  _Sub2ApiAdminGroupsClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiAdminCredentialMode credentialMode,
  }) : _requestExecutor = requestExecutor,
       _credentialMode = credentialMode,
       _service = AdminGroupWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final Sub2ApiAdminCredentialMode _credentialMode;
  final AdminGroupWireService _service;

  @override
  Future<Sub2ApiAdminGroupPage> list({
    Sub2ApiAdminGroupListQuery query = const Sub2ApiAdminGroupListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validatePage(query.page, query.pageSize);
    if (query.search != null && query.search!.runes.length > 100) {
      throw _validation('admin.groups.search_too_long');
    }
    _validateSortOrder(query.sortOrder);
    final values = <String, dynamic>{
      if (query.page != null) 'page': query.page,
      if (query.pageSize != null) 'page_size': query.pageSize,
      if (query.platform != null) 'platform': _wirePlatform(query.platform!),
      if (query.status != null) 'status': query.status!.name,
      if (query.search != null) 'search': query.search!.trim(),
      if (query.isExclusive != null) 'is_exclusive': query.isExclusive,
      if (query.sortBy != null) 'sort_by': query.sortBy!.trim(),
      if (query.sortOrder != null) 'sort_order': query.sortOrder,
    };
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.listGroups(
        values,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminGroupPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminGroup>> getAll({
    Sub2ApiAdminGroupPlatform? platform,
    bool includeInactive = false,
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, credential) => _service.allGroups(
      <String, dynamic>{
        if (platform != null) 'platform': _wirePlatform(platform),
        if (includeInactive) 'include_inactive': true,
      },
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminGroups,
    requestOptions: requestOptions,
  );

  @override
  Future<List<Sub2ApiAdminGroupUsageSummary>> getUsageSummary({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, credential) => _service.usageSummary(
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminGroupUsageSummaries,
    requestOptions: requestOptions,
  );

  @override
  Future<List<Sub2ApiAdminGroupCapacitySummary>> getCapacitySummary({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, credential) => _service.capacitySummary(
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminGroupCapacitySummaries,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminGroupLiveCapability> getLiveCapability({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, credential) => _service.liveCapability(
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminGroupLiveCapability,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminGroupModelsListCandidates> getModelsListCandidates(
    int groupId, {
    Sub2ApiAdminGroupPlatform? platform,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.modelsListCandidates(
        groupId,
        <String, dynamic>{
          if (platform != null) 'platform': _wirePlatform(platform),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminGroupModelsListCandidates,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminCompositeRoute>> listCompositeRoutes(
    int groupId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.compositeRoutes(
        groupId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminCompositeRoutes,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGroup> getById(
    int groupId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.getGroup(
        groupId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminGroup,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGroupStats> getStats(
    int groupId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.groupStats(
        groupId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminGroupStats,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminGroupRateEntry>> getRateMultipliers(
    int groupId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.rateMultipliers(
        groupId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminGroupRateEntries,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGroupApiKeyPage> getApiKeys(
    int groupId, {
    int? page,
    int? pageSize,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    _validatePage(page, pageSize);
    final query = <String, dynamic>{};
    if (page != null) query['page'] = page;
    if (pageSize != null) query['page_size'] = pageSize;
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.apiKeys(
        groupId,
        query,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminGroupApiKeyPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminSubscriptionPage> getSubscriptions(
    int groupId, {
    int? page,
    int? pageSize,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    _validatePage(page, pageSize);
    final query = <String, dynamic>{};
    if (page != null) query['page'] = page;
    if (pageSize != null) query['page_size'] = pageSize;
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.groupSubscriptions(
        groupId,
        query,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminGroupSubscriptions,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGroup> create(
    Sub2ApiAdminCreateGroupRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _createGroupBody(request);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.createGroup(
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminGroup,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGroup> update(
    int groupId,
    Sub2ApiAdminUpdateGroupRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    final body = _updateGroupBody(request);
    if (body.isEmpty) throw _validation('admin.groups.empty_update');
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.updateGroup(
        groupId,
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminGroup,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGroupActionResult> updateSortOrder(
    Sub2ApiAdminUpdateGroupSortOrderRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (request.updates.isEmpty) {
      throw _validation('admin.groups.sort_updates_required');
    }
    if (request.updates.any((update) => update.groupId <= 0)) {
      throw _validation('admin.groups.invalid_group_id');
    }
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.updateSortOrder(
        <String, Object?>{
          'updates': request.updates
              .map(
                (update) => <String, Object?>{
                  'id': update.groupId,
                  'sort_order': update.sortOrder,
                },
              )
              .toList(growable: false),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminGroupActionResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminCompositeRoute> createCompositeRoute(
    int groupId,
    Sub2ApiAdminCompositeRouteRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    final body = _compositeRouteBody(request);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.createCompositeRoute(
        groupId,
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminCompositeRoute,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminCompositeRouteDecision> previewCompositeRoute(
    int groupId,
    Sub2ApiAdminCompositeRoutePreviewRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    if (request.model.trim().isEmpty) {
      throw _validation('admin.groups.preview_model_required');
    }
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.previewCompositeRoute(
            groupId,
            <String, Object?>{
              'model': request.model.trim(),
              'endpoint': _wireEndpoint(request.endpoint),
            },
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminCompositeRouteDecision,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminCompositeRoute> updateCompositeRoute(
    int groupId,
    int routeId,
    Sub2ApiAdminCompositeRouteRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    _validateRouteId(routeId);
    final body = _compositeRouteBody(request);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.updateCompositeRoute(
        groupId,
        routeId,
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminCompositeRoute,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGroupActionResult> deleteCompositeRoute(
    int groupId,
    int routeId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    _validateRouteId(routeId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.deleteCompositeRoute(
        groupId,
        routeId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminGroupActionResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGroup> duplicate(
    int groupId,
    Sub2ApiAdminDuplicateGroupRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    final key = request.idempotencyKey.trim();
    if (key.isEmpty) {
      throw _validation('admin.groups.idempotency_key_required');
    }
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.duplicateGroup(
        groupId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
        key,
      ),
      decode: mapAdminGroup,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGroupActionResult> delete(
    int groupId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.deleteGroup(
        groupId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminGroupActionResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGroupActionResult> setRateMultipliers(
    int groupId,
    Sub2ApiAdminSetGroupRateMultipliersRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    if (request.entries.any((entry) => entry.userId <= 0)) {
      throw _validation('admin.groups.invalid_user_id');
    }
    return _action(
      send: (cancelToken, options, credential) => _service.setRateMultipliers(
        groupId,
        <String, Object?>{
          'entries': request.entries
              .map(
                (entry) => <String, Object?>{
                  'user_id': entry.userId,
                  'rate_multiplier': _float64Multiplier(entry.rateMultiplier),
                },
              )
              .toList(growable: false),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGroupActionResult> clearRateMultipliers(
    int groupId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    return _action(
      send: (cancelToken, options, credential) => _service.clearRateMultipliers(
        groupId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGroupActionResult> setRpmOverrides(
    int groupId,
    Sub2ApiAdminSetGroupRpmOverridesRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    if (request.entries.any(
      (entry) => entry.userId <= 0 || (entry.rpmOverride ?? 0) < 0,
    )) {
      throw _validation('admin.groups.invalid_rpm_override');
    }
    return _action(
      send: (cancelToken, options, credential) => _service.setRpmOverrides(
        groupId,
        <String, Object?>{
          'entries': request.entries
              .map(
                (entry) => <String, Object?>{
                  'user_id': entry.userId,
                  'rpm_override': entry.rpmOverride,
                },
              )
              .toList(growable: false),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGroupActionResult> clearRpmOverrides(
    int groupId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateGroupId(groupId);
    return _action(
      send: (cancelToken, options, credential) => _service.clearRpmOverrides(
        groupId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      requestOptions: requestOptions,
    );
  }

  Future<Sub2ApiAdminGroupActionResult> _action({
    required Sub2ApiWireCall send,
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedNonReplayableRequest(
    send: send,
    decode: mapAdminGroupActionResult,
    requestOptions: requestOptions,
  );

  String? _authorization(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

Map<String, Object?> _compositeRouteBody(
  Sub2ApiAdminCompositeRouteRequest request,
) {
  if (request.publicModel.trim().isEmpty) {
    throw _validation('admin.groups.public_model_required');
  }
  if (request.targetPlatform == Sub2ApiAdminGroupPlatform.composite) {
    throw _validation('admin.groups.invalid_target_platform');
  }
  return <String, Object?>{
    'public_model': request.publicModel.trim(),
    'match_type': request.matchType.name,
    'target_platform': _wirePlatform(request.targetPlatform),
    'upstream_model': request.upstreamModel.trim(),
    'endpoint': _wireEndpoint(request.endpoint),
    'priority': request.priority,
    'enabled': request.enabled,
    'notes': request.notes,
  };
}

Map<String, Object?> _createGroupBody(Sub2ApiAdminCreateGroupRequest request) {
  _validateCreateGroup(request);
  return <String, Object?>{
    'name': request.name.trim(),
    'description': request.description,
    if (request.platform != null) 'platform': _wirePlatform(request.platform!),
    if (request.rateMultiplier != null)
      'rate_multiplier': _float64Exact(
        request.rateMultiplier!,
        'admin.groups.rate_multiplier_not_representable',
      ),
    'is_exclusive': request.isExclusive,
    if (request.subscriptionType != null)
      'subscription_type': request.subscriptionType!.name,
    'daily_limit_usd': _nullableFloat64Limit(request.dailyLimitUsd),
    'weekly_limit_usd': _nullableFloat64Limit(request.weeklyLimitUsd),
    'monthly_limit_usd': _nullableFloat64Limit(request.monthlyLimitUsd),
    'long_context_pricing_enabled': request.longContextPricingEnabled,
    'model_pricing': request.modelPricing.map(_modelPricingBody).toList(),
    'allow_image_generation': request.allowImageGeneration,
    'allow_batch_image_generation': request.allowBatchImageGeneration,
    'image_rate_independent': request.imageRateIndependent,
    'image_rate_multiplier': _nullableFloat64(request.imageRateMultiplier),
    'batch_image_discount_multiplier': _nullableFloat64(
      request.batchImageDiscountMultiplier,
    ),
    'batch_image_hold_multiplier': _nullableFloat64(
      request.batchImageHoldMultiplier,
    ),
    'video_rate_independent': request.videoRateIndependent,
    'video_rate_multiplier': _nullableFloat64(request.videoRateMultiplier),
    'peak_rate_enabled': request.peakRateEnabled,
    'peak_start': request.peakStart,
    'peak_end': request.peakEnd,
    'peak_rate_multiplier': _nullableFloat64(request.peakRateMultiplier),
    'profit_control_enabled': request.profitControlEnabled,
    'profit_min_margin': _nullableFloat64(request.profitMinMargin),
    'profit_safety_buffer': _nullableFloat64(request.profitSafetyBuffer),
    'image_price_1k': _nullableFloat64(request.imagePrice1k),
    'image_price_2k': _nullableFloat64(request.imagePrice2k),
    'image_price_4k': _nullableFloat64(request.imagePrice4k),
    'video_price_480p': _nullableFloat64(request.videoPrice480p),
    'video_price_720p': _nullableFloat64(request.videoPrice720p),
    'video_price_1080p': _nullableFloat64(request.videoPrice1080p),
    'video_model_prices': _videoModelPricesBody(request.videoModelPrices),
    'web_search_price_per_call': _nullableFloat64(
      request.webSearchPricePerCall,
    ),
    'search_price_per_1k': _nullableFloat64(request.searchPricePer1k),
    'audio_realtime_price_per_min': _nullableFloat64(
      request.audioRealtimePricePerMin,
    ),
    'audio_tts_price_per_million_chars': _nullableFloat64(
      request.audioTtsPricePerMillionChars,
    ),
    'audio_stt_price_per_hour': _nullableFloat64(request.audioSttPricePerHour),
    'claude_code_only': request.claudeCodeOnly,
    'fallback_group_id': request.fallbackGroupId,
    'fallback_group_id_on_invalid_request':
        request.fallbackGroupIdOnInvalidRequest,
    'model_routing': request.modelRouting,
    'model_routing_enabled': request.modelRoutingEnabled,
    'mcp_xml_inject': request.mcpXmlInject,
    'supported_model_scopes': request.supportedModelScopes,
    'allow_messages_dispatch': request.allowMessagesDispatch,
    'allow_live': request.allowLive,
    'require_oauth_only': request.requireOAuthOnly,
    'require_privacy_set': request.requirePrivacySet,
    'default_mapped_model': request.defaultMappedModel,
    'messages_dispatch_model_config': _messagesConfigBody(
      request.messagesDispatchModelConfig,
    ),
    'models_list_config': _modelsListConfigBody(request.modelsListConfig),
    'rpm_limit': request.rpmLimit,
    'max_reasoning_effort': request.maxReasoningEffort,
    'reasoning_effort_mappings': request.reasoningEffortMappings
        .map(_reasoningMappingBody)
        .toList(),
    'copy_accounts_from_group_ids': request.copyAccountsFromGroupIds,
  };
}

Map<String, Object?> _updateGroupBody(Sub2ApiAdminUpdateGroupRequest request) {
  _validateUpdateGroup(request);
  final body = <String, Object?>{};
  if (request.name != null) body['name'] = request.name!.trim();
  if (request.description != null) body['description'] = request.description;
  if (request.platform != null) {
    body['platform'] = _wirePlatform(request.platform!);
  }
  if (request.rateMultiplier != null) {
    body['rate_multiplier'] = _float64Multiplier(request.rateMultiplier!);
  }
  if (request.isExclusive != null) {
    body['is_exclusive'] = request.isExclusive;
  }
  if (request.status != null) body['status'] = request.status!.name;
  if (request.subscriptionType != null) {
    body['subscription_type'] = request.subscriptionType!.name;
  }
  _putLimit(body, 'daily_limit_usd', request.dailyLimitUsd);
  _putLimit(body, 'weekly_limit_usd', request.weeklyLimitUsd);
  _putLimit(body, 'monthly_limit_usd', request.monthlyLimitUsd);
  _put(body, 'long_context_pricing_enabled', request.longContextPricingEnabled);
  if (request.modelPricing != null) {
    body['model_pricing'] = request.modelPricing!
        .map(_modelPricingBody)
        .toList();
  }
  _put(body, 'allow_image_generation', request.allowImageGeneration);
  _put(body, 'allow_batch_image_generation', request.allowBatchImageGeneration);
  _put(body, 'image_rate_independent', request.imageRateIndependent);
  _putDecimal(body, 'image_rate_multiplier', request.imageRateMultiplier);
  _putDecimal(
    body,
    'batch_image_discount_multiplier',
    request.batchImageDiscountMultiplier,
  );
  _putDecimal(
    body,
    'batch_image_hold_multiplier',
    request.batchImageHoldMultiplier,
  );
  _put(body, 'video_rate_independent', request.videoRateIndependent);
  _putDecimal(body, 'video_rate_multiplier', request.videoRateMultiplier);
  _put(body, 'peak_rate_enabled', request.peakRateEnabled);
  _put(body, 'peak_start', request.peakStart);
  _put(body, 'peak_end', request.peakEnd);
  _putDecimal(body, 'peak_rate_multiplier', request.peakRateMultiplier);
  _put(body, 'profit_control_enabled', request.profitControlEnabled);
  _putDecimal(body, 'profit_min_margin', request.profitMinMargin);
  _putDecimal(body, 'profit_safety_buffer', request.profitSafetyBuffer);
  _putDecimal(body, 'image_price_1k', request.imagePrice1k);
  _putDecimal(body, 'image_price_2k', request.imagePrice2k);
  _putDecimal(body, 'image_price_4k', request.imagePrice4k);
  _putDecimal(body, 'video_price_480p', request.videoPrice480p);
  _putDecimal(body, 'video_price_720p', request.videoPrice720p);
  _putDecimal(body, 'video_price_1080p', request.videoPrice1080p);
  if (request.videoModelPrices != null) {
    body['video_model_prices'] = _videoModelPricesBody(
      request.videoModelPrices!,
    );
  }
  _putDecimal(body, 'web_search_price_per_call', request.webSearchPricePerCall);
  _putDecimal(body, 'search_price_per_1k', request.searchPricePer1k);
  _putDecimal(
    body,
    'audio_realtime_price_per_min',
    request.audioRealtimePricePerMin,
  );
  _putDecimal(
    body,
    'audio_tts_price_per_million_chars',
    request.audioTtsPricePerMillionChars,
  );
  _putDecimal(body, 'audio_stt_price_per_hour', request.audioSttPricePerHour);
  _put(body, 'claude_code_only', request.claudeCodeOnly);
  _put(body, 'fallback_group_id', request.fallbackGroupId);
  _put(
    body,
    'fallback_group_id_on_invalid_request',
    request.fallbackGroupIdOnInvalidRequest,
  );
  if (request.modelRouting != null) {
    body['model_routing'] = request.modelRouting;
  }
  _put(body, 'model_routing_enabled', request.modelRoutingEnabled);
  _put(body, 'mcp_xml_inject', request.mcpXmlInject);
  if (request.supportedModelScopes != null) {
    body['supported_model_scopes'] = request.supportedModelScopes;
  }
  _put(body, 'allow_messages_dispatch', request.allowMessagesDispatch);
  _put(body, 'allow_live', request.allowLive);
  _put(body, 'require_oauth_only', request.requireOAuthOnly);
  _put(body, 'require_privacy_set', request.requirePrivacySet);
  _put(body, 'default_mapped_model', request.defaultMappedModel);
  if (request.messagesDispatchModelConfig != null) {
    body['messages_dispatch_model_config'] = _messagesConfigBody(
      request.messagesDispatchModelConfig!,
    );
  }
  if (request.modelsListConfig != null) {
    body['models_list_config'] = _modelsListConfigBody(
      request.modelsListConfig!,
    );
  }
  _put(body, 'rpm_limit', request.rpmLimit);
  _put(body, 'max_reasoning_effort', request.maxReasoningEffort);
  if (request.reasoningEffortMappings != null) {
    body['reasoning_effort_mappings'] = request.reasoningEffortMappings!
        .map(_reasoningMappingBody)
        .toList();
  }
  if (request.copyAccountsFromGroupIds != null) {
    body['copy_accounts_from_group_ids'] = request.copyAccountsFromGroupIds;
  }
  return body;
}

void _validateCreateGroup(Sub2ApiAdminCreateGroupRequest request) {
  if (request.name.trim().isEmpty) {
    throw _validation('admin.groups.name_required');
  }
  _validateCommonGroupWrite(
    rpmLimit: request.rpmLimit,
    fallbackGroupId: request.fallbackGroupId,
    fallbackInvalidGroupId: request.fallbackGroupIdOnInvalidRequest,
    modelRouting: request.modelRouting,
    copyAccountGroupIds: request.copyAccountsFromGroupIds,
    maxReasoningEffort: request.maxReasoningEffort,
  );
  if (request.rateMultiplier != null) {
    _float64Multiplier(request.rateMultiplier!);
  }
  _nullableFloat64Limit(request.dailyLimitUsd);
  _nullableFloat64Limit(request.weeklyLimitUsd);
  _nullableFloat64Limit(request.monthlyLimitUsd);
}

void _validateUpdateGroup(Sub2ApiAdminUpdateGroupRequest request) {
  if (request.name != null && request.name!.trim().isEmpty) {
    throw _validation('admin.groups.name_required');
  }
  _validateCommonGroupWrite(
    rpmLimit: request.rpmLimit,
    fallbackGroupId: request.fallbackGroupId,
    fallbackInvalidGroupId: request.fallbackGroupIdOnInvalidRequest,
    modelRouting: request.modelRouting,
    copyAccountGroupIds: request.copyAccountsFromGroupIds,
    maxReasoningEffort: request.maxReasoningEffort,
  );
  if (request.rateMultiplier != null) {
    _float64Multiplier(request.rateMultiplier!);
  }
  for (final limit in <Sub2ApiAdminLimitUpdate>[
    request.dailyLimitUsd,
    request.weeklyLimitUsd,
    request.monthlyLimitUsd,
  ]) {
    if (limit case Sub2ApiAdminLimitSet(:final value)) {
      _nullableFloat64Limit(value);
    }
  }
}

void _validateCommonGroupWrite({
  required int? rpmLimit,
  required int? fallbackGroupId,
  required int? fallbackInvalidGroupId,
  required Map<String, List<int>>? modelRouting,
  required List<int>? copyAccountGroupIds,
  required String? maxReasoningEffort,
}) {
  if (rpmLimit != null && rpmLimit < 0) {
    throw _validation('admin.groups.invalid_rpm_limit');
  }
  if ((fallbackGroupId != null && fallbackGroupId <= 0) ||
      (fallbackInvalidGroupId != null && fallbackInvalidGroupId <= 0)) {
    throw _validation('admin.groups.invalid_fallback_group_id');
  }
  if (modelRouting != null &&
      modelRouting.entries.any(
        (entry) => entry.key.trim().isEmpty || entry.value.any((id) => id <= 0),
      )) {
    throw _validation('admin.groups.invalid_model_routing');
  }
  if (copyAccountGroupIds != null && copyAccountGroupIds.any((id) => id <= 0)) {
    throw _validation('admin.groups.invalid_copy_group_id');
  }
  if (maxReasoningEffort != null &&
      !const {
        '',
        'minimal',
        'low',
        'medium',
        'high',
        'xhigh',
        'max',
      }.contains(maxReasoningEffort)) {
    throw _validation('admin.groups.invalid_max_reasoning_effort');
  }
}

Map<String, Object?> _modelPricingBody(Sub2ApiAdminModelPricing pricing) =>
    <String, Object?>{
      if (pricing.id != 0) 'id': pricing.id,
      if (pricing.channelId != 0) 'channel_id': pricing.channelId,
      'platform': pricing.platform,
      'models': pricing.models,
      'billing_mode': pricing.billingMode,
      'input_price': _nullableFloat64(pricing.inputPrice),
      'output_price': _nullableFloat64(pricing.outputPrice),
      'cache_write_price': _nullableFloat64(pricing.cacheWritePrice),
      'cache_read_price': _nullableFloat64(pricing.cacheReadPrice),
      'fast_multiplier': _nullableFloat64(pricing.fastMultiplier),
      'flex_multiplier': _nullableFloat64(pricing.flexMultiplier),
      'image_input_price': _nullableFloat64(pricing.imageInputPrice),
      'image_output_price': _nullableFloat64(pricing.imageOutputPrice),
      'per_request_price': _nullableFloat64(pricing.perRequestPrice),
      'intervals': pricing.intervals.map(_pricingIntervalBody).toList(),
      if (pricing.timePricing != null)
        'time_pricing': _timePricingBody(pricing.timePricing!),
    };

Map<String, Object?> _pricingIntervalBody(
  Sub2ApiAdminPricingInterval interval,
) => <String, Object?>{
  if (interval.id != 0) 'id': interval.id,
  if (interval.pricingId != 0) 'pricing_id': interval.pricingId,
  'min_tokens': interval.minTokens,
  'max_tokens': interval.maxTokens,
  'tier_label': interval.tierLabel,
  'input_price': _nullableFloat64(interval.inputPrice),
  'output_price': _nullableFloat64(interval.outputPrice),
  'cache_write_price': _nullableFloat64(interval.cacheWritePrice),
  'cache_read_price': _nullableFloat64(interval.cacheReadPrice),
  'input_multiplier': _nullableFloat64(interval.inputMultiplier),
  'output_multiplier': _nullableFloat64(interval.outputMultiplier),
  'cache_write_multiplier': _nullableFloat64(interval.cacheWriteMultiplier),
  'cache_read_multiplier': _nullableFloat64(interval.cacheReadMultiplier),
  'per_request_price': _nullableFloat64(interval.perRequestPrice),
  'sort_order': interval.sortOrder,
};

Map<String, Object?> _timePricingBody(Sub2ApiAdminTimePricing pricing) =>
    <String, Object?>{
      'timezone': pricing.timezone,
      'weekdays_only': pricing.weekdaysOnly,
      'periods': pricing.periods
          .map(
            (period) => <String, Object?>{
              'start_time': period.startTime,
              'end_time': period.endTime,
              'multiplier': _float64Exact(
                period.multiplier,
                'admin.groups.pricing_not_representable',
              ),
            },
          )
          .toList(),
    };

Map<String, Object?> _messagesConfigBody(
  Sub2ApiAdminMessagesDispatchModelConfig config,
) => <String, Object?>{
  'opus_mapped_model': config.opusMappedModel,
  'sonnet_mapped_model': config.sonnetMappedModel,
  'haiku_mapped_model': config.haikuMappedModel,
  'exact_model_mappings': config.exactModelMappings,
};

Map<String, Object?> _modelsListConfigBody(
  Sub2ApiAdminGroupModelsListConfig config,
) => <String, Object?>{'enabled': config.enabled, 'models': config.models};

Map<String, Object?> _reasoningMappingBody(
  Sub2ApiAdminReasoningEffortMapping mapping,
) => <String, Object?>{'from': mapping.from, 'to': mapping.to};

Map<String, Map<String, double>> _videoModelPricesBody(
  Map<String, Map<String, Sub2ApiDecimal>> prices,
) => prices.map(
  (family, resolutions) => MapEntry(
    family,
    resolutions.map(
      (resolution, price) => MapEntry(
        resolution,
        _float64Exact(price, 'admin.groups.pricing_not_representable'),
      ),
    ),
  ),
);

void _put(Map<String, Object?> body, String key, Object? value) {
  if (value != null) body[key] = value;
}

void _putDecimal(Map<String, Object?> body, String key, Sub2ApiDecimal? value) {
  if (value != null) {
    body[key] = _float64Exact(value, 'admin.groups.pricing_not_representable');
  }
}

void _putLimit(
  Map<String, Object?> body,
  String key,
  Sub2ApiAdminLimitUpdate update,
) {
  switch (update) {
    case Sub2ApiAdminLimitUnchanged():
      return;
    case Sub2ApiAdminLimitClear():
      body[key] = null;
    case Sub2ApiAdminLimitSet(:final value):
      body[key] = _nullableFloat64Limit(value);
  }
}

double? _nullableFloat64(Sub2ApiDecimal? value) => value == null
    ? null
    : _float64Exact(value, 'admin.groups.pricing_not_representable');

double? _nullableFloat64Limit(Sub2ApiDecimal? value) {
  if (value == null) return null;
  if (value.compareTo(Sub2ApiDecimal.zero()) < 0) {
    throw _validation('admin.groups.invalid_limit');
  }
  return _float64Exact(value, 'admin.groups.limit_not_representable');
}

double _float64Exact(Sub2ApiDecimal decimal, String code) {
  final value = double.tryParse(decimal.toJson());
  if (value == null || !value.isFinite) throw _validation(code);
  if (Sub2ApiDecimal.parse(value.toString()) != decimal) {
    throw _validation(code);
  }
  return value;
}

void _validateRouteId(int routeId) {
  if (routeId <= 0) throw _validation('admin.groups.invalid_route_id');
}

String _wireEndpoint(Sub2ApiAdminCompositeRouteEndpoint endpoint) =>
    switch (endpoint) {
      Sub2ApiAdminCompositeRouteEndpoint.countTokens => 'count_tokens',
      Sub2ApiAdminCompositeRouteEndpoint.chatCompletions => 'chat_completions',
      _ => endpoint.name,
    };

double _float64Multiplier(Sub2ApiDecimal decimal) {
  if (decimal.compareTo(Sub2ApiDecimal.zero()) <= 0) {
    throw _validation('admin.groups.invalid_rate_multiplier');
  }
  final value = double.tryParse(decimal.toJson());
  if (value == null || !value.isFinite) {
    throw _validation('admin.groups.rate_multiplier_not_representable');
  }
  if (Sub2ApiDecimal.parse(value.toString()) != decimal) {
    throw _validation('admin.groups.rate_multiplier_not_representable');
  }
  return value;
}

void _validateGroupId(int groupId) {
  if (groupId <= 0) throw _validation('admin.groups.invalid_group_id');
}

void _validatePage(int? page, int? pageSize) {
  if (page != null && page <= 0) {
    throw _validation('admin.groups.invalid_page');
  }
  if (pageSize != null && (pageSize <= 0 || pageSize > 100)) {
    throw _validation('admin.groups.invalid_page_size');
  }
}

void _validateSortOrder(String? value) {
  if (value != null && value != 'asc' && value != 'desc') {
    throw _validation('admin.groups.invalid_sort_order');
  }
}

String _wirePlatform(Sub2ApiAdminGroupPlatform platform) => switch (platform) {
  Sub2ApiAdminGroupPlatform.openAi => 'openai',
  _ => platform.name,
};

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
