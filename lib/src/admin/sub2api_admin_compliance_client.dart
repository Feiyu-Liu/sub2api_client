import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_compliance_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'wire/admin_compliance_wire_mapper.dart';
import 'wire/admin_compliance_wire_service.dart';

abstract interface class Sub2ApiAdminComplianceClient {
  Future<Sub2ApiAdminComplianceStatus> getStatus({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminComplianceStatus> accept(
    Sub2ApiAdminAcceptComplianceRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminComplianceClient createSub2ApiAdminComplianceClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Sub2ApiAdminComplianceClient(
  dio: dio,
  requestExecutor: requestExecutor,
  credentialMode: credentialMode,
);

final class _Sub2ApiAdminComplianceClient
    implements Sub2ApiAdminComplianceClient {
  _Sub2ApiAdminComplianceClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiAdminCredentialMode credentialMode,
  }) : _requestExecutor = requestExecutor,
       _credentialMode = credentialMode,
       _service = AdminComplianceWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final Sub2ApiAdminCredentialMode _credentialMode;
  final AdminComplianceWireService _service;

  @override
  Future<Sub2ApiAdminComplianceStatus> getStatus({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, credential) => _service.getStatus(
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminComplianceStatus,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminComplianceStatus> accept(
    Sub2ApiAdminAcceptComplianceRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final phrase = request.phrase.trim();
    if (phrase.isEmpty) {
      throw _validation('admin.compliance.phrase_required');
    }
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.accept(
        <String, Object?>{'phrase': phrase, 'language': request.language.name},
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminComplianceStatus,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
