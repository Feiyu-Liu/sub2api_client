import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_error_passthrough_models.dart';
import 'wire/admin_error_passthrough_wire_mapper.dart';
import 'wire/admin_error_passthrough_wire_service.dart';

abstract interface class Sub2ApiAdminErrorPassthroughClient {
  Future<List<Sub2ApiAdminErrorPassthroughRule>> list({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminErrorPassthroughRule> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminErrorPassthroughRule> create(
    Sub2ApiAdminCreateErrorPassthroughRuleRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminErrorPassthroughRule> update(
    int id,
    Sub2ApiAdminUpdateErrorPassthroughRuleRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminDeleteErrorPassthroughRuleResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminErrorPassthroughClient createSub2ApiAdminErrorPassthroughClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Sub2ApiAdminErrorPassthroughClient(
  dio: dio,
  requestExecutor: requestExecutor,
  credentialMode: credentialMode,
);

final class _Sub2ApiAdminErrorPassthroughClient
    implements Sub2ApiAdminErrorPassthroughClient {
  _Sub2ApiAdminErrorPassthroughClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiAdminCredentialMode credentialMode,
  }) : _requestExecutor = requestExecutor,
       _credentialMode = credentialMode,
       _service = AdminErrorPassthroughWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final Sub2ApiAdminCredentialMode _credentialMode;
  final AdminErrorPassthroughWireService _service;

  @override
  Future<List<Sub2ApiAdminErrorPassthroughRule>> list({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, credential) => _service.list(
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminErrorPassthroughRules,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminErrorPassthroughRule> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateId(id);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.get(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminErrorPassthroughRule,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminErrorPassthroughRule> create(
    Sub2ApiAdminCreateErrorPassthroughRuleRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final name = _requiredName(request.name);
    if (request.errorCodes.isEmpty && request.keywords.isEmpty) {
      throw _validation('admin.error_passthrough.conditions_required');
    }
    if (!request.passthroughCode &&
        (request.responseCode == null || request.responseCode! <= 0)) {
      throw _validation('admin.error_passthrough.response_code_required');
    }
    final customMessage = request.customMessage?.trim();
    if (!request.passthroughBody &&
        (customMessage == null || customMessage.isEmpty)) {
      throw _validation('admin.error_passthrough.custom_message_required');
    }
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.create(
        <String, Object?>{
          'name': name,
          'enabled': request.enabled,
          'priority': request.priority,
          'error_codes': request.errorCodes,
          'keywords': request.keywords,
          'match_mode': _matchMode(request.matchMode),
          'platforms': request.platforms,
          'passthrough_code': request.passthroughCode,
          'response_code': request.responseCode,
          'passthrough_body': request.passthroughBody,
          'custom_message': customMessage,
          'skip_monitoring': request.skipMonitoring,
          'description': request.description?.trim(),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminErrorPassthroughRule,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminErrorPassthroughRule> update(
    int id,
    Sub2ApiAdminUpdateErrorPassthroughRuleRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateId(id);
    final name = request.name == null ? null : _requiredName(request.name!);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.update(
        id,
        <String, Object?>{
          'name': ?name,
          'enabled': ?request.enabled,
          'priority': ?request.priority,
          'error_codes': ?request.errorCodes,
          'keywords': ?request.keywords,
          'match_mode': ?request.matchMode == null
              ? null
              : _matchMode(request.matchMode!),
          'platforms': ?request.platforms,
          'passthrough_code': ?request.passthroughCode,
          'response_code': ?request.responseCode,
          'passthrough_body': ?request.passthroughBody,
          'custom_message': ?request.customMessage?.trim(),
          'skip_monitoring': ?request.skipMonitoring,
          'description': ?request.description?.trim(),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminErrorPassthroughRule,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminDeleteErrorPassthroughRuleResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateId(id);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.delete(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminDeleteErrorPassthroughRule,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

String _matchMode(Sub2ApiAdminErrorPassthroughMatchMode value) =>
    value == Sub2ApiAdminErrorPassthroughMatchMode.any ? 'any' : 'all';

String _requiredName(String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) {
    throw _validation('admin.error_passthrough.name_required');
  }
  return trimmed;
}

void _validateId(int id) {
  if (id <= 0) throw _validation('admin.error_passthrough.invalid_id');
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
