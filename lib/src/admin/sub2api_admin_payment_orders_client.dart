import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_payment_order_models.dart';
import 'wire/admin_payment_order_wire_mapper.dart';
import 'wire/admin_payment_order_wire_service.dart';

abstract interface class Sub2ApiAdminPaymentOrdersClient {
  Future<Sub2ApiAdminPaymentDashboard> getDashboard({
    int days = 30,
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPaymentOrderPage> list({
    Sub2ApiAdminPaymentOrderQuery query = const Sub2ApiAdminPaymentOrderQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPaymentOrderDetail> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPaymentActionResult> cancel(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPaymentActionResult> retryFulfillment(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPaymentRefundResult> refund(
    int id,
    Sub2ApiAdminProcessRefundRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPaymentRefundResult> queryRefund(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminPaymentOrdersClient createSub2ApiAdminPaymentOrdersClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminPaymentOrdersClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminPaymentOrderWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminPaymentOrderWireService _service;

  @override
  Future<Sub2ApiAdminPaymentDashboard> getDashboard({
    int days = 30,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (days <= 0 || days > 366) {
      throw _validation('admin.payment.invalid_dashboard_days');
    }
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.dashboard(
        days,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPaymentDashboard,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPaymentOrderPage> list({
    Sub2ApiAdminPaymentOrderQuery query = const Sub2ApiAdminPaymentOrderQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _page(query.page, query.pageSize);
    if (query.userId != null) _id(query.userId!);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.listOrders(
        <String, Object?>{
          'page': query.page,
          'page_size': query.pageSize,
          'user_id': ?query.userId,
          'status': ?_optional(query.status),
          'order_type': ?_optional(query.orderType),
          'payment_type': ?_optional(query.paymentType),
          'keyword': ?_optional(query.keyword),
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPaymentOrderPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPaymentOrderDetail> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.getOrder(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPaymentOrderDetail,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPaymentActionResult> cancel(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _action(id, _service.cancelOrder, requestOptions);

  @override
  Future<Sub2ApiAdminPaymentActionResult> retryFulfillment(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _action(id, _service.retryOrder, requestOptions);

  @override
  Future<Sub2ApiAdminPaymentRefundResult> refund(
    int id,
    Sub2ApiAdminProcessRefundRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    final amount = _double(request.amount);
    if (amount < 0) throw _validation('admin.payment.invalid_refund_amount');
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.refund(
        id,
        <String, Object?>{
          'amount': amount,
          'reason': request.reason.trim(),
          'force': request.force,
          'deduct_balance': request.deductBalance,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPaymentRefund,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPaymentRefundResult> queryRefund(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.queryRefund(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPaymentRefund,
      requestOptions: requestOptions,
    );
  }

  Future<Sub2ApiAdminPaymentActionResult> _action(
    int id,
    Future<HttpResponse<Object?>> Function(
      int,
      CancelToken,
      Options,
      String?,
      String?,
    )
    send,
    Sub2ApiRequestOptions? requestOptions,
  ) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => send(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPaymentAction,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? credential : null;
  String? _apiKey(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

void _id(int value) {
  if (value <= 0) throw _validation('admin.payment.invalid_id');
}

void _page(int page, int pageSize) {
  if (page <= 0) throw _validation('admin.payment.invalid_page');
  if (pageSize <= 0 || pageSize > 100) {
    throw _validation('admin.payment.invalid_page_size');
  }
}

String? _optional(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? null : trimmed;
}

double _double(Sub2ApiDecimal decimal) {
  final value = double.tryParse(decimal.toJson());
  if (value == null ||
      !value.isFinite ||
      Sub2ApiDecimal.parse(value.toString()) != decimal) {
    throw _validation('admin.payment.amount_not_representable');
  }
  return value;
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
