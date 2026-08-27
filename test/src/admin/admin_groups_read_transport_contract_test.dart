import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_group_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_groups_client.dart';
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
    accessToken: Sub2ApiAccessToken('admin-groups-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'Ops groups decodes every fixed read route with API-key isolation',
    () async {
      final adapter = JsonResponseAdapter(
        (request) => JsonResponse(body: _fixtureForRequest(request)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      final results = <Object?>[];
      for (final route in _routes) {
        results.add(await route.invoke(client.groups));
      }

      final page = results[0]! as Sub2ApiAdminGroupPage;
      expect(page.total, 1);
      expect(page.items.single.name, 'openai-research');
      expect(page.items.single.platform, Sub2ApiAdminGroupPlatform.openAi);
      expect(page.items.single.rateMultiplier.toString(), '0.85');
      expect(
        page.items.single.modelPricing.single.inputPrice.toString(),
        '1.25',
      );
      expect(page.items.single.modelRouting['gpt-5.*'], <int>[101, 102]);
      expect(
        page.items.single.videoModelPrices['sora']?['720p'].toString(),
        '0.25',
      );
      expect((results[1]! as List<Sub2ApiAdminGroup>).single.id, 7);
      expect(
        (results[2]! as List<Sub2ApiAdminGroupUsageSummary>).single.totalCost
            .toString(),
        '125.75',
      );
      expect(
        (results[3]! as List<Sub2ApiAdminGroupCapacitySummary>).single.rpmMax,
        120,
      );
      expect(
        (results[4]! as Sub2ApiAdminGroupLiveCapability).supported,
        isFalse,
      );
      expect(
        (results[5]! as Sub2ApiAdminGroupModelsListCandidates).models,
        <String>['gpt-5.2', 'gpt-5-mini'],
      );
      expect(
        (results[6]! as List<Sub2ApiAdminCompositeRoute>).single.endpoint,
        Sub2ApiAdminCompositeRouteEndpoint.responses,
      );
      expect((results[7]! as Sub2ApiAdminGroup).accountCount, 3);
      expect((results[8]! as Sub2ApiAdminGroupStats).totalRequests, 42);
      expect(
        (results[9]! as List<Sub2ApiAdminGroupRateEntry>).single.rateMultiplier
            .toString(),
        '0.9',
      );
      final apiKeys = results[10]! as Sub2ApiAdminGroupApiKeyPage;
      expect(apiKeys.items.single.secret.toString(), '<redacted>');
      expect(
        apiKeys.items.single.secret.reveal(),
        'admin-api-key-list-secret-sentinel',
      );

      expect(
        adapter.requests.map((request) => request.path),
        _routes.map((route) => route.path),
      );
      for (final request in adapter.requests) {
        expect(
          request.headers,
          containsPair('x-api-key', 'admin-groups-key-sentinel'),
        );
        expect(request.headers, isNot(contains('Authorization')));
      }
      expect(adapter.requests[0].queryParameters, <String, dynamic>{
        'page': 2,
        'page_size': 25,
        'platform': 'openai',
        'status': 'active',
        'search': 'research',
        'is_exclusive': true,
        'sort_by': 'name',
        'sort_order': 'desc',
      });
      expect(adapter.requests[1].queryParameters, <String, dynamic>{
        'platform': 'openai',
        'include_inactive': true,
      });
      expect(
        adapter.requests[5].queryParameters,
        containsPair('platform', 'openai'),
      );
      expect(adapter.requests[10].queryParameters, <String, dynamic>{
        'page': 3,
        'page_size': 10,
      });
    },
  );

  test('Admin JWT groups sends every read route after role checks', () async {
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
      await route.invoke(client.groups);
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
        containsPair('Authorization', 'Bearer admin-groups-jwt-sentinel'),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test('every groups read route preserves business failure', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 404,
        body: readFixture('admin/group_business_failure.json'),
      ),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    for (final route in _routes) {
      await expectLater(
        route.invoke(client.groups),
        throwsA(_code('server.group_not_found')),
        reason: route.name,
      );
    }
  });

  test(
    'every groups read route preserves invalid Admin API Key failure',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          statusCode: 401,
          body: readFixture('admin/group_auth_failure.json'),
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      for (final route in _routes) {
        await expectLater(
          route.invoke(client.groups),
          throwsA(_code('server.invalid_api_key')),
          reason: route.name,
        );
      }
    },
  );

  test('every groups read route rejects malformed success contract', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('admin/group_malformed.json')),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    for (final route in _routes) {
      await expectLater(
        route.invoke(client.groups),
        throwsA(_code('protocol.invalid_admin_group_response')),
        reason: route.name,
      );
    }
  });

  test('groups query validation fails before network I/O', () async {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.groups.getById(0),
      throwsA(_code('admin.groups.invalid_group_id')),
    );
    expect(
      () => client.groups.list(
        query: const Sub2ApiAdminGroupListQuery(pageSize: 101),
      ),
      throwsA(_code('admin.groups.invalid_page_size')),
    );
    expect(
      () => client.groups.list(
        query: Sub2ApiAdminGroupListQuery(search: 'x' * 101),
      ),
      throwsA(_code('admin.groups.search_too_long')),
    );
    expect(
      () => client.groups.list(
        query: const Sub2ApiAdminGroupListQuery(sortOrder: 'sideways'),
      ),
      throwsA(_code('admin.groups.invalid_sort_order')),
    );
    expect(adapter.requests, isEmpty);
  });
}

final _routes = <_AdminGroupReadRoute>[
  _AdminGroupReadRoute(
    'list',
    '/api/v1/admin/groups',
    (groups) => groups.list(
      query: const Sub2ApiAdminGroupListQuery(
        page: 2,
        pageSize: 25,
        platform: Sub2ApiAdminGroupPlatform.openAi,
        status: Sub2ApiAdminGroupStatus.active,
        search: ' research ',
        isExclusive: true,
        sortBy: 'name',
        sortOrder: 'desc',
      ),
    ),
  ),
  _AdminGroupReadRoute(
    'all',
    '/api/v1/admin/groups/all',
    (groups) => groups.getAll(
      platform: Sub2ApiAdminGroupPlatform.openAi,
      includeInactive: true,
    ),
  ),
  _AdminGroupReadRoute(
    'usage summary',
    '/api/v1/admin/groups/usage-summary',
    (groups) => groups.getUsageSummary(),
  ),
  _AdminGroupReadRoute(
    'capacity summary',
    '/api/v1/admin/groups/capacity-summary',
    (groups) => groups.getCapacitySummary(),
  ),
  _AdminGroupReadRoute(
    'live capability',
    '/api/v1/admin/groups/live-capability',
    (groups) => groups.getLiveCapability(),
  ),
  _AdminGroupReadRoute(
    'model candidates',
    '/api/v1/admin/groups/7/models-list-candidates',
    (groups) => groups.getModelsListCandidates(
      7,
      platform: Sub2ApiAdminGroupPlatform.openAi,
    ),
  ),
  _AdminGroupReadRoute(
    'composite routes',
    '/api/v1/admin/groups/7/composite-routes',
    (groups) => groups.listCompositeRoutes(7),
  ),
  _AdminGroupReadRoute(
    'detail',
    '/api/v1/admin/groups/7',
    (groups) => groups.getById(7),
  ),
  _AdminGroupReadRoute(
    'stats',
    '/api/v1/admin/groups/7/stats',
    (groups) => groups.getStats(7),
  ),
  _AdminGroupReadRoute(
    'rate multipliers',
    '/api/v1/admin/groups/7/rate-multipliers',
    (groups) => groups.getRateMultipliers(7),
  ),
  _AdminGroupReadRoute(
    'api keys',
    '/api/v1/admin/groups/7/api-keys',
    (groups) => groups.getApiKeys(7, page: 3, pageSize: 10),
  ),
];

Map<String, Object?> _fixtureForRequest(RequestOptions request) => switch ((
  request.method,
  request.path,
)) {
  ('GET', '/api/v1/admin/groups') => _pageFixture(),
  ('GET', '/api/v1/admin/groups/all') => _listFixture(),
  ('GET', '/api/v1/admin/groups/usage-summary') => _summaryFixture('usage'),
  ('GET', '/api/v1/admin/groups/capacity-summary') => _summaryFixture(
    'capacity',
  ),
  ('GET', '/api/v1/admin/groups/live-capability') => _summaryFixture('live'),
  ('GET', '/api/v1/admin/groups/7/models-list-candidates') => _summaryFixture(
    'models',
  ),
  ('GET', '/api/v1/admin/groups/7/composite-routes') => _summaryFixture(
    'composite_routes',
  ),
  ('GET', '/api/v1/admin/groups/7') => readFixture('admin/group_detail.json'),
  ('GET', '/api/v1/admin/groups/7/stats') => _summaryFixture('stats'),
  ('GET', '/api/v1/admin/groups/7/rate-multipliers') => _summaryFixture(
    'rates',
  ),
  ('GET', '/api/v1/admin/groups/7/api-keys') => readFixture(
    'admin/user_api_keys.json',
  ),
  _ => throw StateError('unexpected request ${request.method} ${request.path}'),
};

Map<String, Object?> _pageFixture() => <String, Object?>{
  'code': 0,
  'message': 'success',
  'data': <String, Object?>{
    'items': <Object?>[_groupData()],
    'total': 1,
    'page': 2,
    'page_size': 25,
    'pages': 1,
  },
};

Map<String, Object?> _listFixture() => <String, Object?>{
  'code': 0,
  'message': 'success',
  'data': <Object?>[_groupData()],
};

Map<String, Object?> _summaryFixture(String key) {
  final source = readFixture('admin/group_read_summaries.json');
  final data = source['data'];
  if (data is! Map || !data.containsKey(key)) {
    throw StateError('missing fixed group fixture $key');
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data[key]};
}

Object? _groupData() => readFixture('admin/group_detail.json')['data'];

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-groups-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

final class _AdminGroupReadRoute {
  const _AdminGroupReadRoute(this.name, this.path, this.invoke);

  final Future<Object?> Function(Sub2ApiAdminGroupsClient groups) invoke;
  final String name;
  final String path;
}
