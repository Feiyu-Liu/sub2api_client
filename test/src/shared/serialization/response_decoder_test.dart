import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' show HttpResponse;
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/serialization/response_decoder.dart';
import 'package:test/test.dart';

import '../../../support/fixture_reader.dart';

void main() {
  const decoder = Sub2ApiResponseDecoder();

  test(
    'fixture manifest pins the upstream tag and immutable source commit',
    () {
      final manifest = readFixtureManifest();

      expect(manifest.tag, 'v0.1.183');
      expect(manifest.commit, 'e8cb019fabf8b55199436229044cbf9aa7a82564');
    },
  );

  test('accepts additive fields but requires the fixed success envelope', () {
    final response = _response(
      statusCode: 200,
      data: {
        'code': 0,
        'message': 'success',
        'data': {'value': 3, 'future_field': true},
        'future_envelope_field': 'ignored',
      },
    );

    final value = decoder.decodeSuccess<int>(response, (data) {
      final map = data! as Map<String, Object?>;
      return map['value']! as int;
    });
    expect(value, 3);

    expect(
      () => decoder.decodeSuccess<Object?>(
        _response(statusCode: 200, data: {'code': 0, 'message': 'success'}),
        (data) => data,
      ),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'protocol.invalid_success_envelope',
        ),
      ),
    );
  });

  test('decodes integer handler errors without exposing the message', () {
    final fixture = readFixture('errors/handler_integer.json');
    final error = decoder.decodeDioException(
      _dioError(statusCode: 400, data: fixture),
    );

    expect(error.kind, Sub2ApiFailureKind.validation);
    expect(error.code, 'server.invalid_amount');
    expect(error.toString(), isNot(contains(fixture['message'] as String)));
  });

  test('decodes string middleware errors and request id', () {
    final fixture = readFixture('errors/middleware_string.json');
    final error = decoder.decodeDioException(
      _dioError(
        statusCode: 401,
        data: fixture,
        headers: {
          'x-request-id': ['request-123'],
        },
      ),
    );

    expect(error.kind, Sub2ApiFailureKind.unauthorized);
    expect(error.code, 'auth.token_expired');
    expect(error.traceId, 'request-123');
    expect(decoder.isSessionInvalid(error), isFalse);
  });

  test('marks revoked-token middleware errors as session-invalid', () {
    final error = decoder.decodeDioException(
      _dioError(
        statusCode: 401,
        data: {'code': 'TOKEN_REVOKED', 'message': 'redacted'},
      ),
    );

    expect(error.code, 'auth.token_revoked');
    expect(decoder.isSessionInvalid(error), isTrue);
  });

  test('fails closed for a malformed non-JSON error response', () {
    final error = decoder.decodeDioException(
      _dioError(statusCode: 502, data: '<html>gateway failed</html>'),
    );

    expect(error.kind, Sub2ApiFailureKind.protocol);
    expect(error.code, 'protocol.invalid_error_envelope');
  });

  test('maps transport timeout variants to the stable timeout failure', () {
    for (final type in [
      DioExceptionType.connectionTimeout,
      DioExceptionType.sendTimeout,
      DioExceptionType.receiveTimeout,
    ]) {
      final error = decoder.decodeDioException(
        DioException(
          requestOptions: RequestOptions(path: '/api/v1/test'),
          type: type,
        ),
      );

      expect(error.kind, Sub2ApiFailureKind.timeout);
      expect(error.code, 'request.timeout');
      expect(error.retryable, isTrue);
    }
  });
}

HttpResponse<Object?> _response({
  required int statusCode,
  required Object? data,
}) {
  final options = RequestOptions(path: '/api/v1/test');
  return HttpResponse<Object?>(
    data,
    Response<Object?>(requestOptions: options, statusCode: statusCode),
  );
}

DioException _dioError({
  required int statusCode,
  required Object? data,
  Map<String, List<String>>? headers,
}) {
  final options = RequestOptions(path: '/api/v1/test');
  return DioException(
    requestOptions: options,
    type: DioExceptionType.badResponse,
    response: Response<Object?>(
      requestOptions: options,
      statusCode: statusCode,
      data: data,
      headers: Headers.fromMap(headers ?? const {}),
    ),
  );
}
