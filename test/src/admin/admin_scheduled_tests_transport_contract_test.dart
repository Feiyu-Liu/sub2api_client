import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_scheduled_test_models.dart';
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

  test('Ops executes every raw scheduled-test contract', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _rawForRequest(request)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final created = await client.scheduledTests.create(
      const Sub2ApiAdminCreateScheduledTestPlanRequest(
        accountId: 42,
        modelId: 'claude-sonnet-4',
        cronExpression: '*/15 * * * *',
        autoRecover: true,
      ),
    );
    final updated = await client.scheduledTests.update(
      12,
      const Sub2ApiAdminUpdateScheduledTestPlanRequest(enabled: false),
    );
    final results = await client.scheduledTests.listResults(12, limit: 25);
    final deleted = await client.scheduledTests.delete(12);

    expect(created.id, 12);
    expect(updated.accountId, 42);
    expect(results.single.latency, const Duration(milliseconds: 321));
    expect(deleted.message, 'deleted');
    expect(adapter.requests[0].path, '/api/v1/admin/scheduled-test-plans');
    expect(adapter.requests[1].path, '/api/v1/admin/scheduled-test-plans/12');
    expect(
      adapter.requests[2].path,
      '/api/v1/admin/scheduled-test-plans/12/results',
    );
    expect(adapter.requests[3].path, '/api/v1/admin/scheduled-test-plans/12');
    expect(adapter.requests[2].queryParameters, <String, Object?>{'limit': 25});
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('x-api-key', 'scheduled-test-key-sentinel'),
      );
      expect(request.headers, isNot(contains('Authorization')));
    }
  });

  test('scheduled-test validation and malformed data fail closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(body: <String, Object?>{'id': 0}),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);
    expect(
      () => client.scheduledTests.create(
        const Sub2ApiAdminCreateScheduledTestPlanRequest(
          accountId: 0,
          cronExpression: '* * * * *',
        ),
      ),
      throwsA(_code('admin.scheduled_tests.invalid_account_id')),
    );
    await expectLater(
      client.scheduledTests.listResults(12),
      throwsA(_code('protocol.invalid_admin_scheduled_test_response')),
    );
  });

  test('raw scheduled-test mutation never refreshes or replays', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-scheduled-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-scheduled-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      if (request.path == '/api/v1/auth/refresh') {
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
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);
    await expectLater(
      client.scheduledTests.delete(12),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(
      adapter.requests.where(
        (request) => request.path == '/api/v1/auth/refresh',
      ),
      isEmpty,
    );
  });
}

Map<String, Object?> _fixture() => readFixture('admin/scheduled_tests.json');

Object _rawForRequest(RequestOptions request) {
  if (request.path.endsWith('/results')) {
    return _fixture()['results']!;
  }
  if (request.method == 'DELETE') {
    return <String, Object?>{'message': 'deleted'};
  }
  return _fixture()['plan']!;
}

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('scheduled-test-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
