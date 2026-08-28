import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_redeem_code_models.dart';

Sub2ApiAdminRedeemCodePage mapAdminRedeemCodePage(Object? data) => _guard(() {
  final source = _object(data);
  return Sub2ApiPage(
    items: _list(source['items']).map(_object).map(_code).toList(),
    total: _nonNegative(source['total']),
    page: _positive(source['page']),
    pageSize: _positive(source['page_size']),
    pages: _nonNegative(source['pages']),
  );
});

Sub2ApiAdminRedeemCode mapAdminRedeemCode(Object? data) =>
    _guard(() => _code(_object(data)));

List<Sub2ApiAdminRedeemCode> mapAdminGeneratedRedeemCodes(Object? data) =>
    _guard(() => _list(data).map(_object).map(_code).toList());

Sub2ApiAdminRedeemCode mapAdminCreatedAndRedeemed(Object? data) =>
    _guard(() => _code(_object(_object(data)['redeem_code'])));

Sub2ApiAdminRedeemCodeStats mapAdminRedeemCodeStats(Object? data) => _guard(() {
  final source = _object(data);
  return Sub2ApiAdminRedeemCodeStats(
    totalCodes: _nonNegative(source['total_codes']),
    activeCodes: _nonNegative(source['active_codes']),
    usedCodes: _nonNegative(source['used_codes']),
    expiredCodes: _nonNegative(source['expired_codes']),
    totalValueDistributed: Sub2ApiDecimal.fromJson(
      source['total_value_distributed'],
    ),
    byType: _object(
      source['by_type'],
    ).map((key, value) => MapEntry(key, _nonNegative(value))),
  );
});

Sub2ApiAdminRedeemCodeExport mapAdminRedeemCodeExport(Object? data) =>
    _guard(() => Sub2ApiAdminRedeemCodeExport(_requiredText(data)));

Sub2ApiAdminRedeemCodeActionResult mapAdminRedeemCodeAction(Object? data) =>
    _guard(
      () => Sub2ApiAdminRedeemCodeActionResult(
        message: _requiredText(_object(data)['message']),
      ),
    );

Sub2ApiAdminRedeemCodeBatchResult mapAdminRedeemCodeBatchDelete(Object? data) =>
    _batch(data, 'deleted');

Sub2ApiAdminRedeemCodeBatchResult mapAdminRedeemCodeBatchUpdate(Object? data) =>
    _batch(data, 'updated');

Sub2ApiAdminRedeemCodeBatchResult _batch(Object? data, String key) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminRedeemCodeBatchResult(
        affected: _nonNegative(source[key]),
        message: _requiredText(source['message']),
      );
    });

Sub2ApiAdminRedeemCode _code(Map<String, Object?> source) =>
    Sub2ApiAdminRedeemCode(
      id: _positive(source['id']),
      code: Sub2ApiRedeemCodeSecret(_requiredText(source['code'])),
      type: _type(_requiredText(source['type'])),
      value: Sub2ApiDecimal.fromJson(source['value']),
      status: _status(_requiredText(source['status'])),
      usedBy: _optionalPositive(source['used_by']),
      usedAt: _optionalDate(source['used_at']),
      createdAt: _date(source['created_at']),
      expiresAt: _optionalDate(source['expires_at']),
      groupId: _optionalPositive(source['group_id']),
      validityDays: _integer(source['validity_days']),
      notes: _text(source['notes']),
      user: source['user'] == null ? null : _user(_object(source['user'])),
      group: source['group'] == null ? null : _group(_object(source['group'])),
    );

Sub2ApiAdminRedeemUserSummary _user(Map<String, Object?> source) =>
    Sub2ApiAdminRedeemUserSummary(
      id: _positive(source['id']),
      email: _text(source['email']),
      username: _text(source['username']),
    );

Sub2ApiAdminRedeemGroupSummary _group(Map<String, Object?> source) =>
    Sub2ApiAdminRedeemGroupSummary(
      id: _positive(source['id']),
      name: _requiredText(source['name']),
    );

Sub2ApiAdminRedeemCodeType _type(String value) => switch (value) {
  'balance' => Sub2ApiAdminRedeemCodeType.balance,
  'concurrency' => Sub2ApiAdminRedeemCodeType.concurrency,
  'subscription' => Sub2ApiAdminRedeemCodeType.subscription,
  'invitation' => Sub2ApiAdminRedeemCodeType.invitation,
  'admin_balance' => Sub2ApiAdminRedeemCodeType.adminBalance,
  'admin_concurrency' => Sub2ApiAdminRedeemCodeType.adminConcurrency,
  _ => throw const FormatException(),
};

Sub2ApiAdminRedeemCodeStatus _status(String value) => switch (value) {
  'unused' => Sub2ApiAdminRedeemCodeStatus.unused,
  'used' => Sub2ApiAdminRedeemCodeStatus.used,
  'expired' => Sub2ApiAdminRedeemCodeStatus.expired,
  'disabled' => Sub2ApiAdminRedeemCodeStatus.disabled,
  _ => throw const FormatException(),
};

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

List<Object?> _list(Object? value) {
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

String _text(Object? value) {
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

String _requiredText(Object? value) {
  final text = _text(value);
  if (text.trim().isEmpty) throw const FormatException();
  return text;
}

int _integer(Object? value) {
  if (value is! int) throw const FormatException();
  return value;
}

int _positive(Object? value) {
  final number = _integer(value);
  if (number <= 0) throw const FormatException();
  return number;
}

int _nonNegative(Object? value) {
  final number = _integer(value);
  if (number < 0) throw const FormatException();
  return number;
}

int? _optionalPositive(Object? value) =>
    value == null ? null : _positive(value);

DateTime _date(Object? value) => DateTime.parse(_requiredText(value)).toUtc();

DateTime? _optionalDate(Object? value) => value == null ? null : _date(value);

T _guard<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_redeem_code_response',
  retryable: false,
);
