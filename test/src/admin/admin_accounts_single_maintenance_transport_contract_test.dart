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
    accessToken: Sub2ApiAccessToken(
      'admin-account-single-maintenance-jwt-sentinel',
    ),
    scope: 'https://sub2api.test',
  );

  test('Ops single account maintenance maps typed success contracts', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _fixtureForRequest(request)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final refresh = await client.accounts.refreshCredentials(42);
    final tier = await client.accounts.refreshGoogleOneTier(42);

    expect(refresh, isA<Sub2ApiAdminAccountRefreshCompleted>());
    expect((refresh as Sub2ApiAdminAccountRefreshCompleted).account.id, 42);
    expect(tier.tierId, 'google_one_2tb');
    expect(tier.driveStorageLimit, 2199023255552);
    expect(tier.driveStorageUsage, 53687091200);
    expect(tier.updatedAt, DateTime.utc(2026, 8, 27, 10, 30));
    expect(
      tier.storageInfo.values['drive_storage_limit']?.toWire(),
      2199023255552,
    );

    expect(
      adapter.requests.map((request) => '${request.method} ${request.path}'),
      _routes.map((route) => '${route.method} ${route.path}'),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair(
          'x-api-key',
          'admin-account-single-maintenance-key-sentinel',
        ),
      );
      expect(request.headers, isNot(contains('Authorization')));
      expect(request.data, isNull);
    }
  });

  test('refresh preserves the fixed temporary project warning union', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: _success(<String, Object?>{
          'message':
              'Token refreshed successfully, but project_id could not be retrieved (will retry automatically)',
          'warning': 'missing_project_id_temporary',
        }),
      ),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final result = await client.accounts.refreshCredentials(42);

    expect(result, isA<Sub2ApiAdminAccountRefreshWarning>());
    final warning = result as Sub2ApiAdminAccountRefreshWarning;
    expect(warning.warning, 'missing_project_id_temporary');
    expect(warning.message, contains('project_id'));
  });

  test('Admin JWT single account maintenance runs after role checks', () async {
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
          'Bearer admin-account-single-maintenance-jwt-sentinel',
        ),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test(
    'single account maintenance preserves business and key failures',
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

  test('single account maintenance rejects malformed success data', () async {
    final malformedByPath = <String, Object?>{
      '/api/v1/admin/accounts/42/refresh': <String, Object?>{
        'message': 'unknown warning',
        'warning': 'unknown_warning',
      },
      '/api/v1/admin/accounts/42/refresh-tier': <String, Object?>{
        'tier_id': 'google_one_2tb',
        'storage_info': <String, Object?>{
          'drive_storage_limit': 1,
          'drive_storage_usage': 2,
          'drive_tier_updated_at': '2026-08-27T10:30:00Z',
        },
        'drive_storage_limit': 3,
        'drive_storage_usage': 2,
        'updated_at': '2026-08-27T10:30:00Z',
      },
    };
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _success(malformedByPath[request.path])),
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

  test('single account maintenance validates IDs before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.refreshCredentials(0),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.refreshGoogleOneTier(-1),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(adapter.requests, isEmpty);
  });

  test(
    'every single account maintenance POST disables automatic replay',
    () async {
      const refreshableSession = Sub2ApiSession(
        accessToken: Sub2ApiAccessToken('expired-single-maintenance-jwt'),
        refreshToken: Sub2ApiRefreshToken('refresh-single-maintenance-jwt'),
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

final _routes = <_AdminAccountSingleMaintenanceRoute>[
  _AdminAccountSingleMaintenanceRoute(
    'refresh credentials',
    'POST',
    '/api/v1/admin/accounts/42/refresh',
    (accounts) => accounts.refreshCredentials(42),
  ),
  _AdminAccountSingleMaintenanceRoute(
    'refresh Google One tier',
    'POST',
    '/api/v1/admin/accounts/42/refresh-tier',
    (accounts) => accounts.refreshGoogleOneTier(42),
  ),
];

Object? _fixtureForRequest(RequestOptions request) => switch (request.path) {
  '/api/v1/admin/accounts/42/refresh' => _success(_accountData()),
  '/api/v1/admin/accounts/42/refresh-tier' => _success(<String, Object?>{
    'tier_id': 'google_one_2tb',
    'storage_info': <String, Object?>{
      'drive_storage_limit': 2199023255552,
      'drive_storage_usage': 53687091200,
      'drive_tier_updated_at': '2026-08-27T10:30:00Z',
      'provider': 'google_drive',
    },
    'drive_storage_limit': 2199023255552,
    'drive_storage_usage': 53687091200,
    'updated_at': '2026-08-27T10:30:00Z',
  }),
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
    Sub2ApiAdminApiKey('admin-account-single-maintenance-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

final class _AdminAccountSingleMaintenanceRoute {
  const _AdminAccountSingleMaintenanceRoute(
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
