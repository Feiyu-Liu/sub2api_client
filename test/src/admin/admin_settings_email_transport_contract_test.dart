import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_setting_models.dart';
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

  test('Ops executes every SMTP and email-template route', () async {
    final adapter = JsonResponseAdapter(
      (request) => JsonResponse(body: _response(request)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    const password = Sub2ApiAdminSmtpPassword('smtp-secret');
    const html = Sub2ApiAdminEmailTemplateContent('<p>Hello {{username}}</p>');

    final smtp = await client.settings.testSmtp(
      const Sub2ApiAdminTestSmtpRequest(
        host: ' smtp.example.test ',
        port: 587,
        username: ' mailer ',
        password: password,
      ),
    );
    final sent = await client.settings.sendTestEmail(
      const Sub2ApiAdminSendTestEmailRequest(
        email: ' admin@example.test ',
        host: 'smtp.example.test',
        port: 587,
        password: password,
        fromEmail: 'noreply@example.test',
      ),
    );
    final list = await client.settings.listEmailTemplates();
    final detail = await client.settings.getEmailTemplate(
      ' welcome ',
      ' en-US ',
    );
    final updated = await client.settings.updateEmailTemplate(
      'welcome',
      'en-US',
      const Sub2ApiAdminUpdateEmailTemplateRequest(
        subject: ' Welcome ',
        html: html,
      ),
    );
    final restored = await client.settings.restoreOfficialEmailTemplate(
      'welcome',
      'en-US',
    );
    final preview = await client.settings.previewEmailTemplate(
      Sub2ApiAdminPreviewEmailTemplateRequest(
        event: 'welcome',
        locale: 'en-US',
        subject: 'Welcome {{username}}',
        html: html,
        variables: const <String, String>{'username': 'Ada'},
      ),
    );

    expect(smtp.message, 'SMTP connection successful');
    expect(sent.message, 'Test email sent successfully');
    expect(list.events.single.value, 'welcome');
    expect(list.templates.single.updatedAt, DateTime.utc(2026, 8, 28, 3));
    expect(detail.html.toString(), '<redacted>');
    expect(updated.html.reveal(), contains('{{username}}'));
    expect(restored.event, 'welcome');
    expect(preview.html.toString(), '<redacted>');
    expect(password.toString(), '<redacted>');
    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/admin/settings/test-smtp',
      '/api/v1/admin/settings/send-test-email',
      '/api/v1/admin/settings/email-templates',
      '/api/v1/admin/settings/email-templates/welcome/en-US',
      '/api/v1/admin/settings/email-templates/welcome/en-US',
      '/api/v1/admin/settings/email-templates/welcome/en-US/restore-official',
      '/api/v1/admin/settings/email-template-preview',
    ]);
    expect(
      adapter.requests[0].data,
      containsPair('smtp_password', 'smtp-secret'),
    );
    expect(adapter.requests[4].data, containsPair('html', html.reveal()));
    expect(
      adapter.requests.every(
        (request) => request.headers['x-api-key'] == 'email-key-sentinel',
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

  test('email settings validation fails without I/O', () async {
    final adapter = JsonResponseAdapter((_) => throw StateError('no io'));
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    expect(
      () => client.settings.sendTestEmail(
        const Sub2ApiAdminSendTestEmailRequest(email: 'invalid'),
      ),
      throwsA(_code('admin.settings.invalid_test_email')),
    );
    expect(
      () => client.settings.getEmailTemplate('', 'en-US'),
      throwsA(_code('admin.settings.event_required')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('malformed template response fails closed', () async {
    final adapter = JsonResponseAdapter(
      (_) => const JsonResponse(
        body: <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'event': 'welcome', 'html': ''},
        },
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.settings.getEmailTemplate('welcome', 'en-US'),
      throwsA(_code('protocol.invalid_admin_setting_response')),
    );
  });

  test('email mutation is not replayed after 401', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    await expectLater(
      client.settings.testSmtp(const Sub2ApiAdminTestSmtpRequest()),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(adapter.requests, hasLength(1));
  });
}

Map<String, Object?> _fixture() => readFixture('admin/settings_email.json');
Object _response(RequestOptions request) {
  final Object? data;
  if (request.path.endsWith('/test-smtp')) {
    data = _fixture()['smtp'];
  } else if (request.path.endsWith('/send-test-email')) {
    data = _fixture()['sent'];
  } else if (request.path.endsWith('/email-templates')) {
    data = _fixture()['list'];
  } else if (request.path.endsWith('/email-template-preview')) {
    data = _fixture()['preview'];
  } else {
    data = _fixture()['detail'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('email-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
