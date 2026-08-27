import 'package:dio/dio.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
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
