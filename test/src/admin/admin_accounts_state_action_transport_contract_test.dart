import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_account_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_accounts_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_user_models.dart';
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
    accessToken: Sub2ApiAccessToken('admin-account-state-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops account state actions preserve typed route contracts', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _fixtureForRequest(request)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final results = <Object?>[];
    for (final route in _routes) {
      results.add(await route.invoke(client.accounts));
    }

    expect((results[0]! as Sub2ApiAdminAccount).id, 42);
    expect((results[1]! as Sub2ApiAdminAccount).errorMessage, isEmpty);
    expect(
      (results[2]! as Sub2ApiAdminAccountActionResult).message,
      'reverted',
    );
    expect((results[3]! as Sub2ApiAdminAccount).rateLimitedAt, isNull);
    expect((results[4]! as Sub2ApiAdminAccount).quotaUsed, isNull);
    expect(
      (results[5]! as Sub2ApiAdminAccountActionResult).message,
      'Temp unschedulable cleared successfully',
    );
    expect((results[6]! as Sub2ApiAdminAccount).schedulable, isTrue);
    expect(
      ((results[7]! as Sub2ApiAdminAccount).extra.values['privacy_mode']
              as Sub2ApiAdminJsonString)
          .value,
      'enabled',
    );

    expect(
      adapter.requests.map((request) => '${request.method} ${request.path}'),
      _routes.map((route) => '${route.method} ${route.path}'),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('x-api-key', 'admin-account-state-key-sentinel'),
      );
      expect(request.headers, isNot(contains('Authorization')));
    }
    for (final request in adapter.requests.take(6)) {
      expect(request.data, isNull);
    }
    expect(adapter.requests[6].data, <String, Object?>{'schedulable': false});
    expect(adapter.requests[7].data, isNull);
  });

  test('Admin JWT account state actions run after role checks', () async {
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
          'Bearer admin-account-state-jwt-sentinel',
        ),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test('account state actions preserve business and key failures', () async {
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

  test('account state actions reject malformed success data', () async {
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

  test('account state action validation fails before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    for (final route in _invalidIdRoutes) {
      expect(
        () => route.invoke(client.accounts),
        throwsA(_code('admin.accounts.invalid_account_id')),
        reason: route.name,
      );
    }
    expect(adapter.requests, isEmpty);
  });

  test('every account state action disables automatic replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-account-state-jwt-sentinel'),
      refreshToken: Sub2ApiRefreshToken('refresh-account-state-jwt-sentinel'),
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

final _routes = <_AdminAccountStateRoute>[
  _AdminAccountStateRoute(
    'recover state',
    'POST',
    '/api/v1/admin/accounts/42/recover-state',
    (accounts) => accounts.recoverState(42),
  ),
  _AdminAccountStateRoute(
    'clear error',
    'POST',
    '/api/v1/admin/accounts/42/clear-error',
    (accounts) => accounts.clearError(42),
  ),
  _AdminAccountStateRoute(
    'revert proxy fallback',
    'POST',
    '/api/v1/admin/accounts/42/revert-proxy-fallback',
    (accounts) => accounts.revertProxyFallback(42),
  ),
  _AdminAccountStateRoute(
    'clear rate limit',
    'POST',
    '/api/v1/admin/accounts/42/clear-rate-limit',
    (accounts) => accounts.clearRateLimit(42),
  ),
  _AdminAccountStateRoute(
    'reset quota',
    'POST',
    '/api/v1/admin/accounts/42/reset-quota',
    (accounts) => accounts.resetQuota(42),
  ),
  _AdminAccountStateRoute(
    'clear temporary unschedulable',
    'DELETE',
    '/api/v1/admin/accounts/42/temp-unschedulable',
    (accounts) => accounts.clearTempUnschedulable(42),
  ),
  _AdminAccountStateRoute(
    'set schedulable',
    'POST',
    '/api/v1/admin/accounts/42/schedulable',
    (accounts) => accounts.setSchedulable(42, schedulable: false),
  ),
  _AdminAccountStateRoute(
    'set privacy',
    'POST',
    '/api/v1/admin/accounts/42/set-privacy',
    (accounts) => accounts.setPrivacy(42),
  ),
];

final _invalidIdRoutes = <_AdminAccountStateRoute>[
  _AdminAccountStateRoute(
    'recover state',
    'POST',
    '/api/v1/admin/accounts/0/recover-state',
    (accounts) => accounts.recoverState(0),
  ),
  _AdminAccountStateRoute(
    'clear error',
    'POST',
    '/api/v1/admin/accounts/0/clear-error',
    (accounts) => accounts.clearError(0),
  ),
  _AdminAccountStateRoute(
    'revert proxy fallback',
    'POST',
    '/api/v1/admin/accounts/0/revert-proxy-fallback',
    (accounts) => accounts.revertProxyFallback(0),
  ),
  _AdminAccountStateRoute(
    'clear rate limit',
    'POST',
    '/api/v1/admin/accounts/0/clear-rate-limit',
    (accounts) => accounts.clearRateLimit(0),
  ),
  _AdminAccountStateRoute(
    'reset quota',
    'POST',
    '/api/v1/admin/accounts/0/reset-quota',
    (accounts) => accounts.resetQuota(0),
  ),
  _AdminAccountStateRoute(
    'clear temporary unschedulable',
    'DELETE',
    '/api/v1/admin/accounts/0/temp-unschedulable',
    (accounts) => accounts.clearTempUnschedulable(0),
  ),
  _AdminAccountStateRoute(
    'set schedulable',
    'POST',
    '/api/v1/admin/accounts/0/schedulable',
    (accounts) => accounts.setSchedulable(0, schedulable: false),
  ),
  _AdminAccountStateRoute(
    'set privacy',
    'POST',
    '/api/v1/admin/accounts/0/set-privacy',
    (accounts) => accounts.setPrivacy(0),
  ),
];

Object? _fixtureForRequest(RequestOptions request) => switch ((
  request.method,
  request.path,
)) {
  ('POST', '/api/v1/admin/accounts/42/revert-proxy-fallback') => _success(
    <String, Object?>{'message': 'reverted'},
  ),
  ('DELETE', '/api/v1/admin/accounts/42/temp-unschedulable') => _success(
    <String, Object?>{'message': 'Temp unschedulable cleared successfully'},
  ),
  ('POST', '/api/v1/admin/accounts/42/recover-state') ||
  ('POST', '/api/v1/admin/accounts/42/clear-error') ||
  ('POST', '/api/v1/admin/accounts/42/clear-rate-limit') ||
  ('POST', '/api/v1/admin/accounts/42/reset-quota') ||
  ('POST', '/api/v1/admin/accounts/42/schedulable') ||
  ('POST', '/api/v1/admin/accounts/42/set-privacy') => _success(_accountData()),
  _ => throw StateError('unexpected request ${request.method} ${request.path}'),
};

Map<String, Object?> _accountData() {
  final source = readFixture('admin/account_read_surface.json');
  final account = source['account'];
  if (account is! Map) throw const FormatException();
  return account.map<String, Object?>((key, value) {
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
    Sub2ApiAdminApiKey('admin-account-state-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

final class _AdminAccountStateRoute {
  const _AdminAccountStateRoute(this.name, this.method, this.path, this.invoke);

  final String name;
  final String method;
  final String path;
  final Future<Object?> Function(Sub2ApiAdminAccountsClient accounts) invoke;
}
