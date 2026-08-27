import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_account_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_accounts_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_user_models.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
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
    accessToken: Sub2ApiAccessToken('admin-accounts-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'Ops accounts decodes every fixed read route with API-key isolation',
    () async {
      final adapter = JsonResponseAdapter(
        (request) => JsonResponse(body: _fixtureForRequest(request)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      final results = <Object?>[];
      for (final route in _routes) {
        results.add(await route.invoke(client.accounts));
      }

      final page = results[0]! as Sub2ApiAdminAccountPage;
      expect(page.total, 1);
      expect(page.items.single.id, 42);
      expect(page.items.single.platform, Sub2ApiAdminAccountPlatform.openAi);
      expect(page.items.single.rateMultiplier.toString(), '0.85');
      expect(page.items.single.credentialsStatus['has_refresh_token'], isTrue);
      expect(
        (page.items.single.credentials.values['email']
                as Sub2ApiAdminJsonString)
            .value,
        'operator@example.test',
      );
      expect((results[1]! as Sub2ApiAdminAccount).currentConcurrency, 2);
      expect(
        (results[2]! as Sub2ApiAdminUpstreamBillingProbeSettings)
            .intervalMinutes,
        30,
      );
      expect(
        (results[3]! as Sub2ApiAdminOllamaCloudUsageSettings).debounceMinutes,
        5,
      );
      expect(
        (results[4]! as Sub2ApiAdminOllamaCloudUsageState)
            .snapshot
            ?.data
            ?.models
            .single
            .requests,
        14,
      );
      expect(
        (results[5]! as Sub2ApiAdminAccountStats).models.single.accountCost
            .toString(),
        '1.1',
      );
      final usage = results[6]! as Sub2ApiAdminAccountUsage;
      expect(usage.windows['five_hour']?.utilization.toString(), '32.5');
      expect(
        (usage.providerDetails.values['subscription_tier']
                as Sub2ApiAdminJsonString)
            .value,
        'PRO',
      );
      expect(
        (results[7]! as Sub2ApiAdminAccountTempUnschedulable).state?.statusCode,
        429,
      );
      expect(
        (results[8]! as Sub2ApiAdminAccountTodayStats).standardCost.toString(),
        '1.25',
      );
      expect(
        (results[9]! as List<Sub2ApiAdminAccountModel>).single.displayName,
        'GPT-5.6',
      );
      expect(
        (results[10]! as Map<String, String>)['gemini-3.1-pro'],
        'gemini-pro-agent',
      );
      expect(
        (results[11]! as List<Sub2ApiAdminScheduledTestPlan>)
            .single
            .autoRecover,
        isTrue,
      );

      expect(
        adapter.requests.map((request) => request.path),
        _routes.map((route) => route.path),
      );
      for (final request in adapter.requests) {
        expect(
          request.headers,
          containsPair('x-api-key', 'admin-accounts-key-sentinel'),
        );
        expect(request.headers, isNot(contains('Authorization')));
      }
      expect(adapter.requests[0].queryParameters, <String, dynamic>{
        'page': 2,
        'page_size': 25,
        'platform': 'openai',
        'type': 'oauth',
        'status': 'active',
        'search': 'primary',
        'group': 7,
        'privacy_mode': 'enabled',
        'sort_by': 'created_at',
        'sort_order': 'desc',
        'lite': true,
        'include_scheduler_score': true,
      });
      expect(adapter.requests[5].queryParameters, <String, dynamic>{
        'days': 14,
      });
      expect(adapter.requests[6].queryParameters, <String, dynamic>{
        'source': 'passive',
        'force': true,
      });
    },
  );

  test('Admin JWT accounts sends every read route after role checks', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _fixtureForRequest(request));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    for (final route in _routes) {
      await route.invoke(client.accounts);
    }

    final businessRequests = adapter.requests.where(
      (request) => request.path != '/api/v1/auth/me',
    );
    expect(
      businessRequests.map((request) => request.path),
      _routes.map((route) => route.path),
    );
    expect(
      adapter.requests.where((request) => request.path == '/api/v1/auth/me'),
      hasLength(_routes.length),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer admin-accounts-jwt-sentinel'),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test('every accounts read route preserves business failure', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 404,
        body: readFixture('admin/account_business_failure.json'),
      ),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    for (final route in _routes) {
      await expectLater(
        route.invoke(client.accounts),
        throwsA(_code('server.account_not_found')),
        reason: route.name,
      );
    }
  });

  test(
    'every accounts read route preserves invalid Admin API Key failure',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          statusCode: 401,
          body: readFixture('admin/account_auth_failure.json'),
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      for (final route in _routes) {
        await expectLater(
          route.invoke(client.accounts),
          throwsA(_code('server.invalid_api_key')),
          reason: route.name,
        );
      }
    },
  );

  test(
    'every accounts read route rejects malformed success contract',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => const JsonResponse(
          body: <String, Object?>{
            'code': 0,
            'message': 'success',
            'data': null,
          },
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      for (final route in _routes) {
        await expectLater(
          route.invoke(client.accounts),
          throwsA(_code('protocol.invalid_admin_account_response')),
          reason: route.name,
        );
      }
    },
  );

  test(
    'account response rejects sensitive credentials and managed extra',
    () async {
      for (final mutation in <void Function(Map<String, Object?>)>[
        (account) =>
            (account['credentials']! as Map<String, Object?>)['refresh_token'] =
                'must-not-escape',
        (account) =>
            (account['extra']!
                    as Map<String, Object?>)['ollama_cloud_usage_session'] =
                'must-not-escape',
      ]) {
        final account = _deepCopy(_data('account')) as Map<String, Object?>;
        mutation(account);
        final adapter = JsonResponseAdapter(
          (_) => JsonResponse(body: _success(account)),
        );
        final client = _opsClient(configuration, adapter);
        addTearDown(client.close);

        await expectLater(
          client.accounts.getById(42),
          throwsA(_code('protocol.invalid_admin_account_response')),
        );
      }
    },
  );

  test(
    'account response accepts nil redacted maps as empty typed objects',
    () async {
      final account = _deepCopy(_data('account')) as Map<String, Object?>
        ..['credentials'] = null
        ..['credentials_status'] = null
        ..['extra'] = null;
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: _success(account)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      final result = await client.accounts.getById(42);

      expect(result.credentials.values, isEmpty);
      expect(result.credentialsStatus, isEmpty);
      expect(result.extra.values, isEmpty);
    },
  );

  test('accounts query validation fails before network I/O', () async {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.getById(0),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.list(
        query: const Sub2ApiAdminAccountListQuery(pageSize: 101),
      ),
      throwsA(_code('admin.accounts.invalid_page_size')),
    );
    expect(
      () => client.accounts.list(
        query: Sub2ApiAdminAccountListQuery(search: 'x' * 101),
      ),
      throwsA(_code('admin.accounts.search_too_long')),
    );
    expect(
      () => client.accounts.list(
        query: const Sub2ApiAdminAccountListQuery(groupId: 7, ungrouped: true),
      ),
      throwsA(_code('admin.accounts.conflicting_group_filter')),
    );
    expect(
      () => client.accounts.getStats(42, days: 91),
      throwsA(_code('admin.accounts.invalid_stats_days')),
    );
    expect(adapter.requests, isEmpty);
  });
}

final _routes = <_AdminAccountReadRoute>[
  _AdminAccountReadRoute(
    'list',
    '/api/v1/admin/accounts',
    (accounts) => accounts.list(
      query: const Sub2ApiAdminAccountListQuery(
        page: 2,
        pageSize: 25,
        platform: Sub2ApiAdminAccountPlatform.openAi,
        type: Sub2ApiAdminAccountType.oauth,
        status: Sub2ApiAdminAccountStatus.active,
        search: ' primary ',
        groupId: 7,
        privacyMode: ' enabled ',
        sortBy: Sub2ApiAdminAccountSort.createdAt,
        sortDescending: true,
        lite: true,
        includeSchedulerScore: true,
      ),
    ),
  ),
  _AdminAccountReadRoute(
    'detail',
    '/api/v1/admin/accounts/42',
    (accounts) => accounts.getById(42),
  ),
  _AdminAccountReadRoute(
    'upstream billing settings',
    '/api/v1/admin/accounts/upstream-billing-probe/settings',
    (accounts) => accounts.getUpstreamBillingProbeSettings(),
  ),
  _AdminAccountReadRoute(
    'Ollama Cloud settings',
    '/api/v1/admin/accounts/ollama-cloud-usage/settings',
    (accounts) => accounts.getOllamaCloudUsageSettings(),
  ),
  _AdminAccountReadRoute(
    'Ollama Cloud usage',
    '/api/v1/admin/accounts/42/ollama-cloud-usage',
    (accounts) => accounts.getOllamaCloudUsage(42),
  ),
  _AdminAccountReadRoute(
    'stats',
    '/api/v1/admin/accounts/42/stats',
    (accounts) => accounts.getStats(42, days: 14),
  ),
  _AdminAccountReadRoute(
    'usage',
    '/api/v1/admin/accounts/42/usage',
    (accounts) => accounts.getUsage(
      42,
      source: Sub2ApiAdminAccountUsageSource.passive,
      force: true,
    ),
  ),
  _AdminAccountReadRoute(
    'temporary unschedulable',
    '/api/v1/admin/accounts/42/temp-unschedulable',
    (accounts) => accounts.getTempUnschedulable(42),
  ),
  _AdminAccountReadRoute(
    'today stats',
    '/api/v1/admin/accounts/42/today-stats',
    (accounts) => accounts.getTodayStats(42),
  ),
  _AdminAccountReadRoute(
    'models',
    '/api/v1/admin/accounts/42/models',
    (accounts) => accounts.getModels(42),
  ),
  _AdminAccountReadRoute(
    'Antigravity default mapping',
    '/api/v1/admin/accounts/antigravity/default-model-mapping',
    (accounts) => accounts.getAntigravityDefaultModelMapping(),
  ),
  _AdminAccountReadRoute(
    'scheduled test plans',
    '/api/v1/admin/accounts/42/scheduled-test-plans',
    (accounts) => accounts.getScheduledTestPlans(42),
  ),
];

Object? _fixtureForRequest(RequestOptions request) => switch ((
  request.method,
  request.path,
)) {
  ('GET', '/api/v1/admin/accounts') => _success(_pageData()),
  ('GET', '/api/v1/admin/accounts/42') => _success(_data('account')),
  ('GET', '/api/v1/admin/accounts/upstream-billing-probe/settings') => _success(
    _data('upstream_billing_probe_settings'),
  ),
  ('GET', '/api/v1/admin/accounts/ollama-cloud-usage/settings') => _success(
    _data('ollama_cloud_usage_settings'),
  ),
  ('GET', '/api/v1/admin/accounts/42/ollama-cloud-usage') => _success(
    _data('ollama_cloud_usage'),
  ),
  ('GET', '/api/v1/admin/accounts/42/stats') => _success(_data('stats')),
  ('GET', '/api/v1/admin/accounts/42/usage') => _success(_data('usage')),
  ('GET', '/api/v1/admin/accounts/42/temp-unschedulable') => _success(
    _data('temp_unschedulable'),
  ),
  ('GET', '/api/v1/admin/accounts/42/today-stats') => _success(
    _data('today_stats'),
  ),
  ('GET', '/api/v1/admin/accounts/42/models') => _success(_data('models')),
  ('GET', '/api/v1/admin/accounts/antigravity/default-model-mapping') =>
    _success(_data('antigravity_default_model_mapping')),
  ('GET', '/api/v1/admin/accounts/42/scheduled-test-plans') => _data(
    'scheduled_test_plans',
  ),
  _ => throw StateError('unexpected request ${request.method} ${request.path}'),
};

Map<String, Object?> _pageData() {
  final page = _deepCopy(_data('page')) as Map<String, Object?>;
  page['items'] = <Object?>[_data('account')];
  return page;
}

Object? _data(String key) {
  final source = readFixture('admin/account_read_surface.json');
  if (!source.containsKey(key)) {
    throw StateError('missing account fixture $key');
  }
  return source[key];
}

Map<String, Object?> _success(Object? data) => <String, Object?>{
  'code': 0,
  'message': 'success',
  'data': data,
};

Object? _deepCopy(Object? value) => jsonDecode(jsonEncode(value));

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-accounts-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

final class _AdminAccountReadRoute {
  const _AdminAccountReadRoute(this.name, this.path, this.invoke);

  final String name;
  final String path;
  final Future<Object?> Function(Sub2ApiAdminAccountsClient accounts) invoke;
}
