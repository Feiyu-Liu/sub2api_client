import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_grok_oauth_models.dart';
import 'wire/admin_grok_oauth_wire_mapper.dart';
import 'wire/admin_grok_oauth_wire_service.dart';

abstract interface class Sub2ApiAdminGrokOAuthClient {
  Future<Sub2ApiAdminGrokOAuthCapabilities> getCapabilities({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminGrokAuthUrlResult> generateAuthUrl(
    Sub2ApiAdminGrokGenerateAuthUrlRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminGrokTokenInfo> exchangeCode(
    Sub2ApiAdminGrokExchangeCodeRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminGrokTokenInfo> refreshToken(
    Sub2ApiAdminGrokRefreshTokenRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminGrokTokenInfo> validateSsoToken(
    Sub2ApiAdminGrokSsoTokenRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminGrokTokenInfo> authorizePassword(
    Sub2ApiAdminGrokPasswordRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminGrokOAuthClient createSub2ApiAdminGrokOAuthClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminGrokOAuthClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminGrokOAuthWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminGrokOAuthWireService _service;

  @override
  Future<Sub2ApiAdminGrokOAuthCapabilities> getCapabilities({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.capabilities(c, o, _a(v), _k(v)),
    decode: mapAdminGrokCapabilities,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminGrokAuthUrlResult> generateAuthUrl(
    Sub2ApiAdminGrokGenerateAuthUrlRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _proxy(request.proxyId);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.authUrl(
        <String, Object?>{
          'proxy_id': ?request.proxyId,
          'redirect_uri': request.redirectUri?.toString() ?? '',
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      decode: mapAdminGrokAuthUrl,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGrokTokenInfo> exchangeCode(
    Sub2ApiAdminGrokExchangeCodeRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _proxy(request.proxyId);
    final session = _required(
      request.sessionId.reveal(),
      'admin.grok.session_required',
    );
    final code = _required(request.code.reveal(), 'admin.grok.code_required');
    final state = _required(
      request.state.reveal(),
      'admin.grok.state_required',
    );
    return _tokenMutation(
      send: (c, o, v) => _service.exchangeCode(
        <String, Object?>{
          'session_id': session,
          'code': code,
          'state': state,
          'redirect_uri': request.redirectUri?.toString() ?? '',
          'proxy_id': ?request.proxyId,
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGrokTokenInfo> refreshToken(
    Sub2ApiAdminGrokRefreshTokenRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _proxy(request.proxyId);
    final token = _required(
      request.refreshToken.reveal(),
      'admin.grok.refresh_token_required',
    );
    return _tokenMutation(
      send: (c, o, v) => _service.refreshToken(
        <String, Object?>{
          'refresh_token': token,
          'client_id': request.clientId.trim(),
          'proxy_id': ?request.proxyId,
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGrokTokenInfo> validateSsoToken(
    Sub2ApiAdminGrokSsoTokenRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _proxy(request.proxyId);
    final token = _required(
      request.ssoToken.reveal(),
      'admin.grok.sso_token_required',
    );
    return _tokenMutation(
      send: (c, o, v) => _service.ssoToken(
        <String, Object?>{'sso_token': token, 'proxy_id': ?request.proxyId},
        c,
        o,
        _a(v),
        _k(v),
      ),
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGrokTokenInfo> authorizePassword(
    Sub2ApiAdminGrokPasswordRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _proxy(request.proxyId);
    final email = request.email.trim();
    if (!_email.hasMatch(email)) {
      throw _validation('admin.grok.invalid_email');
    }
    final password = _required(
      request.password.reveal(),
      'admin.grok.password_required',
    );
    return _tokenMutation(
      send: (c, o, v) => _service.password(
        <String, Object?>{
          'email': email,
          'password': password,
          'proxy_id': ?request.proxyId,
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      requestOptions: requestOptions,
    );
  }

  Future<Sub2ApiAdminGrokTokenInfo> _tokenMutation({
    required Sub2ApiWireCall send,
    required Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedNonReplayableRequest(
    send: send,
    decode: mapAdminGrokTokenInfo,
    requestOptions: requestOptions,
  );

  String? _a(String? value) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? value : null;
  String? _k(String? value) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? value : null;
}

final _email = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
void _proxy(int? id) {
  if (id != null && id <= 0) throw _validation('admin.grok.invalid_proxy_id');
}

String _required(String value, String code) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) throw _validation(code);
  return trimmed;
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
