import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_payment_catalog_models.dart';
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

  test('Ops executes every payment config, plan, and provider route', () async {
    final adapter = JsonResponseAdapter((request) => _response(request));
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    final config = await client.paymentCatalog.getConfig();
    final configResult = await client.paymentCatalog.updateConfig(
      Sub2ApiAdminUpdatePaymentConfigRequest(
        rechargeFeeRate: Sub2ApiDecimal.parse('2.5'),
        enabledPaymentTypes: <String>['stripe'],
      ),
    );
    final plans = await client.paymentCatalog.listPlans();
    final createdPlan = await client.paymentCatalog.createPlan(
      Sub2ApiAdminCreateSubscriptionPlanRequest(
        groupId: 7,
        name: ' Monthly ',
        price: Sub2ApiDecimal.parse('19.99'),
        originalPrice: Sub2ApiDecimal.parse('29.99'),
        currency: ' usd ',
        validityDays: 30,
      ),
    );
    final updatedPlan = await client.paymentCatalog.updatePlan(
      5,
      Sub2ApiAdminUpdateSubscriptionPlanRequest(
        price: Sub2ApiDecimal.parse('18.99'),
      ),
    );
    final deletedPlan = await client.paymentCatalog.deletePlan(5);
    final providers = await client.paymentCatalog.listProviders();
    const secret = Sub2ApiAdminCredentialSecret('sk-provider-secret');
    final createdProvider = await client.paymentCatalog.createProvider(
      Sub2ApiAdminCreatePaymentProviderRequest(
        providerKey: Sub2ApiAdminPaymentProviderKey.stripe,
        name: ' Stripe Main ',
        config: <String, Sub2ApiAdminCredentialSecret>{'secretKey': secret},
        supportedTypes: <String>['stripe'],
        refundEnabled: true,
      ),
    );
    final updatedProvider = await client.paymentCatalog.updateProvider(
      3,
      Sub2ApiAdminUpdatePaymentProviderRequest(
        config: <String, Sub2ApiAdminCredentialSecret>{'secretKey': secret},
        enabled: true,
      ),
    );
    final deletedProvider = await client.paymentCatalog.deleteProvider(3);

    expect(config.subscriptionUsdToCnyRate.toString(), '7.2');
    expect(configResult.message, 'updated');
    expect(plans.single.price.toString(), '19.99');
    expect(createdPlan.groupId, 7);
    expect(updatedPlan.id, 5);
    expect(deletedPlan.message, 'deleted');
    expect(
      providers.single.visibleConfig,
      containsPair('publishableKey', 'pk_test_public'),
    );
    expect(providers.single.visibleConfig, isNot(contains('secretKey')));
    expect(createdProvider.providerKey, Sub2ApiAdminPaymentProviderKey.stripe);
    expect(updatedProvider.id, 3);
    expect(deletedProvider.message, 'deleted');
    expect(secret.toString(), '<redacted>');
    expect(adapter.requests.map((r) => r.path), <String>[
      '/api/v1/admin/payment/config',
      '/api/v1/admin/payment/config',
      '/api/v1/admin/payment/plans',
      '/api/v1/admin/payment/plans',
      '/api/v1/admin/payment/plans/5',
      '/api/v1/admin/payment/plans/5',
      '/api/v1/admin/payment/providers',
      '/api/v1/admin/payment/providers',
      '/api/v1/admin/payment/providers/3',
      '/api/v1/admin/payment/providers/3',
    ]);
    expect(adapter.requests[3].method, 'POST');
    expect(adapter.requests[7].method, 'POST');
    expect(adapter.requests[5].method, 'DELETE');
    expect(adapter.requests[9].method, 'DELETE');
    expect(adapter.requests[3].data, containsPair('price', 19.99));
    expect(
      (adapter.requests[7].data as Map)['config'],
      containsPair('secretKey', 'sk-provider-secret'),
    );
    expect(
      adapter.requests.every(
        (r) => r.headers['x-api-key'] == 'catalog-key-sentinel',
      ),
      isTrue,
    );
    expect(
      adapter.requests.every((r) => r.headers['Authorization'] == null),
      isTrue,
    );
  });

  test('catalog validation and malformed data fail closed', () async {
    final noIo = JsonResponseAdapter((_) {
      throw StateError('no io');
    });
    final client = _client(configuration, noIo);
    addTearDown(client.close);
    expect(
      () => client.paymentCatalog.updateConfig(
        Sub2ApiAdminUpdatePaymentConfigRequest(),
      ),
      throwsA(_code('admin.payment.empty_config_update')),
    );
    expect(
      () => client.paymentCatalog.createPlan(
        Sub2ApiAdminCreateSubscriptionPlanRequest(
          groupId: 0,
          name: 'x',
          price: Sub2ApiDecimal.parse('1'),
          validityDays: 30,
        ),
      ),
      throwsA(_code('admin.payment.invalid_plan')),
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
      malformedClient.paymentCatalog.listProviders(),
      throwsA(_code('protocol.invalid_admin_payment_catalog_response')),
    );
  });

  test('catalog create requires 201 and mutation never replays', () async {
    final wrongStatus = JsonResponseAdapter(
      (request) => JsonResponse(body: _envelope(_fixture()['plan'])),
    );
    final wrongClient = _client(configuration, wrongStatus);
    addTearDown(wrongClient.close);
    await expectLater(
      wrongClient.paymentCatalog.createPlan(
        Sub2ApiAdminCreateSubscriptionPlanRequest(
          groupId: 7,
          name: 'x',
          price: Sub2ApiDecimal.parse('1'),
          validityDays: 30,
        ),
      ),
      throwsA(_code('protocol.unexpected_success_status')),
    );
    final unauthorized = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, unauthorized);
    addTearDown(client.close);
    await expectLater(
      client.paymentCatalog.deletePlan(5),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(unauthorized.requests, hasLength(1));
  });

  test('Admin JWT catalog read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('catalog-admin-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter(
      (request) => request.path == '/api/v1/auth/me'
          ? JsonResponse(body: readFixture('auth/current_user_success.json'))
          : _response(request),
    );
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = adapter,
    );
    addTearDown(client.close);
    await client.paymentCatalog.getConfig();
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer catalog-admin-jwt'),
    );
  });
}

Map<String, Object?> _fixture() => readFixture('admin/payment_catalog.json');
JsonResponse _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/config')) {
    data = request.method == 'GET'
        ? _fixture()['config']
        : <String, Object?>{'message': 'updated'};
  } else if (request.path.contains('/plans')) {
    data = request.method == 'DELETE'
        ? <String, Object?>{'message': 'deleted'}
        : request.path.endsWith('/plans') && request.method == 'GET'
        ? <Object?>[_fixture()['plan']]
        : _fixture()['plan'];
  } else {
    data = request.method == 'DELETE'
        ? <String, Object?>{'message': 'deleted'}
        : request.path.endsWith('/providers') && request.method == 'GET'
        ? <Object?>[_fixture()['provider']]
        : _fixture()['provider'];
  }
  final created =
      request.method == 'POST' &&
      (request.path.endsWith('/plans') || request.path.endsWith('/providers'));
  return JsonResponse(statusCode: created ? 201 : 200, body: _envelope(data));
}

Map<String, Object?> _envelope(Object? data) => <String, Object?>{
  'code': 0,
  'message': 'success',
  'data': data,
};
Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('catalog-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((e) => e.code, 'code', code);
