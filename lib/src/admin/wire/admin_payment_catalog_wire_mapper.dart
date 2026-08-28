import '../../billing/sub2api_billing_models.dart';
import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../sub2api_admin_payment_catalog_models.dart';

Sub2ApiPaymentConfig mapAdminPaymentConfig(Object? data) => _guard(() {
  final s = _object(data);
  return Sub2ApiPaymentConfig(
    enabled: _bool(s['enabled']),
    minAmount: _decimal(s['min_amount']),
    maxAmount: _decimal(s['max_amount']),
    dailyLimit: _decimal(s['daily_limit']),
    orderTimeoutMinutes: _positive(s['order_timeout_minutes']),
    maxPendingOrders: _positive(s['max_pending_orders']),
    enabledPaymentTypes: _list(s['enabled_payment_types']).map(_text).toList(),
    balanceDisabled: _bool(s['balance_disabled']),
    balanceRechargeMultiplier: _decimal(s['balance_recharge_multiplier']),
    subscriptionUsdToCnyRate: _decimal(s['subscription_usd_to_cny_rate']),
    rechargeFeeRate: _decimal(s['recharge_fee_rate']),
    loadBalanceStrategy: _text(s['load_balance_strategy']),
    productNamePrefix: _text(s['product_name_prefix']),
    productNameSuffix: _text(s['product_name_suffix']),
    helpImageUrl: _text(s['help_image_url']),
    helpText: _text(s['help_text']),
    stripePublishableKey: _optionalText(s['stripe_publishable_key']),
    cancelRateLimitEnabled: _bool(s['cancel_rate_limit_enabled']),
    cancelRateLimitMax: _positive(s['cancel_rate_limit_max']),
    cancelRateLimitWindow: _positive(s['cancel_rate_limit_window']),
    cancelRateLimitUnit: _text(s['cancel_rate_limit_unit']),
    cancelRateLimitMode: _text(s['cancel_rate_limit_window_mode']),
    alipayForceQrCode: _bool(s['alipay_force_qrcode']),
    alipayMobilePrecreateDeepLink: _bool(
      s['alipay_mobile_precreate_deep_link'],
    ),
  );
});

List<Sub2ApiAdminSubscriptionPlan> mapAdminPaymentPlans(Object? data) =>
    _guard(() => _list(data).map(_object).map(_plan).toList());
Sub2ApiAdminSubscriptionPlan mapAdminPaymentPlan(Object? data) =>
    _guard(() => _plan(_object(data)));
List<Sub2ApiAdminPaymentProvider> mapAdminPaymentProviders(Object? data) =>
    _guard(() => _list(data).map(_object).map(_provider).toList());
Sub2ApiAdminPaymentProvider mapAdminPaymentProvider(Object? data) =>
    _guard(() => _provider(_object(data)));
Sub2ApiAdminPaymentCatalogActionResult mapAdminPaymentCatalogAction(
  Object? data,
) => _guard(
  () => Sub2ApiAdminPaymentCatalogActionResult(
    message: _required(_object(data)['message']),
  ),
);

Sub2ApiAdminSubscriptionPlan _plan(Map<String, Object?> s) =>
    Sub2ApiAdminSubscriptionPlan(
      id: _positive(s['id']),
      groupId: _positive(s['group_id']),
      name: _required(s['name']),
      description: _text(s['description']),
      price: _decimal(s['price']),
      originalPrice: s['original_price'] == null
          ? null
          : _decimal(s['original_price']),
      currency: _text(s['currency']),
      validityDays: _positive(s['validity_days']),
      validityUnit: _required(s['validity_unit']),
      features: _text(s['features']),
      productName: _text(s['product_name']),
      forSale: _bool(s['for_sale']),
      sortOrder: _int(s['sort_order']),
      createdAt: _date(s['created_at']),
      updatedAt: _date(s['updated_at']),
      groupPlatform: _optionalText(s['group_platform']),
      groupName: _optionalText(s['group_name']),
      rateMultiplier: s['rate_multiplier'] == null
          ? null
          : _decimal(s['rate_multiplier']),
      dailyLimitUsd: s['daily_limit_usd'] == null
          ? null
          : _decimal(s['daily_limit_usd']),
      weeklyLimitUsd: s['weekly_limit_usd'] == null
          ? null
          : _decimal(s['weekly_limit_usd']),
      monthlyLimitUsd: s['monthly_limit_usd'] == null
          ? null
          : _decimal(s['monthly_limit_usd']),
      supportedModelScopes: s['supported_model_scopes'] == null
          ? const <String>[]
          : _list(s['supported_model_scopes']).map(_text).toList(),
    );

Sub2ApiAdminPaymentProvider _provider(Map<String, Object?> s) {
  final config = s['config'];
  final visible = config is Map
      ? _object(config).map((k, v) => MapEntry(k, _text(v)))
      : <String, String>{};
  final types = s['supported_types'] is List
      ? _list(s['supported_types']).map(_text).toList()
      : _text(s['supported_types'])
            .split(',')
            .where((v) => v.trim().isNotEmpty)
            .map((v) => v.trim())
            .toList();
  return Sub2ApiAdminPaymentProvider(
    id: _positive(s['id']),
    providerKey: _providerKey(_required(s['provider_key'])),
    name: _required(s['name']),
    visibleConfig: visible,
    supportedTypes: types,
    enabled: _bool(s['enabled']),
    paymentMode: _text(s['payment_mode']),
    sortOrder: _int(s['sort_order']),
    limits: _text(s['limits']),
    refundEnabled: _bool(s['refund_enabled']),
    allowUserRefund: _bool(s['allow_user_refund']),
  );
}

Sub2ApiAdminPaymentProviderKey _providerKey(String v) => switch (v) {
  'epay' => Sub2ApiAdminPaymentProviderKey.easyPay,
  'alipay' => Sub2ApiAdminPaymentProviderKey.alipay,
  'wxpay' => Sub2ApiAdminPaymentProviderKey.wxpay,
  'stripe' => Sub2ApiAdminPaymentProviderKey.stripe,
  'airwallex' => Sub2ApiAdminPaymentProviderKey.airwallex,
  _ => throw const FormatException(),
};
Map<String, Object?> _object(Object? v) {
  if (v is! Map) throw const FormatException();
  return Map<String, Object?>.from(v);
}

List<Object?> _list(Object? v) {
  if (v is! List) throw const FormatException();
  return v.cast<Object?>();
}

String _text(Object? v) {
  if (v == null) return '';
  if (v is! String) throw const FormatException();
  return v;
}

String _required(Object? v) {
  final t = _text(v);
  if (t.trim().isEmpty) throw const FormatException();
  return t;
}

String? _optionalText(Object? v) => v == null ? null : _text(v);
bool _bool(Object? v) {
  if (v is! bool) throw const FormatException();
  return v;
}

int _int(Object? v) {
  if (v is! int) throw const FormatException();
  return v;
}

int _positive(Object? v) {
  final n = _int(v);
  if (n <= 0) throw const FormatException();
  return n;
}

Sub2ApiDecimal _decimal(Object? v) => Sub2ApiDecimal.fromJson(v);
DateTime _date(Object? v) => DateTime.parse(_required(v)).toUtc();
T _guard<T>(T Function() a) {
  try {
    return a();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_payment_catalog_response',
  retryable: false,
);
