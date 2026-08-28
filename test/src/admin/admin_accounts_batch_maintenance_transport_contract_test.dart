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
    accessToken: Sub2ApiAccessToken('admin-account-maintenance-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'Ops batch account maintenance sends complete typed contracts',
    () async {
      final adapter = JsonResponseAdapter(
        (request) => JsonResponse(body: _fixtureForRequest(request)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      final results = await _invokeAll(client.accounts);

      final clear = results[0];
      expect(clear.total, 3);
      expect(clear.success, 2);
      expect(clear.failed, 1);
      expect(clear.errors.single.accountId, 43);
      expect(clear.warnings, isEmpty);

      final refresh = results[1];
      expect(refresh.total, 3);
      expect(refresh.success, 2);
      expect(refresh.failed, 1);
      expect(refresh.errors.single.accountId, 43);
      expect(refresh.warnings.single.accountId, 42);
      expect(refresh.warnings.single.warning, 'credentials expire soon');

      final tier = results[2];
      expect(tier.total, 2, reason: 'non-Google-One selections are filtered');
      expect(tier.success, 1);
      expect(tier.failed, 1);
      expect(tier.errors.single.accountId, 44);
      expect(tier.warnings, isEmpty);

      expect(
        adapter.requests.map((request) => '${request.method} ${request.path}'),
        _routes.map((route) => '${route.method} ${route.path}'),
      );
      for (final request in adapter.requests) {
        expect(
          request.headers,
          containsPair('x-api-key', 'admin-account-maintenance-key-sentinel'),
        );
        expect(request.headers, isNot(contains('Authorization')));
      }
      for (final request in adapter.requests) {
        expect(request.data, <String, Object?>{
          'account_ids': <int>[42, 43, 44],
        });
      }
    },
  );

  test('Admin JWT batch account maintenance runs after role checks', () async {
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

    await _invokeAll(client.accounts);

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
          'Bearer admin-account-maintenance-jwt-sentinel',
        ),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test(
    'batch account maintenance preserves business and key failures',
    () async {
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
    },
  );

  test('batch account maintenance rejects malformed success data', () async {
    final nullAdapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(null)),
    );
    final nullClient = _opsClient(configuration, nullAdapter);
    addTearDown(nullClient.close);
    for (final route in _routes) {
      await expectLater(
        route.invoke(nullClient.accounts),
        throwsA(_code('protocol.invalid_admin_account_response')),
        reason: route.name,
      );
    }

    final malformedByPath = <String, Object?>{
      '/api/v1/admin/accounts/batch-clear-error': <String, Object?>{
        'total': 2,
        'success': 2,
        'failed': 1,
        'errors': <Object?>[
          <String, Object?>{'account_id': 43, 'error': 'failed'},
        ],
      },
      '/api/v1/admin/accounts/batch-refresh': <String, Object?>{
        'total': 2,
        'success': 1,
        'failed': 1,
        'errors': <Object?>[
          <String, Object?>{'account_id': 43, 'error': 'failed'},
        ],
        'warnings': <Object?>[
          <String, Object?>{'account_id': 43, 'warning': 'overlap'},
        ],
      },
      '/api/v1/admin/accounts/batch-refresh-tier': <String, Object?>{
        'total': 0,
        'success': 0,
        'failed': 0,
      },
    };
    final malformedAdapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _success(malformedByPath[request.path])),
    );
    final malformedClient = _opsClient(configuration, malformedAdapter);
    addTearDown(malformedClient.close);
    for (final route in _routes) {
      await expectLater(
        route.invoke(malformedClient.accounts),
        throwsA(_code('protocol.invalid_admin_account_response')),
        reason: route.name,
      );
    }
  });

  test('batch account maintenance validates IDs before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.batchClearErrors(const []),
      throwsA(_code('admin.accounts.account_ids_required')),
    );
    expect(
      () => client.accounts.batchRefreshCredentials(const []),
      throwsA(_code('admin.accounts.account_ids_required')),
    );
    expect(
      () => client.accounts.batchClearErrors(const [42, 0]),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.batchRefreshCredentials(const [-1]),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.batchRefreshGoogleOneTiers(accountIds: const [0]),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(adapter.requests, isEmpty);
  });

  test(
    'empty tier batch explicitly requests all Google One accounts',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: _success(<String, Object?>{
            'total': 1,
            'success': 1,
            'failed': 0,
            'errors': null,
          }),
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      final result = await client.accounts.batchRefreshGoogleOneTiers();

      expect(result.total, 1);
      expect(result.success, 1);
      expect(result.errors, isEmpty);
      expect(adapter.requests.single.data, <String, Object?>{
        'account_ids': <int>[],
      });
    },
  );

  test(
    'every batch account maintenance POST disables automatic replay',
    () async {
      const refreshableSession = Sub2ApiSession(
        accessToken: Sub2ApiAccessToken('expired-account-maintenance-jwt'),
        refreshToken: Sub2ApiRefreshToken('refresh-account-maintenance-jwt'),
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
    },
  );
}

final _routes = <_AdminAccountBatchMaintenanceRoute>[
  _AdminAccountBatchMaintenanceRoute(
    'batch clear errors',
    'POST',
    '/api/v1/admin/accounts/batch-clear-error',
    (accounts) => accounts.batchClearErrors(const [42, 43, 44, 42]),
  ),
  _AdminAccountBatchMaintenanceRoute(
    'batch refresh credentials',
    'POST',
    '/api/v1/admin/accounts/batch-refresh',
    (accounts) => accounts.batchRefreshCredentials(const [42, 43, 44, 42]),
  ),
  _AdminAccountBatchMaintenanceRoute(
    'batch refresh Google One tiers',
    'POST',
    '/api/v1/admin/accounts/batch-refresh-tier',
    (accounts) =>
        accounts.batchRefreshGoogleOneTiers(accountIds: const [42, 43, 44, 42]),
  ),
];

Future<List<Sub2ApiAdminAccountBatchMaintenanceResult>> _invokeAll(
  Sub2ApiAdminAccountsClient accounts,
) async {
  final results = <Sub2ApiAdminAccountBatchMaintenanceResult>[];
  for (final route in _routes) {
    results.add(await route.invoke(accounts));
  }
  return results;
}

Object? _fixtureForRequest(RequestOptions request) => switch (request.path) {
  '/api/v1/admin/accounts/batch-clear-error' => _success(<String, Object?>{
    'total': 3,
    'success': 2,
    'failed': 1,
    'errors': <Object?>[
      <String, Object?>{'account_id': 43, 'error': 'clear failed'},
    ],
  }),
  '/api/v1/admin/accounts/batch-refresh' => _success(<String, Object?>{
    'total': 3,
    'success': 2,
    'failed': 1,
    'errors': <Object?>[
      <String, Object?>{'account_id': 43, 'error': 'refresh failed'},
    ],
    'warnings': <Object?>[
      <String, Object?>{'account_id': 42, 'warning': 'credentials expire soon'},
    ],
  }),
  '/api/v1/admin/accounts/batch-refresh-tier' => _success(<String, Object?>{
    'total': 2,
    'success': 1,
    'failed': 1,
    'errors': <Object?>[
      <String, Object?>{'account_id': 44, 'error': 'tier refresh failed'},
    ],
  }),
  _ => throw StateError('unexpected request ${request.method} ${request.path}'),
};

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
    Sub2ApiAdminApiKey('admin-account-maintenance-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

final class _AdminAccountBatchMaintenanceRoute {
  const _AdminAccountBatchMaintenanceRoute(
    this.name,
    this.method,
    this.path,
    this.invoke,
  );

  final String name;
  final String method;
  final String path;
  final Future<Sub2ApiAdminAccountBatchMaintenanceResult> Function(
    Sub2ApiAdminAccountsClient accounts,
  )
  invoke;
}
