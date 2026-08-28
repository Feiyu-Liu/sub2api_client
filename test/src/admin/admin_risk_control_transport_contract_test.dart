import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_risk_control_models.dart';
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

  test('Ops executes every risk-control route with redacted inputs', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    const moderationKey = Sub2ApiAdminCredentialSecret('sk-risk-sentinel');
    const prompt = Sub2ApiAdminModerationPrompt('sensitive test prompt');
    const image = Sub2ApiAdminModerationImage(
      'data:image/png;base64,c2Vuc2l0aXZl',
    );
    const hash = Sub2ApiAdminRiskControlHash(
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
    );

    final config = await client.riskControl.getConfig();
    final updated = await client.riskControl.updateConfig(
      Sub2ApiAdminUpdateRiskControlConfigRequest(
        enabled: true,
        mode: Sub2ApiAdminRiskControlMode.preBlock,
        apiKeys: const <Sub2ApiAdminCredentialSecret>[moderationKey],
        apiKeysMode: Sub2ApiAdminRiskControlApiKeysMode.append,
        thresholds: <String, Sub2ApiDecimal>{
          'violence': Sub2ApiDecimal.parse('0.95'),
        },
        modelFilter: Sub2ApiAdminRiskControlModelFilter(
          type: Sub2ApiAdminRiskControlModelFilterType.include,
          models: const <String>['gpt-5.6'],
        ),
      ),
    );
    final tested = await client.riskControl.testApiKeys(
      Sub2ApiAdminTestRiskControlApiKeysRequest(
        apiKeys: const <Sub2ApiAdminCredentialSecret>[moderationKey],
        baseUrl: Uri.parse('https://api.openai.com'),
        model: 'omni-moderation-latest',
        timeoutMs: 3000,
        prompt: prompt,
        images: const <Sub2ApiAdminModerationImage>[image],
      ),
    );
    final status = await client.riskControl.getStatus();
    final logs = await client.riskControl.listLogs(
      query: Sub2ApiAdminRiskControlLogQuery(
        page: 2,
        pageSize: 25,
        result: Sub2ApiAdminRiskControlAction.block,
        groupId: 7,
        from: DateTime.utc(2026, 8, 27),
        to: DateTime.utc(2026, 8, 28, 23, 59),
      ),
    );
    final unbanned = await client.riskControl.unbanUser(7);
    final deleted = await client.riskControl.deleteFlaggedHash(hash);
    final cleared = await client.riskControl.clearFlaggedHashes();

    expect(config.apiKeyMasked.toString(), '<redacted>');
    expect(updated.apiKeyCount, 1);
    expect(tested.auditResult?.flagged, isTrue);
    expect(status.flaggedHashCount, 12);
    expect(logs.items.single.inputExcerpt.toString(), '<redacted>');
    expect(logs.items.single.inputExcerpt.reveal(), 'sensitive user content');
    expect(unbanned.status, 'active');
    expect(deleted.inputHash.value, hash.value);
    expect(cleared.deleted, 12);
    expect(prompt.toString(), '<redacted>');
    expect(image.toString(), '<redacted>');

    expect(adapter.requests, hasLength(8));
    expect(adapter.requests[0].path, '/api/v1/admin/risk-control/config');
    expect(adapter.requests[1].path, '/api/v1/admin/risk-control/config');
    expect(adapter.requests[1].method, 'PUT');
    expect(
      (adapter.requests[1].data as Map<String, Object?>)['api_keys'],
      <String>[moderationKey.reveal()],
    );
    expect(
      adapter.requests[2].path,
      '/api/v1/admin/risk-control/api-keys/test',
    );
    expect(
      (adapter.requests[2].data as Map<String, Object?>)['prompt'],
      prompt.reveal(),
    );
    expect(adapter.requests[3].path, '/api/v1/admin/risk-control/status');
    expect(adapter.requests[4].path, '/api/v1/admin/risk-control/logs');
    expect(
      adapter.requests[5].path,
      '/api/v1/admin/risk-control/users/7/unban',
    );
    expect(adapter.requests[6].path, '/api/v1/admin/risk-control/hashes');
    expect(adapter.requests[7].path, '/api/v1/admin/risk-control/hashes/all');
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'risk-key-sentinel',
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

  test('risk-control validation and malformed data fail closed', () async {
    final validationAdapter = JsonResponseAdapter(
      (_) => throw StateError('no io'),
    );
    final validationClient = _client(configuration, validationAdapter);
    addTearDown(validationClient.close);
    expect(
      () => validationClient.riskControl.updateConfig(
        Sub2ApiAdminUpdateRiskControlConfigRequest(
          clearApiKeys: true,
          apiKeys: const <Sub2ApiAdminCredentialSecret>[
            Sub2ApiAdminCredentialSecret('sk-conflict'),
          ],
        ),
      ),
      throwsA(_code('admin.risk_control.api_key_clear_conflict')),
    );
    expect(validationAdapter.requests, isEmpty);

    final malformedAdapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'enabled': true},
        },
      ),
    );
    final malformedClient = _client(configuration, malformedAdapter);
    addTearDown(malformedClient.close);
    await expectLater(
      malformedClient.riskControl.getConfig(),
      throwsA(_code('protocol.invalid_admin_risk_control_response')),
    );
  });

  test('risk-control mutation is not replayed', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.riskControl.unbanUser(7),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT risk-control read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('risk-admin-jwt'),
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
    await client.riskControl.getStatus();
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer risk-admin-jwt'),
    );
    expect(adapter.requests.last.headers['x-api-key'], isNull);
  });
}

Map<String, Object?> _fixture() => readFixture('admin/risk_control.json');

Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/api-keys/test')) {
    data = _fixture()['test_result'];
  } else if (request.path.endsWith('/status')) {
    data = _fixture()['status'];
  } else if (request.path.endsWith('/logs')) {
    data = <String, Object?>{
      'items': <Object?>[_fixture()['log']],
      'total': 26,
      'page': 2,
      'page_size': 25,
      'pages': 2,
    };
  } else if (request.path.endsWith('/unban')) {
    data = _fixture()['unban'];
  } else if (request.path.endsWith('/hashes/all')) {
    data = _fixture()['clear_hashes'];
  } else if (request.path.endsWith('/hashes')) {
    data = _fixture()['delete_hash'];
  } else {
    data = _fixture()['config'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('risk-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
