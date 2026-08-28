import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sensitive_value.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_audit_log_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'wire/admin_audit_log_wire_mapper.dart';
import 'wire/admin_audit_log_wire_service.dart';

abstract interface class Sub2ApiAdminAuditLogsClient {
  Future<Sub2ApiAdminAuditLogPage> list({
    Sub2ApiAdminAuditLogQuery query = const Sub2ApiAdminAuditLogQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAuditLog> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Clears all audit logs after a fresh server-side TOTP verification.
  ///
  /// Admin API Key callers are rejected locally because the fixed contract
  /// only permits an interactive administrator JWT session.
  Future<Sub2ApiAdminClearAuditLogsResult> clear(
    Sub2ApiVerificationCode totpCode, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminAuditLogsClient createSub2ApiAdminAuditLogsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Sub2ApiAdminAuditLogsClient(
  dio: dio,
  requestExecutor: requestExecutor,
  credentialMode: credentialMode,
);

final class _Sub2ApiAdminAuditLogsClient
    implements Sub2ApiAdminAuditLogsClient {
  _Sub2ApiAdminAuditLogsClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiAdminCredentialMode credentialMode,
  }) : _requestExecutor = requestExecutor,
       _credentialMode = credentialMode,
       _service = AdminAuditLogWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final Sub2ApiAdminCredentialMode _credentialMode;
  final AdminAuditLogWireService _service;

  @override
  Future<Sub2ApiAdminAuditLogPage> list({
    Sub2ApiAdminAuditLogQuery query = const Sub2ApiAdminAuditLogQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateQuery(query);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.list(
        _query(query),
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAuditLogPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAuditLog> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (id <= 0) throw _validation('admin.audit_logs.invalid_id');
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.get(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAuditLog,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminClearAuditLogsResult> clear(
    Sub2ApiVerificationCode totpCode, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (_credentialMode == Sub2ApiAdminCredentialMode.apiKey) {
      throw _stepUpAdminApiKeyForbidden;
    }
    final value = totpCode.reveal().trim();
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      throw _validation('admin.audit_logs.invalid_totp_code');
    }
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.clear(
        <String, Object?>{'totp_code': value},
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminClearAuditLogsResult,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

Map<String, Object?> _query(Sub2ApiAdminAuditLogQuery query) =>
    <String, Object?>{
      'page': ?query.page,
      'page_size': ?query.pageSize,
      'start_time': ?query.startTime?.toUtc().toIso8601String(),
      'end_time': ?query.endTime?.toUtc().toIso8601String(),
      'actor_user_id': ?query.actorUserId,
      'actor_email': ?_trimmed(query.actorEmail),
      'auth_method': ?_trimmed(query.authMethod),
      'action': ?_trimmed(query.action),
      'method': ?_trimmed(query.method)?.toUpperCase(),
      'client_ip': ?_trimmed(query.clientIp),
      'success': ?query.success,
      'q': ?_trimmed(query.search),
    };

String? _trimmed(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? null : trimmed;
}

void _validateQuery(Sub2ApiAdminAuditLogQuery query) {
  if (query.page != null && query.page! <= 0) {
    throw _validation('admin.audit_logs.invalid_page');
  }
  if (query.pageSize != null &&
      (query.pageSize! <= 0 || query.pageSize! > 200)) {
    throw _validation('admin.audit_logs.invalid_page_size');
  }
  if (query.actorUserId != null && query.actorUserId! <= 0) {
    throw _validation('admin.audit_logs.invalid_actor_user_id');
  }
  if (query.startTime != null &&
      query.endTime != null &&
      query.startTime!.isAfter(query.endTime!)) {
    throw _validation('admin.audit_logs.invalid_time_range');
  }
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);

const _stepUpAdminApiKeyForbidden = Sub2ApiException(
  kind: Sub2ApiFailureKind.forbidden,
  code: 'auth.step_up_admin_api_key_forbidden',
  retryable: false,
);
