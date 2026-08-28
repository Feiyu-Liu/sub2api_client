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
    accessToken: Sub2ApiAccessToken('admin-account-update-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops account update maps explicit clear and set semantics', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(_accountData())),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final updated = await client.accounts.update(42, _request);

    expect(updated.id, 42);
    final sent = adapter.requests.single;
    expect(sent.method, 'PUT');
    expect(sent.path, '/api/v1/admin/accounts/42');
    expect(sent.data, <String, Object?>{
      'name': 'updated account',
      'notes': '',
      'type': 'apikey',
      'credentials': <String, Object?>{'api_key': 'updated-api-key'},
      'extra': <String, Object?>{},
      'proxy_id': 0,
      'concurrency': 0,
      'priority': 0,
      'rate_multiplier': 0.5,
      'load_factor': 0,
      'status': 'inactive',
      'group_ids': <int>[],
      'expires_at': 0,
      'auto_pause_on_expired': false,
      'upstream_billing_probe_enabled': false,
      'upstream_billing_rate_sync_enabled': false,
      'confirm_mixed_channel_risk': true,
    });
    expect(
      sent.headers,
      containsPair('x-api-key', 'admin-account-update-key-sentinel'),
    );
    expect(sent.headers, isNot(contains('Authorization')));
  });

  test('Admin JWT account update runs after role checks', () async {
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _success(_accountData()));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.accounts.update(42, _request);

    expect(
      adapter.requests.map((sent) => '${sent.method} ${sent.path}'),
      <String>['GET /api/v1/auth/me', 'PUT /api/v1/admin/accounts/42'],
    );
    for (final sent in adapter.requests) {
      expect(
        sent.headers,
        containsPair(
          'Authorization',
          'Bearer admin-account-update-jwt-sentinel',
        ),
      );
      expect(sent.headers, isNot(contains('x-api-key')));
    }
  });

  test('account update preserves business and key failures', () async {
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
        client.accounts.update(42, _request),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('account update rejects malformed success data', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(null)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.accounts.update(42, _request),
      throwsA(_code('protocol.invalid_admin_account_response')),
    );
  });

  test('account update validates patch semantics before I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.update(0, _request),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.update(42, Sub2ApiAdminUpdateAccountRequest()),
      throwsA(_code('admin.accounts.empty_update')),
    );
    expect(
      () => client.accounts.update(
        42,
        Sub2ApiAdminUpdateAccountRequest(
          proxy: const Sub2ApiAdminProxyUpdate.set(0),
        ),
      ),
      throwsA(_code('admin.accounts.invalid_proxy_id')),
    );
    expect(
      () => client.accounts.update(
        42,
        Sub2ApiAdminUpdateAccountRequest(
          loadFactor: const Sub2ApiAdminLoadFactorUpdate.set(10001),
        ),
      ),
      throwsA(_code('admin.accounts.invalid_load_factor')),
    );
    expect(
      () => client.accounts.update(
        42,
        Sub2ApiAdminUpdateAccountRequest(
          expiresAt: Sub2ApiAdminExpiresAtUpdate.set(
            DateTime.utc(2027).add(const Duration(microseconds: 1)),
          ),
        ),
      ),
      throwsA(_code('admin.accounts.invalid_expires_at')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('account update disables automatic replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-account-update-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-account-update-jwt'),
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
      client.accounts.update(42, _request),
      throwsA(isA<Sub2ApiException>()),
    );

    expect(
      adapter.requests.where((sent) => sent.path == '/api/v1/auth/refresh'),
      isEmpty,
    );
    expect(
      adapter.requests.where(
        (sent) =>
            sent.method == 'PUT' && sent.path == '/api/v1/admin/accounts/42',
      ),
      hasLength(1),
    );
  });
}

final _request = Sub2ApiAdminUpdateAccountRequest(
  name: ' updated account ',
  notes: ' ',
  type: Sub2ApiAdminAccountType.apiKey,
  credentials: Sub2ApiAdminCredentialSet(const [
    Sub2ApiAdminCredentialEntry(
      name: 'api_key',
      value: Sub2ApiAdminCredentialSecretValue(
        Sub2ApiAdminCredentialSecret('updated-api-key'),
      ),
    ),
  ]),
  extra: const Sub2ApiAdminJsonObject({}),
  proxy: const Sub2ApiAdminProxyUpdate.clear(),
  concurrency: 0,
  priority: 0,
  rateMultiplier: Sub2ApiDecimal.parse('0.5'),
  loadFactor: const Sub2ApiAdminLoadFactorUpdate.clear(),
  status: Sub2ApiAdminAccountStatus.inactive,
  groupIds: const [],
  expiresAt: const Sub2ApiAdminExpiresAtUpdate.clear(),
  autoPauseOnExpired: false,
  upstreamBillingProbeEnabled: false,
  upstreamBillingRateSyncEnabled: false,
  confirmMixedChannelRisk: true,
);

Map<String, Object?> _accountData() {
  final source = readFixture('admin/account_read_surface.json');
  final raw = source['account'];
  if (raw is! Map) throw const FormatException();
  return raw.map<String, Object?>((key, value) {
    if (key is! String) throw const FormatException();
    return MapEntry(key, value);
  });
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
    Sub2ApiAdminApiKey('admin-account-update-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
