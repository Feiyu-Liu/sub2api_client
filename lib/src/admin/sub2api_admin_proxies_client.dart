import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_proxy_models.dart';
import 'wire/admin_proxy_wire_mapper.dart';
import 'wire/admin_proxy_wire_service.dart';

abstract interface class Sub2ApiAdminProxiesClient {
  Future<Sub2ApiAdminProxyPage> list({
    Sub2ApiAdminProxyListQuery query = const Sub2ApiAdminProxyListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminProxy>> getAll({
    bool includeAccountCount = false,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminProxy> getById(
    int proxyId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminProxyAccountSummary>> getAccounts(
    int proxyId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminProxyStats> getStats(
    int proxyId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminProxy> create(
    Sub2ApiAdminCreateProxyRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminProxy> update(
    int proxyId,
    Sub2ApiAdminUpdateProxyRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminProxyActionResult> delete(
    int proxyId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminProxyTestResult> test(
    int proxyId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminProxyQualityResult> checkQuality(
    int proxyId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminBatchCreateProxiesResult> batchCreate(
    List<Sub2ApiAdminBatchCreateProxyInput> proxies, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminProxyBatchDeleteResult> batchDelete(
    List<int> proxyIds, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminProxiesClient createSub2ApiAdminProxiesClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Sub2ApiAdminProxiesClient(
  dio: dio,
  requestExecutor: requestExecutor,
  credentialMode: credentialMode,
);

final class _Sub2ApiAdminProxiesClient implements Sub2ApiAdminProxiesClient {
  _Sub2ApiAdminProxiesClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiAdminCredentialMode credentialMode,
  }) : _requestExecutor = requestExecutor,
       _credentialMode = credentialMode,
       _service = AdminProxyWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final Sub2ApiAdminCredentialMode _credentialMode;
  final AdminProxyWireService _service;

  @override
  Future<Sub2ApiAdminProxyPage> list({
    Sub2ApiAdminProxyListQuery query = const Sub2ApiAdminProxyListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validatePage(query.page, query.pageSize);
    final search = query.search?.trim();
    if (search != null && search.runes.length > 100) {
      throw _validation('admin.proxies.search_too_long');
    }
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.list(
        <String, dynamic>{
          'page': ?query.page,
          'page_size': ?query.pageSize,
          if (query.protocol != null) 'protocol': query.protocol!.name,
          if (query.status != null) 'status': query.status!.name,
          'search': ?search,
          'sort_by': _wireSort(query.sortBy),
          'sort_order': query.sortDescending ? 'desc' : 'asc',
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminProxyPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminProxy>> getAll({
    bool includeAccountCount = false,
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, credential) => _service.getAll(
      includeAccountCount ? true : null,
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminProxies,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminProxy> getById(
    int proxyId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateProxyId(proxyId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.getById(
        proxyId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminProxy,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminProxyAccountSummary>> getAccounts(
    int proxyId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateProxyId(proxyId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.getAccounts(
        proxyId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminProxyAccounts,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminProxyStats> getStats(
    int proxyId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateProxyId(proxyId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.getStats(
        proxyId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminProxyStats,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminProxy> create(
    Sub2ApiAdminCreateProxyRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final key = _requiredIdempotencyKey(request.idempotencyKey);
    final body = _createProxyBody(request);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.create(
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
        key,
      ),
      decode: mapAdminProxy,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminProxy> update(
    int proxyId,
    Sub2ApiAdminUpdateProxyRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateProxyId(proxyId);
    final body = _updateProxyBody(proxyId, request);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.update(
        proxyId,
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminProxy,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminProxyActionResult> delete(
    int proxyId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateProxyId(proxyId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.delete(
        proxyId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminProxyActionResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminProxyTestResult> test(
    int proxyId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateProxyId(proxyId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.test(
        proxyId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminProxyTestResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminProxyQualityResult> checkQuality(
    int proxyId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateProxyId(proxyId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.qualityCheck(
        proxyId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminProxyQualityResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminBatchCreateProxiesResult> batchCreate(
    List<Sub2ApiAdminBatchCreateProxyInput> proxies, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (proxies.isEmpty) {
      throw _validation('admin.proxies.batch_required');
    }
    final body = <String, Object?>{
      'proxies': proxies.map(_batchCreateProxyBody).toList(growable: false),
    };
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.batchCreate(
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminBatchCreateProxiesResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminProxyBatchDeleteResult> batchDelete(
    List<int> proxyIds, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final ids = _requiredProxyIds(proxyIds);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.batchDelete(
        <String, Object?>{'ids': ids},
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminProxyBatchDeleteResult,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

void _validateProxyId(int proxyId) {
  if (proxyId <= 0) throw _validation('admin.proxies.invalid_proxy_id');
}

void _validatePage(int? page, int? pageSize) {
  if (page != null && page <= 0) {
    throw _validation('admin.proxies.invalid_page');
  }
  if (pageSize != null && (pageSize <= 0 || pageSize > 100)) {
    throw _validation('admin.proxies.invalid_page_size');
  }
}

String _wireSort(Sub2ApiAdminProxySort sort) => switch (sort) {
  Sub2ApiAdminProxySort.createdAt => 'created_at',
  Sub2ApiAdminProxySort.accountCount => 'account_count',
  _ => sort.name,
};

Map<String, Object?> _createProxyBody(Sub2ApiAdminCreateProxyRequest request) {
  final name = request.name.trim();
  final host = request.host.trim();
  if (name.isEmpty) throw _validation('admin.proxies.name_required');
  if (host.isEmpty) throw _validation('admin.proxies.host_required');
  _validatePort(request.port);
  _validateFallback(
    fallbackMode: request.fallbackMode,
    backupProxyId: request.backupProxyId,
  );
  _validateExpiryWarnDays(request.expiryWarnDays);
  return <String, Object?>{
    'name': name,
    'protocol': request.protocol.name,
    'host': host,
    'port': request.port,
    'username': request.username?.trim() ?? '',
    'password': request.password?.reveal().trim() ?? '',
    'expires_at': ?_unixSeconds(request.expiresAt),
    'fallback_mode': request.fallbackMode.name,
    'backup_proxy_id': ?request.backupProxyId,
    'expiry_warn_days': request.expiryWarnDays,
  };
}

Map<String, Object?> _updateProxyBody(
  int proxyId,
  Sub2ApiAdminUpdateProxyRequest request,
) {
  _validateFallback(
    fallbackMode: request.fallbackMode,
    backupProxyId: request.backupProxyId,
    proxyId: proxyId,
  );
  _validateExpiryWarnDays(request.expiryWarnDays);
  final name = request.name?.trim();
  final host = request.host?.trim();
  final username = request.username?.trim();
  final password = request.password?.reveal().trim();
  if (name != null && name.isEmpty) {
    throw _validation('admin.proxies.invalid_name');
  }
  if (host != null && host.isEmpty) {
    throw _validation('admin.proxies.invalid_host');
  }
  if (request.port != null) _validatePort(request.port!);
  if (username != null && username.isEmpty) {
    throw _validation('admin.proxies.empty_username_not_supported');
  }
  if (password != null && password.isEmpty) {
    throw _validation('admin.proxies.empty_password_not_supported');
  }
  if (request.status == Sub2ApiAdminProxyStatus.expired) {
    throw _validation('admin.proxies.invalid_update_status');
  }
  return <String, Object?>{
    'name': ?name,
    if (request.protocol != null) 'protocol': request.protocol!.name,
    'host': ?host,
    'port': ?request.port,
    'username': ?username,
    'password': ?password,
    if (request.status != null) 'status': request.status!.name,
    'expires_at': _unixSeconds(request.expiresAt) ?? 0,
    'fallback_mode': request.fallbackMode.name,
    'backup_proxy_id': request.backupProxyId,
    'expiry_warn_days': request.expiryWarnDays,
  };
}

Map<String, Object?> _batchCreateProxyBody(
  Sub2ApiAdminBatchCreateProxyInput proxy,
) {
  final host = proxy.host.trim();
  if (host.isEmpty) throw _validation('admin.proxies.host_required');
  _validatePort(proxy.port);
  return <String, Object?>{
    'protocol': proxy.protocol.name,
    'host': host,
    'port': proxy.port,
    'username': proxy.username?.trim() ?? '',
    'password': proxy.password?.reveal().trim() ?? '',
  };
}

void _validatePort(int port) {
  if (port <= 0 || port > 65535) {
    throw _validation('admin.proxies.invalid_port');
  }
}

void _validateFallback({
  required Sub2ApiAdminProxyFallbackMode fallbackMode,
  required int? backupProxyId,
  int? proxyId,
}) {
  if (backupProxyId != null && backupProxyId <= 0) {
    throw _validation('admin.proxies.invalid_backup_proxy_id');
  }
  if (proxyId != null && backupProxyId == proxyId) {
    throw _validation('admin.proxies.backup_proxy_self');
  }
  if (fallbackMode == Sub2ApiAdminProxyFallbackMode.proxy &&
      backupProxyId == null) {
    throw _validation('admin.proxies.backup_proxy_required');
  }
  if (fallbackMode != Sub2ApiAdminProxyFallbackMode.proxy &&
      backupProxyId != null) {
    throw _validation('admin.proxies.unexpected_backup_proxy');
  }
}

void _validateExpiryWarnDays(int value) {
  if (value < 0) throw _validation('admin.proxies.invalid_expiry_warn_days');
}

int? _unixSeconds(DateTime? value) {
  if (value == null) return null;
  if (value.microsecondsSinceEpoch <= 0 ||
      value.microsecondsSinceEpoch % Duration.microsecondsPerSecond != 0) {
    throw _validation('admin.proxies.invalid_expires_at');
  }
  return value.toUtc().millisecondsSinceEpoch ~/ 1000;
}

String _requiredIdempotencyKey(String value) {
  final key = value.trim();
  if (key.isEmpty) {
    throw _validation('admin.proxies.idempotency_key_required');
  }
  return key;
}

List<int> _requiredProxyIds(List<int> proxyIds) {
  final ids = <int>{...proxyIds}.toList(growable: false);
  if (ids.isEmpty) throw _validation('admin.proxies.proxy_ids_required');
  if (ids.any((id) => id <= 0)) {
    throw _validation('admin.proxies.invalid_proxy_id');
  }
  return ids;
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
