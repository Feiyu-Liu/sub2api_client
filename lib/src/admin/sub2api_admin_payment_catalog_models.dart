import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';

enum Sub2ApiAdminPaymentProviderKey {
  easyPay,
  alipay,
  wxpay,
  stripe,
  airwallex,
}

final class Sub2ApiAdminUpdatePaymentConfigRequest {
  Sub2ApiAdminUpdatePaymentConfigRequest({
    this.enabled,
    this.minAmount,
    this.maxAmount,
    this.dailyLimit,
    this.orderTimeoutMinutes,
    this.maxPendingOrders,
    List<String>? enabledPaymentTypes,
    this.balanceDisabled,
    this.balanceRechargeMultiplier,
    this.subscriptionUsdToCnyRate,
    this.rechargeFeeRate,
    this.loadBalanceStrategy,
    this.productNamePrefix,
    this.productNameSuffix,
    this.helpImageUrl,
    this.helpText,
    this.cancelRateLimitEnabled,
    this.cancelRateLimitMax,
    this.cancelRateLimitWindow,
    this.cancelRateLimitUnit,
    this.cancelRateLimitMode,
    this.alipayForceQrCode,
    this.alipayMobilePrecreateDeepLink,
    this.visibleMethodAlipaySource,
    this.visibleMethodWxpaySource,
    this.visibleMethodAlipayEnabled,
    this.visibleMethodWxpayEnabled,
  }) : enabledPaymentTypes = enabledPaymentTypes == null
           ? null
           : List.unmodifiable(enabledPaymentTypes);

  final bool? enabled;
  final Sub2ApiDecimal? minAmount;
  final Sub2ApiDecimal? maxAmount;
  final Sub2ApiDecimal? dailyLimit;
  final int? orderTimeoutMinutes;
  final int? maxPendingOrders;
  final List<String>? enabledPaymentTypes;
  final bool? balanceDisabled;
  final Sub2ApiDecimal? balanceRechargeMultiplier;
  final Sub2ApiDecimal? subscriptionUsdToCnyRate;
  final Sub2ApiDecimal? rechargeFeeRate;
  final String? loadBalanceStrategy;
  final String? productNamePrefix;
  final String? productNameSuffix;
  final String? helpImageUrl;
  final String? helpText;
  final bool? cancelRateLimitEnabled;
  final int? cancelRateLimitMax;
  final int? cancelRateLimitWindow;
  final String? cancelRateLimitUnit;
  final String? cancelRateLimitMode;
  final bool? alipayForceQrCode;
  final bool? alipayMobilePrecreateDeepLink;
  final String? visibleMethodAlipaySource;
  final String? visibleMethodWxpaySource;
  final bool? visibleMethodAlipayEnabled;
  final bool? visibleMethodWxpayEnabled;
}

final class Sub2ApiAdminSubscriptionPlan {
  Sub2ApiAdminSubscriptionPlan({
    required this.id,
    required this.groupId,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
    required this.validityDays,
    required this.validityUnit,
    required this.features,
    required this.productName,
    required this.forSale,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
    this.originalPrice,
    this.groupPlatform,
    this.groupName,
    this.rateMultiplier,
    this.dailyLimitUsd,
    this.weeklyLimitUsd,
    this.monthlyLimitUsd,
    List<String> supportedModelScopes = const <String>[],
  }) : supportedModelScopes = List.unmodifiable(supportedModelScopes);

  final int id;
  final int groupId;
  final String name;
  final String description;
  final Sub2ApiDecimal price;
  final Sub2ApiDecimal? originalPrice;
  final String currency;
  final int validityDays;
  final String validityUnit;
  final String features;
  final String productName;
  final bool forSale;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? groupPlatform;
  final String? groupName;
  final Sub2ApiDecimal? rateMultiplier;
  final Sub2ApiDecimal? dailyLimitUsd;
  final Sub2ApiDecimal? weeklyLimitUsd;
  final Sub2ApiDecimal? monthlyLimitUsd;
  final List<String> supportedModelScopes;
}

final class Sub2ApiAdminCreateSubscriptionPlanRequest {
  const Sub2ApiAdminCreateSubscriptionPlanRequest({
    required this.groupId,
    required this.name,
    this.description = '',
    required this.price,
    this.originalPrice,
    this.currency = '',
    required this.validityDays,
    this.validityUnit = 'day',
    this.features = '',
    this.productName = '',
    this.forSale = true,
    this.sortOrder = 0,
  });
  final int groupId;
  final String name;
  final String description;
  final Sub2ApiDecimal price;
  final Sub2ApiDecimal? originalPrice;
  final String currency;
  final int validityDays;
  final String validityUnit;
  final String features;
  final String productName;
  final bool forSale;
  final int sortOrder;
}

final class Sub2ApiAdminUpdateSubscriptionPlanRequest {
  const Sub2ApiAdminUpdateSubscriptionPlanRequest({
    this.groupId,
    this.name,
    this.description,
    this.price,
    this.originalPrice,
    this.currency,
    this.validityDays,
    this.validityUnit,
    this.features,
    this.productName,
    this.forSale,
    this.sortOrder,
  });
  final int? groupId;
  final String? name;
  final String? description;
  final Sub2ApiDecimal? price;
  final Sub2ApiDecimal? originalPrice;
  final String? currency;
  final int? validityDays;
  final String? validityUnit;
  final String? features;
  final String? productName;
  final bool? forSale;
  final int? sortOrder;
}

final class Sub2ApiAdminPaymentProvider {
  Sub2ApiAdminPaymentProvider({
    required this.id,
    required this.providerKey,
    required this.name,
    required Map<String, String> visibleConfig,
    required List<String> supportedTypes,
    required this.enabled,
    required this.paymentMode,
    required this.sortOrder,
    required this.limits,
    required this.refundEnabled,
    required this.allowUserRefund,
  }) : visibleConfig = Map.unmodifiable(visibleConfig),
       supportedTypes = List.unmodifiable(supportedTypes);
  final int id;
  final Sub2ApiAdminPaymentProviderKey providerKey;
  final String name;
  final Map<String, String> visibleConfig;
  final List<String> supportedTypes;
  final bool enabled;
  final String paymentMode;
  final int sortOrder;
  final String limits;
  final bool refundEnabled;
  final bool allowUserRefund;
}

final class Sub2ApiAdminCreatePaymentProviderRequest {
  Sub2ApiAdminCreatePaymentProviderRequest({
    required this.providerKey,
    required this.name,
    required Map<String, Sub2ApiAdminCredentialSecret> config,
    required List<String> supportedTypes,
    this.enabled = true,
    this.paymentMode = '',
    this.sortOrder = 0,
    this.limits = '',
    this.refundEnabled = false,
    this.allowUserRefund = false,
  }) : config = Map.unmodifiable(config),
       supportedTypes = List.unmodifiable(supportedTypes);
  final Sub2ApiAdminPaymentProviderKey providerKey;
  final String name;
  final Map<String, Sub2ApiAdminCredentialSecret> config;
  final List<String> supportedTypes;
  final bool enabled;
  final String paymentMode;
  final int sortOrder;
  final String limits;
  final bool refundEnabled;
  final bool allowUserRefund;
}

final class Sub2ApiAdminUpdatePaymentProviderRequest {
  Sub2ApiAdminUpdatePaymentProviderRequest({
    this.name,
    Map<String, Sub2ApiAdminCredentialSecret>? config,
    List<String>? supportedTypes,
    this.enabled,
    this.paymentMode,
    this.sortOrder,
    this.limits,
    this.refundEnabled,
    this.allowUserRefund,
  }) : config = config == null ? null : Map.unmodifiable(config),
       supportedTypes = supportedTypes == null
           ? null
           : List.unmodifiable(supportedTypes);
  final String? name;
  final Map<String, Sub2ApiAdminCredentialSecret>? config;
  final List<String>? supportedTypes;
  final bool? enabled;
  final String? paymentMode;
  final int? sortOrder;
  final String? limits;
  final bool? refundEnabled;
  final bool? allowUserRefund;
}

final class Sub2ApiAdminPaymentCatalogActionResult {
  const Sub2ApiAdminPaymentCatalogActionResult({required this.message});
  final String message;
}
