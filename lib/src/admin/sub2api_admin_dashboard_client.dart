import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_models.dart';
import 'wire/admin_dashboard_wire_dto.dart';
import 'wire/admin_dashboard_wire_mapper.dart';
import 'wire/admin_dashboard_wire_service.dart';

/// Shared typed Admin dashboard contract used by JWT and API-key facades.
abstract interface class Sub2ApiAdminDashboardClient {
  Future<Sub2ApiAdminDashboardStats> getStats({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminDashboardRealtimeMetrics> getRealtimeMetrics({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminDashboardTrend> getUsageTrend({
    Sub2ApiAdminUsageTrendQuery query = const Sub2ApiAdminUsageTrendQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminDashboardModels> getModelStats({
    Sub2ApiAdminModelStatsQuery query = const Sub2ApiAdminModelStatsQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminDashboardGroups> getGroupStats({
    Sub2ApiAdminGroupStatsQuery query = const Sub2ApiAdminGroupStatsQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminApiKeyUsageTrend> getApiKeyUsageTrend({
    Sub2ApiAdminEntityTrendQuery query = const Sub2ApiAdminEntityTrendQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUserUsageTrend> getUserUsageTrend({
    Sub2ApiAdminEntityTrendQuery query = const Sub2ApiAdminEntityTrendQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUserSpendingRanking> getUserSpendingRanking({
    Sub2ApiAdminUserSpendingRankingQuery query =
        const Sub2ApiAdminUserSpendingRankingQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Map<int, Sub2ApiAdminBatchUserUsageStats>> getBatchUsersUsage(
    List<int> userIds, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Map<int, Sub2ApiAdminBatchApiKeyUsageStats>> getBatchApiKeysUsage(
    List<int> apiKeyIds, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUserBreakdown> getUserBreakdown({
    Sub2ApiAdminUserBreakdownQuery query =
        const Sub2ApiAdminUserBreakdownQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminDashboardSnapshot> getSnapshot({
    Sub2ApiAdminDashboardSnapshotRequest request =
        const Sub2ApiAdminDashboardSnapshotRequest(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAggregationBackfillResult> backfillAggregation(
    Sub2ApiAdminAggregationBackfillRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminDashboardClient createSub2ApiAdminDashboardClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Sub2ApiAdminDashboardClient(
  dio: dio,
  requestExecutor: requestExecutor,
  credentialMode: credentialMode,
);

final class _Sub2ApiAdminDashboardClient
    implements Sub2ApiAdminDashboardClient {
  _Sub2ApiAdminDashboardClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiAdminCredentialMode credentialMode,
  }) : _requestExecutor = requestExecutor,
       _credentialMode = credentialMode,
       _service = AdminDashboardWireService(dio);

  final Sub2ApiAdminCredentialMode _credentialMode;
  final Sub2ApiRequestExecutor _requestExecutor;
  final AdminDashboardWireService _service;

  @override
  Future<Sub2ApiAdminDashboardStats> getStats({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: _credentialCall(_service.statsWithJwt, _service.statsWithApiKey),
    decode: mapAdminDashboardStats,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminDashboardRealtimeMetrics> getRealtimeMetrics({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: _credentialCall(
      _service.realtimeWithJwt,
      _service.realtimeWithApiKey,
    ),
    decode: mapAdminDashboardRealtime,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminDashboardTrend> getUsageTrend({
    Sub2ApiAdminUsageTrendQuery query = const Sub2ApiAdminUsageTrendQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateFilter(query.filter);
    final wireQuery = <String, dynamic>{
      ..._filterQuery(query.filter),
      'granularity': query.granularity.name,
      if (_text(query.model) != null) 'model': _text(query.model),
    };
    return _requestExecutor.protectedRequest(
      send: _credentialCall(
        (cancelToken, options, credential) =>
            _service.trendWithJwt(wireQuery, cancelToken, options, credential),
        (cancelToken, options, credential) => _service.trendWithApiKey(
          wireQuery,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminDashboardTrend,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminDashboardModels> getModelStats({
    Sub2ApiAdminModelStatsQuery query = const Sub2ApiAdminModelStatsQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateFilter(query.filter);
    final wireQuery = <String, dynamic>{
      ..._filterQuery(query.filter),
      'model_source': query.modelSource.name,
    };
    return _requestExecutor.protectedRequest(
      send: _credentialCall(
        (cancelToken, options, credential) =>
            _service.modelsWithJwt(wireQuery, cancelToken, options, credential),
        (cancelToken, options, credential) => _service.modelsWithApiKey(
          wireQuery,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminDashboardModels,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminDashboardGroups> getGroupStats({
    Sub2ApiAdminGroupStatsQuery query = const Sub2ApiAdminGroupStatsQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateFilter(query.filter);
    final wireQuery = _filterQuery(query.filter);
    return _requestExecutor.protectedRequest(
      send: _credentialCall(
        (cancelToken, options, credential) =>
            _service.groupsWithJwt(wireQuery, cancelToken, options, credential),
        (cancelToken, options, credential) => _service.groupsWithApiKey(
          wireQuery,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminDashboardGroups,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminApiKeyUsageTrend> getApiKeyUsageTrend({
    Sub2ApiAdminEntityTrendQuery query = const Sub2ApiAdminEntityTrendQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateEntityTrendQuery(query);
    final wireQuery = _entityTrendQuery(query);
    return _requestExecutor.protectedRequest(
      send: _credentialCall(
        (cancelToken, options, credential) => _service.apiKeyTrendWithJwt(
          wireQuery,
          cancelToken,
          options,
          credential,
        ),
        (cancelToken, options, credential) => _service.apiKeyTrendWithApiKey(
          wireQuery,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminDashboardApiKeyTrend,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUserUsageTrend> getUserUsageTrend({
    Sub2ApiAdminEntityTrendQuery query = const Sub2ApiAdminEntityTrendQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateEntityTrendQuery(query);
    final wireQuery = _entityTrendQuery(query);
    return _requestExecutor.protectedRequest(
      send: _credentialCall(
        (cancelToken, options, credential) => _service.userTrendWithJwt(
          wireQuery,
          cancelToken,
          options,
          credential,
        ),
        (cancelToken, options, credential) => _service.userTrendWithApiKey(
          wireQuery,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminDashboardUserTrend,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUserSpendingRanking> getUserSpendingRanking({
    Sub2ApiAdminUserSpendingRankingQuery query =
        const Sub2ApiAdminUserSpendingRankingQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateDateRange(query.startDate, query.endDate);
    if (query.limit != null && (query.limit! <= 0 || query.limit! > 50)) {
      throw _validation('admin.dashboard.invalid_ranking_limit');
    }
    final wireQuery = <String, dynamic>{
      if (query.startDate != null) 'start_date': _date(query.startDate!),
      if (query.endDate != null) 'end_date': _date(query.endDate!),
      if (_text(query.timezone) != null) 'timezone': _text(query.timezone),
      if (query.limit != null) 'limit': query.limit,
    };
    return _requestExecutor.protectedRequest(
      send: _credentialCall(
        (cancelToken, options, credential) => _service.userRankingWithJwt(
          wireQuery,
          cancelToken,
          options,
          credential,
        ),
        (cancelToken, options, credential) => _service.userRankingWithApiKey(
          wireQuery,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminDashboardUserRanking,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Map<int, Sub2ApiAdminBatchUserUsageStats>> getBatchUsersUsage(
    List<int> userIds, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final ids = _normalizeIds(userIds, 'admin.dashboard.invalid_user_id');
    final body = AdminDashboardUserIdsWireDto(ids);
    return _requestExecutor.protectedRequest(
      send: _credentialCall(
        (cancelToken, options, credential) =>
            _service.batchUsersWithJwt(body, cancelToken, options, credential),
        (cancelToken, options, credential) => _service.batchUsersWithApiKey(
          body,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminDashboardBatchUsers,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Map<int, Sub2ApiAdminBatchApiKeyUsageStats>> getBatchApiKeysUsage(
    List<int> apiKeyIds, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final ids = _normalizeIds(apiKeyIds, 'admin.dashboard.invalid_api_key_id');
    final body = AdminDashboardApiKeyIdsWireDto(ids);
    return _requestExecutor.protectedRequest(
      send: _credentialCall(
        (cancelToken, options, credential) => _service.batchApiKeysWithJwt(
          body,
          cancelToken,
          options,
          credential,
        ),
        (cancelToken, options, credential) => _service.batchApiKeysWithApiKey(
          body,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminDashboardBatchApiKeys,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUserBreakdown> getUserBreakdown({
    Sub2ApiAdminUserBreakdownQuery query =
        const Sub2ApiAdminUserBreakdownQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateDateRange(query.startDate, query.endDate);
    _validateId(query.userId, 'admin.dashboard.invalid_user_id');
    _validateId(query.apiKeyId, 'admin.dashboard.invalid_api_key_id');
    _validateId(query.accountId, 'admin.dashboard.invalid_account_id');
    _validateId(query.groupId, 'admin.dashboard.invalid_group_id');
    if (query.limit <= 0 || query.limit > 200) {
      throw _validation('admin.dashboard.invalid_breakdown_limit');
    }
    final wireQuery = <String, dynamic>{
      if (query.startDate != null) 'start_date': _date(query.startDate!),
      if (query.endDate != null) 'end_date': _date(query.endDate!),
      if (_text(query.timezone) != null) 'timezone': _text(query.timezone),
      if (query.groupId != null) 'group_id': query.groupId,
      if (_text(query.model) != null) 'model': _text(query.model),
      'model_source': query.modelSource.name,
      if (_text(query.endpoint) != null) 'endpoint': _text(query.endpoint),
      'endpoint_type': query.endpointType.name,
      if (query.userId != null) 'user_id': query.userId,
      if (query.apiKeyId != null) 'api_key_id': query.apiKeyId,
      if (query.accountId != null) 'account_id': query.accountId,
      if (query.requestType != null)
        'request_type': _requestType(query.requestType!),
      if (query.requestType == null && query.stream != null)
        'stream': query.stream,
      if (query.billingType != null)
        'billing_type': _billingType(query.billingType!),
      if (query.sortBy != null) 'sort_by': _sort(query.sortBy!),
      'limit': query.limit,
    };
    return _requestExecutor.protectedRequest(
      send: _credentialCall(
        (cancelToken, options, credential) => _service.userBreakdownWithJwt(
          wireQuery,
          cancelToken,
          options,
          credential,
        ),
        (cancelToken, options, credential) => _service.userBreakdownWithApiKey(
          wireQuery,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminDashboardUserBreakdown,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminDashboardSnapshot> getSnapshot({
    Sub2ApiAdminDashboardSnapshotRequest request =
        const Sub2ApiAdminDashboardSnapshotRequest(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateFilter(request.filter);
    if (request.usersTrendLimit <= 0 || request.usersTrendLimit > 50) {
      throw _validation('admin.dashboard.invalid_users_trend_limit');
    }
    final wireQuery = <String, dynamic>{
      ..._filterQuery(request.filter),
      'granularity': request.granularity.name,
      if (_text(request.model) != null) 'model': _text(request.model),
      'include_stats': request.includeStats,
      'include_trend': request.includeTrend,
      'include_model_stats': request.includeModelStats,
      'include_group_stats': request.includeGroupStats,
      'include_users_trend': request.includeUsersTrend,
      'users_trend_limit': request.usersTrendLimit,
    };
    return _requestExecutor.protectedRequest(
      send: _credentialCall(
        (cancelToken, options, credential) => _service.snapshotWithJwt(
          wireQuery,
          cancelToken,
          options,
          credential,
        ),
        (cancelToken, options, credential) => _service.snapshotWithApiKey(
          wireQuery,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminDashboardSnapshot,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAggregationBackfillResult> backfillAggregation(
    Sub2ApiAdminAggregationBackfillRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (!request.start.isBefore(request.end)) {
      throw _validation('admin.dashboard.invalid_backfill_range');
    }
    final body = AdminDashboardBackfillRequestWireDto(
      start: request.start.toUtc().toIso8601String(),
      end: request.end.toUtc().toIso8601String(),
    );
    return _requestExecutor.protectedNonReplayableRequest(
      send: _credentialCall(
        (cancelToken, options, credential) =>
            _service.backfillWithJwt(body, cancelToken, options, credential),
        (cancelToken, options, credential) =>
            _service.backfillWithApiKey(body, cancelToken, options, credential),
      ),
      decode: mapAdminDashboardBackfill,
      requestOptions: requestOptions,
    );
  }

  Sub2ApiWireCall _credentialCall(
    Sub2ApiWireCall jwt,
    Sub2ApiWireCall apiKey,
  ) => switch (_credentialMode) {
    Sub2ApiAdminCredentialMode.jwt => jwt,
    Sub2ApiAdminCredentialMode.apiKey => apiKey,
  };

  static Map<String, dynamic> _filterQuery(
    Sub2ApiAdminDashboardFilter filter,
  ) => <String, dynamic>{
    if (filter.startDate != null) 'start_date': _date(filter.startDate!),
    if (filter.endDate != null) 'end_date': _date(filter.endDate!),
    if (_text(filter.timezone) != null) 'timezone': _text(filter.timezone),
    if (filter.userId != null) 'user_id': filter.userId,
    if (filter.apiKeyId != null) 'api_key_id': filter.apiKeyId,
    if (filter.accountId != null) 'account_id': filter.accountId,
    if (filter.groupId != null) 'group_id': filter.groupId,
    if (filter.requestType != null)
      'request_type': _requestType(filter.requestType!),
    if (filter.requestType == null && filter.stream != null)
      'stream': filter.stream,
    if (filter.billingType != null)
      'billing_type': _billingType(filter.billingType!),
    if (filter.upstreamModelMismatch != null)
      'upstream_model_mismatch': filter.upstreamModelMismatch,
  };

  static Map<String, dynamic> _entityTrendQuery(
    Sub2ApiAdminEntityTrendQuery query,
  ) => <String, dynamic>{
    if (query.startDate != null) 'start_date': _date(query.startDate!),
    if (query.endDate != null) 'end_date': _date(query.endDate!),
    if (_text(query.timezone) != null) 'timezone': _text(query.timezone),
    'granularity': query.granularity.name,
    if (query.limit != null) 'limit': query.limit,
  };

  static void _validateFilter(Sub2ApiAdminDashboardFilter filter) {
    _validateDateRange(filter.startDate, filter.endDate);
    _validateId(filter.userId, 'admin.dashboard.invalid_user_id');
    _validateId(filter.apiKeyId, 'admin.dashboard.invalid_api_key_id');
    _validateId(filter.accountId, 'admin.dashboard.invalid_account_id');
    _validateId(filter.groupId, 'admin.dashboard.invalid_group_id');
  }

  static void _validateEntityTrendQuery(Sub2ApiAdminEntityTrendQuery query) {
    _validateDateRange(query.startDate, query.endDate);
    if (query.limit != null && query.limit! <= 0) {
      throw _validation('admin.dashboard.invalid_trend_limit');
    }
  }

  static void _validateDateRange(DateTime? start, DateTime? end) {
    if (start != null && end != null && start.isAfter(end)) {
      throw _validation('admin.dashboard.invalid_date_range');
    }
  }

  static void _validateId(int? id, String code) {
    if (id != null && id <= 0) throw _validation(code);
  }

  static List<int> _normalizeIds(List<int> ids, String code) {
    if (ids.any((id) => id <= 0)) throw _validation(code);
    final normalized = ids.toSet().toList()..sort();
    return List<int>.unmodifiable(normalized);
  }

  static String _date(DateTime value) =>
      '${value.year.toString().padLeft(4, '0')}-'
      '${value.month.toString().padLeft(2, '0')}-'
      '${value.day.toString().padLeft(2, '0')}';

  static String? _text(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  static String _requestType(Sub2ApiAdminUsageRequestType value) =>
      switch (value) {
        Sub2ApiAdminUsageRequestType.webSocketV2 => 'ws_v2',
        _ => value.name,
      };

  static int _billingType(Sub2ApiAdminBillingType value) => switch (value) {
    Sub2ApiAdminBillingType.balance => 0,
    Sub2ApiAdminBillingType.subscription => 1,
  };

  static String _sort(Sub2ApiAdminUserBreakdownSort value) => switch (value) {
    Sub2ApiAdminUserBreakdownSort.totalTokens => 'total_tokens',
    Sub2ApiAdminUserBreakdownSort.inputTokens => 'input_tokens',
    Sub2ApiAdminUserBreakdownSort.outputTokens => 'output_tokens',
    Sub2ApiAdminUserBreakdownSort.cacheTokens => 'cache_tokens',
    Sub2ApiAdminUserBreakdownSort.requests => 'requests',
    Sub2ApiAdminUserBreakdownSort.cost => 'cost',
    Sub2ApiAdminUserBreakdownSort.actualCost => 'actual_cost',
  };
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
