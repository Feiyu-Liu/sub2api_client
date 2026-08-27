import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_user_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_users_client.dart';
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
    accessToken: Sub2ApiAccessToken('admin-users-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops users decodes every fixed v0.1.183 route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _fixtureForPath(request.path)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final results = <Object?>[];
    for (final route in _routes) {
      results.add(await route.invoke(client.users));
    }

    expect((results[0]! as Sub2ApiAdminReplaceUserGroupResult).migratedKeys, 3);
    expect((results[1]! as Sub2ApiAdminUserRpmStatus).userRpmLimit, 30);
    expect(
      (results[1]! as Sub2ApiAdminUserRpmStatus).perGroup.single.source,
      'override',
    );
    expect((results[2]! as Sub2ApiAdminAffectedUsersResult).affected, 2);
    final quotas = results[4]! as Sub2ApiAdminUserPlatformQuotas;
    expect(quotas.quotas.single.platform, Sub2ApiAdminQuotaPlatform.openAi);
    expect(quotas.quotas.single.dailyLimitUsd.toString(), '10.5');
    expect(quotas.quotas.single.dailyWindowStart, DateTime.utc(2026, 8, 27));
    final attributes = results[7]! as List<Sub2ApiAdminUserAttributeValue>;
    expect(attributes.single.attributeId, 8);

    expect(
      adapter.requests.map((request) => request.path),
      _routes.map((route) => route.path),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('x-api-key', 'admin-users-key-sentinel'),
      );
      expect(request.headers, isNot(contains('Authorization')));
    }

    expect(adapter.requests[0].data, <String, Object?>{
      'old_group_id': 7,
      'new_group_id': 9,
    });
    expect(adapter.requests[2].data, <String, Object?>{
      'user_ids': <int>[21, 22],
      'all': false,
      'concurrency': 4,
      'mode': 'add',
    });
    expect(adapter.requests[3].data, <String, Object?>{
      'user_ids': <int>[],
      'all': true,
      'concurrency': 6,
      'rpm_limit': 60,
    });
    expect(adapter.requests[5].data, <String, Object?>{
      'quotas': <Object?>[
        <String, Object?>{
          'platform': 'openai',
          'daily_limit_usd': 10.5,
          'weekly_limit_usd': null,
          'monthly_limit_usd': 100.0,
        },
      ],
    });
    expect(adapter.requests[6].data, <String, Object?>{
      'platform': 'openai',
      'window': 'weekly',
    });
    expect(adapter.requests[8].data, <String, Object?>{
      'values': <String, String>{'8': 'research'},
    });
  });

  test('Admin JWT users sends every route after role checks', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _fixtureForPath(request.path));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    for (final route in _routes) {
      await route.invoke(client.users);
    }

    final businessRequests = adapter.requests.where(
      (request) => request.path != '/api/v1/auth/me',
    );
    expect(
      businessRequests.map((request) => request.path),
      _routes.map((route) => route.path),
    );
    expect(
      adapter.requests.where((request) => request.path == '/api/v1/auth/me'),
      hasLength(_routes.length),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer admin-users-jwt-sentinel'),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  for (final route in _routes) {
    test('${route.name} preserves business failure', () async {
      final client = _opsClient(
        configuration,
        JsonResponseAdapter(
          (_) => JsonResponse(
            statusCode: 404,
            body: readFixture('admin/user_business_failure.json'),
          ),
        ),
      );
      addTearDown(client.close);

      await expectLater(
        route.invoke(client.users),
        throwsA(
          isA<Sub2ApiException>()
              .having((error) => error.kind, 'kind', Sub2ApiFailureKind.unknown)
              .having((error) => error.code, 'code', 'server.user_not_found'),
        ),
      );
    });

    test('${route.name} preserves invalid Admin API Key failure', () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          statusCode: 401,
          body: readFixture('admin/user_auth_failure.json'),
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      await expectLater(
        route.invoke(client.users),
        throwsA(
          isA<Sub2ApiException>()
              .having(
                (error) => error.kind,
                'kind',
                Sub2ApiFailureKind.unauthorized,
              )
              .having((error) => error.code, 'code', 'auth.unauthorized'),
        ),
      );
      expect(adapter.requests, hasLength(1));
      expect(adapter.requests.single.headers, isNot(contains('Authorization')));
    });

    test('${route.name} rejects malformed success data', () async {
      final client = _opsClient(
        configuration,
        JsonResponseAdapter(
          (_) => JsonResponse(body: readFixture('admin/user_malformed.json')),
        ),
      );
      addTearDown(client.close);

      await expectLater(
        route.invoke(client.users),
        throwsA(
          isA<Sub2ApiException>().having(
            (error) => error.code,
            'code',
            'protocol.invalid_admin_user_response',
          ),
        ),
      );
    });
  }

  test('users validates typed input before network I/O', () async {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('network must not be reached'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.users.replaceGroup(
        0,
        const Sub2ApiAdminReplaceUserGroupRequest(oldGroupId: 7, newGroupId: 9),
      ),
      throwsA(_code('admin.users.invalid_user_id')),
    );
    expect(
      () => client.users.batchUpdateLimits(
        const Sub2ApiAdminBatchLimitsRequest(userIds: <int>[21]),
      ),
      throwsA(_code('admin.users.batch_limit_required')),
    );
    expect(
      () => client.users.batchUpdateConcurrency(
        const Sub2ApiAdminBatchConcurrencyRequest(
          concurrency: 1,
          mode: Sub2ApiAdminBatchConcurrencyMode.set,
        ),
      ),
      throwsA(_code('admin.users.user_ids_required')),
    );
    expect(
      () => client.users.updatePlatformQuotas(
        21,
        Sub2ApiAdminUpdatePlatformQuotasRequest(
          quotas: <Sub2ApiAdminPlatformQuotaInput>[
            Sub2ApiAdminPlatformQuotaInput(
              platform: Sub2ApiAdminQuotaPlatform.openAi,
              dailyLimitUsd: Sub2ApiDecimal.parse('0.1234567890123456789'),
            ),
          ],
        ),
      ),
      throwsA(_code('admin.users.quota_limit_not_representable')),
    );
    expect(
      () => client.users.updateAttributes(
        21,
        const Sub2ApiAdminUpdateUserAttributesRequest(
          values: <int, String>{0: 'invalid'},
        ),
      ),
      throwsA(_code('admin.users.invalid_attribute_id')),
    );
    expect(adapter.requests, isEmpty);
  });
}

final _routes = <_AdminUserRoute>[
  _AdminUserRoute(
    'replace group',
    '/api/v1/admin/users/21/replace-group',
    (users) => users.replaceGroup(
      21,
      const Sub2ApiAdminReplaceUserGroupRequest(oldGroupId: 7, newGroupId: 9),
    ),
  ),
  _AdminUserRoute(
    'RPM status',
    '/api/v1/admin/users/21/rpm-status',
    (users) => users.getRpmStatus(21),
  ),
  _AdminUserRoute(
    'batch concurrency',
    '/api/v1/admin/users/batch-concurrency',
    (users) => users.batchUpdateConcurrency(
      const Sub2ApiAdminBatchConcurrencyRequest(
        userIds: <int>[21, 22],
        concurrency: 4,
        mode: Sub2ApiAdminBatchConcurrencyMode.add,
      ),
    ),
  ),
  _AdminUserRoute(
    'batch limits',
    '/api/v1/admin/users/batch-limits',
    (users) => users.batchUpdateLimits(
      const Sub2ApiAdminBatchLimitsRequest(
        all: true,
        concurrency: 6,
        rpmLimit: 60,
      ),
    ),
  ),
  _AdminUserRoute(
    'platform quotas',
    '/api/v1/admin/users/21/platform-quotas',
    (users) => users.getPlatformQuotas(21),
  ),
  _AdminUserRoute(
    'update platform quotas',
    '/api/v1/admin/users/21/platform-quotas',
    (users) => users.updatePlatformQuotas(
      21,
      Sub2ApiAdminUpdatePlatformQuotasRequest(
        quotas: <Sub2ApiAdminPlatformQuotaInput>[
          Sub2ApiAdminPlatformQuotaInput(
            platform: Sub2ApiAdminQuotaPlatform.openAi,
            dailyLimitUsd: Sub2ApiDecimal.parse('10.5'),
            monthlyLimitUsd: Sub2ApiDecimal.parse('100'),
          ),
        ],
      ),
    ),
  ),
  _AdminUserRoute(
    'reset platform quota',
    '/api/v1/admin/users/21/platform-quotas/reset',
    (users) => users.resetPlatformQuotaWindow(
      21,
      const Sub2ApiAdminResetPlatformQuotaRequest(
        platform: Sub2ApiAdminQuotaPlatform.openAi,
        window: Sub2ApiAdminQuotaWindow.weekly,
      ),
    ),
  ),
  _AdminUserRoute(
    'attributes',
    '/api/v1/admin/users/21/attributes',
    (users) => users.getAttributes(21),
  ),
  _AdminUserRoute(
    'update attributes',
    '/api/v1/admin/users/21/attributes',
    (users) => users.updateAttributes(
      21,
      const Sub2ApiAdminUpdateUserAttributesRequest(
        values: <int, String>{8: 'research'},
      ),
    ),
  ),
];

Map<String, Object?> _fixtureForPath(String path) => switch (path) {
  '/api/v1/admin/users/21/replace-group' => readFixture(
    'admin/user_replace_group.json',
  ),
  '/api/v1/admin/users/21/rpm-status' => readFixture(
    'admin/user_rpm_status.json',
  ),
  '/api/v1/admin/users/batch-concurrency' ||
  '/api/v1/admin/users/batch-limits' => readFixture(
    'admin/user_batch_affected.json',
  ),
  '/api/v1/admin/users/21/platform-quotas' ||
  '/api/v1/admin/users/21/platform-quotas/reset' => readFixture(
    'admin/user_platform_quotas.json',
  ),
  '/api/v1/admin/users/21/attributes' => readFixture(
    'admin/user_attributes.json',
  ),
  _ => throw StateError('unexpected path $path'),
};

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-users-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

final class _AdminUserRoute {
  const _AdminUserRoute(this.name, this.path, this.invoke);

  final Future<Object?> Function(Sub2ApiAdminUsersClient users) invoke;
  final String name;
  final String path;
}
