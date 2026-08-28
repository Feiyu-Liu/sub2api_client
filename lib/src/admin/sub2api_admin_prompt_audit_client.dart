import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_prompt_audit_models.dart';
import 'wire/admin_prompt_audit_wire_mapper.dart';
import 'wire/admin_prompt_audit_wire_service.dart';

abstract interface class Sub2ApiAdminPromptAuditClient {
  Future<Sub2ApiAdminPromptAuditConfig> getConfig({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPromptAuditConfig> updateConfig(
    Sub2ApiAdminUpdatePromptAuditConfigRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPromptAuditProbeResult> probe(
    Sub2ApiAdminPromptAuditProbeRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPromptAuditRuntime> getRuntime({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPromptAuditEventPage> listEvents({
    Sub2ApiAdminPromptAuditEventQuery query =
        const Sub2ApiAdminPromptAuditEventQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPromptAuditEvent> getEvent(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPromptAuditDeleteResult> deleteEvent(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPromptAuditDeleteResult> batchDelete(
    List<int> ids, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPromptAuditDeletePreview> previewDelete(
    Sub2ApiAdminPromptAuditEventFilter filter, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPromptAuditDeleteResult> deleteByFilter(
    Sub2ApiAdminPromptAuditDeleteByFilterRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminPromptAuditClient createSub2ApiAdminPromptAuditClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminPromptAuditClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminPromptAuditWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminPromptAuditWireService _service;

  @override
  Future<Sub2ApiAdminPromptAuditConfig> getConfig({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, k) => _service.config(c, o, _auth(k), _key(k)),
    decode: mapAdminPromptAuditConfig,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminPromptAuditConfig> updateConfig(
    Sub2ApiAdminUpdatePromptAuditConfigRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final b = _configBody(r);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.updateConfig(b, c, o, _auth(k), _key(k)),
      decode: mapAdminPromptAuditConfig,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPromptAuditProbeResult> probe(
    Sub2ApiAdminPromptAuditProbeRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final b = <String, Object?>{'endpoint': _endpointBody(r.endpoint)};
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.probe(b, c, o, _auth(k), _key(k)),
      decode: mapAdminPromptAuditProbe,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPromptAuditRuntime> getRuntime({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, k) => _service.runtime(c, o, _auth(k), _key(k)),
    decode: mapAdminPromptAuditRuntime,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminPromptAuditEventPage> listEvents({
    Sub2ApiAdminPromptAuditEventQuery query =
        const Sub2ApiAdminPromptAuditEventQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (query.page <= 0 || query.pageSize <= 0 || query.pageSize > 100) {
      throw _validation('admin.prompt_audit.invalid_pagination');
    }
    _validateFilter(query.filter);
    return _executor.protectedRequest(
      send: (c, o, k) => _service.events(
        <String, dynamic>{
          'page': query.page,
          'page_size': query.pageSize,
          ..._filterBody(query.filter),
        },
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminPromptAuditEventPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPromptAuditEvent> getEvent(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedRequest(
      send: (c, o, k) => _service.event(id, c, o, _auth(k), _key(k)),
      decode: mapAdminPromptAuditEvent,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPromptAuditDeleteResult> deleteEvent(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.deleteEvent(id, c, o, _auth(k), _key(k)),
      decode: mapAdminPromptAuditDelete,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPromptAuditDeleteResult> batchDelete(
    List<int> ids, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (ids.isEmpty || ids.length > 500 || ids.any((id) => id <= 0)) {
      throw _validation('admin.prompt_audit.invalid_delete_batch');
    }
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.batchDelete(
        <String, Object?>{'ids': ids.toSet().toList()},
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminPromptAuditDelete,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPromptAuditDeletePreview> previewDelete(
    Sub2ApiAdminPromptAuditEventFilter f, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateFilter(f);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) =>
          _service.deletePreview(_filterBody(f), c, o, _auth(k), _key(k)),
      decode: mapAdminPromptAuditDeletePreview,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPromptAuditDeleteResult> deleteByFilter(
    Sub2ApiAdminPromptAuditDeleteByFilterRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateFilter(r.filter);
    if (!r.confirm ||
        r.snapshotMaxId < 0 ||
        !RegExp(r'^[0-9a-f]{64}$').hasMatch(r.filterHash.value) ||
        r.confirmationToken.reveal().trim().isEmpty) {
      throw _validation('admin.prompt_audit.invalid_delete_confirmation');
    }
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.deleteByFilter(
        <String, Object?>{
          'filter': _filterBody(r.filter),
          'snapshot_max_id': r.snapshotMaxId,
          'filter_hash': r.filterHash.value,
          'confirmation_token': r.confirmationToken.reveal().trim(),
          'confirm': true,
        },
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminPromptAuditDelete,
      requestOptions: requestOptions,
    );
  }

  String? _auth(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? v : null;
  String? _key(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? v : null;
}

Map<String, Object?> _configBody(Sub2ApiAdminUpdatePromptAuditConfigRequest r) {
  if (r.expectedConfigVersion <= 0 ||
      r.workerCount < 1 ||
      r.workerCount > 32 ||
      r.queueCapacity < 1 ||
      r.queueCapacity > 100000 ||
      r.scanners.isEmpty ||
      r.groupIds.any((id) => id <= 0) ||
      (!r.allGroups && r.groupIds.isEmpty) ||
      (r.blockingEnabled && !r.enabled)) {
    throw _validation('admin.prompt_audit.invalid_config');
  }
  if (r.enabled && !r.endpoints.any((e) => e.enabled)) {
    throw _validation('admin.prompt_audit.endpoint_required');
  }
  final ids = <String>{};
  for (final e in r.endpoints) {
    if (!ids.add(e.id.trim())) {
      throw _validation('admin.prompt_audit.duplicate_endpoint');
    }
    _validateEndpoint(e);
  }
  return <String, Object?>{
    'expected_config_version': r.expectedConfigVersion,
    'enabled': r.enabled,
    'blocking_enabled': r.blockingEnabled,
    'blocking_latest_turn_only': r.blockingLatestTurnOnly,
    'store_pass_events': r.storePassEvents,
    'strategy': 'priority',
    'worker_count': r.workerCount,
    'queue_capacity': r.queueCapacity,
    'scanners': r.scanners
        .map((v) => v.trim())
        .where((v) => v.isNotEmpty)
        .toSet()
        .toList(),
    'all_groups': r.allGroups,
    'group_ids': r.groupIds.toSet().toList()..sort(),
    'endpoints': r.endpoints.map(_endpointBody).toList(),
  };
}

Map<String, Object?> _endpointBody(Sub2ApiAdminPromptAuditEndpointUpdate e) {
  _validateEndpoint(e);
  if (e.token != null && e.clearToken) {
    throw _validation('admin.prompt_audit.token_clear_conflict');
  }
  return <String, Object?>{
    'id': e.id.trim(),
    'name': e.name.trim(),
    'protocol': e.protocol.trim(),
    'base_url': e.baseUrl.toString(),
    'model': e.model.trim(),
    'token': ?e.token?.reveal().trim(),
    'clear_token': e.clearToken,
    'timeout_ms': e.timeout.inMilliseconds,
    'input_limit': e.inputLimit,
    'enabled': e.enabled,
  };
}

void _validateEndpoint(Sub2ApiAdminPromptAuditEndpointUpdate e) {
  if (e.id.trim().isEmpty ||
      e.name.trim().isEmpty ||
      e.protocol != 'openai_compatible' ||
      !e.baseUrl.hasAuthority ||
      (e.baseUrl.scheme != 'http' && e.baseUrl.scheme != 'https') ||
      e.timeout.inMilliseconds < 100 ||
      e.timeout.inMilliseconds > 30000 ||
      e.inputLimit < 128 ||
      e.inputLimit > 100000) {
    throw _validation('admin.prompt_audit.invalid_endpoint');
  }
}

Map<String, dynamic> _filterBody(Sub2ApiAdminPromptAuditEventFilter f) =>
    <String, dynamic>{
      'decision': ?f.decision?.name,
      'risk_level': ?f.riskLevel?.name,
      'endpoint': ?_trim(f.endpoint),
      'group_id': ?f.groupId,
      'user_id': ?f.userId,
      'api_key_id': ?f.apiKeyId,
      'request_id': ?_trim(f.requestId),
      'prompt_hash': ?f.promptHash?.value,
      'keyword': ?_trim(f.keyword),
      'start_at': ?f.startAt?.toUtc().toIso8601String(),
      'end_at': ?f.endAt?.toUtc().toIso8601String(),
    };
void _validateFilter(Sub2ApiAdminPromptAuditEventFilter f) {
  if ([f.groupId, f.userId, f.apiKeyId].any((id) => id != null && id <= 0) ||
      (f.startAt != null && f.endAt != null && f.startAt!.isAfter(f.endAt!)) ||
      (f.promptHash != null &&
          !RegExp(r'^[0-9a-f]{64}$').hasMatch(f.promptHash!.value))) {
    throw _validation('admin.prompt_audit.invalid_filter');
  }
}

String? _trim(String? v) {
  final t = v?.trim();
  return t == null || t.isEmpty ? null : t;
}

void _id(int v) {
  if (v <= 0) throw _validation('admin.prompt_audit.invalid_event_id');
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
