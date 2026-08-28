import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_redeem_code_models.dart';
import 'wire/admin_redeem_code_wire_mapper.dart';
import 'wire/admin_redeem_code_wire_service.dart';

abstract interface class Sub2ApiAdminRedeemCodesClient {
  Future<Sub2ApiAdminRedeemCodePage> list({
    Sub2ApiAdminRedeemCodeListQuery query =
        const Sub2ApiAdminRedeemCodeListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminRedeemCode> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminRedeemCodeStats> getStats({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminRedeemCodeExport> export({
    Sub2ApiAdminRedeemCodeExportQuery query =
        const Sub2ApiAdminRedeemCodeExportQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminRedeemCode>> generate(
    Sub2ApiAdminGenerateRedeemCodesRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminRedeemCode> createAndRedeem(
    Sub2ApiAdminCreateAndRedeemRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminRedeemCodeActionResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminRedeemCodeBatchResult> batchDelete(
    List<int> ids, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminRedeemCodeBatchResult> batchUpdate(
    Sub2ApiAdminBatchUpdateRedeemCodesRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminRedeemCode> expire(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminRedeemCodesClient createSub2ApiAdminRedeemCodesClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminRedeemCodesClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminRedeemCodeWireService(dio);

  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminRedeemCodeWireService _service;

  @override
  Future<Sub2ApiAdminRedeemCodePage> list({
    Sub2ApiAdminRedeemCodeListQuery query =
        const Sub2ApiAdminRedeemCodeListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _page(query.page, query.pageSize);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.list(
        <String, Object?>{
          'page': query.page,
          'page_size': query.pageSize,
          'type': ?query.type == null ? null : _type(query.type!),
          'status': ?query.status?.name,
          'search': ?_search(query.search),
          'sort_by': _sortBy(query.sortBy),
          'sort_order': _sortOrder(query.sortOrder),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminRedeemCodePage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminRedeemCode> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.get(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminRedeemCode,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminRedeemCodeStats> getStats({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, credential) => _service.stats(
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminRedeemCodeStats,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminRedeemCodeExport> export({
    Sub2ApiAdminRedeemCodeExportQuery query =
        const Sub2ApiAdminRedeemCodeExportQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequestAllowingRawSuccess(
    send: (cancelToken, options, credential) => _service.export(
      <String, Object?>{
        'type': ?query.type == null ? null : _type(query.type!),
        'status': ?query.status?.name,
        'search': ?_search(query.search),
        'sort_by': _sortBy(query.sortBy),
        'sort_order': _sortOrder(query.sortOrder),
      },
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminRedeemCodeExport,
    requestOptions: requestOptions,
  );

  @override
  Future<List<Sub2ApiAdminRedeemCode>> generate(
    Sub2ApiAdminGenerateRedeemCodesRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final idempotencyKey = _idempotencyKey(request.idempotencyKey);
    if (request.count < 1 || request.count > 100) {
      throw _validation('admin.redeem_codes.invalid_count');
    }
    _writeType(request.type);
    _subscription(request.type, request.groupId, request.validityDays);
    _expiration(request.expiresAt, request.expiresInDays);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.generate(
        <String, Object?>{
          'count': request.count,
          'type': _type(request.type),
          'value': _double(request.value),
          'group_id': ?request.groupId,
          'validity_days': request.validityDays,
          'expires_at': ?_date(request.expiresAt),
          'expires_in_days': ?request.expiresInDays,
        },
        idempotencyKey,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminGeneratedRedeemCodes,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminRedeemCode> createAndRedeem(
    Sub2ApiAdminCreateAndRedeemRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final idempotencyKey = _idempotencyKey(request.idempotencyKey);
    final code = request.code.reveal().trim();
    if (code.length < 3 || code.length > 128) {
      throw _validation('admin.redeem_codes.invalid_code');
    }
    _idWithCode(request.userId, 'admin.redeem_codes.invalid_user_id');
    _writeType(request.type);
    _subscription(request.type, request.groupId, request.validityDays);
    _expiration(request.expiresAt, request.expiresInDays);
    final value = _double(request.value);
    if (request.type != Sub2ApiAdminRedeemCodeType.invitation && value == 0) {
      throw _validation('admin.redeem_codes.value_required');
    }
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.createAndRedeem(
        <String, Object?>{
          'code': code,
          'type': _type(request.type),
          'value': value,
          'user_id': request.userId,
          'group_id': ?request.groupId,
          'validity_days': request.validityDays,
          'notes': request.notes.trim(),
          'expires_at': ?_date(request.expiresAt),
          'expires_in_days': ?request.expiresInDays,
        },
        idempotencyKey,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminCreatedAndRedeemed,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminRedeemCodeActionResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.delete(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminRedeemCodeAction,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminRedeemCodeBatchResult> batchDelete(
    List<int> ids, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final normalized = _ids(ids);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.batchDelete(
        <String, Object?>{'ids': normalized},
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminRedeemCodeBatchDelete,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminRedeemCodeBatchResult> batchUpdate(
    Sub2ApiAdminBatchUpdateRedeemCodesRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final ids = _ids(request.ids);
    if (request.clearExpiresAt && request.expiresAt != null) {
      throw _validation('admin.redeem_codes.conflicting_expires_at');
    }
    if (request.clearGroupId && request.groupId != null) {
      throw _validation('admin.redeem_codes.conflicting_group_id');
    }
    if (request.status != null &&
        request.status != Sub2ApiAdminRedeemCodeStatus.unused &&
        request.status != Sub2ApiAdminRedeemCodeStatus.disabled) {
      throw _validation('admin.redeem_codes.invalid_batch_status');
    }
    if (request.expiresAt != null &&
        !request.expiresAt!.toUtc().isAfter(DateTime.now().toUtc())) {
      throw _validation('admin.redeem_codes.invalid_expires_at');
    }
    if (request.groupId != null) {
      _idWithCode(request.groupId!, 'admin.redeem_codes.invalid_group_id');
    }
    if (request.status == null &&
        request.expiresAt == null &&
        !request.clearExpiresAt &&
        request.notes == null &&
        request.groupId == null &&
        !request.clearGroupId) {
      throw _validation('admin.redeem_codes.empty_batch_update');
    }
    final fields = <String, Object?>{
      'status': ?request.status?.name,
      if (request.clearExpiresAt)
        'expires_at': null
      else
        'expires_at': ?_date(request.expiresAt),
      'notes': ?request.notes?.trim(),
      if (request.clearGroupId)
        'group_id': null
      else
        'group_id': ?request.groupId,
    };
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.batchUpdate(
        <String, Object?>{'ids': ids, 'fields': fields},
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminRedeemCodeBatchUpdate,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminRedeemCode> expire(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.expire(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminRedeemCode,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

void _page(int page, int pageSize) {
  if (page <= 0) throw _validation('admin.redeem_codes.invalid_page');
  if (pageSize <= 0 || pageSize > 100) {
    throw _validation('admin.redeem_codes.invalid_page_size');
  }
}

void _id(int value) => _idWithCode(value, 'admin.redeem_codes.invalid_id');

void _idWithCode(int value, String code) {
  if (value <= 0) throw _validation(code);
}

List<int> _ids(List<int> values) {
  if (values.isEmpty || values.any((value) => value <= 0)) {
    throw _validation('admin.redeem_codes.invalid_ids');
  }
  return values.toSet().toList(growable: false);
}

String _idempotencyKey(String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) {
    throw _validation('admin.redeem_codes.idempotency_key_required');
  }
  return trimmed;
}

String? _search(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) return null;
  return trimmed.length > 100 ? trimmed.substring(0, 100) : trimmed;
}

void _writeType(Sub2ApiAdminRedeemCodeType type) {
  if (type == Sub2ApiAdminRedeemCodeType.adminBalance ||
      type == Sub2ApiAdminRedeemCodeType.adminConcurrency) {
    throw _validation('admin.redeem_codes.invalid_write_type');
  }
}

void _subscription(
  Sub2ApiAdminRedeemCodeType type,
  int? groupId,
  int validityDays,
) {
  if (groupId != null && groupId <= 0) {
    throw _validation('admin.redeem_codes.invalid_group_id');
  }
  if (type == Sub2ApiAdminRedeemCodeType.subscription &&
      (groupId == null || validityDays == 0)) {
    throw _validation('admin.redeem_codes.invalid_subscription');
  }
}

void _expiration(DateTime? expiresAt, int? expiresInDays) {
  if (expiresAt != null && expiresInDays != null) {
    throw _validation('admin.redeem_codes.expiry_conflict');
  }
  if (expiresInDays != null && (expiresInDays < 1 || expiresInDays > 3650)) {
    throw _validation('admin.redeem_codes.invalid_expires_in_days');
  }
  if (expiresAt != null && !expiresAt.toUtc().isAfter(DateTime.now().toUtc())) {
    throw _validation('admin.redeem_codes.invalid_expires_at');
  }
}

String? _date(DateTime? value) => value?.toUtc().toIso8601String();

double _double(Sub2ApiDecimal decimal) {
  final value = double.tryParse(decimal.toJson());
  if (value == null ||
      !value.isFinite ||
      Sub2ApiDecimal.parse(value.toString()) != decimal) {
    throw _validation('admin.redeem_codes.value_not_representable');
  }
  return value;
}

String _type(Sub2ApiAdminRedeemCodeType value) => switch (value) {
  Sub2ApiAdminRedeemCodeType.balance => 'balance',
  Sub2ApiAdminRedeemCodeType.concurrency => 'concurrency',
  Sub2ApiAdminRedeemCodeType.subscription => 'subscription',
  Sub2ApiAdminRedeemCodeType.invitation => 'invitation',
  Sub2ApiAdminRedeemCodeType.adminBalance => 'admin_balance',
  Sub2ApiAdminRedeemCodeType.adminConcurrency => 'admin_concurrency',
};

String _sortBy(Sub2ApiAdminRedeemCodeSortBy value) => switch (value) {
  Sub2ApiAdminRedeemCodeSortBy.id => 'id',
  Sub2ApiAdminRedeemCodeSortBy.code => 'code',
  Sub2ApiAdminRedeemCodeSortBy.type => 'type',
  Sub2ApiAdminRedeemCodeSortBy.value => 'value',
  Sub2ApiAdminRedeemCodeSortBy.status => 'status',
  Sub2ApiAdminRedeemCodeSortBy.usedAt => 'used_at',
  Sub2ApiAdminRedeemCodeSortBy.createdAt => 'created_at',
  Sub2ApiAdminRedeemCodeSortBy.expiresAt => 'expires_at',
};

String _sortOrder(Sub2ApiAdminRedeemCodeSortOrder value) => switch (value) {
  Sub2ApiAdminRedeemCodeSortOrder.ascending => 'asc',
  Sub2ApiAdminRedeemCodeSortOrder.descending => 'desc',
};

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
