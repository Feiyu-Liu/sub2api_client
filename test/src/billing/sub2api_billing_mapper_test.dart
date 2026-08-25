import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:sub2api_client/src/billing/sub2api_billing_client.dart';
import 'package:sub2api_client/src/billing/sub2api_billing_mapper.dart';
import 'package:sub2api_client/src/billing/sub2api_billing_models.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sub2api_decimal.dart';
import 'package:sub2api_client/src/shared/request/sub2api_request_options.dart';
import 'package:sub2api_client/src/shared/transport/request_executor.dart';
import 'package:test/test.dart';

void main() {
  group('v0.1.155 billing fixtures', () {
    test('maps config, limits, plans and checkout information', () {
      final config = mapPaymentConfig(_fixture('billing/config.json'));
      final limits = mapPaymentLimits(_fixture('billing/limits.json'));
      final plans = mapPaymentPlans(_fixture('billing/plans.json'));
      final checkout = mapCheckoutInfo(_fixture('billing/checkout_info.json'));

      expect(config.balanceRechargeMultiplier.toString(), '1.2');
      expect(limits.methods['alipay']!.singleMax.toString(), '1000');
      expect(plans.single.features, ['Priority', 'More models']);
      expect(checkout.plans.single.supportedModelScopes, ['gpt-5']);
    });

    test('keeps an unknown server order status as a string', () {
      final order = mapPaymentOrder(_fixture('billing/order.json'));

      expect(order.status, 'FUTURE_STATUS');
      expect(order.payAmount.toString(), '10.25');
    });

    test('maps order-created checkout result and redacts checkout secrets', () {
      final result = mapCreateOrderResult(
        _fixture('billing/create_order_created.json'),
      );

      expect(result, isA<Sub2ApiOrderCreated>());
      final text = result.toString();
      expect(text, contains('<redacted>'));
      expect(text, isNot(contains('pi_secret_very_secret')));
      expect(text, isNot(contains('resume-token-secret')));
    });

    test('maps OAuth-required result', () {
      final result = mapCreateOrderResult(
        _fixture('billing/create_oauth_required.json'),
      );

      expect(result, isA<Sub2ApiOrderOAuthRequired>());
      final oauth = result as Sub2ApiOrderOAuthRequired;
      expect(oauth.oauth.scope, 'snsapi_base');
    });

    test('maps JSAPI-ready result and redacts payment signature', () {
      final result = mapCreateOrderResult(
        _fixture('billing/create_jsapi_ready.json'),
      );

      expect(result, isA<Sub2ApiOrderJsapiReady>());
      final text = result.toString();
      expect(text, contains('<redacted>'));
      expect(text, isNot(contains('pay-sign-secret')));
      expect(text, isNot(contains('prepay_id=secret')));
    });

    test(
      'serializes a safely representable balance amount as a JSON number',
      () async {
        final adapter = _FixtureAdapter(
          _success(_fixture('billing/create_order_created.json')),
        );
        final executor = _EnvelopeExecutor();
        final client = createSub2ApiBillingClient(
          dio: _dio(adapter),
          requestExecutor: executor,
        );

        await client.createBalanceOrder(
          Sub2ApiCreateBalanceOrderRequest(
            amount: Sub2ApiDecimal.parse('10'),
            paymentType: 'stripe',
          ),
        );

        expect(executor.protectedCalls, 0);
        expect(executor.nonReplayableCalls, 1);
        expect(adapter.lastRequest?.data, <String, Object?>{
          'amount': 10.0,
          'payment_type': 'stripe',
          'order_type': 'balance',
          'plan_id': 0,
        });
      },
    );

    test('rejects a balance amount that cannot survive the float64 wire', () {
      final executor = _RecordingExecutor();
      final client = createSub2ApiBillingClient(
        dio: Dio(),
        requestExecutor: executor,
      );

      expect(
        () => client.createBalanceOrder(
          Sub2ApiCreateBalanceOrderRequest(
            amount: Sub2ApiDecimal.parse('0.123456789012345678901234567890'),
            paymentType: 'stripe',
          ),
        ),
        throwsA(
          isA<Sub2ApiException>().having(
            (error) => error.code,
            'code',
            'billing.amount_not_representable',
          ),
        ),
      );
      expect(executor.nonReplayableCalls, 0);
    });
  });
}

Object? _fixture(String relativePath) =>
    jsonDecode(File('test/fixtures/v0_1_155/$relativePath').readAsStringSync());

Map<String, Object?> _success(Object? data) => <String, Object?>{
  'code': 0,
  'message': 'success',
  'data': data,
};

class _EnvelopeExecutor implements Sub2ApiRequestExecutor {
  int protectedCalls = 0;
  int nonReplayableCalls = 0;

  @override
  Future<T> protectedNonReplayableRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    nonReplayableCalls += 1;
    return _execute(send: send, decode: decode);
  }

  @override
  Future<T> protectedRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    protectedCalls += 1;
    return _execute(send: send, decode: decode);
  }

  @override
  Future<T> publicRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) => _execute(send: send, decode: decode);

  Future<T> _execute<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
  }) async {
    final response = await send(CancelToken(), Options(), 'Bearer fixture');
    final envelope = response.data! as Map<String, Object?>;
    return decode(envelope['data']);
  }
}

final class _RecordingExecutor implements Sub2ApiRequestExecutor {
  int protectedCalls = 0;
  int nonReplayableCalls = 0;

  @override
  Future<T> protectedNonReplayableRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    nonReplayableCalls += 1;
    throw UnimplementedError();
  }

  @override
  Future<T> protectedRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) async {
    protectedCalls += 1;
    throw UnimplementedError();
  }

  @override
  Future<T> publicRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) => throw UnimplementedError();
}

Dio _dio(_FixtureAdapter adapter) {
  return Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
    ..httpClientAdapter = adapter;
}

final class _FixtureAdapter implements HttpClientAdapter {
  _FixtureAdapter(this._body);

  final Object? _body;
  RequestOptions? lastRequest;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    lastRequest = options;
    return ResponseBody.fromString(
      jsonEncode(_body),
      HttpStatus.ok,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }
}
