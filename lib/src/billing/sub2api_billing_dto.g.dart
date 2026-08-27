// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub2api_billing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sub2ApiPaymentConfigDto _$Sub2ApiPaymentConfigDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiPaymentConfigDto(
  enabled: json['enabled'] as bool,
  minAmount: json['min_amount'] as num,
  maxAmount: json['max_amount'] as num,
  dailyLimit: json['daily_limit'] as num,
  orderTimeoutMinutes: (json['order_timeout_minutes'] as num).toInt(),
  maxPendingOrders: (json['max_pending_orders'] as num).toInt(),
  enabledPaymentTypes: (json['enabled_payment_types'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  balanceDisabled: json['balance_disabled'] as bool,
  balanceRechargeMultiplier: json['balance_recharge_multiplier'] as num,
  subscriptionUsdToCnyRate: json['subscription_usd_to_cny_rate'] as num,
  rechargeFeeRate: json['recharge_fee_rate'] as num,
  loadBalanceStrategy: json['load_balance_strategy'] as String,
  productNamePrefix: json['product_name_prefix'] as String,
  productNameSuffix: json['product_name_suffix'] as String,
  helpImageUrl: json['help_image_url'] as String,
  helpText: json['help_text'] as String,
  stripePublishableKey: json['stripe_publishable_key'] as String?,
  cancelRateLimitEnabled: json['cancel_rate_limit_enabled'] as bool,
  cancelRateLimitMax: (json['cancel_rate_limit_max'] as num).toInt(),
  cancelRateLimitWindow: (json['cancel_rate_limit_window'] as num).toInt(),
  cancelRateLimitUnit: json['cancel_rate_limit_unit'] as String,
  cancelRateLimitMode: json['cancel_rate_limit_window_mode'] as String,
  alipayForceQrCode: json['alipay_force_qrcode'] as bool,
  alipayMobilePrecreateDeepLink:
      json['alipay_mobile_precreate_deep_link'] as bool,
);

Sub2ApiPaymentMethodLimitsDto _$Sub2ApiPaymentMethodLimitsDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiPaymentMethodLimitsDto(
  paymentType: json['payment_type'] as String,
  displayName: json['display_name'] as String?,
  currency: json['currency'] as String,
  feeRate: json['fee_rate'] as num,
  dailyLimit: json['daily_limit'] as num,
  singleMin: json['single_min'] as num,
  singleMax: json['single_max'] as num,
);

Sub2ApiPaymentLimitsDto _$Sub2ApiPaymentLimitsDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiPaymentLimitsDto(
  methods: (json['methods'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(
      k,
      Sub2ApiPaymentMethodLimitsDto.fromJson(e as Map<String, dynamic>),
    ),
  ),
  globalMin: json['global_min'] as num,
  globalMax: json['global_max'] as num,
);

Sub2ApiPaymentPlanDto _$Sub2ApiPaymentPlanDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiPaymentPlanDto(
  id: (json['id'] as num).toInt(),
  groupId: (json['group_id'] as num).toInt(),
  groupPlatform: json['group_platform'] as String,
  groupName: json['group_name'] as String,
  rateMultiplier: json['rate_multiplier'] as num,
  peakRateEnabled: json['peak_rate_enabled'] as bool,
  peakStart: json['peak_start'] as String,
  peakEnd: json['peak_end'] as String,
  peakRateMultiplier: json['peak_rate_multiplier'] as num,
  name: json['name'] as String,
  description: json['description'] as String,
  price: json['price'] as num,
  validityDays: (json['validity_days'] as num).toInt(),
  validityUnit: json['validity_unit'] as String,
  features: json['features'],
  productName: json['product_name'] as String,
  originalPrice: json['original_price'] as num?,
  currency: json['currency'] as String?,
  forSale: json['for_sale'] as bool?,
  sortOrder: (json['sort_order'] as num?)?.toInt(),
  dailyLimitUsd: json['daily_limit_usd'] as num?,
  weeklyLimitUsd: json['weekly_limit_usd'] as num?,
  monthlyLimitUsd: json['monthly_limit_usd'] as num?,
  supportedModelScopes: (json['supported_model_scopes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Sub2ApiCheckoutInfoDto _$Sub2ApiCheckoutInfoDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiCheckoutInfoDto(
  methods: (json['methods'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(
      k,
      Sub2ApiPaymentMethodLimitsDto.fromJson(e as Map<String, dynamic>),
    ),
  ),
  globalMin: json['global_min'] as num,
  globalMax: json['global_max'] as num,
  plans: (json['plans'] as List<dynamic>)
      .map((e) => Sub2ApiPaymentPlanDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  balanceDisabled: json['balance_disabled'] as bool,
  balanceRechargeMultiplier: json['balance_recharge_multiplier'] as num,
  subscriptionUsdToCnyRate: json['subscription_usd_to_cny_rate'] as num,
  rechargeFeeRate: json['recharge_fee_rate'] as num,
  helpText: json['help_text'] as String,
  helpImageUrl: json['help_image_url'] as String,
  alipayForceQrCode: json['alipay_force_qrcode'] as bool,
  alipayMobilePrecreateDeepLink:
      json['alipay_mobile_precreate_deep_link'] as bool,
  stripePublishableKey: json['stripe_publishable_key'] as String?,
);

Sub2ApiPaymentOrderDto _$Sub2ApiPaymentOrderDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiPaymentOrderDto(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  amount: json['amount'] as num,
  payAmount: json['pay_amount'] as num,
  feeRate: json['fee_rate'] as num,
  currency: json['currency'] as String,
  paymentType: json['payment_type'] as String,
  outTradeNo: json['out_trade_no'] as String,
  status: json['status'] as String,
  orderType: json['order_type'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  expiresAt: DateTime.parse(json['expires_at'] as String),
  refundAmount: json['refund_amount'] as num,
  paidAt: json['paid_at'] == null
      ? null
      : DateTime.parse(json['paid_at'] as String),
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
  refundReason: json['refund_reason'] as String?,
  refundRequestedAt: json['refund_requested_at'] == null
      ? null
      : DateTime.parse(json['refund_requested_at'] as String),
  refundRequestedBy: json['refund_requested_by'] as String?,
  refundRequestReason: json['refund_request_reason'] as String?,
  planId: (json['plan_id'] as num?)?.toInt(),
  providerInstanceId: json['provider_instance_id'] as String?,
);

Sub2ApiWechatOAuthDto _$Sub2ApiWechatOAuthDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiWechatOAuthDto(
  authorizeUrl: json['authorize_url'] as String,
  appId: json['appid'] as String,
  scope: json['scope'] as String,
  redirectUrl: json['redirect_url'] as String,
);

Sub2ApiWechatJsApiDto _$Sub2ApiWechatJsApiDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiWechatJsApiDto(
  appId: json['appId'] as String,
  timeStamp: json['timeStamp'] as String,
  nonceStr: json['nonceStr'] as String,
  packageValue: json['package'] as String,
  signType: json['signType'] as String,
  paySign: json['paySign'] as String,
);

Sub2ApiCreateOrderDto _$Sub2ApiCreateOrderDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiCreateOrderDto(
  amount: json['amount'] as num,
  paymentType: json['payment_type'] as String,
  orderType: json['order_type'] as String,
  planId: (json['plan_id'] as num).toInt(),
  openId: json['openid'] as String?,
  wechatResumeToken: json['wechat_resume_token'] as String?,
  returnUrl: json['return_url'] as String?,
  paymentSource: json['payment_source'] as String?,
  isMobile: json['is_mobile'] as bool?,
);

Map<String, dynamic> _$Sub2ApiCreateOrderDtoToJson(
  Sub2ApiCreateOrderDto instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'payment_type': instance.paymentType,
  'openid': ?instance.openId,
  'wechat_resume_token': ?instance.wechatResumeToken,
  'return_url': ?instance.returnUrl,
  'payment_source': ?instance.paymentSource,
  'order_type': instance.orderType,
  'plan_id': instance.planId,
  'is_mobile': ?instance.isMobile,
};

Sub2ApiVerifyOrderDto _$Sub2ApiVerifyOrderDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiVerifyOrderDto(outTradeNo: json['out_trade_no'] as String);

Map<String, dynamic> _$Sub2ApiVerifyOrderDtoToJson(
  Sub2ApiVerifyOrderDto instance,
) => <String, dynamic>{'out_trade_no': instance.outTradeNo};

Map<String, dynamic> _$Sub2ApiRefundRequestDtoToJson(
  Sub2ApiRefundRequestDto instance,
) => <String, dynamic>{'reason': instance.reason};

Map<String, dynamic> _$Sub2ApiResolveOrderDtoToJson(
  Sub2ApiResolveOrderDto instance,
) => <String, dynamic>{'resume_token': instance.resumeToken};

Sub2ApiPublicOrderVerificationDto _$Sub2ApiPublicOrderVerificationDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiPublicOrderVerificationDto(
  outTradeNo: json['out_trade_no'] as String,
  status: json['status'] as String,
  paid: json['paid'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  expiresAt: DateTime.parse(json['expires_at'] as String),
  paidAt: json['paid_at'] == null
      ? null
      : DateTime.parse(json['paid_at'] as String),
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
);

Sub2ApiPublicPaymentOrderDto _$Sub2ApiPublicPaymentOrderDtoFromJson(
  Map<String, dynamic> json,
) => Sub2ApiPublicPaymentOrderDto(
  id: (json['id'] as num).toInt(),
  outTradeNo: json['out_trade_no'] as String,
  amount: json['amount'] as num,
  payAmount: json['pay_amount'] as num,
  feeRate: json['fee_rate'] as num,
  currency: json['currency'] as String,
  paymentType: json['payment_type'] as String,
  orderType: json['order_type'] as String,
  status: json['status'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  expiresAt: DateTime.parse(json['expires_at'] as String),
  refundAmount: json['refund_amount'] as num,
  paidAt: json['paid_at'] == null
      ? null
      : DateTime.parse(json['paid_at'] as String),
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
  refundReason: json['refund_reason'] as String?,
  refundRequestedAt: json['refund_requested_at'] == null
      ? null
      : DateTime.parse(json['refund_requested_at'] as String),
  refundRequestedBy: json['refund_requested_by'] as String?,
  refundRequestReason: json['refund_request_reason'] as String?,
  planId: (json['plan_id'] as num?)?.toInt(),
);
