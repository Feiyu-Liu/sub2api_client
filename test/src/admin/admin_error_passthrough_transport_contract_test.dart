import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_error_passthrough_models.dart';
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

  test('Ops executes all typed error passthrough routes', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _successForRequest(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    final listed = await client.errorPassthrough.list();
    final fetched = await client.errorPassthrough.get(4);
    final created = await client.errorPassthrough.create(
      Sub2ApiAdminCreateErrorPassthroughRuleRequest(
        name: ' Preserve overload ',
        errorCodes: const <int>[429, 503],
        keywords: const <String>['overloaded'],
        platforms: const <String>['anthropic', 'openai'],
        passthroughCode: false,
        responseCode: 503,
        passthroughBody: false,
        customMessage: 'Upstream temporarily unavailable',
        skipMonitoring: true,
      ),
    );
    final updated = await client.errorPassthrough.update(
      4,
      Sub2ApiAdminUpdateErrorPassthroughRuleRequest(enabled: false),
    );
    final deleted = await client.errorPassthrough.delete(4);

    expect(listed.single.id, 4);
    expect(fetched.matchMode, Sub2ApiAdminErrorPassthroughMatchMode.any);
    expect(created.responseCode, 503);
    expect(updated.name, 'Preserve overload');
    expect(deleted.message, 'Rule deleted successfully');
    expect(adapter.requests[0].path, '/api/v1/admin/error-passthrough-rules');
    expect(adapter.requests[1].path, '/api/v1/admin/error-passthrough-rules/4');
    expect(adapter.requests[2].method, 'POST');
    expect(adapter.requests[3].method, 'PUT');
    expect(adapter.requests[4].method, 'DELETE');
    expect(adapter.requests[2].data, containsPair('name', 'Preserve overload'));
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('x-api-key', 'error-passthrough-key-sentinel'),
      );
      expect(request.headers, isNot(contains('Authorization')));
    }
  });

  test('error passthrough validation and malformed data fail closed', () async {
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
    expect(
      () => client.errorPassthrough.create(
        Sub2ApiAdminCreateErrorPassthroughRuleRequest(name: 'empty'),
      ),
      throwsA(_code('admin.error_passthrough.conditions_required')),
    );
    await expectLater(
      client.errorPassthrough.get(4),
      throwsA(_code('protocol.invalid_admin_error_passthrough_response')),
    );
  });

  test('error passthrough mutation is not replayed', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.errorPassthrough.delete(4),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });
}

Map<String, Object?> _fixture() =>
    readFixture('admin/error_passthrough_rules.json');

Object _successForRequest(RequestOptions request) {
  final data = request.method == 'DELETE'
      ? <String, Object?>{'message': 'Rule deleted successfully'}
      : request.method == 'GET' && !request.path.endsWith('/4')
      ? <Object?>[_fixture()['rule']]
      : _fixture()['rule'];
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('error-passthrough-key-sentinel'),
  ),
  dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
    ..httpClientAdapter = adapter,
);

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
