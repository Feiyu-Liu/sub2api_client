import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_billing_dto.dart';
import 'sub2api_billing_mapper.dart';
import 'sub2api_billing_models.dart';
import 'sub2api_billing_service.dart';

/// Typed authenticated Billing endpoints for the v0.1.155 user API.
abstract interface class Sub2ApiBillingClient {
  /// Reads payment configuration.
  Future<Sub2ApiPaymentConfig> config({Sub2ApiRequestOptions? requestOptions});

  /// Reads limits for available payment methods.
  Future<Sub2ApiPaymentLimits> limits({Sub2ApiRequestOptions? requestOptions});

  /// Lists subscription plans currently available for purchase.
  Future<List<Sub2ApiSubscriptionPlan>> plans({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads one-call data needed to render a checkout UI.
  Future<Sub2ApiCheckoutInfo> checkoutInfo({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Creates a balance recharge order without automatic replay.
  Future<Sub2ApiCreateOrderResult> createBalanceOrder(
    Sub2ApiCreateBalanceOrderRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Creates a subscription order without automatic replay.
  Future<Sub2ApiCreateOrderResult> createSubscriptionOrder(
    Sub2ApiCreateSubscriptionOrderRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Lists orders owned by the authenticated user.
  Future<Sub2ApiPage<Sub2ApiPaymentOrder>> listOwnOrders(
    Sub2ApiPaymentOrderQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads one owned order.
  Future<Sub2ApiPaymentOrder> order(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Verifies an owned order by provider trade number.
  Future<Sub2ApiPaymentOrder> verifyOrder(
    String outTradeNo, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

/// Creates the package-internal Billing implementation.
///
/// This factory is deliberately not exported from `sub2api_client.dart`.
Sub2ApiBillingClient createSub2ApiBillingClient({
  required Sub2ApiRequestExecutor requestExecutor,
  required Dio dio,
}) => _Sub2ApiBillingClient(requestExecutor: requestExecutor, dio: dio);

final class _Sub2ApiBillingClient implements Sub2ApiBillingClient {
  _Sub2ApiBillingClient({
    required Sub2ApiRequestExecutor requestExecutor,
    required Dio dio,
  }) : _requestExecutor = requestExecutor,
       _service = Sub2ApiBillingService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final Sub2ApiBillingService _service;

  @override
  Future<Sub2ApiPaymentConfig> config({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: _service.config,
    decode: mapPaymentConfig,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiPaymentLimits> limits({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: _service.limits,
    decode: mapPaymentLimits,
    requestOptions: requestOptions,
  );

  @override
  Future<List<Sub2ApiSubscriptionPlan>> plans({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: _service.plans,
    decode: mapPaymentPlans,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiCheckoutInfo> checkoutInfo({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: _service.checkoutInfo,
    decode: mapCheckoutInfo,
    requestOptions: requestOptions,
  );

  /// Creates a balance recharge order. The operation must never auto-retry.
  @override
  Future<Sub2ApiCreateOrderResult> createBalanceOrder(
    Sub2ApiCreateBalanceOrderRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _createOrder(
    Sub2ApiCreateOrderDto(
      amount: _float64Amount(request.amount),
      paymentType: request.paymentType,
      openId: request.openId,
      wechatResumeToken: request.wechatResumeToken?.reveal(),
      returnUrl: request.returnUrl,
      paymentSource: request.paymentSource,
      orderType: 'balance',
      planId: 0,
      isMobile: request.isMobile,
    ),
    requestOptions: requestOptions,
  );

  /// Creates a subscription order. The server is authoritative for plan price.
  @override
  Future<Sub2ApiCreateOrderResult> createSubscriptionOrder(
    Sub2ApiCreateSubscriptionOrderRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _createOrder(
    Sub2ApiCreateOrderDto(
      amount: 0,
      paymentType: request.paymentType,
      openId: request.openId,
      wechatResumeToken: request.wechatResumeToken?.reveal(),
      returnUrl: request.returnUrl,
      paymentSource: request.paymentSource,
      orderType: 'subscription',
      planId: request.planId,
      isMobile: request.isMobile,
    ),
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiPage<Sub2ApiPaymentOrder>> listOwnOrders(
    Sub2ApiPaymentOrderQuery query, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) => _service.listOrders(
      query.page,
      query.pageSize,
      query.status,
      query.orderType,
      query.paymentType,
      cancelToken,
      options,
      authorization,
    ),
    decode: mapPaymentOrderPage,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiPaymentOrder> order(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) =>
        _service.order(id, cancelToken, options, authorization),
    decode: mapPaymentOrder,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiPaymentOrder> verifyOrder(
    String outTradeNo, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) => _service.verifyOrder(
      Sub2ApiVerifyOrderDto(outTradeNo: outTradeNo),
      cancelToken,
      options,
      authorization,
    ),
    decode: mapPaymentOrder,
    requestOptions: requestOptions,
  );

  Future<Sub2ApiCreateOrderResult> _createOrder(
    Sub2ApiCreateOrderDto body, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedNonReplayableRequest(
    send: (cancelToken, options, authorization) =>
        _service.createOrder(body, cancelToken, options, authorization),
    decode: mapCreateOrderResult,
    requestOptions: requestOptions,
  );

  /// The pinned Go handler binds `amount` as a float64. Reject values whose
  /// canonical decimal value cannot survive that unavoidable wire conversion.
  static double _float64Amount(Sub2ApiDecimal amount) {
    final value = double.tryParse(amount.toJson());
    if (value == null || !value.isFinite) {
      throw _amountNotRepresentable;
    }
    try {
      if (Sub2ApiDecimal.parse(value.toString()) != amount) {
        throw _amountNotRepresentable;
      }
    } on Sub2ApiException catch (error) {
      if (error.code == _amountNotRepresentable.code) {
        rethrow;
      }
      throw _amountNotRepresentable;
    } on Object {
      throw _amountNotRepresentable;
    }
    return value;
  }

  static const _amountNotRepresentable = Sub2ApiException(
    kind: Sub2ApiFailureKind.validation,
    code: 'billing.amount_not_representable',
    retryable: false,
  );
}
