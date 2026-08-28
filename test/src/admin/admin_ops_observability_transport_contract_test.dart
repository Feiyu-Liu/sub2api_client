import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_ops_dashboard_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_ops_observability_models.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';

void main() {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );

  test('Ops executes every HTTP observability route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    final ingress = await client.operationsObservability.listIngressRejects(
      query: const Sub2ApiAdminOpsIngressRejectQuery(
        timeRange: Sub2ApiAdminOpsTimeRange.oneHour,
        reason: Sub2ApiAdminOpsIngressRejectReason.invalidApiKey,
        routeFamily: Sub2ApiAdminOpsIngressRouteFamily.chatCompletions,
        protocol: Sub2ApiAdminOpsIngressProtocol.openai,
        clientAddress: '2001:db8::1',
        userId: 21,
        apiKeyId: 9,
      ),
    );
    final ingressHealth = await client.operationsObservability
        .getIngressRejectHealth();
    final authCache = await client.operationsObservability.getAuthCacheHealth();
    final logs = await client.operationsObservability.listSystemLogs(
      query: const Sub2ApiAdminOpsSystemLogQuery(
        filter: Sub2ApiAdminOpsSystemLogFilter(
          host: ' sub2api-1 ',
          level: ' error ',
          component: ' provider.openai ',
          requestId: ' request-81 ',
          userId: 21,
          apiKeyId: 9,
          accountId: 42,
          platform: ' openai ',
          model: ' gpt-5.6 ',
        ),
      ),
    );
    final cleanup = await client.operationsObservability.cleanupSystemLogs(
      const Sub2ApiAdminOpsSystemLogCleanupRequest(
        filter: Sub2ApiAdminOpsSystemLogFilter(requestId: ' request-81 '),
      ),
    );
    final logHealth = await client.operationsObservability.getSystemLogHealth();

    expect(ingress.items.single.clientAddress.toString(), '<redacted>');
    expect(ingress.items.single.requestCount, 12);
    expect(ingressHealth.capacity, 8192);
    expect(authCache.outbox.oldestLag, const Duration(seconds: 5));
    expect(authCache.subscriber.connected, isTrue);
    expect(logs.items.single.message.toString(), '<redacted>');
    expect(logs.items.single.extra.toString(), '<redacted>');
    expect(cleanup.deleted, 7);
    expect(logHealth.averageWriteDelay, const Duration(milliseconds: 12));
    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/admin/ops/ingress-rejections',
      '/api/v1/admin/ops/ingress-rejections/health',
      '/api/v1/admin/ops/auth-cache-invalidation/health',
      '/api/v1/admin/ops/system-logs',
      '/api/v1/admin/ops/system-logs/cleanup',
      '/api/v1/admin/ops/system-logs/health',
    ]);
    expect(
      adapter.requests.first.queryParameters,
      containsPair('route_family', 'chat_completions'),
    );
    expect(
      adapter.requests.first.queryParameters,
      containsPair('client_ip', '2001:db8::1'),
    );
    expect(
      adapter.requests[3].queryParameters,
      containsPair('component', 'provider.openai'),
    );
    expect(adapter.requests[4].data, containsPair('request_id', 'request-81'));
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'ops-observability-key',
      ),
      isTrue,
    );
  });

  test('observability validation fails before network I/O', () async {
    final adapter = JsonResponseAdapter((_) => throw StateError('no io'));
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.operationsObservability.listIngressRejects(
        query: const Sub2ApiAdminOpsIngressRejectQuery(
          clientAddress: 'not-an-ip',
        ),
      ),
      throwsA(_code('admin.ops.invalid_client_address')),
    );
    expect(
      () => client.operationsObservability.cleanupSystemLogs(
        const Sub2ApiAdminOpsSystemLogCleanupRequest(
          filter: Sub2ApiAdminOpsSystemLogFilter(),
        ),
      ),
      throwsA(_code('admin.ops.system_log_cleanup_filter_required')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('malformed observability response fails closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{
            'items': <Object?>[
              <String, Object?>{'id': 0},
            ],
            'total': 1,
            'page': 1,
            'page_size': 20,
          },
        },
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.operationsObservability.listIngressRejects(),
      throwsA(_code('protocol.invalid_admin_ops_observability_response')),
    );
  });

  test('system log cleanup is not replayed after 401', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.operationsObservability.cleanupSystemLogs(
        const Sub2ApiAdminOpsSystemLogCleanupRequest(
          filter: Sub2ApiAdminOpsSystemLogFilter(requestId: 'request-81'),
        ),
      ),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });
}

Map<String, Object?> _fixture() => readFixture('admin/ops_observability.json');

Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/ingress-rejections')) {
    data = _fixture()['ingress'];
  } else if (request.path.endsWith('/ingress-rejections/health')) {
    data = _fixture()['ingress_health'];
  } else if (request.path.endsWith('/auth-cache-invalidation/health')) {
    data = _fixture()['auth_cache_health'];
  } else if (request.path.endsWith('/system-logs/cleanup')) {
    data = <String, Object?>{'deleted': 7};
  } else if (request.path.endsWith('/system-logs/health')) {
    data = _fixture()['system_log_health'];
  } else {
    data = _fixture()['system_logs'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('ops-observability-key'),
  ),
  dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
    ..httpClientAdapter = adapter,
);

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
