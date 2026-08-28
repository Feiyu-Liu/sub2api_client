import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_risk_control_models.dart';
import 'wire/admin_risk_control_wire_mapper.dart';
import 'wire/admin_risk_control_wire_service.dart';

abstract interface class Sub2ApiAdminRiskControlClient {
  Future<Sub2ApiAdminRiskControlConfig> getConfig({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminRiskControlConfig> updateConfig(
    Sub2ApiAdminUpdateRiskControlConfigRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminTestRiskControlApiKeysResult> testApiKeys(
    Sub2ApiAdminTestRiskControlApiKeysRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminRiskControlStatus> getStatus({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminRiskControlLogPage> listLogs({
    Sub2ApiAdminRiskControlLogQuery query =
        const Sub2ApiAdminRiskControlLogQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminRiskControlUnbanResult> unbanUser(
    int userId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminRiskControlDeleteHashResult> deleteFlaggedHash(
    Sub2ApiAdminRiskControlHash inputHash, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminRiskControlClearHashesResult> clearFlaggedHashes({
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminRiskControlClient createSub2ApiAdminRiskControlClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminRiskControlClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminRiskControlWireService(dio);

  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminRiskControlWireService _service;

  @override
  Future<Sub2ApiAdminRiskControlConfig> getConfig({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, credential) => _service.config(
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminRiskControlConfig,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminRiskControlConfig> updateConfig(
    Sub2ApiAdminUpdateRiskControlConfigRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _configBody(request);
    if (body.isEmpty) throw _validation('admin.risk_control.empty_update');
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.updateConfig(
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminRiskControlConfig,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminTestRiskControlApiKeysResult> testApiKeys(
    Sub2ApiAdminTestRiskControlApiKeysRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final keys = _keys(request.apiKeys);
    final baseUrl = _url(request.baseUrl);
    final model = request.model.trim();
    if (model.isEmpty) throw _validation('admin.risk_control.model_required');
    if (request.timeoutMs <= 0 || request.timeoutMs > 30000) {
      throw _validation('admin.risk_control.invalid_timeout');
    }
    if (request.proxyId != null && request.proxyId! < 0) {
      throw _validation('admin.risk_control.invalid_proxy_id');
    }
    if (request.images.length > 1) {
      throw _validation('admin.risk_control.too_many_images');
    }
    final prompt = request.prompt.reveal().trim();
    final images = request.images.map((image) => image.reveal()).toList();
    if (prompt.isEmpty && images.isEmpty) {
      throw _validation('admin.risk_control.test_input_required');
    }
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.testApiKeys(
        <String, Object?>{
          'api_keys': keys,
          'base_url': baseUrl,
          'model': model,
          'timeout_ms': request.timeoutMs,
          'proxy_id': ?request.proxyId,
          'prompt': prompt,
          'images': images,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminRiskControlApiKeyTest,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminRiskControlStatus> getStatus({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, credential) => _service.status(
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminRiskControlStatus,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminRiskControlLogPage> listLogs({
    Sub2ApiAdminRiskControlLogQuery query =
        const Sub2ApiAdminRiskControlLogQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _page(query.page, query.pageSize);
    if (query.groupId != null && query.groupId! <= 0) {
      throw _validation('admin.risk_control.invalid_group_id');
    }
    if (query.from != null &&
        query.to != null &&
        query.to!.isBefore(query.from!)) {
      throw _validation('admin.risk_control.invalid_log_range');
    }
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.logs(
        <String, dynamic>{
          'page': query.page,
          'page_size': query.pageSize,
          if (query.result != null) 'result': _action(query.result!),
          'group_id': ?query.groupId,
          if (query.endpoint?.trim().isNotEmpty ?? false)
            'endpoint': query.endpoint!.trim(),
          if (query.search?.trim().isNotEmpty ?? false)
            'search': query.search!.trim(),
          if (query.from != null) 'from': query.from!.toUtc().toIso8601String(),
          if (query.to != null) 'to': query.to!.toUtc().toIso8601String(),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminRiskControlLogPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminRiskControlUnbanResult> unbanUser(
    int userId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (userId <= 0) throw _validation('admin.risk_control.invalid_user_id');
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.unbanUser(
        userId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminRiskControlUnban,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminRiskControlDeleteHashResult> deleteFlaggedHash(
    Sub2ApiAdminRiskControlHash inputHash, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final hash = _hash(inputHash);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.deleteHash(
        <String, Object?>{'input_hash': hash},
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminRiskControlDeleteHash,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminRiskControlClearHashesResult> clearFlaggedHashes({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedNonReplayableRequest(
    send: (cancelToken, options, credential) => _service.clearHashes(
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminRiskControlClearHashes,
    requestOptions: requestOptions,
  );

  String? _authorization(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

Map<String, Object?> _configBody(
  Sub2ApiAdminUpdateRiskControlConfigRequest request,
) {
  if (request.clearApiKeys &&
      (request.apiKeys != null || request.deleteApiKeyHashes != null)) {
    throw _validation('admin.risk_control.api_key_clear_conflict');
  }
  if (request.apiKeysMode == Sub2ApiAdminRiskControlApiKeysMode.replace &&
      request.deleteApiKeyHashes != null) {
    throw _validation('admin.risk_control.api_key_mode_conflict');
  }
  final keyValues = request.apiKeys == null ? null : _keys(request.apiKeys!);
  final deleteHashes = request.deleteApiKeyHashes
      ?.map(_hash)
      .toList(growable: false);
  if (request.baseUrl != null) _url(request.baseUrl!);
  if (request.proxyId != null && request.proxyId! < 0) {
    throw _validation('admin.risk_control.invalid_proxy_id');
  }
  if (request.timeoutMs != null &&
      (request.timeoutMs! <= 0 || request.timeoutMs! > 30000)) {
    throw _validation('admin.risk_control.invalid_timeout');
  }
  if (request.sampleRate != null &&
      (request.sampleRate! < 0 || request.sampleRate! > 100)) {
    throw _validation('admin.risk_control.invalid_sample_rate');
  }
  if (request.workerCount != null &&
      (request.workerCount! <= 0 || request.workerCount! > 32)) {
    throw _validation('admin.risk_control.invalid_worker_count');
  }
  if (request.queueSize != null &&
      (request.queueSize! <= 0 || request.queueSize! > 100000)) {
    throw _validation('admin.risk_control.invalid_queue_size');
  }
  if (request.blockStatus != null &&
      (request.blockStatus! < 400 || request.blockStatus! > 599)) {
    throw _validation('admin.risk_control.invalid_block_status');
  }
  if (request.retryCount != null &&
      (request.retryCount! < 0 || request.retryCount! > 5)) {
    throw _validation('admin.risk_control.invalid_retry_count');
  }
  if (request.nonHitRetentionDays != null &&
      (request.nonHitRetentionDays! <= 0 || request.nonHitRetentionDays! > 3)) {
    throw _validation('admin.risk_control.invalid_non_hit_retention');
  }
  if (request.hitRetentionDays != null &&
      (request.hitRetentionDays! <= 0 || request.hitRetentionDays! > 3650)) {
    throw _validation('admin.risk_control.invalid_hit_retention');
  }
  if (request.groupIds?.any((id) => id <= 0) ?? false) {
    throw _validation('admin.risk_control.invalid_group_id');
  }
  if (request.thresholds != null) _validateThresholds(request.thresholds!);
  if (request.modelFilter != null) _validateModelFilter(request.modelFilter!);
  if (request.blockedKeywords != null &&
      request.blockedKeywords!.length > 10000) {
    throw _validation('admin.risk_control.too_many_keywords');
  }
  return <String, Object?>{
    'enabled': ?request.enabled,
    if (request.mode != null) 'mode': _mode(request.mode!),
    if (request.baseUrl != null) 'base_url': _url(request.baseUrl!),
    if (request.model != null) 'model': request.model!.trim(),
    'proxy_id': ?request.proxyId,
    'api_keys': ?keyValues,
    if (keyValues != null) 'api_keys_mode': request.apiKeysMode.name,
    'delete_api_key_hashes': ?deleteHashes,
    if (request.clearApiKeys) 'clear_api_key': true,
    'timeout_ms': ?request.timeoutMs,
    'sample_rate': ?request.sampleRate,
    'all_groups': ?request.allGroups,
    if (request.groupIds != null)
      'group_ids': request.groupIds!.toSet().toList()..sort(),
    'record_non_hits': ?request.recordNonHits,
    if (request.thresholds != null)
      'thresholds': request.thresholds!.map(
        (key, value) => MapEntry(key, _decimal(value)),
      ),
    'worker_count': ?request.workerCount,
    'queue_size': ?request.queueSize,
    'block_status': ?request.blockStatus,
    if (request.blockMessage != null)
      'block_message': request.blockMessage!.trim(),
    'email_on_hit': ?request.emailOnHit,
    'auto_ban_enabled': ?request.autoBanEnabled,
    'ban_threshold': ?request.banThreshold,
    'violation_window_hours': ?request.violationWindowHours,
    'retry_count': ?request.retryCount,
    'hit_retention_days': ?request.hitRetentionDays,
    'non_hit_retention_days': ?request.nonHitRetentionDays,
    'pre_hash_check_enabled': ?request.preHashCheckEnabled,
    if (request.blockedKeywords != null)
      'blocked_keywords': request.blockedKeywords!
          .map((value) => value.trim())
          .where((value) => value.isNotEmpty)
          .toSet()
          .toList(),
    if (request.keywordBlockingMode != null)
      'keyword_blocking_mode': _keywordMode(request.keywordBlockingMode!),
    if (request.modelFilter != null)
      'model_filter': <String, Object?>{
        'type': request.modelFilter!.type.name,
        'models': request.modelFilter!.models
            .map((value) => value.trim())
            .where((value) => value.isNotEmpty)
            .toSet()
            .toList(),
      },
    'cyber_policy_exclude_from_ban_count':
        ?request.cyberPolicyExcludeFromBanCount,
  };
}

List<String> _keys(List<Sub2ApiAdminCredentialSecret> keys) {
  final values = keys
      .map((key) => key.reveal().trim())
      .where((key) => key.isNotEmpty)
      .toSet()
      .toList(growable: false);
  if (values.isEmpty) throw _validation('admin.risk_control.api_keys_required');
  return values;
}

String _hash(Sub2ApiAdminRiskControlHash value) {
  final hash = value.value.trim().toLowerCase();
  if (!RegExp(r'^[0-9a-f]{64}$').hasMatch(hash)) {
    throw _validation('admin.risk_control.invalid_hash');
  }
  return hash;
}

String _url(Uri value) {
  if (!value.hasAuthority ||
      (value.scheme != 'http' && value.scheme != 'https')) {
    throw _validation('admin.risk_control.invalid_base_url');
  }
  return value.toString().replaceFirst(RegExp(r'/$'), '');
}

void _validateThresholds(Map<String, Sub2ApiDecimal> values) {
  if (values.entries.any(
    (entry) =>
        entry.key.trim().isEmpty ||
        entry.value.compareTo(Sub2ApiDecimal.zero()) < 0 ||
        entry.value.compareTo(Sub2ApiDecimal.parse('1')) > 0,
  )) {
    throw _validation('admin.risk_control.invalid_thresholds');
  }
}

void _validateModelFilter(Sub2ApiAdminRiskControlModelFilter filter) {
  if (filter.models.length > 1000 ||
      filter.models.any(
        (model) => model.trim().isEmpty || model.runes.length > 200,
      ) ||
      (filter.type != Sub2ApiAdminRiskControlModelFilterType.all &&
          filter.models.isEmpty)) {
    throw _validation('admin.risk_control.invalid_model_filter');
  }
}

void _page(int page, int pageSize) {
  if (page <= 0) throw _validation('admin.risk_control.invalid_page');
  if (pageSize <= 0 || pageSize > 1000) {
    throw _validation('admin.risk_control.invalid_page_size');
  }
}

String _mode(Sub2ApiAdminRiskControlMode value) =>
    value == Sub2ApiAdminRiskControlMode.preBlock ? 'pre_block' : value.name;

String _keywordMode(Sub2ApiAdminRiskControlKeywordMode value) =>
    switch (value) {
      Sub2ApiAdminRiskControlKeywordMode.keywordOnly => 'keyword_only',
      Sub2ApiAdminRiskControlKeywordMode.keywordAndApi => 'keyword_and_api',
      Sub2ApiAdminRiskControlKeywordMode.apiOnly => 'api_only',
    };

String _action(Sub2ApiAdminRiskControlAction value) => switch (value) {
  Sub2ApiAdminRiskControlAction.hashBlock => 'hash_block',
  Sub2ApiAdminRiskControlAction.keywordBlock => 'keyword_block',
  Sub2ApiAdminRiskControlAction.cyberPolicy => 'cyber_policy',
  _ => value.name,
};

num _decimal(Sub2ApiDecimal value) => num.parse(value.toJson());

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
