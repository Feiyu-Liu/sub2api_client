import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_page.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_usage_dto.dart';
import 'sub2api_usage_mapper.dart';
import 'sub2api_usage_models.dart';
import 'sub2api_usage_service.dart';

/// Typed authenticated Usage endpoints for the v0.1.183 user API.
abstract interface class Sub2ApiUsageClient {
  /// Lists authenticated usage records.
  Future<Sub2ApiPage<Sub2ApiUsageRecord>> list(
    Sub2ApiUsageQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads one authenticated usage record.
  Future<Sub2ApiUsageRecord> detail(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads aggregate authenticated usage statistics.
  Future<Sub2ApiUsageStats> stats(
    Sub2ApiUsageQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Lists the current user's failed requests using the server's redacted view.
  Future<Sub2ApiPage<Sub2ApiUsageError>> listErrors(
    Sub2ApiUsageErrorQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads one redacted failed-request detail after ownership validation.
  Future<Sub2ApiUsageErrorDetail> errorDetail(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads cumulative, daily, platform, RPM, and TPM dashboard totals.
  Future<Sub2ApiUsageDashboardStats> dashboardStats({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads a filtered dashboard usage trend.
  Future<Sub2ApiUsageTrend> dashboardTrend(
    Sub2ApiUsageDashboardQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads requested-model aggregates for a dashboard range.
  Future<Sub2ApiUsageModels> dashboardModels(
    Sub2ApiUsageDashboardQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads one server-consistent trend/model/group dashboard snapshot.
  Future<Sub2ApiUsageDashboardSnapshot> dashboardSnapshot(
    Sub2ApiUsageDashboardSnapshotRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads current-day and cumulative usage for up to 100 owned API keys.
  Future<Map<int, Sub2ApiUsageApiKeyStats>> dashboardApiKeysUsage(
    List<int> apiKeyIds, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

/// Creates the package-internal Usage implementation.
///
/// This factory is deliberately not exported from `sub2api_client.dart`.
Sub2ApiUsageClient createSub2ApiUsageClient({
  required Sub2ApiRequestExecutor requestExecutor,
  required Dio dio,
}) => _Sub2ApiUsageClient(requestExecutor: requestExecutor, dio: dio);

final class _Sub2ApiUsageClient implements Sub2ApiUsageClient {
  _Sub2ApiUsageClient({
    required Sub2ApiRequestExecutor requestExecutor,
    required Dio dio,
  }) : _requestExecutor = requestExecutor,
       _service = Sub2ApiUsageService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final Sub2ApiUsageService _service;

  @override
  Future<Sub2ApiPage<Sub2ApiUsageRecord>> list(
    Sub2ApiUsageQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) => _service.list(
      query.page,
      query.pageSize,
      query.apiKeyId,
      query.groupId,
      query.model,
      query.requestType,
      query.stream,
      query.billingType,
      query.billingMode,
      _date(query.startDate),
      _date(query.endDate),
      query.timezone,
      query.sortBy,
      query.sortOrder,
      cancelToken,
      options,
      authorization,
    ),
    decode: mapUsagePage,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiUsageRecord> detail(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) =>
        _service.detail(id, cancelToken, options, authorization),
    decode: mapUsageDetail,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiUsageStats> stats(
    Sub2ApiUsageQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) => _service.stats(
      query.apiKeyId,
      query.groupId,
      query.model,
      query.requestType,
      query.stream,
      query.billingType,
      query.billingMode,
      _date(query.startDate),
      _date(query.endDate),
      query.timezone,
      cancelToken,
      options,
      authorization,
    ),
    decode: mapUsageStatistics,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiPage<Sub2ApiUsageError>> listErrors(
    Sub2ApiUsageErrorQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateErrorQuery(query);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, authorization) => _service.listErrors(
        _errorQuery(query),
        cancelToken,
        options,
        authorization,
      ),
      decode: mapUsageErrorPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiUsageErrorDetail> errorDetail(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (id <= 0) throw _validation('usage.invalid_error_id');
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, authorization) =>
          _service.errorDetail(id, cancelToken, options, authorization),
      decode: mapUsageErrorDetail,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiUsageDashboardStats> dashboardStats({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) =>
        _service.dashboardStats(cancelToken, options, authorization),
    decode: mapUsageDashboardStats,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiUsageTrend> dashboardTrend(
    Sub2ApiUsageDashboardQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateDashboardQuery(query);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, authorization) => _service.dashboardTrend(
        _dashboardQuery(query),
        cancelToken,
        options,
        authorization,
      ),
      decode: mapUsageDashboardTrend,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiUsageModels> dashboardModels(
    Sub2ApiUsageDashboardQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateDashboardQuery(query);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, authorization) => _service.dashboardModels(
        <String, dynamic>{
          ..._dashboardQuery(query),
          'model_source': 'requested',
        },
        cancelToken,
        options,
        authorization,
      ),
      decode: mapUsageDashboardModels,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiUsageDashboardSnapshot> dashboardSnapshot(
    Sub2ApiUsageDashboardSnapshotRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateDashboardQuery(request.query);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, authorization) => _service.dashboardSnapshot(
        <String, dynamic>{
          ..._dashboardQuery(request.query),
          'include_trend': request.includeTrend,
          'include_model_stats': request.includeModelStats,
          'include_group_stats': request.includeGroupStats,
        },
        cancelToken,
        options,
        authorization,
      ),
      decode: mapUsageDashboardSnapshot,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Map<int, Sub2ApiUsageApiKeyStats>> dashboardApiKeysUsage(
    List<int> apiKeyIds, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (apiKeyIds.length > 100) {
      throw _validation('usage.too_many_api_key_ids');
    }
    if (apiKeyIds.any((id) => id <= 0)) {
      throw _validation('usage.invalid_api_key_id');
    }
    final ids = List<int>.unmodifiable(apiKeyIds);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, authorization) =>
          _service.dashboardApiKeysUsage(
            Sub2ApiUsageApiKeysRequestDto(ids),
            cancelToken,
            options,
            authorization,
          ),
      decode: mapUsageApiKeyStats,
      requestOptions: requestOptions,
    );
  }

  static String? _date(DateTime? value) =>
      value?.toIso8601String().split('T').first;

  static Map<String, dynamic> _errorQuery(Sub2ApiUsageErrorQuery query) =>
      <String, dynamic>{
        'page': query.page,
        'page_size': query.pageSize,
        if (query.startDate != null) 'start_date': _date(query.startDate),
        if (query.endDate != null) 'end_date': _date(query.endDate),
        if (_text(query.timezone) != null) 'timezone': _text(query.timezone),
        if (_text(query.model) != null) 'model': _text(query.model),
        if (query.statusCode != null) 'status_code': query.statusCode,
        if (_text(query.category) != null) 'category': _text(query.category),
        if (query.apiKeyId != null) 'api_key_id': query.apiKeyId,
        'sort_by': query.sortBy,
        'sort_order': query.sortOrder,
      };

  static Map<String, dynamic> _dashboardQuery(
    Sub2ApiUsageDashboardQuery query,
  ) => <String, dynamic>{
    if (query.startDate != null) 'start_date': _date(query.startDate),
    if (query.endDate != null) 'end_date': _date(query.endDate),
    if (_text(query.period) != null) 'period': _text(query.period),
    'granularity': query.granularity.name,
    if (query.apiKeyId != null) 'api_key_id': query.apiKeyId,
    if (query.groupId != null) 'group_id': query.groupId,
    if (_text(query.model) != null) 'model': _text(query.model),
    if (_text(query.requestType) != null)
      'request_type': _text(query.requestType),
    if (query.stream != null) 'stream': query.stream,
    if (query.billingType != null) 'billing_type': query.billingType,
    if (_text(query.billingMode) != null)
      'billing_mode': _text(query.billingMode),
    if (_text(query.timezone) != null) 'timezone': _text(query.timezone),
  };

  static void _validateErrorQuery(Sub2ApiUsageErrorQuery query) {
    if (query.page <= 0) throw _validation('usage.invalid_page');
    if (query.pageSize <= 0 || query.pageSize > 100) {
      throw _validation('usage.invalid_page_size');
    }
    if (query.apiKeyId != null && query.apiKeyId! <= 0) {
      throw _validation('usage.invalid_api_key_id');
    }
    if (query.statusCode != null && query.statusCode! < 0) {
      throw _validation('usage.invalid_status_code');
    }
    if (query.sortOrder != 'asc' && query.sortOrder != 'desc') {
      throw _validation('usage.invalid_sort_order');
    }
    _validateDateRange(query.startDate, query.endDate);
  }

  static void _validateDashboardQuery(Sub2ApiUsageDashboardQuery query) {
    if (query.apiKeyId != null && query.apiKeyId! <= 0) {
      throw _validation('usage.invalid_api_key_id');
    }
    if (query.groupId != null && query.groupId! <= 0) {
      throw _validation('usage.invalid_group_id');
    }
    _validateDateRange(query.startDate, query.endDate);
  }

  static void _validateDateRange(DateTime? start, DateTime? end) {
    if (start != null && end != null && start.isAfter(end)) {
      throw _validation('usage.invalid_date_range');
    }
  }

  static String? _text(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  static Sub2ApiException _validation(String code) => Sub2ApiException(
    kind: Sub2ApiFailureKind.validation,
    code: code,
    retryable: false,
  );
}
