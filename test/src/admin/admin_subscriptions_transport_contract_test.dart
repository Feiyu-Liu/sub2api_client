import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_subscription_models.dart';
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

  test('Ops executes every admin subscription route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    final page = await client.subscriptions.list(
      query: const Sub2ApiAdminSubscriptionListQuery(
        userId: 21,
        groupId: 7,
        status: Sub2ApiAdminSubscriptionStatus.active,
        platform: ' openai ',
        sortBy: Sub2ApiAdminSubscriptionSortBy.expiresAt,
        sortOrder: Sub2ApiAdminSubscriptionSortOrder.ascending,
      ),
    );
    final item = await client.subscriptions.get(301);
    final progress = await client.subscriptions.getProgress(301);
    final assigned = await client.subscriptions.assign(
      const Sub2ApiAdminAssignSubscriptionRequest(
        userId: 21,
        groupId: 7,
        validityDays: 30,
        notes: ' pilot ',
      ),
    );
    final bulk = await client.subscriptions.bulkAssign(
      Sub2ApiAdminBulkAssignSubscriptionsRequest(
        userIds: const <int>[21, 22, 22],
        groupId: 7,
        validityDays: 30,
      ),
    );
    final adjusted = await client.subscriptions.adjust(
      301,
      const Sub2ApiAdminAdjustSubscriptionRequest(
        idempotencyKey: ' extend-301 ',
        days: -5,
      ),
    );
    final reset = await client.subscriptions.resetQuota(
      301,
      const Sub2ApiAdminResetSubscriptionQuotaRequest(
        daily: true,
        monthly: true,
      ),
    );
    final revoked = await client.subscriptions.revoke(301);
    final deleted = await client.subscriptions.deleteLegacy(301);
    final restored = await client.subscriptions.restore(301);

    expect(page.items.single.user?.email, 'subscriber@example.test');
    expect(page.items.single.subscription.group?.name, 'Pro');
    expect(item.assignedByUser?.email, 'admin@example.test');
    expect(progress.daily?.limitUsd.toString(), '10.5');
    expect(assigned.subscription.id, 301);
    expect(bulk.statuses, <int, String>{21: 'created', 22: 'reused'});
    expect(adjusted.subscription.dailyUsageUsd.toString(), '1.25');
    expect(reset.subscription.monthlyUsageUsd.toString(), '12.75');
    expect(revoked.message, 'Subscription revoked successfully');
    expect(deleted.message, 'Subscription revoked successfully');
    expect(restored.subscription.status, 'active');

    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/admin/subscriptions',
      '/api/v1/admin/subscriptions/301',
      '/api/v1/admin/subscriptions/301/progress',
      '/api/v1/admin/subscriptions/assign',
      '/api/v1/admin/subscriptions/bulk-assign',
      '/api/v1/admin/subscriptions/301/extend',
      '/api/v1/admin/subscriptions/301/reset-quota',
      '/api/v1/admin/subscriptions/301/revoke',
      '/api/v1/admin/subscriptions/301',
      '/api/v1/admin/subscriptions/301/restore',
    ]);
    expect(adapter.requests[8].method, 'DELETE');
    expect(
      adapter.requests[0].queryParameters,
      containsPair('platform', 'openai'),
    );
    expect(
      adapter.requests[0].queryParameters,
      containsPair('sort_by', 'expires_at'),
    );
    expect(adapter.requests[3].data, containsPair('notes', 'pilot'));
    expect(adapter.requests[4].data, containsPair('user_ids', <int>[21, 22]));
    expect(
      adapter.requests[5].headers,
      containsPair('Idempotency-Key', 'extend-301'),
    );
    expect(adapter.requests[5].data, containsPair('days', -5));
    expect(adapter.requests[6].data, containsPair('daily', true));
    expect(
      adapter.requests.every(
        (request) =>
            request.headers['x-api-key'] == 'subscription-key-sentinel',
      ),
      isTrue,
    );
    expect(
      adapter.requests.every(
        (request) => request.headers['Authorization'] == null,
      ),
      isTrue,
    );
  });

  test('subscription validation fails without I/O', () async {
    final adapter = JsonResponseAdapter((_) => throw StateError('no io'));
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.subscriptions.assign(
        const Sub2ApiAdminAssignSubscriptionRequest(userId: 0, groupId: 7),
      ),
      throwsA(_code('admin.subscriptions.invalid_user_id')),
    );
    expect(
      () => client.subscriptions.adjust(
        301,
        const Sub2ApiAdminAdjustSubscriptionRequest(
          idempotencyKey: '',
          days: 1,
        ),
      ),
      throwsA(_code('admin.subscriptions.idempotency_key_required')),
    );
    expect(
      () => client.subscriptions.resetQuota(
        301,
        const Sub2ApiAdminResetSubscriptionQuotaRequest(),
      ),
      throwsA(_code('admin.subscriptions.quota_window_required')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('malformed subscription response fails closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'id': 0},
        },
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.subscriptions.get(301),
      throwsA(_code('protocol.invalid_admin_subscription_response')),
    );
  });

  test('subscription mutation is not replayed after 401', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.subscriptions.revoke(301),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT subscription read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('subscription-admin-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _response(request));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = adapter,
    );
    addTearDown(client.close);
    await client.subscriptions.get(301);
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer subscription-admin-jwt'),
    );
    expect(adapter.requests.last.headers['x-api-key'], isNull);
  });
}

Map<String, Object?> _fixture() => readFixture('admin/subscription.json');

Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/progress')) {
    data = _fixture()['progress'];
  } else if (request.path.endsWith('/bulk-assign')) {
    data = _fixture()['bulk'];
  } else if (request.path.endsWith('/revoke') || request.method == 'DELETE') {
    data = <String, Object?>{'message': 'Subscription revoked successfully'};
  } else if (request.path == '/api/v1/admin/subscriptions') {
    data = <String, Object?>{
      'items': <Object?>[_fixture()['subscription']],
      'total': 1,
      'page': 1,
      'page_size': 20,
      'pages': 1,
    };
  } else {
    data = _fixture()['subscription'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('subscription-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
