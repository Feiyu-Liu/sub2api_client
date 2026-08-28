import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_account_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_scheduled_test_models.dart';
import 'wire/admin_scheduled_test_wire_mapper.dart';
import 'wire/admin_scheduled_test_wire_service.dart';

abstract interface class Sub2ApiAdminScheduledTestsClient {
  Future<Sub2ApiAdminScheduledTestPlan> create(
    Sub2ApiAdminCreateScheduledTestPlanRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminScheduledTestPlan> update(
    int planId,
    Sub2ApiAdminUpdateScheduledTestPlanRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminDeleteScheduledTestPlanResult> delete(
    int planId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminScheduledTestResult>> listResults(
    int planId, {
    int limit = 50,
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminScheduledTestsClient createSub2ApiAdminScheduledTestsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiProtectedRawMutationExecutor rawMutationExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Sub2ApiAdminScheduledTestsClient(
  dio: dio,
  requestExecutor: requestExecutor,
  rawMutationExecutor: rawMutationExecutor,
  credentialMode: credentialMode,
);

final class _Sub2ApiAdminScheduledTestsClient
    implements Sub2ApiAdminScheduledTestsClient {
  _Sub2ApiAdminScheduledTestsClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiProtectedRawMutationExecutor rawMutationExecutor,
    required Sub2ApiAdminCredentialMode credentialMode,
  }) : _requestExecutor = requestExecutor,
       _rawMutationExecutor = rawMutationExecutor,
       _credentialMode = credentialMode,
       _service = AdminScheduledTestWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final Sub2ApiProtectedRawMutationExecutor _rawMutationExecutor;
  final Sub2ApiAdminCredentialMode _credentialMode;
  final AdminScheduledTestWireService _service;

  @override
  Future<Sub2ApiAdminScheduledTestPlan> create(
    Sub2ApiAdminCreateScheduledTestPlanRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _positive(request.accountId, 'admin.scheduled_tests.invalid_account_id');
    final cron = _required(
      request.cronExpression,
      'admin.scheduled_tests.cron_required',
    );
    return _rawMutationExecutor.protectedNonReplayableRequestAllowingRawSuccess(
      send: (cancelToken, options, credential) => _service.create(
        <String, Object?>{
          'account_id': request.accountId,
          'model_id': request.modelId.trim(),
          'cron_expression': cron,
          'enabled': request.enabled,
          'max_results': request.maxResults,
          'auto_recover': request.autoRecover,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminScheduledTestPlan,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminScheduledTestPlan> update(
    int planId,
    Sub2ApiAdminUpdateScheduledTestPlanRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _positive(planId, 'admin.scheduled_tests.invalid_plan_id');
    if (request.cronExpression != null) {
      _required(request.cronExpression!, 'admin.scheduled_tests.cron_required');
    }
    return _rawMutationExecutor.protectedNonReplayableRequestAllowingRawSuccess(
      send: (cancelToken, options, credential) => _service.update(
        planId,
        <String, Object?>{
          'model_id': ?request.modelId?.trim(),
          'cron_expression': ?request.cronExpression?.trim(),
          'enabled': ?request.enabled,
          'max_results': ?request.maxResults,
          'auto_recover': ?request.autoRecover,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminScheduledTestPlan,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminDeleteScheduledTestPlanResult> delete(
    int planId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _positive(planId, 'admin.scheduled_tests.invalid_plan_id');
    return _rawMutationExecutor.protectedNonReplayableRequestAllowingRawSuccess(
      send: (cancelToken, options, credential) => _service.delete(
        planId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminDeleteScheduledTestPlan,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminScheduledTestResult>> listResults(
    int planId, {
    int limit = 50,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _positive(planId, 'admin.scheduled_tests.invalid_plan_id');
    if (limit <= 0) {
      throw _validation('admin.scheduled_tests.invalid_limit');
    }
    return _requestExecutor.protectedRequestAllowingRawSuccess(
      send: (cancelToken, options, credential) => _service.listResults(
        planId,
        limit,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminScheduledTestResults,
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

void _positive(int value, String code) {
  if (value <= 0) throw _validation(code);
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
