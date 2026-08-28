import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_affiliate_models.dart';

Sub2ApiAdminAffiliateUserPage mapAdminAffiliateUserPage(Object? data) =>
    _page(data, _user);

Sub2ApiAdminAffiliateInvitePage mapAdminAffiliateInvitePage(Object? data) =>
    _page(data, _invite);

Sub2ApiAdminAffiliateRebatePage mapAdminAffiliateRebatePage(Object? data) =>
    _page(data, _rebate);

Sub2ApiAdminAffiliateTransferPage mapAdminAffiliateTransferPage(Object? data) =>
    _page(data, _transfer);

List<Sub2ApiAdminAffiliateUserSummary> mapAdminAffiliateLookupUsers(
  Object? data,
) => _guard(
  () => _list(data)
      .map(_object)
      .map(
        (source) => Sub2ApiAdminAffiliateUserSummary(
          id: _positiveInt(source['id']),
          email: _text(source['email']),
          username: _text(source['username']),
        ),
      )
      .toList(growable: false),
);

Sub2ApiAdminAffiliateUserOverview mapAdminAffiliateOverview(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminAffiliateUserOverview(
        userId: _positiveInt(source['user_id']),
        email: _text(source['email']),
        username: _text(source['username']),
        affiliateCode: _requiredText(source['aff_code']),
        rebateRatePercent: _decimal(source['rebate_rate_percent']),
        invitedCount: _nonNegativeInt(source['invited_count']),
        rebatedInviteeCount: _nonNegativeInt(source['rebated_invitee_count']),
        availableQuota: _decimal(source['available_quota']),
        historyQuota: _decimal(source['history_quota']),
      );
    });

Sub2ApiAdminAffiliateUserActionResult mapAdminAffiliateUserAction(
  Object? data,
) => _guard(
  () => Sub2ApiAdminAffiliateUserActionResult(
    userId: _positiveInt(_object(data)['user_id']),
  ),
);

Sub2ApiAdminAffiliateBatchResult mapAdminAffiliateBatchResult(Object? data) =>
    _guard(
      () => Sub2ApiAdminAffiliateBatchResult(
        affected: _nonNegativeInt(_object(data)['affected']),
      ),
    );

Sub2ApiPage<T> _page<T>(Object? data, T Function(Map<String, Object?>) map) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiPage<T>(
        items: _list(
          source['items'],
        ).map(_object).map(map).toList(growable: false),
        total: _nonNegativeInt(source['total']),
        page: _positiveInt(source['page']),
        pageSize: _positiveInt(source['page_size']),
        pages: _positiveInt(source['pages']),
      );
    });

Sub2ApiAdminAffiliateUser _user(Map<String, Object?> source) =>
    Sub2ApiAdminAffiliateUser(
      userId: _positiveInt(source['user_id']),
      email: _text(source['email']),
      username: _text(source['username']),
      affiliateCode: _requiredText(source['aff_code']),
      affiliateCodeCustom: _bool(source['aff_code_custom']),
      rebateRatePercent: _optionalDecimal(source['aff_rebate_rate_percent']),
      affiliateCount: _nonNegativeInt(source['aff_count']),
    );

Sub2ApiAdminAffiliateInviteRecord _invite(Map<String, Object?> source) =>
    Sub2ApiAdminAffiliateInviteRecord(
      inviterId: _positiveInt(source['inviter_id']),
      inviterEmail: _text(source['inviter_email']),
      inviterUsername: _text(source['inviter_username']),
      inviteeId: _positiveInt(source['invitee_id']),
      inviteeEmail: _text(source['invitee_email']),
      inviteeUsername: _text(source['invitee_username']),
      affiliateCode: _requiredText(source['aff_code']),
      totalRebate: _decimal(source['total_rebate']),
      createdAt: _date(source['created_at']),
    );

Sub2ApiAdminAffiliateRebateRecord _rebate(Map<String, Object?> source) =>
    Sub2ApiAdminAffiliateRebateRecord(
      orderId: _positiveInt(source['order_id']),
      outTradeNo: _requiredText(source['out_trade_no']),
      inviterId: _positiveInt(source['inviter_id']),
      inviterEmail: _text(source['inviter_email']),
      inviterUsername: _text(source['inviter_username']),
      inviteeId: _positiveInt(source['invitee_id']),
      inviteeEmail: _text(source['invitee_email']),
      inviteeUsername: _text(source['invitee_username']),
      orderAmount: _decimal(source['order_amount']),
      payAmount: _decimal(source['pay_amount']),
      rebateAmount: _decimal(source['rebate_amount']),
      paymentType: _requiredText(source['payment_type']),
      orderStatus: _requiredText(source['order_status']),
      createdAt: _date(source['created_at']),
    );

Sub2ApiAdminAffiliateTransferRecord _transfer(Map<String, Object?> source) =>
    Sub2ApiAdminAffiliateTransferRecord(
      ledgerId: _positiveInt(source['ledger_id']),
      userId: _positiveInt(source['user_id']),
      userEmail: _text(source['user_email']),
      username: _text(source['username']),
      amount: _decimal(source['amount']),
      balanceAfter: _optionalDecimal(source['balance_after']),
      availableQuotaAfter: _optionalDecimal(source['available_quota_after']),
      frozenQuotaAfter: _optionalDecimal(source['frozen_quota_after']),
      historyQuotaAfter: _optionalDecimal(source['history_quota_after']),
      snapshotAvailable: _bool(source['snapshot_available']),
      createdAt: _date(source['created_at']),
    );

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

List<Object?> _list(Object? value) {
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

String _text(Object? value) {
  if (value is! String) throw const FormatException();
  return value;
}

String _requiredText(Object? value) {
  final text = _text(value);
  if (text.trim().isEmpty) throw const FormatException();
  return text;
}

bool _bool(Object? value) {
  if (value is! bool) throw const FormatException();
  return value;
}

int _positiveInt(Object? value) {
  if (value is! int || value <= 0) throw const FormatException();
  return value;
}

int _nonNegativeInt(Object? value) {
  if (value is! int || value < 0) throw const FormatException();
  return value;
}

Sub2ApiDecimal _decimal(Object? value) => Sub2ApiDecimal.fromJson(value);

Sub2ApiDecimal? _optionalDecimal(Object? value) =>
    value == null ? null : _decimal(value);

DateTime _date(Object? value) => DateTime.parse(_requiredText(value)).toUtc();

T _guard<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_affiliate_response',
  retryable: false,
);
