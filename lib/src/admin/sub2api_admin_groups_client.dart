import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
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

  String? _authorization(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
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
