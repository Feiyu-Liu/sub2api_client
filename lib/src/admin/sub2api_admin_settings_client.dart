import 'package:dio/dio.dart';

import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_setting_models.dart';
import 'wire/admin_setting_wire_mapper.dart';
import 'wire/admin_setting_wire_service.dart';

abstract interface class Sub2ApiAdminSettingsClient {
  Future<Sub2ApiAdminApiKeyStatus> getAdminApiKeyStatus({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminApiKeyRegenerationResult> regenerateAdminApiKey({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSettingActionResult> deleteAdminApiKey({
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminSettingsClient createSub2ApiAdminSettingsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminSettingsClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminSettingWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminSettingWireService _service;

  @override
  Future<Sub2ApiAdminApiKeyStatus> getAdminApiKeyStatus({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.getAdminApiKey(c, o, _a(v), _k(v)),
    decode: mapAdminApiKeyStatus,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminApiKeyRegenerationResult> regenerateAdminApiKey({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedNonReplayableRequest(
    send: (c, o, v) => _service.regenerateAdminApiKey(c, o, _a(v), _k(v)),
    decode: mapAdminApiKeyRegeneration,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminSettingActionResult> deleteAdminApiKey({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedNonReplayableRequest(
    send: (c, o, v) => _service.deleteAdminApiKey(c, o, _a(v), _k(v)),
    decode: mapAdminSettingAction,
    requestOptions: requestOptions,
  );

  String? _a(String? value) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? value : null;
  String? _k(String? value) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? value : null;
}
