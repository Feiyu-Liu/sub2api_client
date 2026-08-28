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
    accessToken: Sub2ApiAccessToken('admin-proxies-read-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'Ops proxies decodes every fixed read route with API-key isolation',
    () async {
      final adapter = JsonResponseAdapter(
        (request) => JsonResponse(body: _fixtureForRequest(request)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      final results = <Object?>[];
      for (final route in _routes) {
        results.add(await route.invoke(client.proxies));
      }

      final page = results[0]! as Sub2ApiAdminProxyPage;
      expect(page.total, 1);
      expect(page.items.single.id, 11);
      expect(page.items.single.protocol, Sub2ApiAdminProxyProtocol.socks5);
      expect(page.items.single.password?.reveal(), 'proxy-password-sentinel');
      expect(
        page.items.single.toString(),
        isNot(contains('proxy-password-sentinel')),
      );
      expect(
        (results[1]! as List<Sub2ApiAdminProxy>).single.accountCount,
        isNull,
      );
      expect((results[2]! as List<Sub2ApiAdminProxy>).single.accountCount, 2);
      expect((results[3]! as Sub2ApiAdminProxy).backupProxyId, 12);
      expect(
        (results[4]! as List<Sub2ApiAdminProxyAccountSummary>).single.id,
        42,
      );
      expect(
        (results[5]! as Sub2ApiAdminProxyStats).successRate.toString(),
        '99.5',
      );
      expect(
        (results[5]! as Sub2ApiAdminProxyStats).averageLatency.toString(),
        '145.25',
      );

      expect(
        adapter.requests.map((request) => request.path),
        _routes.map((route) => route.path),
      );
      for (final request in adapter.requests) {
        expect(
          request.headers,
          containsPair('x-api-key', 'admin-proxies-read-key-sentinel'),
        );
        expect(request.headers, isNot(contains('Authorization')));
      }
      expect(adapter.requests.first.queryParameters, <String, dynamic>{
        'page': 2,
        'page_size': 25,
        'protocol': 'https',
        'status': 'expired',
        'search': 'primary',
        'sort_by': 'account_count',
        'sort_order': 'asc',
      });
      expect(adapter.requests[1].queryParameters, isEmpty);
      expect(adapter.requests[2].queryParameters, <String, dynamic>{
        'with_count': true,
      });
    },
  );

  test('Admin JWT proxies sends every read route after role checks', () async {
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
      await route.invoke(client.proxies);
    }

    expect(
      adapter.requests.where((request) => request.path == '/api/v1/auth/me'),
      hasLength(_routes.length),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer admin-proxies-read-jwt-sentinel'),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test('every proxy read route preserves business failure', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        statusCode: 404,
        body: <String, Object?>{
          'code': 'PROXY_NOT_FOUND',
          'message': 'proxy not found',
        },
      ),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    for (final route in _routes) {
      await expectLater(
        route.invoke(client.proxies),
        throwsA(_code('server.proxy_not_found')),
        reason: route.name,
      );
    }
  });

  test(
    'every proxy read route preserves invalid Admin API Key failure',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          statusCode: 401,
          body: readFixture('admin/account_auth_failure.json'),
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      for (final route in _routes) {
        await expectLater(
          route.invoke(client.proxies),
          throwsA(_code('server.invalid_api_key')),
          reason: route.name,
        );
      }
    },
  );

  test('every proxy read route rejects malformed success data', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{'code': 0, 'message': 'success', 'data': null},
      ),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    for (final route in _routes) {
      await expectLater(
        route.invoke(client.proxies),
        throwsA(_code('protocol.invalid_admin_proxy_response')),
        reason: route.name,
      );
    }
  });

  test('proxy read validation rejects invalid identifiers and pagination', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.proxies.getById(0),
      throwsA(_code('admin.proxies.invalid_proxy_id')),
    );
    expect(
      () => client.proxies.getAccounts(-1),
      throwsA(_code('admin.proxies.invalid_proxy_id')),
    );
    expect(
      () => client.proxies.getStats(0),
      throwsA(_code('admin.proxies.invalid_proxy_id')),
    );
    expect(
      () =>
          client.proxies.list(query: const Sub2ApiAdminProxyListQuery(page: 0)),
      throwsA(_code('admin.proxies.invalid_page')),
    );
    expect(
      () => client.proxies.list(
        query: const Sub2ApiAdminProxyListQuery(pageSize: 101),
      ),
      throwsA(_code('admin.proxies.invalid_page_size')),
    );
    expect(adapter.requests, isEmpty);
  });
}

final _routes = <_Route>[
  _Route(
    name: 'list',
    path: '/api/v1/admin/proxies',
    invoke: (proxies) => proxies.list(
      query: const Sub2ApiAdminProxyListQuery(
        page: 2,
        pageSize: 25,
        protocol: Sub2ApiAdminProxyProtocol.https,
        status: Sub2ApiAdminProxyStatus.expired,
        search: 'primary',
        sortBy: Sub2ApiAdminProxySort.accountCount,
        sortDescending: false,
      ),
    ),
  ),
  _Route(
    name: 'all',
    path: '/api/v1/admin/proxies/all',
    invoke: (proxies) => proxies.getAll(),
  ),
  _Route(
    name: 'all with count',
    path: '/api/v1/admin/proxies/all',
    invoke: (proxies) => proxies.getAll(includeAccountCount: true),
  ),
  _Route(
    name: 'detail',
    path: '/api/v1/admin/proxies/11',
    invoke: (proxies) => proxies.getById(11),
  ),
  _Route(
    name: 'accounts',
    path: '/api/v1/admin/proxies/11/accounts',
    invoke: (proxies) => proxies.getAccounts(11),
  ),
  _Route(
    name: 'stats',
    path: '/api/v1/admin/proxies/11/stats',
    invoke: (proxies) => proxies.getStats(11),
  ),
];

Object _fixtureForRequest(RequestOptions request) {
  final fixture = readFixture('admin/proxy_read_surface.json');
  Object? data;
  if (request.path == '/api/v1/admin/proxies') {
    data = <String, Object?>{
      'items': <Object?>[fixture['proxy']],
      'total': 1,
      'page': 2,
      'page_size': 25,
      'pages': 1,
    };
  } else if (request.path == '/api/v1/admin/proxies/all') {
    final proxy = Map<String, Object?>.from(fixture['proxy']! as Map);
    if (request.queryParameters['with_count'] != true) {
      proxy.remove('account_count');
    }
    data = <Object?>[proxy];
  } else if (request.path.endsWith('/accounts')) {
    data = fixture['accounts'];
  } else if (request.path.endsWith('/stats')) {
    data = fixture['stats'];
  } else {
    data = fixture['proxy'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-proxies-read-key-sentinel'),
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
