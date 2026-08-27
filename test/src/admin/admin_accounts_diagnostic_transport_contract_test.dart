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
    accessToken: Sub2ApiAccessToken('admin-account-diagnostic-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops account diagnostics send complete typed contracts', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _fixtureForRequest(request)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final results = <Object?>[];
    for (final route in _routes) {
      results.add(await route.invoke(client.accounts));
    }

    final usage = results[0]! as Sub2ApiAdminAccountBatchUsage;
    expect(
      usage.usage[42]?.windows['five_hour']?.utilization.toString(),
      '32.5',
    );
    expect(usage.errors[43], 'account not found');
    expect(
      (results[1]! as Sub2ApiAdminAccountBatchTodayStats)
          .stats[42]
          ?.standardCost
          .toString(),
      '1.25',
    );
    final mixed = results[2]! as Sub2ApiAdminMixedChannelCheck;
    expect(mixed.hasRisk, isTrue);
    expect(mixed.error, 'mixed_channel_warning');
    expect(mixed.details?.groupId, 7);
    expect(results[3], <String>['gpt-5.6', 'gpt-5-mini']);

    expect(
      adapter.requests.map((request) => '${request.method} ${request.path}'),
      _routes.map((route) => '${route.method} ${route.path}'),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('x-api-key', 'admin-account-diagnostic-key-sentinel'),
      );
      expect(request.headers, isNot(contains('Authorization')));
    }
    expect(adapter.requests[0].data, <String, Object?>{
      'account_ids': <int>[42, 43],
      'force': true,
    });
    expect(adapter.requests[1].data, <String, Object?>{
      'account_ids': <int>[42, 43],
    });
    expect(adapter.requests[2].data, <String, Object?>{
      'platform': 'openai',
      'group_ids': <int>[7, 8],
      'account_id': 42,
    });
    expect(adapter.requests[3].data, isNull);
  });

  test('Admin JWT account diagnostics run after role checks', () async {
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
          'Bearer admin-account-diagnostic-jwt-sentinel',
        ),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test('account diagnostics preserve business and key failures', () async {
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

  test('account diagnostics reject malformed success data', () async {
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

  test('diagnostic validation fails before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.getBatchUsage(const [42, 0]),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.getBatchTodayStats(const [-1]),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.checkMixedChannel(
        platform: Sub2ApiAdminAccountPlatform.openAi,
        groupIds: const [0],
      ),
      throwsA(_code('admin.accounts.invalid_group_id')),
    );
    expect(
      () => client.accounts.checkMixedChannel(
        platform: Sub2ApiAdminAccountPlatform.openAi,
        groupIds: const [7],
        accountId: 0,
      ),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.syncUpstreamModels(0),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('empty diagnostic batches preserve the fixed empty response', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path.endsWith('/usage/batch')) {
        return JsonResponse(
          body: _success(<String, Object?>{
            'usage': <String, Object?>{},
            'errors': <String, Object?>{},
          }),
        );
      }
      return JsonResponse(
        body: _success(<String, Object?>{'stats': <String, Object?>{}}),
      );
    });
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final usage = await client.accounts.getBatchUsage(const []);
    final stats = await client.accounts.getBatchTodayStats(const []);

    expect(usage.usage, isEmpty);
    expect(usage.errors, isEmpty);
    expect(stats.stats, isEmpty);
    expect(adapter.requests.map((request) => request.data), <Object?>[
      <String, Object?>{'account_ids': <int>[], 'force': false},
      <String, Object?>{'account_ids': <int>[]},
    ]);
  });

  test('every account diagnostic POST disables automatic replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-account-diagnostic-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-account-diagnostic-jwt'),
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

final _routes = <_AdminAccountDiagnosticRoute>[
  _AdminAccountDiagnosticRoute(
    'batch usage',
    'POST',
    '/api/v1/admin/accounts/usage/batch',
    (accounts) => accounts.getBatchUsage(const [42, 43, 42], force: true),
  ),
  _AdminAccountDiagnosticRoute(
    'batch today stats',
    'POST',
    '/api/v1/admin/accounts/today-stats/batch',
    (accounts) => accounts.getBatchTodayStats(const [42, 43, 42]),
  ),
  _AdminAccountDiagnosticRoute(
    'mixed channel check',
    'POST',
    '/api/v1/admin/accounts/check-mixed-channel',
    (accounts) => accounts.checkMixedChannel(
      platform: Sub2ApiAdminAccountPlatform.openAi,
      groupIds: const [7, 8, 7],
      accountId: 42,
    ),
  ),
  _AdminAccountDiagnosticRoute(
    'sync upstream models',
    'POST',
    '/api/v1/admin/accounts/42/models/sync-upstream',
    (accounts) => accounts.syncUpstreamModels(42),
  ),
];

Object? _fixtureForRequest(RequestOptions request) => switch ((
  request.method,
  request.path,
)) {
  ('POST', '/api/v1/admin/accounts/usage/batch') => _success(<String, Object?>{
    'usage': <String, Object?>{'42': _data('usage')},
    'errors': <String, Object?>{'43': 'account not found'},
  }),
  ('POST', '/api/v1/admin/accounts/today-stats/batch') => _success(
    <String, Object?>{
      'stats': <String, Object?>{'42': _data('today_stats')},
    },
  ),
  ('POST', '/api/v1/admin/accounts/check-mixed-channel') => _success(
    <String, Object?>{
      'has_risk': true,
      'error': 'mixed_channel_warning',
      'message': 'mixed channel warning for research',
      'details': <String, Object?>{
        'group_id': 7,
        'group_name': 'research',
        'current_platform': 'OpenAI',
        'other_platform': 'Anthropic',
      },
    },
  ),
  ('POST', '/api/v1/admin/accounts/42/models/sync-upstream') => _success(
    <String, Object?>{
      'models': <String>['gpt-5.6', 'gpt-5-mini'],
    },
  ),
  _ => throw StateError('unexpected request ${request.method} ${request.path}'),
};

Object? _data(String key) {
  final source = readFixture('admin/account_read_surface.json');
  if (!source.containsKey(key)) throw StateError('missing fixture $key');
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
    Sub2ApiAdminApiKey('admin-account-diagnostic-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

final class _AdminAccountDiagnosticRoute {
  const _AdminAccountDiagnosticRoute(
    this.name,
    this.method,
    this.path,
    this.invoke,
  );

  final String name;
  final String method;
  final String path;
  final Future<Object?> Function(Sub2ApiAdminAccountsClient accounts) invoke;
}
