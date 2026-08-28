import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_ops_realtime_models.dart';
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
  const filter = Sub2ApiAdminOpsRealtimeFilter(
    platform: ' openai ',
    groupId: 7,
  );
  test('Ops executes every realtime operations route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    final concurrency = await client.operationsRealtime.getConcurrency(
      filter: filter,
    );
    final users = await client.operationsRealtime.getUserConcurrency();
    final availability = await client.operationsRealtime.getAccountAvailability(
      filter: filter,
    );
    final traffic = await client.operationsRealtime.getTraffic(
      query: const Sub2ApiAdminOpsRealtimeTrafficQuery(
        window: Sub2ApiAdminOpsRealtimeWindow.fiveMinutes,
        platform: 'openai',
        groupId: 7,
      ),
    );
    expect(concurrency.platforms['openai']?.loadPercentage.toString(), '40');
    expect(concurrency.groups[7]?.currentInUse, 4);
    expect(users.users[21]?.userEmail, 'user@example.test');
    expect(availability.accounts[42]?.isAvailable, isTrue);
    expect(traffic.qps.current.toString(), '2.5');
    expect(traffic.window, '5min');
    expect(adapter.requests.map((r) => r.path), <String>[
      '/api/v1/admin/ops/concurrency',
      '/api/v1/admin/ops/user-concurrency',
      '/api/v1/admin/ops/account-availability',
      '/api/v1/admin/ops/realtime-traffic',
    ]);
    expect(
      adapter.requests.first.queryParameters,
      containsPair('platform', 'openai'),
    );
    expect(
      adapter.requests.last.queryParameters,
      containsPair('window', '5min'),
    );
    expect(
      adapter.requests.every(
        (r) => r.headers['x-api-key'] == 'ops-realtime-key',
      ),
      isTrue,
    );
    expect(
      adapter.requests.every((r) => r.headers['Authorization'] == null),
      isTrue,
    );
  });
  test('realtime validation fails before I/O', () async {
    final adapter = JsonResponseAdapter((_) {
      throw StateError('no io');
    });
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    expect(
      () => client.operationsRealtime.getConcurrency(
        filter: const Sub2ApiAdminOpsRealtimeFilter(groupId: 0),
      ),
      throwsA(_code('admin.ops.invalid_group_id')),
    );
    expect(adapter.requests, isEmpty);
  });
  test('malformed realtime response fails closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{
            'enabled': true,
            'platform': <String, Object?>{},
            'group': <String, Object?>{},
            'account': <String, Object?>{},
            'timestamp': '',
          },
        },
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.operationsRealtime.getConcurrency(),
      throwsA(_code('protocol.invalid_admin_ops_realtime_response')),
    );
  });
}

Map<String, Object?> _fixture() => readFixture('admin/ops_realtime.json');
Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/concurrency') &&
      !request.path.endsWith('/user-concurrency')) {
    data = _fixture()['concurrency'];
  } else if (request.path.endsWith('/user-concurrency')) {
    data = _fixture()['users'];
  } else if (request.path.endsWith('/account-availability')) {
    data = _fixture()['availability'];
  } else {
    data = _fixture()['traffic'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('ops-realtime-key'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((e) => e.code, 'code', code);
