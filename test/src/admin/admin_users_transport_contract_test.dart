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
      (request) => JsonResponse(body: _fixtureForRequest(request)),
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
    final page = results[9]! as Sub2ApiAdminUserPage;
    expect(page.items.single.currentConcurrency, 2);
    final user = results[10]! as Sub2ApiAdminUser;
    expect(user.groupRates[7].toString(), '0.85');
    expect(user.apiKeys.single.secret.toString(), '<redacted>');
    expect(
      user.apiKeys.single.secret.reveal(),
      'admin-user-api-key-secret-sentinel',
    );
    expect(user.subscriptions.single.monthlyUsageUsd.toString(), '12');
    final identity = results[11]! as Sub2ApiAdminBoundIdentity;
    expect(identity.metadata.values['tenant'], isA<Sub2ApiAdminJsonString>());
    expect(
      (results[14]! as Sub2ApiAdminDeleteUserResult).message,
      contains('deleted'),
    );
    final keyPage = results[16]! as Sub2ApiAdminUserApiKeyPage;
    expect(keyPage.items.single.secret.toString(), '<redacted>');
    expect(
      keyPage.items.single.secret.reveal(),
      'admin-api-key-list-secret-sentinel',
    );
    expect(
      (results[17]! as Sub2ApiAdminUserUsage).totalCost.toString(),
      '9.75',
    );
    expect(
      (results[18]! as Sub2ApiAdminBalanceHistoryPage).totalRecharged
          .toString(),
      '100',
    );

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
    expect(
      adapter.requests[9].queryParameters,
      containsPair('attr[8]', 'research'),
    );
    expect(adapter.requests[9].queryParameters, containsPair('page_size', 25));
    expect(
      adapter.requests[10].queryParameters,
      containsPair('include_deleted', true),
    );
    expect(adapter.requests[11].data, <String, Object?>{
      'provider_type': 'oidc',
      'provider_key': 'corp',
      'provider_subject': 'subject-21',
      'issuer': 'https://issuer.example.test',
      'metadata': <String, Object?>{
        'tenant': 'research',
        'roles': <Object?>['reader', 'writer'],
      },
      'channel': <String, Object?>{
        'channel': 'desktop',
        'channel_app_id': 'app-1',
        'channel_subject': 'device-21',
        'metadata': <String, Object?>{'managed': true},
      },
    });
    expect(
      adapter.requests[12].data,
      containsPair('password', 'create-password-sentinel'),
    );
    expect(adapter.requests[13].data, containsPair('allowed_groups', <int>[]));
    expect(
      adapter.requests[13].data,
      containsPair('group_rates', <String, Object?>{'7': 0.9, '9': null}),
    );
    expect(
      adapter.requests[15].headers,
      containsPair('Idempotency-Key', 'balance-21-1'),
    );
    expect(adapter.requests[15].data, <String, Object?>{
      'balance': 5.5,
      'operation': 'add',
      'notes': 'support credit',
    });
    expect(adapter.requests[16].queryParameters, containsPair('page', 3));
    expect(
      adapter.requests[17].queryParameters,
      containsPair('period', 'week'),
    );
    expect(
      adapter.requests[18].queryParameters,
      containsPair('type', 'admin_balance'),
    );
  });

  test('Admin JWT users sends every route after role checks', () async {
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
    expect(
      () => client.users.list(query: const Sub2ApiAdminUserListQuery(page: 0)),
      throwsA(_code('admin.users.invalid_page')),
    );
    expect(
      () => client.users.create(
        const Sub2ApiAdminCreateUserRequest(
          email: 'user@example.test',
          password: Sub2ApiPassword('short'),
        ),
      ),
      throwsA(_code('admin.users.invalid_create_credentials')),
    );
    expect(
      () => client.users.update(21, const Sub2ApiAdminUpdateUserRequest()),
      throwsA(_code('admin.users.update_required')),
    );
    expect(
      () => client.users.updateBalance(
        21,
        Sub2ApiAdminUpdateBalanceRequest(
          amount: Sub2ApiDecimal.zero(),
          operation: Sub2ApiAdminBalanceOperation.add,
          idempotencyKey: 'balance-zero',
        ),
      ),
      throwsA(_code('admin.users.balance_not_representable')),
    );
    expect(
      () => client.users.bindIdentity(
        21,
        const Sub2ApiAdminBindIdentityRequest(
          providerType: '',
          providerKey: 'corp',
          providerSubject: 'subject-21',
        ),
      ),
      throwsA(_code('admin.users.invalid_identity')),
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
  _AdminUserRoute(
    'list users',
    '/api/v1/admin/users',
    (users) => users.list(
      query: const Sub2ApiAdminUserListQuery(
        page: 2,
        pageSize: 25,
        status: Sub2ApiAdminUserStatus.active,
        role: Sub2ApiAdminUserRole.user,
        search: 'admin-user',
        groupName: 'priority',
        apiKeyGroupId: 7,
        attributes: <int, String>{8: 'research'},
        includeSubscriptions: true,
        sortBy: 'email',
        sortOrder: 'asc',
      ),
    ),
  ),
  _AdminUserRoute(
    'get user',
    '/api/v1/admin/users/21',
    (users) => users.getById(21, includeDeleted: true),
  ),
  _AdminUserRoute(
    'bind identity',
    '/api/v1/admin/users/21/auth-identities',
    (users) => users.bindIdentity(
      21,
      const Sub2ApiAdminBindIdentityRequest(
        providerType: 'oidc',
        providerKey: 'corp',
        providerSubject: 'subject-21',
        issuer: 'https://issuer.example.test',
        metadata: Sub2ApiAdminJsonObject(<String, Sub2ApiAdminJsonValue>{
          'tenant': Sub2ApiAdminJsonString('research'),
          'roles': Sub2ApiAdminJsonArray(<Sub2ApiAdminJsonValue>[
            Sub2ApiAdminJsonString('reader'),
            Sub2ApiAdminJsonString('writer'),
          ]),
        }),
        channel: Sub2ApiAdminBindIdentityChannelRequest(
          channel: 'desktop',
          channelAppId: 'app-1',
          channelSubject: 'device-21',
          metadata: Sub2ApiAdminJsonObject(<String, Sub2ApiAdminJsonValue>{
            'managed': Sub2ApiAdminJsonBool(true),
          }),
        ),
      ),
    ),
  ),
  _AdminUserRoute(
    'create user',
    '/api/v1/admin/users',
    (users) => users.create(
      Sub2ApiAdminCreateUserRequest(
        email: 'created@example.test',
        password: const Sub2ApiPassword('create-password-sentinel'),
        username: 'created',
        notes: 'created by contract test',
        role: Sub2ApiAdminUserRole.user,
        balance: Sub2ApiDecimal.parse('1.5'),
        concurrency: 2,
        rpmLimit: 20,
        allowedGroups: const <int>[7],
      ),
    ),
  ),
  _AdminUserRoute(
    'update user',
    '/api/v1/admin/users/21',
    (users) => users.update(
      21,
      Sub2ApiAdminUpdateUserRequest(
        username: '',
        notes: 'updated',
        status: Sub2ApiAdminUserStatus.active,
        allowedGroups: const <int>[],
        groupRates: <int, Sub2ApiDecimal?>{
          7: Sub2ApiDecimal.parse('0.9'),
          9: null,
        },
      ),
    ),
  ),
  _AdminUserRoute(
    'delete user',
    '/api/v1/admin/users/21',
    (users) => users.delete(21),
  ),
  _AdminUserRoute(
    'update balance',
    '/api/v1/admin/users/21/balance',
    (users) => users.updateBalance(
      21,
      Sub2ApiAdminUpdateBalanceRequest(
        amount: Sub2ApiDecimal.parse('5.5'),
        operation: Sub2ApiAdminBalanceOperation.add,
        idempotencyKey: 'balance-21-1',
        notes: 'support credit',
      ),
    ),
  ),
  _AdminUserRoute(
    'user API keys',
    '/api/v1/admin/users/21/api-keys',
    (users) => users.getApiKeys(
      21,
      page: 3,
      pageSize: 10,
      sortBy: 'created_at',
      sortOrder: 'desc',
    ),
  ),
  _AdminUserRoute(
    'user usage',
    '/api/v1/admin/users/21/usage',
    (users) => users.getUsage(21, period: Sub2ApiAdminUserUsagePeriod.week),
  ),
  _AdminUserRoute(
    'balance history',
    '/api/v1/admin/users/21/balance-history',
    (users) => users.getBalanceHistory(
      21,
      page: 4,
      pageSize: 15,
      type: Sub2ApiAdminBalanceHistoryType.adminBalance,
    ),
  ),
];

Map<String, Object?> _fixtureForRequest(RequestOptions request) => switch ((
  request.method,
  request.path,
)) {
  ('GET', '/api/v1/admin/users') => readFixture('admin/users_page.json'),
  ('POST', '/api/v1/admin/users') => readFixture('admin/user_detail.json'),
  ('GET' || 'PUT', '/api/v1/admin/users/21') => readFixture(
    'admin/user_detail.json',
  ),
  ('DELETE', '/api/v1/admin/users/21') => readFixture(
    'admin/user_deleted.json',
  ),
  (_, '/api/v1/admin/users/21/auth-identities') => readFixture(
    'admin/user_bound_identity.json',
  ),
  (_, '/api/v1/admin/users/21/balance') => readFixture(
    'admin/user_detail.json',
  ),
  (_, '/api/v1/admin/users/21/api-keys') => readFixture(
    'admin/user_api_keys.json',
  ),
  (_, '/api/v1/admin/users/21/usage') => readFixture('admin/user_usage.json'),
  (_, '/api/v1/admin/users/21/balance-history') => readFixture(
    'admin/user_balance_history.json',
  ),
  (_, '/api/v1/admin/users/21/replace-group') => readFixture(
    'admin/user_replace_group.json',
  ),
  (_, '/api/v1/admin/users/21/rpm-status') => readFixture(
    'admin/user_rpm_status.json',
  ),
  (
    _,
    '/api/v1/admin/users/batch-concurrency' ||
        '/api/v1/admin/users/batch-limits',
  ) =>
    readFixture('admin/user_batch_affected.json'),
  (
    _,
    '/api/v1/admin/users/21/platform-quotas' ||
        '/api/v1/admin/users/21/platform-quotas/reset',
  ) =>
    readFixture('admin/user_platform_quotas.json'),
  (_, '/api/v1/admin/users/21/attributes') => readFixture(
    'admin/user_attributes.json',
  ),
  _ => throw StateError('unexpected request ${request.method} ${request.path}'),
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
