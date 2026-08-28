import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_risk_control_models.dart';

Sub2ApiAdminRiskControlConfig mapAdminRiskControlConfig(Object? data) =>
    _guard(() => _config(_object(data)));

Sub2ApiAdminTestRiskControlApiKeysResult mapAdminRiskControlApiKeyTest(
  Object? data,
) => _guard(() {
  final source = _object(data);
  return Sub2ApiAdminTestRiskControlApiKeysResult(
    items: _list(source['items']).map(_object).map(_keyStatus).toList(),
    imageCount: _nonNegativeInt(source['image_count']),
    auditResult: source['audit_result'] == null
        ? null
        : _auditResult(_object(source['audit_result'])),
  );
});

Sub2ApiAdminRiskControlStatus mapAdminRiskControlStatus(
  Object? data,
) => _guard(() {
  final source = _object(data);
  return Sub2ApiAdminRiskControlStatus(
    enabled: _bool(source['enabled']),
    riskControlEnabled: _bool(source['risk_control_enabled']),
    mode: _mode(_requiredText(source['mode'])),
    workerCount: _nonNegativeInt(source['worker_count']),
    maxWorkers: _nonNegativeInt(source['max_workers']),
    activeWorkers: _nonNegativeInt(source['active_workers']),
    idleWorkers: _nonNegativeInt(source['idle_workers']),
    queueSize: _nonNegativeInt(source['queue_size']),
    queueLength: _nonNegativeInt(source['queue_length']),
    queueUsagePercent: Sub2ApiDecimal.fromJson(source['queue_usage_percent']),
    enqueued: _nonNegativeInt(source['enqueued']),
    dropped: _nonNegativeInt(source['dropped']),
    processed: _nonNegativeInt(source['processed']),
    errors: _nonNegativeInt(source['errors']),
    preBlockActive: _nonNegativeInt(source['pre_block_active']),
    preBlockChecked: _nonNegativeInt(source['pre_block_checked']),
    preBlockAllowed: _nonNegativeInt(source['pre_block_allowed']),
    preBlockBlocked: _nonNegativeInt(source['pre_block_blocked']),
    preBlockErrors: _nonNegativeInt(source['pre_block_errors']),
    preBlockAverageLatencyMs: _nonNegativeInt(
      source['pre_block_avg_latency_ms'],
    ),
    preBlockApiKeyActive: _nonNegativeInt(source['pre_block_api_key_active']),
    preBlockApiKeyAvailableCount: _nonNegativeInt(
      source['pre_block_api_key_available_count'],
    ),
    preBlockApiKeyTotalCalls: _nonNegativeInt(
      source['pre_block_api_key_total_calls'],
    ),
    preBlockApiKeyLoads: _list(
      source['pre_block_api_key_loads'],
    ).map(_object).map(_keyLoad).toList(),
    apiKeyStatuses: _list(
      source['api_key_statuses'],
    ).map(_object).map(_keyStatus).toList(),
    flaggedHashCount: _nonNegativeInt(source['flagged_hash_count']),
    lastCleanupAt: _optionalDate(source['last_cleanup_at']),
    lastCleanupDeletedHit: _nonNegativeInt(source['last_cleanup_deleted_hit']),
    lastCleanupDeletedNonHit: _nonNegativeInt(
      source['last_cleanup_deleted_non_hit'],
    ),
  );
});

Sub2ApiAdminRiskControlLogPage mapAdminRiskControlLogPage(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiPage<Sub2ApiAdminRiskControlLog>(
        items: _list(
          source['items'],
        ).map(_object).map(_log).toList(growable: false),
        total: _nonNegativeInt(source['total']),
        page: _positiveInt(source['page']),
        pageSize: _positiveInt(source['page_size']),
        pages: _positiveInt(source['pages']),
      );
    });

Sub2ApiAdminRiskControlUnbanResult mapAdminRiskControlUnban(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminRiskControlUnbanResult(
        userId: _positiveInt(source['user_id']),
        status: _requiredText(source['status']),
      );
    });

Sub2ApiAdminRiskControlDeleteHashResult mapAdminRiskControlDeleteHash(
  Object? data,
) => _guard(() {
  final source = _object(data);
  return Sub2ApiAdminRiskControlDeleteHashResult(
    inputHash: Sub2ApiAdminRiskControlHash(_requiredText(source['input_hash'])),
    deleted: _bool(source['deleted']),
  );
});

Sub2ApiAdminRiskControlClearHashesResult mapAdminRiskControlClearHashes(
  Object? data,
) => _guard(
  () => Sub2ApiAdminRiskControlClearHashesResult(
    deleted: _nonNegativeInt(_object(data)['deleted']),
  ),
);

Sub2ApiAdminRiskControlConfig _config(Map<String, Object?> source) =>
    Sub2ApiAdminRiskControlConfig(
      enabled: _bool(source['enabled']),
      mode: _mode(_requiredText(source['mode'])),
      baseUrl: _uri(source['base_url']),
      model: _requiredText(source['model']),
      proxyId: _optionalPositiveInt(source['proxy_id']),
      apiKeyConfigured: _bool(source['api_key_configured']),
      apiKeyMasked: Sub2ApiAdminMaskedCredential(
        _text(source['api_key_masked']),
      ),
      apiKeyCount: _nonNegativeInt(source['api_key_count']),
      apiKeyMasks: _list(
        source['api_key_masks'],
      ).map(_text).map(Sub2ApiAdminMaskedCredential.new).toList(),
      apiKeyStatuses: _list(
        source['api_key_statuses'],
      ).map(_object).map(_keyStatus).toList(),
      timeoutMs: _positiveInt(source['timeout_ms']),
      sampleRate: _nonNegativeInt(source['sample_rate']),
      allGroups: _bool(source['all_groups']),
      groupIds: _positiveIntList(source['group_ids']),
      recordNonHits: _bool(source['record_non_hits']),
      thresholds: _decimalMap(source['thresholds']),
      workerCount: _positiveInt(source['worker_count']),
      queueSize: _positiveInt(source['queue_size']),
      blockStatus: _positiveInt(source['block_status']),
      blockMessage: _text(source['block_message']),
      emailOnHit: _bool(source['email_on_hit']),
      autoBanEnabled: _bool(source['auto_ban_enabled']),
      banThreshold: _positiveInt(source['ban_threshold']),
      violationWindowHours: _positiveInt(source['violation_window_hours']),
      retryCount: _nonNegativeInt(source['retry_count']),
      hitRetentionDays: _positiveInt(source['hit_retention_days']),
      nonHitRetentionDays: _nonNegativeInt(source['non_hit_retention_days']),
      preHashCheckEnabled: _bool(source['pre_hash_check_enabled']),
      blockedKeywords: _stringList(source['blocked_keywords']),
      keywordBlockingMode: _keywordMode(
        _requiredText(source['keyword_blocking_mode']),
      ),
      modelFilter: _modelFilter(_object(source['model_filter'])),
      cyberPolicyExcludeFromBanCount: _bool(
        source['cyber_policy_exclude_from_ban_count'],
      ),
    );

Sub2ApiAdminRiskControlApiKeyStatus _keyStatus(Map<String, Object?> source) =>
    Sub2ApiAdminRiskControlApiKeyStatus(
      index: _nonNegativeInt(source['index']),
      keyHash: Sub2ApiAdminRiskControlHash(_requiredText(source['key_hash'])),
      masked: Sub2ApiAdminMaskedCredential(_text(source['masked'])),
      status: _requiredText(source['status']),
      failureCount: _nonNegativeInt(source['failure_count']),
      successCount: _nonNegativeInt(source['success_count']),
      lastError: _text(source['last_error']),
      lastCheckedAt: _optionalDate(source['last_checked_at']),
      frozenUntil: _optionalDate(source['frozen_until']),
      lastLatencyMs: _nonNegativeInt(source['last_latency_ms']),
      lastHttpStatus: _nonNegativeInt(source['last_http_status']),
      lastTested: _bool(source['last_tested']),
      configured: _bool(source['configured']),
    );

Sub2ApiAdminRiskControlApiKeyLoad _keyLoad(Map<String, Object?> source) =>
    Sub2ApiAdminRiskControlApiKeyLoad(
      index: _nonNegativeInt(source['index']),
      keyHash: Sub2ApiAdminRiskControlHash(_requiredText(source['key_hash'])),
      masked: Sub2ApiAdminMaskedCredential(_text(source['masked'])),
      status: _requiredText(source['status']),
      active: _nonNegativeInt(source['active']),
      total: _nonNegativeInt(source['total']),
      success: _nonNegativeInt(source['success']),
      errors: _nonNegativeInt(source['errors']),
      averageLatencyMs: _nonNegativeInt(source['avg_latency_ms']),
      lastLatencyMs: _nonNegativeInt(source['last_latency_ms']),
      lastHttpStatus: _nonNegativeInt(source['last_http_status']),
    );

Sub2ApiAdminRiskControlAuditResult _auditResult(Map<String, Object?> source) =>
    Sub2ApiAdminRiskControlAuditResult(
      flagged: _bool(source['flagged']),
      highestCategory: _text(source['highest_category']),
      highestScore: Sub2ApiDecimal.fromJson(source['highest_score']),
      compositeScore: Sub2ApiDecimal.fromJson(source['composite_score']),
      categoryScores: _decimalMap(source['category_scores']),
      thresholds: _decimalMap(source['thresholds']),
    );

Sub2ApiAdminRiskControlLog _log(Map<String, Object?> source) =>
    Sub2ApiAdminRiskControlLog(
      id: _positiveInt(source['id']),
      requestId: _requiredText(source['request_id']),
      userId: _optionalPositiveInt(source['user_id']),
      userEmail: _text(source['user_email']),
      apiKeyId: _optionalPositiveInt(source['api_key_id']),
      apiKeyName: _text(source['api_key_name']),
      groupId: _optionalPositiveInt(source['group_id']),
      groupName: _text(source['group_name']),
      endpoint: _text(source['endpoint']),
      provider: _text(source['provider']),
      model: _text(source['model']),
      mode: _mode(_requiredText(source['mode'])),
      action: _action(_requiredText(source['action'])),
      flagged: _bool(source['flagged']),
      highestCategory: _text(source['highest_category']),
      highestScore: Sub2ApiDecimal.fromJson(source['highest_score']),
      matchedKeyword: _text(source['matched_keyword']),
      categoryScores: _decimalMap(source['category_scores']),
      thresholdSnapshot: _decimalMap(source['threshold_snapshot']),
      inputExcerpt: Sub2ApiAdminModerationExcerpt(
        _text(source['input_excerpt']),
      ),
      upstreamLatencyMs: _optionalNonNegativeInt(source['upstream_latency_ms']),
      error: _text(source['error']),
      violationCount: _nonNegativeInt(source['violation_count']),
      autoBanned: _bool(source['auto_banned']),
      emailSent: _bool(source['email_sent']),
      userStatus: _text(source['user_status']),
      queueDelayMs: _optionalNonNegativeInt(source['queue_delay_ms']),
      createdAt: _date(source['created_at']),
    );

Sub2ApiAdminRiskControlModelFilter _modelFilter(Map<String, Object?> source) =>
    Sub2ApiAdminRiskControlModelFilter(
      type: _modelFilterType(_requiredText(source['type'])),
      models: _stringList(source['models']),
    );

Sub2ApiAdminRiskControlMode _mode(String value) => switch (value) {
  'off' => Sub2ApiAdminRiskControlMode.off,
  'observe' => Sub2ApiAdminRiskControlMode.observe,
  'pre_block' => Sub2ApiAdminRiskControlMode.preBlock,
  _ => throw const FormatException(),
};

Sub2ApiAdminRiskControlKeywordMode _keywordMode(String value) =>
    switch (value) {
      'keyword_only' => Sub2ApiAdminRiskControlKeywordMode.keywordOnly,
      'keyword_and_api' => Sub2ApiAdminRiskControlKeywordMode.keywordAndApi,
      'api_only' => Sub2ApiAdminRiskControlKeywordMode.apiOnly,
      _ => throw const FormatException(),
    };

Sub2ApiAdminRiskControlModelFilterType _modelFilterType(String value) =>
    switch (value) {
      'all' => Sub2ApiAdminRiskControlModelFilterType.all,
      'include' => Sub2ApiAdminRiskControlModelFilterType.include,
      'exclude' => Sub2ApiAdminRiskControlModelFilterType.exclude,
      _ => throw const FormatException(),
    };

Sub2ApiAdminRiskControlAction _action(String value) => switch (value) {
  'allow' => Sub2ApiAdminRiskControlAction.allow,
  'block' => Sub2ApiAdminRiskControlAction.block,
  'hash_block' => Sub2ApiAdminRiskControlAction.hashBlock,
  'keyword_block' => Sub2ApiAdminRiskControlAction.keywordBlock,
  'error' => Sub2ApiAdminRiskControlAction.error,
  'cyber_policy' => Sub2ApiAdminRiskControlAction.cyberPolicy,
  _ => throw const FormatException(),
};

Map<String, Sub2ApiDecimal> _decimalMap(Object? value) => _object(
  value,
).map((key, item) => MapEntry(key, Sub2ApiDecimal.fromJson(item)));

Uri _uri(Object? value) {
  final uri = Uri.parse(_requiredText(value));
  if (!uri.hasAuthority || (uri.scheme != 'http' && uri.scheme != 'https')) {
    throw const FormatException();
  }
  return uri;
}

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

List<Object?> _list(Object? value) {
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

String _text(Object? value) {
  if (value is! String) throw const FormatException();
  return value;
}

String _requiredText(Object? value) {
  final text = _text(value);
  if (text.trim().isEmpty) throw const FormatException();
  return text;
}

List<String> _stringList(Object? value) =>
    _list(value).map(_requiredText).toList(growable: false);

List<int> _positiveIntList(Object? value) =>
    _list(value).map(_positiveInt).toList(growable: false);

bool _bool(Object? value) {
  if (value is! bool) throw const FormatException();
  return value;
}

int _positiveInt(Object? value) {
  if (value is! int || value <= 0) throw const FormatException();
  return value;
}

int _nonNegativeInt(Object? value) {
  if (value is! int || value < 0) throw const FormatException();
  return value;
}

int? _optionalPositiveInt(Object? value) =>
    value == null ? null : _positiveInt(value);

int? _optionalNonNegativeInt(Object? value) =>
    value == null ? null : _nonNegativeInt(value);

DateTime _date(Object? value) => DateTime.parse(_requiredText(value)).toUtc();

DateTime? _optionalDate(Object? value) => value == null ? null : _date(value);

T _guard<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_risk_control_response',
  retryable: false,
);
