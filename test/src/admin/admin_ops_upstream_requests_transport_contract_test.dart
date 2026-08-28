import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_ops_dashboard_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_ops_error_models.dart';
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
  final errorQuery = Sub2ApiAdminOpsErrorQuery(
    timeRange: Sub2ApiAdminOpsTimeRange.oneHour,
    platform: ' openai ',
    accountId: 42,
    resolved: false,
  );
  const requestQuery = Sub2ApiAdminOpsRequestQuery(
    kind: Sub2ApiAdminOpsRequestKind.error,
    platform: 'openai',
    groupId: 7,
    userId: 21,
    apiKeyId: 9,
    accountId: 42,
    model: 'gpt-5.6',
    requestId: 'request-81',
    minDurationMs: 100,
    maxDurationMs: 1000,
    sort: Sub2ApiAdminOpsRequestSort.durationDescending,
  );
  test('Ops executes upstream errors and request drilldown routes', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    final upstream = await client.operationsErrors.listUpstreamErrors(
      query: errorQuery,
    );
    final detail = await client.operationsErrors.getUpstreamError(81);
    final resolved = await client.operationsErrors.resolveUpstreamError(
      81,
      resolved: true,
    );
    final requests = await client.operationsErrors.listRequests(
      query: requestQuery,
    );
    expect(upstream.items.single.message.toString(), '<redacted>');
    expect(detail.upstreamErrors.toString(), '<redacted>');
    expect(resolved.ok, isTrue);
    expect(requests.items.single.kind, Sub2ApiAdminOpsRequestKind.error);
    expect(requests.items.single.message.toString(), '<redacted>');
    expect(requests.items.single.durationMs, 530);
    expect(adapter.requests.map((r) => r.path), <String>[
      '/api/v1/admin/ops/upstream-errors',
      '/api/v1/admin/ops/upstream-errors/81',
      '/api/v1/admin/ops/upstream-errors/81/resolve',
      '/api/v1/admin/ops/requests',
    ]);
    expect(
      adapter.requests.first.queryParameters,
      containsPair('account_id', 42),
    );
    expect(
      adapter.requests.last.queryParameters,
      containsPair('kind', 'error'),
    );
    expect(
      adapter.requests.last.queryParameters,
      containsPair('sort', 'duration_desc'),
    );
    expect(adapter.requests[2].data, containsPair('resolved', true));
    expect(
      adapter.requests.every(
        (r) => r.headers['x-api-key'] == 'ops-upstream-key',
      ),
      isTrue,
    );
  });
  test('request drilldown validation fails before I/O', () async {
    final adapter = JsonResponseAdapter((_) {
      throw StateError('no io');
    });
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    expect(
      () => client.operationsErrors.listRequests(
        query: const Sub2ApiAdminOpsRequestQuery(
          minDurationMs: 100,
          maxDurationMs: 10,
        ),
      ),
      throwsA(_code('admin.ops.invalid_duration_range')),
    );
    expect(adapter.requests, isEmpty);
  });
  test('malformed request drilldown fails closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{
            'items': <Object?>[
              <String, Object?>{'kind': 'unknown'},
            ],
            'total': 1,
            'page': 1,
            'page_size': 50,
            'pages': 1,
          },
        },
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.operationsErrors.listRequests(),
      throwsA(_code('protocol.invalid_admin_ops_error_response')),
    );
  });
}

Map<String, Object?> _errors() => readFixture('admin/ops_errors.json');
Map<String, Object?> _requests() => readFixture('admin/ops_requests.json');
Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/resolve')) {
    data = <String, Object?>{'ok': true};
  } else if (request.path.endsWith('/81')) {
    data = _errors()['detail'];
  } else if (request.path.endsWith('/requests')) {
    data = <String, Object?>{
      'items': <Object?>[_requests()['request']],
      'total': 1,
      'page': 1,
      'page_size': 50,
      'pages': 1,
    };
  } else {
    data = <String, Object?>{
      'items': <Object?>[_errors()['summary']],
      'total': 1,
      'page': 1,
      'page_size': 20,
      'pages': 1,
    };
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('ops-upstream-key'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((e) => e.code, 'code', code);
