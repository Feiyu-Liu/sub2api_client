import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_usage_models.dart';
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

  test('Ops executes every admin usage route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    final page = await client.usage.list(
      query: Sub2ApiAdminUsageQuery(
        page: 2,
        pageSize: 10,
        exactTotal: true,
        userId: 7,
        requestType: Sub2ApiAdminUsageRequestType.sync,
        upstreamModelMismatch: false,
        startDate: DateTime(2026, 8, 1),
        endDate: DateTime(2026, 8, 2),
        timezone: 'UTC',
      ),
    );
    final stats = await client.usage.stats(
      query: const Sub2ApiAdminUsageStatsQuery(
        userId: 7,
        period: Sub2ApiAdminUsageStatsPeriod.month,
        bypassCache: true,
      ),
    );
    final users = await client.usage.searchUsers(' deleted@example ');
    final keys = await client.usage.searchApiKeys(
      userId: 7,
      query: ' Production ',
    );
    final tasks = await client.usage.listCleanupTasks(page: 1, pageSize: 20);
    final created = await client.usage.createCleanupTask(
      Sub2ApiAdminCreateUsageCleanupTaskRequest(
        idempotencyKey: 'usage-cleanup-51',
        startDate: DateTime(2026, 8, 1),
        endDate: DateTime(2026, 8, 2),
        userId: 7,
        requestType: Sub2ApiAdminUsageRequestType.sync,
        billingType: Sub2ApiAdminBillingType.balance,
        timezone: 'UTC',
      ),
    );
    final canceled = await client.usage.cancelCleanupTask(51);

    expect(page.items.single.channelId, 12);
    expect(page.items.single.imageInputCost, Sub2ApiDecimal.parse('0.00002'));
    expect(page.items.single.account?.name, 'Primary OpenAI');
    expect(stats.totalAccountCost, Sub2ApiDecimal.parse('0.9'));
    expect(stats.endpoints.single.endpoint, 'responses');
    expect(users.single.deleted, isTrue);
    expect(keys.single.id, 22);
    expect(tasks.items.single.status, Sub2ApiAdminUsageCleanupStatus.pending);
    expect(created.filters.requestType, Sub2ApiAdminUsageRequestType.sync);
    expect(canceled.status, Sub2ApiAdminUsageCleanupStatus.canceled);

    expect(adapter.requests, hasLength(7));
    expect(adapter.requests[0].path, '/api/v1/admin/usage');
    expect(
      adapter.requests[0].queryParameters,
      containsPair('exact_total', true),
    );
    expect(
      adapter.requests[0].queryParameters,
      containsPair('request_type', 'sync'),
    );
    expect(adapter.requests[1].path, '/api/v1/admin/usage/stats');
    expect(adapter.requests[1].queryParameters, containsPair('nocache', true));
    expect(adapter.requests[2].path, '/api/v1/admin/usage/search-users');
    expect(adapter.requests[3].path, '/api/v1/admin/usage/search-api-keys');
    expect(adapter.requests[4].path, '/api/v1/admin/usage/cleanup-tasks');
    expect(adapter.requests[5].path, '/api/v1/admin/usage/cleanup-tasks');
    expect(
      adapter.requests[5].headers,
      containsPair('Idempotency-Key', 'usage-cleanup-51'),
    );
    expect(adapter.requests[5].method, 'POST');
    expect(
      adapter.requests[6].path,
      '/api/v1/admin/usage/cleanup-tasks/51/cancel',
    );
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'usage-key-sentinel',
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

  test('usage validation and malformed data fail closed', () async {
    final validationAdapter = JsonResponseAdapter(
      (_) => throw StateError('no io'),
    );
    final validationClient = _client(configuration, validationAdapter);
    addTearDown(validationClient.close);
    expect(
      () => validationClient.usage.list(
        query: const Sub2ApiAdminUsageQuery(
          requestType: Sub2ApiAdminUsageRequestType.sync,
          stream: false,
        ),
      ),
      throwsA(_code('admin.usage.request_type_stream_conflict')),
    );
    expect(
      () => validationClient.usage.stats(
        query: Sub2ApiAdminUsageStatsQuery(startDate: DateTime(2026, 8, 1)),
      ),
      throwsA(_code('admin.usage.stats_date_range_required')),
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
      malformedClient.usage.cancelCleanupTask(51),
      throwsA(_code('protocol.invalid_admin_usage_response')),
    );
  });

  test('usage cleanup mutation is not replayed', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.usage.cancelCleanupTask(51),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT usage read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('usage-admin-jwt'),
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
    await client.usage.stats();
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer usage-admin-jwt'),
    );
    expect(adapter.requests.last.headers['x-api-key'], isNull);
  });
}

Map<String, Object?> _fixture() => readFixture('admin/usage.json');

Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/stats')) {
    data = _fixture()['stats'];
  } else if (request.path.endsWith('/search-users')) {
    data = _fixture()['users'];
  } else if (request.path.endsWith('/search-api-keys')) {
    data = _fixture()['api_keys'];
  } else if (request.path.endsWith('/cancel')) {
    data = _fixture()['canceled'];
  } else if (request.path.endsWith('/cleanup-tasks')) {
    if (request.method == 'POST') {
      data = _fixture()['cleanup_task'];
    } else {
      data = <String, Object?>{
        'items': <Object?>[_fixture()['cleanup_task']],
        'total': 1,
        'page': 1,
        'page_size': 20,
        'pages': 1,
      };
    }
  } else {
    data = <String, Object?>{
      'items': <Object?>[_fixture()['record']],
      'total': 11,
      'page': 2,
      'page_size': 10,
      'pages': 2,
    };
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('usage-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
