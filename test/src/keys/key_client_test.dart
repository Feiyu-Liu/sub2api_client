import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:sub2api_client/src/keys/sub2api_key_client.dart';
import 'package:sub2api_client/src/keys/sub2api_key_models.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/models/sub2api_decimal.dart';
import 'package:sub2api_client/src/shared/request/sub2api_request_options.dart';
import 'package:sub2api_client/src/shared/transport/request_executor.dart';
import 'package:test/test.dart';

void main() {
  group('Sub2ApiKeyClient', () {
    test(
      'lists summary models without retaining or logging wire secrets',
      () async {
        final adapter = _FixtureAdapter(_fixture('list_success.json'));
        final client = createSub2ApiKeyClient(
          dio: _dio(adapter),
          requestExecutor: _EnvelopeExecutor(),
        );

        final page = await client.list(
          request: const Sub2ApiKeyListRequest(
            page: 1,
            pageSize: 20,
            search: 'Codex',
          ),
        );

        final summary = page.items.single;
        expect(page.total, 1);
        expect(summary.name, 'Codex Desktop');
        expect(summary.quota.toString(), '50');
        expect(summary.fiveHourWindow.limit.toString(), '10');
        expect(summary.fiveHourWindow.used.toString(), '1');
        expect(summary.sevenDayWindow.resetsAt, DateTime.utc(2026, 8, 30));
        expect(
          summary.toString(),
          isNot(contains('sk-sub2api-list-secret-must-not-escape')),
        );
        expect(adapter.lastRequest?.path, '/api/v1/keys');
        expect(
          adapter.lastRequest?.queryParameters,
          containsPair('search', 'Codex'),
        );
      },
    );

    test(
      'returns a redacted secret only for an explicit detail read',
      () async {
        final client = createSub2ApiKeyClient(
          dio: _dio(_FixtureAdapter(_fixture('detail_success.json'))),
          requestExecutor: _EnvelopeExecutor(),
        );

        final details = await client.getById(99);

        expect(details.summary.id, 99);
        expect(details.secret.reveal(), 'sk-sub2api-detail-secret');
        expect(details.secret.toString(), '<redacted>');
        expect(details.toString(), isNot(contains('sk-sub2api-detail-secret')));
      },
    );

    test(
      'creates with an explicit idempotency key and no feature retry',
      () async {
        final adapter = _FixtureAdapter(_fixture('create_success.json'));
        final executor = _EnvelopeExecutor();
        final client = createSub2ApiKeyClient(
          dio: _dio(adapter),
          requestExecutor: executor,
        );

        final details = await client.create(
          Sub2ApiCreateKeyRequest(
            name: 'New Codex Desktop',
            idempotencyKey: 'create-key-001',
            customKey: const Sub2ApiApiKeySecret('custom-key-value'),
            quota: Sub2ApiDecimal.parse('20.50'),
            rateLimit5h: Sub2ApiDecimal.parse('5'),
          ),
        );

        expect(details.secret.reveal(), 'sk-sub2api-created-secret');
        expect(adapter.requestCount, 1);
        expect(executor.protectedCalls, 0);
        expect(executor.nonReplayableCalls, 1);
        expect(adapter.lastRequest?.path, '/api/v1/keys');
        expect(adapter.lastRequest?.method, 'POST');
        expect(
          _header(adapter.lastRequest, 'idempotency-key'),
          'create-key-001',
        );
        expect(adapter.lastRequest?.data, <String, Object?>{
          'name': 'New Codex Desktop',
          'custom_key': 'custom-key-value',
          'quota': 20.5,
          'rate_limit_5h': 5,
        });
      },
    );

    test(
      'updates and clears expiration with the server empty-string contract',
      () async {
        final adapter = _FixtureAdapter(_fixture('detail_success.json'));
        final executor = _EnvelopeExecutor();
        final client = createSub2ApiKeyClient(
          dio: _dio(adapter),
          requestExecutor: executor,
        );

        final summary = await client.update(
          99,
          const Sub2ApiUpdateKeyRequest(clearExpiration: true),
        );

        expect(adapter.lastRequest?.path, '/api/v1/keys/99');
        expect(adapter.lastRequest?.method, 'PUT');
        expect(adapter.lastRequest?.data, <String, Object?>{'expires_at': ''});
        expect(summary.toString(), isNot(contains('sk-sub2api-detail-secret')));
        expect(executor.protectedCalls, 1);
        expect(executor.nonReplayableCalls, 0);
      },
    );

    test(
      'deletes through the non-replayable operation and exact key route',
      () async {
        final adapter = _FixtureAdapter(const <String, Object?>{
          'code': 0,
          'message': 'success',
          'data': <String, Object?>{'message': 'API key deleted successfully'},
        });
        final executor = _EnvelopeExecutor();
        final client = createSub2ApiKeyClient(
          dio: _dio(adapter),
          requestExecutor: executor,
        );

        await client.delete(99);

        expect(adapter.lastRequest?.path, '/api/v1/keys/99');
        expect(adapter.lastRequest?.method, 'DELETE');
        expect(executor.protectedCalls, 0);
        expect(executor.nonReplayableCalls, 1);
      },
    );

    test('fails closed when a detail response is missing its secret', () async {
      final client = createSub2ApiKeyClient(
        dio: _dio(_FixtureAdapter(_fixture('detail_missing_required.json'))),
        requestExecutor: _EnvelopeExecutor(),
      );

      await expectLater(
        client.getById(99),
        throwsA(
          isA<Object>().having(
            (error) => error.toString(),
            'protocol error',
            contains('protocol.invalid_key'),
          ),
        ),
      );
    });
  });
}

Object? _fixture(String name) {
  return jsonDecode(
    File('test/fixtures/v0_1_183/keys/$name').readAsStringSync(),
  );
}

String? _header(RequestOptions? options, String targetName) {
  if (options == null) {
    return null;
  }
  for (final entry in options.headers.entries) {
    if (entry.key.toLowerCase() == targetName) {
      return entry.value?.toString();
    }
  }
  return null;
}

Dio _dio(_FixtureAdapter adapter) {
  return Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
    ..httpClientAdapter = adapter;
}

final class _EnvelopeExecutor implements Sub2ApiRequestExecutor {
  int protectedCalls = 0;
  int nonReplayableCalls = 0;

  @override
  Future<T> optionalAuthenticatedRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) => _execute(send: send, decode: decode);

  @override
  Future<T> protectedRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    protectedCalls += 1;
    return _execute(send: send, decode: decode);
  }

  @override
  Future<T> protectedRequestAllowingRawSuccess<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) => _execute(send: send, decode: decode);

  @override
  Future<T> protectedNonReplayableRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    nonReplayableCalls += 1;
    return _execute(send: send, decode: decode);
  }

  @override
  Future<void> protectedNonReplayableNoContentRequest({
    required Sub2ApiWireCall send,
    Sub2ApiRequestOptions? requestOptions,
  }) => throw UnimplementedError();

  @override
  Future<T> publicRequest<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    return _execute(send: send, decode: decode);
  }

  @override
  Future<T> publicRequestAllowingRawSuccess<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    return _execute(send: send, decode: decode);
  }

  Future<T> _execute<T>({
    required Sub2ApiWireCall send,
    required T Function(Object? data) decode,
  }) async {
    final response = await send(CancelToken(), Options(), 'Bearer fixture');
    final envelope = response.data! as Map<String, Object?>;
    return decode(envelope['data']);
  }
}

final class _FixtureAdapter implements HttpClientAdapter {
  _FixtureAdapter(this._body);

  final Object? _body;
  RequestOptions? lastRequest;
  int requestCount = 0;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requestCount += 1;
    lastRequest = options;
    return ResponseBody.fromString(
      jsonEncode(_body),
      HttpStatus.ok,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }
}
