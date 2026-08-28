import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_cn_provider_models.dart';
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

  test('Ops reads typed CN quota and balance contracts', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _successForRequest(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    final quota = await client.cnProviders.getQuota(7);
    final balance = await client.cnProviders.getBalance(8);

    expect(quota.provider, Sub2ApiAdminCNProvider.zhipu);
    expect(quota.tiers.first.usedPercent.toString(), '12.5');
    expect(quota.tiers.last.window, Sub2ApiAdminCNQuotaWindow.weekly);
    expect(balance.provider, Sub2ApiAdminCNProvider.deepseek);
    expect(balance.balance.toString(), '20.75');
    expect(balance.balances.last.currency, 'USD');
    expect(
      adapter.requests[0].path,
      '/api/v1/admin/cn-providers/accounts/7/quota',
    );
    expect(
      adapter.requests[1].path,
      '/api/v1/admin/cn-providers/accounts/8/balance',
    );
    expect(
      adapter.requests.map((request) => '${request.method} ${request.path}'),
      <String>[
        'GET /api/v1/admin/cn-providers/accounts/7/quota',
        'GET /api/v1/admin/cn-providers/accounts/8/balance',
      ],
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('x-api-key', 'admin-cn-key-sentinel'),
      );
      expect(request.headers, isNot(contains('Authorization')));
    }
  });

  test('CN provider routes preserve failures and malformed data', () async {
    final authAdapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final authClient = _client(configuration, authAdapter);
    addTearDown(authClient.close);
    await expectLater(
      authClient.cnProviders.getQuota(7),
      throwsA(_code('server.invalid_api_key')),
    );

    final malformedAdapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'provider': 'unknown'},
        },
      ),
    );
    final malformedClient = _client(configuration, malformedAdapter);
    addTearDown(malformedClient.close);
    await expectLater(
      malformedClient.cnProviders.getBalance(8),
      throwsA(_code('protocol.invalid_admin_cn_provider_response')),
    );
  });

  test('CN provider account IDs validate before I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    expect(
      () => client.cnProviders.getQuota(0),
      throwsA(_code('admin.cn_providers.invalid_account_id')),
    );
    expect(adapter.requests, isEmpty);
  });
}

Map<String, Object?> _fixture() => readFixture('admin/cn_provider_usage.json');

Object _successForRequest(RequestOptions request) => <String, Object?>{
  'code': 0,
  'message': 'success',
  'data': request.path.endsWith('/quota')
      ? _fixture()['quota']
      : _fixture()['balance'],
};

Sub2ApiOpsClient _client(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-cn-key-sentinel'),
  ),
  dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
    ..httpClientAdapter = adapter,
);

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
