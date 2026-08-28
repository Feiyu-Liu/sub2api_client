import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_payment_order_models.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/models/sub2api_decimal.dart';
import 'package:sub2api_client/src/shared/session/sub2api_session.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );

  test('Ops executes every payment dashboard and order route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    final dashboard = await client.paymentOrders.getDashboard(days: 30);
    final page = await client.paymentOrders.list(
      query: const Sub2ApiAdminPaymentOrderQuery(
        userId: 21,
        status: ' PAID ',
        orderType: ' balance ',
        paymentType: ' alipay ',
        keyword: ' ORDER-91 ',
      ),
    );
    final detail = await client.paymentOrders.get(91);
    final cancelled = await client.paymentOrders.cancel(91);
    final retried = await client.paymentOrders.retryFulfillment(91);
    final refunded = await client.paymentOrders.refund(
      91,
      Sub2ApiAdminProcessRefundRequest(
        amount: Sub2ApiDecimal.parse('100.25'),
        reason: ' duplicate ',
        deductBalance: true,
      ),
    );
    final queried = await client.paymentOrders.queryRefund(91);

    expect(dashboard.totalAmount['CNY'].toString(), '204.52');
    expect(page.items.single.rechargeCode.toString(), '<redacted>');
    expect(page.items.single.payUrl.toString(), '<redacted>');
    expect(detail.auditLogs.single.detail.toString(), '<redacted>');
    expect(detail.order.amount.toString(), '100.25');
    expect(cancelled.message, 'cancelled');
    expect(retried.message, 'fulfillment retried');
    expect(refunded.balanceDeducted.toString(), '100.25');
    expect(queried.success, isTrue);

    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/admin/payment/dashboard',
      '/api/v1/admin/payment/orders',
      '/api/v1/admin/payment/orders/91',
      '/api/v1/admin/payment/orders/91/cancel',
      '/api/v1/admin/payment/orders/91/retry',
      '/api/v1/admin/payment/orders/91/refund',
      '/api/v1/admin/payment/orders/91/refund/query',
    ]);
    expect(adapter.requests[1].queryParameters, containsPair('status', 'PAID'));
    expect(adapter.requests[5].data, containsPair('amount', 100.25));
    expect(adapter.requests[5].data, containsPair('reason', 'duplicate'));
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'payment-key-sentinel',
      ),
      isTrue,
    );
    expect(
      adapter.requests.every(
        (request) => request.headers['Authorization'] == null,
      ),
      isTrue,
    );
  });

  test('payment validation and malformed data fail closed', () async {
    final noIo = JsonResponseAdapter((_) => throw StateError('no io'));
    final client = _client(configuration, noIo);
    addTearDown(client.close);
    expect(
      () => client.paymentOrders.getDashboard(days: 0),
      throwsA(_code('admin.payment.invalid_dashboard_days')),
    );
    expect(
      () => client.paymentOrders.refund(
        91,
        Sub2ApiAdminProcessRefundRequest(amount: Sub2ApiDecimal.parse('-1')),
      ),
      throwsA(_code('admin.payment.invalid_refund_amount')),
    );
    expect(noIo.requests, isEmpty);

    final malformed = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'id': 0},
        },
      ),
    );
    final malformedClient = _client(configuration, malformed);
    addTearDown(malformedClient.close);
    await expectLater(
      malformedClient.paymentOrders.get(91),
      throwsA(_code('protocol.invalid_admin_payment_response')),
    );
  });

  test('payment mutation is not replayed after 401', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.paymentOrders.cancel(91),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT payment read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('payment-admin-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _response(request));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = adapter,
    );
    addTearDown(client.close);
    await client.paymentOrders.get(91);
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer payment-admin-jwt'),
    );
  });
}

Map<String, Object?> _fixture() => readFixture('admin/payment_orders.json');
Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/dashboard')) {
    data = _fixture()['dashboard'];
  } else if (request.path == '/api/v1/admin/payment/orders') {
    data = <String, Object?>{
      'items': <Object?>[_fixture()['order']],
      'total': 1,
      'page': 1,
      'page_size': 20,
      'pages': 1,
    };
  } else if (request.path.endsWith('/refund') ||
      request.path.endsWith('/refund/query')) {
    data = _fixture()['refund'];
  } else if (request.path.endsWith('/cancel')) {
    data = <String, Object?>{'message': 'cancelled'};
  } else if (request.path.endsWith('/retry')) {
    data = <String, Object?>{'message': 'fulfillment retried'};
  } else {
    data = <String, Object?>{
      'order': _fixture()['order'],
      'auditLogs': <Object?>[_fixture()['audit']],
    };
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('payment-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
