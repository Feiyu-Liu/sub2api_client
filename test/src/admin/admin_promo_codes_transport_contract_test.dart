import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_promo_code_models.dart';
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
  test('Ops executes all promo code routes', () async {
    final adapter = JsonResponseAdapter(
      (r) => JsonResponse(body: _response(r)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    final page = await client.promoCodes.list(
      query: const Sub2ApiAdminPromoCodeQuery(
        status: Sub2ApiAdminPromoCodeStatus.active,
        search: ' welcome ',
      ),
    );
    final item = await client.promoCodes.get(5);
    final created = await client.promoCodes.create(
      Sub2ApiAdminCreatePromoCodeRequest(
        code: const Sub2ApiPromoCode(' welcome2026 '),
        bonusAmount: Sub2ApiDecimal.parse('12.5'),
        maxUses: 100,
      ),
    );
    final updated = await client.promoCodes.update(
      5,
      const Sub2ApiAdminUpdatePromoCodeRequest(
        status: Sub2ApiAdminPromoCodeStatus.disabled,
        expiresAt: Sub2ApiAdminPromoExpirationUpdate.clear(),
      ),
    );
    final usages = await client.promoCodes.listUsages(5, page: 1, pageSize: 20);
    final deleted = await client.promoCodes.delete(5);
    expect(page.items.single.code.toString(), '<redacted>');
    expect(item.bonusAmount.toString(), '12.5');
    expect(created.code.reveal(), 'WELCOME2026');
    expect(updated.id, 5);
    expect(usages.items.single.user?.email, 'promo-user@example.test');
    expect(deleted.message, 'Promo code deleted successfully');
    expect(adapter.requests[0].path, '/api/v1/admin/promo-codes');
    expect(adapter.requests[1].path, '/api/v1/admin/promo-codes/5');
    expect(adapter.requests[4].path, '/api/v1/admin/promo-codes/5/usages');
    expect(adapter.requests[3].data, containsPair('expires_at', 0));
  });
  test('promo validation and malformed data fail closed', () async {
    final validationAdapter = JsonResponseAdapter(
      (_) => throw StateError('no io'),
    );
    final validationClient = _client(configuration, validationAdapter);
    addTearDown(validationClient.close);
    expect(
      () => validationClient.promoCodes.create(
        Sub2ApiAdminCreatePromoCodeRequest(
          bonusAmount: Sub2ApiDecimal.parse('-1'),
        ),
      ),
      throwsA(_code('admin.promo_codes.invalid_bonus_amount')),
    );
    expect(validationAdapter.requests, isEmpty);
    final malformedAdapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'id': 0},
        },
      ),
    );
    final malformedClient = _client(configuration, malformedAdapter);
    addTearDown(malformedClient.close);
    await expectLater(
      malformedClient.promoCodes.get(5),
      throwsA(_code('protocol.invalid_admin_promo_code_response')),
    );
  });
  test('promo mutation is not replayed', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.promoCodes.delete(5),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT promo read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('promo-admin-jwt'),
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
    await client.promoCodes.get(5);
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer promo-admin-jwt'),
    );
  });
}

Map<String, Object?> _fixture() => readFixture('admin/promo_code.json');
Object _response(RequestOptions r) {
  final Object? data;
  if (r.method == 'DELETE') {
    data = <String, Object?>{'message': 'Promo code deleted successfully'};
  } else if (r.path.endsWith('/usages')) {
    data = <String, Object?>{
      'items': <Object?>[_fixture()['usage']],
      'total': 1,
      'page': 1,
      'page_size': 20,
      'pages': 1,
    };
  } else if (r.method == 'GET' && !r.path.endsWith('/5')) {
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
        Sub2ApiAdminApiKey('promo-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((e) => e.code, 'code', code);
