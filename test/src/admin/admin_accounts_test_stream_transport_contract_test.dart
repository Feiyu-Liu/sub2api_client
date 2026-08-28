import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_account_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/session/sub2api_session.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/recording_session_store.dart';

void main() {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );
  const session = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('admin-test-stream-jwt-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('Ops decodes the fixed account-test SSE event stream', () async {
    final adapter = _StreamingAdapter(
      (_) => const _RawResponse(
        body: _successStream,
        contentType: 'text/event-stream',
      ),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final events = await client.accounts
        .testConnection(
          42,
          request: const Sub2ApiAdminAccountTestRequest(
            modelId: 'gpt-5.6',
            prompt: 'hello',
            mode: Sub2ApiAdminAccountTestMode.image,
            imageDataUrl: 'data:image/png;base64,aA==',
            audioDataUrl: 'data:audio/wav;base64,aA==',
          ),
        )
        .toList();

    expect(
      events.map((event) => event.type),
      <Sub2ApiAdminAccountTestEventType>[
        Sub2ApiAdminAccountTestEventType.testStart,
        Sub2ApiAdminAccountTestEventType.status,
        Sub2ApiAdminAccountTestEventType.content,
        Sub2ApiAdminAccountTestEventType.image,
        Sub2ApiAdminAccountTestEventType.testComplete,
      ],
    );
    expect(events[0].model, 'gpt-5.6');
    expect(events[2].text, 'hello from upstream');
    expect(events[3].mediaUrl?.scheme, 'data');
    expect(events.last.success, isTrue);

    final sent = adapter.requests.single;
    expect(sent.method, 'POST');
    expect(sent.path, '/api/v1/admin/accounts/42/test');
    expect(sent.responseType, ResponseType.stream);
    expect(sent.headers, containsPair('Accept', 'text/event-stream'));
    expect(
      sent.headers,
      containsPair('x-api-key', 'admin-test-stream-key-sentinel'),
    );
    expect(sent.headers, isNot(contains('Authorization')));
    expect(sent.data, <String, Object?>{
      'model_id': 'gpt-5.6',
      'prompt': 'hello',
      'mode': 'image',
      'image_data_url': 'data:image/png;base64,aA==',
      'audio_data_url': 'data:audio/wav;base64,aA==',
    });
  });

  test('Admin JWT account test streams after role bootstrap', () async {
    final adapter = _StreamingAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return _RawResponse.json(readFixture('auth/current_user_success.json'));
      }
      return const _RawResponse(
        body: _successStream,
        contentType: 'text/event-stream; charset=utf-8',
      );
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    final events = await client.accounts.testConnection(42).toList();

    expect(events.last.type, Sub2ApiAdminAccountTestEventType.testComplete);
    expect(
      adapter.requests.map((sent) => '${sent.method} ${sent.path}'),
      <String>['GET /api/v1/auth/me', 'POST /api/v1/admin/accounts/42/test'],
    );
    for (final sent in adapter.requests) {
      expect(
        sent.headers,
        containsPair('Authorization', 'Bearer admin-test-stream-jwt-sentinel'),
      );
      expect(sent.headers, isNot(contains('x-api-key')));
    }
  });

  test('business failure is a typed terminal SSE error event', () async {
    final adapter = _StreamingAdapter(
      (_) => const _RawResponse(
        body: 'data: {"type":"error","error":"Account not found"}\n\n',
        contentType: 'text/event-stream',
      ),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    final events = await client.accounts.testConnection(42).toList();

    expect(events, hasLength(1));
    expect(events.single.type, Sub2ApiAdminAccountTestEventType.error);
    expect(events.single.error, 'Account not found');
  });

  test('malformed or unterminated SSE fails closed', () async {
    for (final body in <String>[
      'data: not-json\n\n',
      'data: {"type":"test_start","model":"gpt-5.6"}\n\n',
      'data: {"type":"content","text":"before start"}\n\n',
    ]) {
      final adapter = _StreamingAdapter(
        (_) => _RawResponse(body: body, contentType: 'text/event-stream'),
      );
      final client = _opsClient(configuration, adapter);
      addTearDown(client.close);

      await expectLater(
        client.accounts.testConnection(42).toList(),
        throwsA(_code('protocol.invalid_admin_account_test_stream')),
      );
    }
  });

  test('streaming transport preserves invalid Admin API Key errors', () async {
    final adapter = _StreamingAdapter(
      (_) => _RawResponse.json(
        readFixture('admin/account_auth_failure.json'),
        statusCode: 401,
      ),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.accounts.testConnection(42).toList(),
      throwsA(_code('server.invalid_api_key')),
    );
  });

  test('account test validates media and input before network I/O', () async {
    final adapter = _StreamingAdapter(
      (_) => throw StateError('validation must not send a request'),
    );
    final client = _opsClient(configuration, adapter);
    addTearDown(client.close);

    await expectLater(
      client.accounts.testConnection(0).toList(),
      throwsA(_code('admin.accounts.invalid_account_id')),
    );
    await expectLater(
      client.accounts
          .testConnection(
            42,
            request: const Sub2ApiAdminAccountTestRequest(
              imageDataUrl: 'data:text/plain;base64,aA==',
            ),
          )
          .toList(),
      throwsA(_code('admin.accounts.invalid_test_image')),
    );
    await expectLater(
      client.accounts
          .testConnection(
            42,
            request: const Sub2ApiAdminAccountTestRequest(
              audioDataUrl: 'data:audio/wav;base64,not-base64',
            ),
          )
          .toList(),
      throwsA(_code('admin.accounts.invalid_test_audio')),
    );
    expect(adapter.requests, isEmpty);
  });

  test('account test stream never refreshes and replays after 401', () async {
    const refreshableSession = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-test-stream-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-test-stream-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = _StreamingAdapter((sent) {
      if (sent.path == '/api/v1/auth/me') {
        return _RawResponse.json(readFixture('auth/current_user_success.json'));
      }
      if (sent.path == '/api/v1/auth/refresh') {
        return _RawResponse.json(readFixture('auth/refresh_rotated_pair.json'));
      }
      return _RawResponse.json(
        readFixture('admin/account_auth_failure.json'),
        statusCode: 401,
      );
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(refreshableSession),
      dio: _dio(adapter),
    );
    addTearDown(client.close);

    await expectLater(
      client.accounts.testConnection(42).toList(),
      throwsA(isA<Sub2ApiException>()),
    );

    expect(
      adapter.requests.where((sent) => sent.path == '/api/v1/auth/refresh'),
      isEmpty,
    );
    expect(
      adapter.requests.where(
        (sent) => sent.path == '/api/v1/admin/accounts/42/test',
      ),
      hasLength(1),
    );
  });
}

const _successStream =
    'data: {"type":"test_start","model":"gpt-5.6"}\n\n'
    'data: {"type":"status","text":"connected"}\n\n'
    'data: {"type":"content","text":"hello from upstream"}\n\n'
    'data: {"type":"image","image_url":"data:image/png;base64,aA==","mime_type":"image/png"}\n\n'
    'data: {"type":"test_complete","success":true}\n\n';

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);

Sub2ApiOpsClient _opsClient(
  Sub2ApiConfiguration configuration,
  _StreamingAdapter adapter,
) => createSub2ApiOpsClientForTesting(
  configuration: configuration,
  credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
    Sub2ApiAdminApiKey('admin-test-stream-key-sentinel'),
  ),
  dio: _dio(adapter),
);

Dio _dio(_StreamingAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
      ..httpClientAdapter = adapter;

final class _StreamingAdapter implements HttpClientAdapter {
  _StreamingAdapter(this._respond);

  final FutureOr<_RawResponse> Function(RequestOptions request) _respond;
  final List<RequestOptions> requests = <RequestOptions>[];

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final response = await _respond(options);
    return ResponseBody.fromString(
      response.body,
      response.statusCode,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[response.contentType],
      },
    );
  }
}

final class _RawResponse {
  const _RawResponse({
    required this.body,
    required this.contentType,
    this.statusCode = 200,
  });

  factory _RawResponse.json(Object? body, {int statusCode = 200}) =>
      _RawResponse(
        body: jsonEncode(body),
        contentType: Headers.jsonContentType,
        statusCode: statusCode,
      );

  final String body;
  final String contentType;
  final int statusCode;
}
