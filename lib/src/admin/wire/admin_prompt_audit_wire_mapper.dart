import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_prompt_audit_models.dart';

Sub2ApiAdminPromptAuditConfig mapAdminPromptAuditConfig(Object? data) =>
    _guard(() => _config(_object(data)));
Sub2ApiAdminPromptAuditProbeResult mapAdminPromptAuditProbe(Object? data) =>
    _guard(() => _probe(_object(data)));
Sub2ApiAdminPromptAuditRuntime mapAdminPromptAuditRuntime(Object? data) =>
    _guard(() => _runtime(_object(data)));
Sub2ApiAdminPromptAuditEvent mapAdminPromptAuditEvent(Object? data) =>
    _guard(() => _event(_object(data)));
Sub2ApiAdminPromptAuditDeleteResult mapAdminPromptAuditDelete(Object? data) =>
    _guard(() => _deleteResult(_object(data)));

Sub2ApiAdminPromptAuditEventPage mapAdminPromptAuditEventPage(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiPage<Sub2ApiAdminPromptAuditEvent>(
        items: _list(source['items']).map(_object).map(_event).toList(),
        total: _nonNegativeInt(source['total']),
        page: _positiveInt(source['page']),
        pageSize: _positiveInt(source['page_size']),
        pages: _positiveInt(source['pages']),
      );
    });

Sub2ApiAdminPromptAuditDeletePreview mapAdminPromptAuditDeletePreview(
  Object? data,
) => _guard(() {
  final source = _object(data);
  return Sub2ApiAdminPromptAuditDeletePreview(
    matchedCount: _nonNegativeInt(source['matched_count']),
    filterSummary: _filter(_object(source['filter_summary'])),
    snapshotMaxId: _nonNegativeInt(source['snapshot_max_id']),
    filterHash: Sub2ApiAdminPromptAuditHash(_hash(source['filter_hash'])),
    confirmationToken: Sub2ApiAdminPromptAuditDeleteToken(
      _requiredText(source['confirmation_token']),
    ),
    expiresAt: _date(source['expires_at']),
  );
});

Sub2ApiAdminPromptAuditConfig _config(Map<String, Object?> s) =>
    Sub2ApiAdminPromptAuditConfig(
      enabled: _bool(s['enabled']),
      blockingEnabled: _bool(s['blocking_enabled']),
      blockingLatestTurnOnly: _bool(s['blocking_latest_turn_only']),
      storePassEvents: _bool(s['store_pass_events']),
      effectiveMode: _mode(_requiredText(s['effective_mode'])),
      strategy: _strategy(_requiredText(s['strategy'])),
      workerCount: _positiveInt(s['worker_count']),
      queueCapacity: _positiveInt(s['queue_capacity']),
      scanners: _stringList(s['scanners']),
      allGroups: _bool(s['all_groups']),
      groupIds: _positiveIntList(s['group_ids']),
      endpoints: _list(s['endpoints']).map(_object).map(_endpoint).toList(),
      configVersion: _positiveInt(s['config_version']),
      updatedAt: _date(s['updated_at']),
      updatedBy: _nonNegativeInt(s['updated_by']),
      changeSummary: _text(s['change_summary']),
    );

Sub2ApiAdminPromptAuditEndpoint _endpoint(Map<String, Object?> s) =>
    Sub2ApiAdminPromptAuditEndpoint(
      id: _requiredText(s['id']),
      name: _requiredText(s['name']),
      protocol: _requiredText(s['protocol']),
      baseUrl: _uri(s['base_url']),
      model: _requiredText(s['model']),
      timeout: Duration(milliseconds: _positiveInt(s['timeout_ms'])),
      inputLimit: _positiveInt(s['input_limit']),
      enabled: _bool(s['enabled']),
      hasToken: _bool(s['has_token']),
      tokenStatus: _requiredText(s['token_status']),
    );

Sub2ApiAdminPromptAuditProbeResult _probe(Map<String, Object?> s) =>
    Sub2ApiAdminPromptAuditProbeResult(
      ok: _bool(s['ok']),
      status: _requiredText(s['status']),
      errorCode: _text(s['error_code']),
      message: _text(s['message']),
      latency: Duration(milliseconds: _nonNegativeInt(s['latency_ms'])),
      httpStatus: _nonNegativeInt(s['http_status']),
      retryable: _bool(s['retryable']),
      checkedAt: _date(s['checked_at']),
      tokenApplied: _bool(s['token_applied']),
    );

Sub2ApiAdminPromptAuditRuntime _runtime(Map<String, Object?> s) {
  final endpoints = <String, Sub2ApiAdminPromptAuditProbeResult>{};
  for (final entry in _object(s['endpoints']).entries) {
    endpoints[entry.key] = _probe(_object(entry.value));
  }
  return Sub2ApiAdminPromptAuditRuntime(
    processStatus: _requiredText(s['process_status']),
    effectiveMode: _mode(_requiredText(s['effective_mode'])),
    expectedConfigVersion: _nonNegativeInt(s['expected_config_version']),
    activeConfigVersion: _nonNegativeInt(s['active_config_version']),
    configLoadedAt: _optionalDate(s['config_loaded_at']),
    configLoadError: _text(s['config_load_error']),
    workerTotal: _nonNegativeInt(s['worker_total']),
    workerActive: _nonNegativeInt(s['worker_active']),
    workerHeartbeatAt: _optionalDate(s['worker_heartbeat_at']),
    queueCapacity: _nonNegativeInt(s['queue_capacity']),
    queue: _queue(_object(s['queue'])),
    processedTotal: _nonNegativeInt(s['processed_total']),
    failedTotal: _nonNegativeInt(s['failed_total']),
    enqueuedTotal: _nonNegativeInt(s['enqueued_total']),
    droppedTotal: _nonNegativeInt(s['dropped_total']),
    lastProcessedAt: _optionalDate(s['last_processed_at']),
    lastErrorCode: _text(s['last_error_code']),
    lastErrorMessage: _text(s['last_error_message']),
    databaseStatus: _requiredText(s['database_status']),
    redisStatus: _requiredText(s['redis_status']),
    endpoints: endpoints,
    guardMetrics: _metrics(_object(s['guard_metrics'])),
  );
}

Sub2ApiAdminPromptAuditQueueStats _queue(Map<String, Object?> s) =>
    Sub2ApiAdminPromptAuditQueueStats(
      staging: _nonNegativeInt(s['staging']),
      queued: _nonNegativeInt(s['queued']),
      processing: _nonNegativeInt(s['processing']),
      retry: _nonNegativeInt(s['retry']),
      done: _nonNegativeInt(s['done']),
      failed: _nonNegativeInt(s['failed']),
      active: _nonNegativeInt(s['active']),
    );

Sub2ApiAdminPromptAuditGuardMetrics _metrics(Map<String, Object?> s) =>
    Sub2ApiAdminPromptAuditGuardMetrics(
      total: _nonNegativeInt(s['total']),
      allowed: _nonNegativeInt(s['allowed']),
      flagged: _nonNegativeInt(s['flagged']),
      blocked: _nonNegativeInt(s['blocked']),
      unavailable: _nonNegativeInt(s['unavailable']),
      invalid: _nonNegativeInt(s['invalid']),
      timeouts: _nonNegativeInt(s['timeouts']),
      failovers: _nonNegativeInt(s['failovers']),
      bulkheadFull: _nonNegativeInt(s['bulkhead_full']),
      recordFailed: _nonNegativeInt(s['record_failed']),
      latencyCount: _nonNegativeInt(s['latency_count']),
      latencyAverage: Duration(
        milliseconds: _nonNegativeInt(s['latency_avg_ms']),
      ),
      latencyP50: Duration(milliseconds: _nonNegativeInt(s['latency_p50_ms'])),
      latencyP95: Duration(milliseconds: _nonNegativeInt(s['latency_p95_ms'])),
      latencyP99: Duration(milliseconds: _nonNegativeInt(s['latency_p99_ms'])),
      latencyMax: Duration(milliseconds: _nonNegativeInt(s['latency_max_ms'])),
    );

Sub2ApiAdminPromptAuditEvent _event(Map<String, Object?> s) =>
    Sub2ApiAdminPromptAuditEvent(
      id: _positiveInt(s['id']),
      jobId: _positiveInt(s['job_id']),
      snapshot: _snapshot(_object(s['snapshot'])),
      decision: _decision(_requiredText(s['decision'])),
      riskLevel: _risk(_requiredText(s['risk_level'])),
      action: _action(_requiredText(s['action'])),
      categories: _stringList(s['categories']),
      matchedScanners: _stringList(s['matched_scanners']),
      scannerScores: _decimalMap(s['scanner_scores']),
      scannerEvidence: _evidenceMap(s['scanner_evidence']),
      scannerBackend: _text(s['scanner_backend']),
      scannerVersion: _text(s['scanner_version']),
      guardEndpointId: _text(s['guard_endpoint_id']),
      policyId: _text(s['policy_id']),
      policyVersion: _nonNegativeInt(s['policy_version']),
      configVersion: _positiveInt(s['config_version']),
      chunkTotal: _positiveInt(s['chunk_total']),
      latency: Duration(milliseconds: _nonNegativeInt(s['latency_ms'])),
      issues: _list(s['issue_summaries']).map(_object).map(_issue).toList(),
      createdAt: _date(s['created_at']),
    );

Sub2ApiAdminPromptAuditSnapshot _snapshot(Map<String, Object?> s) =>
    Sub2ApiAdminPromptAuditSnapshot(
      requestId: _requiredText(s['request_id']),
      userId: _positiveInt(s['user_id']),
      username: _text(s['username']),
      userEmail: _text(s['user_email']),
      apiKeyId: _positiveInt(s['api_key_id']),
      apiKeyName: _text(s['api_key_name']),
      groupId: _optionalPositiveInt(s['group_id']),
      groupName: _text(s['group_name']),
      provider: _text(s['provider']),
      endpoint: _text(s['endpoint']),
      protocol: _text(s['protocol']),
      model: _text(s['model']),
      promptHash: Sub2ApiAdminPromptAuditHash(_hash(s['prompt_hash'])),
      redactedPreview: Sub2ApiAdminPromptAuditContent(
        _text(s['redacted_preview']),
      ),
      fullPrompt: Sub2ApiAdminPromptAuditContent(_text(s['full_prompt'])),
      promptLength: _nonNegativeInt(s['prompt_length']),
      messageCount: _nonNegativeInt(s['message_count']),
      stage: _text(s['stage']),
    );

Sub2ApiAdminPromptAuditIssue _issue(Map<String, Object?> s) =>
    Sub2ApiAdminPromptAuditIssue(
      category: _text(s['category']),
      scannerId: _text(s['scanner_id']),
      title: _text(s['title']),
      description: _text(s['description']),
      severity: _text(s['severity']),
      severityLabel: _text(s['severity_label']),
      action: _text(s['action']),
      actionLabel: _text(s['action_label']),
      code: _text(s['code']),
      score: Sub2ApiDecimal.fromJson(s['score']),
      evidence: Sub2ApiAdminPromptAuditEvidence(_text(s['evidence'])),
      evidenceHash: Sub2ApiAdminPromptAuditHash(_hash(s['evidence_hash'])),
      startRune: _optionalNonNegativeInt(s['start_rune']),
      endRune: _optionalNonNegativeInt(s['end_rune']),
    );

Sub2ApiAdminPromptAuditEventFilter _filter(Map<String, Object?> s) =>
    Sub2ApiAdminPromptAuditEventFilter(
      decision: _optionalDecision(s['decision']),
      riskLevel: _optionalRisk(s['risk_level']),
      endpoint: _emptyToNull(_text(s['endpoint'])),
      groupId: _optionalPositiveInt(s['group_id']),
      userId: _optionalPositiveInt(s['user_id']),
      apiKeyId: _optionalPositiveInt(s['api_key_id']),
      requestId: _emptyToNull(_text(s['request_id'])),
      promptHash: _optionalHash(s['prompt_hash']),
      keyword: _emptyToNull(_text(s['keyword'])),
      startAt: _optionalDate(s['start_at']),
      endAt: _optionalDate(s['end_at']),
    );

Sub2ApiAdminPromptAuditDeleteResult _deleteResult(Map<String, Object?> s) =>
    Sub2ApiAdminPromptAuditDeleteResult(
      deletedEvents: _nonNegativeInt(s['deleted_events']),
      deletedJobs: _nonNegativeInt(s['deleted_jobs']),
    );

Sub2ApiAdminPromptAuditMode _mode(String v) => switch (v) {
  'off' => Sub2ApiAdminPromptAuditMode.off,
  'async_audit' => Sub2ApiAdminPromptAuditMode.asyncAudit,
  'blocking' => Sub2ApiAdminPromptAuditMode.blocking,
  _ => throw const FormatException(),
};
Sub2ApiAdminPromptAuditStrategy _strategy(String v) => v == 'priority'
    ? Sub2ApiAdminPromptAuditStrategy.priority
    : throw const FormatException();
Sub2ApiAdminPromptAuditDecision _decision(String v) => switch (v) {
  'pass' => Sub2ApiAdminPromptAuditDecision.pass,
  'flag' => Sub2ApiAdminPromptAuditDecision.flag,
  'critical' => Sub2ApiAdminPromptAuditDecision.critical,
  _ => throw const FormatException(),
};
Sub2ApiAdminPromptAuditRiskLevel _risk(String v) => switch (v) {
  'low' => Sub2ApiAdminPromptAuditRiskLevel.low,
  'medium' => Sub2ApiAdminPromptAuditRiskLevel.medium,
  'high' => Sub2ApiAdminPromptAuditRiskLevel.high,
  'critical' => Sub2ApiAdminPromptAuditRiskLevel.critical,
  _ => throw const FormatException(),
};
Sub2ApiAdminPromptAuditAction _action(String v) => switch (v) {
  'Allow' => Sub2ApiAdminPromptAuditAction.allow,
  'Warn' => Sub2ApiAdminPromptAuditAction.warn,
  'Block' => Sub2ApiAdminPromptAuditAction.block,
  _ => throw const FormatException(),
};
Sub2ApiAdminPromptAuditDecision? _optionalDecision(Object? v) {
  final t = _text(v);
  return t.isEmpty ? null : _decision(t);
}

Sub2ApiAdminPromptAuditRiskLevel? _optionalRisk(Object? v) {
  final t = _text(v);
  return t.isEmpty ? null : _risk(t);
}

Sub2ApiAdminPromptAuditHash? _optionalHash(Object? v) {
  final t = _text(v);
  return t.isEmpty ? null : Sub2ApiAdminPromptAuditHash(_hash(t));
}

Map<String, Sub2ApiDecimal> _decimalMap(Object? v) =>
    _object(v).map((k, x) => MapEntry(k, Sub2ApiDecimal.fromJson(x)));
Map<String, Sub2ApiAdminPromptAuditEvidence> _evidenceMap(Object? v) => _object(
  v,
).map((k, x) => MapEntry(k, Sub2ApiAdminPromptAuditEvidence(_text(x))));
Uri _uri(Object? v) {
  final u = Uri.parse(_requiredText(v));
  if (!u.hasAuthority || (u.scheme != 'http' && u.scheme != 'https')) {
    throw const FormatException();
  }
  return u;
}

String _hash(Object? v) {
  final h = _requiredText(v).toLowerCase();
  if (!RegExp(r'^[0-9a-f]{64}$').hasMatch(h)) throw const FormatException();
  return h;
}

Map<String, Object?> _object(Object? v) {
  if (v is! Map) throw const FormatException();
  return Map<String, Object?>.from(v);
}

List<Object?> _list(Object? v) {
  if (v is! List) throw const FormatException();
  return v.cast<Object?>();
}

List<String> _stringList(Object? v) => _list(v).map(_requiredText).toList();
List<int> _positiveIntList(Object? v) => _list(v).map(_positiveInt).toList();
String _text(Object? v) {
  if (v == null) return '';
  if (v is! String) throw const FormatException();
  return v;
}

String _requiredText(Object? v) {
  final t = _text(v);
  if (t.trim().isEmpty) throw const FormatException();
  return t;
}

String? _emptyToNull(String v) => v.trim().isEmpty ? null : v;
bool _bool(Object? v) {
  if (v is! bool) throw const FormatException();
  return v;
}

int _positiveInt(Object? v) {
  if (v is! int || v <= 0) throw const FormatException();
  return v;
}

int _nonNegativeInt(Object? v) {
  if (v is! int || v < 0) throw const FormatException();
  return v;
}

int? _optionalPositiveInt(Object? v) => v == null ? null : _positiveInt(v);
int? _optionalNonNegativeInt(Object? v) =>
    v == null ? null : _nonNegativeInt(v);
DateTime _date(Object? v) => DateTime.parse(_requiredText(v)).toUtc();
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
  code: 'protocol.invalid_admin_prompt_audit_response',
  retryable: false,
);
