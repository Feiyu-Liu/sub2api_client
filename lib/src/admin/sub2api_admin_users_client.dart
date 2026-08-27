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
  Future<Sub2ApiAdminUserPage> list({
    Sub2ApiAdminUserListQuery query = const Sub2ApiAdminUserListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUser> getById(
    int userId, {
    bool includeDeleted = false,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminBoundIdentity> bindIdentity(
    int userId,
    Sub2ApiAdminBindIdentityRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUser> create(
    Sub2ApiAdminCreateUserRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUser> update(
    int userId,
    Sub2ApiAdminUpdateUserRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminDeleteUserResult> delete(
    int userId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUser> updateBalance(
    int userId,
    Sub2ApiAdminUpdateBalanceRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUserApiKeyPage> getApiKeys(
    int userId, {
    int? page,
    int? pageSize,
    String? sortBy,
    String? sortOrder,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUserUsage> getUsage(
    int userId, {
    Sub2ApiAdminUserUsagePeriod period = Sub2ApiAdminUserUsagePeriod.month,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminBalanceHistoryPage> getBalanceHistory(
    int userId, {
    int? page,
    int? pageSize,
    Sub2ApiAdminBalanceHistoryType? type,
    Sub2ApiRequestOptions? requestOptions,
  });

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
  Future<Sub2ApiAdminUserPage> list({
    Sub2ApiAdminUserListQuery query = const Sub2ApiAdminUserListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validatePage(query.page, query.pageSize);
    if (query.search != null && query.search!.runes.length > 100) {
      throw _validation('admin.users.search_too_long');
    }
    if (query.apiKeyGroupId != null && query.apiKeyGroupId! <= 0) {
      throw _validation('admin.users.invalid_api_key_group_id');
    }
    if (query.attributes.entries.any(
      (entry) => entry.key <= 0 || entry.value.isEmpty,
    )) {
      throw _validation('admin.users.invalid_attribute_filter');
    }
    _validateSortOrder(query.sortOrder);
    final values = <String, dynamic>{
      if (query.page != null) 'page': query.page,
      if (query.pageSize != null) 'page_size': query.pageSize,
      if (query.status != null) 'status': query.status!.name,
      if (query.role != null) 'role': query.role!.name,
      if (query.search != null) 'search': query.search!.trim(),
      if (query.groupName != null) 'group_name': query.groupName!.trim(),
      if (query.apiKeyGroupId != null) 'api_key_group_id': query.apiKeyGroupId,
      if (query.includeSubscriptions != null)
        'include_subscriptions': query.includeSubscriptions,
      if (query.sortBy != null) 'sort_by': query.sortBy,
      if (query.sortOrder != null) 'sort_order': query.sortOrder,
      for (final entry in query.attributes.entries)
        'attr[${entry.key}]': entry.value,
    };
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.listUsers(
        values,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminUserPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUser> getById(
    int userId, {
    bool includeDeleted = false,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.getUser(
        userId,
        <String, dynamic>{if (includeDeleted) 'include_deleted': true},
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminUser,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminBoundIdentity> bindIdentity(
    int userId,
    Sub2ApiAdminBindIdentityRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    if (request.providerType.trim().isEmpty ||
        request.providerKey.trim().isEmpty ||
        request.providerSubject.trim().isEmpty) {
      throw _validation('admin.users.invalid_identity');
    }
    final channel = request.channel;
    if (channel != null &&
        (channel.channel.trim().isEmpty ||
            channel.channelAppId.trim().isEmpty ||
            channel.channelSubject.trim().isEmpty)) {
      throw _validation('admin.users.invalid_identity_channel');
    }
    final body = <String, Object?>{
      'provider_type': request.providerType,
      'provider_key': request.providerKey,
      'provider_subject': request.providerSubject,
      if (request.issuer != null) 'issuer': request.issuer,
      if (request.metadata != null) 'metadata': request.metadata!.toWire(),
      if (channel != null)
        'channel': <String, Object?>{
          'channel': channel.channel,
          'channel_app_id': channel.channelAppId,
          'channel_subject': channel.channelSubject,
          if (channel.metadata != null) 'metadata': channel.metadata!.toWire(),
        },
    };
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.bindIdentity(
        userId,
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminBoundIdentity,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUser> create(
    Sub2ApiAdminCreateUserRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (request.email.trim().isEmpty || request.password.reveal().length < 6) {
      throw _validation('admin.users.invalid_create_credentials');
    }
    _validateLimits(request.concurrency, request.rpmLimit);
    _validateIds(request.allowedGroups, 'admin.users.invalid_group_id');
    final body = <String, Object?>{
      'email': request.email.trim(),
      'password': request.password.reveal(),
      if (request.username != null) 'username': request.username,
      if (request.notes != null) 'notes': request.notes,
      if (request.role != null) 'role': request.role!.name,
      if (request.balance != null)
        'balance': _float64Decimal(
          request.balance!,
          'admin.users.balance_not_representable',
        ),
      'concurrency': request.concurrency,
      'rpm_limit': request.rpmLimit,
      'allowed_groups': request.allowedGroups,
    };
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.createUser(
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminUser,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUser> update(
    int userId,
    Sub2ApiAdminUpdateUserRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    if (request.password != null && request.password!.reveal().length < 6) {
      throw _validation('admin.users.invalid_password');
    }
    _validateLimits(request.concurrency, request.rpmLimit);
    if (request.allowedGroups != null) {
      _validateIds(request.allowedGroups!, 'admin.users.invalid_group_id');
    }
    final groupRates = <String, Object?>{};
    for (final entry
        in request.groupRates?.entries ??
            const <MapEntry<int, Sub2ApiDecimal?>>[]) {
      if (entry.key <= 0) throw _validation('admin.users.invalid_group_id');
      groupRates[entry.key.toString()] = entry.value == null
          ? null
          : _float64Decimal(
              entry.value!,
              'admin.users.group_rate_not_representable',
            );
    }
    final body = <String, Object?>{
      if (request.email != null) 'email': request.email!.trim(),
      if (request.password != null) 'password': request.password!.reveal(),
      if (request.username != null) 'username': request.username,
      if (request.notes != null) 'notes': request.notes,
      if (request.role != null) 'role': request.role!.name,
      if (request.balance != null)
        'balance': _float64Decimal(
          request.balance!,
          'admin.users.balance_not_representable',
        ),
      if (request.concurrency != null) 'concurrency': request.concurrency,
      if (request.rpmLimit != null) 'rpm_limit': request.rpmLimit,
      if (request.status != null) 'status': request.status!.name,
      if (request.allowedGroups != null)
        'allowed_groups': request.allowedGroups,
      if (request.groupRates != null) 'group_rates': groupRates,
    };
    if (body.isEmpty) throw _validation('admin.users.update_required');
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.updateUser(
        userId,
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminUser,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminDeleteUserResult> delete(
    int userId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.deleteUser(
        userId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminDeleteUser,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUser> updateBalance(
    int userId,
    Sub2ApiAdminUpdateBalanceRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    if (request.idempotencyKey.trim().isEmpty) {
      throw _validation('admin.users.idempotency_key_required');
    }
    final amount = _float64Decimal(
      request.amount,
      'admin.users.balance_not_representable',
      positive: true,
    );
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.updateBalance(
        userId,
        <String, Object?>{
          'balance': amount,
          'operation': request.operation.name,
          'notes': request.notes,
        },
        request.idempotencyKey,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminUser,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUserApiKeyPage> getApiKeys(
    int userId, {
    int? page,
    int? pageSize,
    String? sortBy,
    String? sortOrder,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    _validatePage(page, pageSize);
    _validateSortOrder(sortOrder);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.userApiKeys(
        userId,
        <String, dynamic>{
          'page': ?page,
          'page_size': ?pageSize,
          'sort_by': ?sortBy,
          'sort_order': ?sortOrder,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminUserApiKeyPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUserUsage> getUsage(
    int userId, {
    Sub2ApiAdminUserUsagePeriod period = Sub2ApiAdminUserUsagePeriod.month,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.userUsage(
        userId,
        period.name,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminUserUsage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminBalanceHistoryPage> getBalanceHistory(
    int userId, {
    int? page,
    int? pageSize,
    Sub2ApiAdminBalanceHistoryType? type,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUserId(userId);
    _validatePage(page, pageSize);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.balanceHistory(
        userId,
        <String, dynamic>{
          'page': ?page,
          'page_size': ?pageSize,
          if (type != null) 'type': _historyType(type),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminBalanceHistory,
      requestOptions: requestOptions,
    );
  }

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

  String? _authorization(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;

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

  static void _validatePage(int? page, int? pageSize) {
    if (page != null && page <= 0) {
      throw _validation('admin.users.invalid_page');
    }
    if (pageSize != null && (pageSize <= 0 || pageSize > 1000)) {
      throw _validation('admin.users.invalid_page_size');
    }
  }

  static void _validateSortOrder(String? sortOrder) {
    if (sortOrder != null && sortOrder != 'asc' && sortOrder != 'desc') {
      throw _validation('admin.users.invalid_sort_order');
    }
  }

  static void _validateLimits(int? concurrency, int? rpmLimit) {
    if ((concurrency != null && concurrency < 0) ||
        (rpmLimit != null && rpmLimit < 0)) {
      throw _validation('admin.users.invalid_limit');
    }
  }

  static void _validateIds(List<int> ids, String code) {
    if (ids.any((id) => id <= 0)) throw _validation(code);
  }

  static double _float64Decimal(
    Sub2ApiDecimal decimal,
    String code, {
    bool positive = false,
  }) {
    final zero = Sub2ApiDecimal.zero();
    final comparison = decimal.compareTo(zero);
    if (comparison < 0 || (positive && comparison == 0)) {
      throw _validation(code);
    }
    final value = double.tryParse(decimal.toJson());
    if (value == null || !value.isFinite) throw _validation(code);
    try {
      if (Sub2ApiDecimal.parse(value.toString()) != decimal) {
        throw _validation(code);
      }
    } on Sub2ApiException catch (error) {
      if (error.code == code) rethrow;
      throw _validation(code);
    } on Object {
      throw _validation(code);
    }
    return value;
  }

  static String _historyType(Sub2ApiAdminBalanceHistoryType type) =>
      switch (type) {
        Sub2ApiAdminBalanceHistoryType.affiliateBalance => 'affiliate_balance',
        Sub2ApiAdminBalanceHistoryType.adminBalance => 'admin_balance',
        Sub2ApiAdminBalanceHistoryType.adminConcurrency => 'admin_concurrency',
        _ => type.name,
      };

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
