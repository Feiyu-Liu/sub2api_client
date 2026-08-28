import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_account_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_user_models.dart';
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
    accessToken: Sub2ApiAccessToken('admin-bulk-update-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops bulk update sends typed selector and patch contracts', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(_resultData())),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final result = await client.accounts.bulkUpdate(_request);

    expect(result.successIds, <int>[42]);
    expect(result.failedIds, <int>[43]);
    expect(result.longContextInheritedCount, 2);
    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/admin/accounts/bulk-update');
    expect(sent.data, <String, Object?>{
      'account_ids': <int>[42, 43],
      'name': 'bulk updated',
      'proxy_id': 0,
      'concurrency': 0,
      'priority': 0,
      'rate_multiplier': 0.75,
      'load_factor': 0,
      'status': 'inactive',
      'schedulable': false,
      'group_ids': <int>[],
      'credentials': <String, Object?>{
        'api_key': 'bulk-api-key',
        'base_url': 'https://upstream.example/v1',
      },
      'extra': <String, Object?>{'base_rpm': 60},
      'upstream_billing_probe_enabled': false,
      'confirm_mixed_channel_risk': true,
    });
    expect(
      sent.headers,
      containsPair('x-api-key', 'admin-bulk-update-key-sentinel'),
    );
    expect(sent.headers, isNot(contains('Authorization')));
  });

  test(
    'bulk selectors distinguish filters from explicit all accounts',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: _success(_resultData())),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      await client.accounts.bulkUpdate(
        Sub2ApiAdminBulkUpdateAccountsRequest(
          selector: const Sub2ApiAdminBulkAccountSelector.filters(
            Sub2ApiAdminBulkAccountFilters(
              platform: Sub2ApiAdminAccountPlatform.openAi,
              type: Sub2ApiAdminAccountType.oauth,
              status: Sub2ApiAdminAccountStatus.active,
              group: Sub2ApiAdminBulkGroupFilter.ungrouped(),
              search: ' research ',
              privacyMode: 'strict',
            ),
          ),
          schedulable: true,
        ),
      );
      await client.accounts.bulkUpdate(
        Sub2ApiAdminBulkUpdateAccountsRequest(
          selector: const Sub2ApiAdminBulkAccountSelector.allAccounts(),
          upstreamBillingProbeEnabled: false,
        ),
      );

      expect(adapter.requests[0].data, <String, Object?>{
        'filters': <String, Object?>{
          'platform': 'openai',
          'type': 'oauth',
          'status': 'active',
          'group': 'ungrouped',
          'search': 'research',
          'privacy_mode': 'strict',
        },
        'schedulable': true,
      });
      expect(adapter.requests[1].data, <String, Object?>{
        'filters': <String, Object?>{},
        'upstream_billing_probe_enabled': false,
      });
    },
  );

  test('Admin JWT bulk update runs after role checks', () async {
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _success(_resultData()));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.accounts.bulkUpdate(_request);

    expect(
      adapter.requests.map((sent) => '${sent.method} ${sent.path}'),
      <String>[
        'GET /api/v1/auth/me',
        'POST /api/v1/admin/accounts/bulk-update',
      ],
    );
    for (final sent in adapter.requests) {
      expect(
        sent.headers,
        containsPair('Authorization', 'Bearer admin-bulk-update-jwt-sentinel'),
      );
      expect(sent.headers, isNot(contains('x-api-key')));
    }
  });

  test('bulk update preserves business and key failures', () async {
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

      await expectLater(
        client.accounts.bulkUpdate(_request),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('bulk update rejects malformed aggregation', () async {
    final malformed = _resultData();
    malformed['failed'] = 0;
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: _success(malformed)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.accounts.bulkUpdate(_request),
      throwsA(_code('protocol.invalid_admin_account_response')),
    );
  });

  test('bulk update validates selector and patch before I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.accounts.bulkUpdate(
        Sub2ApiAdminBulkUpdateAccountsRequest(
          selector: Sub2ApiAdminBulkAccountSelector.ids(const []),
          schedulable: true,
        ),
      ),
      throwsA(_code('admin.accounts.account_ids_required')),
    );
    expect(
      () => client.accounts.bulkUpdate(
        Sub2ApiAdminBulkUpdateAccountsRequest(
          selector: const Sub2ApiAdminBulkAccountSelector.filters(
            Sub2ApiAdminBulkAccountFilters(),
          ),
          schedulable: true,
        ),
      ),
      throwsA(_code('admin.accounts.bulk_filters_required')),
    );
    expect(
      () => client.accounts.bulkUpdate(
        Sub2ApiAdminBulkUpdateAccountsRequest(
          selector: const Sub2ApiAdminBulkAccountSelector.allAccounts(),
        ),
      ),
      throwsA(_code('admin.accounts.empty_bulk_update')),
    );
    expect(
      () => client.accounts.bulkUpdate(
        Sub2ApiAdminBulkUpdateAccountsRequest(
          selector: const Sub2ApiAdminBulkAccountSelector.allAccounts(),
          extra: const Sub2ApiAdminJsonObject({}),
        ),
      ),
      throwsA(_code('admin.accounts.bulk_extra_required')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('bulk update disables automatic replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-bulk-update-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-bulk-update-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      if (sent.path == '/api/v1/auth/refresh') {
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
      client.accounts.bulkUpdate(_request),
      throwsA(isA<Sub2ApiException>()),
    );

    expect(
      adapter.requests.where((sent) => sent.path == '/api/v1/auth/refresh'),
      isEmpty,
    );
    expect(
      adapter.requests.where(
        (sent) =>
            sent.method == 'POST' &&
            sent.path == '/api/v1/admin/accounts/bulk-update',
      ),
      hasLength(1),
    );
  });
}

final _request = Sub2ApiAdminBulkUpdateAccountsRequest(
  selector: Sub2ApiAdminBulkAccountSelector.ids(const [42, 43, 42]),
  name: ' bulk updated ',
  proxy: const Sub2ApiAdminProxyUpdate.clear(),
  concurrency: 0,
  priority: 0,
  rateMultiplier: Sub2ApiDecimal.parse('0.75'),
  loadFactor: const Sub2ApiAdminLoadFactorUpdate.clear(),
  status: Sub2ApiAdminAccountStatus.inactive,
  schedulable: false,
  groupIds: const [],
  credentials: Sub2ApiAdminCredentialSet(const [
    Sub2ApiAdminCredentialEntry(
      name: 'api_key',
      value: Sub2ApiAdminCredentialSecretValue(
        Sub2ApiAdminCredentialSecret('bulk-api-key'),
      ),
    ),
    Sub2ApiAdminCredentialEntry(
      name: 'base_url',
      value: Sub2ApiAdminCredentialStringValue('https://upstream.example/v1'),
    ),
  ]),
  extra: Sub2ApiAdminJsonObject(<String, Sub2ApiAdminJsonValue>{
    'base_rpm': Sub2ApiAdminJsonNumber(Sub2ApiDecimal.parse('60')),
  }),
  upstreamBillingProbeEnabled: false,
  confirmMixedChannelRisk: true,
);

Map<String, Object?> _resultData() => <String, Object?>{
  'success': 1,
  'failed': 1,
  'success_ids': <int>[42],
  'failed_ids': <int>[43],
  'results': <Object?>[
    <String, Object?>{'account_id': 42, 'success': true},
    <String, Object?>{
      'account_id': 43,
      'success': false,
      'error': 'group bind failed',
    },
  ],
  'long_context_inherited_count': 2,
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
    Sub2ApiAdminApiKey('admin-bulk-update-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;
