import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_ops_alert_models.dart';
import 'sub2api_admin_ops_dashboard_models.dart';
import 'sub2api_admin_user_models.dart';
import 'wire/admin_ops_alert_wire_mapper.dart';
import 'wire/admin_ops_alert_wire_service.dart';

abstract interface class Sub2ApiAdminOpsAlertsClient {
  Future<List<Sub2ApiAdminOpsAlertRule>> listRules({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsAlertRule> createRule(
    Sub2ApiAdminOpsAlertRuleInput input, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsAlertRule> updateRule(
    int id,
    Sub2ApiAdminOpsAlertRuleInput input, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsAlertMutationResult> deleteRule(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminOpsAlertEvent>> listEvents({
    Sub2ApiAdminOpsAlertEventQuery query =
        const Sub2ApiAdminOpsAlertEventQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsAlertEvent> getEvent(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsAlertMutationResult> updateEventStatus(
    int id,
    Sub2ApiAdminOpsAlertResolutionStatus status, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpsAlertSilence> createSilence(
    Sub2ApiAdminOpsAlertSilenceInput input, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminOpsAlertsClient createSub2ApiAdminOpsAlertsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminOpsAlertsClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminOpsAlertWireService(dio);

  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminOpsAlertWireService _service;

  @override
  Future<List<Sub2ApiAdminOpsAlertRule>> listRules({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, value) => _service.listRules(
      cancelToken,
      options,
      _authorization(value),
      _key(value),
    ),
    decode: mapAdminOpsAlertRules,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminOpsAlertRule> createRule(
    Sub2ApiAdminOpsAlertRuleInput input, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _ruleBody(input);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, value) => _service.createRule(
        body,
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsAlertRule,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsAlertRule> updateRule(
    int id,
    Sub2ApiAdminOpsAlertRuleInput input, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id, 'admin.ops.invalid_alert_rule_id');
    final body = _ruleBody(input);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, value) => _service.updateRule(
        id,
        body,
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsAlertRule,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsAlertMutationResult> deleteRule(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id, 'admin.ops.invalid_alert_rule_id');
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, value) => _service.deleteRule(
        id,
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsAlertDeleted,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminOpsAlertEvent>> listEvents({
    Sub2ApiAdminOpsAlertEventQuery query =
        const Sub2ApiAdminOpsAlertEventQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final wireQuery = _eventQuery(query);
    return _executor.protectedRequest(
      send: (cancelToken, options, value) => _service.listEvents(
        wireQuery,
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsAlertEvents,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsAlertEvent> getEvent(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id, 'admin.ops.invalid_alert_event_id');
    return _executor.protectedRequest(
      send: (cancelToken, options, value) => _service.getEvent(
        id,
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsAlertEvent,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsAlertMutationResult> updateEventStatus(
    int id,
    Sub2ApiAdminOpsAlertResolutionStatus status, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id, 'admin.ops.invalid_alert_event_id');
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, value) => _service.updateEventStatus(
        id,
        <String, Object?>{'status': _resolutionStatus(status)},
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsAlertUpdated,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpsAlertSilence> createSilence(
    Sub2ApiAdminOpsAlertSilenceInput input, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _silenceBody(input);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, value) => _service.createSilence(
        body,
        cancelToken,
        options,
        _authorization(value),
        _key(value),
      ),
      decode: mapAdminOpsAlertSilence,
      requestOptions: requestOptions,
    );
  }

  Map<String, Object?> _ruleBody(Sub2ApiAdminOpsAlertRuleInput input) {
    final name = input.name.trim();
    if (name.isEmpty) throw _validation('admin.ops.invalid_alert_rule_name');
    if (!const <int>{1, 5, 60}.contains(input.windowMinutes)) {
      throw _validation('admin.ops.invalid_alert_window');
    }
    if (input.sustainedMinutes < 1 || input.sustainedMinutes > 1440) {
      throw _validation('admin.ops.invalid_alert_sustained_minutes');
    }
    if (input.cooldownMinutes < 0 || input.cooldownMinutes > 1440) {
      throw _validation('admin.ops.invalid_alert_cooldown_minutes');
    }
    final threshold = _threshold(input.metricType, input.threshold);
    return <String, Object?>{
      'name': name,
      'description': input.description.trim(),
      'enabled': input.enabled,
      'severity': _severity(input.severity),
      'metric_type': _metricType(input.metricType),
      'operator': _operator(input.operator),
      'threshold': threshold,
      'window_minutes': input.windowMinutes,
      'sustained_minutes': input.sustainedMinutes,
      'cooldown_minutes': input.cooldownMinutes,
      'notify_email': input.notifyEmail,
      'filters': _jsonObject(input.filters),
    };
  }

  Map<String, dynamic> _eventQuery(Sub2ApiAdminOpsAlertEventQuery query) {
    if (query.limit < 1 || query.limit > 500) {
      throw _validation('admin.ops.invalid_alert_event_limit');
    }
    if ((query.beforeFiredAt == null) != (query.beforeId == null)) {
      throw _validation('admin.ops.invalid_alert_event_cursor');
    }
    if (query.beforeId != null && query.beforeId! <= 0) {
      throw _validation('admin.ops.invalid_alert_event_cursor');
    }
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
    final platform = query.platform?.trim();
    return <String, dynamic>{
      'limit': query.limit,
      'before_fired_at': ?query.beforeFiredAt?.toUtc().toIso8601String(),
      'before_id': ?query.beforeId,
      'status': ?query.status == null ? null : _eventStatus(query.status!),
      'severity': ?query.severity == null ? null : _severity(query.severity!),
      'email_sent': ?query.emailSent,
      'time_range': ?query.timeRange == null
          ? null
          : _timeRange(query.timeRange!),
      'start_time': ?start?.toIso8601String(),
      'end_time': ?end?.toIso8601String(),
      'platform': ?platform == null || platform.isEmpty ? null : platform,
      'group_id': ?query.groupId,
    };
  }

  Map<String, Object?> _silenceBody(Sub2ApiAdminOpsAlertSilenceInput input) {
    _id(input.ruleId, 'admin.ops.invalid_alert_rule_id');
    if (input.groupId != null && input.groupId! <= 0) {
      throw _validation('admin.ops.invalid_group_id');
    }
    final platform = input.platform.trim();
    if (platform.isEmpty) {
      throw _validation('admin.ops.invalid_alert_silence_platform');
    }
    final region = input.region?.trim();
    return <String, Object?>{
      'rule_id': input.ruleId,
      'platform': platform,
      'group_id': ?input.groupId,
      'region': ?region == null || region.isEmpty ? null : region,
      'until': input.until.toUtc().toIso8601String(),
      'reason': input.reason.trim(),
    };
  }

  void _id(int id, String code) {
    if (id <= 0) throw _validation(code);
  }

  String? _authorization(String? value) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? value : null;

  String? _key(String? value) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? value : null;
}

double _threshold(
  Sub2ApiAdminOpsAlertMetricType metricType,
  Sub2ApiDecimal threshold,
) {
  if (threshold.compareTo(Sub2ApiDecimal.zero()) < 0) {
    throw _validation('admin.ops.invalid_alert_threshold');
  }
  if (_percentMetric(metricType) &&
      threshold.compareTo(Sub2ApiDecimal.parse('100')) > 0) {
    throw _validation('admin.ops.invalid_alert_threshold');
  }
  final value = double.tryParse(threshold.toJson());
  if (value == null || !value.isFinite) {
    throw _validation('admin.ops.alert_threshold_not_representable');
  }
  if (Sub2ApiDecimal.parse(value.toString()) != threshold) {
    throw _validation('admin.ops.alert_threshold_not_representable');
  }
  return value;
}

bool _percentMetric(Sub2ApiAdminOpsAlertMetricType value) => switch (value) {
  Sub2ApiAdminOpsAlertMetricType.successRate ||
  Sub2ApiAdminOpsAlertMetricType.errorRate ||
  Sub2ApiAdminOpsAlertMetricType.upstreamErrorRate ||
  Sub2ApiAdminOpsAlertMetricType.cpuUsagePercent ||
  Sub2ApiAdminOpsAlertMetricType.memoryUsagePercent ||
  Sub2ApiAdminOpsAlertMetricType.groupAvailableRatio ||
  Sub2ApiAdminOpsAlertMetricType.groupRateLimitRatio ||
  Sub2ApiAdminOpsAlertMetricType.accountErrorRatio => true,
  _ => false,
};

Map<String, Object?> _jsonObject(Sub2ApiAdminJsonObject value) =>
    Map<String, Object?>.from(value.toWire() as Map);

String _metricType(Sub2ApiAdminOpsAlertMetricType value) => switch (value) {
  Sub2ApiAdminOpsAlertMetricType.successRate => 'success_rate',
  Sub2ApiAdminOpsAlertMetricType.errorRate => 'error_rate',
  Sub2ApiAdminOpsAlertMetricType.upstreamErrorRate => 'upstream_error_rate',
  Sub2ApiAdminOpsAlertMetricType.cpuUsagePercent => 'cpu_usage_percent',
  Sub2ApiAdminOpsAlertMetricType.memoryUsagePercent => 'memory_usage_percent',
  Sub2ApiAdminOpsAlertMetricType.concurrencyQueueDepth =>
    'concurrency_queue_depth',
  Sub2ApiAdminOpsAlertMetricType.groupAvailableAccounts =>
    'group_available_accounts',
  Sub2ApiAdminOpsAlertMetricType.groupAvailableRatio => 'group_available_ratio',
  Sub2ApiAdminOpsAlertMetricType.groupRateLimitRatio =>
    'group_rate_limit_ratio',
  Sub2ApiAdminOpsAlertMetricType.accountRateLimitedCount =>
    'account_rate_limited_count',
  Sub2ApiAdminOpsAlertMetricType.accountErrorCount => 'account_error_count',
  Sub2ApiAdminOpsAlertMetricType.accountErrorRatio => 'account_error_ratio',
  Sub2ApiAdminOpsAlertMetricType.accountTempUnscheduledCount =>
    'account_temp_unscheduled_count',
  Sub2ApiAdminOpsAlertMetricType.overloadAccountCount =>
    'overload_account_count',
  Sub2ApiAdminOpsAlertMetricType.proxyExpiredCount => 'proxy_expired_count',
  Sub2ApiAdminOpsAlertMetricType.proxyExpiringSoonCount =>
    'proxy_expiring_soon_count',
};

String _operator(Sub2ApiAdminOpsAlertOperator value) => switch (value) {
  Sub2ApiAdminOpsAlertOperator.greaterThan => '>',
  Sub2ApiAdminOpsAlertOperator.lessThan => '<',
  Sub2ApiAdminOpsAlertOperator.greaterThanOrEqual => '>=',
  Sub2ApiAdminOpsAlertOperator.lessThanOrEqual => '<=',
  Sub2ApiAdminOpsAlertOperator.equal => '==',
  Sub2ApiAdminOpsAlertOperator.notEqual => '!=',
};

String _severity(Sub2ApiAdminOpsAlertSeverity value) =>
    value.name.toUpperCase();

String _eventStatus(Sub2ApiAdminOpsAlertEventStatus value) => switch (value) {
  Sub2ApiAdminOpsAlertEventStatus.firing => 'firing',
  Sub2ApiAdminOpsAlertEventStatus.resolved => 'resolved',
  Sub2ApiAdminOpsAlertEventStatus.manualResolved => 'manual_resolved',
};

String _resolutionStatus(Sub2ApiAdminOpsAlertResolutionStatus value) =>
    switch (value) {
      Sub2ApiAdminOpsAlertResolutionStatus.resolved => 'resolved',
      Sub2ApiAdminOpsAlertResolutionStatus.manualResolved => 'manual_resolved',
    };

String _timeRange(Sub2ApiAdminOpsTimeRange value) => switch (value) {
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
