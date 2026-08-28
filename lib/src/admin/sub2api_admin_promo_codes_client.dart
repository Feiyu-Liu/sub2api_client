import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_promo_code_models.dart';
import 'wire/admin_promo_code_wire_mapper.dart';
import 'wire/admin_promo_code_wire_service.dart';

abstract interface class Sub2ApiAdminPromoCodesClient {
  Future<Sub2ApiAdminPromoCodePage> list({
    Sub2ApiAdminPromoCodeQuery query = const Sub2ApiAdminPromoCodeQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPromoCodeRecord> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPromoCodeRecord> create(
    Sub2ApiAdminCreatePromoCodeRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPromoCodeRecord> update(
    int id,
    Sub2ApiAdminUpdatePromoCodeRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDeletePromoCodeResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPromoCodeUsagePage> listUsages(
    int id, {
    int? page,
    int? pageSize,
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminPromoCodesClient createSub2ApiAdminPromoCodesClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminPromoCodesClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminPromoCodeWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminPromoCodeWireService _service;

  @override
  Future<Sub2ApiAdminPromoCodePage> list({
    Sub2ApiAdminPromoCodeQuery query = const Sub2ApiAdminPromoCodeQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _page(query.page, query.pageSize);
    return _executor.protectedRequest(
      send: (c, o, k) => _service.list(
        <String, Object?>{
          'page': ?query.page,
          'page_size': ?query.pageSize,
          'status': ?query.status?.name,
          'search': ?_search(query.search),
          'sort_by': _sortBy(query.sortBy),
          'sort_order': query.sortOrder.name,
        },
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminPromoCodePage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPromoCodeRecord> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedRequest(
      send: (c, o, k) => _service.get(id, c, o, _auth(k), _key(k)),
      decode: mapAdminPromoCode,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPromoCodeRecord> create(
    Sub2ApiAdminCreatePromoCodeRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (r.maxUses < 0) throw _validation('admin.promo_codes.invalid_max_uses');
    final amount = _amount(r.bonusAmount);
    final code = _code(r.code?.reveal(), required: false);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.create(
        <String, Object?>{
          'code': code ?? '',
          'bonus_amount': amount,
          'max_uses': r.maxUses,
          'expires_at': ?r.expiresAt?.toUtc().millisecondsSinceEpoch == null
              ? null
              : r.expiresAt!.toUtc().millisecondsSinceEpoch ~/ 1000,
          'notes': r.notes.trim(),
        },
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminPromoCode,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPromoCodeRecord> update(
    int id,
    Sub2ApiAdminUpdatePromoCodeRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    if (r.maxUses != null && r.maxUses! < 0) {
      throw _validation('admin.promo_codes.invalid_max_uses');
    }
    final amount = r.bonusAmount == null ? null : _amount(r.bonusAmount!);
    final code = r.code == null
        ? null
        : _code(r.code!.reveal(), required: true);
    final expiration = _expiration(r.expiresAt);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.update(
        id,
        <String, Object?>{
          'code': ?code,
          'bonus_amount': ?amount,
          'max_uses': ?r.maxUses,
          'status': ?r.status?.name,
          'expires_at': ?expiration,
          'notes': ?r.notes?.trim(),
        },
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminPromoCode,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminDeletePromoCodeResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.delete(id, c, o, _auth(k), _key(k)),
      decode: mapAdminDeletePromoCode,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPromoCodeUsagePage> listUsages(
    int id, {
    int? page,
    int? pageSize,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    _page(page, pageSize);
    return _executor.protectedRequest(
      send: (c, o, k) => _service.usages(
        id,
        <String, Object?>{'page': ?page, 'page_size': ?pageSize},
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminPromoCodeUsagePage,
      requestOptions: requestOptions,
    );
  }

  String? _auth(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? v : null;
  String? _key(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? v : null;
}

double _amount(Sub2ApiDecimal d) {
  if (d.compareTo(Sub2ApiDecimal.zero()) < 0) {
    throw _validation('admin.promo_codes.invalid_bonus_amount');
  }
  final v = double.tryParse(d.toJson());
  if (v == null || !v.isFinite || Sub2ApiDecimal.parse(v.toString()) != d) {
    throw _validation('admin.promo_codes.amount_not_representable');
  }
  return v;
}

String? _code(String? raw, {required bool required}) {
  final value = raw?.trim().toUpperCase();
  if (value == null || value.isEmpty) {
    if (required) throw _validation('admin.promo_codes.code_required');
    return null;
  }
  return value;
}

int? _expiration(Sub2ApiAdminPromoExpirationUpdate v) => switch (v) {
  Sub2ApiAdminPromoExpirationUnchanged() => null,
  Sub2ApiAdminPromoExpirationClear() => 0,
  Sub2ApiAdminPromoExpirationSet(:final value) =>
    value.toUtc().millisecondsSinceEpoch ~/ 1000,
};
void _id(int v) {
  if (v <= 0) throw _validation('admin.promo_codes.invalid_id');
}

void _page(int? p, int? s) {
  if (p != null && p <= 0) throw _validation('admin.promo_codes.invalid_page');
  if (s != null && s <= 0) {
    throw _validation('admin.promo_codes.invalid_page_size');
  }
}

String? _search(String? v) {
  final t = v?.trim();
  if (t == null || t.isEmpty) return null;
  return t.length > 100 ? t.substring(0, 100) : t;
}

String _sortBy(Sub2ApiAdminPromoCodeSortBy v) => switch (v) {
  Sub2ApiAdminPromoCodeSortBy.id => 'id',
  Sub2ApiAdminPromoCodeSortBy.code => 'code',
  Sub2ApiAdminPromoCodeSortBy.bonusAmount => 'bonus_amount',
  Sub2ApiAdminPromoCodeSortBy.status => 'status',
  Sub2ApiAdminPromoCodeSortBy.expiresAt => 'expires_at',
  Sub2ApiAdminPromoCodeSortBy.createdAt => 'created_at',
};
Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
