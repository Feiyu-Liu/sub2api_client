import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_ops_dashboard_models.dart';
import 'sub2api_admin_ops_observability_models.dart';
import 'wire/admin_ops_observability_wire_mapper.dart';
import 'wire/admin_ops_observability_wire_service.dart';

abstract interface class Sub2ApiAdminOpsObservabilityClient {
  Future<Sub2ApiAdminOpsIngressRejectPage> listIngressRejects({
    Sub2ApiAdminOpsIngressRejectQuery query =
        const Sub2ApiAdminOpsIngressRejectQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsIngressRejectHealth> getIngressRejectHealth({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsAuthCacheInvalidationHealth> getAuthCacheHealth({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsSystemLogPage> listSystemLogs({
    Sub2ApiAdminOpsSystemLogQuery query = const Sub2ApiAdminOpsSystemLogQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsSystemLogCleanupResult> cleanupSystemLogs(
    Sub2ApiAdminOpsSystemLogCleanupRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsSystemLogSinkHealth> getSystemLogHealth({
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminOpsObservabilityClient createSub2ApiAdminOpsObservabilityClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminOpsObservabilityClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminOpsObservabilityWireService(dio);

  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminOpsObservabilityWireService _service;

  @override
  Future<Sub2ApiAdminOpsIngressRejectPage> listIngressRejects({
    Sub2ApiAdminOpsIngressRejectQuery query =
        const Sub2ApiAdminOpsIngressRejectQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final wireQuery = _ingressQuery(query);
    return _executor.protectedRequest(
      send: (cancelToken, options, value) => _service.listIngressRejects(
        wireQuery,
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsIngressRejectPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsIngressRejectHealth> getIngressRejectHealth({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, value) => _service.getIngressHealth(
      cancelToken,
      options,
      _authorization(value),
      _key(value),
    ),
    decode: mapAdminOpsIngressRejectHealth,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminOpsAuthCacheInvalidationHealth> getAuthCacheHealth({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, value) => _service.getAuthCacheHealth(
      cancelToken,
      options,
      _authorization(value),
      _key(value),
    ),
    decode: mapAdminOpsAuthCacheHealth,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminOpsSystemLogPage> listSystemLogs({
    Sub2ApiAdminOpsSystemLogQuery query = const Sub2ApiAdminOpsSystemLogQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final wireQuery = _systemLogQuery(query);
    return _executor.protectedRequest(
      send: (cancelToken, options, value) => _service.listSystemLogs(
        wireQuery,
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsSystemLogPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsSystemLogCleanupResult> cleanupSystemLogs(
    Sub2ApiAdminOpsSystemLogCleanupRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _systemLogFilter(request.filter, requireFilter: true);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, value) => _service.cleanupSystemLogs(
        body,
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsSystemLogCleanup,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsSystemLogSinkHealth> getSystemLogHealth({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, value) => _service.getSystemLogHealth(
      cancelToken,
      options,
      _authorization(value),
      _key(value),
    ),
    decode: mapAdminOpsSystemLogHealth,
    requestOptions: requestOptions,
  );

  Map<String, dynamic> _ingressQuery(Sub2ApiAdminOpsIngressRejectQuery query) {
    if (query.page < 1) throw _validation('admin.ops.invalid_page');
    if (query.pageSize < 1 || query.pageSize > 200) {
      throw _validation('admin.ops.invalid_page_size');
    }
    _positiveIds(<int?>[query.userId, query.apiKeyId]);
    _timeRange(query.startAt, query.endAt);
    final address = query.clientAddress?.trim();
    if (address != null && address.isNotEmpty && !_validIp(address)) {
      throw _validation('admin.ops.invalid_client_address');
    }
    return <String, dynamic>{
      'page': query.page,
      'page_size': query.pageSize,
      'time_range': _wireTimeRange(query.timeRange),
      'start_time': ?query.startAt?.toUtc().toIso8601String(),
      'end_time': ?query.endAt?.toUtc().toIso8601String(),
      'reason': ?query.reason == null ? null : _reason(query.reason!),
      'route_family': ?query.routeFamily == null
          ? null
          : _routeFamily(query.routeFamily!),
      'protocol': ?query.protocol?.name,
      'client_ip': ?address == null || address.isEmpty ? null : address,
      'user_id': ?query.userId,
      'api_key_id': ?query.apiKeyId,
    };
  }

  Map<String, dynamic> _systemLogQuery(Sub2ApiAdminOpsSystemLogQuery query) {
    if (query.page < 1) throw _validation('admin.ops.invalid_page');
    if (query.pageSize < 1 || query.pageSize > 200) {
      throw _validation('admin.ops.invalid_page_size');
    }
    final filter = _systemLogFilter(query.filter);
    return <String, dynamic>{
      'page': query.page,
      'page_size': query.pageSize,
      'time_range': _wireTimeRange(query.timeRange),
      ...filter,
    };
  }

  Map<String, Object?> _systemLogFilter(
    Sub2ApiAdminOpsSystemLogFilter filter, {
    bool requireFilter = false,
  }) {
    _positiveIds(<int?>[filter.userId, filter.apiKeyId, filter.accountId]);
    _timeRange(filter.startAt, filter.endAt);
    final result = <String, Object?>{
      'start_time': ?filter.startAt?.toUtc().toIso8601String(),
      'end_time': ?filter.endAt?.toUtc().toIso8601String(),
      'host': ?_optional(filter.host),
      'level': ?_optional(filter.level),
      'component': ?_optional(filter.component),
      'request_id': ?_optional(filter.requestId),
      'client_request_id': ?_optional(filter.clientRequestId),
      'user_id': ?filter.userId,
      'api_key_id': ?filter.apiKeyId,
      'account_id': ?filter.accountId,
      'platform': ?_optional(filter.platform),
      'model': ?_optional(filter.model),
      'q': ?_optional(filter.query),
    };
    if (requireFilter && result.isEmpty) {
      throw _validation('admin.ops.system_log_cleanup_filter_required');
    }
    return result;
  }

  void _positiveIds(List<int?> ids) {
    if (ids.any((id) => id != null && id <= 0)) {
      throw _validation('admin.ops.invalid_filter_id');
    }
  }

  void _timeRange(DateTime? start, DateTime? end) {
    if (start != null && end != null && start.isAfter(end)) {
      throw _validation('admin.ops.invalid_time_range');
    }
    if (start != null &&
        end != null &&
        end.difference(start) > const Duration(days: 30)) {
      throw _validation('admin.ops.time_range_too_large');
    }
  }

  String? _authorization(String? value) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? value : null;

  String? _key(String? value) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? value : null;
}

bool _validIp(String value) {
  try {
    if (value.contains(':')) {
      Uri.parseIPv6Address(value);
    } else {
      Uri.parseIPv4Address(value);
    }
    return true;
  } on FormatException {
    return false;
  }
}

String? _optional(String? value) {
  final result = value?.trim();
  return result == null || result.isEmpty ? null : result;
}

String _reason(Sub2ApiAdminOpsIngressRejectReason value) => switch (value) {
  Sub2ApiAdminOpsIngressRejectReason.queryApiKeyDeprecated =>
    'query_api_key_deprecated',
  Sub2ApiAdminOpsIngressRejectReason.apiKeyRequired => 'api_key_required',
  Sub2ApiAdminOpsIngressRejectReason.invalidApiKey => 'invalid_api_key',
  Sub2ApiAdminOpsIngressRejectReason.invalidAuthRateLimited =>
    'invalid_auth_rate_limited',
  Sub2ApiAdminOpsIngressRejectReason.apiKeyAuthOverloaded =>
    'api_key_auth_overloaded',
  Sub2ApiAdminOpsIngressRejectReason.apiKeyDisabled => 'api_key_disabled',
  Sub2ApiAdminOpsIngressRejectReason.ipRestricted => 'ip_restricted',
  Sub2ApiAdminOpsIngressRejectReason.userInactive => 'user_inactive',
  Sub2ApiAdminOpsIngressRejectReason.groupDeleted => 'group_deleted',
  Sub2ApiAdminOpsIngressRejectReason.groupDisabled => 'group_disabled',
  Sub2ApiAdminOpsIngressRejectReason.groupNotAllowed => 'group_not_allowed',
  Sub2ApiAdminOpsIngressRejectReason.groupUnassigned => 'group_unassigned',
  Sub2ApiAdminOpsIngressRejectReason.other => 'other',
};

String _routeFamily(Sub2ApiAdminOpsIngressRouteFamily value) => switch (value) {
  Sub2ApiAdminOpsIngressRouteFamily.chatCompletions => 'chat_completions',
  _ => value.name,
};

String _wireTimeRange(Sub2ApiAdminOpsTimeRange value) => switch (value) {
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
