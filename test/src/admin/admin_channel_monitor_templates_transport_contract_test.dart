import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_channel_monitor_template_models.dart';
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
  test('Ops executes every channel monitor template route', () async {
    final adapter = JsonResponseAdapter(
      (r) => JsonResponse(body: _response(r)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    final listed = await client.channelMonitorTemplates.list(
      provider: Sub2ApiAdminMonitorTemplateProvider.openAi,
      apiMode: Sub2ApiAdminMonitorTemplateApiMode.responses,
    );
    final fetched = await client.channelMonitorTemplates.get(4);
    final body = Sub2ApiAdminJsonObject(<String, Sub2ApiAdminJsonValue>{
      'temperature': Sub2ApiAdminJsonNumber(Sub2ApiDecimal.parse('0.2')),
      'stream': const Sub2ApiAdminJsonBool(false),
    });
    final created = await client.channelMonitorTemplates.create(
      Sub2ApiAdminCreateChannelMonitorTemplateRequest(
        name: ' OpenAI Responses ',
        provider: Sub2ApiAdminMonitorTemplateProvider.openAi,
        apiMode: Sub2ApiAdminMonitorTemplateApiMode.responses,
        extraHeaders: const <String, String>{'X-Monitor': 'fixture'},
        bodyOverrideMode: Sub2ApiAdminMonitorTemplateBodyMode.merge,
        bodyOverride: body,
      ),
    );
    final updated = await client.channelMonitorTemplates.update(
      4,
      Sub2ApiAdminUpdateChannelMonitorTemplateRequest(description: ' updated '),
    );
    final monitors = await client.channelMonitorTemplates.listMonitors(4);
    final applied = await client.channelMonitorTemplates.apply(4, const <int>[
      9,
    ]);
    await client.channelMonitorTemplates.delete(4);
    expect(listed.single.id, 4);
    expect(fetched.bodyOverride?.values['stream'], isA<Sub2ApiAdminJsonBool>());
    expect(created.apiMode, Sub2ApiAdminMonitorTemplateApiMode.responses);
    expect(updated.description, 'Responses monitor body');
    expect(monitors.single.id, 9);
    expect(applied.affected, 1);
    expect(adapter.requests[0].path, '/api/v1/admin/channel-monitor-templates');
    expect(
      adapter.requests[1].path,
      '/api/v1/admin/channel-monitor-templates/4',
    );
    expect(
      adapter.requests[4].path,
      '/api/v1/admin/channel-monitor-templates/4/monitors',
    );
    expect(
      adapter.requests[5].path,
      '/api/v1/admin/channel-monitor-templates/4/apply',
    );
    expect(adapter.requests[6].method, 'DELETE');
  });
  test('template validation and malformed data fail closed', () async {
    final validationAdapter = JsonResponseAdapter(
      (_) => throw StateError('no io'),
    );
    final validationClient = _client(configuration, validationAdapter);
    addTearDown(validationClient.close);
    expect(
      () => validationClient.channelMonitorTemplates.apply(4, const <int>[]),
      throwsA(_code('admin.monitor_templates.monitor_ids_required')),
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
      malformedClient.channelMonitorTemplates.get(4),
      throwsA(
        _code('protocol.invalid_admin_channel_monitor_template_response'),
      ),
    );
  });
  test('template mutation is not replayed', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.channelMonitorTemplates.apply(4, const <int>[9]),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });

  test('Admin JWT template read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('template-admin-jwt'),
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
    await client.channelMonitorTemplates.get(4);
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer template-admin-jwt'),
    );
  });
}

Map<String, Object?> _fixture() =>
    readFixture('admin/channel_monitor_template.json');
Object _response(RequestOptions r) {
  final Object? data;
  if (r.method == 'DELETE') {
    data = null;
  } else if (r.path.endsWith('/monitors')) {
    data = <String, Object?>{
      'items': <Object?>[_fixture()['monitor']],
    };
  } else if (r.path.endsWith('/apply')) {
    data = <String, Object?>{'affected': 1};
  } else if (r.method == 'GET' && !r.path.endsWith('/4')) {
    data = <String, Object?>{
      'items': <Object?>[_fixture()['template']],
    };
  } else {
    data = _fixture()['template'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('template-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((e) => e.code, 'code', code);
