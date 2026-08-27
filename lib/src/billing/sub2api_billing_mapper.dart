import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';
import 'sub2api_billing_dto.dart';
import 'sub2api_billing_models.dart';

Sub2ApiPaymentConfig mapPaymentConfig(Object? data) {
  final source = Sub2ApiPaymentConfigDto.fromJson(_requireMap(data));
  return Sub2ApiPaymentConfig(
    enabled: source.enabled,
    minAmount: _decimal(source.minAmount),
    maxAmount: _decimal(source.maxAmount),
    dailyLimit: _decimal(source.dailyLimit),
    orderTimeoutMinutes: source.orderTimeoutMinutes,
    maxPendingOrders: source.maxPendingOrders,
    enabledPaymentTypes: source.enabledPaymentTypes,
    balanceDisabled: source.balanceDisabled,
    balanceRechargeMultiplier: _decimal(source.balanceRechargeMultiplier),
    subscriptionUsdToCnyRate: _decimal(source.subscriptionUsdToCnyRate),
    rechargeFeeRate: _decimal(source.rechargeFeeRate),
    loadBalanceStrategy: source.loadBalanceStrategy,
    productNamePrefix: source.productNamePrefix,
    productNameSuffix: source.productNameSuffix,
    helpImageUrl: source.helpImageUrl,
    helpText: source.helpText,
    stripePublishableKey: source.stripePublishableKey,
    cancelRateLimitEnabled: source.cancelRateLimitEnabled,
    cancelRateLimitMax: source.cancelRateLimitMax,
    cancelRateLimitWindow: source.cancelRateLimitWindow,
    cancelRateLimitUnit: source.cancelRateLimitUnit,
    cancelRateLimitMode: source.cancelRateLimitMode,
    alipayForceQrCode: source.alipayForceQrCode,
    alipayMobilePrecreateDeepLink: source.alipayMobilePrecreateDeepLink,
  );
}

Sub2ApiPaymentLimits mapPaymentLimits(Object? data) =>
    _mapPaymentLimitsDto(Sub2ApiPaymentLimitsDto.fromJson(_requireMap(data)));

Sub2ApiPaymentLimits _mapPaymentLimitsDto(Sub2ApiPaymentLimitsDto source) =>
    Sub2ApiPaymentLimits(
      methods: source.methods.map(
        (key, value) => MapEntry(key, _mapPaymentMethodLimits(value)),
      ),
      globalMin: _decimal(source.globalMin),
      globalMax: _decimal(source.globalMax),
    );

Sub2ApiPaymentMethodLimits _mapPaymentMethodLimits(
  Sub2ApiPaymentMethodLimitsDto source,
) => Sub2ApiPaymentMethodLimits(
  paymentType: source.paymentType,
  displayName: source.displayName ?? '',
  currency: source.currency,
  feeRate: _decimal(source.feeRate),
  dailyLimit: _decimal(source.dailyLimit),
  singleMin: _decimal(source.singleMin),
  singleMax: _decimal(source.singleMax),
);

List<Sub2ApiSubscriptionPlan> mapPaymentPlans(Object? data) {
  if (data is! List<Object?>) throw _protocolFailure();
  return data
      .map(
        (item) => _mapPlan(Sub2ApiPaymentPlanDto.fromJson(_requireMap(item))),
      )
      .toList(growable: false);
}

Sub2ApiSubscriptionPlan _mapPlan(Sub2ApiPaymentPlanDto source) =>
    Sub2ApiSubscriptionPlan(
      id: source.id,
      groupId: source.groupId,
      groupPlatform: source.groupPlatform,
      groupName: source.groupName,
      rateMultiplier: _decimal(source.rateMultiplier),
      peakRateEnabled: source.peakRateEnabled,
      peakStart: source.peakStart,
      peakEnd: source.peakEnd,
      peakRateMultiplier: _decimal(source.peakRateMultiplier),
      name: source.name,
      description: source.description,
      price: _decimal(source.price),
      originalPrice: source.originalPrice == null
          ? null
          : _decimal(source.originalPrice!),
      currency: source.currency,
      validityDays: source.validityDays,
      validityUnit: source.validityUnit,
      features: _features(source.features),
      productName: source.productName,
      forSale: source.forSale,
      sortOrder: source.sortOrder,
      dailyLimitUsd: source.dailyLimitUsd == null
          ? null
          : _decimal(source.dailyLimitUsd!),
      weeklyLimitUsd: source.weeklyLimitUsd == null
          ? null
          : _decimal(source.weeklyLimitUsd!),
      monthlyLimitUsd: source.monthlyLimitUsd == null
          ? null
          : _decimal(source.monthlyLimitUsd!),
      supportedModelScopes: source.supportedModelScopes,
    );

Sub2ApiCheckoutInfo mapCheckoutInfo(Object? data) {
  final source = Sub2ApiCheckoutInfoDto.fromJson(_requireMap(data));
  return Sub2ApiCheckoutInfo(
    limits: Sub2ApiPaymentLimits(
      methods: source.methods.map(
        (key, value) => MapEntry(key, _mapPaymentMethodLimits(value)),
      ),
      globalMin: _decimal(source.globalMin),
      globalMax: _decimal(source.globalMax),
    ),
    plans: source.plans.map(_mapPlan).toList(growable: false),
    balanceDisabled: source.balanceDisabled,
    balanceRechargeMultiplier: _decimal(source.balanceRechargeMultiplier),
    subscriptionUsdToCnyRate: _decimal(source.subscriptionUsdToCnyRate),
    rechargeFeeRate: _decimal(source.rechargeFeeRate),
    helpText: source.helpText,
    helpImageUrl: source.helpImageUrl,
    stripePublishableKey: source.stripePublishableKey,
    alipayForceQrCode: source.alipayForceQrCode,
    alipayMobilePrecreateDeepLink: source.alipayMobilePrecreateDeepLink,
  );
}

Sub2ApiPaymentOrder mapPaymentOrder(Object? data) =>
    _mapOrder(Sub2ApiPaymentOrderDto.fromJson(_requireMap(data)));

Sub2ApiPaymentOrder _mapOrder(Sub2ApiPaymentOrderDto source) =>
    Sub2ApiPaymentOrder(
      id: source.id,
      userId: source.userId,
      amount: _decimal(source.amount),
      payAmount: _decimal(source.payAmount),
      feeRate: _decimal(source.feeRate),
      currency: source.currency,
      paymentType: source.paymentType,
      outTradeNo: source.outTradeNo,
      status: source.status,
      orderType: source.orderType,
      createdAt: source.createdAt,
      expiresAt: source.expiresAt,
      paidAt: source.paidAt,
      completedAt: source.completedAt,
      refundAmount: _decimal(source.refundAmount),
      refundReason: source.refundReason,
      refundRequestedAt: source.refundRequestedAt,
      refundRequestedBy: source.refundRequestedBy,
      refundRequestReason: source.refundRequestReason,
      planId: source.planId,
      providerInstanceId: source.providerInstanceId,
    );

Sub2ApiPage<Sub2ApiPaymentOrder> mapPaymentOrderPage(Object? data) {
  final source = _requireMap(data);
  final items = source['items'];
  if (items is! List<Object?>) throw _protocolFailure();
  return Sub2ApiPage(
    items: items
        .map(
          (item) =>
              _mapOrder(Sub2ApiPaymentOrderDto.fromJson(_requireMap(item))),
        )
        .toList(growable: false),
    page: _requireInt(source['page']),
    pageSize: _requireInt(source['page_size']),
    total: _requireInt(source['total']),
    pages: _requireInt(source['pages']),
  );
}

Sub2ApiCreateOrderResult mapCreateOrderResult(Object? data) {
  final source = _requireMap(data);
  final resultType = source['result_type'];
  final type = resultType == null
      ? 'order_created'
      : _requireString(resultType);
  final amount = _decimal(_requireNum(source['amount']));
  final payAmount = _decimal(_requireNum(source['pay_amount']));
  final feeRate = _decimal(_requireNum(source['fee_rate']));
  final paymentType = _requireString(source['payment_type']);
  switch (type) {
    case 'oauth_required':
      return Sub2ApiCreateOrderResult.oauthRequired(
        amount: amount,
        payAmount: payAmount,
        feeRate: feeRate,
        paymentType: paymentType,
        oauth: _mapOauth(
          Sub2ApiWechatOAuthDto.fromJson(_requireMap(source['oauth'])),
        ),
      );
    case 'jsapi_ready':
      final payload = source['jsapi'] ?? source['jsapi_payload'];
      return Sub2ApiCreateOrderResult.jsapiReady(
        orderId: _requireInt(source['order_id']),
        amount: amount,
        payAmount: payAmount,
        feeRate: feeRate,
        status: _requireString(source['status']),
        paymentType: paymentType,
        outTradeNo: _requireString(source['out_trade_no']),
        currency: _requireString(source['currency']),
        expiresAt: _requireDate(source['expires_at']),
        jsapi: _mapJsApi(Sub2ApiWechatJsApiDto.fromJson(_requireMap(payload))),
        resumeToken: _secretOrNull(source['resume_token']),
      );
    case 'order_created':
      return Sub2ApiCreateOrderResult.orderCreated(
        orderId: _requireInt(source['order_id']),
        amount: amount,
        payAmount: payAmount,
        feeRate: feeRate,
        status: _requireString(source['status']),
        paymentType: paymentType,
        outTradeNo: _requireString(source['out_trade_no']),
        currency: _requireString(source['currency']),
        expiresAt: _requireDate(source['expires_at']),
        payUrl: _secretOrNull(source['pay_url']),
        qrCode: _secretOrNull(source['qr_code']),
        clientSecret: _secretOrNull(source['client_secret']),
        intentId: _stringOrNull(source['intent_id']),
        countryCode: _stringOrNull(source['country_code']),
        paymentEnvironment: _stringOrNull(source['payment_env']),
        paymentMode: _stringOrNull(source['payment_mode']),
        resumeToken: _secretOrNull(source['resume_token']),
        alipayMobilePrecreateDeepLink:
            source['alipay_mobile_precreate_deep_link'] == true,
      );
    default:
      throw _protocolFailure();
  }
}

Sub2ApiWechatOAuthInstructions _mapOauth(Sub2ApiWechatOAuthDto source) =>
    Sub2ApiWechatOAuthInstructions(
      authorizeUrl: source.authorizeUrl,
      appId: source.appId,
      scope: source.scope,
      redirectUrl: source.redirectUrl,
    );

Sub2ApiWechatJsApiInstructions _mapJsApi(Sub2ApiWechatJsApiDto source) =>
    Sub2ApiWechatJsApiInstructions(
      appId: source.appId,
      timeStamp: source.timeStamp,
      nonceStr: source.nonceStr,
      packageValue: Sub2ApiCheckoutSecret(source.packageValue),
      signType: source.signType,
      paySign: Sub2ApiCheckoutSecret(source.paySign),
    );

List<String> _features(Object? value) {
  if (value is String) {
    return value
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList(growable: false);
  }
  if (value is List<Object?>) {
    if (value.any((item) => item is! String)) throw _protocolFailure();
    return value.cast<String>();
  }
  throw _protocolFailure();
}

Sub2ApiDecimal _decimal(num value) => Sub2ApiDecimal.fromJson(value);

Sub2ApiCheckoutSecret? _secretOrNull(Object? value) {
  final string = _stringOrNull(value);
  return string == null || string.isEmpty
      ? null
      : Sub2ApiCheckoutSecret(string);
}

String? _stringOrNull(Object? value) =>
    value == null ? null : _requireString(value);

String _requireString(Object? value) {
  if (value is String) return value;
  throw _protocolFailure();
}

num _requireNum(Object? value) {
  if (value is num) return value;
  throw _protocolFailure();
}

int _requireInt(Object? value) {
  if (value is int) return value;
  throw _protocolFailure();
}

DateTime _requireDate(Object? value) {
  if (value is String) {
    final date = DateTime.tryParse(value);
    if (date != null) return date;
  }
  throw _protocolFailure();
}

Map<String, Object?> _requireMap(Object? value) {
  if (value is Map<String, Object?>) return value;
  if (value is Map) {
    final cast = <String, Object?>{};
    for (final entry in value.entries) {
      if (entry.key is! String) throw _protocolFailure();
      cast[entry.key as String] = entry.value;
    }
    return cast;
  }
  throw _protocolFailure();
}

Sub2ApiException _protocolFailure() => const Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_billing_payload',
  retryable: false,
);
