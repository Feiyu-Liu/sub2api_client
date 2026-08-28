import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_tls_fingerprint_models.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';

void main() {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );

  test('Ops executes all TLS fingerprint profile routes', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _successFor(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    final listed = await client.tlsFingerprints.list();
    final fetched = await client.tlsFingerprints.get(3);
    final created = await client.tlsFingerprints.create(
      Sub2ApiAdminCreateTLSFingerprintProfileRequest(
        name: ' Chrome 136 ',
        enableGrease: true,
        cipherSuites: const <int>[4865, 4866],
        alpnProtocols: const <String>['h2', 'http/1.1'],
      ),
    );
    final updated = await client.tlsFingerprints.update(
      3,
      Sub2ApiAdminUpdateTLSFingerprintProfileRequest(enableGrease: false),
    );
    final deleted = await client.tlsFingerprints.delete(3);
    expect(listed.single.id, 3);
    expect(fetched.alpnProtocols, <String>['h2', 'http/1.1']);
    expect(created.name, 'Chrome 136');
    expect(updated.cipherSuites, <int>[4865, 4866]);
    expect(deleted.message, 'Profile deleted successfully');
    expect(adapter.requests[0].path, '/api/v1/admin/tls-fingerprint-profiles');
    expect(
      adapter.requests[1].path,
      '/api/v1/admin/tls-fingerprint-profiles/3',
    );
    expect(adapter.requests[2].method, 'POST');
    expect(adapter.requests[3].method, 'PUT');
    expect(adapter.requests[4].method, 'DELETE');
  });

  test('TLS fingerprint validation and malformed data fail closed', () async {
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
    expect(
      () => client.tlsFingerprints.create(
        Sub2ApiAdminCreateTLSFingerprintProfileRequest(
          name: 'x',
          cipherSuites: const <int>[65536],
        ),
      ),
      throwsA(_code('admin.tls_fingerprints.invalid_uint16')),
    );
    await expectLater(
      client.tlsFingerprints.get(3),
      throwsA(_code('protocol.invalid_admin_tls_fingerprint_response')),
    );
  });

  test('TLS fingerprint mutation is not replayed', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.tlsFingerprints.delete(3),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });
}

Map<String, Object?> _fixture() =>
    readFixture('admin/tls_fingerprint_profile.json');
Object _successFor(RequestOptions request) {
  final data = request.method == 'DELETE'
      ? <String, Object?>{'message': 'Profile deleted successfully'}
      : request.method == 'GET' && !request.path.endsWith('/3')
      ? <Object?>[_fixture()]
      : _fixture();
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(
  Sub2ApiConfiguration configuration,
  JsonResponseAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('tls-key-sentinel'),
  ),
  dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
    ..httpClientAdapter = adapter,
);
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
