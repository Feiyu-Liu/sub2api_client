import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_system_models.dart';
import 'wire/admin_system_wire_mapper.dart';
import 'wire/admin_system_wire_service.dart';

abstract interface class Sub2ApiAdminSystemClient {
  Future<Sub2ApiAdminSystemVersion> getVersion({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSystemUpdateInfo> checkUpdates({
    bool force = false,
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<List<Sub2ApiAdminSystemRollbackVersion>> listRollbackVersions({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSystemUpdateResult> performUpdate(
    Sub2ApiAdminSystemOperationRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSystemRollbackResult> rollback(
    Sub2ApiAdminSystemRollbackRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSystemRestartResult> restart(
    Sub2ApiAdminSystemOperationRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminSystemClient createSub2ApiAdminSystemClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminSystemClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminSystemWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminSystemWireService _service;
  @override
  Future<Sub2ApiAdminSystemVersion> getVersion({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, k) => _service.version(c, o, _auth(k), _key(k)),
    decode: mapAdminSystemVersion,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminSystemUpdateInfo> checkUpdates({
    bool force = false,
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, k) => _service.check(force, c, o, _auth(k), _key(k)),
    decode: mapAdminSystemUpdateInfo,
    requestOptions: requestOptions,
  );
  @override
  Future<List<Sub2ApiAdminSystemRollbackVersion>> listRollbackVersions({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, k) => _service.rollbackVersions(c, o, _auth(k), _key(k)),
    decode: mapAdminSystemRollbackVersions,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminSystemUpdateResult> performUpdate(
    Sub2ApiAdminSystemOperationRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final id = _idempotency(r.idempotencyKey);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.update(c, o, _auth(k), _key(k), id),
      decode: mapAdminSystemUpdateResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminSystemRollbackResult> rollback(
    Sub2ApiAdminSystemRollbackRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final id = _idempotency(r.idempotencyKey);
    final v = r.version?.trim();
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.rollback(
        <String, Object?>{'version': ?v == null || v.isEmpty ? null : v},
        c,
        o,
        _auth(k),
        _key(k),
        id,
      ),
      decode: mapAdminSystemRollbackResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminSystemRestartResult> restart(
    Sub2ApiAdminSystemOperationRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final id = _idempotency(r.idempotencyKey);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.restart(c, o, _auth(k), _key(k), id),
      decode: mapAdminSystemRestartResult,
      requestOptions: requestOptions,
    );
  }

  String? _auth(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? v : null;
  String? _key(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? v : null;
}

String _idempotency(String v) {
  final t = v.trim();
  if (t.isEmpty) throw _validation('admin.system.idempotency_key_required');
  return t;
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
