import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_setting_models.dart';
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

  test('Ops executes every web-search emulation route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    const secret = Sub2ApiAdminCredentialSecret('brave-secret');

    final config = await client.settings.getWebSearchEmulation();
    final updated = await client.settings.updateWebSearchEmulation(
      Sub2ApiAdminWebSearchConfig(
        enabled: true,
        providers: <Sub2ApiAdminWebSearchProvider>[
          Sub2ApiAdminWebSearchProvider(
            type: Sub2ApiAdminWebSearchProviderType.brave,
            apiKey: secret,
            apiKeyConfigured: true,
            quotaLimit: 2000,
            subscribedAt: DateTime.fromMillisecondsSinceEpoch(
              1787875200000,
              isUtc: true,
            ),
            quotaUsed: 125,
            proxyId: 3,
          ),
        ],
      ),
    );
    await client.settings.resetWebSearchUsage(
      Sub2ApiAdminWebSearchProviderType.brave,
    );
    final testResult = await client.settings.testWebSearchEmulation(
      query: ' Dart news ',
    );

    expect(config.providers.single.apiKey, isNull);
    expect(config.providers.single.apiKeyConfigured, isTrue);
    expect(updated.providers.single.quotaUsed, 125);
    expect(testResult.provider, 'brave');
    expect(testResult.results.single.url.host, 'example.test');
    expect(secret.toString(), '<redacted>');
    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/admin/settings/web-search-emulation',
      '/api/v1/admin/settings/web-search-emulation',
      '/api/v1/admin/settings/web-search-emulation/reset-usage',
      '/api/v1/admin/settings/web-search-emulation/test',
    ]);
    final providers = (adapter.requests[1].data as Map)['providers'] as List;
    expect(providers.single, containsPair('api_key', 'brave-secret'));
    expect(adapter.requests[2].data, containsPair('provider_type', 'brave'));
    expect(adapter.requests[3].data, containsPair('query', 'Dart news'));
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'web-search-key-sentinel',
      ),
      isTrue,
    );
  });

  test('web-search validation fails without I/O', () async {
    final adapter = JsonResponseAdapter((_) => throw StateError('no io'));
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    final duplicate = Sub2ApiAdminWebSearchConfig(
      enabled: false,
      providers: const <Sub2ApiAdminWebSearchProvider>[
        Sub2ApiAdminWebSearchProvider(
          type: Sub2ApiAdminWebSearchProviderType.brave,
          apiKeyConfigured: false,
          quotaUsed: 0,
        ),
        Sub2ApiAdminWebSearchProvider(
          type: Sub2ApiAdminWebSearchProviderType.brave,
          apiKeyConfigured: false,
          quotaUsed: 0,
        ),
      ],
    );
    expect(
      () => client.settings.updateWebSearchEmulation(duplicate),
      throwsA(_code('admin.settings.duplicate_web_search_provider')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('malformed web-search response fails closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{
            'enabled': true,
            'providers': <Object?>[
              <String, Object?>{
                'type': 'unknown',
                'api_key_configured': false,
                'quota_used': 0,
              },
            ],
          },
        },
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.settings.getWebSearchEmulation(),
      throwsA(_code('protocol.invalid_admin_setting_response')),
    );
  });

  test('web-search mutation is not replayed after 401', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.settings.resetWebSearchUsage(
        Sub2ApiAdminWebSearchProviderType.brave,
      ),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });
}

Map<String, Object?> _fixture() =>
    readFixture('admin/settings_web_search.json');
Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/reset-usage')) {
    data = null;
  } else if (request.path.endsWith('/test')) {
    data = _fixture()['test'];
  } else {
    data = _fixture()['config'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('web-search-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
