import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_group_models.dart';
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
