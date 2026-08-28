import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_ops_dashboard_models.dart';
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
  const query = Sub2ApiAdminOpsDashboardQuery(
    platform: ' openai ',
    groupId: 7,
    queryMode: Sub2ApiAdminOpsQueryMode.raw,
  );

  test('Ops executes every typed operations dashboard route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    final snapshot = await client.operationsDashboard.getSnapshot(query: query);
    final overview = await client.operationsDashboard.getOverview(query: query);
    final throughput = await client.operationsDashboard.getThroughputTrend(
      query: query,
    );
    final latency = await client.operationsDashboard.getLatencyHistogram(
      query: query,
    );
    final errors = await client.operationsDashboard.getErrorTrend(query: query);
    final distribution = await client.operationsDashboard.getErrorDistribution(
      query: query,
    );
    final tokens = await client.operationsDashboard.getOpenAITokenStats(
      query: const Sub2ApiAdminOpsOpenAITokenStatsQuery(
        platform: 'openai',
        groupId: 7,
      ),
    );

    expect(snapshot.overview.healthScore, 96);
    expect(overview.systemMetrics?.cpuUsagePercent.toString(), '12.5');
    expect(overview.jobHeartbeats.single.jobName, 'cleanup');
    expect(throughput.points.single.qps.toString(), '2.5');
    expect(latency.buckets.single.count, 500);
    expect(errors.points.single.upstream429Count, 4);
    expect(distribution.items.single.statusCode, 429);
    expect(tokens.items.single.averageTokensPerSecond.toString(), '85.5');
    expect(adapter.requests.map((r) => r.path), <String>[
      '/api/v1/admin/ops/dashboard/snapshot-v2',
      '/api/v1/admin/ops/dashboard/overview',
      '/api/v1/admin/ops/dashboard/throughput-trend',
      '/api/v1/admin/ops/dashboard/latency-histogram',
      '/api/v1/admin/ops/dashboard/error-trend',
      '/api/v1/admin/ops/dashboard/error-distribution',
      '/api/v1/admin/ops/dashboard/openai-token-stats',
    ]);
    expect(
      adapter.requests.first.queryParameters,
      containsPair('platform', 'openai'),
    );
    expect(adapter.requests.first.queryParameters, containsPair('mode', 'raw'));
    expect(
      adapter.requests.last.queryParameters,
      containsPair('time_range', '30d'),
    );
    expect(
      adapter.requests.every(
        (r) => r.headers['x-api-key'] == 'ops-dashboard-key',
      ),
      isTrue,
    );
    expect(
      adapter.requests.every((r) => r.headers['Authorization'] == null),
      isTrue,
    );
  });

  test('dashboard query validation fails before I/O', () async {
    final adapter = JsonResponseAdapter((_) {
      throw StateError('no io');
    });
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    expect(
      () => client.operationsDashboard.getOverview(
        query: Sub2ApiAdminOpsDashboardQuery(
          startAt: DateTime.utc(2026, 8, 28, 8),
          endAt: DateTime.utc(2026, 8, 28, 7),
        ),
      ),
      throwsA(_code('admin.ops.invalid_time_range')),
    );
    expect(
      () => client.operationsDashboard.getOpenAITokenStats(
        query: const Sub2ApiAdminOpsOpenAITokenStatsQuery(topN: 101),
      ),
      throwsA(_code('admin.ops.invalid_top_n')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('malformed dashboard response fails closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'health_score': 101},
        },
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.operationsDashboard.getOverview(),
      throwsA(_code('protocol.invalid_admin_ops_dashboard_response')),
    );
  });

  test('Admin JWT operations dashboard runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('ops-dashboard-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter(
      (request) => request.path == '/api/v1/auth/me'
          ? JsonResponse(body: readFixture('auth/current_user_success.json'))
          : JsonResponse(body: _response(request)),
    );
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = adapter,
    );
    addTearDown(client.close);
    await client.operationsDashboard.getOverview();
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer ops-dashboard-jwt'),
    );
  });
}

Map<String, Object?> _fixture() => readFixture('admin/ops_dashboard.json');
Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/snapshot-v2')) {
    data = <String, Object?>{
      'generated_at': '2026-08-28T08:00:00Z',
      'overview': _fixture()['overview'],
      'throughput_trend': _fixture()['throughput'],
      'error_trend': _fixture()['error_trend'],
    };
  } else if (request.path.endsWith('/overview')) {
    data = _fixture()['overview'];
  } else if (request.path.endsWith('/throughput-trend')) {
    data = _fixture()['throughput'];
  } else if (request.path.endsWith('/latency-histogram')) {
    data = _fixture()['latency'];
  } else if (request.path.endsWith('/error-trend')) {
    data = _fixture()['error_trend'];
  } else if (request.path.endsWith('/error-distribution')) {
    data = _fixture()['error_distribution'];
  } else {
    data = _fixture()['openai_tokens'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('ops-dashboard-key'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((e) => e.code, 'code', code);
