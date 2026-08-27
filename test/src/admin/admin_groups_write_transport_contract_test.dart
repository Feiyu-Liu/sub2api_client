import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_group_models.dart';
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
  const session = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('admin-group-write-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'Ops group create and update send the complete typed contract',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: readFixture('admin/group_detail.json')),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      final created = await client.groups.create(_createRequest());
      final updated = await client.groups.update(
        7,
        Sub2ApiAdminUpdateGroupRequest(
          description: '',
          isExclusive: false,
          dailyLimitUsd: const Sub2ApiAdminLimitUpdate.clear(),
          weeklyLimitUsd: Sub2ApiAdminLimitUpdate.set(
            Sub2ApiDecimal.parse('25'),
          ),
          modelPricing: const [],
          modelRouting: const {},
          supportedModelScopes: const [],
          modelsListConfig: Sub2ApiAdminGroupModelsListConfig(
            enabled: false,
            models: const [],
          ),
          rpmLimit: 0,
          maxReasoningEffort: '',
          reasoningEffortMappings: const [],
          copyAccountsFromGroupIds: const [],
        ),
      );

      expect(created.id, 7);
      expect(updated.id, 7);
      expect(adapter.requests, hasLength(2));
      for (final request in adapter.requests) {
        expect(
          request.headers,
          containsPair('x-api-key', 'admin-group-write-key-sentinel'),
        );
        expect(request.headers, isNot(contains('Authorization')));
      }
      final create = adapter.requests[0].data! as Map<String, dynamic>;
      expect(create['name'], 'openai-research');
      expect(create['platform'], 'openai');
      expect(create['rate_multiplier'], 0.85);
      expect(create['daily_limit_usd'], 10.5);
      expect(create['weekly_limit_usd'], isNull);
      expect(create['model_routing'], <String, Object?>{
        'gpt-5.*': <int>[101, 102],
      });
      expect(create['video_model_prices'], <String, Object?>{
        'sora': <String, double>{'720p': 0.25},
      });
      final pricing = (create['model_pricing']! as List).single as Map;
      expect(pricing['billing_mode'], 'token');
      expect(
        (pricing['intervals']! as List).single,
        containsPair('max_tokens', 200000),
      );
      expect(
        pricing['time_pricing'],
        containsPair('timezone', 'Asia/Shanghai'),
      );
      expect(
        create['messages_dispatch_model_config'],
        containsPair('exact_model_mappings', <String, String>{
          'claude-opus-4': 'gpt-5.2-pro',
        }),
      );
      expect(create['copy_accounts_from_group_ids'], <int>[8, 9]);

      expect(adapter.requests[1].data, <String, Object?>{
        'description': '',
        'is_exclusive': false,
        'daily_limit_usd': null,
        'weekly_limit_usd': 25.0,
        'model_pricing': <Object?>[],
        'model_routing': <String, List<int>>{},
        'supported_model_scopes': <String>[],
        'models_list_config': <String, Object?>{
          'enabled': false,
          'models': <String>[],
        },
        'rpm_limit': 0,
        'max_reasoning_effort': '',
        'reasoning_effort_mappings': <Object?>[],
        'copy_accounts_from_group_ids': <int>[],
      });
    },
  );

  test('Admin JWT group writes run after role checks', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: readFixture('admin/group_detail.json'));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.groups.create(_createRequest());
    await client.groups.update(
      7,
      Sub2ApiAdminUpdateGroupRequest(name: 'renamed'),
    );

    final business = adapter.requests.where(
      (request) => request.path != '/api/v1/auth/me',
    );
    expect(
      business.map((request) => '${request.method} ${request.path}'),
      <String>['POST /api/v1/admin/groups', 'PUT /api/v1/admin/groups/7'],
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer admin-group-write-jwt-sentinel'),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test('group writes preserve business and invalid-key failures', () async {
    for (final failure in <({int status, String fixture, String code})>[
      (
        status: 404,
        fixture: 'admin/group_business_failure.json',
        code: 'server.group_not_found',
      ),
      (
        status: 401,
        fixture: 'admin/group_auth_failure.json',
        code: 'server.invalid_api_key',
      ),
    ]) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          statusCode: failure.status,
          body: readFixture(failure.fixture),
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);
      await expectLater(
        client.groups.create(_createRequest()),
        throwsA(_code(failure.code)),
      );
      await expectLater(
        client.groups.update(
          7,
          Sub2ApiAdminUpdateGroupRequest(name: 'renamed'),
        ),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('group writes reject malformed success data', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('admin/group_malformed.json')),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.groups.create(_createRequest()),
      throwsA(_code('protocol.invalid_admin_group_response')),
    );
    await expectLater(
      client.groups.update(7, Sub2ApiAdminUpdateGroupRequest(name: 'renamed')),
      throwsA(_code('protocol.invalid_admin_group_response')),
    );
  });

  test('group write validation fails before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.groups.create(Sub2ApiAdminCreateGroupRequest(name: ' ')),
      throwsA(_code('admin.groups.name_required')),
    );
    expect(
      () => client.groups.update(7, Sub2ApiAdminUpdateGroupRequest()),
      throwsA(_code('admin.groups.empty_update')),
    );
    expect(
      () =>
          client.groups.update(7, Sub2ApiAdminUpdateGroupRequest(rpmLimit: -1)),
      throwsA(_code('admin.groups.invalid_rpm_limit')),
    );
    expect(adapter.requests, isEmpty);
  });
}

Sub2ApiAdminCreateGroupRequest _createRequest() =>
    Sub2ApiAdminCreateGroupRequest(
      name: ' openai-research ',
      description: 'Research workloads',
      platform: Sub2ApiAdminGroupPlatform.openAi,
      rateMultiplier: Sub2ApiDecimal.parse('0.85'),
      isExclusive: true,
      subscriptionType: Sub2ApiAdminGroupSubscriptionType.standard,
      dailyLimitUsd: Sub2ApiDecimal.parse('10.5'),
      monthlyLimitUsd: Sub2ApiDecimal.parse('100'),
      longContextPricingEnabled: true,
      modelPricing: <Sub2ApiAdminModelPricing>[
        Sub2ApiAdminModelPricing(
          id: 31,
          channelId: 0,
          platform: 'openai',
          models: const ['gpt-5.2'],
          billingMode: 'token',
          inputPrice: Sub2ApiDecimal.parse('1.25'),
          outputPrice: Sub2ApiDecimal.parse('10'),
          intervals: <Sub2ApiAdminPricingInterval>[
            Sub2ApiAdminPricingInterval(
              id: 41,
              pricingId: 31,
              minTokens: 0,
              maxTokens: 200000,
              tierLabel: 'base',
              inputPrice: Sub2ApiDecimal.parse('1.25'),
              outputPrice: Sub2ApiDecimal.parse('10'),
              sortOrder: 0,
            ),
          ],
          timePricing: Sub2ApiAdminTimePricing(
            timezone: 'Asia/Shanghai',
            weekdaysOnly: true,
            periods: <Sub2ApiAdminTimePricingPeriod>[
              Sub2ApiAdminTimePricingPeriod(
                startTime: '09:00:00',
                endTime: '18:00:00',
                multiplier: Sub2ApiDecimal.parse('1.1'),
              ),
            ],
          ),
        ),
      ],
      allowImageGeneration: true,
      imageRateIndependent: true,
      imageRateMultiplier: Sub2ApiDecimal.parse('1.2'),
      videoRateIndependent: true,
      videoRateMultiplier: Sub2ApiDecimal.parse('1.3'),
      peakRateEnabled: true,
      peakStart: '09:00',
      peakEnd: '18:00',
      peakRateMultiplier: Sub2ApiDecimal.parse('1.25'),
      profitControlEnabled: true,
      profitMinMargin: Sub2ApiDecimal.parse('0.3'),
      profitSafetyBuffer: Sub2ApiDecimal.parse('0.05'),
      videoModelPrices: <String, Map<String, Sub2ApiDecimal>>{
        'sora': <String, Sub2ApiDecimal>{'720p': Sub2ApiDecimal.parse('0.25')},
      },
      fallbackGroupId: 8,
      modelRouting: const <String, List<int>>{
        'gpt-5.*': <int>[101, 102],
      },
      modelRoutingEnabled: true,
      supportedModelScopes: const ['openai_text'],
      allowMessagesDispatch: true,
      allowLive: true,
      requireOAuthOnly: true,
      defaultMappedModel: 'gpt-5.2',
      messagesDispatchModelConfig: Sub2ApiAdminMessagesDispatchModelConfig(
        opusMappedModel: 'gpt-5.2-pro',
        sonnetMappedModel: 'gpt-5.2',
        haikuMappedModel: 'gpt-5-mini',
        exactModelMappings: const {'claude-opus-4': 'gpt-5.2-pro'},
      ),
      modelsListConfig: Sub2ApiAdminGroupModelsListConfig(
        enabled: true,
        models: const ['gpt-5.2', 'gpt-5-mini'],
      ),
      rpmLimit: 120,
      maxReasoningEffort: 'high',
      reasoningEffortMappings: const [
        Sub2ApiAdminReasoningEffortMapping(from: 'xhigh', to: 'high'),
      ],
      copyAccountsFromGroupIds: const [8, 9],
    );

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-group-write-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
