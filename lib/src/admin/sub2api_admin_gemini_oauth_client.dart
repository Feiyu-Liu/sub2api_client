import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_gemini_oauth_models.dart';
import 'wire/admin_gemini_oauth_wire_mapper.dart';
import 'wire/admin_gemini_oauth_wire_service.dart';

abstract interface class Sub2ApiAdminGeminiOAuthClient {
  Future<Sub2ApiAdminGeminiOAuthCapabilities> getCapabilities({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGeminiOAuthAuthorization> generateAuthorization({
    int? proxyId,
    String? projectId,
    Sub2ApiAdminGeminiOAuthType oauthType =
        Sub2ApiAdminGeminiOAuthType.codeAssist,
    String? tierId,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminGeminiTokenInfo> exchangeCode(
    Sub2ApiAdminGeminiExchangeCodeRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminGeminiOAuthClient createSub2ApiAdminGeminiOAuthClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Sub2ApiAdminGeminiOAuthClient(
  dio: dio,
  requestExecutor: requestExecutor,
  credentialMode: credentialMode,
);

final class _Sub2ApiAdminGeminiOAuthClient
    implements Sub2ApiAdminGeminiOAuthClient {
  _Sub2ApiAdminGeminiOAuthClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiAdminCredentialMode credentialMode,
  }) : _requestExecutor = requestExecutor,
       _credentialMode = credentialMode,
       _service = AdminGeminiOAuthWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final Sub2ApiAdminCredentialMode _credentialMode;
  final AdminGeminiOAuthWireService _service;

  @override
  Future<Sub2ApiAdminGeminiOAuthCapabilities> getCapabilities({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, credential) => _service.getCapabilities(
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminGeminiOAuthCapabilities,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminGeminiOAuthAuthorization> generateAuthorization({
    int? proxyId,
    String? projectId,
    Sub2ApiAdminGeminiOAuthType oauthType =
        Sub2ApiAdminGeminiOAuthType.codeAssist,
    String? tierId,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateProxyId(proxyId);
    final normalizedTier = _tierId(tierId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.generateAuthorization(
            <String, Object?>{
              'proxy_id': ?proxyId,
              'project_id': ?_optional(projectId),
              'oauth_type': _oauthType(oauthType),
              'tier_id': ?normalizedTier,
            },
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminGeminiOAuthAuthorization,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGeminiTokenInfo> exchangeCode(
    Sub2ApiAdminGeminiExchangeCodeRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final sessionId = _required(
      request.sessionId.reveal(),
      'admin.gemini.oauth_session_id_required',
    );
    final state = _required(
      request.state.reveal(),
      'admin.gemini.oauth_state_required',
    );
    final code = _required(
      request.code.reveal(),
      'admin.gemini.oauth_code_required',
    );
    _validateProxyId(request.proxyId);
    final tierId = _tierId(request.tierId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.exchangeCode(
        <String, Object?>{
          'session_id': sessionId,
          'state': state,
          'code': code,
          'proxy_id': ?request.proxyId,
          'oauth_type': _oauthType(request.oauthType),
          'tier_id': ?tierId,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminGeminiTokenInfo,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

String _oauthType(Sub2ApiAdminGeminiOAuthType value) => switch (value) {
  Sub2ApiAdminGeminiOAuthType.codeAssist => 'code_assist',
  Sub2ApiAdminGeminiOAuthType.googleOne => 'google_one',
  Sub2ApiAdminGeminiOAuthType.aiStudio => 'ai_studio',
};

String _required(String value, String code) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) throw _validation(code);
  return trimmed;
}

String? _optional(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? null : trimmed;
}

String? _tierId(String? value) {
  final tier = _optional(value);
  if (tier == null) return null;
  if (tier.length > 64 || !RegExp(r'^[a-zA-Z0-9_/-]+$').hasMatch(tier)) {
    throw _validation('admin.gemini.invalid_tier_id');
  }
  return tier;
}

void _validateProxyId(int? proxyId) {
  if (proxyId != null && proxyId <= 0) {
    throw _validation('admin.gemini.invalid_proxy_id');
  }
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
