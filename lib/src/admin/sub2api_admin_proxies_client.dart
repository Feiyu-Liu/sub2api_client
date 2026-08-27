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

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
