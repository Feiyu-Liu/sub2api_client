import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_compliance_models.dart';
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
  const session = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('admin-compliance-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops reads and accepts the versioned compliance contract', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _successForRequest(request)),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final status = await client.compliance.getStatus();
    final accepted = await client.compliance.accept(
      Sub2ApiAdminAcceptComplianceRequest(
        phrase: status.phraseFor(Sub2ApiAdminComplianceLanguage.zh),
        language: Sub2ApiAdminComplianceLanguage.zh,
      ),
    );

    expect(status.required, isTrue);
    expect(status.version, 'v2026.06.10');
    expect(status.documentUrlZh.scheme, 'https');
    expect(accepted.required, isFalse);
    expect(accepted.acknowledgement?.adminUserId, 1);
    expect(
      accepted.acknowledgement?.acceptedAt,
      DateTime.utc(2026, 8, 27, 6, 7, 8),
    );
    expect(
      adapter.requests.map((request) => '${request.method} ${request.path}'),
      <String>[
        'GET /api/v1/admin/compliance',
        'POST /api/v1/admin/compliance/accept',
      ],
    );
    expect(adapter.requests.last.data, <String, Object?>{
      'phrase': '我已阅读、理解并同意 Sub2API 部署与运营合规承诺',
      'language': 'zh',
    });
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('x-api-key', 'admin-compliance-key-sentinel'),
      );
      expect(request.headers, isNot(contains('Authorization')));
    }
  });

  test('Admin JWT compliance routes run after role bootstrap', () async {
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      return JsonResponse(body: _successForRequest(request));
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await client.compliance.getStatus();
    await client.compliance.accept(
      const Sub2ApiAdminAcceptComplianceRequest(
        phrase:
            'I have read, understood, and agree to the Sub2API Deployment and Operation Compliance Commitment',
        language: Sub2ApiAdminComplianceLanguage.en,
      ),
    );

    expect(
      adapter.requests.where((request) => request.path == '/api/v1/auth/me'),
      hasLength(2),
    );
    for (final request in adapter.requests) {
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer admin-compliance-jwt-sentinel'),
      );
      expect(request.headers, isNot(contains('x-api-key')));
    }
  });

  test(
    'compliance routes preserve business and invalid key failures',
    () async {
      for (final failure in <({int status, Object body, String code})>[
        (
          status: 400,
          body: const <String, Object?>{
            'code': 'ADMIN_COMPLIANCE_INVALID_PHRASE',
            'message': 'phrase mismatch',
          },
          code: 'server.admin_compliance_invalid_phrase',
        ),
        (
          status: 401,
          body: readFixture('admin/account_auth_failure.json'),
          code: 'server.invalid_api_key',
        ),
      ]) {
        for (final invoke in <Future<Object?> Function(Sub2ApiOpsClient)>[
          (client) => client.compliance.getStatus(),
          (client) => client.compliance.accept(
            const Sub2ApiAdminAcceptComplianceRequest(
              phrase: 'wrong phrase',
              language: Sub2ApiAdminComplianceLanguage.en,
            ),
          ),
        ]) {
          final adapter = JsonResponseAdapter(
            (_) => JsonResponse(statusCode: failure.status, body: failure.body),
          );
          final client = _opsClient(configuration, adapter);
          addTearDown(client.close);
          await expectLater(invoke(client), throwsA(_code(failure.code)));
        }
      }
    },
  );

  test('compliance routes reject malformed status invariants', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{
            ...Map<String, Object?>.from(_fixture()['required']! as Map),
            'required': false,
          },
        },
      ),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.compliance.getStatus(),
      throwsA(_code('protocol.invalid_admin_compliance_response')),
    );
    await expectLater(
      client.compliance.accept(
        const Sub2ApiAdminAcceptComplianceRequest(
          phrase: 'phrase',
          language: Sub2ApiAdminComplianceLanguage.en,
        ),
      ),
      throwsA(_code('protocol.invalid_admin_compliance_response')),
    );
  });

  test('compliance acceptance validates phrase before I/O', () {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    expect(
      () => client.compliance.accept(
        const Sub2ApiAdminAcceptComplianceRequest(
          phrase: '  ',
          language: Sub2ApiAdminComplianceLanguage.zh,
        ),
      ),
      throwsA(_code('admin.compliance.phrase_required')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('compliance acceptance disables automatic refresh and replay', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-compliance-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-compliance-jwt'),
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
      client.compliance.accept(
        const Sub2ApiAdminAcceptComplianceRequest(
          phrase: 'phrase',
          language: Sub2ApiAdminComplianceLanguage.en,
        ),
      ),
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

Map<String, Object?> _fixture() => readFixture('admin/compliance_status.json');

Object _successForRequest(RequestOptions request) {
  final Object? data;
  if (request.path == '/api/v1/admin/compliance') {
    data = _fixture()['required'];
  } else if (request.path == '/api/v1/admin/compliance/accept') {
    data = _fixture()['accepted'];
  } else {
    throw StateError('unexpected route: ${request.path}');
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-compliance-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(JsonResponseAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
