import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_account_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_grok_oauth_models.dart';
import 'wire/admin_account_wire_mapper.dart';
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
  Future<Sub2ApiAdminAccount> createAccountFromOAuth(
    Sub2ApiAdminGrokCreateAccountFromOAuthRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminGrokSsoImportResult> importSsoTokens(
    Sub2ApiAdminGrokSsoImportRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminGrokReconcileResult> reconcile(
    Sub2ApiAdminGrokReconcileRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminAccount> refreshAccount(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminGrokQuotaResult> getQuota(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminGrokQuotaResetResult> resetQuota(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminGrokRuntimeSanity> getRuntimeSanity({
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

  @override
  Future<Sub2ApiAdminAccount> createAccountFromOAuth(
    Sub2ApiAdminGrokCreateAccountFromOAuthRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _proxy(request.proxyId);
    _accountTuning(request.concurrency, request.priority, request.groupIds);
    final session = _required(
      request.sessionId.reveal(),
      'admin.grok.session_required',
    );
    final code = _required(request.code.reveal(), 'admin.grok.code_required');
    final state = _required(
      request.state.reveal(),
      'admin.grok.state_required',
    );
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.createFromOAuth(
        <String, Object?>{
          'session_id': session,
          'code': code,
          'state': state,
          'redirect_uri': request.redirectUri?.toString() ?? '',
          'proxy_id': ?request.proxyId,
          'name': request.name.trim(),
          'concurrency': request.concurrency,
          'priority': request.priority,
          'group_ids': request.groupIds,
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      decode: mapAdminAccount,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGrokSsoImportResult> importSsoTokens(
    Sub2ApiAdminGrokSsoImportRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _proxy(request.proxyId);
    _accountTuning(request.concurrency, request.priority, request.groupIds);
    if (request.loadFactor != null && request.loadFactor! <= 0) {
      throw _validation('admin.grok.invalid_load_factor');
    }
    if (request.rateMultiplier != null &&
        request.rateMultiplier!.compareTo(Sub2ApiDecimal.zero()) <= 0) {
      throw _validation('admin.grok.invalid_rate_multiplier');
    }
    final tokens = request.ssoTokens
        .map((token) => token.reveal().trim())
        .where((token) => token.isNotEmpty)
        .toSet()
        .toList(growable: false);
    if (tokens.isEmpty) throw _validation('admin.grok.sso_tokens_required');
    final credentials = _importCredentials(request.credentials);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.ssoToOAuth(
        <String, Object?>{
          'sso_tokens': tokens,
          'name': request.name.trim(),
          'notes': ?request.notes?.trim(),
          'proxy_id': ?request.proxyId,
          'group_ids': request.groupIds,
          'credentials': credentials,
          'extra': request.extra.toWire(),
          'concurrency': request.concurrency,
          'load_factor': ?request.loadFactor,
          'priority': request.priority,
          'rate_multiplier': request.rateMultiplier == null
              ? null
              : _decimal(request.rateMultiplier!),
          'expires_at': request.expiresAt == null
              ? null
              : request.expiresAt!.toUtc().millisecondsSinceEpoch ~/ 1000,
          'auto_pause_on_expired': ?request.autoPauseOnExpired,
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      decode: mapAdminGrokSsoImport,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGrokReconcileResult> reconcile(
    Sub2ApiAdminGrokReconcileRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (request.afterId < 0) {
      throw _validation('admin.grok.invalid_reconcile_cursor');
    }
    if (request.limit < 1 || request.limit > 500) {
      throw _validation('admin.grok.invalid_reconcile_limit');
    }
    final seconds = request.refreshWindow.inSeconds;
    if (seconds < 0 || seconds > 86400) {
      throw _validation('admin.grok.invalid_reconcile_window');
    }
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.reconcile(
        <String, Object?>{
          'dry_run': !request.apply,
          'apply': request.apply,
          'after_id': request.afterId,
          'limit': request.limit,
          'refresh_window_seconds': seconds,
        },
        c,
        o,
        _a(v),
        _k(v),
      ),
      decode: mapAdminGrokReconcile,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccount> refreshAccount(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _accountId(accountId);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.refreshAccount(accountId, c, o, _a(v), _k(v)),
      decode: mapAdminAccount,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGrokQuotaResult> getQuota(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _accountId(accountId);
    return _executor.protectedRequest(
      send: (c, o, v) => _service.quota(accountId, c, o, _a(v), _k(v)),
      decode: mapAdminGrokQuota,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGrokQuotaResetResult> resetQuota(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _accountId(accountId);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.resetQuota(accountId, c, o, _a(v), _k(v)),
      decode: mapAdminGrokQuotaReset,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminGrokRuntimeSanity> getRuntimeSanity({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.runtimeSanity(c, o, _a(v), _k(v)),
    decode: mapAdminGrokRuntimeSanity,
    requestOptions: requestOptions,
  );

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

void _accountId(int value) {
  if (value <= 0) throw _validation('admin.grok.invalid_account_id');
}

void _accountTuning(int concurrency, int priority, List<int> groupIds) {
  if (concurrency < 0) throw _validation('admin.grok.invalid_concurrency');
  if (priority < 0) throw _validation('admin.grok.invalid_priority');
  if (groupIds.any((id) => id <= 0)) {
    throw _validation('admin.grok.invalid_group_ids');
  }
}

Map<String, Object?> _importCredentials(
  Sub2ApiAdminGrokImportCredentials input,
) {
  final output = <String, Object?>{};
  final baseUrl = input.baseUrl;
  if (baseUrl != null) {
    if (!baseUrl.hasScheme || baseUrl.host.isEmpty) {
      throw _validation('admin.grok.invalid_base_url');
    }
    output['base_url'] = baseUrl.toString();
  }
  if (input.modelMapping.values.isNotEmpty) {
    output['model_mapping'] = input.modelMapping.toWire();
  }
  if (input.headerOverride.values.isNotEmpty) {
    output['header_override'] = input.headerOverride.toWire();
  }
  if (input.headerOverrides.values.isNotEmpty) {
    output['header_overrides'] = input.headerOverrides.toWire();
  }
  if (input.headerOverrideEnabled != null) {
    output['header_override_enabled'] = input.headerOverrideEnabled;
  }
  if (input.customHeaders.values.isNotEmpty) {
    output['custom_headers'] = input.customHeaders.toWire();
  }
  return output;
}

double _decimal(Sub2ApiDecimal value) {
  final number = double.tryParse(value.toJson());
  if (number == null ||
      !number.isFinite ||
      Sub2ApiDecimal.parse(number.toString()) != value) {
    throw _validation('admin.grok.value_not_representable');
  }
  return number;
}
