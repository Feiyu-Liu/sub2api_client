import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../sub2api_monitor_models.dart';

List<Sub2ApiChannelMonitor> mapChannelMonitors(Object? data) => _guard(() {
  final items = _list(_map(data)['items']);
  return List<Sub2ApiChannelMonitor>.unmodifiable(
    items.map((item) {
      final source = _map(item);
      return Sub2ApiChannelMonitor(
        id: _positiveId(source['id']),
        name: _requiredText(source['name']),
        provider: _requiredText(source['provider']),
        groupName: _string(source['group_name']),
        primaryModel: _requiredText(source['primary_model']),
        primaryStatus: _requiredText(source['primary_status']),
        primaryLatencyMs: _optionalInt(source['primary_latency_ms']),
        primaryPingLatencyMs: _optionalInt(source['primary_ping_latency_ms']),
        availability7d: _decimal(source['availability_7d']),
        extraModels: List<Sub2ApiMonitorExtraModel>.unmodifiable(
          _list(source['extra_models']).map((item) {
            final extra = _map(item);
            return Sub2ApiMonitorExtraModel(
              model: _requiredText(extra['model']),
              status: _requiredText(extra['status']),
              latencyMs: _optionalInt(extra['latency_ms']),
            );
          }),
        ),
        timeline: List<Sub2ApiMonitorTimelinePoint>.unmodifiable(
          _list(source['timeline']).map((item) {
            final point = _map(item);
            return Sub2ApiMonitorTimelinePoint(
              status: _requiredText(point['status']),
              latencyMs: _optionalInt(point['latency_ms']),
              pingLatencyMs: _optionalInt(point['ping_latency_ms']),
              checkedAt: _date(point['checked_at']),
            );
          }),
        ),
        latestQuota: source['latest_quota'] == null
            ? null
            : _quota(_map(source['latest_quota'])),
      );
    }),
  );
});

Sub2ApiChannelMonitorDetail mapChannelMonitorDetail(Object? data) => _guard(() {
  final source = _map(data);
  return Sub2ApiChannelMonitorDetail(
    id: _positiveId(source['id']),
    name: _requiredText(source['name']),
    provider: _requiredText(source['provider']),
    groupName: _string(source['group_name']),
    models: List<Sub2ApiChannelMonitorModelDetail>.unmodifiable(
      _list(source['models']).map((item) {
        final model = _map(item);
        return Sub2ApiChannelMonitorModelDetail(
          model: _requiredText(model['model']),
          latestStatus: _requiredText(model['latest_status']),
          latestLatencyMs: _optionalInt(model['latest_latency_ms']),
          availability7d: _decimal(model['availability_7d']),
          availability15d: _decimal(model['availability_15d']),
          availability30d: _decimal(model['availability_30d']),
          averageLatency7dMs: _optionalInt(model['avg_latency_7d_ms']),
        );
      }),
    ),
  );
});

Sub2ApiMonitorDimensions mapMonitorDimensions(Object? data) => _guard(() {
  final source = _map(data);
  return Sub2ApiMonitorDimensions(
    platforms: List<Sub2ApiMonitorDimension>.unmodifiable(
      _list(source['platforms']).map(_dimension),
    ),
    groups: List<Sub2ApiMonitorGroupDimension>.unmodifiable(
      _list(source['groups']).map((item) {
        final group = _map(item);
        return Sub2ApiMonitorGroupDimension(
          id: _positiveId(group['id']),
          name: _requiredText(group['name']),
          platform: _string(group['platform']),
          requestCount: _int(group['request_count']),
        );
      }),
    ),
    models: List<Sub2ApiMonitorDimension>.unmodifiable(
      _list(source['models']).map(_dimension),
    ),
  );
});

Sub2ApiMonitorSnapshot mapMonitorSnapshot(Object? data) => _guard(() {
  final source = _map(data);
  return Sub2ApiMonitorSnapshot(
    config: _config(_map(source['config'])),
    coverage: _coverage(_map(source['coverage'])),
    metrics: _metric(_map(source['metrics'])),
    health: _health(_map(source['health'])),
    trend: List<Sub2ApiMonitorTrendPoint>.unmodifiable(
      _list(source['trend']).map(_trendPoint),
    ),
  );
});

Sub2ApiMonitorList<Sub2ApiMonitorModelRow> mapMonitorModels(Object? data) =>
    _guard(
      () => _coveredList(data, (item) {
        final source = _map(item);
        return Sub2ApiMonitorModelRow(
          platform: _requiredText(source['platform']),
          model: _requiredText(source['model']),
          metrics: _metric(_map(source['metrics'])),
          health: _health(_map(source['health'])),
        );
      }),
    );

Sub2ApiMonitorMatrix mapMonitorMatrix(Object? data) => _guard(() {
  final source = _map(data);
  return Sub2ApiMonitorMatrix(
    groupBy: _groupBy(_requiredText(source['group_by'])),
    coverage: _coverage(_map(source['coverage'])),
    items: List<Sub2ApiMonitorMatrixRow>.unmodifiable(
      _list(source['items']).map((item) {
        final row = _map(item);
        return Sub2ApiMonitorMatrixRow(
          platform: _requiredText(row['platform']),
          groupId: _optionalInt(row['group_id']),
          groupName: _string(row['group_name']),
          model: _string(row['model']),
          metrics: _metric(_map(row['metrics'])),
          health: _health(_map(row['health'])),
          buckets: List<Sub2ApiMonitorTrendPoint>.unmodifiable(
            _list(row['buckets']).map(_trendPoint),
          ),
        );
      }),
    ),
  );
});

Sub2ApiMonitorList<Sub2ApiMonitorErrorRow> mapMonitorErrors(Object? data) =>
    _guard(
      () => _coveredList(data, (item) {
        final source = _map(item);
        return Sub2ApiMonitorErrorRow(
          category: _requiredText(source['category']),
          count: _int(source['count']),
          rate: _decimal(source['rate']),
          details: List<Sub2ApiMonitorErrorDetail>.unmodifiable(
            _optionalList(source['details']).map((item) {
              final detail = _map(item);
              return Sub2ApiMonitorErrorDetail(
                platform: _string(detail['platform']),
                model: _string(detail['model']),
                errorType: _string(detail['error_type']),
                statusCode: _intOrZero(detail['status_code']),
                upstreamStatusCode: _intOrZero(detail['upstream_status_code']),
                message: _string(detail['message']),
                count: _int(detail['count']),
              );
            }),
          ),
          ignored: _boolOrFalse(source['ignored']),
        );
      }),
    );

Sub2ApiMonitorList<Sub2ApiMonitorUserRow> mapMonitorUsers(Object? data) =>
    _guard(
      () => _coveredList(data, (item) {
        final source = _map(item);
        return Sub2ApiMonitorUserRow(
          userId: _optionalInt(source['user_id']),
          rank: _int(source['rank']),
          email: _string(source['email']),
          username: _string(source['username']),
          displayLabel: _requiredText(source['display_label']),
          isSelf: _bool(source['is_self']),
          canDrilldown: _bool(source['can_drilldown']),
          metrics: _metric(_map(source['metrics'])),
        );
      }),
    );

Sub2ApiMonitorQuotaSnapshot _quota(Map<String, Object?> source) =>
    Sub2ApiMonitorQuotaSnapshot(
      source: _requiredText(source['source']),
      success: _bool(source['success']),
      tiers: List<Sub2ApiMonitorQuotaTier>.unmodifiable(
        _optionalList(source['tiers']).map((item) {
          final tier = _map(item);
          return Sub2ApiMonitorQuotaTier(
            window: _requiredText(tier['window']),
            label: _string(tier['label']),
            usedPercent: _decimal(tier['used_percent']),
            used: _decimalOrZero(tier['used']),
            limit: _decimalOrZero(tier['limit']),
            resetAt: _optionalDateText(tier['reset_at']),
          );
        }),
      ),
      balance: source['balance'] == null ? null : _decimal(source['balance']),
      balances: List<Sub2ApiMonitorBalance>.unmodifiable(
        _optionalList(source['balances']).map((item) {
          final balance = _map(item);
          return Sub2ApiMonitorBalance(
            currency: _requiredText(balance['currency']),
            balance: _decimal(balance['balance']),
          );
        }),
      ),
      currency: _string(source['currency']),
      planLevel: _string(source['plan_level']),
      balanceLow: _boolOrFalse(source['balance_low']),
      credentialInvalid: _boolOrFalse(source['credential_invalid']),
      error: _string(source['error']),
      fetchedAt: _date(source['fetched_at']),
    );

Sub2ApiMonitorDimension _dimension(Object? item) {
  final source = _map(item);
  return Sub2ApiMonitorDimension(
    value: _requiredText(source['value']),
    label: _requiredText(source['label']),
    platform: _string(source['platform']),
    requestCount: _int(source['request_count']),
  );
}

Sub2ApiMonitorConfig _config(Map<String, Object?> source) =>
    Sub2ApiMonitorConfig(
      version: _int(source['version']),
      enabled: _bool(source['enabled']),
      refreshIntervalSeconds: _int(source['refresh_interval_seconds']),
      platforms: List<Sub2ApiMonitorPlatformConfig>.unmodifiable(
        _list(source['platforms']).map((item) {
          final platform = _map(item);
          return Sub2ApiMonitorPlatformConfig(
            platform: _requiredText(platform['platform']),
            enabled: _bool(platform['enabled']),
            models: List<String>.unmodifiable(
              _list(platform['models']).map(_requiredText),
            ),
          );
        }),
      ),
      groupIds: List<int>.unmodifiable(_list(source['group_ids']).map(_int)),
      healthThresholds: _thresholds(_map(source['health_thresholds'])),
      ignoredErrorCategories: List<String>.unmodifiable(
        _optionalList(source['ignored_error_categories']).map(_requiredText),
      ),
      updatedAt: _date(source['updated_at']),
      updatedBy: _optionalInt(source['updated_by']),
    );

Sub2ApiMonitorThresholds _thresholds(Map<String, Object?> source) =>
    Sub2ApiMonitorThresholds(
      minimumSample: _int(source['minimum_sample']),
      warningErrorRate: _decimal(source['warning_error_rate']),
      criticalErrorRate: _decimal(source['critical_error_rate']),
      targetTtftMs: _int(source['target_ttft_ms']),
      warningTtftMs: _int(source['warning_ttft_ms']),
      criticalTtftMs: _int(source['critical_ttft_ms']),
      warningCacheRate: _decimal(source['warning_cache_rate']),
      criticalCacheRate: _decimal(source['critical_cache_rate']),
      errorWeight: _decimal(source['error_weight']),
      ttftWeight: _decimal(source['ttft_weight']),
      cacheWeight: _decimal(source['cache_weight']),
    );

Sub2ApiMonitorLatency _latency(Map<String, Object?> source) =>
    Sub2ApiMonitorLatency(
      sampleCount: _int(source['sample_count']),
      p50Ms: _optionalInt(source['p50_ms']),
      p90Ms: _optionalInt(source['p90_ms']),
      p95Ms: _optionalInt(source['p95_ms']),
      averageMs: source['avg_ms'] == null ? null : _decimal(source['avg_ms']),
    );

Sub2ApiMonitorMetric _metric(Map<String, Object?> source) =>
    Sub2ApiMonitorMetric(
      successRequests: _int(source['success_requests']),
      errorRequests: _int(source['error_requests']),
      requestCount: _int(source['request_count']),
      inputTokens: _int(source['input_tokens']),
      outputTokens: _int(source['output_tokens']),
      cacheCreationTokens: _int(source['cache_creation_tokens']),
      cacheReadTokens: _int(source['cache_read_tokens']),
      tokenCount: _int(source['token_count']),
      rpm: _decimal(source['rpm']),
      tpm: _decimal(source['tpm']),
      errorRate: _decimal(source['error_rate']),
      successRate: _decimal(source['success_rate']),
      cacheRate: _decimal(source['cache_rate']),
      cacheRateNumerator: _int(source['cache_rate_numerator']),
      cacheRateDenominator: _int(source['cache_rate_denominator']),
      ttft: _latency(_map(source['ttft'])),
      duration: _latency(_map(source['duration'])),
      upstreamAffectedRequests: _optionalInt(
        source['upstream_affected_requests'],
      ),
      upstreamAttemptCount: _optionalInt(source['upstream_attempt_count']),
    );

Sub2ApiMonitorHealth _health(Map<String, Object?> source) =>
    Sub2ApiMonitorHealth(
      overall: _requiredText(source['overall']),
      errorRate: _requiredText(source['error_rate']),
      ttft: _requiredText(source['ttft']),
      cache: _requiredText(source['cache']),
      score: _optionalDecimal(source['score']),
      errorRateScore: _optionalDecimal(source['error_rate_score']),
      ttftScore: _optionalDecimal(source['ttft_score']),
      cacheScore: _optionalDecimal(source['cache_score']),
      minimumSample: _int(source['minimum_sample']),
      thresholds: _thresholds(_map(source['thresholds'])),
    );

Sub2ApiMonitorCoverage _coverage(Map<String, Object?> source) =>
    Sub2ApiMonitorCoverage(
      requestedStart: _date(source['requested_start']),
      requestedEnd: _date(source['requested_end']),
      coverageStart: _date(source['coverage_start']),
      dataThrough: _date(source['data_through']),
      computedAt: _date(source['computed_at']),
      aggregationLagSeconds: _int(source['aggregation_lag_seconds']),
      coverageComplete: _bool(source['coverage_complete']),
      bucketSeconds: _int(source['bucket_seconds']),
      bootstrap: source['bootstrap'] == null
          ? null
          : _bootstrap(_map(source['bootstrap'])),
    );

Sub2ApiMonitorBootstrap _bootstrap(Map<String, Object?> source) =>
    Sub2ApiMonitorBootstrap(
      active: _bool(source['active']),
      progressPercent: _int(source['progress_percent']),
      coveredFrom: _optionalDate(source['covered_from']),
      targetStart: _optionalDate(source['target_start']),
    );

Sub2ApiMonitorTrendPoint _trendPoint(Object? item) {
  final source = _map(item);
  return Sub2ApiMonitorTrendPoint(
    bucketStart: _date(source['bucket_start']),
    metrics: _metric(_map(source['metrics'])),
    health: _health(_map(source['health'])),
  );
}

Sub2ApiMonitorList<T> _coveredList<T>(
  Object? data,
  T Function(Object? item) map,
) {
  final source = _map(data);
  return Sub2ApiMonitorList<T>(
    coverage: _coverage(_map(source['coverage'])),
    items: List<T>.unmodifiable(_list(source['items']).map(map)),
  );
}

Sub2ApiMonitorGroupBy _groupBy(String value) => switch (value) {
  'platform' => Sub2ApiMonitorGroupBy.platform,
  'platform_group' => Sub2ApiMonitorGroupBy.platformGroup,
  'platform_model' => Sub2ApiMonitorGroupBy.platformModel,
  'platform_group_model' => Sub2ApiMonitorGroupBy.platformGroupModel,
  _ => throw _invalidMonitor,
};

T _guard<T>(T Function() operation) {
  try {
    return operation();
  } on Sub2ApiException {
    rethrow;
  } on Object {
    throw _invalidMonitor;
  }
}

Map<String, Object?> _map(Object? value) {
  if (value is! Map) throw _invalidMonitor;
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) throw _invalidMonitor;
    result[entry.key as String] = entry.value;
  }
  return result;
}

List<Object?> _list(Object? value) {
  if (value is! List) throw _invalidMonitor;
  return value.cast<Object?>();
}

List<Object?> _optionalList(Object? value) =>
    value == null ? const <Object?>[] : _list(value);

String _requiredText(Object? value) {
  final text = _string(value);
  if (text.isEmpty) throw _invalidMonitor;
  return text;
}

String _string(Object? value) {
  if (value == null) return '';
  if (value is! String) throw _invalidMonitor;
  return value;
}

int _int(Object? value) {
  if (value is! int) throw _invalidMonitor;
  return value;
}

int _positiveId(Object? value) {
  final id = _int(value);
  if (id <= 0) throw _invalidMonitor;
  return id;
}

int? _optionalInt(Object? value) => value == null ? null : _int(value);

int _intOrZero(Object? value) => value == null ? 0 : _int(value);

bool _bool(Object? value) {
  if (value is! bool) throw _invalidMonitor;
  return value;
}

bool _boolOrFalse(Object? value) => value == null ? false : _bool(value);

Sub2ApiDecimal _decimal(Object? value) {
  if (value is! num) throw _invalidMonitor;
  return Sub2ApiDecimal.fromJson(value);
}

Sub2ApiDecimal _decimalOrZero(Object? value) =>
    value == null ? Sub2ApiDecimal.fromJson(0) : _decimal(value);

Sub2ApiDecimal? _optionalDecimal(Object? value) =>
    value == null ? null : _decimal(value);

DateTime _date(Object? value) {
  if (value is String) {
    final parsed = DateTime.tryParse(value);
    if (parsed != null) return parsed;
  }
  throw _invalidMonitor;
}

DateTime? _optionalDate(Object? value) => value == null ? null : _date(value);

DateTime? _optionalDateText(Object? value) {
  if (value == null || value == '') return null;
  return _date(value);
}

const _invalidMonitor = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_channel_monitor_response',
  retryable: false,
);
