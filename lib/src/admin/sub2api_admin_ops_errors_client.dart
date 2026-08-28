import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_ops_dashboard_models.dart';
import 'sub2api_admin_ops_error_models.dart';
import 'wire/admin_ops_error_wire_mapper.dart';
import 'wire/admin_ops_error_wire_service.dart';

abstract interface class Sub2ApiAdminOpsErrorsClient {
  Future<Sub2ApiAdminOpsErrorPage> listLegacyErrors({
    Sub2ApiAdminOpsErrorQuery query = const Sub2ApiAdminOpsErrorQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsErrorRecord> getLegacyError(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsResolutionResult> resolveLegacyError(
    int id, {
    required bool resolved,
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsErrorPage> listRequestErrors({
    Sub2ApiAdminOpsErrorQuery query = const Sub2ApiAdminOpsErrorQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsErrorRecord> getRequestError(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsErrorPage> listCorrelatedUpstreamErrors(
    int id, {
    Sub2ApiAdminOpsErrorQuery query = const Sub2ApiAdminOpsErrorQuery(
      timeRange: Sub2ApiAdminOpsTimeRange.thirtyDays,
    ),
    bool includeDetails = true,
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsResolutionResult> resolveRequestError(
    int id, {
    required bool resolved,
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsErrorPage> listUpstreamErrors({
    Sub2ApiAdminOpsErrorQuery query = const Sub2ApiAdminOpsErrorQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsErrorRecord> getUpstreamError(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsResolutionResult> resolveUpstreamError(
    int id, {
    required bool resolved,
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsRequestPage> listRequests({
    Sub2ApiAdminOpsRequestQuery query = const Sub2ApiAdminOpsRequestQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminOpsErrorsClient createSub2ApiAdminOpsErrorsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminOpsErrorsClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminOpsErrorWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminOpsErrorWireService _service;
  @override
  Future<Sub2ApiAdminOpsErrorPage> listLegacyErrors({
    Sub2ApiAdminOpsErrorQuery query = const Sub2ApiAdminOpsErrorQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) => _list(query, _service.legacyList, requestOptions);
  @override
  Future<Sub2ApiAdminOpsErrorRecord> getLegacyError(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _detail(id, _service.legacyDetail, requestOptions);
  @override
  Future<Sub2ApiAdminOpsResolutionResult> resolveLegacyError(
    int id, {
    required bool resolved,
    Sub2ApiRequestOptions? requestOptions,
  }) => _resolve(id, resolved, _service.legacyResolve, requestOptions);
  @override
  Future<Sub2ApiAdminOpsErrorPage> listRequestErrors({
    Sub2ApiAdminOpsErrorQuery query = const Sub2ApiAdminOpsErrorQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) => _list(query, _service.requestList, requestOptions);
  @override
  Future<Sub2ApiAdminOpsErrorRecord> getRequestError(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _detail(id, _service.requestDetail, requestOptions);
  @override
  Future<Sub2ApiAdminOpsErrorPage> listCorrelatedUpstreamErrors(
    int id, {
    Sub2ApiAdminOpsErrorQuery query = const Sub2ApiAdminOpsErrorQuery(
      timeRange: Sub2ApiAdminOpsTimeRange.thirtyDays,
    ),
    bool includeDetails = true,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    final q = _query(query)..['include_detail'] = includeDetails;
    return _executor.protectedRequest(
      send: (c, o, v) => _service.correlated(id, q, c, o, _a(v), _k(v)),
      decode: mapAdminOpsErrorPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsResolutionResult> resolveRequestError(
    int id, {
    required bool resolved,
    Sub2ApiRequestOptions? requestOptions,
  }) => _resolve(id, resolved, _service.requestResolve, requestOptions);

  @override
  Future<Sub2ApiAdminOpsErrorPage> listUpstreamErrors({
    Sub2ApiAdminOpsErrorQuery query = const Sub2ApiAdminOpsErrorQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) => _list(query, _service.upstreamList, requestOptions);

  @override
  Future<Sub2ApiAdminOpsErrorRecord> getUpstreamError(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _detail(id, _service.upstreamDetail, requestOptions);

  @override
  Future<Sub2ApiAdminOpsResolutionResult> resolveUpstreamError(
    int id, {
    required bool resolved,
    Sub2ApiRequestOptions? requestOptions,
  }) => _resolve(id, resolved, _service.upstreamResolve, requestOptions);

  @override
  Future<Sub2ApiAdminOpsRequestPage> listRequests({
    Sub2ApiAdminOpsRequestQuery query = const Sub2ApiAdminOpsRequestQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final q = _requestQuery(query);
    return _executor.protectedRequest(
      send: (c, o, v) => _service.requests(q, c, o, _a(v), _k(v)),
      decode: mapAdminOpsRequestPage,
      requestOptions: requestOptions,
    );
  }

  Future<Sub2ApiAdminOpsErrorPage> _list(
    Sub2ApiAdminOpsErrorQuery query,
    Future<HttpResponse<Object?>> Function(
      Map<String, dynamic>,
      CancelToken,
      Options,
      String?,
      String?,
    )
    send,
    Sub2ApiRequestOptions? requestOptions,
  ) {
    final q = _query(query);
    return _executor.protectedRequest(
      send: (c, o, v) => send(q, c, o, _a(v), _k(v)),
      decode: mapAdminOpsErrorPage,
      requestOptions: requestOptions,
    );
  }

  Future<Sub2ApiAdminOpsErrorRecord> _detail(
    int id,
    Future<HttpResponse<Object?>> Function(
      int,
      CancelToken,
      Options,
      String?,
      String?,
    )
    send,
    Sub2ApiRequestOptions? requestOptions,
  ) {
    _id(id);
    return _executor.protectedRequest(
      send: (c, o, v) => send(id, c, o, _a(v), _k(v)),
      decode: mapAdminOpsErrorDetail,
      requestOptions: requestOptions,
    );
  }

  Future<Sub2ApiAdminOpsResolutionResult> _resolve(
    int id,
    bool resolved,
    Future<HttpResponse<Object?>> Function(
      int,
      Map<String, Object?>,
      CancelToken,
      Options,
      String?,
      String?,
    )
    send,
    Sub2ApiRequestOptions? requestOptions,
  ) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) =>
          send(id, <String, Object?>{'resolved': resolved}, c, o, _a(v), _k(v)),
      decode: mapAdminOpsResolution,
      requestOptions: requestOptions,
    );
  }

  Map<String, Object?> _query(Sub2ApiAdminOpsErrorQuery q) {
    if (q.page < 1) throw _validation('admin.ops.invalid_page');
    if (q.pageSize < 1 || q.pageSize > 500) {
      throw _validation('admin.ops.invalid_page_size');
    }
    for (final id in <int?>[q.groupId, q.accountId, q.userId, q.apiKeyId]) {
      if (id != null && id <= 0) {
        throw _validation('admin.ops.invalid_filter_id');
      }
    }
    if (q.statusCodes.any((code) => code < 0)) {
      throw _validation('admin.ops.invalid_status_codes');
    }
    final start = q.startAt?.toUtc();
    final end = q.endAt?.toUtc();
    if (start != null && end != null && start.isAfter(end)) {
      throw _validation('admin.ops.invalid_time_range');
    }
    if (start != null &&
        end != null &&
        end.difference(start) > const Duration(days: 30)) {
      throw _validation('admin.ops.time_range_too_large');
    }
    return <String, Object?>{
      'page': q.page,
      'page_size': q.pageSize,
      'time_range': _timeRange(q.timeRange),
      'start_time': ?start?.toIso8601String(),
      'end_time': ?end?.toIso8601String(),
      'view': _view(q.view),
      'phase': ?_optional(q.phase),
      'error_owner': ?_optional(q.owner),
      'error_source': ?_optional(q.source),
      'q': ?_optional(q.query),
      'user_query': ?_optional(q.userQuery),
      'model': ?_optional(q.model),
      'category': ?_optional(q.category),
      'platform': ?_optional(q.platform),
      'group_id': ?q.groupId,
      'account_id': ?q.accountId,
      'user_id': ?q.userId,
      'api_key_id': ?q.apiKeyId,
      'resolved': ?q.resolved,
      'status_codes': q.statusCodes.isEmpty ? null : q.statusCodes.join(','),
      'sort_by': _sort(q.sortBy),
      'sort_order': q.sortOrder == Sub2ApiAdminOpsSortOrder.ascending
          ? 'asc'
          : 'desc',
    };
  }

  Map<String, Object?> _requestQuery(Sub2ApiAdminOpsRequestQuery q) {
    if (q.page < 1) throw _validation('admin.ops.invalid_page');
    if (q.pageSize < 1 || q.pageSize > 100) {
      throw _validation('admin.ops.invalid_page_size');
    }
    for (final id in <int?>[q.groupId, q.userId, q.apiKeyId, q.accountId]) {
      if (id != null && id <= 0) {
        throw _validation('admin.ops.invalid_filter_id');
      }
    }
    if ((q.minDurationMs != null && q.minDurationMs! < 0) ||
        (q.maxDurationMs != null && q.maxDurationMs! < 0)) {
      throw _validation('admin.ops.invalid_duration');
    }
    if (q.minDurationMs != null &&
        q.maxDurationMs != null &&
        q.minDurationMs! > q.maxDurationMs!) {
      throw _validation('admin.ops.invalid_duration_range');
    }
    final start = q.startAt?.toUtc();
    final end = q.endAt?.toUtc();
    if (start != null && end != null && start.isAfter(end)) {
      throw _validation('admin.ops.invalid_time_range');
    }
    if (start != null &&
        end != null &&
        end.difference(start) > const Duration(days: 30)) {
      throw _validation('admin.ops.time_range_too_large');
    }
    return <String, Object?>{
      'page': q.page,
      'page_size': q.pageSize,
      'time_range': _timeRange(q.timeRange),
      'start_time': ?start?.toIso8601String(),
      'end_time': ?end?.toIso8601String(),
      'kind': q.kind.name,
      'platform': ?_optional(q.platform),
      'group_id': ?q.groupId,
      'user_id': ?q.userId,
      'api_key_id': ?q.apiKeyId,
      'account_id': ?q.accountId,
      'model': ?_optional(q.model),
      'request_id': ?_optional(q.requestId),
      'q': ?_optional(q.query),
      'min_duration_ms': ?q.minDurationMs,
      'max_duration_ms': ?q.maxDurationMs,
      'sort': q.sort == Sub2ApiAdminOpsRequestSort.durationDescending
          ? 'duration_desc'
          : 'created_at_desc',
    };
  }

  void _id(int id) {
    if (id <= 0) throw _validation('admin.ops.invalid_error_id');
  }

  String? _a(String? v) => _mode == Sub2ApiAdminCredentialMode.jwt ? v : null;
  String? _k(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? v : null;
}

String? _optional(String? v) {
  final t = v?.trim();
  return t == null || t.isEmpty ? null : t;
}

String _view(Sub2ApiAdminOpsErrorView v) => v.name;
String _sort(Sub2ApiAdminOpsErrorSortBy v) => switch (v) {
  Sub2ApiAdminOpsErrorSortBy.createdAt => 'created_at',
  Sub2ApiAdminOpsErrorSortBy.model => 'model',
  Sub2ApiAdminOpsErrorSortBy.statusCode => 'status_code',
};
String _timeRange(Sub2ApiAdminOpsTimeRange v) => switch (v) {
  Sub2ApiAdminOpsTimeRange.fiveMinutes => '5m',
  Sub2ApiAdminOpsTimeRange.thirtyMinutes => '30m',
  Sub2ApiAdminOpsTimeRange.oneHour => '1h',
  Sub2ApiAdminOpsTimeRange.sixHours => '6h',
  Sub2ApiAdminOpsTimeRange.twentyFourHours => '24h',
  Sub2ApiAdminOpsTimeRange.sevenDays => '7d',
  Sub2ApiAdminOpsTimeRange.thirtyDays => '30d',
};
Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
