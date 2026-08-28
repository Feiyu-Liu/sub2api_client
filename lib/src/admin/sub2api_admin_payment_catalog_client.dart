import 'package:dio/dio.dart';

import '../billing/sub2api_billing_models.dart';
import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_payment_catalog_models.dart';
import 'wire/admin_payment_catalog_wire_mapper.dart';
import 'wire/admin_payment_catalog_wire_service.dart';

abstract interface class Sub2ApiAdminPaymentCatalogClient {
  Future<Sub2ApiPaymentConfig> getConfig({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPaymentCatalogActionResult> updateConfig(
    Sub2ApiAdminUpdatePaymentConfigRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<List<Sub2ApiAdminSubscriptionPlan>> listPlans({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSubscriptionPlan> createPlan(
    Sub2ApiAdminCreateSubscriptionPlanRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminSubscriptionPlan> updatePlan(
    int id,
    Sub2ApiAdminUpdateSubscriptionPlanRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPaymentCatalogActionResult> deletePlan(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<List<Sub2ApiAdminPaymentProvider>> listProviders({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPaymentProvider> createProvider(
    Sub2ApiAdminCreatePaymentProviderRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPaymentProvider> updateProvider(
    int id,
    Sub2ApiAdminUpdatePaymentProviderRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPaymentCatalogActionResult> deleteProvider(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminPaymentCatalogClient createSub2ApiAdminPaymentCatalogClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiProtectedCreatedMutationExecutor createdMutationExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, createdMutationExecutor, credentialMode);

final class _Client implements Sub2ApiAdminPaymentCatalogClient {
  _Client(Dio dio, this._executor, this._createdExecutor, this._mode)
    : _service = AdminPaymentCatalogWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiProtectedCreatedMutationExecutor _createdExecutor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminPaymentCatalogWireService _service;
  String? _a(String? v) => _mode == Sub2ApiAdminCredentialMode.jwt ? v : null;
  String? _k(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? v : null;

  @override
  Future<Sub2ApiPaymentConfig> getConfig({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.getConfig(c, o, _a(v), _k(v)),
    decode: mapAdminPaymentConfig,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminPaymentCatalogActionResult> updateConfig(
    Sub2ApiAdminUpdatePaymentConfigRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final b = <String, Object?>{
      'enabled': ?r.enabled,
      'min_amount': ?_number(r.minAmount),
      'max_amount': ?_number(r.maxAmount),
      'daily_limit': ?_number(r.dailyLimit),
      'order_timeout_minutes': ?r.orderTimeoutMinutes,
      'max_pending_orders': ?r.maxPendingOrders,
      'enabled_payment_types': ?r.enabledPaymentTypes,
      'balance_disabled': ?r.balanceDisabled,
      'balance_recharge_multiplier': ?_number(r.balanceRechargeMultiplier),
      'subscription_usd_to_cny_rate': ?_number(r.subscriptionUsdToCnyRate),
      'recharge_fee_rate': ?_number(r.rechargeFeeRate),
      'load_balance_strategy': ?r.loadBalanceStrategy?.trim(),
      'product_name_prefix': ?r.productNamePrefix?.trim(),
      'product_name_suffix': ?r.productNameSuffix?.trim(),
      'help_image_url': ?r.helpImageUrl?.trim(),
      'help_text': ?r.helpText?.trim(),
      'cancel_rate_limit_enabled': ?r.cancelRateLimitEnabled,
      'cancel_rate_limit_max': ?r.cancelRateLimitMax,
      'cancel_rate_limit_window': ?r.cancelRateLimitWindow,
      'cancel_rate_limit_unit': ?r.cancelRateLimitUnit?.trim(),
      'cancel_rate_limit_window_mode': ?r.cancelRateLimitMode?.trim(),
      'alipay_force_qrcode': ?r.alipayForceQrCode,
      'alipay_mobile_precreate_deep_link': ?r.alipayMobilePrecreateDeepLink,
      'payment_visible_method_alipay_source': ?r.visibleMethodAlipaySource
          ?.trim(),
      'payment_visible_method_wxpay_source': ?r.visibleMethodWxpaySource
          ?.trim(),
      'payment_visible_method_alipay_enabled': ?r.visibleMethodAlipayEnabled,
      'payment_visible_method_wxpay_enabled': ?r.visibleMethodWxpayEnabled,
    };
    if (b.isEmpty) throw _validation('admin.payment.empty_config_update');
    if (r.balanceRechargeMultiplier != null &&
        r.balanceRechargeMultiplier!.compareTo(Sub2ApiDecimal.zero()) <= 0) {
      throw _validation('admin.payment.invalid_balance_multiplier');
    }
    if (r.subscriptionUsdToCnyRate != null &&
        r.subscriptionUsdToCnyRate!.compareTo(Sub2ApiDecimal.zero()) < 0) {
      throw _validation('admin.payment.invalid_subscription_rate');
    }
    if (r.rechargeFeeRate != null) {
      final f = r.rechargeFeeRate!;
      if (f.compareTo(Sub2ApiDecimal.zero()) < 0 ||
          f.compareTo(Sub2ApiDecimal.parse('100')) > 0) {
        throw _validation('admin.payment.invalid_fee_rate');
      }
    }
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.updateConfig(b, c, o, _a(v), _k(v)),
      decode: mapAdminPaymentCatalogAction,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminSubscriptionPlan>> listPlans({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.listPlans(c, o, _a(v), _k(v)),
    decode: mapAdminPaymentPlans,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminSubscriptionPlan> createPlan(
    Sub2ApiAdminCreateSubscriptionPlanRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validatePlan(
      r.groupId,
      r.name,
      r.price,
      r.originalPrice,
      r.validityDays,
      r.validityUnit,
    );
    return _createdExecutor.protectedNonReplayableCreatedRequest(
      send: (c, o, v) =>
          _service.createPlan(_createPlanBody(r), c, o, _a(v), _k(v)),
      decode: mapAdminPaymentPlan,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminSubscriptionPlan> updatePlan(
    int id,
    Sub2ApiAdminUpdateSubscriptionPlanRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    final b = <String, Object?>{
      'group_id': ?r.groupId,
      'name': ?r.name?.trim(),
      'description': ?r.description?.trim(),
      'price': ?_number(r.price),
      'original_price': ?_number(r.originalPrice),
      'currency': ?r.currency?.trim(),
      'validity_days': ?r.validityDays,
      'validity_unit': ?r.validityUnit?.trim(),
      'features': ?r.features?.trim(),
      'product_name': ?r.productName?.trim(),
      'for_sale': ?r.forSale,
      'sort_order': ?r.sortOrder,
    };
    if (b.isEmpty) throw _validation('admin.payment.empty_plan_update');
    if (r.groupId != null && r.groupId! <= 0 ||
        r.name != null && r.name!.trim().isEmpty ||
        r.price != null && r.price!.compareTo(Sub2ApiDecimal.zero()) <= 0 ||
        r.originalPrice != null &&
            r.originalPrice!.compareTo(Sub2ApiDecimal.zero()) < 0 ||
        r.validityDays != null && r.validityDays! <= 0 ||
        r.validityUnit != null && r.validityUnit!.trim().isEmpty) {
      throw _validation('admin.payment.invalid_plan');
    }
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.updatePlan(id, b, c, o, _a(v), _k(v)),
      decode: mapAdminPaymentPlan,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPaymentCatalogActionResult> deletePlan(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.deletePlan(id, c, o, _a(v), _k(v)),
      decode: mapAdminPaymentCatalogAction,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminPaymentProvider>> listProviders({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, v) => _service.listProviders(c, o, _a(v), _k(v)),
    decode: mapAdminPaymentProviders,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminPaymentProvider> createProvider(
    Sub2ApiAdminCreatePaymentProviderRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (r.name.trim().isEmpty) {
      throw _validation('admin.payment.provider_name_required');
    }
    return _createdExecutor.protectedNonReplayableCreatedRequest(
      send: (c, o, v) =>
          _service.createProvider(_providerCreateBody(r), c, o, _a(v), _k(v)),
      decode: mapAdminPaymentProvider,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPaymentProvider> updateProvider(
    int id,
    Sub2ApiAdminUpdatePaymentProviderRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    final b = <String, Object?>{
      'name': ?r.name?.trim(),
      'config': ?r.config?.map((k, v) => MapEntry(k, v.reveal())),
      'supported_types': ?r.supportedTypes,
      'enabled': ?r.enabled,
      'payment_mode': ?r.paymentMode?.trim(),
      'sort_order': ?r.sortOrder,
      'limits': ?r.limits?.trim(),
      'refund_enabled': ?r.refundEnabled,
      'allow_user_refund': ?r.allowUserRefund,
    };
    if (b.isEmpty) throw _validation('admin.payment.empty_provider_update');
    if (r.name != null && r.name!.trim().isEmpty) {
      throw _validation('admin.payment.provider_name_required');
    }
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.updateProvider(id, b, c, o, _a(v), _k(v)),
      decode: mapAdminPaymentProvider,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPaymentCatalogActionResult> deleteProvider(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, v) => _service.deleteProvider(id, c, o, _a(v), _k(v)),
      decode: mapAdminPaymentCatalogAction,
      requestOptions: requestOptions,
    );
  }
}

Map<String, Object?> _createPlanBody(
  Sub2ApiAdminCreateSubscriptionPlanRequest r,
) => {
  'group_id': r.groupId,
  'name': r.name.trim(),
  'description': r.description.trim(),
  'price': _number(r.price),
  'original_price': ?_number(r.originalPrice),
  'currency': r.currency.trim(),
  'validity_days': r.validityDays,
  'validity_unit': r.validityUnit.trim(),
  'features': r.features.trim(),
  'product_name': r.productName.trim(),
  'for_sale': r.forSale,
  'sort_order': r.sortOrder,
};
Map<String, Object?> _providerCreateBody(
  Sub2ApiAdminCreatePaymentProviderRequest r,
) => {
  'provider_key': _providerKey(r.providerKey),
  'name': r.name.trim(),
  'config': r.config.map((k, v) => MapEntry(k, v.reveal())),
  'supported_types': r.supportedTypes,
  'enabled': r.enabled,
  'payment_mode': r.paymentMode.trim(),
  'sort_order': r.sortOrder,
  'limits': r.limits.trim(),
  'refund_enabled': r.refundEnabled,
  'allow_user_refund': r.allowUserRefund,
};
void _validatePlan(
  int groupId,
  String name,
  Sub2ApiDecimal price,
  Sub2ApiDecimal? original,
  int days,
  String unit,
) {
  if (groupId <= 0 ||
      name.trim().isEmpty ||
      price.compareTo(Sub2ApiDecimal.zero()) <= 0 ||
      original != null && original.compareTo(Sub2ApiDecimal.zero()) < 0 ||
      days <= 0 ||
      unit.trim().isEmpty) {
    throw _validation('admin.payment.invalid_plan');
  }
}

void _id(int id) {
  if (id <= 0) throw _validation('admin.payment.invalid_id');
}

double? _number(Sub2ApiDecimal? d) {
  if (d == null) return null;
  final v = double.tryParse(d.toJson());
  if (v == null || !v.isFinite || Sub2ApiDecimal.parse(v.toString()) != d) {
    throw _validation('admin.payment.amount_not_representable');
  }
  return v;
}

String _providerKey(Sub2ApiAdminPaymentProviderKey v) => switch (v) {
  Sub2ApiAdminPaymentProviderKey.easyPay => 'epay',
  Sub2ApiAdminPaymentProviderKey.alipay => 'alipay',
  Sub2ApiAdminPaymentProviderKey.wxpay => 'wxpay',
  Sub2ApiAdminPaymentProviderKey.stripe => 'stripe',
  Sub2ApiAdminPaymentProviderKey.airwallex => 'airwallex',
};
Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
