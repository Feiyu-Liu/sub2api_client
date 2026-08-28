import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../commerce/sub2api_commerce_models.dart';
import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_subscription_models.dart';
import 'wire/admin_subscription_wire_mapper.dart';
import 'wire/admin_subscription_wire_service.dart';

abstract interface class Sub2ApiAdminSubscriptionsClient {
  Future<Sub2ApiAdminSubscriptionPage> list({
    Sub2ApiAdminSubscriptionListQuery query =
        const Sub2ApiAdminSubscriptionListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSubscription> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiSubscriptionProgress> getProgress(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSubscription> assign(
    Sub2ApiAdminAssignSubscriptionRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminBulkAssignSubscriptionsResult> bulkAssign(
    Sub2ApiAdminBulkAssignSubscriptionsRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSubscription> adjust(
    int id,
    Sub2ApiAdminAdjustSubscriptionRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSubscription> resetQuota(
    int id,
    Sub2ApiAdminResetSubscriptionQuotaRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSubscriptionActionResult> revoke(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSubscriptionActionResult> deleteLegacy(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSubscription> restore(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminSubscriptionsClient createSub2ApiAdminSubscriptionsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminSubscriptionsClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminSubscriptionWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminSubscriptionWireService _service;

  @override
  Future<Sub2ApiAdminSubscriptionPage> list({
    Sub2ApiAdminSubscriptionListQuery query =
        const Sub2ApiAdminSubscriptionListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _page(query.page, query.pageSize);
    if (query.userId != null) _id(query.userId!);
    if (query.groupId != null) _id(query.groupId!);
    final platform = _optional(query.platform);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.list(
        <String, Object?>{
          'page': query.page,
          'page_size': query.pageSize,
          'user_id': ?query.userId,
          'group_id': ?query.groupId,
          'status': ?query.status?.name,
          'platform': ?platform,
          'sort_by': _sortBy(query.sortBy),
          'sort_order': _sortOrder(query.sortOrder),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminSubscriptionPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminSubscription> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _read(id, _service.get, mapAdminSubscription, requestOptions);

  @override
  Future<Sub2ApiSubscriptionProgress> getProgress(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _read(
    id,
    _service.progress,
    mapAdminSubscriptionProgress,
    requestOptions,
  );

  @override
  Future<Sub2ApiAdminSubscription> assign(
    Sub2ApiAdminAssignSubscriptionRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _assignment(request.userId, request.groupId, request.validityDays);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.assign(
        <String, Object?>{
          'user_id': request.userId,
          'group_id': request.groupId,
          'validity_days': request.validityDays,
          'notes': request.notes.trim(),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminSubscription,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminBulkAssignSubscriptionsResult> bulkAssign(
    Sub2ApiAdminBulkAssignSubscriptionsRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (request.userIds.isEmpty || request.userIds.any((id) => id <= 0)) {
      throw _validation('admin.subscriptions.invalid_user_ids');
    }
    _assignment(request.userIds.first, request.groupId, request.validityDays);
    final userIds = request.userIds.toSet().toList(growable: false);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.bulkAssign(
        <String, Object?>{
          'user_ids': userIds,
          'group_id': request.groupId,
          'validity_days': request.validityDays,
          'notes': request.notes.trim(),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminBulkAssignSubscriptions,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminSubscription> adjust(
    int id,
    Sub2ApiAdminAdjustSubscriptionRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    if (request.days == 0 || request.days < -36500 || request.days > 36500) {
      throw _validation('admin.subscriptions.invalid_adjustment_days');
    }
    final key = request.idempotencyKey.trim();
    if (key.isEmpty) {
      throw _validation('admin.subscriptions.idempotency_key_required');
    }
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.extend(
        id,
        <String, Object?>{'days': request.days},
        key,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminSubscription,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminSubscription> resetQuota(
    int id,
    Sub2ApiAdminResetSubscriptionQuotaRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    if (!request.daily && !request.weekly && !request.monthly) {
      throw _validation('admin.subscriptions.quota_window_required');
    }
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.resetQuota(
        id,
        <String, Object?>{
          'daily': request.daily,
          'weekly': request.weekly,
          'monthly': request.monthly,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminSubscription,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminSubscriptionActionResult> revoke(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _action(id, _service.revoke, requestOptions);

  @override
  Future<Sub2ApiAdminSubscriptionActionResult> deleteLegacy(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _action(id, _service.delete, requestOptions);

  @override
  Future<Sub2ApiAdminSubscription> restore(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.restore(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminSubscription,
      requestOptions: requestOptions,
    );
  }

  Future<T> _read<T>(
    int id,
    Future<HttpResponse<Object?>> Function(
      int,
      CancelToken,
      Options,
      String?,
      String?,
    )
    send,
    T Function(Object?) decode,
    Sub2ApiRequestOptions? requestOptions,
  ) {
    _id(id);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => send(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: decode,
      requestOptions: requestOptions,
    );
  }

  Future<Sub2ApiAdminSubscriptionActionResult> _action(
    int id,
    Future<HttpResponse<Object?>> Function(
      int,
      CancelToken,
      Options,
      String?,
      String?,
    )
    send,
    Sub2ApiRequestOptions? requestOptions,
  ) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => send(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminSubscriptionAction,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? credential : null;
  String? _apiKey(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

void _id(int value) {
  if (value <= 0) throw _validation('admin.subscriptions.invalid_id');
}

void _page(int page, int pageSize) {
  if (page <= 0) throw _validation('admin.subscriptions.invalid_page');
  if (pageSize <= 0 || pageSize > 100) {
    throw _validation('admin.subscriptions.invalid_page_size');
  }
}

void _assignment(int userId, int groupId, int validityDays) {
  if (userId <= 0) throw _validation('admin.subscriptions.invalid_user_id');
  if (groupId <= 0) throw _validation('admin.subscriptions.invalid_group_id');
  if (validityDays < 0 || validityDays > 36500) {
    throw _validation('admin.subscriptions.invalid_validity_days');
  }
}

String? _optional(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? null : trimmed;
}

String _sortBy(Sub2ApiAdminSubscriptionSortBy value) => switch (value) {
  Sub2ApiAdminSubscriptionSortBy.createdAt => 'created_at',
  Sub2ApiAdminSubscriptionSortBy.expiresAt => 'expires_at',
  Sub2ApiAdminSubscriptionSortBy.status => 'status',
};

String _sortOrder(Sub2ApiAdminSubscriptionSortOrder value) => switch (value) {
  Sub2ApiAdminSubscriptionSortOrder.ascending => 'asc',
  Sub2ApiAdminSubscriptionSortOrder.descending => 'desc',
};

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
