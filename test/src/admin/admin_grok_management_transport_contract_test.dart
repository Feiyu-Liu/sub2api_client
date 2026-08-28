import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_grok_oauth_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_user_models.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/models/sub2api_decimal.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';

void main() {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );

  test('Ops executes every remaining Grok management route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    const token = Sub2ApiGrokSsoToken('sso-import-secret');

    final created = await client.grokOAuth.createAccountFromOAuth(
      Sub2ApiAdminGrokCreateAccountFromOAuthRequest(
        sessionId: const Sub2ApiGrokOAuthSessionId('session'),
        code: const Sub2ApiOAuthAuthorizationCode('code'),
        state: const Sub2ApiGrokOAuthState('state'),
        name: ' Grok Account ',
        concurrency: 2,
        priority: 10,
        groupIds: const <int>[7],
      ),
    );
    final imported = await client.grokOAuth.importSsoTokens(
      Sub2ApiAdminGrokSsoImportRequest(
        ssoTokens: const <Sub2ApiGrokSsoToken>[token, token],
        name: ' Imported Grok ',
        groupIds: const <int>[7],
        credentials: Sub2ApiAdminGrokImportCredentials(
          baseUrl: Uri(scheme: 'https', host: 'api.x.ai'),
          modelMapping: Sub2ApiAdminJsonObject(<String, Sub2ApiAdminJsonValue>{
            'grok-4.5': Sub2ApiAdminJsonString('grok-4.5'),
          }),
        ),
        extra: const Sub2ApiAdminJsonObject(<String, Sub2ApiAdminJsonValue>{
          'tenant': Sub2ApiAdminJsonString('fixture'),
        }),
        concurrency: 2,
        loadFactor: 10,
        priority: 10,
        rateMultiplier: Sub2ApiDecimal.parse('1.25'),
      ),
    );
    final reconcile = await client.grokOAuth.reconcile(
      const Sub2ApiAdminGrokReconcileRequest(
        limit: 50,
        refreshWindow: Duration(minutes: 10),
      ),
    );
    final refreshed = await client.grokOAuth.refreshAccount(42);
    final quota = await client.grokOAuth.getQuota(42);
    final reset = await client.grokOAuth.resetQuota(42);
    final runtime = await client.grokOAuth.getRuntimeSanity();

    expect(created.platform.name, 'grok');
    expect(imported.created.single.account?.id, 42);
    expect(imported.failed.single.error, 'fixture failure');
    expect(reconcile.items.single.reason, 'near_expiry');
    expect(refreshed.id, 42);
    expect(quota.billing?.monthlyUsed.toString(), '25.5');
    expect(quota.snapshot?.requests?.limit, 8300);
    expect(quota.localUsage24h?.cost.toString(), '1.25');
    expect(reset.supported, isFalse);
    expect(runtime.baseUrl.valid, isTrue);
    expect(token.toString(), '<redacted>');
    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/admin/grok/oauth/create-from-oauth',
      '/api/v1/admin/grok/sso-to-oauth',
      '/api/v1/admin/grok/oauth/reconcile',
      '/api/v1/admin/grok/accounts/42/refresh',
      '/api/v1/admin/grok/accounts/42/quota',
      '/api/v1/admin/grok/accounts/42/reset-quota',
      '/api/v1/admin/grok/runtime-sanity',
    ]);
    expect(
      adapter.requests[1].data,
      containsPair('sso_tokens', <String>['sso-import-secret']),
    );
    final credentials = (adapter.requests[1].data as Map)['credentials'] as Map;
    expect(credentials, containsPair('base_url', 'https://api.x.ai'));
    expect(credentials, isNot(contains('access_token')));
    expect(adapter.requests[2].data, containsPair('dry_run', true));
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'grok-management-key',
      ),
      isTrue,
    );
  });

  test('remaining Grok validation fails without I/O', () async {
    final adapter = JsonResponseAdapter((_) => throw StateError('no io'));
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    expect(
      () => client.grokOAuth.importSsoTokens(
        Sub2ApiAdminGrokSsoImportRequest(ssoTokens: const []),
      ),
      throwsA(_code('admin.grok.sso_tokens_required')),
    );
    expect(
      () => client.grokOAuth.reconcile(
        const Sub2ApiAdminGrokReconcileRequest(limit: 501),
      ),
      throwsA(_code('admin.grok.invalid_reconcile_limit')),
    );
    expect(adapter.requests, isEmpty);
  });

  test(
    'quota reset preserves fixed unsupported error and never replays',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => const JsonResponse(
          statusCode: 400,
          body: <String, Object?>{
            'code': 'GROK_QUOTA_RESET_UNSUPPORTED',
            'message': 'quota reset is unsupported',
          },
        ),
      );
      final client = _client(configuration, adapter);
      addTearDown(client.close);
      await expectLater(
        client.grokOAuth.resetQuota(42),
        throwsA(_code('server.grok_quota_reset_unsupported')),
      );
      expect(adapter.requests, hasLength(1));
    },
  );

  test('malformed Grok runtime response fails closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'unsafe_url_overrides': false},
        },
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.grokOAuth.getRuntimeSanity(),
      throwsA(_code('protocol.invalid_admin_grok_oauth_response')),
    );
  });
}

Map<String, Object?> _fixture() => readFixture('admin/grok_management.json');
Map<String, Object?> _account() {
  final source = readFixture('admin/account_read_surface.json')['account']!;
  return <String, Object?>{
    ...(source as Map<String, Object?>),
    'platform': 'grok',
  };
}

Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/create-from-oauth') ||
      request.path.endsWith('/refresh')) {
    data = _account();
  } else if (request.path.endsWith('/sso-to-oauth')) {
    data = <String, Object?>{
      'created': <Object?>[
        <String, Object?>{
          'index': 1,
          'name': 'Imported Grok',
          'email': 'grok@example.test',
          'account': _account(),
        },
      ],
      'failed': <Object?>[
        <String, Object?>{'index': 2, 'error': 'fixture failure'},
      ],
    };
  } else if (request.path.endsWith('/reconcile')) {
    data = _fixture()['reconcile'];
  } else if (request.path.endsWith('/quota')) {
    data = _fixture()['quota'];
  } else if (request.path.endsWith('/reset-quota')) {
    data = _fixture()['reset'];
  } else {
    data = _fixture()['runtime'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('grok-management-key'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
