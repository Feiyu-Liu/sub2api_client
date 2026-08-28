import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../sub2api_admin_ops_dashboard_models.dart';

Sub2ApiAdminOpsDashboardSnapshot mapAdminOpsDashboardSnapshot(Object? data) =>
    _guard(() {
      final s = _object(data);
      return Sub2ApiAdminOpsDashboardSnapshot(
        generatedAt: _date(s['generated_at']),
        overview: _overview(_object(s['overview'])),
        throughputTrend: _throughput(_object(s['throughput_trend'])),
        errorTrend: _errorTrend(_object(s['error_trend'])),
      );
    });
Sub2ApiAdminOpsDashboardOverview mapAdminOpsDashboardOverview(Object? data) =>
    _guard(() => _overview(_object(data)));
Sub2ApiAdminOpsThroughputTrend mapAdminOpsThroughput(Object? data) =>
    _guard(() => _throughput(_object(data)));
Sub2ApiAdminOpsLatencyHistogram mapAdminOpsLatency(Object? data) => _guard(() {
  final s = _object(data);
  return Sub2ApiAdminOpsLatencyHistogram(
    startAt: _date(s['start_time']),
    endAt: _date(s['end_time']),
    platform: _text(s['platform']),
    groupId: _nullablePositive(s['group_id']),
    totalRequests: _nonNegative(s['total_requests']),
    buckets: _list(s['buckets'])
        .map(_object)
        .map(
          (b) => Sub2ApiAdminOpsLatencyBucket(
            range: _required(b['range']),
            count: _nonNegative(b['count']),
          ),
        )
        .toList(),
  );
});
Sub2ApiAdminOpsErrorTrend mapAdminOpsErrorTrend(Object? data) =>
    _guard(() => _errorTrend(_object(data)));
Sub2ApiAdminOpsErrorDistribution mapAdminOpsErrorDistribution(Object? data) =>
    _guard(() {
      final s = _object(data);
      return Sub2ApiAdminOpsErrorDistribution(
        total: _nonNegative(s['total']),
        items: _list(s['items'])
            .map(_object)
            .map(
              (i) => Sub2ApiAdminOpsErrorDistributionItem(
                statusCode: _nonNegative(i['status_code']),
                total: _nonNegative(i['total']),
                sla: _nonNegative(i['sla']),
                businessLimited: _nonNegative(i['business_limited']),
              ),
            )
            .toList(),
      );
    });
Sub2ApiAdminOpsOpenAITokenStats mapAdminOpsOpenAITokenStats(Object? data) =>
    _guard(() {
      final s = _object(data);
      return Sub2ApiAdminOpsOpenAITokenStats(
        timeRange: _required(s['time_range']),
        startAt: _date(s['start_time']),
        endAt: _date(s['end_time']),
        platform: _text(s['platform']),
        groupId: _nullablePositive(s['group_id']),
        items: _list(s['items'])
            .map(_object)
            .map(
              (i) => Sub2ApiAdminOpsOpenAITokenStatsItem(
                model: _required(i['model']),
                requestCount: _nonNegative(i['request_count']),
                averageTokensPerSecond: _decimal(i['avg_tokens_per_sec']),
                averageFirstTokenMs: _decimal(i['avg_first_token_ms']),
                totalOutputTokens: _nonNegative(i['total_output_tokens']),
                averageDurationMs: _nonNegative(i['avg_duration_ms']),
                requestsWithFirstToken: _nonNegative(
                  i['requests_with_first_token'],
                ),
              ),
            )
            .toList(),
        total: _nonNegative(s['total']),
        page: _optionalNonNegative(s['page']),
        pageSize: _optionalNonNegative(s['page_size']),
        topN: _nullablePositive(s['top_n']),
      );
    });

Sub2ApiAdminOpsDashboardOverview _overview(Map<String, Object?> s) =>
    Sub2ApiAdminOpsDashboardOverview(
      startAt: _date(s['start_time']),
      endAt: _date(s['end_time']),
      platform: _text(s['platform']),
      groupId: _nullablePositive(s['group_id']),
      healthScore: _range(s['health_score'], 0, 100),
      systemMetrics: s['system_metrics'] == null
          ? null
          : _systemMetrics(_object(s['system_metrics'])),
      jobHeartbeats: _optionalList(
        s['job_heartbeats'],
      ).map(_object).map(_heartbeat).toList(),
      successCount: _nonNegative(s['success_count']),
      errorCountTotal: _nonNegative(s['error_count_total']),
      businessLimitedCount: _nonNegative(s['business_limited_count']),
      errorCountSla: _nonNegative(s['error_count_sla']),
      requestCountTotal: _nonNegative(s['request_count_total']),
      requestCountSla: _nonNegative(s['request_count_sla']),
      tokenConsumed: _nonNegative(s['token_consumed']),
      sla: _requiredDecimal(s['sla']),
      errorRate: _requiredDecimal(s['error_rate']),
      upstreamErrorRate: _requiredDecimal(s['upstream_error_rate']),
      upstreamErrorCountExcluding429And529: _nonNegative(
        s['upstream_error_count_excl_429_529'],
      ),
      upstream429Count: _nonNegative(s['upstream_429_count']),
      upstream529Count: _nonNegative(s['upstream_529_count']),
      qps: _rate(_object(s['qps'])),
      tps: _rate(_object(s['tps'])),
      duration: _percentiles(_object(s['duration'])),
      timeToFirstToken: _percentiles(_object(s['ttft'])),
    );
Sub2ApiAdminOpsThroughputTrend _throughput(Map<String, Object?> s) =>
    Sub2ApiAdminOpsThroughputTrend(
      bucket: _required(s['bucket']),
      points: _list(s['points'])
          .map(_object)
          .map(
            (p) => Sub2ApiAdminOpsThroughputPoint(
              bucketStart: _date(p['bucket_start']),
              requestCount: _nonNegative(p['request_count']),
              tokenConsumed: _nonNegative(p['token_consumed']),
              switchCount: _nonNegative(p['switch_count']),
              qps: _requiredDecimal(p['qps']),
              tps: _requiredDecimal(p['tps']),
            ),
          )
          .toList(),
      byPlatform: _optionalList(s['by_platform'])
          .map(_object)
          .map(
            (p) => Sub2ApiAdminOpsThroughputPlatform(
              platform: _required(p['platform']),
              requestCount: _nonNegative(p['request_count']),
              tokenConsumed: _nonNegative(p['token_consumed']),
            ),
          )
          .toList(),
      topGroups: _optionalList(s['top_groups'])
          .map(_object)
          .map(
            (g) => Sub2ApiAdminOpsThroughputGroup(
              groupId: _positive(g['group_id']),
              groupName: _required(g['group_name']),
              requestCount: _nonNegative(g['request_count']),
              tokenConsumed: _nonNegative(g['token_consumed']),
            ),
          )
          .toList(),
    );
Sub2ApiAdminOpsErrorTrend _errorTrend(Map<String, Object?> s) =>
    Sub2ApiAdminOpsErrorTrend(
      bucket: _required(s['bucket']),
      points: _list(s['points'])
          .map(_object)
          .map(
            (p) => Sub2ApiAdminOpsErrorTrendPoint(
              bucketStart: _date(p['bucket_start']),
              errorCountTotal: _nonNegative(p['error_count_total']),
              businessLimitedCount: _nonNegative(p['business_limited_count']),
              errorCountSla: _nonNegative(p['error_count_sla']),
              upstreamErrorCountExcluding429And529: _nonNegative(
                p['upstream_error_count_excl_429_529'],
              ),
              upstream429Count: _nonNegative(p['upstream_429_count']),
              upstream529Count: _nonNegative(p['upstream_529_count']),
            ),
          )
          .toList(),
    );
Sub2ApiAdminOpsRateSummary _rate(Map<String, Object?> s) =>
    Sub2ApiAdminOpsRateSummary(
      current: _requiredDecimal(s['current']),
      peak: _requiredDecimal(s['peak']),
      average: _requiredDecimal(s['avg']),
    );
Sub2ApiAdminOpsPercentiles _percentiles(Map<String, Object?> s) =>
    Sub2ApiAdminOpsPercentiles(
      p50Ms: _nullableNonNegative(s['p50_ms']),
      p90Ms: _nullableNonNegative(s['p90_ms']),
      p95Ms: _nullableNonNegative(s['p95_ms']),
      p99Ms: _nullableNonNegative(s['p99_ms']),
      averageMs: _nullableNonNegative(s['avg_ms']),
      maxMs: _nullableNonNegative(s['max_ms']),
    );
Sub2ApiAdminOpsSystemMetrics _systemMetrics(Map<String, Object?> s) =>
    Sub2ApiAdminOpsSystemMetrics(
      id: _positive(s['id']),
      createdAt: _date(s['created_at']),
      windowMinutes: _positive(s['window_minutes']),
      cpuUsagePercent: _decimal(s['cpu_usage_percent']),
      memoryUsedMb: _nullableNonNegative(s['memory_used_mb']),
      memoryTotalMb: _nullableNonNegative(s['memory_total_mb']),
      memoryUsagePercent: _decimal(s['memory_usage_percent']),
      databaseOk: _nullableBool(s['db_ok']),
      redisOk: _nullableBool(s['redis_ok']),
      databaseMaxOpenConnections: _nullableNonNegative(s['db_max_open_conns']),
      redisPoolSize: _nullableNonNegative(s['redis_pool_size']),
      redisConnectionsTotal: _nullableNonNegative(s['redis_conn_total']),
      redisConnectionsIdle: _nullableNonNegative(s['redis_conn_idle']),
      databaseConnectionsActive: _nullableNonNegative(s['db_conn_active']),
      databaseConnectionsIdle: _nullableNonNegative(s['db_conn_idle']),
      databaseConnectionsWaiting: _nullableNonNegative(s['db_conn_waiting']),
      goroutineCount: _nullableNonNegative(s['goroutine_count']),
      concurrencyQueueDepth: _nullableNonNegative(s['concurrency_queue_depth']),
      accountSwitchCount: _nullableNonNegative(s['account_switch_count']),
    );
Sub2ApiAdminOpsJobHeartbeat _heartbeat(Map<String, Object?> s) =>
    Sub2ApiAdminOpsJobHeartbeat(
      jobName: _required(s['job_name']),
      lastRunAt: _optionalDate(s['last_run_at']),
      lastSuccessAt: _optionalDate(s['last_success_at']),
      lastErrorAt: _optionalDate(s['last_error_at']),
      lastError: _text(s['last_error']),
      lastDurationMs: _nullableNonNegative(s['last_duration_ms']),
      lastResult: _text(s['last_result']),
      updatedAt: _date(s['updated_at']),
    );

Map<String, Object?> _object(Object? v) {
  if (v is! Map) throw const FormatException();
  return Map<String, Object?>.from(v);
}

List<Object?> _list(Object? v) {
  if (v is! List) throw const FormatException();
  return v.cast<Object?>();
}

List<Object?> _optionalList(Object? v) =>
    v == null ? const <Object?>[] : _list(v);
String _text(Object? v) {
  if (v == null) return '';
  if (v is! String) throw const FormatException();
  return v;
}

String _required(Object? v) {
  final t = _text(v);
  if (t.trim().isEmpty) throw const FormatException();
  return t;
}

int _integer(Object? v) {
  if (v is! int) throw const FormatException();
  return v;
}

int _positive(Object? v) {
  final n = _integer(v);
  if (n <= 0) throw const FormatException();
  return n;
}

int _nonNegative(Object? v) {
  final n = _integer(v);
  if (n < 0) throw const FormatException();
  return n;
}

int _optionalNonNegative(Object? v) => v == null ? 0 : _nonNegative(v);
int? _nullablePositive(Object? v) => v == null ? null : _positive(v);
int? _nullableNonNegative(Object? v) => v == null ? null : _nonNegative(v);
int _range(Object? v, int min, int max) {
  final n = _integer(v);
  if (n < min || n > max) throw const FormatException();
  return n;
}

bool _boolean(Object? v) {
  if (v is! bool) throw const FormatException();
  return v;
}

bool? _nullableBool(Object? v) => v == null ? null : _boolean(v);
Sub2ApiDecimal _requiredDecimal(Object? v) => Sub2ApiDecimal.fromJson(v);
Sub2ApiDecimal? _decimal(Object? v) =>
    v == null ? null : Sub2ApiDecimal.fromJson(v);
DateTime _date(Object? v) => DateTime.parse(_required(v)).toUtc();
DateTime? _optionalDate(Object? v) => v == null ? null : _date(v);
T _guard<T>(T Function() a) {
  try {
    return a();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_ops_dashboard_response',
  retryable: false,
);
