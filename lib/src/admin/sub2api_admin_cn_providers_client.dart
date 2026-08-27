import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_cn_provider_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'wire/admin_cn_provider_wire_mapper.dart';
import 'wire/admin_cn_provider_wire_service.dart';

abstract interface class Sub2ApiAdminCNProvidersClient {
  Future<Sub2ApiAdminCNQuotaResult> getQuota(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminCNBalanceResult> getBalance(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminCNProvidersClient createSub2ApiAdminCNProvidersClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Sub2ApiAdminCNProvidersClient(
  dio: dio,
  requestExecutor: requestExecutor,
  credentialMode: credentialMode,
);

final class _Sub2ApiAdminCNProvidersClient
    implements Sub2ApiAdminCNProvidersClient {
  _Sub2ApiAdminCNProvidersClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiAdminCredentialMode credentialMode,
  }) : _requestExecutor = requestExecutor,
       _credentialMode = credentialMode,
       _service = AdminCNProviderWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final Sub2ApiAdminCredentialMode _credentialMode;
  final AdminCNProviderWireService _service;

  @override
  Future<Sub2ApiAdminCNQuotaResult> getQuota(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.getQuota(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminCNQuotaResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminCNBalanceResult> getBalance(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.getBalance(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminCNBalanceResult,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

void _validateAccountId(int value) {
  if (value <= 0) {
    throw const Sub2ApiException(
      kind: Sub2ApiFailureKind.validation,
      code: 'admin.cn_providers.invalid_account_id',
      retryable: false,
    );
  }
}
