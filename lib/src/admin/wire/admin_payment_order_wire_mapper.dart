import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_payment_order_models.dart';

Sub2ApiAdminPaymentDashboard mapAdminPaymentDashboard(Object? data) => _guard(
  () {
    final source = _object(data);
    return Sub2ApiAdminPaymentDashboard(
      todayAmount: _amounts(source['today_amount']),
      totalAmount: _amounts(source['total_amount']),
      todayCount: _nonNegative(source['today_count']),
      totalCount: _nonNegative(source['total_count']),
      averageAmount: _amounts(source['avg_amount']),
      pendingOrders: _nonNegative(source['pending_orders']),
      dailySeries: _list(source['daily_series']).map(_object).map((item) {
        return Sub2ApiAdminPaymentDailyStat(
          date: DateTime.parse('${_requiredText(item['date'])}T00:00:00Z'),
          amount: _amounts(item['amount']),
          count: _nonNegative(item['count']),
        );
      }).toList(),
      paymentMethods: _list(source['payment_methods']).map(_object).map((item) {
        return Sub2ApiAdminPaymentMethodStat(
          type: _requiredText(item['type']),
          amount: _amounts(item['amount']),
          count: _nonNegative(item['count']),
        );
      }).toList(),
      topUsers: _object(source['top_users']).map(
        (currency, users) => MapEntry(
          currency,
          _list(users).map(_object).map((item) {
            return Sub2ApiAdminPaymentTopUser(
              userId: _positive(item['user_id']),
              email: _requiredText(item['email']),
              amount: Sub2ApiDecimal.fromJson(item['amount']),
            );
          }).toList(),
        ),
      ),
    );
  },
);

Sub2ApiAdminPaymentOrderPage mapAdminPaymentOrderPage(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiPage(
        items: _list(source['items']).map(_object).map(_order).toList(),
        total: _nonNegative(source['total']),
        page: _positive(source['page']),
        pageSize: _positive(source['page_size']),
        pages: _nonNegative(source['pages']),
      );
    });

Sub2ApiAdminPaymentOrderDetail mapAdminPaymentOrderDetail(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminPaymentOrderDetail(
        order: _order(_object(source['order'])),
        auditLogs: _list(source['auditLogs']).map(_object).map(_audit).toList(),
      );
    });

Sub2ApiAdminPaymentActionResult mapAdminPaymentAction(Object? data) => _guard(
  () => Sub2ApiAdminPaymentActionResult(
    message: _requiredText(_object(data)['message']),
  ),
);

Sub2ApiAdminPaymentRefundResult mapAdminPaymentRefund(Object? data) => _guard(
  () {
    final source = _object(data);
    return Sub2ApiAdminPaymentRefundResult(
      success: _boolean(source['success']),
      warning: _text(source['warning']),
      requireForce: _optionalBool(source['require_force']),
      balanceDeducted: Sub2ApiDecimal.fromJson(source['balance_deducted'] ?? 0),
      subscriptionDaysDeducted: _optionalInt(
        source['subscription_days_deducted'],
      ),
    );
  },
);

Sub2ApiAdminPaymentOrder _order(Map<String, Object?> source) =>
    Sub2ApiAdminPaymentOrder(
      id: _positive(source['id']),
      userId: _positive(source['user_id']),
      userEmail: _text(source['user_email']),
      userName: _text(source['user_name']),
      userNotes: _optionalText(source['user_notes']),
      amount: Sub2ApiDecimal.fromJson(source['amount']),
      payAmount: Sub2ApiDecimal.fromJson(source['pay_amount']),
      feeRate: Sub2ApiDecimal.fromJson(source['fee_rate']),
      currency: _requiredText(source['currency']),
      rechargeCode: _secret(
        source['recharge_code'],
        Sub2ApiRedeemCodeSecret.new,
      ),
      outTradeNo: _requiredText(source['out_trade_no']),
      paymentType: _requiredText(source['payment_type']),
      paymentTradeNo: _text(source['payment_trade_no']),
      payUrl: _secret(source['pay_url'], Sub2ApiAdminPaymentCheckoutSecret.new),
      qrCode: _secret(source['qr_code'], Sub2ApiAdminPaymentCheckoutSecret.new),
      qrCodeImage: _secret(
        source['qr_code_img'],
        Sub2ApiAdminPaymentCheckoutSecret.new,
      ),
      orderType: _requiredText(source['order_type']),
      planId: _optionalPositive(source['plan_id']),
      subscriptionGroupId: _optionalPositive(source['subscription_group_id']),
      subscriptionDays: _optionalPositive(source['subscription_days']),
      providerInstanceId: _optionalText(source['provider_instance_id']),
      providerKey: _optionalText(source['provider_key']),
      status: _requiredText(source['status']),
      refundAmount: Sub2ApiDecimal.fromJson(source['refund_amount']),
      refundReason: _optionalText(source['refund_reason']),
      refundAt: _optionalDate(source['refund_at']),
      forceRefund: _optionalBool(source['force_refund']),
      refundRequestedAt: _optionalDate(source['refund_requested_at']),
      refundRequestReason: _optionalText(source['refund_request_reason']),
      refundRequestedBy: _optionalText(source['refund_requested_by']),
      expiresAt: _date(source['expires_at']),
      paidAt: _optionalDate(source['paid_at']),
      completedAt: _optionalDate(source['completed_at']),
      failedAt: _optionalDate(source['failed_at']),
      failedReason: _optionalText(source['failed_reason']),
      clientIp: _text(source['client_ip']),
      srcHost: _text(source['src_host']),
      srcUrl: _optionalText(source['src_url']),
      createdAt: _date(source['created_at']),
      updatedAt: _date(source['updated_at']),
    );

Sub2ApiAdminPaymentAuditLog _audit(Map<String, Object?> source) =>
    Sub2ApiAdminPaymentAuditLog(
      id: _positive(source['id']),
      orderId: _requiredText(source['order_id']),
      action: _requiredText(source['action']),
      detail: Sub2ApiAdminPaymentAuditDetail(_text(source['detail'])),
      operatorName: _requiredText(source['operator']),
      createdAt: _date(source['created_at']),
    );

Map<String, Sub2ApiDecimal> _amounts(Object? value) => _object(
  value,
).map((key, amount) => MapEntry(key, Sub2ApiDecimal.fromJson(amount)));

T? _secret<T>(Object? value, T Function(String) create) {
  final text = _optionalText(value);
  return text == null || text.isEmpty ? null : create(text);
}

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

String? _optionalText(Object? value) => value == null ? null : _text(value);
bool _boolean(Object? value) {
  if (value is! bool) throw const FormatException();
  return value;
}

bool _optionalBool(Object? value) => value == null ? false : _boolean(value);
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

int _optionalInt(Object? value) => value == null ? 0 : _integer(value);
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
  code: 'protocol.invalid_admin_payment_response',
  retryable: false,
);
