import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_prompt_audit_models.dart';
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
  const filter = Sub2ApiAdminPromptAuditEventFilter(
    decision: Sub2ApiAdminPromptAuditDecision.critical,
    groupId: 7,
  );

  test('Ops executes every prompt-audit route with redacted content', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    const token = Sub2ApiAdminPromptAuditEndpointToken('guard-token-fixture');
    final endpoint = Sub2ApiAdminPromptAuditEndpointUpdate(
      id: 'guard-main',
      name: 'Guard',
      baseUrl: Uri.parse('https://guard.example.test'),
      token: token,
    );

    final config = await client.promptAudit.getConfig();
    final updated = await client.promptAudit.updateConfig(
      Sub2ApiAdminUpdatePromptAuditConfigRequest(
        expectedConfigVersion: 3,
        enabled: true,
        blockingEnabled: true,
        blockingLatestTurnOnly: true,
        storePassEvents: false,
        workerCount: 4,
        queueCapacity: 32768,
        scanners: const <String>['jailbreak'],
        allGroups: false,
        groupIds: const <int>[7],
        endpoints: <Sub2ApiAdminPromptAuditEndpointUpdate>[endpoint],
      ),
    );
    final probe = await client.promptAudit.probe(
      Sub2ApiAdminPromptAuditProbeRequest(endpoint: endpoint),
    );
    final runtime = await client.promptAudit.getRuntime();
    final page = await client.promptAudit.listEvents(
      query: const Sub2ApiAdminPromptAuditEventQuery(
        page: 1,
        pageSize: 20,
        filter: filter,
      ),
    );
    final event = await client.promptAudit.getEvent(81);
    final deletedOne = await client.promptAudit.deleteEvent(81);
    final deletedBatch = await client.promptAudit.batchDelete(const <int>[
      81,
      82,
    ]);
    final preview = await client.promptAudit.previewDelete(filter);
    final deletedFilter = await client.promptAudit.deleteByFilter(
      Sub2ApiAdminPromptAuditDeleteByFilterRequest(
        filter: filter,
        snapshotMaxId: preview.snapshotMaxId,
        filterHash: preview.filterHash,
        confirmationToken: preview.confirmationToken,
      ),
    );

    expect(config.configVersion, 3);
    expect(updated.effectiveMode, Sub2ApiAdminPromptAuditMode.blocking);
    expect(probe.tokenApplied, isTrue);
    expect(runtime.guardMetrics.total, 12);
    expect(page.items.single.id, 81);
    expect(event.snapshot.fullPrompt.toString(), '<redacted>');
    expect(event.snapshot.fullPrompt.reveal(), 'sensitive full prompt');
    expect(event.issues.single.evidence.toString(), '<redacted>');
    expect(deletedOne.deletedEvents, 2);
    expect(deletedBatch.deletedJobs, 2);
    expect(preview.confirmationToken.toString(), '<redacted>');
    expect(preview.expiresAt, DateTime.utc(2026, 8, 28, 6, 5));
    expect(deletedFilter.deletedEvents, 2);
    expect(token.toString(), '<redacted>');

    expect(adapter.requests, hasLength(10));
    expect(adapter.requests[0].path, '/api/v1/admin/prompt-audit/config');
    expect(adapter.requests[1].path, '/api/v1/admin/prompt-audit/config');
    expect(
      adapter.requests[2].path,
      '/api/v1/admin/prompt-audit/endpoints/probe',
    );
    expect(adapter.requests[3].path, '/api/v1/admin/prompt-audit/runtime');
    expect(adapter.requests[4].path, '/api/v1/admin/prompt-audit/events');
    expect(adapter.requests[5].path, '/api/v1/admin/prompt-audit/events/81');
    expect(adapter.requests[6].path, '/api/v1/admin/prompt-audit/events/81');
    expect(adapter.requests[6].method, 'DELETE');
    expect(
      adapter.requests[7].path,
      '/api/v1/admin/prompt-audit/events/batch-delete',
    );
    expect(
      adapter.requests[8].path,
      '/api/v1/admin/prompt-audit/events/delete-preview',
    );
    expect(
      adapter.requests[9].path,
      '/api/v1/admin/prompt-audit/events/delete-by-filter',
    );
    expect(
      adapter.requests.every(
        (r) => r.headers['x-api-key'] == 'prompt-key-sentinel',
      ),
      isTrue,
    );
    expect(
      adapter.requests.every((r) => r.headers['Authorization'] == null),
      isTrue,
    );
  });

  test('prompt-audit validation and malformed data fail closed', () async {
    final adapter = JsonResponseAdapter((_) => throw StateError('no io'));
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    expect(
      () => client.promptAudit.batchDelete(const <int>[]),
      throwsA(_code('admin.prompt_audit.invalid_delete_batch')),
    );
    expect(adapter.requests, isEmpty);

    final malformedAdapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'id': 0},
        },
      ),
    );
    final malformed = _client(configuration, malformedAdapter);
    addTearDown(malformed.close);
    await expectLater(
      malformed.promptAudit.getEvent(81),
      throwsA(_code('protocol.invalid_admin_prompt_audit_response')),
    );
  });

  test('prompt-audit mutation is not replayed', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.promptAudit.deleteEvent(81),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT prompt-audit read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('prompt-admin-jwt'),
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
    await client.promptAudit.getConfig();
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer prompt-admin-jwt'),
    );
  });
}

Map<String, Object?> _fixture() => readFixture('admin/prompt_audit.json');
Object _response(RequestOptions r) {
  final Object? data;
  if (r.path.endsWith('/endpoints/probe')) {
    data = _fixture()['probe'];
  } else if (r.path.endsWith('/runtime')) {
    data = _fixture()['runtime'];
  } else if (r.path.endsWith('/delete-preview')) {
    data = _fixture()['preview'];
  } else if (r.path.endsWith('/batch-delete') ||
      r.path.endsWith('/delete-by-filter') ||
      r.method == 'DELETE') {
    data = _fixture()['delete'];
  } else if (r.path == '/api/v1/admin/prompt-audit/events') {
    data = <String, Object?>{
      'items': <Object?>[_fixture()['event']],
      'total': 1,
      'page': 1,
      'page_size': 20,
      'pages': 1,
    };
  } else if (r.path.endsWith('/events/81')) {
    data = _fixture()['event'];
  } else {
    data = _fixture()['config'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('prompt-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((e) => e.code, 'code', code);
