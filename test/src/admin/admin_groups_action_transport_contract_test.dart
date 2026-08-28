import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_group_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_groups_client.dart';
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
    accessToken: Sub2ApiAccessToken('admin-group-actions-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'Ops groups sends every fixed action without credential fallback',
    () async {
      final adapter = JsonResponseAdapter(
        (request) => JsonResponse(body: _fixtureForRequest(request)),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      final results = <Object?>[];
      for (final route in _routes) {
        results.add(await route.invoke(client.groups));
      }

      expect(
        (results[0]! as Sub2ApiAdminGroupActionResult).message,
        isNotEmpty,
      );
      expect((results[1]! as Sub2ApiAdminCompositeRoute).id, 51);
      expect((results[2]! as Sub2ApiAdminCompositeRouteDecision).route?.id, 51);
      expect((results[5]! as Sub2ApiAdminGroup).id, 7);
      expect(
        adapter.requests.map((request) => '${request.method} ${request.path}'),
        _routes.map((route) => '${route.method} ${route.path}'),
      );
      for (final request in adapter.requests) {
        expect(
          request.headers,
          containsPair('x-api-key', 'admin-group-actions-key-sentinel'),
        );
        expect(request.headers, isNot(contains('Authorization')));
      }
      expect(adapter.requests[0].data, <String, Object?>{
        'updates': <Object?>[
          <String, Object?>{'id': 7, 'sort_order': 20},
        ],
      });
      expect(adapter.requests[1].data, <String, Object?>{
        'public_model': 'research-*',
        'match_type': 'prefix',
        'target_platform': 'openai',
        'upstream_model': 'gpt-5.2',
        'endpoint': 'responses',
        'priority': 10,
        'enabled': true,
        'notes': 'primary route',
      });
      expect(adapter.requests[2].data, <String, Object?>{
        'model': 'research-gpt',
        'endpoint': 'responses',
      });
      expect(
        adapter.requests[5].headers,
        containsPair('Idempotency-Key', 'duplicate-group-7-1'),
      );
      expect(adapter.requests[7].data, <String, Object?>{
        'entries': <Object?>[
          <String, Object?>{'user_id': 21, 'rate_multiplier': 0.9},
        ],
      });
      expect(adapter.requests[9].data, <String, Object?>{
        'entries': <Object?>[
          <String, Object?>{'user_id': 21, 'rpm_override': 60},
          <String, Object?>{'user_id': 22, 'rpm_override': null},
        ],
      });
    },
  );

  test('Admin JWT groups sends every action after role checks', () async {
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
      await route.invoke(client.groups);
    }

    final businessRequests = adapter.requests.where(
      (request) => request.path != '/api/v1/auth/me',
    );
    expect(
      businessRequests.map((request) => '${request.method} ${request.path}'),
      _routes.map((route) => '${route.method} ${route.path}'),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair(
          'Authorization',
          'Bearer admin-group-actions-jwt-sentinel',
        ),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test(
    'every group action preserves business and invalid-key failures',
    () async {
      for (final failure in <({int status, String fixture, String code})>[
        (
          status: 404,
          fixture: 'admin/group_business_failure.json',
          code: 'server.group_not_found',
        ),
        (
          status: 401,
          fixture: 'admin/group_auth_failure.json',
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
            route.invoke(client.groups),
            throwsA(_code(failure.code)),
            reason: '${failure.fixture}: ${route.name}',
          );
        }
      }
    },
  );

  test('every group action rejects malformed success data', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('admin/group_malformed.json')),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);
    for (final route in _routes) {
      await expectLater(
        route.invoke(client.groups),
        throwsA(_code('protocol.invalid_admin_group_response')),
        reason: route.name,
      );
    }
  });

  test('group action validation is local and duplicate key is explicit', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.groups.updateSortOrder(
        Sub2ApiAdminUpdateGroupSortOrderRequest(updates: const []),
      ),
      throwsA(_code('admin.groups.sort_updates_required')),
    );
    expect(
      () => client.groups.duplicate(
        7,
        const Sub2ApiAdminDuplicateGroupRequest(idempotencyKey: ' '),
      ),
      throwsA(_code('admin.groups.idempotency_key_required')),
    );
    expect(
      () => client.groups.createCompositeRoute(
        7,
        const Sub2ApiAdminCompositeRouteRequest(
          publicModel: '',
          targetPlatform: Sub2ApiAdminGroupPlatform.openAi,
        ),
      ),
      throwsA(_code('admin.groups.public_model_required')),
    );
    expect(
      () => client.groups.setRateMultipliers(
        7,
        Sub2ApiAdminSetGroupRateMultipliersRequest(
          entries: <Sub2ApiAdminGroupRateMultiplierInput>[
            Sub2ApiAdminGroupRateMultiplierInput(
              userId: 21,
              rateMultiplier: Sub2ApiDecimal.parse('0.1234567890123456789'),
            ),
          ],
        ),
      ),
      throwsA(_code('admin.groups.rate_multiplier_not_representable')),
    );
    expect(adapter.requests, isEmpty);
  });
}

final _routeRequest = Sub2ApiAdminCompositeRouteRequest(
  publicModel: 'research-*',
  matchType: Sub2ApiAdminCompositeRouteMatchType.prefix,
  targetPlatform: Sub2ApiAdminGroupPlatform.openAi,
  upstreamModel: 'gpt-5.2',
  endpoint: Sub2ApiAdminCompositeRouteEndpoint.responses,
  priority: 10,
  notes: 'primary route',
);

final _routes = <_AdminGroupActionRoute>[
  _AdminGroupActionRoute(
    'sort',
    'PUT',
    '/api/v1/admin/groups/sort-order',
    (groups) => groups.updateSortOrder(
      Sub2ApiAdminUpdateGroupSortOrderRequest(
        updates: const [
          Sub2ApiAdminGroupSortOrderUpdate(groupId: 7, sortOrder: 20),
        ],
      ),
    ),
  ),
  _AdminGroupActionRoute(
    'create composite',
    'POST',
    '/api/v1/admin/groups/7/composite-routes',
    (groups) => groups.createCompositeRoute(7, _routeRequest),
  ),
  _AdminGroupActionRoute(
    'preview composite',
    'POST',
    '/api/v1/admin/groups/7/composite-routes/preview',
    (groups) => groups.previewCompositeRoute(
      7,
      const Sub2ApiAdminCompositeRoutePreviewRequest(
        model: 'research-gpt',
        endpoint: Sub2ApiAdminCompositeRouteEndpoint.responses,
      ),
    ),
  ),
  _AdminGroupActionRoute(
    'update composite',
    'PUT',
    '/api/v1/admin/groups/7/composite-routes/51',
    (groups) => groups.updateCompositeRoute(7, 51, _routeRequest),
  ),
  _AdminGroupActionRoute(
    'delete composite',
    'DELETE',
    '/api/v1/admin/groups/7/composite-routes/51',
    (groups) => groups.deleteCompositeRoute(7, 51),
  ),
  _AdminGroupActionRoute(
    'duplicate',
    'POST',
    '/api/v1/admin/groups/7/duplicate',
    (groups) => groups.duplicate(
      7,
      const Sub2ApiAdminDuplicateGroupRequest(
        idempotencyKey: 'duplicate-group-7-1',
      ),
    ),
  ),
  _AdminGroupActionRoute(
    'delete group',
    'DELETE',
    '/api/v1/admin/groups/7',
    (groups) => groups.delete(7),
  ),
  _AdminGroupActionRoute(
    'set rates',
    'PUT',
    '/api/v1/admin/groups/7/rate-multipliers',
    (groups) => groups.setRateMultipliers(
      7,
      Sub2ApiAdminSetGroupRateMultipliersRequest(
        entries: <Sub2ApiAdminGroupRateMultiplierInput>[
          Sub2ApiAdminGroupRateMultiplierInput(
            userId: 21,
            rateMultiplier: Sub2ApiDecimal.parse('0.9'),
          ),
        ],
      ),
    ),
  ),
  _AdminGroupActionRoute(
    'clear rates',
    'DELETE',
    '/api/v1/admin/groups/7/rate-multipliers',
    (groups) => groups.clearRateMultipliers(7),
  ),
  _AdminGroupActionRoute(
    'set rpm',
    'PUT',
    '/api/v1/admin/groups/7/rpm-overrides',
    (groups) => groups.setRpmOverrides(
      7,
      Sub2ApiAdminSetGroupRpmOverridesRequest(
        entries: const [
          Sub2ApiAdminGroupRpmOverrideInput(userId: 21, rpmOverride: 60),
          Sub2ApiAdminGroupRpmOverrideInput(userId: 22),
        ],
      ),
    ),
  ),
  _AdminGroupActionRoute(
    'clear rpm',
    'DELETE',
    '/api/v1/admin/groups/7/rpm-overrides',
    (groups) => groups.clearRpmOverrides(7),
  ),
];

Map<String, Object?> _fixtureForRequest(RequestOptions request) {
  if (request.path == '/api/v1/admin/groups/7/duplicate') {
    return readFixture('admin/group_detail.json');
  }
  if ((request.method == 'POST' &&
          request.path == '/api/v1/admin/groups/7/composite-routes') ||
      (request.method == 'PUT' &&
          request.path == '/api/v1/admin/groups/7/composite-routes/51')) {
    return _summaryData('composite_routes', first: true);
  }
  if (request.path == '/api/v1/admin/groups/7/composite-routes/preview') {
    return _actionData('preview');
  }
  return _actionData('action');
}

Map<String, Object?> _summaryData(String key, {bool first = false}) {
  final data = readFixture('admin/group_read_summaries.json')['data'];
  if (data is! Map) throw StateError('invalid summaries fixture');
  var value = data[key];
  if (first) {
    if (value is! List || value.isEmpty) throw StateError('empty fixture $key');
    value = value.first;
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': value};
}

Map<String, Object?> _actionData(String key) {
  final data = readFixture('admin/group_action_results.json')['data'];
  if (data is! Map) throw StateError('invalid action fixture');
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data[key]};
}

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-group-actions-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

final class _AdminGroupActionRoute {
  const _AdminGroupActionRoute(this.name, this.method, this.path, this.invoke);

  final Future<Object?> Function(Sub2ApiAdminGroupsClient groups) invoke;
  final String method;
  final String name;
  final String path;
}
