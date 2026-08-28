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
  final query = Sub2ApiAdminOpsErrorQuery(
    timeRange: Sub2ApiAdminOpsTimeRange.oneHour,
    view: Sub2ApiAdminOpsErrorView.all,
    phase: ' upstream ',
    owner: ' provider ',
    source: ' upstream_http ',
    platform: ' openai ',
    groupId: 7,
    accountId: 42,
    userId: 21,
    apiKeyId: 9,
    resolved: false,
    statusCodes: const <int>[502],
    sortBy: Sub2ApiAdminOpsErrorSortBy.statusCode,
  );
  test('Ops executes every legacy and request error route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    final legacy = await client.operationsErrors.listLegacyErrors(query: query);
    final legacyDetail = await client.operationsErrors.getLegacyError(81);
    final legacyResolved = await client.operationsErrors.resolveLegacyError(
      81,
      resolved: true,
    );
    final requests = await client.operationsErrors.listRequestErrors(
      query: query,
    );
    final requestDetail = await client.operationsErrors.getRequestError(81);
    final correlated = await client.operationsErrors
        .listCorrelatedUpstreamErrors(81, query: query);
    final requestResolved = await client.operationsErrors.resolveRequestError(
      81,
      resolved: true,
    );
    expect(legacy.items.single.message.toString(), '<redacted>');
    expect(legacy.items.single.clientAddress.toString(), '<redacted>');
    expect(legacyDetail.errorBody.toString(), '<redacted>');
    expect(requestDetail.upstreamErrorDetail.toString(), '<redacted>');
    expect(correlated.items.single.upstreamStatusCode, 502);
    expect(requests.total, 1);
    expect(legacyResolved.ok, isTrue);
    expect(requestResolved.ok, isTrue);
    expect(adapter.requests.map((r) => r.path), <String>[
      '/api/v1/admin/ops/errors',
      '/api/v1/admin/ops/errors/81',
      '/api/v1/admin/ops/errors/81/resolve',
      '/api/v1/admin/ops/request-errors',
      '/api/v1/admin/ops/request-errors/81',
      '/api/v1/admin/ops/request-errors/81/upstream-errors',
      '/api/v1/admin/ops/request-errors/81/resolve',
    ]);
    expect(
      adapter.requests.first.queryParameters,
      containsPair('status_codes', '502'),
    );
    expect(
      adapter.requests[5].queryParameters,
      containsPair('include_detail', true),
    );
    expect(adapter.requests[2].data, containsPair('resolved', true));
    expect(
      adapter.requests.every((r) => r.headers['x-api-key'] == 'ops-errors-key'),
      isTrue,
    );
  });
  test('error query validation fails before I/O', () async {
    final adapter = JsonResponseAdapter((_) {
      throw StateError('no io');
    });
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    expect(
      () => client.operationsErrors.listLegacyErrors(
        query: const Sub2ApiAdminOpsErrorQuery(pageSize: 501),
      ),
      throwsA(_code('admin.ops.invalid_page_size')),
    );
    expect(
      () => client.operationsErrors.getRequestError(0),
      throwsA(_code('admin.ops.invalid_error_id')),
    );
    expect(adapter.requests, isEmpty);
  });
  test('malformed error detail fails closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'id': 0},
        },
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.operationsErrors.getLegacyError(81),
      throwsA(_code('protocol.invalid_admin_ops_error_response')),
    );
  });
  test('resolution mutation is not replayed after 401', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.operationsErrors.resolveLegacyError(81, resolved: true),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });
}

Map<String, Object?> _fixture() => readFixture('admin/ops_errors.json');
Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/resolve')) {
    data = <String, Object?>{'ok': true};
  } else if (request.path.endsWith('/81') &&
      !request.path.endsWith('/errors/81/upstream-errors')) {
    data = _fixture()['detail'];
  } else {
    final detail = request.path.endsWith('/upstream-errors');
    data = <String, Object?>{
      'items': <Object?>[detail ? _fixture()['detail'] : _fixture()['summary']],
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
        Sub2ApiAdminApiKey('ops-errors-key'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((e) => e.code, 'code', code);
