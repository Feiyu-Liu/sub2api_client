import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_channel_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_user_models.dart';
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

  test('Ops executes every channel route with typed prices', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    final page = await client.channels.list(
      query: const Sub2ApiAdminChannelListQuery(
        page: 2,
        pageSize: 25,
        status: Sub2ApiAdminChannelStatus.active,
        search: ' Primary ',
        sortBy: Sub2ApiAdminChannelSortField.createdAt,
        sortOrder: Sub2ApiAdminChannelSortOrder.descending,
      ),
    );
    final defaultPricing = await client.channels.getDefaultPricing(' gpt-5.4 ');
    final synced = await client.channels.syncPricingModels(
      Sub2ApiAdminChannelPricingPlatform.openAi,
    );
    final fetched = await client.channels.get(12);
    final featureConfig = Sub2ApiAdminJsonObject(
      <String, Sub2ApiAdminJsonValue>{
        'responses': Sub2ApiAdminJsonObject(<String, Sub2ApiAdminJsonValue>{
          'enabled': const Sub2ApiAdminJsonBool(true),
        }),
      },
    );
    final pricing = Sub2ApiAdminChannelModelPricingInput(
      platform: 'openai',
      models: const <String>['gpt-5.4'],
      inputPrice: Sub2ApiDecimal.parse('0.0000025'),
      outputPrice: Sub2ApiDecimal.parse('0.00001'),
      fastMultiplier: Sub2ApiDecimal.parse('2'),
      intervals: <Sub2ApiAdminChannelPricingIntervalInput>[
        Sub2ApiAdminChannelPricingIntervalInput(
          minTokens: 272000,
          inputMultiplier: Sub2ApiDecimal.parse('2'),
        ),
      ],
    );
    final created = await client.channels.create(
      Sub2ApiAdminCreateChannelRequest(
        name: ' Primary Channel ',
        groupIds: const <int>[2, 3],
        modelPricing: <Sub2ApiAdminChannelModelPricingInput>[pricing],
        modelMapping: const <String, Map<String, String>>{
          'openai': <String, String>{'public-gpt': 'gpt-5.4'},
        },
        billingModelSource: Sub2ApiAdminChannelBillingModelSource.channelMapped,
        restrictModels: true,
        featuresConfig: featureConfig,
      ),
    );
    final updated = await client.channels.update(
      12,
      Sub2ApiAdminUpdateChannelRequest(
        description: '',
        status: Sub2ApiAdminChannelStatus.disabled,
      ),
    );
    final deleted = await client.channels.delete(12);

    expect(page.items.single.id, 12);
    expect(page.page, 2);
    expect(defaultPricing.inputPrice, Sub2ApiDecimal.parse('0.0000025'));
    expect(synced.models, contains('gpt-5.4-mini'));
    expect(
      fetched.modelPricing.single.fastMultiplier,
      Sub2ApiDecimal.parse('2'),
    );
    expect(
      fetched.featuresConfig?.values['responses'],
      isA<Sub2ApiAdminJsonObject>(),
    );
    expect(
      created.billingModelSource,
      Sub2ApiAdminChannelBillingModelSource.channelMapped,
    );
    expect(updated.accountStatsPricingRules.single.id, 41);
    expect(deleted.message, 'Channel deleted successfully');

    expect(adapter.requests, hasLength(7));
    expect(adapter.requests[0].path, '/api/v1/admin/channels');
    expect(adapter.requests[0].queryParameters, containsPair('page', 2));
    expect(
      adapter.requests[0].queryParameters,
      containsPair('search', 'Primary'),
    );
    expect(adapter.requests[1].path, '/api/v1/admin/channels/model-pricing');
    expect(
      adapter.requests[1].queryParameters,
      containsPair('model', 'gpt-5.4'),
    );
    expect(
      adapter.requests[2].path,
      '/api/v1/admin/channels/pricing/sync-models',
    );
    expect(
      adapter.requests[2].queryParameters,
      containsPair('platform', 'openai'),
    );
    expect(adapter.requests[4].method, 'POST');
    expect(adapter.requests[4].data, isA<Map<String, Object?>>());
    expect(
      (adapter.requests[4].data as Map<String, Object?>)['name'],
      'Primary Channel',
    );
    expect(adapter.requests[5].method, 'PUT');
    expect(
      (adapter.requests[5].data as Map<String, Object?>)['description'],
      '',
    );
    expect(adapter.requests[6].method, 'DELETE');
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'channel-key-sentinel',
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

  test('channel validation and malformed data fail closed', () async {
    final validationAdapter = JsonResponseAdapter(
      (_) => throw StateError('no io'),
    );
    final validationClient = _client(configuration, validationAdapter);
    addTearDown(validationClient.close);
    expect(
      () => validationClient.channels.create(
        Sub2ApiAdminCreateChannelRequest(name: ' '),
      ),
      throwsA(_code('admin.channels.invalid_name')),
    );
    expect(
      () => validationClient.channels.update(
        12,
        Sub2ApiAdminUpdateChannelRequest(),
      ),
      throwsA(_code('admin.channels.empty_update')),
    );
    expect(
      () => validationClient.channels.create(
        Sub2ApiAdminCreateChannelRequest(
          name: 'invalid stats multiplier',
          accountStatsPricingRules:
              <Sub2ApiAdminChannelAccountStatsPricingRuleInput>[
                Sub2ApiAdminChannelAccountStatsPricingRuleInput(
                  name: 'stats',
                  groupIds: const <int>[2],
                  accountIds: const <int>[],
                  pricing: <Sub2ApiAdminChannelModelPricingInput>[
                    Sub2ApiAdminChannelModelPricingInput(
                      models: const <String>['gpt-5.4'],
                      fastMultiplier: Sub2ApiDecimal.parse('2'),
                    ),
                  ],
                ),
              ],
        ),
      ),
      throwsA(_code('admin.channels.pricing_rule_multiplier_unsupported')),
    );
    expect(validationAdapter.requests, isEmpty);

    final malformedAdapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'id': 0},
        },
      ),
    );
    final malformedClient = _client(configuration, malformedAdapter);
    addTearDown(malformedClient.close);
    await expectLater(
      malformedClient.channels.get(12),
      throwsA(_code('protocol.invalid_admin_channel_response')),
    );
  });

  test('channel mutation is not replayed', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.channels.delete(12),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT channel read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('channel-admin-jwt'),
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
    await client.channels.get(12);
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer channel-admin-jwt'),
    );
    expect(adapter.requests.last.headers['x-api-key'], isNull);
  });
}

Map<String, Object?> _fixture() => readFixture('admin/channel.json');

Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/model-pricing')) {
    data = _fixture()['default_pricing'];
  } else if (request.path.endsWith('/pricing/sync-models')) {
    data = _fixture()['pricing_models'];
  } else if (request.method == 'DELETE') {
    data = _fixture()['deleted'];
  } else if (request.method == 'GET' && request.path.endsWith('/channels')) {
    data = <String, Object?>{
      'items': <Object?>[_fixture()['channel']],
      'total': 26,
      'page': 2,
      'page_size': 25,
      'pages': 2,
    };
  } else {
    data = _fixture()['channel'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('channel-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
