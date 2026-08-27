import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sensitive_value.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_antigravity_oauth_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'wire/admin_antigravity_oauth_wire_mapper.dart';
import 'wire/admin_antigravity_oauth_wire_service.dart';

abstract interface class Sub2ApiAdminAntigravityOAuthClient {
  Future<Sub2ApiAdminAntigravityOAuthAuthorization> generateAuthorization({
    int? proxyId,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAntigravityTokenInfo> exchangeCode(
    Sub2ApiAdminAntigravityExchangeCodeRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAntigravityTokenInfo> validateRefreshToken(
    Sub2ApiRefreshToken refreshToken, {
    int? proxyId,
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminAntigravityOAuthClient createSub2ApiAdminAntigravityOAuthClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Sub2ApiAdminAntigravityOAuthClient(
  dio: dio,
  requestExecutor: requestExecutor,
  credentialMode: credentialMode,
);

final class _Sub2ApiAdminAntigravityOAuthClient
    implements Sub2ApiAdminAntigravityOAuthClient {
  _Sub2ApiAdminAntigravityOAuthClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiAdminCredentialMode credentialMode,
  }) : _requestExecutor = requestExecutor,
       _credentialMode = credentialMode,
       _service = AdminAntigravityOAuthWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final Sub2ApiAdminCredentialMode _credentialMode;
  final AdminAntigravityOAuthWireService _service;

  @override
  Future<Sub2ApiAdminAntigravityOAuthAuthorization> generateAuthorization({
    int? proxyId,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateProxyId(proxyId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.generateAuthorization(
            <String, Object?>{'proxy_id': ?proxyId},
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminAntigravityOAuthAuthorization,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAntigravityTokenInfo> exchangeCode(
    Sub2ApiAdminAntigravityExchangeCodeRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final sessionId = _required(
      request.sessionId.reveal(),
      'admin.antigravity.oauth_session_id_required',
    );
    final state = _required(
      request.state.reveal(),
      'admin.antigravity.oauth_state_required',
    );
    final code = _required(
      request.code.reveal(),
      'admin.antigravity.oauth_code_required',
    );
    _validateProxyId(request.proxyId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.exchangeCode(
        <String, Object?>{
          'session_id': sessionId,
          'state': state,
          'code': code,
          'proxy_id': ?request.proxyId,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAntigravityTokenInfo,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAntigravityTokenInfo> validateRefreshToken(
    Sub2ApiRefreshToken refreshToken, {
    int? proxyId,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final token = _required(
      refreshToken.reveal(),
      'admin.antigravity.refresh_token_required',
    );
    _validateProxyId(proxyId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.validateRefreshToken(
        <String, Object?>{'refresh_token': token, 'proxy_id': ?proxyId},
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAntigravityTokenInfo,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

String _required(String value, String code) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) throw _validation(code);
  return trimmed;
}

void _validateProxyId(int? proxyId) {
  if (proxyId != null && proxyId <= 0) {
    throw _validation('admin.antigravity.invalid_proxy_id');
  }
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
