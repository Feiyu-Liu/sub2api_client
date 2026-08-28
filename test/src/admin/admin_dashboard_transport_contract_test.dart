import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_dashboard_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_models.dart';
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
    accessToken: Sub2ApiAccessToken('admin-dashboard-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops dashboard decodes every fixed v0.1.183 route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _fixtureForPath(request.path)),
    );
    final client = createSub2ApiOpsClientForTesting(
      configuration: configuration,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('admin-dashboard-key-sentinel'),
      ),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    final results = <Object?>[];
    for (final route in _routes) {
      results.add(await route.invoke(client.dashboard));
    }

    expect(results[0], isA<Sub2ApiAdminDashboardStats>());
    expect(
      (results[0]! as Sub2ApiAdminDashboardStats).statsUpdatedAt,
      DateTime.utc(2026, 8, 27, 6),
    );
    expect((results[0]! as Sub2ApiAdminDashboardStats).uptime, 86400);
    expect(
      (results[2]! as Sub2ApiAdminDashboardTrend).points.single.actualCost
          .toString(),
      '1',
    );
    expect(
      (results[3]! as Sub2ApiAdminDashboardModels).models.single.accountCost
          .toString(),
      '0.6',
    );
    expect(
      (results[4]! as Sub2ApiAdminDashboardGroups).groups.single.accountCost
          .toString(),
      '0.54',
    );
    final users = results[8]! as Map<int, Sub2ApiAdminBatchUserUsageStats>;
    expect(users[21]!.byPlatform, hasLength(1));
    expect(users[22]!.byPlatform, isNull);
    expect(
      (results[11]! as Sub2ApiAdminDashboardSnapshot).stats!.totalAccountCost
          .toString(),
      '75.25',
    );
    expect(
      (results[12]! as Sub2ApiAdminAggregationBackfillResult).status,
      'accepted',
    );

    expect(
      adapter.requests.map((request) => request.path),
      _routes.map((route) => route.path),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('x-api-key', 'admin-dashboard-key-sentinel'),
      );
      expect(request.headers, isNot(contains('Authorization')));
    }

    final trend = _request(adapter, '/api/v1/admin/dashboard/trend');
    expect(trend.queryParameters, containsPair('request_type', 'ws_v2'));
    expect(trend.queryParameters, isNot(contains('stream')));
    expect(trend.queryParameters, containsPair('billing_type', 1));
    expect(
      trend.queryParameters,
      containsPair('upstream_model_mismatch', true),
    );
    final models = _request(adapter, '/api/v1/admin/dashboard/models');
    expect(models.queryParameters, containsPair('model_source', 'upstream'));
    final breakdown = _request(
      adapter,
      '/api/v1/admin/dashboard/user-breakdown',
    );
    expect(breakdown.queryParameters, containsPair('sort_by', 'actual_cost'));
    expect(
      breakdown.queryParameters,
      containsPair('endpoint_type', 'upstream'),
    );
    expect(
      _request(adapter, '/api/v1/admin/dashboard/users-usage').data,
      <String, Object?>{
        'user_ids': <int>[21, 22],
      },
    );
    expect(
      _request(adapter, '/api/v1/admin/dashboard/api-keys-usage').data,
      <String, Object?>{
        'api_key_ids': <int>[11, 12],
      },
    );
    expect(
      _request(adapter, '/api/v1/admin/dashboard/aggregation/backfill').data,
      <String, Object?>{
        'start': '2026-08-20T00:00:00.000Z',
        'end': '2026-08-21T00:00:00.000Z',
      },
    );
  });

  test(
    'Admin JWT mode sends every dashboard route after role checks',
    () async {
      final adapter = JsonResponseAdapter((request) {
        if (request.path == '/api/v1/auth/me') {
          return JsonResponse(
            body: readFixture('auth/current_user_success.json'),
          );
        }
        return JsonResponse(body: _fixtureForPath(request.path));
      });
      final client = createSub2ApiAdminClientForTesting(
        configuration: configuration,
        sessionStore: RecordingSessionStore(session),
        dio: _dio(adapter),
      );
      addTearDown(client.close);

      for (final route in _routes) {
        await route.invoke(client.dashboard);
      }

      final businessRequests = adapter.requests.where(
        (request) => request.path != '/api/v1/auth/me',
      );
      expect(
        businessRequests.map((request) => request.path),
        _routes.map((e) => e.path),
      );
      expect(
        adapter.requests.where((request) => request.path == '/api/v1/auth/me'),
        hasLength(_routes.length),
      );
      for (final request in adapter.requests) {
        expect(
          request.headers,
          containsPair('Authorization', 'Bearer admin-dashboard-jwt-sentinel'),
        );
        expect(request.headers, isNot(contains('x-api-key')));
      }
    },
  );

  for (final route in _routes) {
    test('${route.name} preserves business failure', () async {
      final client = _opsClient(
        configuration,
        JsonResponseAdapter(
          (_) => JsonResponse(
            statusCode: 403,
            body: readFixture('admin/dashboard_business_failure.json'),
          ),
        ),
      );
      addTearDown(client.close);

      await expectLater(
        route.invoke(client.dashboard),
        throwsA(
          isA<Sub2ApiException>()
              .having(
                (error) => error.kind,
                'kind',
                Sub2ApiFailureKind.forbidden,
              )
              .having(
                (error) => error.code,
                'code',
                'server.dashboard_backfill_disabled',
              ),
        ),
      );
    });

    test('${route.name} preserves invalid Admin API Key failure', () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          statusCode: 401,
          body: readFixture('admin/dashboard_auth_failure.json'),
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      await expectLater(
        route.invoke(client.dashboard),
        throwsA(
          isA<Sub2ApiException>()
              .having(
                (error) => error.kind,
                'kind',
                Sub2ApiFailureKind.unauthorized,
              )
              .having((error) => error.code, 'code', 'auth.unauthorized'),
        ),
      );
      expect(adapter.requests, hasLength(1));
      expect(adapter.requests.single.headers, isNot(contains('Authorization')));
    });

    test('${route.name} rejects malformed success data', () async {
      final client = _opsClient(
        configuration,
        JsonResponseAdapter(
          (_) =>
              JsonResponse(body: readFixture('admin/dashboard_malformed.json')),
        ),
      );
      addTearDown(client.close);

      await expectLater(
        route.invoke(client.dashboard),
        throwsA(
          isA<Sub2ApiException>().having(
            (error) => error.code,
            'code',
            'protocol.invalid_admin_dashboard_response',
          ),
        ),
      );
    });
  }

  test('dashboard validates typed queries before network I/O', () async {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('network must not be reached'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.dashboard.getUsageTrend(
        query: Sub2ApiAdminUsageTrendQuery(
          filter: Sub2ApiAdminDashboardFilter(
            startDate: DateTime.utc(2026, 8, 22),
            endDate: DateTime.utc(2026, 8, 20),
          ),
        ),
      ),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'admin.dashboard.invalid_date_range',
        ),
      ),
    );
    expect(
      () => client.dashboard.getBatchApiKeysUsage(<int>[0]),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'admin.dashboard.invalid_api_key_id',
        ),
      ),
    );
    expect(adapter.requests, isEmpty);
  });
}

final _routes = <_DashboardRoute>[
  _DashboardRoute(
    'stats',
    '/api/v1/admin/dashboard/stats',
    (dashboard) => dashboard.getStats(),
  ),
  _DashboardRoute(
    'realtime',
    '/api/v1/admin/dashboard/realtime',
    (dashboard) => dashboard.getRealtimeMetrics(),
  ),
  _DashboardRoute(
    'trend',
    '/api/v1/admin/dashboard/trend',
    (dashboard) => dashboard.getUsageTrend(
      query: Sub2ApiAdminUsageTrendQuery(
        filter: Sub2ApiAdminDashboardFilter(
          startDate: DateTime.utc(2026, 8, 20),
          endDate: DateTime.utc(2026, 8, 27),
          timezone: 'Asia/Shanghai',
          userId: 21,
          apiKeyId: 11,
          accountId: 31,
          groupId: 7,
          requestType: Sub2ApiAdminUsageRequestType.webSocketV2,
          stream: true,
          billingType: Sub2ApiAdminBillingType.subscription,
          upstreamModelMismatch: true,
        ),
        model: 'claude-sonnet-4-20250514',
      ),
    ),
  ),
  _DashboardRoute(
    'models',
    '/api/v1/admin/dashboard/models',
    (dashboard) => dashboard.getModelStats(
      query: const Sub2ApiAdminModelStatsQuery(
        modelSource: Sub2ApiAdminModelSource.upstream,
      ),
    ),
  ),
  _DashboardRoute(
    'groups',
    '/api/v1/admin/dashboard/groups',
    (dashboard) => dashboard.getGroupStats(),
  ),
  _DashboardRoute(
    'api-key trend',
    '/api/v1/admin/dashboard/api-keys-trend',
    (dashboard) => dashboard.getApiKeyUsageTrend(
      query: const Sub2ApiAdminEntityTrendQuery(limit: 5),
    ),
  ),
  _DashboardRoute(
    'user trend',
    '/api/v1/admin/dashboard/users-trend',
    (dashboard) => dashboard.getUserUsageTrend(
      query: const Sub2ApiAdminEntityTrendQuery(limit: 12),
    ),
  ),
  _DashboardRoute(
    'user ranking',
    '/api/v1/admin/dashboard/users-ranking',
    (dashboard) => dashboard.getUserSpendingRanking(
      query: const Sub2ApiAdminUserSpendingRankingQuery(limit: 12),
    ),
  ),
  _DashboardRoute(
    'batch users',
    '/api/v1/admin/dashboard/users-usage',
    (dashboard) => dashboard.getBatchUsersUsage(<int>[22, 21, 22]),
  ),
  _DashboardRoute(
    'batch API keys',
    '/api/v1/admin/dashboard/api-keys-usage',
    (dashboard) => dashboard.getBatchApiKeysUsage(<int>[12, 11, 12]),
  ),
  _DashboardRoute(
    'user breakdown',
    '/api/v1/admin/dashboard/user-breakdown',
    (dashboard) => dashboard.getUserBreakdown(
      query: const Sub2ApiAdminUserBreakdownQuery(
        model: 'claude-sonnet-4-20250514',
        modelSource: Sub2ApiAdminModelSource.upstream,
        endpoint: '/v1/messages',
        endpointType: Sub2ApiAdminEndpointType.upstream,
        sortBy: Sub2ApiAdminUserBreakdownSort.actualCost,
      ),
    ),
  ),
  _DashboardRoute(
    'snapshot',
    '/api/v1/admin/dashboard/snapshot-v2',
    (dashboard) => dashboard.getSnapshot(
      request: const Sub2ApiAdminDashboardSnapshotRequest(
        includeGroupStats: true,
        includeUsersTrend: true,
      ),
    ),
  ),
  _DashboardRoute(
    'aggregation backfill',
    '/api/v1/admin/dashboard/aggregation/backfill',
    (dashboard) => dashboard.backfillAggregation(
      Sub2ApiAdminAggregationBackfillRequest(
        start: DateTime.utc(2026, 8, 20),
        end: DateTime.utc(2026, 8, 21),
      ),
    ),
  ),
];

Map<String, Object?> _fixtureForPath(String path) => switch (path) {
  '/api/v1/admin/dashboard/stats' => readFixture('admin/dashboard_stats.json'),
  '/api/v1/admin/dashboard/realtime' => readFixture(
    'admin/dashboard_realtime.json',
  ),
  '/api/v1/admin/dashboard/trend' => readFixture('admin/dashboard_trend.json'),
  '/api/v1/admin/dashboard/models' => readFixture(
    'admin/dashboard_models.json',
  ),
  '/api/v1/admin/dashboard/groups' => readFixture(
    'admin/dashboard_groups.json',
  ),
  '/api/v1/admin/dashboard/api-keys-trend' => readFixture(
    'admin/dashboard_api_keys_trend.json',
  ),
  '/api/v1/admin/dashboard/users-trend' => readFixture(
    'admin/dashboard_users_trend.json',
  ),
  '/api/v1/admin/dashboard/users-ranking' => readFixture(
    'admin/dashboard_users_ranking.json',
  ),
  '/api/v1/admin/dashboard/users-usage' => readFixture(
    'admin/dashboard_users_usage.json',
  ),
  '/api/v1/admin/dashboard/api-keys-usage' => readFixture(
    'admin/dashboard_api_keys_usage.json',
  ),
  '/api/v1/admin/dashboard/user-breakdown' => readFixture(
    'admin/dashboard_user_breakdown.json',
  ),
  '/api/v1/admin/dashboard/snapshot-v2' => readFixture(
    'admin/dashboard_snapshot_v2.json',
  ),
  '/api/v1/admin/dashboard/aggregation/backfill' => readFixture(
    'admin/dashboard_aggregation_backfill.json',
  ),
  _ => throw StateError('unexpected path $path'),
};

RequestOptions _request(JsonResponseAdapter adapter, String path) =>
    adapter.requests.singleWhere((request) => request.path == path);

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('invalid-or-test-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

final class _DashboardRoute {
  const _DashboardRoute(this.name, this.path, this.invoke);

  final String name;
  final String path;
  final Future<Object?> Function(Sub2ApiAdminDashboardClient dashboard) invoke;
}
