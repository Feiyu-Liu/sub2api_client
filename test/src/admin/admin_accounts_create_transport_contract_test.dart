import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_account_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_user_models.dart';
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
  const session = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('admin-account-create-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'Ops creates single and batch accounts with typed credentials',
    () async {
      final adapter = JsonResponseAdapter(
        (sent) => JsonResponse(body: _fixtureForRequest(sent)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      final created = await client.accounts.create(_singleRequest);
      final batch = await client.accounts.batchCreate(_batchRequest);

      expect(created.id, 91);
      expect(created.credentials.values.keys, isNot(contains('access_token')));
      expect(batch.success, 1);
      expect(batch.failed, 1);
      expect(batch.results.first.accountId, 92);
      expect(batch.results.last.error, 'duplicate account');

      expect(
        adapter.requests.map((sent) => '${sent.method} ${sent.path}'),
        <String>[
          'POST /api/v1/admin/accounts',
          'POST /api/v1/admin/accounts/batch',
        ],
      );
      expect(
        adapter.requests[0].headers,
        containsPair('Idempotency-Key', 'create-account-91'),
      );
      expect(
        adapter.requests[1].headers,
        containsPair('Idempotency-Key', 'batch-create-accounts-1'),
      );
      final singleBody = adapter.requests[0].data! as Map<String, Object?>;
      expect(singleBody['name'], 'research account');
      expect(singleBody['platform'], 'openai');
      expect(singleBody['type'], 'oauth');
      expect(singleBody['rate_multiplier'], 1.25);
      expect(singleBody['expires_at'], 1798761600);
      expect(singleBody['group_ids'], <int>[7, 8]);
      expect(singleBody['credentials'], <String, Object?>{
        'access_token': 'provider-access-token',
        'email': 'operator@example.com',
        'intercept_warmup_requests': true,
        'model_mapping': <String, Object?>{'gpt-5': 'gpt-5.6'},
      });
      expect(
        adapter.requests[1].data,
        containsPair(
          'accounts',
          isA<List<Object?>>().having((v) => v.length, 'length', 2),
        ),
      );
      for (final sent in adapter.requests) {
        expect(
          sent.headers,
          containsPair('x-api-key', 'admin-account-create-key-sentinel'),
        );
        expect(sent.headers, isNot(contains('Authorization')));
      }
    },
  );

  test('Admin JWT account creation runs after role checks', () async {
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _fixtureForRequest(sent));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.accounts.create(_singleRequest);
    await client.accounts.batchCreate(_batchRequest);

    expect(
      adapter.requests.where((sent) => sent.path == '/api/v1/auth/me'),
      hasLength(2),
    );
    for (final sent in adapter.requests) {
      expect(
        sent.headers,
        containsPair(
          'Authorization',
          'Bearer admin-account-create-jwt-sentinel',
        ),
      );
      expect(sent.headers, isNot(contains('x-api-key')));
    }
  });

  test('account creation preserves business and key failures', () async {
    for (final failure in <({int status, String fixture, String code})>[
      (
        status: 404,
        fixture: 'admin/account_business_failure.json',
        code: 'server.account_not_found',
      ),
      (
        status: 401,
        fixture: 'admin/account_auth_failure.json',
        code: 'server.invalid_api_key',
      ),
    ]) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          statusCode: failure.status,
          body: readFixture(failure.fixture),
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      await expectLater(
        client.accounts.create(_singleRequest),
        throwsA(_code(failure.code)),
      );
      await expectLater(
        client.accounts.batchCreate(_batchRequest),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('account creation rejects malformed success data', () async {
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path.endsWith('/batch')) {
        return JsonResponse(
          body: _success(<String, Object?>{
            'success': 2,
            'failed': 0,
            'results': <Object?>[
              <String, Object?>{'name': 'one', 'success': true, 'id': 92},
            ],
          }),
        );
      }
      return JsonResponse(body: _success(null));
    });
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.accounts.create(_singleRequest),
      throwsA(_code('protocol.invalid_admin_account_response')),
    );
    await expectLater(
      client.accounts.batchCreate(_batchRequest),
      throwsA(_code('protocol.invalid_admin_account_response')),
    );
  });

  test('account creation validates typed inputs before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.create(
        Sub2ApiAdminCreateAccountRequest(
          idempotencyKey: ' ',
          account: _input(),
        ),
      ),
      throwsA(_code('admin.accounts.idempotency_key_required')),
    );
    expect(
      () => client.accounts.create(
        Sub2ApiAdminCreateAccountRequest(
          idempotencyKey: 'key',
          account: _input(name: ' '),
        ),
      ),
      throwsA(_code('admin.accounts.invalid_name')),
    );
    expect(
      () => client.accounts.create(
        Sub2ApiAdminCreateAccountRequest(
          idempotencyKey: 'key',
          account: _input(credentials: Sub2ApiAdminCredentialSet(const [])),
        ),
      ),
      throwsA(_code('admin.accounts.credentials_required')),
    );
    expect(
      () => client.accounts.create(
        Sub2ApiAdminCreateAccountRequest(
          idempotencyKey: 'key',
          account: _input(
            credentials: Sub2ApiAdminCredentialSet(const [
              Sub2ApiAdminCredentialEntry(
                name: 'access_token',
                value: Sub2ApiAdminCredentialStringValue('not-redacted'),
              ),
            ]),
          ),
        ),
      ),
      throwsA(_code('admin.accounts.sensitive_credential_requires_secret')),
    );
    expect(
      () => client.accounts.create(
        Sub2ApiAdminCreateAccountRequest(
          idempotencyKey: 'key',
          account: _input(
            credentials: Sub2ApiAdminCredentialSet(const [
              Sub2ApiAdminCredentialEntry(
                name: 'password',
                value: Sub2ApiAdminCredentialSecretValue(
                  Sub2ApiAdminCredentialSecret('password'),
                ),
              ),
            ]),
          ),
        ),
      ),
      throwsA(_code('admin.accounts.ephemeral_credential_not_writable')),
    );
    expect(
      () => client.accounts.create(
        Sub2ApiAdminCreateAccountRequest(
          idempotencyKey: 'key',
          account: _input(loadFactor: 10001),
        ),
      ),
      throwsA(_code('admin.accounts.invalid_load_factor')),
    );
    expect(
      () => client.accounts.batchCreate(
        Sub2ApiAdminBatchCreateAccountsRequest(
          idempotencyKey: 'key',
          accounts: const [],
        ),
      ),
      throwsA(_code('admin.accounts.batch_accounts_required')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('every account creation POST disables automatic replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-account-create-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-account-create-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      if (sent.path == '/api/v1/auth/refresh') {
        return JsonResponse(
          body: readFixture('auth/refresh_rotated_pair.json'),
        );
      }
      return JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      );
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(refreshableSession),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await expectLater(
      client.accounts.create(_singleRequest),
      throwsA(isA<Sub2ApiException>()),
    );
    await expectLater(
      client.accounts.batchCreate(_batchRequest),
      throwsA(isA<Sub2ApiException>()),
    );

    expect(
      adapter.requests.where((sent) => sent.path == '/api/v1/auth/refresh'),
      isEmpty,
    );
    expect(
      adapter.requests.where(
        (sent) =>
            sent.method == 'POST' && sent.path == '/api/v1/admin/accounts',
      ),
      hasLength(1),
    );
    expect(
      adapter.requests.where(
        (sent) =>
            sent.method == 'POST' &&
            sent.path == '/api/v1/admin/accounts/batch',
      ),
      hasLength(1),
    );
  });
}

final _singleRequest = Sub2ApiAdminCreateAccountRequest(
  idempotencyKey: 'create-account-91',
  account: _input(),
);

final _batchRequest = Sub2ApiAdminBatchCreateAccountsRequest(
  idempotencyKey: 'batch-create-accounts-1',
  accounts: <Sub2ApiAdminAccountCreateInput>[
    _input(name: 'batch one'),
    _input(name: 'batch duplicate'),
  ],
);

Sub2ApiAdminAccountCreateInput _input({
  String name = 'research account',
  Sub2ApiAdminCredentialSet? credentials,
  int? loadFactor = 20,
}) => Sub2ApiAdminAccountCreateInput(
  name: name,
  notes: 'primary',
  platform: Sub2ApiAdminAccountPlatform.openAi,
  type: Sub2ApiAdminAccountType.oauth,
  credentials: credentials ?? _credentials(),
  extra: Sub2ApiAdminJsonObject(<String, Sub2ApiAdminJsonValue>{
    'base_rpm': Sub2ApiAdminJsonNumber(Sub2ApiDecimal.parse('60')),
  }),
  proxyId: 3,
  concurrency: 4,
  priority: 50,
  rateMultiplier: Sub2ApiDecimal.parse('1.25'),
  loadFactor: loadFactor,
  groupIds: const [7, 8, 7],
  expiresAt: DateTime.utc(2027),
  autoPauseOnExpired: true,
  upstreamBillingProbeEnabled: false,
  confirmMixedChannelRisk: true,
);

Sub2ApiAdminCredentialSet _credentials() =>
    Sub2ApiAdminCredentialSet(<Sub2ApiAdminCredentialEntry>[
      const Sub2ApiAdminCredentialEntry(
        name: 'access_token',
        value: Sub2ApiAdminCredentialSecretValue(
          Sub2ApiAdminCredentialSecret('provider-access-token'),
        ),
      ),
      const Sub2ApiAdminCredentialEntry(
        name: 'email',
        value: Sub2ApiAdminCredentialStringValue('operator@example.com'),
      ),
      const Sub2ApiAdminCredentialEntry(
        name: 'intercept_warmup_requests',
        value: Sub2ApiAdminCredentialBoolValue(true),
      ),
      const Sub2ApiAdminCredentialEntry(
        name: 'model_mapping',
        value: Sub2ApiAdminCredentialJsonValue(
          Sub2ApiAdminJsonObject(<String, Sub2ApiAdminJsonValue>{
            'gpt-5': Sub2ApiAdminJsonString('gpt-5.6'),
          }),
        ),
      ),
    ]);

Object? _fixtureForRequest(RequestOptions sent) => switch (sent.path) {
  '/api/v1/admin/accounts' => _success(_accountData(91, 'research account')),
  '/api/v1/admin/accounts/batch' => _success(<String, Object?>{
    'success': 1,
    'failed': 1,
    'results': <Object?>[
      <String, Object?>{'name': 'batch one', 'success': true, 'id': 92},
      <String, Object?>{
        'name': 'batch duplicate',
        'success': false,
        'error': 'duplicate account',
      },
    ],
  }),
  _ => throw StateError('unexpected request ${sent.method} ${sent.path}'),
};

Map<String, Object?> _accountData(int id, String name) {
  final source = readFixture('admin/account_read_surface.json');
  final raw = source['account'];
  if (raw is! Map) throw const FormatException();
  final account = raw.map<String, Object?>((key, value) {
    if (key is! String) throw const FormatException();
    return MapEntry(key, value);
  });
  account
    ..['id'] = id
    ..['name'] = name;
  return account;
}

Map<String, Object?> _success(Object? data) => <String, Object?>{
  'code': 0,
  'message': 'success',
  'data': data,
};

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-account-create-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
