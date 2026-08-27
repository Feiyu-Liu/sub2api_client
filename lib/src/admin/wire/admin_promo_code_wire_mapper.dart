import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_promo_code_models.dart';

Sub2ApiAdminPromoCodePage mapAdminPromoCodePage(Object? data) => _map(() {
  final s = _object(data);
  return Sub2ApiPage(
    items: _list(s, 'items').map(_object).map(_record).toList(),
    total: _nonNegative(s, 'total'),
    page: _positive(s, 'page'),
    pageSize: _positive(s, 'page_size'),
    pages: _nonNegative(s, 'pages'),
  );
});
Sub2ApiAdminPromoCodeRecord mapAdminPromoCode(Object? data) =>
    _map(() => _record(_object(data)));
Sub2ApiAdminPromoCodeUsagePage mapAdminPromoCodeUsagePage(Object? data) =>
    _map(() {
      final s = _object(data);
      return Sub2ApiPage(
        items: _list(s, 'items').map(_object).map(_usage).toList(),
        total: _nonNegative(s, 'total'),
        page: _positive(s, 'page'),
        pageSize: _positive(s, 'page_size'),
        pages: _nonNegative(s, 'pages'),
      );
    });
Sub2ApiAdminDeletePromoCodeResult mapAdminDeletePromoCode(Object? data) => _map(
  () => Sub2ApiAdminDeletePromoCodeResult(_nonEmpty(_object(data), 'message')),
);

Sub2ApiAdminPromoCodeRecord _record(Map<String, Object?> s) =>
    Sub2ApiAdminPromoCodeRecord(
      id: _positive(s, 'id'),
      code: Sub2ApiPromoCode(_nonEmpty(s, 'code')),
      bonusAmount: _decimal(s, 'bonus_amount'),
      maxUses: _nonNegative(s, 'max_uses'),
      usedCount: _nonNegative(s, 'used_count'),
      status: switch (_nonEmpty(s, 'status')) {
        'active' => Sub2ApiAdminPromoCodeStatus.active,
        'disabled' => Sub2ApiAdminPromoCodeStatus.disabled,
        _ => throw const FormatException(),
      },
      expiresAt: _nullableDate(s, 'expires_at'),
      notes: _string(s, 'notes'),
      createdAt: _date(s, 'created_at'),
      updatedAt: _date(s, 'updated_at'),
    );
Sub2ApiAdminPromoCodeUsage _usage(Map<String, Object?> s) {
  final u = s['user'];
  return Sub2ApiAdminPromoCodeUsage(
    id: _positive(s, 'id'),
    promoCodeId: _positive(s, 'promo_code_id'),
    userId: _positive(s, 'user_id'),
    bonusAmount: _decimal(s, 'bonus_amount'),
    usedAt: _date(s, 'used_at'),
    user: u == null ? null : _user(_object(u)),
  );
}

Sub2ApiAdminPromoCodeUsageUser _user(Map<String, Object?> s) =>
    Sub2ApiAdminPromoCodeUsageUser(
      id: _positive(s, 'id'),
      email: _nonEmpty(s, 'email'),
      username: _string(s, 'username'),
      status: _nonEmpty(s, 'status'),
    );
Map<String, Object?> _object(Object? v) {
  if (v is! Map) throw const FormatException();
  return Map<String, Object?>.from(v);
}

List<Object?> _list(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! List) throw const FormatException();
  return v.cast<Object?>();
}

String _string(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! String) throw const FormatException();
  return v;
}

String _nonEmpty(Map<String, Object?> s, String k) {
  final v = _string(s, k);
  if (v.trim().isEmpty) throw const FormatException();
  return v;
}

int _positive(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! int || v <= 0) throw const FormatException();
  return v;
}

int _nonNegative(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v is! int || v < 0) throw const FormatException();
  return v;
}

Sub2ApiDecimal _decimal(Map<String, Object?> s, String k) {
  if (!s.containsKey(k)) throw const FormatException();
  return Sub2ApiDecimal.fromJson(s[k]);
}

DateTime _date(Map<String, Object?> s, String k) =>
    DateTime.parse(_nonEmpty(s, k)).toUtc();
DateTime? _nullableDate(Map<String, Object?> s, String k) {
  final v = s[k];
  if (v == null) return null;
  if (v is! String || v.trim().isEmpty) throw const FormatException();
  return DateTime.parse(v).toUtc();
}

T _map<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_promo_code_response',
  retryable: false,
);
