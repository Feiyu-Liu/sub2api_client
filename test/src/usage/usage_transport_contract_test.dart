import 'package:dio/dio.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/session/session_coordinator.dart';
import 'package:sub2api_client/src/shared/session/sub2api_session.dart';
import 'package:sub2api_client/src/shared/transport/request_executor_impl.dart';
import 'package:sub2api_client/src/usage/sub2api_usage_client.dart';
import 'package:sub2api_client/src/usage/sub2api_usage_models.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  const session = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('usage-transport-access'),
    scope: 'https://sub2api.test',
  );

  test('Usage endpoints use the complete v0.1.183 API routes', () async {
    final adapter = JsonResponseAdapter((request) {
      final data = switch (request.path) {
        '/api/v1/usage' => readFixture('usage/list.json'),
        '/api/v1/usage/102' => readFixture('usage/detail.json'),
        '/api/v1/usage/stats' => readFixture('usage/stats.json'),
        _ => throw StateError('Unexpected Usage path: ${request.path}'),
      };
      return JsonResponse(body: _success(data));
    });
    final client = _client(adapter, session);
    final query = Sub2ApiUsageQuery(
      page: 2,
      pageSize: 10,
      apiKeyId: 22,
      groupId: 3,
      model: 'gpt-5',
      requestType: 'responses',
      stream: true,
      billingType: 1,
      billingMode: 'token',
      startDate: DateTime.utc(2026, 8, 24),
      endDate: DateTime.utc(2026, 8, 25),
      timezone: 'Asia/Shanghai',
      sortBy: 'created_at',
      sortOrder: 'asc',
    );

    await client.list(query);
    await client.detail(102);
    await client.stats(query);

    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/usage',
      '/api/v1/usage/102',
      '/api/v1/usage/stats',
    ]);
    for (final request in adapter.requests) {
      expect(request.method, 'GET');
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer usage-transport-access'),
      );
    }
    expect(adapter.requests.first.queryParameters, <String, Object?>{
      'page': 2,
      'page_size': 10,
      'api_key_id': 22,
      'group_id': 3,
      'model': 'gpt-5',
      'request_type': 'responses',
      'stream': true,
      'billing_type': 1,
      'billing_mode': 'token',
      'start_date': '2026-08-24',
      'end_date': '2026-08-25',
      'timezone': 'Asia/Shanghai',
      'sort_by': 'created_at',
      'sort_order': 'asc',
    });
  });

  test('phase 3 Usage management routes map the fixed contracts', () async {
    final adapter = JsonResponseAdapter((request) {
      final data = switch (request.path) {
        '/api/v1/usage/errors' => readFixture('usage/errors_list.json'),
        '/api/v1/usage/errors/901' => readFixture('usage/error_detail.json'),
        '/api/v1/usage/dashboard/stats' => readFixture(
          'usage/dashboard_stats.json',
        ),
        '/api/v1/usage/dashboard/trend' => readFixture(
          'usage/dashboard_trend.json',
        ),
        '/api/v1/usage/dashboard/models' => readFixture(
          'usage/dashboard_models.json',
        ),
        '/api/v1/usage/dashboard/snapshot-v2' => readFixture(
          'usage/dashboard_snapshot.json',
        ),
        '/api/v1/usage/dashboard/api-keys-usage' => readFixture(
          'usage/dashboard_api_keys_usage.json',
        ),
        _ => throw StateError('Unexpected Usage path: ${request.path}'),
      };
      return JsonResponse(body: _success(data));
    });
    final client = _client(adapter, session);
    final dashboardQuery = Sub2ApiUsageDashboardQuery(
      startDate: DateTime.utc(2026, 8, 20),
      endDate: DateTime.utc(2026, 8, 27),
      granularity: Sub2ApiUsageGranularity.day,
      apiKeyId: 22,
      groupId: 3,
      model: 'gpt-5.6',
      requestType: 'responses',
      stream: true,
      billingType: 1,
      billingMode: 'token',
      timezone: 'Asia/Shanghai',
    );

    final errors = await client.listErrors(
      Sub2ApiUsageErrorQuery(
        page: 2,
        pageSize: 10,
        startDate: DateTime.utc(2026, 8, 20),
        endDate: DateTime.utc(2026, 8, 27),
        timezone: 'Asia/Shanghai',
        model: 'gpt-5.6',
        statusCode: 429,
        category: 'rate_limit',
        apiKeyId: 22,
        sortBy: 'status_code',
        sortOrder: 'asc',
      ),
    );
    final detail = await client.errorDetail(901);
    final stats = await client.dashboardStats();
    final trend = await client.dashboardTrend(dashboardQuery);
    final models = await client.dashboardModels(dashboardQuery);
    final snapshot = await client.dashboardSnapshot(
      Sub2ApiUsageDashboardSnapshotRequest(
        query: dashboardQuery,
        includeGroupStats: true,
      ),
    );
    final keyStats = await client.dashboardApiKeysUsage(<int>[22, 23]);

    expect(errors.items.single.category, 'rate_limit');
    expect(errors.items.single.clientIp, '203.0.113.9');
    expect(detail.summary.id, 901);
    expect(detail.upstreamStatusCode, 429);
    expect(stats.totalActualCost.toString(), '9.876');
    expect(stats.byPlatform.single.todayActualCost.toString(), '0.85');
    expect(trend.points.single.totalTokens, 1370);
    expect(trend.startDate, DateTime.utc(2026, 8, 20));
    expect(models.models.single.actualCost.toString(), '0.9876');
    expect(snapshot.generatedAt, DateTime.utc(2026, 8, 27, 3, 5));
    expect(snapshot.groups?.single.groupId, 7);
    expect(keyStats[22]?.totalActualCost.toString(), '12.75');

    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/usage/errors',
      '/api/v1/usage/errors/901',
      '/api/v1/usage/dashboard/stats',
      '/api/v1/usage/dashboard/trend',
      '/api/v1/usage/dashboard/models',
      '/api/v1/usage/dashboard/snapshot-v2',
      '/api/v1/usage/dashboard/api-keys-usage',
    ]);
    expect(adapter.requests.first.queryParameters, <String, Object?>{
      'page': 2,
      'page_size': 10,
      'start_date': '2026-08-20',
      'end_date': '2026-08-27',
      'timezone': 'Asia/Shanghai',
      'model': 'gpt-5.6',
      'status_code': 429,
      'category': 'rate_limit',
      'api_key_id': 22,
      'sort_by': 'status_code',
      'sort_order': 'asc',
    });
    expect(
      adapter.requests[4].queryParameters,
      containsPair('model_source', 'requested'),
    );
    expect(
      adapter.requests[5].queryParameters,
      containsPair('include_trend', true),
    );
    expect(
      adapter.requests[5].queryParameters,
      containsPair('include_group_stats', true),
    );
    expect(adapter.requests.last.method, 'POST');
    expect(adapter.requests.last.data, <String, Object?>{
      'api_key_ids': <int>[22, 23],
    });
  });

  test('phase 3 Usage validation fails before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('network must not be reached'),
    );
    final client = _client(adapter, session);

    expect(
      () => client.errorDetail(0),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'usage.invalid_error_id',
        ),
      ),
    );
    expect(
      () => client.dashboardApiKeysUsage(List<int>.filled(101, 1)),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'usage.too_many_api_key_ids',
        ),
      ),
    );
    expect(
      () => client.dashboardTrend(
        Sub2ApiUsageDashboardQuery(
          startDate: DateTime.utc(2026, 8, 27),
          endDate: DateTime.utc(2026, 8, 20),
        ),
      ),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'usage.invalid_date_range',
        ),
      ),
    );
    expect(adapter.requests, isEmpty);
  });
}

Map<String, Object?> _success(Object? data) => <String, Object?>{
  'code': 0,
  'message': 'success',
  'data': data,
};

Sub2ApiUsageClient _client(
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
  return createSub2ApiUsageClient(dio: dio, requestExecutor: executor);
}
