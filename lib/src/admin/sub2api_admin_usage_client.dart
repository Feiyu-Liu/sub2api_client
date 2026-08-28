import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_models.dart';
import 'sub2api_admin_usage_models.dart';
import 'wire/admin_usage_wire_mapper.dart';
import 'wire/admin_usage_wire_service.dart';

abstract interface class Sub2ApiAdminUsageClient {
  Future<Sub2ApiAdminUsagePage> list({
    Sub2ApiAdminUsageQuery query = const Sub2ApiAdminUsageQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUsageStats> stats({
    Sub2ApiAdminUsageStatsQuery query = const Sub2ApiAdminUsageStatsQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminUsageUserSearchResult>> searchUsers(
    String query, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminUsageApiKeySearchResult>> searchApiKeys({
    int? userId,
    String query = '',
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUsageCleanupTaskPage> listCleanupTasks({
    int page = 1,
    int pageSize = 20,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUsageCleanupTask> createCleanupTask(
    Sub2ApiAdminCreateUsageCleanupTaskRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminCancelUsageCleanupTaskResult> cancelCleanupTask(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminUsageClient createSub2ApiAdminUsageClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminUsageClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminUsageWireService(dio);

  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminUsageWireService _service;

  @override
  Future<Sub2ApiAdminUsagePage> list({
    Sub2ApiAdminUsageQuery query = const Sub2ApiAdminUsageQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _page(query.page, query.pageSize);
    _filters(
      userId: query.userId,
      apiKeyId: query.apiKeyId,
      accountId: query.accountId,
      groupId: query.groupId,
      requestType: query.requestType,
      stream: query.stream,
    );
    final sortBy = query.sortBy.trim();
    if (sortBy.isEmpty || sortBy.length > 50) {
      throw _validation('admin.usage.invalid_sort_by');
    }
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.list(
        <String, dynamic>{
          'page': query.page,
          'page_size': query.pageSize,
          if (query.exactTotal) 'exact_total': true,
          ..._filterQuery(
            userId: query.userId,
            apiKeyId: query.apiKeyId,
            accountId: query.accountId,
            groupId: query.groupId,
            model: query.model,
            requestType: query.requestType,
            stream: query.stream,
            billingType: query.billingType,
            billingMode: query.billingMode,
            upstreamModelMismatch: query.upstreamModelMismatch,
            startDate: query.startDate,
            endDate: query.endDate,
            timezone: query.timezone,
          ),
          if (query.requestId?.trim().isNotEmpty ?? false)
            'request_id': query.requestId!.trim(),
          'sort_by': sortBy,
          'sort_order': _sortOrder(query.sortOrder),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminUsagePage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUsageStats> stats({
    Sub2ApiAdminUsageStatsQuery query = const Sub2ApiAdminUsageStatsQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _filters(
      userId: query.userId,
      apiKeyId: query.apiKeyId,
      accountId: query.accountId,
      groupId: query.groupId,
      requestType: query.requestType,
      stream: query.stream,
    );
    if ((query.startDate == null) != (query.endDate == null)) {
      throw _validation('admin.usage.stats_date_range_required');
    }
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.stats(
        <String, dynamic>{
          ..._filterQuery(
            userId: query.userId,
            apiKeyId: query.apiKeyId,
            accountId: query.accountId,
            groupId: query.groupId,
            model: query.model,
            requestType: query.requestType,
            stream: query.stream,
            billingType: query.billingType,
            billingMode: query.billingMode,
            upstreamModelMismatch: query.upstreamModelMismatch,
            startDate: query.startDate,
            endDate: query.endDate,
            timezone: query.timezone,
          ),
          if (query.startDate == null) 'period': query.period.name,
          if (query.bypassCache) 'nocache': true,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminUsageStats,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminUsageUserSearchResult>> searchUsers(
    String query, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, credential) => _service.searchUsers(
      query.trim(),
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminUsageUsers,
    requestOptions: requestOptions,
  );

  @override
  Future<List<Sub2ApiAdminUsageApiKeySearchResult>> searchApiKeys({
    int? userId,
    String query = '',
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _optionalId(userId, 'user_id');
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.searchApiKeys(
        userId,
        query.trim(),
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminUsageApiKeys,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUsageCleanupTaskPage> listCleanupTasks({
    int page = 1,
    int pageSize = 20,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _page(page, pageSize);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.cleanupTasks(
        page,
        pageSize,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminUsageCleanupTaskPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUsageCleanupTask> createCleanupTask(
    Sub2ApiAdminCreateUsageCleanupTaskRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final key = request.idempotencyKey.trim();
    if (key.isEmpty) {
      throw _validation('admin.usage.idempotency_key_required');
    }
    if (request.endDate.isBefore(request.startDate)) {
      throw _validation('admin.usage.invalid_cleanup_range');
    }
    _filters(
      userId: request.userId,
      apiKeyId: request.apiKeyId,
      accountId: request.accountId,
      groupId: request.groupId,
      requestType: request.requestType,
      stream: request.stream,
    );
    final body = <String, Object?>{
      'start_date': _dateOnly(request.startDate),
      'end_date': _dateOnly(request.endDate),
      if (request.userId != null) 'user_id': request.userId,
      if (request.apiKeyId != null) 'api_key_id': request.apiKeyId,
      if (request.accountId != null) 'account_id': request.accountId,
      if (request.groupId != null) 'group_id': request.groupId,
      if (request.model?.trim().isNotEmpty ?? false)
        'model': request.model!.trim(),
      if (request.requestType != null)
        'request_type': _requestType(request.requestType!),
      if (request.requestType == null && request.stream != null)
        'stream': request.stream,
      if (request.billingType != null)
        'billing_type': _billingType(request.billingType!),
      if (request.timezone?.trim().isNotEmpty ?? false)
        'timezone': request.timezone!.trim(),
    };
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.createCleanupTask(
        body,
        key,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminUsageCleanupTask,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminCancelUsageCleanupTaskResult> cancelCleanupTask(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (id <= 0) throw _validation('admin.usage.invalid_cleanup_task_id');
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.cancelCleanupTask(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminCancelUsageCleanupTask,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

Map<String, dynamic> _filterQuery({
  required int? userId,
  required int? apiKeyId,
  required int? accountId,
  required int? groupId,
  required String? model,
  required Sub2ApiAdminUsageRequestType? requestType,
  required bool? stream,
  required Sub2ApiAdminBillingType? billingType,
  required String? billingMode,
  required bool? upstreamModelMismatch,
  required DateTime? startDate,
  required DateTime? endDate,
  required String? timezone,
}) => <String, dynamic>{
  'user_id': ?userId,
  'api_key_id': ?apiKeyId,
  'account_id': ?accountId,
  'group_id': ?groupId,
  if (model?.trim().isNotEmpty ?? false) 'model': model!.trim(),
  if (requestType != null) 'request_type': _requestType(requestType),
  if (requestType == null && stream != null) 'stream': stream,
  if (billingType != null) 'billing_type': _billingType(billingType),
  if (billingMode?.trim().isNotEmpty ?? false)
    'billing_mode': billingMode!.trim(),
  'upstream_model_mismatch': ?upstreamModelMismatch,
  if (startDate != null) 'start_date': _dateOnly(startDate),
  if (endDate != null) 'end_date': _dateOnly(endDate),
  if (timezone?.trim().isNotEmpty ?? false) 'timezone': timezone!.trim(),
};

void _filters({
  required int? userId,
  required int? apiKeyId,
  required int? accountId,
  required int? groupId,
  required Sub2ApiAdminUsageRequestType? requestType,
  required bool? stream,
}) {
  _optionalId(userId, 'user_id');
  _optionalId(apiKeyId, 'api_key_id');
  _optionalId(accountId, 'account_id');
  _optionalId(groupId, 'group_id');
  if (requestType != null && stream != null) {
    throw _validation('admin.usage.request_type_stream_conflict');
  }
}

void _optionalId(int? value, String field) {
  if (value != null && value <= 0) {
    throw _validation('admin.usage.invalid_$field');
  }
}

void _page(int page, int pageSize) {
  if (page <= 0) throw _validation('admin.usage.invalid_page');
  if (pageSize <= 0 || pageSize > 1000) {
    throw _validation('admin.usage.invalid_page_size');
  }
}

String _requestType(Sub2ApiAdminUsageRequestType value) => switch (value) {
  Sub2ApiAdminUsageRequestType.webSocketV2 => 'ws_v2',
  _ => value.name,
};

int _billingType(Sub2ApiAdminBillingType value) =>
    value == Sub2ApiAdminBillingType.balance ? 0 : 1;

String _sortOrder(Sub2ApiAdminUsageSortOrder value) =>
    value == Sub2ApiAdminUsageSortOrder.ascending ? 'asc' : 'desc';

String _dateOnly(DateTime value) =>
    '${value.year.toString().padLeft(4, '0')}-'
    '${value.month.toString().padLeft(2, '0')}-'
    '${value.day.toString().padLeft(2, '0')}';

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
