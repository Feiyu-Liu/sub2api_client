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
    accessToken: Sub2ApiAccessToken('admin-account-lifecycle-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'Ops account lifecycle operations send complete typed contracts',
    () async {
      final adapter = JsonResponseAdapter(
        (request) => JsonResponse(body: _fixtureForRequest(request)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      final duplicate = await client.accounts.duplicate(
        42,
        const Sub2ApiAdminDuplicateAccountRequest(
          idempotencyKey: ' duplicate-account-42-1 ',
        ),
      );
      final deleted = await client.accounts.delete(42);
      final batch = await client.accounts.batchDelete(const [5, 4, 5, 3]);

      expect(duplicate.id, 43);
      expect(duplicate.name, 'primary account copy');
      for (final key in <String>['api_key', 'access_token', 'refresh_token']) {
        expect(duplicate.credentials.values.keys, isNot(contains(key)));
      }
      expect(deleted.message, 'Account deleted successfully');
      expect(batch.total, 3);
      expect(batch.success, 2);
      expect(batch.failed, 1);
      expect(batch.successIds, <int>[4, 5]);
      expect(batch.failedIds, <int>[3]);
      expect(batch.errors.single.accountId, 3);
      expect(batch.errors.single.error, 'delete failed');

      expect(
        adapter.requests.map((request) => '${request.method} ${request.path}'),
        <String>[
          'POST /api/v1/admin/accounts/42/duplicate',
          'DELETE /api/v1/admin/accounts/42',
          'POST /api/v1/admin/accounts/batch-delete',
        ],
      );
      for (final request in adapter.requests) {
        expect(
          request.headers,
          containsPair('x-api-key', 'admin-account-lifecycle-key-sentinel'),
        );
        expect(request.headers, isNot(contains('Authorization')));
      }
      expect(
        adapter.requests[0].headers,
        containsPair('Idempotency-Key', 'duplicate-account-42-1'),
      );
      expect(adapter.requests[0].data, isNull);
      expect(adapter.requests[1].data, isNull);
      expect(adapter.requests[2].data, <String, Object?>{
        'account_ids': <int>[5, 4, 3],
      });
    },
  );

  test(
    'Admin JWT account lifecycle operations run after role checks',
    () async {
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
            'Bearer admin-account-lifecycle-jwt-sentinel',
          ),
        );
        expect(request.headers, isNot(contains('x-api-key')));
      }
    },
  );

  test(
    'account lifecycle operations preserve business and key failures',
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

  test('account lifecycle operations reject malformed success data', () async {
    final malformedBodies = <Object?>[
      null,
      <String, Object?>{
        'total': 2,
        'success': 1,
        'failed': 1,
        'success_ids': <int>[4],
        'failed_ids': <int>[3],
        'errors': <Object?>[],
      },
    ];
    for (final malformed in malformedBodies) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: _success(malformed)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      if (malformed == null) {
        for (final route in _routes) {
          await expectLater(
            route.invoke(client.accounts),
            throwsA(_code('protocol.invalid_admin_account_response')),
            reason: route.name,
          );
        }
      } else {
        await expectLater(
          client.accounts.batchDelete(const [3, 4]),
          throwsA(_code('protocol.invalid_admin_account_response')),
        );
      }
    }
  });

  test('account lifecycle validation fails before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.duplicate(
        0,
        const Sub2ApiAdminDuplicateAccountRequest(idempotencyKey: 'key'),
      ),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.duplicate(
        42,
        const Sub2ApiAdminDuplicateAccountRequest(idempotencyKey: ' '),
      ),
      throwsA(_code('admin.accounts.idempotency_key_required')),
    );
    expect(
      () => client.accounts.delete(0),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(
      () => client.accounts.batchDelete(const []),
      throwsA(_code('admin.accounts.account_ids_required')),
    );
    expect(
      () => client.accounts.batchDelete(const [42, 0]),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('every account lifecycle mutation disables automatic replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-account-lifecycle-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-account-lifecycle-jwt'),
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

final _routes = <_AdminAccountLifecycleRoute>[
  _AdminAccountLifecycleRoute(
    'duplicate account',
    'POST',
    '/api/v1/admin/accounts/42/duplicate',
    (accounts) => accounts.duplicate(
      42,
      const Sub2ApiAdminDuplicateAccountRequest(
        idempotencyKey: 'duplicate-account-42-1',
      ),
    ),
  ),
  _AdminAccountLifecycleRoute(
    'delete account',
    'DELETE',
    '/api/v1/admin/accounts/42',
    (accounts) => accounts.delete(42),
  ),
  _AdminAccountLifecycleRoute(
    'batch delete accounts',
    'POST',
    '/api/v1/admin/accounts/batch-delete',
    (accounts) => accounts.batchDelete(const [5, 4, 5, 3]),
  ),
];

Future<void> _invokeAll(Sub2ApiAdminAccountsClient accounts) async {
  for (final route in _routes) {
    await route.invoke(accounts);
  }
}

Object? _fixtureForRequest(RequestOptions request) => switch ((
  request.method,
  request.path,
)) {
  ('POST', '/api/v1/admin/accounts/42/duplicate') => _success(
    _accountData(id: 43, name: 'primary account copy'),
  ),
  ('DELETE', '/api/v1/admin/accounts/42') => _success(<String, Object?>{
    'message': 'Account deleted successfully',
  }),
  ('POST', '/api/v1/admin/accounts/batch-delete') => _success(<String, Object?>{
    'total': 3,
    'success': 2,
    'failed': 1,
    'success_ids': <int>[4, 5],
    'failed_ids': <int>[3],
    'errors': <Object?>[
      <String, Object?>{'account_id': 3, 'error': 'delete failed'},
    ],
  }),
  _ => throw StateError('unexpected request ${request.method} ${request.path}'),
};

Map<String, Object?> _accountData({required int id, required String name}) {
  final source = readFixture('admin/account_read_surface.json');
  final account = source['account'];
  if (account is! Map) throw const FormatException();
  return account.map<String, Object?>((key, value) {
    if (key is! String) throw const FormatException();
    if (key == 'id') return MapEntry(key, id);
    if (key == 'name') return MapEntry(key, name);
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
    Sub2ApiAdminApiKey('admin-account-lifecycle-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

final class _AdminAccountLifecycleRoute {
  const _AdminAccountLifecycleRoute(
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
