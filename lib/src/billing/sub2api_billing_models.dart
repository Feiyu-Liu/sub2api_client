import 'package:freezed_annotation/freezed_annotation.dart';

import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';

part 'sub2api_billing_models.freezed.dart';

/// User-visible payment configuration. It does not contain provider secrets.
@freezed
abstract class Sub2ApiPaymentConfig with _$Sub2ApiPaymentConfig {
  const factory Sub2ApiPaymentConfig({
    required bool enabled,
    required Sub2ApiDecimal minAmount,
    required Sub2ApiDecimal maxAmount,
    required Sub2ApiDecimal dailyLimit,
    required int orderTimeoutMinutes,
    required int maxPendingOrders,
    required List<String> enabledPaymentTypes,
    required bool balanceDisabled,
    required Sub2ApiDecimal balanceRechargeMultiplier,
    required Sub2ApiDecimal subscriptionUsdToCnyRate,
    required Sub2ApiDecimal rechargeFeeRate,
    required String loadBalanceStrategy,
    required String productNamePrefix,
    required String productNameSuffix,
    required String helpImageUrl,
    required String helpText,
    String? stripePublishableKey,
    required bool cancelRateLimitEnabled,
    required int cancelRateLimitMax,
    required int cancelRateLimitWindow,
    required String cancelRateLimitUnit,
    required String cancelRateLimitMode,
    required bool alipayForceQrCode,
  }) = _Sub2ApiPaymentConfig;
}

/// Limits for one visible payment method.
@freezed
abstract class Sub2ApiPaymentMethodLimits with _$Sub2ApiPaymentMethodLimits {
  const factory Sub2ApiPaymentMethodLimits({
    required String paymentType,
    required String displayName,
    required String currency,
    required Sub2ApiDecimal feeRate,
    required Sub2ApiDecimal dailyLimit,
    required Sub2ApiDecimal singleMin,
    required Sub2ApiDecimal singleMax,
  }) = _Sub2ApiPaymentMethodLimits;
}

/// All currently available payment methods and their permitted ranges.
@freezed
abstract class Sub2ApiPaymentLimits with _$Sub2ApiPaymentLimits {
  const factory Sub2ApiPaymentLimits({
    required Map<String, Sub2ApiPaymentMethodLimits> methods,
    required Sub2ApiDecimal globalMin,
    required Sub2ApiDecimal globalMax,
  }) = _Sub2ApiPaymentLimits;
}

/// A subscription plan currently offered for purchase.
@freezed
abstract class Sub2ApiSubscriptionPlan with _$Sub2ApiSubscriptionPlan {
  const factory Sub2ApiSubscriptionPlan({
    required int id,
    required int groupId,
    required String groupPlatform,
    required String groupName,
    required Sub2ApiDecimal rateMultiplier,
    required bool peakRateEnabled,
    required String peakStart,
    required String peakEnd,
    required Sub2ApiDecimal peakRateMultiplier,
    required String name,
    required String description,
    required Sub2ApiDecimal price,
    Sub2ApiDecimal? originalPrice,
    required int validityDays,
    required String validityUnit,
    required List<String> features,
    required String productName,
    bool? forSale,
    int? sortOrder,
    Sub2ApiDecimal? dailyLimitUsd,
    Sub2ApiDecimal? weeklyLimitUsd,
    Sub2ApiDecimal? monthlyLimitUsd,
    List<String>? supportedModelScopes,
  }) = _Sub2ApiSubscriptionPlan;
}

/// One-call data used by a payment UI to render a checkout form.
@freezed
abstract class Sub2ApiCheckoutInfo with _$Sub2ApiCheckoutInfo {
  const factory Sub2ApiCheckoutInfo({
    required Sub2ApiPaymentLimits limits,
    required List<Sub2ApiSubscriptionPlan> plans,
    required bool balanceDisabled,
    required Sub2ApiDecimal balanceRechargeMultiplier,
    required Sub2ApiDecimal subscriptionUsdToCnyRate,
    required Sub2ApiDecimal rechargeFeeRate,
    required String helpText,
    required String helpImageUrl,
    String? stripePublishableKey,
    required bool alipayForceQrCode,
  }) = _Sub2ApiCheckoutInfo;
}

/// An authenticated user's payment order. [status] deliberately remains a
/// string so new server statuses do not break existing clients.
@freezed
abstract class Sub2ApiPaymentOrder with _$Sub2ApiPaymentOrder {
  const factory Sub2ApiPaymentOrder({
    required int id,
    required int userId,
    required Sub2ApiDecimal amount,
    required Sub2ApiDecimal payAmount,
    required Sub2ApiDecimal feeRate,
    required String currency,
    required String paymentType,
    required String outTradeNo,
    required String status,
    required String orderType,
    required DateTime createdAt,
    required DateTime expiresAt,
    DateTime? paidAt,
    DateTime? completedAt,
    required Sub2ApiDecimal refundAmount,
    String? refundReason,
    DateTime? refundRequestedAt,
    String? refundRequestedBy,
    String? refundRequestReason,
    int? planId,
    String? providerInstanceId,
  }) = _Sub2ApiPaymentOrder;
}

/// Filters supported by the user's own order list.
@freezed
abstract class Sub2ApiPaymentOrderQuery with _$Sub2ApiPaymentOrderQuery {
  const factory Sub2ApiPaymentOrderQuery({
    @Default(1) int page,
    @Default(20) int pageSize,
    String? status,
    String? orderType,
    String? paymentType,
  }) = _Sub2ApiPaymentOrderQuery;
}

/// Request data for a balance recharge order. The payment server validates the
/// amount and calculates credited balance, fees, and currency.
@freezed
abstract class Sub2ApiCreateBalanceOrderRequest
    with _$Sub2ApiCreateBalanceOrderRequest {
  const factory Sub2ApiCreateBalanceOrderRequest({
    required Sub2ApiDecimal amount,
    required String paymentType,
    String? openId,
    Sub2ApiCheckoutSecret? wechatResumeToken,
    String? returnUrl,
    String? paymentSource,
    bool? isMobile,
  }) = _Sub2ApiCreateBalanceOrderRequest;
}

/// Request data for a subscription plan order. The server—not this client—is
/// authoritative for a plan's price.
@freezed
abstract class Sub2ApiCreateSubscriptionOrderRequest
    with _$Sub2ApiCreateSubscriptionOrderRequest {
  const factory Sub2ApiCreateSubscriptionOrderRequest({
    required int planId,
    required String paymentType,
    String? openId,
    Sub2ApiCheckoutSecret? wechatResumeToken,
    String? returnUrl,
    String? paymentSource,
    bool? isMobile,
  }) = _Sub2ApiCreateSubscriptionOrderRequest;
}

/// WeChat OAuth instructions required before an order can be created.
@freezed
abstract class Sub2ApiWechatOAuthInstructions
    with _$Sub2ApiWechatOAuthInstructions {
  const factory Sub2ApiWechatOAuthInstructions({
    required String authorizeUrl,
    required String appId,
    required String scope,
    required String redirectUrl,
  }) = _Sub2ApiWechatOAuthInstructions;
}

/// Redacted values used to invoke a WeChat JSAPI payment.
@freezed
abstract class Sub2ApiWechatJsApiInstructions
    with _$Sub2ApiWechatJsApiInstructions {
  const factory Sub2ApiWechatJsApiInstructions({
    required String appId,
    required String timeStamp,
    required String nonceStr,
    required Sub2ApiCheckoutSecret packageValue,
    required String signType,
    required Sub2ApiCheckoutSecret paySign,
  }) = _Sub2ApiWechatJsApiInstructions;
}

/// Result of initiating an order. The three variants mirror v0.1.155's
/// `result_type` contract and do not perform UI side effects.
@freezed
sealed class Sub2ApiCreateOrderResult with _$Sub2ApiCreateOrderResult {
  const factory Sub2ApiCreateOrderResult.orderCreated({
    required int orderId,
    required Sub2ApiDecimal amount,
    required Sub2ApiDecimal payAmount,
    required Sub2ApiDecimal feeRate,
    required String status,
    required String paymentType,
    required String outTradeNo,
    required String currency,
    required DateTime expiresAt,
    Sub2ApiCheckoutSecret? payUrl,
    Sub2ApiCheckoutSecret? qrCode,
    Sub2ApiCheckoutSecret? clientSecret,
    String? intentId,
    String? countryCode,
    String? paymentEnvironment,
    String? paymentMode,
    Sub2ApiCheckoutSecret? resumeToken,
  }) = Sub2ApiOrderCreated;

  const factory Sub2ApiCreateOrderResult.oauthRequired({
    required Sub2ApiDecimal amount,
    required Sub2ApiDecimal payAmount,
    required Sub2ApiDecimal feeRate,
    required String paymentType,
    required Sub2ApiWechatOAuthInstructions oauth,
  }) = Sub2ApiOrderOAuthRequired;

  const factory Sub2ApiCreateOrderResult.jsapiReady({
    required int orderId,
    required Sub2ApiDecimal amount,
    required Sub2ApiDecimal payAmount,
    required Sub2ApiDecimal feeRate,
    required String status,
    required String paymentType,
    required String outTradeNo,
    required String currency,
    required DateTime expiresAt,
    required Sub2ApiWechatJsApiInstructions jsapi,
    Sub2ApiCheckoutSecret? resumeToken,
  }) = Sub2ApiOrderJsapiReady;
}
