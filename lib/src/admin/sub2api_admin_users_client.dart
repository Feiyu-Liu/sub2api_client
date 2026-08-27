import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_user_models.dart';
import 'wire/admin_user_wire_dto.dart';
import 'wire/admin_user_wire_mapper.dart';
import 'wire/admin_user_wire_service.dart';

/// Shared typed Admin user-resource contract used by JWT and API-key facades.
abstract interface class Sub2ApiAdminUsersClient {
  Future<Sub2ApiAdminReplaceUserGroupResult> replaceGroup(
    int userId,
    Sub2ApiAdminReplaceUserGroupRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUserRpmStatus> getRpmStatus(
    int userId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAffectedUsersResult> batchUpdateConcurrency(
    Sub2ApiAdminBatchConcurrencyRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAffectedUsersResult> batchUpdateLimits(
    Sub2ApiAdminBatchLimitsRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUserPlatformQuotas> getPlatformQuotas(
    int userId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUserPlatformQuotas> updatePlatformQuotas(
    int userId,
    Sub2ApiAdminUpdatePlatformQuotasRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUserPlatformQuotas> resetPlatformQuotaWindow(
    int userId,
    Sub2ApiAdminResetPlatformQuotaRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminUserAttributeValue>> getAttributes(
    int userId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminUserAttributeValue>> updateAttributes(
    int userId,
    Sub2ApiAdminUpdateUserAttributesRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminUsersClient createSub2ApiAdminUsersClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Sub2ApiAdminUsersClient(
  dio: dio,
  requestExecutor: requestExecutor,
  credentialMode: credentialMode,
);

final class _Sub2ApiAdminUsersClient implements Sub2ApiAdminUsersClient {
  _Sub2ApiAdminUsersClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiAdminCredentialMode credentialMode,
  }) : _requestExecutor = requestExecutor,
       _credentialMode = credentialMode,
       _service = AdminUserWireService(dio);

  final Sub2ApiAdminCredentialMode _credentialMode;
  final Sub2ApiRequestExecutor _requestExecutor;
  final AdminUserWireService _service;

  @override
  Future<Sub2ApiAdminReplaceUserGroupResult> replaceGroup(
    int userId,
    Sub2ApiAdminReplaceUserGroupRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    if (request.oldGroupId <= 0 || request.newGroupId <= 0) {
      throw _validation('admin.users.invalid_group_id');
    }
    final body = AdminReplaceUserGroupRequestWireDto(
      oldGroupId: request.oldGroupId,
      newGroupId: request.newGroupId,
    );
    return _requestExecutor.protectedNonReplayableRequest(
      send: _credentialCall(
        (cancelToken, options, credential) => _service.replaceGroupWithJwt(
          userId,
          body,
          cancelToken,
          options,
          credential,
        ),
        (cancelToken, options, credential) => _service.replaceGroupWithApiKey(
          userId,
          body,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminReplaceUserGroup,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUserRpmStatus> getRpmStatus(
    int userId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    return _requestExecutor.protectedRequest(
      send: _credentialCall(
        (cancelToken, options, credential) =>
            _service.rpmStatusWithJwt(userId, cancelToken, options, credential),
        (cancelToken, options, credential) => _service.rpmStatusWithApiKey(
          userId,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminUserRpmStatus,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAffectedUsersResult> batchUpdateConcurrency(
    Sub2ApiAdminBatchConcurrencyRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final ids = _batchIds(request.userIds, all: request.all);
    final body = AdminBatchConcurrencyRequestWireDto(
      userIds: ids,
      all: request.all,
      concurrency: request.concurrency,
      mode: request.mode.name,
    );
    return _requestExecutor.protectedNonReplayableRequest(
      send: _credentialCall(
        (cancelToken, options, credential) => _service.batchConcurrencyWithJwt(
          body,
          cancelToken,
          options,
          credential,
        ),
        (cancelToken, options, credential) => _service
            .batchConcurrencyWithApiKey(body, cancelToken, options, credential),
      ),
      decode: mapAdminAffectedUsers,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAffectedUsersResult> batchUpdateLimits(
    Sub2ApiAdminBatchLimitsRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (request.concurrency == null && request.rpmLimit == null) {
      throw _validation('admin.users.batch_limit_required');
    }
    if ((request.concurrency != null && request.concurrency! < 0) ||
        (request.rpmLimit != null && request.rpmLimit! < 0)) {
      throw _validation('admin.users.invalid_limit');
    }
    final ids = _batchIds(request.userIds, all: request.all);
    final body = AdminBatchLimitsRequestWireDto(
      userIds: ids,
      all: request.all,
      concurrency: request.concurrency,
      rpmLimit: request.rpmLimit,
    );
    return _requestExecutor.protectedNonReplayableRequest(
      send: _credentialCall(
        (cancelToken, options, credential) =>
            _service.batchLimitsWithJwt(body, cancelToken, options, credential),
        (cancelToken, options, credential) => _service.batchLimitsWithApiKey(
          body,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminAffectedUsers,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUserPlatformQuotas> getPlatformQuotas(
    int userId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    return _requestExecutor.protectedRequest(
      send: _credentialCall(
        (cancelToken, options, credential) => _service.platformQuotasWithJwt(
          userId,
          cancelToken,
          options,
          credential,
        ),
        (cancelToken, options, credential) => _service.platformQuotasWithApiKey(
          userId,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminUserPlatformQuotas,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUserPlatformQuotas> updatePlatformQuotas(
    int userId,
    Sub2ApiAdminUpdatePlatformQuotasRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    if (request.quotas.length > Sub2ApiAdminQuotaPlatform.values.length) {
      throw _validation('admin.users.too_many_platform_quotas');
    }
    final seen = <Sub2ApiAdminQuotaPlatform>{};
    final quotas = <AdminPlatformQuotaInputWireDto>[];
    for (final quota in request.quotas) {
      if (!seen.add(quota.platform)) {
        throw _validation('admin.users.duplicate_quota_platform');
      }
      quotas.add(
        AdminPlatformQuotaInputWireDto(
          platform: _platform(quota.platform),
          dailyLimitUsd: _float64Limit(quota.dailyLimitUsd),
          weeklyLimitUsd: _float64Limit(quota.weeklyLimitUsd),
          monthlyLimitUsd: _float64Limit(quota.monthlyLimitUsd),
        ),
      );
    }
    final body = AdminUpdatePlatformQuotasRequestWireDto(quotas: quotas);
    return _requestExecutor.protectedNonReplayableRequest(
      send: _credentialCall(
        (cancelToken, options, credential) =>
            _service.updatePlatformQuotasWithJwt(
              userId,
              body,
              cancelToken,
              options,
              credential,
            ),
        (cancelToken, options, credential) =>
            _service.updatePlatformQuotasWithApiKey(
              userId,
              body,
              cancelToken,
              options,
              credential,
            ),
      ),
      decode: mapAdminUserPlatformQuotas,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUserPlatformQuotas> resetPlatformQuotaWindow(
    int userId,
    Sub2ApiAdminResetPlatformQuotaRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    final body = AdminResetPlatformQuotaRequestWireDto(
      platform: _platform(request.platform),
      window: request.window.name,
    );
    return _requestExecutor.protectedNonReplayableRequest(
      send: _credentialCall(
        (cancelToken, options, credential) =>
            _service.resetPlatformQuotaWithJwt(
              userId,
              body,
              cancelToken,
              options,
              credential,
            ),
        (cancelToken, options, credential) =>
            _service.resetPlatformQuotaWithApiKey(
              userId,
              body,
              cancelToken,
              options,
              credential,
            ),
      ),
      decode: mapAdminUserPlatformQuotas,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminUserAttributeValue>> getAttributes(
    int userId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    return _requestExecutor.protectedRequest(
      send: _credentialCall(
        (cancelToken, options, credential) => _service.attributesWithJwt(
          userId,
          cancelToken,
          options,
          credential,
        ),
        (cancelToken, options, credential) => _service.attributesWithApiKey(
          userId,
          cancelToken,
          options,
          credential,
        ),
      ),
      decode: mapAdminUserAttributes,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminUserAttributeValue>> updateAttributes(
    int userId,
    Sub2ApiAdminUpdateUserAttributesRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    if (request.values.keys.any((id) => id <= 0)) {
      throw _validation('admin.users.invalid_attribute_id');
    }
    final values = request.values.map(
      (id, value) => MapEntry(id.toString(), value),
    );
    final body = AdminUpdateUserAttributesRequestWireDto(values: values);
    return _requestExecutor.protectedNonReplayableRequest(
      send: _credentialCall(
        (cancelToken, options, credential) => _service.updateAttributesWithJwt(
          userId,
          body,
          cancelToken,
          options,
          credential,
        ),
        (cancelToken, options, credential) =>
            _service.updateAttributesWithApiKey(
              userId,
              body,
              cancelToken,
              options,
              credential,
            ),
      ),
      decode: mapAdminUserAttributes,
      requestOptions: requestOptions,
    );
  }

  Sub2ApiWireCall _credentialCall(
    Sub2ApiWireCall jwt,
    Sub2ApiWireCall apiKey,
  ) => switch (_credentialMode) {
    Sub2ApiAdminCredentialMode.jwt => jwt,
    Sub2ApiAdminCredentialMode.apiKey => apiKey,
  };

  static void _validateUserId(int userId) {
    if (userId <= 0) throw _validation('admin.users.invalid_user_id');
  }

  static List<int> _batchIds(List<int> ids, {required bool all}) {
    if (!all && ids.isEmpty) {
      throw _validation('admin.users.user_ids_required');
    }
    if (ids.length > 500) {
      throw _validation('admin.users.too_many_user_ids');
    }
    if (ids.any((id) => id <= 0)) {
      throw _validation('admin.users.invalid_user_id');
    }
    return List<int>.unmodifiable(ids);
  }

  static double? _float64Limit(Sub2ApiDecimal? limit) {
    if (limit == null) return null;
    if (limit.compareTo(Sub2ApiDecimal.zero()) < 0) {
      throw _validation('admin.users.invalid_quota_limit');
    }
    final value = double.tryParse(limit.toJson());
    if (value == null || !value.isFinite) {
      throw _validation('admin.users.quota_limit_not_representable');
    }
    try {
      if (Sub2ApiDecimal.parse(value.toString()) != limit) {
        throw _validation('admin.users.quota_limit_not_representable');
      }
    } on Sub2ApiException catch (error) {
      if (error.code == 'admin.users.quota_limit_not_representable') rethrow;
      throw _validation('admin.users.quota_limit_not_representable');
    } on Object {
      throw _validation('admin.users.quota_limit_not_representable');
    }
    return value;
  }

  static String _platform(Sub2ApiAdminQuotaPlatform platform) =>
      switch (platform) {
        Sub2ApiAdminQuotaPlatform.openAi => 'openai',
        _ => platform.name,
      };
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
