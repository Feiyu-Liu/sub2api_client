import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_affiliate_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
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

  test('Ops executes every affiliate route with exact amounts', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    final query = Sub2ApiAdminAffiliateRecordQuery(
      page: 2,
      pageSize: 25,
      search: ' inviter ',
      startAt: DateTime.utc(2026, 8, 27),
      endAt: DateTime.utc(2026, 8, 28, 23, 59),
      sortBy: Sub2ApiAdminAffiliateRecordSort.rebateAmount,
      sortOrder: Sub2ApiAdminAffiliateSortOrder.ascending,
    );

    final invites = await client.affiliates.listInvites(query: query);
    final rebates = await client.affiliates.listRebates(query: query);
    final transfers = await client.affiliates.listTransfers(query: query);
    final users = await client.affiliates.listUsers(
      query: const Sub2ApiAdminAffiliateUserListQuery(
        page: 2,
        pageSize: 25,
        search: ' inviter ',
      ),
    );
    final lookup = await client.affiliates.lookupUsers(' candidate ');
    final batch = await client.affiliates.batchSetRate(
      Sub2ApiAdminBatchSetAffiliateRateRequest(
        userIds: const <int>[7, 8],
        rebateRatePercent: Sub2ApiDecimal.parse('12.5'),
      ),
    );
    final overview = await client.affiliates.getUserOverview(7);
    final updated = await client.affiliates.updateUser(
      7,
      Sub2ApiAdminUpdateAffiliateUserRequest(
        affiliateCode: ' vip2026 ',
        rebateRatePercent: Sub2ApiDecimal.parse('12.5'),
      ),
    );
    final cleared = await client.affiliates.clearUser(7);

    expect(invites.items.single.totalRebate, Sub2ApiDecimal.parse('6.25'));
    expect(rebates.items.single.rebateAmount, Sub2ApiDecimal.parse('6.25'));
    expect(transfers.items.single.balanceAfter, Sub2ApiDecimal.parse('110.5'));
    expect(users.items.single.rebateRatePercent, Sub2ApiDecimal.parse('12.5'));
    expect(lookup.single.id, 8);
    expect(batch.affected, 2);
    expect(overview.availableQuota, Sub2ApiDecimal.parse('18.75'));
    expect(updated.userId, 7);
    expect(cleared.userId, 7);

    expect(adapter.requests, hasLength(9));
    expect(adapter.requests[0].path, '/api/v1/admin/affiliates/invites');
    expect(adapter.requests[1].path, '/api/v1/admin/affiliates/rebates');
    expect(adapter.requests[2].path, '/api/v1/admin/affiliates/transfers');
    expect(adapter.requests[3].path, '/api/v1/admin/affiliates/users');
    expect(adapter.requests[4].path, '/api/v1/admin/affiliates/users/lookup');
    expect(
      adapter.requests[5].path,
      '/api/v1/admin/affiliates/users/batch-rate',
    );
    expect(
      adapter.requests[6].path,
      '/api/v1/admin/affiliates/users/7/overview',
    );
    expect(adapter.requests[7].path, '/api/v1/admin/affiliates/users/7');
    expect(
      (adapter.requests[7].data as Map<String, Object?>)['aff_code'],
      'VIP2026',
    );
    expect(adapter.requests[8].path, '/api/v1/admin/affiliates/users/7');
    expect(adapter.requests[8].method, 'DELETE');
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'affiliate-key-sentinel',
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

  test('affiliate validation and malformed data fail closed', () async {
    final validationAdapter = JsonResponseAdapter(
      (_) => throw StateError('no io'),
    );
    final validationClient = _client(configuration, validationAdapter);
    addTearDown(validationClient.close);
    expect(
      () => validationClient.affiliates.updateUser(
        7,
        const Sub2ApiAdminUpdateAffiliateUserRequest(affiliateCode: 'bad!'),
      ),
      throwsA(_code('admin.affiliates.invalid_affiliate_code')),
    );
    expect(validationAdapter.requests, isEmpty);

    final malformedAdapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'user_id': 0},
        },
      ),
    );
    final malformedClient = _client(configuration, malformedAdapter);
    addTearDown(malformedClient.close);
    await expectLater(
      malformedClient.affiliates.getUserOverview(7),
      throwsA(_code('protocol.invalid_admin_affiliate_response')),
    );
  });

  test('affiliate mutation is not replayed', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.affiliates.clearUser(7),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT affiliate read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('affiliate-admin-jwt'),
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
    await client.affiliates.getUserOverview(7);
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer affiliate-admin-jwt'),
    );
    expect(adapter.requests.last.headers['x-api-key'], isNull);
  });
}

Map<String, Object?> _fixture() => readFixture('admin/affiliate.json');

Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/invites')) {
    data = _page(_fixture()['invite']);
  } else if (request.path.endsWith('/rebates')) {
    data = _page(_fixture()['rebate']);
  } else if (request.path.endsWith('/transfers')) {
    data = _page(_fixture()['transfer']);
  } else if (request.path.endsWith('/lookup')) {
    data = <Object?>[_fixture()['lookup']];
  } else if (request.path.endsWith('/batch-rate')) {
    data = _fixture()['batch'];
  } else if (request.path.endsWith('/overview')) {
    data = _fixture()['overview'];
  } else if (request.path.endsWith('/users')) {
    data = _page(_fixture()['user']);
  } else {
    data = _fixture()['user_action'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Map<String, Object?> _page(Object? item) => <String, Object?>{
  'items': <Object?>[item],
  'total': 26,
  'page': 2,
  'page_size': 25,
  'pages': 2,
};

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('affiliate-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
