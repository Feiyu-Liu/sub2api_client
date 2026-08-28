import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_account_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_openai_models.dart';
import 'wire/admin_openai_wire_mapper.dart';
import 'wire/admin_openai_wire_service.dart';

abstract interface class Sub2ApiAdminOpenAIClient {
  Future<Sub2ApiAdminOpenAIAuthUrl> generateAuthUrl({
    Sub2ApiAdminOpenAIAuthUrlRequest request =
        const Sub2ApiAdminOpenAIAuthUrlRequest(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpenAITokenInfo> exchangeCode(
    Sub2ApiAdminOpenAIExchangeCodeRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpenAITokenInfo> refreshToken(
    Sub2ApiAdminOpenAIRefreshTokenRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccount> refreshAccountToken(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccount> createFromOAuth(
    Sub2ApiAdminCreateOpenAIFromOAuthRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccount> createFromCodexPat(
    Sub2ApiAdminCreateOpenAIFromCodexPatRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpenAIQuotaUsage> getQuota(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpenAIQuotaUsage> refreshQuota(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOpenAIQuotaResetResult> resetQuota(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminOpenAIClient createSub2ApiAdminOpenAIClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminOpenAIClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminOpenAIWireService(dio);

  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminOpenAIWireService _service;

  @override
  Future<Sub2ApiAdminOpenAIAuthUrl> generateAuthUrl({
    Sub2ApiAdminOpenAIAuthUrlRequest request =
        const Sub2ApiAdminOpenAIAuthUrlRequest(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _optionalId(request.proxyId, 'proxy_id');
    if (request.redirectUri != null) _redirectUri(request.redirectUri!);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.generateAuthUrl(
        <String, Object?>{
          'proxy_id': ?request.proxyId,
          if (request.redirectUri != null)
            'redirect_uri': request.redirectUri.toString(),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminOpenAIAuthUrl,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpenAITokenInfo> exchangeCode(
    Sub2ApiAdminOpenAIExchangeCodeRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final body = _exchangeBody(request);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.exchangeCode(
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminOpenAITokenInfo,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpenAITokenInfo> refreshToken(
    Sub2ApiAdminOpenAIRefreshTokenRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final token = request.refreshToken.reveal().trim();
    if (token.isEmpty) throw _validation('admin.openai.refresh_token_required');
    _optionalId(request.proxyId, 'proxy_id');
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.refreshToken(
        <String, Object?>{
          'refresh_token': token,
          if (request.clientId?.trim().isNotEmpty ?? false)
            'client_id': request.clientId!.trim(),
          'proxy_id': ?request.proxyId,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminOpenAITokenInfo,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccount> refreshAccountToken(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _accountId(accountId);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.refreshAccount(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminOpenAIAccount,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccount> createFromOAuth(
    Sub2ApiAdminCreateOpenAIFromOAuthRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (request.concurrency < 0 || request.priority < 0) {
      throw _validation('admin.openai.invalid_account_limits');
    }
    _ids(request.groupIds);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.createFromOAuth(
        <String, Object?>{
          ..._exchangeBody(request.exchange),
          if (request.name.trim().isNotEmpty) 'name': request.name.trim(),
          'concurrency': request.concurrency,
          'priority': request.priority,
          'group_ids': request.groupIds,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminOpenAIAccount,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccount> createFromCodexPat(
    Sub2ApiAdminCreateOpenAIFromCodexPatRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final token = request.accessToken.reveal().trim();
    if (token.isEmpty) throw _validation('admin.openai.codex_pat_required');
    _ids(request.groupIds);
    _optionalId(request.proxyId, 'proxy_id');
    if ((request.concurrency != null && request.concurrency! < 0) ||
        (request.priority != null && request.priority! < 0) ||
        (request.loadFactor != null &&
            (request.loadFactor! < 0 || request.loadFactor! > 10000))) {
      throw _validation('admin.openai.invalid_account_limits');
    }
    if (request.rateMultiplier != null &&
        request.rateMultiplier!.compareTo(Sub2ApiDecimal.zero()) < 0) {
      throw _validation('admin.openai.invalid_rate_multiplier');
    }
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.createFromCodexPat(
        <String, Object?>{
          'access_token': token,
          if (request.name.trim().isNotEmpty) 'name': request.name.trim(),
          if (request.notes != null) 'notes': request.notes,
          'group_ids': request.groupIds,
          'proxy_id': ?request.proxyId,
          'concurrency': ?request.concurrency,
          'priority': ?request.priority,
          if (request.rateMultiplier != null)
            'rate_multiplier': _decimal(request.rateMultiplier!),
          'load_factor': ?request.loadFactor,
          if (request.expiresAt != null)
            'expires_at':
                request.expiresAt!.toUtc().millisecondsSinceEpoch ~/ 1000,
          'auto_pause_on_expired': ?request.autoPauseOnExpired,
          if (request.credentialExtras != null)
            'credential_extras': request.credentialExtras!.toWire(),
          if (request.extra != null) 'extra': request.extra!.toWire(),
          'skip_default_group_bind': ?request.skipDefaultGroupBind,
          'confirm_mixed_channel_risk': ?request.confirmMixedChannelRisk,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminOpenAIAccount,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpenAIQuotaUsage> getQuota(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _accountId(accountId);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.quota(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminOpenAIQuota,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpenAIQuotaUsage> refreshQuota(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _accountId(accountId);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.refreshQuota(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminOpenAIQuota,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOpenAIQuotaResetResult> resetQuota(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _accountId(accountId);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.resetQuota(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminOpenAIQuotaReset,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? credential : null;
  String? _apiKey(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

Map<String, Object?> _exchangeBody(
  Sub2ApiAdminOpenAIExchangeCodeRequest request,
) {
  final sessionId = request.sessionId.reveal().trim();
  final code = request.code.reveal().trim();
  final state = request.state.reveal().trim();
  if (sessionId.isEmpty || code.isEmpty || state.isEmpty) {
    throw _validation('admin.openai.oauth_exchange_fields_required');
  }
  _optionalId(request.proxyId, 'proxy_id');
  if (request.redirectUri != null) _redirectUri(request.redirectUri!);
  return <String, Object?>{
    'session_id': sessionId,
    'code': code,
    'state': state,
    if (request.redirectUri != null)
      'redirect_uri': request.redirectUri.toString(),
    'proxy_id': ?request.proxyId,
  };
}

void _redirectUri(Uri value) {
  if (!value.hasAuthority ||
      (value.scheme != 'http' && value.scheme != 'https')) {
    throw _validation('admin.openai.invalid_redirect_uri');
  }
}

void _accountId(int value) {
  if (value <= 0) throw _validation('admin.openai.invalid_account_id');
}

void _optionalId(int? value, String field) {
  if (value != null && value <= 0) {
    throw _validation('admin.openai.invalid_$field');
  }
}

void _ids(List<int> values) {
  if (values.any((value) => value <= 0)) {
    throw _validation('admin.openai.invalid_group_id');
  }
}

num _decimal(Sub2ApiDecimal value) => num.parse(value.toJson());

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
