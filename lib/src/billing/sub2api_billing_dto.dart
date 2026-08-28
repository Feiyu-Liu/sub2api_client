import 'package:json_annotation/json_annotation.dart';

part 'sub2api_billing_dto.g.dart';

@JsonSerializable(createToJson: false)
final class Sub2ApiPaymentConfigDto {
  const Sub2ApiPaymentConfigDto({
    required this.enabled,
    required this.minAmount,
    required this.maxAmount,
    required this.dailyLimit,
    required this.orderTimeoutMinutes,
    required this.maxPendingOrders,
    required this.enabledPaymentTypes,
    required this.balanceDisabled,
    required this.balanceRechargeMultiplier,
    required this.subscriptionUsdToCnyRate,
    required this.rechargeFeeRate,
    required this.loadBalanceStrategy,
    required this.productNamePrefix,
    required this.productNameSuffix,
    required this.helpImageUrl,
    required this.helpText,
    this.stripePublishableKey,
    required this.cancelRateLimitEnabled,
    required this.cancelRateLimitMax,
    required this.cancelRateLimitWindow,
    required this.cancelRateLimitUnit,
    required this.cancelRateLimitMode,
    required this.alipayForceQrCode,
    required this.alipayMobilePrecreateDeepLink,
  });

  factory Sub2ApiPaymentConfigDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiPaymentConfigDtoFromJson(json);

  final bool enabled;
  @JsonKey(name: 'min_amount')
  final num minAmount;
  @JsonKey(name: 'max_amount')
  final num maxAmount;
  @JsonKey(name: 'daily_limit')
  final num dailyLimit;
  @JsonKey(name: 'order_timeout_minutes')
  final int orderTimeoutMinutes;
  @JsonKey(name: 'max_pending_orders')
  final int maxPendingOrders;
  @JsonKey(name: 'enabled_payment_types')
  final List<String> enabledPaymentTypes;
  @JsonKey(name: 'balance_disabled')
  final bool balanceDisabled;
  @JsonKey(name: 'balance_recharge_multiplier')
  final num balanceRechargeMultiplier;
  @JsonKey(name: 'subscription_usd_to_cny_rate')
  final num subscriptionUsdToCnyRate;
  @JsonKey(name: 'recharge_fee_rate')
  final num rechargeFeeRate;
  @JsonKey(name: 'load_balance_strategy')
  final String loadBalanceStrategy;
  @JsonKey(name: 'product_name_prefix')
  final String productNamePrefix;
  @JsonKey(name: 'product_name_suffix')
  final String productNameSuffix;
  @JsonKey(name: 'help_image_url')
  final String helpImageUrl;
  @JsonKey(name: 'help_text')
  final String helpText;
  @JsonKey(name: 'stripe_publishable_key')
  final String? stripePublishableKey;
  @JsonKey(name: 'cancel_rate_limit_enabled')
  final bool cancelRateLimitEnabled;
  @JsonKey(name: 'cancel_rate_limit_max')
  final int cancelRateLimitMax;
  @JsonKey(name: 'cancel_rate_limit_window')
  final int cancelRateLimitWindow;
  @JsonKey(name: 'cancel_rate_limit_unit')
  final String cancelRateLimitUnit;
  @JsonKey(name: 'cancel_rate_limit_window_mode')
  final String cancelRateLimitMode;
  @JsonKey(name: 'alipay_force_qrcode')
  final bool alipayForceQrCode;
  @JsonKey(name: 'alipay_mobile_precreate_deep_link')
  final bool alipayMobilePrecreateDeepLink;
}

@JsonSerializable(createToJson: false)
final class Sub2ApiPaymentMethodLimitsDto {
  const Sub2ApiPaymentMethodLimitsDto({
    required this.paymentType,
    this.displayName,
    required this.currency,
    required this.feeRate,
    required this.dailyLimit,
    required this.singleMin,
    required this.singleMax,
  });

  factory Sub2ApiPaymentMethodLimitsDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiPaymentMethodLimitsDtoFromJson(json);

  @JsonKey(name: 'payment_type')
  final String paymentType;
  @JsonKey(name: 'display_name')
  final String? displayName;
  final String currency;
  @JsonKey(name: 'fee_rate')
  final num feeRate;
  @JsonKey(name: 'daily_limit')
  final num dailyLimit;
  @JsonKey(name: 'single_min')
  final num singleMin;
  @JsonKey(name: 'single_max')
  final num singleMax;
}

@JsonSerializable(createToJson: false)
final class Sub2ApiPaymentLimitsDto {
  const Sub2ApiPaymentLimitsDto({
    required this.methods,
    required this.globalMin,
    required this.globalMax,
  });

  factory Sub2ApiPaymentLimitsDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiPaymentLimitsDtoFromJson(json);

  final Map<String, Sub2ApiPaymentMethodLimitsDto> methods;
  @JsonKey(name: 'global_min')
  final num globalMin;
  @JsonKey(name: 'global_max')
  final num globalMax;
}

@JsonSerializable(createToJson: false)
final class Sub2ApiPaymentPlanDto {
  const Sub2ApiPaymentPlanDto({
    required this.id,
    required this.groupId,
    required this.groupPlatform,
    required this.groupName,
    required this.rateMultiplier,
    required this.peakRateEnabled,
    required this.peakStart,
    required this.peakEnd,
    required this.peakRateMultiplier,
    required this.name,
    required this.description,
    required this.price,
    required this.validityDays,
    required this.validityUnit,
    required this.features,
    required this.productName,
    this.originalPrice,
    this.currency,
    this.forSale,
    this.sortOrder,
    this.dailyLimitUsd,
    this.weeklyLimitUsd,
    this.monthlyLimitUsd,
    this.supportedModelScopes,
  });

  factory Sub2ApiPaymentPlanDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiPaymentPlanDtoFromJson(json);

  final int id;
  @JsonKey(name: 'group_id')
  final int groupId;
  @JsonKey(name: 'group_platform')
  final String groupPlatform;
  @JsonKey(name: 'group_name')
  final String groupName;
  @JsonKey(name: 'rate_multiplier')
  final num rateMultiplier;
  @JsonKey(name: 'peak_rate_enabled')
  final bool peakRateEnabled;
  @JsonKey(name: 'peak_start')
  final String peakStart;
  @JsonKey(name: 'peak_end')
  final String peakEnd;
  @JsonKey(name: 'peak_rate_multiplier')
  final num peakRateMultiplier;
  final String name;
  final String description;
  final num price;
  @JsonKey(name: 'original_price')
  final num? originalPrice;
  final String? currency;
  @JsonKey(name: 'validity_days')
  final int validityDays;
  @JsonKey(name: 'validity_unit')
  final String validityUnit;
  final Object? features;
  @JsonKey(name: 'product_name')
  final String productName;
  @JsonKey(name: 'for_sale')
  final bool? forSale;
  @JsonKey(name: 'sort_order')
  final int? sortOrder;
  @JsonKey(name: 'daily_limit_usd')
  final num? dailyLimitUsd;
  @JsonKey(name: 'weekly_limit_usd')
  final num? weeklyLimitUsd;
  @JsonKey(name: 'monthly_limit_usd')
  final num? monthlyLimitUsd;
  @JsonKey(name: 'supported_model_scopes')
  final List<String>? supportedModelScopes;
}

@JsonSerializable(createToJson: false)
final class Sub2ApiCheckoutInfoDto {
  const Sub2ApiCheckoutInfoDto({
    required this.methods,
    required this.globalMin,
    required this.globalMax,
    required this.plans,
    required this.balanceDisabled,
    required this.balanceRechargeMultiplier,
    required this.subscriptionUsdToCnyRate,
    required this.rechargeFeeRate,
    required this.helpText,
    required this.helpImageUrl,
    required this.alipayForceQrCode,
    required this.alipayMobilePrecreateDeepLink,
    this.stripePublishableKey,
  });

  factory Sub2ApiCheckoutInfoDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiCheckoutInfoDtoFromJson(json);

  final Map<String, Sub2ApiPaymentMethodLimitsDto> methods;
  @JsonKey(name: 'global_min')
  final num globalMin;
  @JsonKey(name: 'global_max')
  final num globalMax;
  final List<Sub2ApiPaymentPlanDto> plans;
  @JsonKey(name: 'balance_disabled')
  final bool balanceDisabled;
  @JsonKey(name: 'balance_recharge_multiplier')
  final num balanceRechargeMultiplier;
  @JsonKey(name: 'subscription_usd_to_cny_rate')
  final num subscriptionUsdToCnyRate;
  @JsonKey(name: 'recharge_fee_rate')
  final num rechargeFeeRate;
  @JsonKey(name: 'help_text')
  final String helpText;
  @JsonKey(name: 'help_image_url')
  final String helpImageUrl;
  @JsonKey(name: 'stripe_publishable_key')
  final String? stripePublishableKey;
  @JsonKey(name: 'alipay_force_qrcode')
  final bool alipayForceQrCode;
  @JsonKey(name: 'alipay_mobile_precreate_deep_link')
  final bool alipayMobilePrecreateDeepLink;
}

@JsonSerializable(createToJson: false)
final class Sub2ApiPaymentOrderDto {
  const Sub2ApiPaymentOrderDto({
    required this.id,
    required this.userId,
    required this.amount,
    required this.payAmount,
    required this.feeRate,
    required this.currency,
    required this.paymentType,
    required this.outTradeNo,
    required this.status,
    required this.orderType,
    required this.createdAt,
    required this.expiresAt,
    required this.refundAmount,
    this.paidAt,
    this.completedAt,
    this.refundReason,
    this.refundRequestedAt,
    this.refundRequestedBy,
    this.refundRequestReason,
    this.planId,
    this.providerInstanceId,
  });

  factory Sub2ApiPaymentOrderDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiPaymentOrderDtoFromJson(json);

  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  final num amount;
  @JsonKey(name: 'pay_amount')
  final num payAmount;
  @JsonKey(name: 'fee_rate')
  final num feeRate;
  final String currency;
  @JsonKey(name: 'payment_type')
  final String paymentType;
  @JsonKey(name: 'out_trade_no')
  final String outTradeNo;
  final String status;
  @JsonKey(name: 'order_type')
  final String orderType;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'expires_at')
  final DateTime expiresAt;
  @JsonKey(name: 'paid_at')
  final DateTime? paidAt;
  @JsonKey(name: 'completed_at')
  final DateTime? completedAt;
  @JsonKey(name: 'refund_amount')
  final num refundAmount;
  @JsonKey(name: 'refund_reason')
  final String? refundReason;
  @JsonKey(name: 'refund_requested_at')
  final DateTime? refundRequestedAt;
  @JsonKey(name: 'refund_requested_by')
  final String? refundRequestedBy;
  @JsonKey(name: 'refund_request_reason')
  final String? refundRequestReason;
  @JsonKey(name: 'plan_id')
  final int? planId;
  @JsonKey(name: 'provider_instance_id')
  final String? providerInstanceId;
}

@JsonSerializable(createToJson: false)
final class Sub2ApiWechatOAuthDto {
  const Sub2ApiWechatOAuthDto({
    required this.authorizeUrl,
    required this.appId,
    required this.scope,
    required this.redirectUrl,
  });

  factory Sub2ApiWechatOAuthDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiWechatOAuthDtoFromJson(json);

  @JsonKey(name: 'authorize_url')
  final String authorizeUrl;
  @JsonKey(name: 'appid')
  final String appId;
  final String scope;
  @JsonKey(name: 'redirect_url')
  final String redirectUrl;
}

@JsonSerializable(createToJson: false)
final class Sub2ApiWechatJsApiDto {
  const Sub2ApiWechatJsApiDto({
    required this.appId,
    required this.timeStamp,
    required this.nonceStr,
    required this.packageValue,
    required this.signType,
    required this.paySign,
  });

  factory Sub2ApiWechatJsApiDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiWechatJsApiDtoFromJson(json);

  @JsonKey(name: 'appId')
  final String appId;
  @JsonKey(name: 'timeStamp')
  final String timeStamp;
  @JsonKey(name: 'nonceStr')
  final String nonceStr;
  @JsonKey(name: 'package')
  final String packageValue;
  @JsonKey(name: 'signType')
  final String signType;
  @JsonKey(name: 'paySign')
  final String paySign;
}

@JsonSerializable(includeIfNull: false)
final class Sub2ApiCreateOrderDto {
  const Sub2ApiCreateOrderDto({
    required this.amount,
    required this.paymentType,
    required this.orderType,
    required this.planId,
    this.openId,
    this.wechatResumeToken,
    this.returnUrl,
    this.paymentSource,
    this.isMobile,
  });

  factory Sub2ApiCreateOrderDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiCreateOrderDtoFromJson(json);

  Map<String, Object?> toJson() => _$Sub2ApiCreateOrderDtoToJson(this);

  final num amount;
  @JsonKey(name: 'payment_type')
  final String paymentType;
  @JsonKey(name: 'openid')
  final String? openId;
  @JsonKey(name: 'wechat_resume_token')
  final String? wechatResumeToken;
  @JsonKey(name: 'return_url')
  final String? returnUrl;
  @JsonKey(name: 'payment_source')
  final String? paymentSource;
  @JsonKey(name: 'order_type')
  final String orderType;
  @JsonKey(name: 'plan_id')
  final int planId;
  @JsonKey(name: 'is_mobile')
  final bool? isMobile;
}

@JsonSerializable()
final class Sub2ApiVerifyOrderDto {
  const Sub2ApiVerifyOrderDto({required this.outTradeNo});

  factory Sub2ApiVerifyOrderDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiVerifyOrderDtoFromJson(json);

  Map<String, Object?> toJson() => _$Sub2ApiVerifyOrderDtoToJson(this);

  @JsonKey(name: 'out_trade_no')
  final String outTradeNo;
}

@JsonSerializable(createFactory: false)
final class Sub2ApiRefundRequestDto {
  const Sub2ApiRefundRequestDto({required this.reason});

  final String reason;

  Map<String, Object?> toJson() => _$Sub2ApiRefundRequestDtoToJson(this);
}

@JsonSerializable(createFactory: false)
final class Sub2ApiResolveOrderDto {
  const Sub2ApiResolveOrderDto({required this.resumeToken});

  @JsonKey(name: 'resume_token')
  final String resumeToken;

  Map<String, Object?> toJson() => _$Sub2ApiResolveOrderDtoToJson(this);
}

@JsonSerializable(createToJson: false)
final class Sub2ApiPublicOrderVerificationDto {
  const Sub2ApiPublicOrderVerificationDto({
    required this.outTradeNo,
    required this.status,
    required this.paid,
    required this.createdAt,
    required this.expiresAt,
    this.paidAt,
    this.completedAt,
  });

  factory Sub2ApiPublicOrderVerificationDto.fromJson(
    Map<String, Object?> json,
  ) => _$Sub2ApiPublicOrderVerificationDtoFromJson(json);

  @JsonKey(name: 'out_trade_no')
  final String outTradeNo;
  final String status;
  final bool paid;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'expires_at')
  final DateTime expiresAt;
  @JsonKey(name: 'paid_at')
  final DateTime? paidAt;
  @JsonKey(name: 'completed_at')
  final DateTime? completedAt;
}

@JsonSerializable(createToJson: false)
final class Sub2ApiPublicPaymentOrderDto {
  const Sub2ApiPublicPaymentOrderDto({
    required this.id,
    required this.outTradeNo,
    required this.amount,
    required this.payAmount,
    required this.feeRate,
    required this.currency,
    required this.paymentType,
    required this.orderType,
    required this.status,
    required this.createdAt,
    required this.expiresAt,
    required this.refundAmount,
    this.paidAt,
    this.completedAt,
    this.refundReason,
    this.refundRequestedAt,
    this.refundRequestedBy,
    this.refundRequestReason,
    this.planId,
  });

  factory Sub2ApiPublicPaymentOrderDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiPublicPaymentOrderDtoFromJson(json);

  final int id;
  @JsonKey(name: 'out_trade_no')
  final String outTradeNo;
  final num amount;
  @JsonKey(name: 'pay_amount')
  final num payAmount;
  @JsonKey(name: 'fee_rate')
  final num feeRate;
  final String currency;
  @JsonKey(name: 'payment_type')
  final String paymentType;
  @JsonKey(name: 'order_type')
  final String orderType;
  final String status;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'expires_at')
  final DateTime expiresAt;
  @JsonKey(name: 'paid_at')
  final DateTime? paidAt;
  @JsonKey(name: 'completed_at')
  final DateTime? completedAt;
  @JsonKey(name: 'refund_amount')
  final num refundAmount;
  @JsonKey(name: 'refund_reason')
  final String? refundReason;
  @JsonKey(name: 'refund_requested_at')
  final DateTime? refundRequestedAt;
  @JsonKey(name: 'refund_requested_by')
  final String? refundRequestedBy;
  @JsonKey(name: 'refund_request_reason')
  final String? refundRequestReason;
  @JsonKey(name: 'plan_id')
  final int? planId;
}
