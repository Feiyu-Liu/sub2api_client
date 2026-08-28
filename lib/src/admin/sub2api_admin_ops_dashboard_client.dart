import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_ops_dashboard_models.dart';
import 'wire/admin_ops_dashboard_wire_mapper.dart';
import 'wire/admin_ops_dashboard_wire_service.dart';

abstract interface class Sub2ApiAdminOpsDashboardClient {
  Future<Sub2ApiAdminOpsDashboardSnapshot> getSnapshot({
    Sub2ApiAdminOpsDashboardQuery query = const Sub2ApiAdminOpsDashboardQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsDashboardOverview> getOverview({
    Sub2ApiAdminOpsDashboardQuery query = const Sub2ApiAdminOpsDashboardQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsThroughputTrend> getThroughputTrend({
    Sub2ApiAdminOpsDashboardQuery query = const Sub2ApiAdminOpsDashboardQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsLatencyHistogram> getLatencyHistogram({
    Sub2ApiAdminOpsDashboardQuery query = const Sub2ApiAdminOpsDashboardQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsErrorTrend> getErrorTrend({
    Sub2ApiAdminOpsDashboardQuery query = const Sub2ApiAdminOpsDashboardQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsErrorDistribution> getErrorDistribution({
    Sub2ApiAdminOpsDashboardQuery query = const Sub2ApiAdminOpsDashboardQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminOpsOpenAITokenStats> getOpenAITokenStats({
    Sub2ApiAdminOpsOpenAITokenStatsQuery query =
        const Sub2ApiAdminOpsOpenAITokenStatsQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminOpsDashboardClient createSub2ApiAdminOpsDashboardClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminOpsDashboardClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminOpsDashboardWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminOpsDashboardWireService _service;

  @override
  Future<Sub2ApiAdminOpsDashboardSnapshot> getSnapshot({
    Sub2ApiAdminOpsDashboardQuery query = const Sub2ApiAdminOpsDashboardQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) => _read(
    query,
    _service.snapshot,
    mapAdminOpsDashboardSnapshot,
    requestOptions,
  );
  @override
  Future<Sub2ApiAdminOpsDashboardOverview> getOverview({
    Sub2ApiAdminOpsDashboardQuery query = const Sub2ApiAdminOpsDashboardQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) => _read(
    query,
    _service.overview,
    mapAdminOpsDashboardOverview,
    requestOptions,
  );
  @override
  Future<Sub2ApiAdminOpsThroughputTrend> getThroughputTrend({
    Sub2ApiAdminOpsDashboardQuery query = const Sub2ApiAdminOpsDashboardQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) =>
      _read(query, _service.throughput, mapAdminOpsThroughput, requestOptions);
  @override
  Future<Sub2ApiAdminOpsLatencyHistogram> getLatencyHistogram({
    Sub2ApiAdminOpsDashboardQuery query = const Sub2ApiAdminOpsDashboardQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) => _read(query, _service.latency, mapAdminOpsLatency, requestOptions);
  @override
  Future<Sub2ApiAdminOpsErrorTrend> getErrorTrend({
    Sub2ApiAdminOpsDashboardQuery query = const Sub2ApiAdminOpsDashboardQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) =>
      _read(query, _service.errorTrend, mapAdminOpsErrorTrend, requestOptions);
  @override
  Future<Sub2ApiAdminOpsErrorDistribution> getErrorDistribution({
    Sub2ApiAdminOpsDashboardQuery query = const Sub2ApiAdminOpsDashboardQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) => _read(
    query,
    _service.errorDistribution,
    mapAdminOpsErrorDistribution,
    requestOptions,
  );
  @override
  Future<Sub2ApiAdminOpsOpenAITokenStats> getOpenAITokenStats({
    Sub2ApiAdminOpsOpenAITokenStatsQuery query =
        const Sub2ApiAdminOpsOpenAITokenStatsQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (query.groupId != null && query.groupId! <= 0) {
      throw _validation('admin.ops.invalid_group_id');
    }
    if (query.topN != null && (query.topN! < 1 || query.topN! > 100)) {
      throw _validation('admin.ops.invalid_top_n');
    }
    if (query.page < 1) throw _validation('admin.ops.invalid_page');
    if (query.pageSize < 1 || query.pageSize > 100) {
      throw _validation('admin.ops.invalid_page_size');
    }
    final q = <String, Object?>{
      'time_range': _openAiRange(query.timeRange),
      'platform': ?_optional(query.platform),
      'group_id': ?query.groupId,
      if (query.topN != null)
        'top_n': query.topN
      else ...<String, Object?>{
        'page': query.page,
        'page_size': query.pageSize,
      },
    };
    return _executor.protectedRequest(
      send: (c, o, v) => _service.openAiTokenStats(q, c, o, _a(v), _k(v)),
      decode: mapAdminOpsOpenAITokenStats,
      requestOptions: requestOptions,
    );
  }

  Future<T> _read<T>(
    Sub2ApiAdminOpsDashboardQuery query,
    Future<HttpResponse<Object?>> Function(
      Map<String, dynamic>,
      CancelToken,
      Options,
      String?,
      String?,
    )
    send,
    T Function(Object?) decode,
    Sub2ApiRequestOptions? requestOptions,
  ) {
    final q = _query(query);
    return _executor.protectedRequest(
      send: (c, o, v) => send(q, c, o, _a(v), _k(v)),
      decode: decode,
      requestOptions: requestOptions,
    );
  }

  Map<String, Object?> _query(Sub2ApiAdminOpsDashboardQuery query) {
    if (query.groupId != null && query.groupId! <= 0) {
      throw _validation('admin.ops.invalid_group_id');
    }
    final start = query.startAt?.toUtc();
    final end = query.endAt?.toUtc();
    if (start != null && end != null && start.isAfter(end)) {
      throw _validation('admin.ops.invalid_time_range');
    }
    if (start != null &&
        end != null &&
        end.difference(start) > const Duration(days: 30)) {
      throw _validation('admin.ops.time_range_too_large');
    }
    return <String, Object?>{
      'time_range': _timeRange(query.timeRange),
      'start_time': ?start?.toIso8601String(),
      'end_time': ?end?.toIso8601String(),
      'platform': ?_optional(query.platform),
      'group_id': ?query.groupId,
      'mode': ?_modeValue(query.queryMode),
    };
  }

  String? _a(String? v) => _mode == Sub2ApiAdminCredentialMode.jwt ? v : null;
  String? _k(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? v : null;
}

String? _optional(String? v) {
  final t = v?.trim();
  return t == null || t.isEmpty ? null : t;
}

String? _modeValue(Sub2ApiAdminOpsQueryMode v) => switch (v) {
  Sub2ApiAdminOpsQueryMode.serverDefault => null,
  Sub2ApiAdminOpsQueryMode.automatic => 'auto',
  Sub2ApiAdminOpsQueryMode.raw => 'raw',
  Sub2ApiAdminOpsQueryMode.preAggregated => 'preagg',
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
String _openAiRange(Sub2ApiAdminOpsOpenAITimeRange v) => switch (v) {
  Sub2ApiAdminOpsOpenAITimeRange.thirtyMinutes => '30m',
  Sub2ApiAdminOpsOpenAITimeRange.oneHour => '1h',
  Sub2ApiAdminOpsOpenAITimeRange.oneDay => '1d',
  Sub2ApiAdminOpsOpenAITimeRange.fifteenDays => '15d',
  Sub2ApiAdminOpsOpenAITimeRange.thirtyDays => '30d',
};
Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
