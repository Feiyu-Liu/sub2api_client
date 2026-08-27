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
    accessToken: Sub2ApiAccessToken('admin-codex-import-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'Ops imports redacted Codex sessions with the complete typed body',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('admin/codex_session_import_result.json'),
        ),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);
      final request = _completeRequest();

      final result = await client.accounts.importCodexSessions(request);

      expect(result.total, 4);
      expect(result.created, 1);
      expect(result.updated, 1);
      expect(result.skipped, 1);
      expect(result.failed, 1);
      expect(result.items, hasLength(4));
      expect(result.items.first.accountId, 101);
      expect(
        result.items[2].action,
        Sub2ApiAdminCodexSessionImportAction.skipped,
      );
      expect(result.warnings.single.index, 3);
      expect(result.errors.single.index, 4);
      expect(
        request.toString(),
        isNot(contains('codex-access-token-sentinel')),
      );
      expect(request.toString(), isNot(contains('agent-private-key-sentinel')));
      for (final payload in request.payloads) {
        expect(payload.toString(), '<redacted>');
      }

      final sent = adapter.requests.single;
      expect(sent.method, 'POST');
      expect(sent.path, '/api/v1/admin/accounts/import/codex-session');
      expect(
        sent.headers,
        containsPair('x-api-key', 'admin-codex-import-key-sentinel'),
      );
      expect(sent.headers, containsPair('Idempotency-Key', 'codex-import-1'));
      expect(sent.headers, isNot(contains('Authorization')));
      expect(sent.data, <String, Object?>{
        'contents': <String>[
          'codex-access-token-sentinel',
          '{"auth_mode":"agentIdentity","agent_identity":'
              '{"agent_private_key":"agent-private-key-sentinel"}}',
        ],
        'name': 'Codex Team',
        'notes': 'migration',
        'group_ids': <int>[7, 8],
        'proxy_id': 9,
        'concurrency': 4,
        'priority': 60,
        'rate_multiplier': 0.75,
        'load_factor': 120,
        'expires_at': 2000000000,
        'auto_pause_on_expired': false,
        'credential_extras': <String, Object?>{
          'model_mapping': <String, Object?>{'gpt-source': 'gpt-target'},
          'temp_unschedulable_enabled': true,
        },
        'extra': <String, Object?>{'openai_long_context_billing_enabled': true},
        'update_existing': true,
        'skip_default_group_bind': true,
        'confirm_mixed_channel_risk': true,
      });
    },
  );

  test('Admin JWT Codex import runs after role bootstrap', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(
        body: readFixture('admin/codex_session_import_result.json'),
      );
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.accounts.importCodexSessions(_completeRequest());

    expect(
      adapter.requests.map((request) => '${request.method} ${request.path}'),
      <String>[
        'GET /api/v1/auth/me',
        'POST /api/v1/admin/accounts/import/codex-session',
      ],
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer admin-codex-import-jwt-sentinel'),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test('Codex import preserves business and invalid key failures', () async {
    for (final failure in <({int status, Object body, String code})>[
      (
        status: 400,
        body: const <String, Object?>{
          'code': 'OPENAI_LONG_CONTEXT_BILLING_INVALID',
          'message': 'invalid billing flag',
        },
        code: 'server.openai_long_context_billing_invalid',
      ),
      (
        status: 401,
        body: readFixture('admin/account_auth_failure.json'),
        code: 'server.invalid_api_key',
      ),
    ]) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(statusCode: failure.status, body: failure.body),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      await expectLater(
        client.accounts.importCodexSessions(_completeRequest()),
        throwsA(_code(failure.code)),
      );
    }
  });

  test('Codex import rejects malformed result invariants', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{
            'total': 2,
            'created': 2,
            'updated': 0,
            'skipped': 0,
            'failed': 0,
            'items': <Object?>[
              <String, Object?>{
                'index': 1,
                'action': 'created',
                'account_id': 101,
              },
            ],
          },
        },
      ),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.accounts.importCodexSessions(_completeRequest()),
      throwsA(_code('protocol.invalid_admin_account_response')),
    );
  });

  test('Codex import validates secrets and typed options before I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final invalidRequests =
        <({Sub2ApiAdminCodexSessionImportRequest request, String code})>[
          (
            request: Sub2ApiAdminCodexSessionImportRequest(
              idempotencyKey: '',
              payloads: const [Sub2ApiAdminCodexSessionPayload('token')],
            ),
            code: 'admin.accounts.idempotency_key_required',
          ),
          (
            request: Sub2ApiAdminCodexSessionImportRequest(
              idempotencyKey: 'empty-list',
              payloads: const [],
            ),
            code: 'admin.accounts.codex_sessions_required',
          ),
          (
            request: Sub2ApiAdminCodexSessionImportRequest(
              idempotencyKey: 'empty-payload',
              payloads: const [Sub2ApiAdminCodexSessionPayload('  ')],
            ),
            code: 'admin.accounts.empty_codex_session',
          ),
          (
            request: Sub2ApiAdminCodexSessionImportRequest(
              idempotencyKey: 'bad-proxy',
              payloads: const [Sub2ApiAdminCodexSessionPayload('token')],
              proxyId: 0,
            ),
            code: 'admin.accounts.invalid_proxy_id',
          ),
          (
            request: Sub2ApiAdminCodexSessionImportRequest(
              idempotencyKey: 'protected-extra',
              payloads: const [Sub2ApiAdminCodexSessionPayload('token')],
              credentialExtras: const Sub2ApiAdminJsonObject({
                'access_token': Sub2ApiAdminJsonString('must-not-be-accepted'),
              }),
            ),
            code: 'admin.accounts.codex_protected_credential_extra',
          ),
          (
            request: Sub2ApiAdminCodexSessionImportRequest(
              idempotencyKey: 'managed-extra',
              payloads: const [Sub2ApiAdminCodexSessionPayload('token')],
              extra: const Sub2ApiAdminJsonObject({
                'ollama_cloud_usage_session': Sub2ApiAdminJsonString(
                  'forbidden',
                ),
              }),
            ),
            code: 'admin.accounts.managed_extra_not_writable',
          ),
          (
            request: Sub2ApiAdminCodexSessionImportRequest(
              idempotencyKey: 'invalid-billing',
              payloads: const [Sub2ApiAdminCodexSessionPayload('token')],
              extra: const Sub2ApiAdminJsonObject({
                'openai_long_context_billing_enabled': Sub2ApiAdminJsonString(
                  'true',
                ),
              }),
            ),
            code: 'admin.accounts.invalid_long_context_billing',
          ),
        ];

    for (final invalid in invalidRequests) {
      expect(
        () => client.accounts.importCodexSessions(invalid.request),
        throwsA(_code(invalid.code)),
      );
    }
    expect(adapter.requests, isEmpty);
  });

  test('Codex import disables automatic refresh and replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-codex-import-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-codex-import-jwt'),
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
      sessionStore: RecordingSessionStore(refreshableSession),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await expectLater(
      client.accounts.importCodexSessions(_completeRequest()),
      throwsA(isA<Sub2ApiException>()),
    );

    expect(
      adapter.requests.where(
        (request) => request.path == '/api/v1/auth/refresh',
      ),
      isEmpty,
    );
    expect(
      adapter.requests.where(
        (request) =>
            request.method == 'POST' &&
            request.path == '/api/v1/admin/accounts/import/codex-session',
      ),
      hasLength(1),
    );
  });
}

Sub2ApiAdminCodexSessionImportRequest _completeRequest() =>
    Sub2ApiAdminCodexSessionImportRequest(
      idempotencyKey: 'codex-import-1',
      payloads: const [
        Sub2ApiAdminCodexSessionPayload('codex-access-token-sentinel'),
        Sub2ApiAdminCodexSessionPayload(
          '{"auth_mode":"agentIdentity","agent_identity":'
          '{"agent_private_key":"agent-private-key-sentinel"}}',
        ),
      ],
      name: ' Codex Team ',
      notes: ' migration ',
      groupIds: const [7, 8, 7],
      proxyId: 9,
      concurrency: 4,
      priority: 60,
      rateMultiplier: Sub2ApiDecimal.parse('0.75'),
      loadFactor: 120,
      expiresAt: DateTime.fromMillisecondsSinceEpoch(
        2000000000 * 1000,
        isUtc: true,
      ),
      autoPauseOnExpired: false,
      credentialExtras: const Sub2ApiAdminJsonObject({
        'model_mapping': Sub2ApiAdminJsonObject({
          'gpt-source': Sub2ApiAdminJsonString('gpt-target'),
        }),
        'temp_unschedulable_enabled': Sub2ApiAdminJsonBool(true),
      }),
      extra: const Sub2ApiAdminJsonObject({
        'openai_long_context_billing_enabled': Sub2ApiAdminJsonBool(true),
      }),
      updateExisting: true,
      skipDefaultGroupBind: true,
      confirmMixedChannelRisk: true,
    );

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-codex-import-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
