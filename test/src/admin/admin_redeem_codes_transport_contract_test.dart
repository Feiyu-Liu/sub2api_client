import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_redeem_code_models.dart';
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

  test(
    'Ops executes every redeem-code route with isolated credentials',
    () async {
      final adapter = JsonResponseAdapter(
        (request) => JsonResponse(body: _response(request)),
      );
      final client = _client(configuration, adapter);
      addTearDown(client.close);

      final page = await client.redeemCodes.list(
        query: const Sub2ApiAdminRedeemCodeListQuery(
          type: Sub2ApiAdminRedeemCodeType.subscription,
          status: Sub2ApiAdminRedeemCodeStatus.unused,
          search: ' secret ',
          sortBy: Sub2ApiAdminRedeemCodeSortBy.value,
          sortOrder: Sub2ApiAdminRedeemCodeSortOrder.ascending,
        ),
      );
      final stats = await client.redeemCodes.getStats();
      final exported = await client.redeemCodes.export(
        query: const Sub2ApiAdminRedeemCodeExportQuery(
          status: Sub2ApiAdminRedeemCodeStatus.unused,
        ),
      );
      final item = await client.redeemCodes.get(41);
      final generated = await client.redeemCodes.generate(
        Sub2ApiAdminGenerateRedeemCodesRequest(
          idempotencyKey: ' generate-41 ',
          count: 2,
          type: Sub2ApiAdminRedeemCodeType.subscription,
          value: Sub2ApiDecimal.parse('12.5'),
          groupId: 7,
          validityDays: 30,
          expiresInDays: 365,
        ),
      );
      final redeemed = await client.redeemCodes.createAndRedeem(
        Sub2ApiAdminCreateAndRedeemRequest(
          idempotencyKey: ' redeem-41 ',
          code: const Sub2ApiRedeemCodeSecret(' ORDER-41 '),
          value: Sub2ApiDecimal.parse('12.5'),
          userId: 21,
          notes: ' paid order ',
        ),
      );
      final deleted = await client.redeemCodes.delete(41);
      final batchDeleted = await client.redeemCodes.batchDelete(const <int>[
        41,
        42,
        42,
      ]);
      final batchUpdated = await client.redeemCodes.batchUpdate(
        Sub2ApiAdminBatchUpdateRedeemCodesRequest(
          ids: const <int>[41, 42],
          status: Sub2ApiAdminRedeemCodeStatus.disabled,
          clearExpiresAt: true,
          notes: ' disabled ',
          clearGroupId: true,
        ),
      );
      final expired = await client.redeemCodes.expire(41);

      expect(page.items.single.code.toString(), '<redacted>');
      expect(page.items.single.code.reveal(), 'REDEEM-SECRET-41');
      expect(page.items.single.value.toString(), '9007199254740993.125');
      expect(
        stats.totalValueDistributed.toString(),
        '12345678901234567890.125',
      );
      expect(exported.toString(), '<redacted>');
      expect(exported.reveal(), startsWith('id,code,type'));
      expect(item.group?.name, 'Pro');
      expect(generated, hasLength(1));
      expect(redeemed.id, 41);
      expect(deleted.message, 'Redeem code deleted successfully');
      expect(batchDeleted.affected, 2);
      expect(batchUpdated.affected, 2);
      expect(expired.status, Sub2ApiAdminRedeemCodeStatus.expired);

      expect(adapter.requests.map((request) => request.path), <String>[
        '/api/v1/admin/redeem-codes',
        '/api/v1/admin/redeem-codes/stats',
        '/api/v1/admin/redeem-codes/export',
        '/api/v1/admin/redeem-codes/41',
        '/api/v1/admin/redeem-codes/generate',
        '/api/v1/admin/redeem-codes/create-and-redeem',
        '/api/v1/admin/redeem-codes/41',
        '/api/v1/admin/redeem-codes/batch-delete',
        '/api/v1/admin/redeem-codes/batch-update',
        '/api/v1/admin/redeem-codes/41/expire',
      ]);
      expect(
        adapter.requests[0].queryParameters,
        containsPair('search', 'secret'),
      );
      expect(
        adapter.requests[0].queryParameters,
        containsPair('sort_by', 'value'),
      );
      expect(
        adapter.requests[0].queryParameters,
        containsPair('sort_order', 'asc'),
      );
      expect(
        adapter.requests[4].headers,
        containsPair('Idempotency-Key', 'generate-41'),
      );
      expect(
        adapter.requests[5].headers,
        containsPair('Idempotency-Key', 'redeem-41'),
      );
      expect(adapter.requests[4].data, containsPair('value', 12.5));
      expect(adapter.requests[5].data, containsPair('code', 'ORDER-41'));
      expect(adapter.requests[7].data, containsPair('ids', <int>[41, 42]));
      final batchFields = (adapter.requests[8].data as Map)['fields'] as Map;
      expect(batchFields, containsPair('expires_at', null));
      expect(batchFields, containsPair('group_id', null));
      expect(batchFields, isNot(contains('type')));
      expect(batchFields, isNot(contains('value')));
      expect(
        adapter.requests.every(
          (request) => request.headers['x-api-key'] == 'redeem-key-sentinel',
        ),
        isTrue,
      );
      expect(
        adapter.requests.every(
          (request) => request.headers['Authorization'] == null,
        ),
        isTrue,
      );
    },
  );

  test('redeem-code validation fails without I/O', () async {
    final adapter = JsonResponseAdapter((_) => throw StateError('no io'));
    final client = _client(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.redeemCodes.generate(
        Sub2ApiAdminGenerateRedeemCodesRequest(
          idempotencyKey: '',
          count: 101,
          type: Sub2ApiAdminRedeemCodeType.balance,
          value: Sub2ApiDecimal.parse('1'),
        ),
      ),
      throwsA(_code('admin.redeem_codes.idempotency_key_required')),
    );
    expect(
      () => client.redeemCodes.generate(
        Sub2ApiAdminGenerateRedeemCodesRequest(
          idempotencyKey: 'generate',
          count: 1,
          type: Sub2ApiAdminRedeemCodeType.subscription,
          value: Sub2ApiDecimal.parse('1'),
        ),
      ),
      throwsA(_code('admin.redeem_codes.invalid_subscription')),
    );
    expect(
      () => client.redeemCodes.createAndRedeem(
        Sub2ApiAdminCreateAndRedeemRequest(
          idempotencyKey: 'redeem',
          code: const Sub2ApiRedeemCodeSecret('x'),
          value: Sub2ApiDecimal.parse('1'),
          userId: 21,
        ),
      ),
      throwsA(_code('admin.redeem_codes.invalid_code')),
    );
    expect(
      () => client.redeemCodes.batchUpdate(
        Sub2ApiAdminBatchUpdateRedeemCodesRequest(ids: const <int>[41]),
      ),
      throwsA(_code('admin.redeem_codes.empty_batch_update')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('malformed redeem-code response fails closed', () async {
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
      client.redeemCodes.get(41),
      throwsA(_code('protocol.invalid_admin_redeem_code_response')),
    );
  });

  test('redeem-code mutation is not replayed after 401', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.redeemCodes.delete(41),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT redeem-code read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('redeem-admin-jwt'),
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
    await client.redeemCodes.get(41);
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer redeem-admin-jwt'),
    );
    expect(adapter.requests.last.headers['x-api-key'], isNull);
  });
}

Map<String, Object?> _fixture() => readFixture('admin/redeem_code.json');

Object _response(RequestOptions request) {
  if (request.path.endsWith('/export')) {
    return 'id,code,type\n41,REDEEM-SECRET-41,subscription\n';
  }
  final Object? data;
  if (request.path.endsWith('/stats')) {
    data = _fixture()['stats'];
  } else if (request.path.endsWith('/generate')) {
    data = <Object?>[_fixture()['code']];
  } else if (request.path.endsWith('/create-and-redeem')) {
    data = <String, Object?>{'redeem_code': _fixture()['code']};
  } else if (request.path.endsWith('/batch-delete')) {
    data = <String, Object?>{
      'deleted': 2,
      'message': 'Redeem codes deleted successfully',
    };
  } else if (request.path.endsWith('/batch-update')) {
    data = <String, Object?>{
      'updated': 2,
      'message': 'Redeem codes updated successfully',
    };
  } else if (request.method == 'DELETE') {
    data = <String, Object?>{'message': 'Redeem code deleted successfully'};
  } else if (request.path.endsWith('/expire')) {
    data = <String, Object?>{
      ...(_fixture()['code']! as Map<String, Object?>),
      'status': 'expired',
    };
  } else if (request.path == '/api/v1/admin/redeem-codes') {
    data = <String, Object?>{
      'items': <Object?>[_fixture()['code']],
      'total': 1,
      'page': 1,
      'page_size': 20,
      'pages': 1,
    };
  } else {
    data = _fixture()['code'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('redeem-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
