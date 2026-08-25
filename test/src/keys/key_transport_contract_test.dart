import 'package:dio/dio.dart';
import 'package:sub2api_client/src/keys/sub2api_key_client.dart';
import 'package:sub2api_client/src/keys/sub2api_key_models.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/session/session_coordinator.dart';
import 'package:sub2api_client/src/shared/session/sub2api_session.dart';
import 'package:sub2api_client/src/shared/transport/request_executor_impl.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  const session = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('key-transport-access'),
    scope: 'https://sub2api.test',
  );

  test(
    'key list uses shared decoding, authenticated headers, and typed query',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: readFixture('keys/list_success.json')),
      );
      final client = _client(adapter, session);

      final page = await client.list(
        request: const Sub2ApiKeyListRequest(
          page: 2,
          pageSize: 10,
          sortBy: 'name',
          sortOrder: 'asc',
          search: 'Codex',
          status: 'active',
          groupId: 7,
        ),
      );

      expect(page.items.single.id, 99);
      final request = adapter.requests.single;
      expect(request.method, 'GET');
      expect(request.path, '/api/v1/keys');
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer key-transport-access'),
      );
      expect(request.queryParameters, <String, Object?>{
        'page': 2,
        'page_size': 10,
        'sort_by': 'name',
        'sort_order': 'asc',
        'search': 'Codex',
        'status': 'active',
        'group_id': 7,
      });
    },
  );

  test(
    'delete is non-replayable and maps the fixed integer error envelope',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('errors/handler_integer.json'),
          statusCode: 400,
        ),
      );
      final client = _client(adapter, session);

      await expectLater(
        client.delete(99),
        throwsA(
          isA<Sub2ApiException>()
              .having(
                (error) => error.kind,
                'kind',
                Sub2ApiFailureKind.validation,
              )
              .having((error) => error.code, 'code', 'server.invalid_amount'),
        ),
      );

      final request = adapter.requests.single;
      expect(request.method, 'DELETE');
      expect(request.path, '/api/v1/keys/99');
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer key-transport-access'),
      );
    },
  );

  test(
    'key update remains a typed PUT and rejects an unsupported success status',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: readFixture('keys/detail_success.json'),
          statusCode: 201,
        ),
      );
      final client = _client(adapter, session);

      await expectLater(
        client.update(99, const Sub2ApiUpdateKeyRequest(status: 'inactive')),
        throwsA(
          isA<Sub2ApiException>().having(
            (error) => error.code,
            'code',
            'protocol.unexpected_success_status',
          ),
        ),
      );

      final request = adapter.requests.single;
      expect(request.method, 'PUT');
      expect(request.path, '/api/v1/keys/99');
      expect(request.data, <String, Object?>{'status': 'inactive'});
      expect(
        request.headers,
        containsPair('Authorization', 'Bearer key-transport-access'),
      );
    },
  );
}

Sub2ApiKeyClient _client(JsonResponseAdapter adapter, Sub2ApiSession session) {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );
  final sessions = Sub2ApiSessionCoordinator(RecordingSessionStore(session));
  final executor = Sub2ApiRequestExecutorImpl(
    configuration: configuration,
    refreshSession: (_) => throw StateError('refresh must not run'),
    sessions: sessions,
  );
  final dio = Dio(BaseOptions(baseUrl: configuration.origin.toString()))
    ..httpClientAdapter = adapter;
  return createSub2ApiKeyClient(dio: dio, requestExecutor: executor);
}
