import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_proxies_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_proxy_models.dart';
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
    accessToken: Sub2ApiAccessToken('admin-proxies-write-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops proxy writes send complete typed and redacted contracts', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _successForRequest(request)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final results = <Object?>[];
    for (final route in _routes) {
      results.add(await route.invoke(client.proxies));
    }

    expect((results[0]! as Sub2ApiAdminProxy).id, 11);
    expect(
      (results[1]! as Sub2ApiAdminProxy).status,
      Sub2ApiAdminProxyStatus.active,
    );
    expect(
      (results[2]! as Sub2ApiAdminProxyActionResult).message,
      'Proxy deleted successfully',
    );
    expect((results[3]! as Sub2ApiAdminProxyTestResult).latencyMs, 145);
    final quality = results[4]! as Sub2ApiAdminProxyQualityResult;
    expect(quality.score, 75);
    expect(
      quality.items.last.status,
      Sub2ApiAdminProxyQualityItemStatus.challenge,
    );
    expect((results[5]! as Sub2ApiAdminBatchCreateProxiesResult).created, 1);
    expect(
      (results[6]! as Sub2ApiAdminProxyBatchDeleteResult)
          .skipped
          .single
          .proxyId,
      12,
    );

    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('x-api-key', 'admin-proxies-write-key-sentinel'),
      );
      expect(request.headers, isNot(contains('Authorization')));
    }
    expect(
      adapter.requests.first.headers,
      containsPair('Idempotency-Key', 'proxy-create-1'),
    );
    expect(adapter.requests.first.data, <String, Object?>{
      'name': 'primary-proxy',
      'protocol': 'socks5',
      'host': '127.0.0.1',
      'port': 1080,
      'username': 'proxy-user',
      'password': 'proxy-create-password-sentinel',
      'expires_at': 2000000000,
      'fallback_mode': 'proxy',
      'backup_proxy_id': 12,
      'expiry_warn_days': 7,
    });
    expect(adapter.requests[1].data, <String, Object?>{
      'name': 'renamed-proxy',
      'protocol': 'https',
      'host': 'proxy.example.test',
      'port': 443,
      'username': 'updated-user',
      'password': 'proxy-update-password-sentinel',
      'status': 'inactive',
      'expires_at': 0,
      'fallback_mode': 'direct',
      'backup_proxy_id': null,
      'expiry_warn_days': 3,
    });
    expect(adapter.requests[5].data, <String, Object?>{
      'proxies': <Object?>[
        <String, Object?>{
          'protocol': 'http',
          'host': 'proxy-a.example.test',
          'port': 8080,
          'username': 'batch-user',
          'password': 'batch-password-sentinel',
        },
        <String, Object?>{
          'protocol': 'socks5h',
          'host': 'proxy-b.example.test',
          'port': 1080,
          'username': '',
          'password': '',
        },
      ],
    });
    expect(adapter.requests[6].data, <String, Object?>{
      'ids': <int>[11, 12],
    });
    expect(
      _createRequest.toString(),
      isNot(contains('proxy-create-password-sentinel')),
    );
    expect(
      _updateRequest.toString(),
      isNot(contains('proxy-update-password-sentinel')),
    );
  });

  test('Admin JWT proxy writes run after role bootstrap', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _successForRequest(request));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    for (final route in _routes) {
      await route.invoke(client.proxies);
    }

    expect(
      adapter.requests.where((request) => request.path == '/api/v1/auth/me'),
      hasLength(_routes.length),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair(
          'Authorization',
          'Bearer admin-proxies-write-jwt-sentinel',
        ),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test(
    'every proxy write preserves business and invalid key failures',
    () async {
      for (final failure in <({int status, Object body, String code})>[
        (
          status: 409,
          body: const <String, Object?>{
            'code': 'PROXY_IN_USE',
            'message': 'proxy is in use',
          },
          code: 'server.proxy_in_use',
        ),
        (
          status: 401,
          body: readFixture('admin/account_auth_failure.json'),
          code: 'server.invalid_api_key',
        ),
      ]) {
        for (final route in _routes) {
          final adapter = JsonResponseAdapter(
            (_) => JsonResponse(statusCode: failure.status, body: failure.body),
          );
          final client = _opsClient(configuration, adapter);
          addTearDown(client.close);
          await expectLater(
            route.invoke(client.proxies),
            throwsA(_code(failure.code)),
            reason: route.name,
          );
        }
      }
    },
  );

  test('every proxy write rejects malformed success data', () async {
    for (final route in _routes) {
      final adapter = JsonResponseAdapter(
        (_) => const JsonResponse(
          body: <String, Object?>{
            'code': 0,
            'message': 'success',
            'data': null,
          },
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);
      await expectLater(
        route.invoke(client.proxies),
        throwsA(_code('protocol.invalid_admin_proxy_response')),
        reason: route.name,
      );
    }
  });

  test('proxy write validation fails before network I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.proxies.create(
        const Sub2ApiAdminCreateProxyRequest(
          idempotencyKey: '',
          name: 'proxy',
          protocol: Sub2ApiAdminProxyProtocol.http,
          host: 'localhost',
          port: 8080,
        ),
      ),
      throwsA(_code('admin.proxies.idempotency_key_required')),
    );
    expect(
      () => client.proxies.update(
        11,
        const Sub2ApiAdminUpdateProxyRequest(
          expiresAt: null,
          fallbackMode: Sub2ApiAdminProxyFallbackMode.proxy,
          backupProxyId: null,
          expiryWarnDays: 7,
        ),
      ),
      throwsA(_code('admin.proxies.backup_proxy_required')),
    );
    expect(
      () => client.proxies.batchCreate(const []),
      throwsA(_code('admin.proxies.batch_required')),
    );
    expect(
      () => client.proxies.batchDelete(const []),
      throwsA(_code('admin.proxies.proxy_ids_required')),
    );
    expect(
      () => client.proxies.delete(0),
      throwsA(_code('admin.proxies.invalid_proxy_id')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('every proxy write disables automatic refresh and replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-proxy-write-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-proxy-write-jwt'),
      scope: 'https://sub2api.test',
    );
    for (final route in _routes) {
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

      await expectLater(
        route.invoke(client.proxies),
        throwsA(isA<Sub2ApiException>()),
        reason: route.name,
      );
      expect(
        adapter.requests.where(
          (request) => request.path == '/api/v1/auth/refresh',
        ),
        isEmpty,
      );
      expect(
        adapter.requests.where((request) => request.path == route.path),
        hasLength(1),
      );
    }
  });
}

final _createRequest = Sub2ApiAdminCreateProxyRequest(
  idempotencyKey: 'proxy-create-1',
  name: ' primary-proxy ',
  protocol: Sub2ApiAdminProxyProtocol.socks5,
  host: ' 127.0.0.1 ',
  port: 1080,
  username: ' proxy-user ',
  password: const Sub2ApiAdminProxyPassword('proxy-create-password-sentinel'),
  expiresAt: DateTime.fromMillisecondsSinceEpoch(
    2000000000 * 1000,
    isUtc: true,
  ),
  fallbackMode: Sub2ApiAdminProxyFallbackMode.proxy,
  backupProxyId: 12,
  expiryWarnDays: 7,
);

const _updateRequest = Sub2ApiAdminUpdateProxyRequest(
  name: ' renamed-proxy ',
  protocol: Sub2ApiAdminProxyProtocol.https,
  host: ' proxy.example.test ',
  port: 443,
  username: ' updated-user ',
  password: Sub2ApiAdminProxyPassword('proxy-update-password-sentinel'),
  status: Sub2ApiAdminProxyStatus.inactive,
  expiresAt: null,
  fallbackMode: Sub2ApiAdminProxyFallbackMode.direct,
  backupProxyId: null,
  expiryWarnDays: 3,
);

const _batchInputs = <Sub2ApiAdminBatchCreateProxyInput>[
  Sub2ApiAdminBatchCreateProxyInput(
    protocol: Sub2ApiAdminProxyProtocol.http,
    host: 'proxy-a.example.test',
    port: 8080,
    username: 'batch-user',
    password: Sub2ApiAdminProxyPassword('batch-password-sentinel'),
  ),
  Sub2ApiAdminBatchCreateProxyInput(
    protocol: Sub2ApiAdminProxyProtocol.socks5h,
    host: 'proxy-b.example.test',
    port: 1080,
  ),
];

final _routes = <_Route>[
  _Route(
    name: 'create',
    path: '/api/v1/admin/proxies',
    invoke: (proxies) => proxies.create(_createRequest),
  ),
  _Route(
    name: 'update',
    path: '/api/v1/admin/proxies/11',
    invoke: (proxies) => proxies.update(11, _updateRequest),
  ),
  _Route(
    name: 'delete',
    path: '/api/v1/admin/proxies/11',
    invoke: (proxies) => proxies.delete(11),
  ),
  _Route(
    name: 'test',
    path: '/api/v1/admin/proxies/11/test',
    invoke: (proxies) => proxies.test(11),
  ),
  _Route(
    name: 'quality',
    path: '/api/v1/admin/proxies/11/quality-check',
    invoke: (proxies) => proxies.checkQuality(11),
  ),
  _Route(
    name: 'batch create',
    path: '/api/v1/admin/proxies/batch',
    invoke: (proxies) => proxies.batchCreate(_batchInputs),
  ),
  _Route(
    name: 'batch delete',
    path: '/api/v1/admin/proxies/batch-delete',
    invoke: (proxies) => proxies.batchDelete(const [11, 12, 11]),
  ),
];

Object _successForRequest(RequestOptions request) {
  final mutations = readFixture('admin/proxy_mutation_results.json');
  final read = readFixture('admin/proxy_read_surface.json');
  final Object? data;
  if (request.method == 'POST' && request.path == '/api/v1/admin/proxies') {
    data = read['proxy'];
  } else if (request.method == 'PUT') {
    data = read['proxy'];
  } else if (request.method == 'DELETE') {
    data = mutations['delete'];
  } else if (request.path.endsWith('/quality-check')) {
    data = mutations['quality'];
  } else if (request.path.endsWith('/test')) {
    data = mutations['test'];
  } else if (request.path.endsWith('/batch-delete')) {
    data = mutations['batch_delete'];
  } else {
    data = mutations['batch_create'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-proxies-write-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);

final class _Route {
  const _Route({required this.name, required this.path, required this.invoke});

  final String name;
  final String path;
  final Future<Object?> Function(Sub2ApiAdminProxiesClient proxies) invoke;
}
