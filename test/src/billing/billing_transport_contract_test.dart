import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sub2api_client/src/billing/sub2api_billing_client.dart';
import 'package:sub2api_client/src/billing/sub2api_billing_models.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/models/sub2api_decimal.dart';
import 'package:sub2api_client/src/shared/session/session_coordinator.dart';
import 'package:sub2api_client/src/shared/session/sub2api_session.dart';
import 'package:sub2api_client/src/shared/transport/request_executor_impl.dart';
import 'package:test/test.dart';

import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  const session = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('billing-transport-access'),
    scope: 'https://sub2api.test',
  );

  test('Billing endpoints use the complete v0.1.183 API routes', () async {
    final order = _fixture('billing/order.json');
    final adapter = JsonResponseAdapter((request) {
      final data = switch ((request.method, request.path)) {
        ('GET', '/api/v1/payment/config') => _fixture('billing/config.json'),
        ('GET', '/api/v1/payment/limits') => _fixture('billing/limits.json'),
        ('GET', '/api/v1/payment/plans') => _fixture('billing/plans.json'),
        ('GET', '/api/v1/payment/checkout-info') => _fixture(
          'billing/checkout_info.json',
        ),
        ('POST', '/api/v1/payment/orders') => _fixture(
          'billing/create_order_created.json',
        ),
        ('GET', '/api/v1/payment/orders/my') => <String, Object?>{
          'items': <Object?>[order],
          'total': 1,
          'page': 1,
          'page_size': 20,
          'pages': 1,
        },
        ('GET', '/api/v1/payment/orders/99') => order,
        ('POST', '/api/v1/payment/orders/verify') => order,
        _ => throw StateError(
          'Unexpected Billing request: ${request.method} ${request.path}',
        ),
      };
      return JsonResponse(body: _success(data));
    });
    final client = _client(adapter, session);

    await client.config();
    await client.limits();
    await client.plans();
    await client.checkoutInfo();
    await client.createBalanceOrder(
      Sub2ApiCreateBalanceOrderRequest(
        amount: Sub2ApiDecimal.parse('10'),
        paymentType: 'stripe',
      ),
    );
    await client.listOwnOrders(const Sub2ApiPaymentOrderQuery());
    await client.order(99);
    await client.verifyOrder('sub2_20260825aB3kX9mQ');

    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/payment/config',
      '/api/v1/payment/limits',
      '/api/v1/payment/plans',
      '/api/v1/payment/checkout-info',
      '/api/v1/payment/orders',
      '/api/v1/payment/orders/my',
      '/api/v1/payment/orders/99',
      '/api/v1/payment/orders/verify',
    ]);
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer billing-transport-access'),
      );
    }
    expect(adapter.requests[4].data, containsPair('amount', 10.0));
    expect(adapter.requests[7].data, <String, Object?>{
      'out_trade_no': 'sub2_20260825aB3kX9mQ',
    });
  });

  test(
    'remaining user payment routes preserve auth and public boundaries',
    () async {
      final adapter = JsonResponseAdapter((request) {
        final fixture = switch (request.path) {
          '/api/v1/payment/orders/77/cancel' => 'billing/mutation_success.json',
          '/api/v1/payment/orders/77/refund-request' =>
            'billing/refund_requested.json',
          '/api/v1/payment/orders/refund-eligible-providers' =>
            'billing/refund_eligible_providers.json',
          '/api/v1/payment/public/orders/verify' =>
            'billing/public_order_verification.json',
          '/api/v1/payment/public/orders/resolve' =>
            'billing/public_order_resolved.json',
          _ => throw StateError('unexpected path ${request.path}'),
        };
        return JsonResponse(body: _fixture(fixture));
      });
      final client = _client(adapter, session);

      final cancelled = await client.cancelOrder(77);
      final refunded = await client.requestRefund(
        77,
        const Sub2ApiRefundRequest(reason: ' Duplicate charge '),
      );
      final providers = await client.getRefundEligibleProviders();
      final verified = await client.verifyPublicOrder(' trade-public-1 ');
      final resolved = await client.resolvePublicOrder(
        const Sub2ApiCheckoutSecret('resume-token-sentinel'),
      );

      expect(cancelled.message, 'ok');
      expect(refunded.message, 'refund requested');
      expect(providers, <String>['stripe-main', 'alipay-cn']);
      expect(verified.paid, isTrue);
      expect(resolved.payAmount.toString(), '10.3');
      expect(adapter.requests[1].data, <String, Object?>{
        'reason': 'Duplicate charge',
      });
      expect(adapter.requests[3].data, <String, Object?>{
        'out_trade_no': 'trade-public-1',
      });
      expect(adapter.requests[4].data, <String, Object?>{
        'resume_token': 'resume-token-sentinel',
      });
      for (final request in adapter.requests.take(3)) {
        expect(
          request.headers,
          containsPair('Authorization', 'Bearer billing-transport-access'),
        );
      }
      for (final request in adapter.requests.skip(3)) {
        expect(request.headers, isNot(contains('Authorization')));
      }
    },
  );
}

Object? _fixture(String relativePath) =>
    jsonDecode(File('test/fixtures/v0_1_183/$relativePath').readAsStringSync());

Map<String, Object?> _success(Object? data) => <String, Object?>{
  'code': 0,
  'message': 'success',
  'data': data,
};

Sub2ApiBillingClient _client(
  JsonResponseAdapter adapter,
  Sub2ApiSession session,
) {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );
  final sessions = Sub2ApiSessionCoordinator(RecordingSessionStore(session));
  final executor = Sub2ApiRequestExecutorImpl(
    configuration: configuration,
    refreshSession: (_) => throw StateError('refresh must not run'),
    sessions: sessions,
  );
  final dio = Dio(BaseOptions(baseUrl: configuration.origin.toString()))
    ..httpClientAdapter = adapter;
  return createSub2ApiBillingClient(dio: dio, requestExecutor: executor);
}
