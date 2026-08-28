import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_user_attribute_models.dart';
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
  test('Ops executes all user attribute definition routes', () async {
    final adapter = JsonResponseAdapter(
      (r) => JsonResponse(body: _response(r)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    final listed = await client.userAttributes.list(enabledOnly: true);
    final created = await client.userAttributes.create(
      Sub2ApiAdminCreateUserAttributeDefinitionRequest(
        key: ' department ',
        name: ' Department ',
        type: Sub2ApiAdminUserAttributeType.select,
        options: const <Sub2ApiAdminUserAttributeOption>[
          Sub2ApiAdminUserAttributeOption(
            value: 'engineering',
            label: 'Engineering',
          ),
        ],
        required: true,
        enabled: true,
      ),
    );
    final batch = await client.userAttributes.getBatch(const <int>[12, 11, 11]);
    final reordered = await client.userAttributes.reorder(const <int>[6]);
    final updated = await client.userAttributes.update(
      6,
      Sub2ApiAdminUpdateUserAttributeDefinitionRequest(enabled: false),
    );
    final deleted = await client.userAttributes.delete(6);
    expect(listed.single.key, 'department');
    expect(created.type, Sub2ApiAdminUserAttributeType.select);
    expect(batch.first.userId, 11);
    expect(batch.first.values.single.value, 'engineering');
    expect(reordered.message, 'Reorder successful');
    expect(updated.id, 6);
    expect(deleted.message, 'Attribute definition deleted successfully');
    expect(adapter.requests[0].path, '/api/v1/admin/user-attributes');
    expect(adapter.requests[2].path, '/api/v1/admin/user-attributes/batch');
    expect(adapter.requests[3].path, '/api/v1/admin/user-attributes/reorder');
  });
  test('user attribute validation and malformed data fail closed', () async {
    final validationAdapter = JsonResponseAdapter(
      (_) => throw StateError('no io'),
    );
    final validationClient = _client(configuration, validationAdapter);
    addTearDown(validationClient.close);
    expect(
      () => validationClient.userAttributes.create(
        Sub2ApiAdminCreateUserAttributeDefinitionRequest(
          key: '',
          name: 'Name',
          type: Sub2ApiAdminUserAttributeType.text,
        ),
      ),
      throwsA(_code('admin.user_attributes.key_required')),
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
      malformedClient.userAttributes.create(
        Sub2ApiAdminCreateUserAttributeDefinitionRequest(
          key: 'x',
          name: 'X',
          type: Sub2ApiAdminUserAttributeType.text,
        ),
      ),
      throwsA(_code('protocol.invalid_admin_user_attribute_response')),
    );
  });
  test('user attribute mutation is not replayed', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.userAttributes.delete(6),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT attribute list runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('attributes-admin-jwt'),
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
    await client.userAttributes.list();
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer attributes-admin-jwt'),
    );
  });
}

Map<String, Object?> _fixture() =>
    readFixture('admin/user_attribute_definition.json');
Object _response(RequestOptions r) {
  final Object? data;
  if (r.path.endsWith('/batch')) {
    data = _fixture()['batch'];
  } else if (r.method == 'DELETE') {
    data = <String, Object?>{
      'message': 'Attribute definition deleted successfully',
    };
  } else if (r.path.endsWith('/reorder')) {
    data = <String, Object?>{'message': 'Reorder successful'};
  } else if (r.method == 'GET') {
    data = <Object?>[_fixture()['definition']];
  } else {
    data = _fixture()['definition'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('attributes-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((e) => e.code, 'code', code);
