import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_affiliate_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'wire/admin_affiliate_wire_mapper.dart';
import 'wire/admin_affiliate_wire_service.dart';

abstract interface class Sub2ApiAdminAffiliatesClient {
  Future<Sub2ApiAdminAffiliateInvitePage> listInvites({
    Sub2ApiAdminAffiliateRecordQuery query =
        const Sub2ApiAdminAffiliateRecordQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAffiliateRebatePage> listRebates({
    Sub2ApiAdminAffiliateRecordQuery query =
        const Sub2ApiAdminAffiliateRecordQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAffiliateTransferPage> listTransfers({
    Sub2ApiAdminAffiliateRecordQuery query =
        const Sub2ApiAdminAffiliateRecordQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAffiliateUserPage> listUsers({
    Sub2ApiAdminAffiliateUserListQuery query =
        const Sub2ApiAdminAffiliateUserListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminAffiliateUserSummary>> lookupUsers(
    String query, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAffiliateBatchResult> batchSetRate(
    Sub2ApiAdminBatchSetAffiliateRateRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAffiliateUserOverview> getUserOverview(
    int userId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAffiliateUserActionResult> updateUser(
    int userId,
    Sub2ApiAdminUpdateAffiliateUserRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAffiliateUserActionResult> clearUser(
    int userId, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminAffiliatesClient createSub2ApiAdminAffiliatesClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminAffiliatesClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminAffiliateWireService(dio);

  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminAffiliateWireService _service;

  @override
  Future<Sub2ApiAdminAffiliateInvitePage> listInvites({
    Sub2ApiAdminAffiliateRecordQuery query =
        const Sub2ApiAdminAffiliateRecordQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) => _recordRequest(
    query,
    send: _service.invites,
    decode: mapAdminAffiliateInvitePage,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminAffiliateRebatePage> listRebates({
    Sub2ApiAdminAffiliateRecordQuery query =
        const Sub2ApiAdminAffiliateRecordQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) => _recordRequest(
    query,
    send: _service.rebates,
    decode: mapAdminAffiliateRebatePage,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminAffiliateTransferPage> listTransfers({
    Sub2ApiAdminAffiliateRecordQuery query =
        const Sub2ApiAdminAffiliateRecordQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) => _recordRequest(
    query,
    send: _service.transfers,
    decode: mapAdminAffiliateTransferPage,
    requestOptions: requestOptions,
  );

  Future<T> _recordRequest<T>(
    Sub2ApiAdminAffiliateRecordQuery query, {
    required Future<HttpResponse<Object?>> Function(
      Map<String, dynamic>,
      CancelToken,
      Options,
      String?,
      String?,
    )
    send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _page(query.page, query.pageSize, maxPageSize: 100);
    if (query.startAt != null &&
        query.endAt != null &&
        query.endAt!.isBefore(query.startAt!)) {
      throw _validation('admin.affiliates.invalid_date_range');
    }
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => send(
        <String, dynamic>{
          'page': query.page,
          'page_size': query.pageSize,
          if (query.search?.trim().isNotEmpty ?? false)
            'search': query.search!.trim(),
          if (query.startAt != null)
            'start_at': query.startAt!.toUtc().toIso8601String(),
          if (query.endAt != null)
            'end_at': query.endAt!.toUtc().toIso8601String(),
          'sort_by': _sortBy(query.sortBy),
          'sort_order':
              query.sortOrder == Sub2ApiAdminAffiliateSortOrder.ascending
              ? 'asc'
              : 'desc',
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: decode,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAffiliateUserPage> listUsers({
    Sub2ApiAdminAffiliateUserListQuery query =
        const Sub2ApiAdminAffiliateUserListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _page(query.page, query.pageSize, maxPageSize: 1000);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.users(
        <String, dynamic>{
          'page': query.page,
          'page_size': query.pageSize,
          if (query.search?.trim().isNotEmpty ?? false)
            'search': query.search!.trim(),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAffiliateUserPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminAffiliateUserSummary>> lookupUsers(
    String query, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, credential) => _service.lookupUsers(
      query.trim(),
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminAffiliateLookupUsers,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminAffiliateBatchResult> batchSetRate(
    Sub2ApiAdminBatchSetAffiliateRateRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (request.userIds.isEmpty || request.userIds.any((id) => id <= 0)) {
      throw _validation('admin.affiliates.invalid_user_ids');
    }
    if (!request.clear && request.rebateRatePercent == null) {
      throw _validation('admin.affiliates.rebate_rate_required');
    }
    if (request.clear && request.rebateRatePercent != null) {
      throw _validation('admin.affiliates.rate_clear_conflict');
    }
    if (request.rebateRatePercent != null) _rate(request.rebateRatePercent!);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.batchRate(
        <String, Object?>{
          'user_ids': request.userIds.toSet().toList(),
          if (!request.clear)
            'aff_rebate_rate_percent': _decimal(request.rebateRatePercent!),
          'clear': request.clear,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAffiliateBatchResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAffiliateUserOverview> getUserOverview(
    int userId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _userId(userId);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.overview(
        userId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAffiliateOverview,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAffiliateUserActionResult> updateUser(
    int userId,
    Sub2ApiAdminUpdateAffiliateUserRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _userId(userId);
    if (request.clearRebateRate && request.rebateRatePercent != null) {
      throw _validation('admin.affiliates.rate_clear_conflict');
    }
    final code = request.affiliateCode == null
        ? null
        : _affiliateCode(request.affiliateCode!);
    if (request.rebateRatePercent != null) _rate(request.rebateRatePercent!);
    final body = <String, Object?>{
      'aff_code': ?code,
      if (request.rebateRatePercent != null)
        'aff_rebate_rate_percent': _decimal(request.rebateRatePercent!),
      if (request.clearRebateRate) 'clear_rebate_rate': true,
    };
    if (body.isEmpty) throw _validation('admin.affiliates.empty_update');
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.updateUser(
        userId,
        body,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAffiliateUserAction,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAffiliateUserActionResult> clearUser(
    int userId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _userId(userId);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.clearUser(
        userId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAffiliateUserAction,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

String _affiliateCode(String value) {
  final code = value.trim().toUpperCase();
  if (!RegExp(r'^[A-Z0-9_-]{4,32}$').hasMatch(code)) {
    throw _validation('admin.affiliates.invalid_affiliate_code');
  }
  return code;
}

void _rate(Sub2ApiDecimal value) {
  if (value.compareTo(Sub2ApiDecimal.zero()) < 0 ||
      value.compareTo(Sub2ApiDecimal.parse('100')) > 0) {
    throw _validation('admin.affiliates.invalid_rebate_rate');
  }
}

void _page(int page, int pageSize, {required int maxPageSize}) {
  if (page <= 0) throw _validation('admin.affiliates.invalid_page');
  if (pageSize <= 0 || pageSize > maxPageSize) {
    throw _validation('admin.affiliates.invalid_page_size');
  }
}

void _userId(int value) {
  if (value <= 0) throw _validation('admin.affiliates.invalid_user_id');
}

String _sortBy(Sub2ApiAdminAffiliateRecordSort value) => switch (value) {
  Sub2ApiAdminAffiliateRecordSort.affiliateCode => 'aff_code',
  Sub2ApiAdminAffiliateRecordSort.totalRebate => 'total_rebate',
  Sub2ApiAdminAffiliateRecordSort.orderAmount => 'order_amount',
  Sub2ApiAdminAffiliateRecordSort.payAmount => 'pay_amount',
  Sub2ApiAdminAffiliateRecordSort.rebateAmount => 'rebate_amount',
  Sub2ApiAdminAffiliateRecordSort.paymentType => 'payment_type',
  Sub2ApiAdminAffiliateRecordSort.orderStatus => 'order_status',
  Sub2ApiAdminAffiliateRecordSort.createdAt => 'created_at',
  _ => value.name,
};

num _decimal(Sub2ApiDecimal value) => num.parse(value.toJson());

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
