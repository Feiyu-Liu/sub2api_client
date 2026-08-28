import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_account_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_accounts_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
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
    accessToken: Sub2ApiAccessToken('admin-account-probe-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'Ops account probe operations send typed bodies with API-key isolation',
    () async {
      final adapter = JsonResponseAdapter(
        (request) => JsonResponse(body: _fixtureForRequest(request)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      final results = <Object?>[];
      for (final route in _routes) {
        results.add(await route.invoke(client.accounts));
      }

      expect(
        (results[0]! as Sub2ApiAdminUpstreamBillingProbeSettings)
            .intervalMinutes,
        30,
      );
      final batch = results[1]! as Sub2ApiAdminUpstreamBillingProbeBatchResult;
      expect(batch.results.map((result) => result.accountId), <int>[42, 43]);
      expect(
        batch.results.first.snapshot?.data?.effectiveRateMultiplier.toString(),
        '1.25',
      );
      expect(batch.results.last.error, 'account probe failed');
      expect(
        (results[2]! as Sub2ApiAdminAccountProbeToggleResult).enabled,
        isTrue,
      );
      expect(
        (results[3]! as Sub2ApiAdminUpstreamBillingProbeResult)
            .snapshot
            ?.syncedRateMultiplier
            .toString(),
        '1.25',
      );
      expect(
        (results[4]! as Sub2ApiAdminOllamaCloudUsageSettings).debounceMinutes,
        5,
      );
      for (final result in results.skip(5)) {
        expect((result! as Sub2ApiAdminOllamaCloudUsageState).accountId, 42);
      }

      expect(
        adapter.requests.map((request) => '${request.method} ${request.path}'),
        _routes.map((route) => '${route.method} ${route.path}'),
      );
      for (final request in adapter.requests) {
        expect(
          request.headers,
          containsPair('x-api-key', 'admin-account-probe-key-sentinel'),
        );
        expect(request.headers, isNot(contains('Authorization')));
      }
      expect(adapter.requests[0].data, <String, Object?>{
        'enabled': true,
        'interval_minutes': 30,
      });
      expect(adapter.requests[1].data, <String, Object?>{
        'account_ids': <int>[42, 43],
      });
      expect(adapter.requests[2].data, <String, Object?>{'enabled': true});
      expect(adapter.requests[3].data, isNull);
      expect(adapter.requests[4].data, <String, Object?>{
        'enabled': true,
        'interval_minutes': 60,
        'debounce_minutes': 5,
      });
      expect(adapter.requests[5].data, <String, Object?>{
        'session':
            'wos-session=browser-secret; '
            '__Secure-authjs.session-token.0=shard-a',
      });
      expect(adapter.requests[6].data, isNull);
      expect(adapter.requests[7].data, <String, Object?>{'enabled': true});
      expect(adapter.requests[8].data, isNull);
    },
  );

  test('Admin JWT account probe operations run after role checks', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _fixtureForRequest(request));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    for (final route in _routes) {
      await route.invoke(client.accounts);
    }

    final businessRequests = adapter.requests.where(
      (request) => request.path != '/api/v1/auth/me',
    );
    expect(
      businessRequests.map((request) => '${request.method} ${request.path}'),
      _routes.map((route) => '${route.method} ${route.path}'),
    );
    expect(
      adapter.requests.where((request) => request.path == '/api/v1/auth/me'),
      hasLength(_routes.length),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair(
          'Authorization',
          'Bearer admin-account-probe-jwt-sentinel',
        ),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test('account probe operations preserve business and key failures', () async {
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

      for (final route in _routes) {
        await expectLater(
          route.invoke(client.accounts),
          throwsA(_code(failure.code)),
          reason: route.name,
        );
      }
    }
  });

  test('account probe operations reject malformed success data', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{'code': 0, 'message': 'success', 'data': null},
      ),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    for (final route in _routes) {
      await expectLater(
        route.invoke(client.accounts),
        throwsA(_code('protocol.invalid_admin_account_response')),
        reason: route.name,
      );
    }
  });

  test('probe results require exactly one snapshot or error', () async {
    for (final malformed in <({String path, Object? data})>[
      (
        path: '/api/v1/admin/accounts/upstream-billing-probe/batch',
        data: <String, Object?>{
          'results': <Object?>[
            <String, Object?>{'account_id': 42},
          ],
        },
      ),
      (
        path: '/api/v1/admin/accounts/42/upstream-billing-probe',
        data: <String, Object?>{
          'account_id': 42,
          'snapshot': _probeSnapshot(),
          'error': 'conflicting result',
        },
      ),
    ]) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: _success(malformed.data)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      final operation = malformed.path.endsWith('/batch')
          ? client.accounts.probeUpstreamBillingBatch(const [42])
          : client.accounts.probeUpstreamBilling(42);
      await expectLater(
        operation,
        throwsA(_code('protocol.invalid_admin_account_response')),
      );
    }
  });

  test('account probe validation and sensitive session fail before I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);
    const secret = Sub2ApiOllamaCloudSession('wos-session=secret');

    expect(secret.toString(), '<redacted>');
    expect(
      () => client.accounts.updateUpstreamBillingProbeSettings(
        enabled: true,
        intervalMinutes: 4,
      ),
      throwsA(_code('admin.accounts.invalid_upstream_probe_interval')),
    );
    expect(
      () => client.accounts.probeUpstreamBillingBatch(const []),
      throwsA(_code('admin.accounts.invalid_probe_batch_size')),
    );
    expect(
      () => client.accounts.probeUpstreamBillingBatch(
        List<int>.generate(21, (index) => index + 1),
      ),
      throwsA(_code('admin.accounts.invalid_probe_batch_size')),
    );
    expect(
      () => client.accounts.probeUpstreamBillingBatch(const [42, 0]),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.setUpstreamBillingProbeEnabled(0, enabled: true),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.updateOllamaCloudUsageSettings(
        enabled: true,
        intervalMinutes: 14,
        debounceMinutes: 1,
      ),
      throwsA(_code('admin.accounts.invalid_ollama_usage_interval')),
    );
    expect(
      () => client.accounts.updateOllamaCloudUsageSettings(
        enabled: true,
        intervalMinutes: 60,
        debounceMinutes: 61,
      ),
      throwsA(_code('admin.accounts.invalid_ollama_usage_debounce')),
    );
    expect(
      () => client.accounts.updateOllamaCloudUsageSettings(
        enabled: true,
        intervalMinutes: 15,
        debounceMinutes: 15,
      ),
      throwsA(_code('admin.accounts.ollama_usage_debounce_not_less')),
    );
    for (final invalid in <({String value, String code})>[
      (value: ' ', code: 'admin.accounts.ollama_session_required'),
      (
        value: 'wos-session=secret\r\nHost: evil.test',
        code: 'admin.accounts.invalid_ollama_session_header',
      ),
      (
        value: 'wos-session=secret; Path=/',
        code: 'admin.accounts.ollama_session_set_cookie_attribute',
      ),
      (
        value: 'wos-session=first; wos-session=second',
        code: 'admin.accounts.ollama_session_duplicate_cookie',
      ),
      (
        value: 'tracking=only',
        code: 'admin.accounts.ollama_session_cookie_not_allowed',
      ),
      (
        value: 'authjs.session-token.bad=value',
        code: 'admin.accounts.ollama_session_cookie_not_allowed',
      ),
      (
        value: 'Authjs.session-token=value',
        code: 'admin.accounts.ollama_session_cookie_not_allowed',
      ),
      (
        value: 'wos-session=${'x' * (16 * 1024)}',
        code: 'admin.accounts.ollama_session_too_large',
      ),
    ]) {
      expect(
        () => client.accounts.saveOllamaCloudUsageSession(
          42,
          Sub2ApiOllamaCloudSession(invalid.value),
        ),
        throwsA(_code(invalid.code)),
        reason: invalid.value.length > 80 ? invalid.code : invalid.value,
      );
    }
    expect(adapter.requests, isEmpty);
  });

  test('Ollama session accepts only the fixed cookie-name allowlist', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(_data('ollama_cloud_usage'))),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);
    const allowedNames = <String>[
      'wos-session',
      '__Secure-session',
      'session',
      'ollama_session',
      '__Host-ollama_session',
      'next-auth.session-token',
      'next-auth.session-token.0',
      '__Secure-next-auth.session-token',
      '__Secure-next-auth.session-token.12',
      'authjs.session-token',
      'authjs.session-token.1',
      '__Secure-authjs.session-token',
      '__Secure-authjs.session-token.2',
    ];

    for (final name in allowedNames) {
      await client.accounts.saveOllamaCloudUsageSession(
        42,
        Sub2ApiOllamaCloudSession('$name=value'),
      );
    }

    expect(adapter.requests, hasLength(allowedNames.length));
    expect(
      adapter.requests.map(
        (request) => (request.data! as Map<String, dynamic>)['session'],
      ),
      allowedNames.map((name) => '$name=value'),
    );
  });

  test('every account probe mutation disables automatic replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-account-probe-jwt-sentinel'),
      refreshToken: Sub2ApiRefreshToken('refresh-account-probe-jwt-sentinel'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      if (request.path == '/api/v1/auth/refresh') {
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

    for (final route in _routes) {
      await expectLater(
        route.invoke(client.accounts),
        throwsA(isA<Sub2ApiException>()),
        reason: route.name,
      );
    }

    expect(
      adapter.requests.where(
        (request) => request.path == '/api/v1/auth/refresh',
      ),
      isEmpty,
    );
    for (final route in _routes) {
      expect(
        adapter.requests.where(
          (request) =>
              request.method == route.method && request.path == route.path,
        ),
        hasLength(1),
        reason: route.name,
      );
    }
  });
}

final _routes = <_AdminAccountProbeRoute>[
  _AdminAccountProbeRoute(
    'update upstream settings',
    'PUT',
    '/api/v1/admin/accounts/upstream-billing-probe/settings',
    (accounts) => accounts.updateUpstreamBillingProbeSettings(
      enabled: true,
      intervalMinutes: 30,
    ),
  ),
  _AdminAccountProbeRoute(
    'batch upstream probe',
    'POST',
    '/api/v1/admin/accounts/upstream-billing-probe/batch',
    (accounts) => accounts.probeUpstreamBillingBatch(const [42, 43, 42]),
  ),
  _AdminAccountProbeRoute(
    'toggle upstream probe',
    'PUT',
    '/api/v1/admin/accounts/42/upstream-billing-probe',
    (accounts) => accounts.setUpstreamBillingProbeEnabled(42, enabled: true),
  ),
  _AdminAccountProbeRoute(
    'run upstream probe',
    'POST',
    '/api/v1/admin/accounts/42/upstream-billing-probe',
    (accounts) => accounts.probeUpstreamBilling(42),
  ),
  _AdminAccountProbeRoute(
    'update Ollama settings',
    'PUT',
    '/api/v1/admin/accounts/ollama-cloud-usage/settings',
    (accounts) => accounts.updateOllamaCloudUsageSettings(
      enabled: true,
      intervalMinutes: 60,
      debounceMinutes: 5,
    ),
  ),
  _AdminAccountProbeRoute(
    'save Ollama session',
    'PUT',
    '/api/v1/admin/accounts/42/ollama-cloud-usage/session',
    (accounts) => accounts.saveOllamaCloudUsageSession(
      42,
      const Sub2ApiOllamaCloudSession(
        ' wos-session=browser-secret ; '
        '__Secure-authjs.session-token.0=shard-a ',
      ),
    ),
  ),
  _AdminAccountProbeRoute(
    'delete Ollama session',
    'DELETE',
    '/api/v1/admin/accounts/42/ollama-cloud-usage/session',
    (accounts) => accounts.deleteOllamaCloudUsageSession(42),
  ),
  _AdminAccountProbeRoute(
    'toggle Ollama refresh',
    'PUT',
    '/api/v1/admin/accounts/42/ollama-cloud-usage/auto-refresh',
    (accounts) => accounts.setOllamaCloudUsageAutoRefresh(42, enabled: true),
  ),
  _AdminAccountProbeRoute(
    'refresh Ollama usage',
    'POST',
    '/api/v1/admin/accounts/42/ollama-cloud-usage/refresh',
    (accounts) => accounts.refreshOllamaCloudUsage(42),
  ),
];

Object? _fixtureForRequest(RequestOptions request) => switch ((
  request.method,
  request.path,
)) {
  ('PUT', '/api/v1/admin/accounts/upstream-billing-probe/settings') => _success(
    _data('upstream_billing_probe_settings'),
  ),
  ('POST', '/api/v1/admin/accounts/upstream-billing-probe/batch') => _success(
    <String, Object?>{
      'results': <Object?>[
        <String, Object?>{'account_id': 42, 'snapshot': _probeSnapshot()},
        <String, Object?>{'account_id': 43, 'error': 'account probe failed'},
      ],
    },
  ),
  ('PUT', '/api/v1/admin/accounts/42/upstream-billing-probe') => _success(
    <String, Object?>{'account_id': 42, 'enabled': true},
  ),
  ('POST', '/api/v1/admin/accounts/42/upstream-billing-probe') => _success(
    <String, Object?>{'account_id': 42, 'snapshot': _probeSnapshot()},
  ),
  ('PUT', '/api/v1/admin/accounts/ollama-cloud-usage/settings') => _success(
    _data('ollama_cloud_usage_settings'),
  ),
  ('PUT', '/api/v1/admin/accounts/42/ollama-cloud-usage/session') ||
  ('DELETE', '/api/v1/admin/accounts/42/ollama-cloud-usage/session') ||
  ('PUT', '/api/v1/admin/accounts/42/ollama-cloud-usage/auto-refresh') ||
  (
    'POST',
    '/api/v1/admin/accounts/42/ollama-cloud-usage/refresh',
  ) => _success(_data('ollama_cloud_usage')),
  _ => throw StateError('unexpected request ${request.method} ${request.path}'),
};

Map<String, Object?> _probeSnapshot() => <String, Object?>{
  'status': 'ok',
  'data': <String, Object?>{
    'object': 'sub2api.billing',
    'schema_version': 1,
    'billing_scope': 'user',
    'group_rate_multiplier': 1.1,
    'user_rate_multiplier': 1.2,
    'resolved_rate_multiplier': 1.2,
    'peak_rate_enabled': true,
    'peak_start': '09:00',
    'peak_end': '18:00',
    'peak_rate_multiplier': 1.25,
    'applied_peak_multiplier': 1.25,
    'effective_rate_multiplier': 1.25,
    'timezone': 'Asia/Shanghai',
    'observed_at': '2026-08-20T12:00:00Z',
  },
  'received_at': '2026-08-20T12:00:01Z',
  'fresh_until': '2026-08-20T12:30:01Z',
  'last_attempt_at': '2026-08-20T12:00:00Z',
  'next_probe_at': '2026-08-20T12:30:00Z',
  'failure_count': 0,
  'http_status': 200,
  'last_error': '',
  'synced_rate_multiplier': 1.25,
};

Object? _data(String key) {
  final source = readFixture('admin/account_read_surface.json');
  if (!source.containsKey(key)) {
    throw StateError('missing account fixture $key');
  }
  return source[key];
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
    Sub2ApiAdminApiKey('admin-account-probe-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

final class _AdminAccountProbeRoute {
  const _AdminAccountProbeRoute(this.name, this.method, this.path, this.invoke);

  final String name;
  final String method;
  final String path;
  final Future<Object?> Function(Sub2ApiAdminAccountsClient accounts) invoke;
}
