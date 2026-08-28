import 'dart:convert';

import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_ops_observability_models.dart';

Sub2ApiAdminOpsIngressRejectPage mapAdminOpsIngressRejectPage(Object? data) =>
    _guard(() {
      final source = _object(data);
      final total = _nonNegative(source['total']);
      final pageSize = _positive(source['page_size']);
      return Sub2ApiPage(
        items: _list(
          source['items'],
        ).map(_ingressReject).toList(growable: false),
        total: total,
        page: _positive(source['page']),
        pageSize: pageSize,
        pages: total == 0 ? 0 : (total + pageSize - 1) ~/ pageSize,
      );
    });

Sub2ApiAdminOpsIngressRejectHealth mapAdminOpsIngressRejectHealth(
  Object? data,
) => _guard(() {
  final source = _object(data);
  return Sub2ApiAdminOpsIngressRejectHealth(
    cardinality: _nonNegative(source['cardinality']),
    capacity: _nonNegative(source['capacity']),
    pendingBatches: _nonNegative(source['pending_batches']),
    pendingRows: _nonNegative(source['pending_rows']),
    overflowedCount: _nonNegative(source['overflowed_count']),
    droppedCount: _nonNegative(source['dropped_count']),
    flushedRequestCount: _nonNegative(source['flushed_request_count']),
    flushFailureCount: _nonNegative(source['flush_failure_count']),
    accepting: _bool(source['accepting']),
    lastError: _text(source['last_error']),
  );
});

Sub2ApiAdminOpsAuthCacheInvalidationHealth mapAdminOpsAuthCacheHealth(
  Object? data,
) => _guard(() {
  final source = _object(data);
  final outbox = _object(source['outbox']);
  final subscriber = _object(source['subscriber']);
  final lookup = _object(source['lookup']);
  final invalidAbuse = _object(source['invalid_abuse']);
  return Sub2ApiAdminOpsAuthCacheInvalidationHealth(
    outbox: Sub2ApiAdminOpsAuthCacheOutboxHealth(
      running: _bool(outbox['running']),
      processed: _nonNegative(outbox['processed']),
      failures: _nonNegative(outbox['failures']),
      pending: _nonNegative(outbox['pending']),
      oldestLag: _durationNanos(outbox['oldest_lag']),
      lastError: _text(outbox['last_error']),
      statsError: _text(outbox['stats_error']),
      healthySla: _durationNanos(outbox['healthy_sla']),
      recoverySla: _durationNanos(outbox['recovery_sla']),
      maxAttempts: _nonNegative(outbox['max_attempts']),
    ),
    subscriber: Sub2ApiAdminOpsAuthCacheSubscriberHealth(
      connected: _bool(subscriber['connected']),
      failures: _nonNegative(subscriber['failures']),
    ),
    lookup: Sub2ApiAdminOpsAuthLookupHealth(
      total: _nonNegative(lookup['total']),
      rejected: _nonNegative(lookup['rejected']),
      inFlight: _nonNegative(lookup['in_flight']),
      capacity: _nonNegative(lookup['capacity']),
    ),
    invalidAbuse: Sub2ApiAdminOpsInvalidAuthAbuseHealth(
      enabled: _bool(invalidAbuse['enabled']),
      tracked: _nonNegative(invalidAbuse['tracked']),
      capacity: _nonNegative(invalidAbuse['capacity']),
      recorded: _nonNegative(invalidAbuse['recorded']),
      blocks: _nonNegative(invalidAbuse['blocks']),
      rejected: _nonNegative(invalidAbuse['rejected']),
      expired: _nonNegative(invalidAbuse['expired']),
      overflowed: _nonNegative(invalidAbuse['overflowed']),
      globalBlocked: _nonNegative(invalidAbuse['global_blocked']),
    ),
  );
});

Sub2ApiAdminOpsSystemLogPage mapAdminOpsSystemLogPage(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiPage(
        items: _list(source['items']).map(_systemLog).toList(growable: false),
        total: _nonNegative(source['total']),
        page: _positive(source['page']),
        pageSize: _positive(source['page_size']),
        pages: _nonNegative(source['pages']),
      );
    });

Sub2ApiAdminOpsSystemLogCleanupResult mapAdminOpsSystemLogCleanup(
  Object? data,
) => _guard(
  () => Sub2ApiAdminOpsSystemLogCleanupResult(
    deleted: _nonNegative(_object(data)['deleted']),
  ),
);

Sub2ApiAdminOpsSystemLogSinkHealth mapAdminOpsSystemLogHealth(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminOpsSystemLogSinkHealth(
        queueDepth: _nonNegative(source['queue_depth']),
        queueCapacity: _nonNegative(source['queue_capacity']),
        droppedCount: _nonNegative(source['dropped_count']),
        writeFailedCount: _nonNegative(source['write_failed_count']),
        writtenCount: _nonNegative(source['written_count']),
        averageWriteDelay: Duration(
          milliseconds: _nonNegative(source['avg_write_delay_ms']),
        ),
        lastError: _text(source['last_error']),
      );
    });

Sub2ApiAdminOpsIngressRejectRecord _ingressReject(Object? value) {
  final source = _object(value);
  final address = _text(source['client_ip']);
  return Sub2ApiAdminOpsIngressRejectRecord(
    id: _positive(source['id']),
    bucketStart: _date(source['bucket_start']),
    reason: _reason(source['reject_reason']),
    routeFamily: _routeFamily(source['route_family']),
    protocol: _protocol(source['protocol']),
    clientAddress: address.isEmpty
        ? null
        : Sub2ApiAdminOpsClientAddress(address),
    userId: _nullablePositive(source['user_id']),
    apiKeyId: _nullablePositive(source['api_key_id']),
    requestCount: _positive(source['request_count']),
    firstSeen: _date(source['first_seen']),
    lastSeen: _date(source['last_seen']),
  );
}

Sub2ApiAdminOpsSystemLogRecord _systemLog(Object? value) {
  final source = _object(value);
  final extra = source['extra'];
  return Sub2ApiAdminOpsSystemLogRecord(
    id: _positive(source['id']),
    createdAt: _date(source['created_at']),
    host: _text(source['host']),
    level: _requiredText(source['level']),
    component: _text(source['component']),
    message: Sub2ApiAdminOpsSystemLogContent(_text(source['message'])),
    requestId: _text(source['request_id']),
    clientRequestId: _text(source['client_request_id']),
    userId: _nullablePositive(source['user_id']),
    apiKeyId: _nullablePositive(source['api_key_id']),
    accountId: _nullablePositive(source['account_id']),
    platform: _text(source['platform']),
    model: _text(source['model']),
    extra: extra == null
        ? null
        : Sub2ApiAdminOpsSystemLogContent(jsonEncode(_object(extra))),
  );
}

Sub2ApiAdminOpsIngressRejectReason _reason(Object? value) =>
    switch (_requiredText(value)) {
      'query_api_key_deprecated' =>
        Sub2ApiAdminOpsIngressRejectReason.queryApiKeyDeprecated,
      'api_key_required' => Sub2ApiAdminOpsIngressRejectReason.apiKeyRequired,
      'invalid_api_key' => Sub2ApiAdminOpsIngressRejectReason.invalidApiKey,
      'invalid_auth_rate_limited' =>
        Sub2ApiAdminOpsIngressRejectReason.invalidAuthRateLimited,
      'api_key_auth_overloaded' =>
        Sub2ApiAdminOpsIngressRejectReason.apiKeyAuthOverloaded,
      'api_key_disabled' => Sub2ApiAdminOpsIngressRejectReason.apiKeyDisabled,
      'ip_restricted' => Sub2ApiAdminOpsIngressRejectReason.ipRestricted,
      'user_inactive' => Sub2ApiAdminOpsIngressRejectReason.userInactive,
      'group_deleted' => Sub2ApiAdminOpsIngressRejectReason.groupDeleted,
      'group_disabled' => Sub2ApiAdminOpsIngressRejectReason.groupDisabled,
      'group_not_allowed' => Sub2ApiAdminOpsIngressRejectReason.groupNotAllowed,
      'group_unassigned' => Sub2ApiAdminOpsIngressRejectReason.groupUnassigned,
      'other' => Sub2ApiAdminOpsIngressRejectReason.other,
      _ => throw const FormatException(),
    };

Sub2ApiAdminOpsIngressRouteFamily _routeFamily(Object? value) =>
    switch (_requiredText(value)) {
      'antigravity' => Sub2ApiAdminOpsIngressRouteFamily.antigravity,
      'gemini' => Sub2ApiAdminOpsIngressRouteFamily.gemini,
      'codex' => Sub2ApiAdminOpsIngressRouteFamily.codex,
      'messages' => Sub2ApiAdminOpsIngressRouteFamily.messages,
      'responses' => Sub2ApiAdminOpsIngressRouteFamily.responses,
      'chat_completions' => Sub2ApiAdminOpsIngressRouteFamily.chatCompletions,
      'images' => Sub2ApiAdminOpsIngressRouteFamily.images,
      'videos' => Sub2ApiAdminOpsIngressRouteFamily.videos,
      'embeddings' => Sub2ApiAdminOpsIngressRouteFamily.embeddings,
      'models' => Sub2ApiAdminOpsIngressRouteFamily.models,
      'other' => Sub2ApiAdminOpsIngressRouteFamily.other,
      _ => throw const FormatException(),
    };

Sub2ApiAdminOpsIngressProtocol _protocol(Object? value) =>
    switch (_requiredText(value)) {
      'google' => Sub2ApiAdminOpsIngressProtocol.google,
      'anthropic' => Sub2ApiAdminOpsIngressProtocol.anthropic,
      'openai' => Sub2ApiAdminOpsIngressProtocol.openai,
      'gateway' => Sub2ApiAdminOpsIngressProtocol.gateway,
      'other' => Sub2ApiAdminOpsIngressProtocol.other,
      _ => throw const FormatException(),
    };

Duration _durationNanos(Object? value) {
  final nanos = _nonNegative(value);
  if (nanos % 1000 != 0) throw const FormatException();
  return Duration(microseconds: nanos ~/ 1000);
}

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) throw const FormatException();
    result[entry.key as String] = entry.value;
  }
  return result;
}

List<Object?> _list(Object? value) {
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

String _text(Object? value) {
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

String _requiredText(Object? value) {
  final result = _text(value);
  if (result.trim().isEmpty) throw const FormatException();
  return result;
}

bool _bool(Object? value) {
  if (value is! bool) throw const FormatException();
  return value;
}

int _integer(Object? value) {
  if (value is! int) throw const FormatException();
  return value;
}

int _positive(Object? value) {
  final result = _integer(value);
  if (result <= 0) throw const FormatException();
  return result;
}

int _nonNegative(Object? value) {
  final result = _integer(value);
  if (result < 0) throw const FormatException();
  return result;
}

int? _nullablePositive(Object? value) =>
    value == null || value == 0 ? null : _positive(value);

DateTime _date(Object? value) => DateTime.parse(_requiredText(value)).toUtc();

T _guard<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_ops_observability_response',
  retryable: false,
);
