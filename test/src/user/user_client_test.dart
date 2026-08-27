import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:sub2api_client/src/shared/models/sub2api_decimal.dart';
import 'package:sub2api_client/src/shared/request/sub2api_request_options.dart';
import 'package:sub2api_client/src/shared/transport/request_executor.dart';
import 'package:sub2api_client/src/user/sub2api_user_client.dart';
import 'package:sub2api_client/src/user/sub2api_user_models.dart';
import 'package:test/test.dart';

void main() {
  group('Sub2ApiUserClient', () {
    test('maps the fixed profile contract with exact decimals', () async {
      final adapter = _FixtureAdapter(_fixture('profile_success.json'));
      final client = createSub2ApiUserClient(
        dio: _dio(adapter),
        requestExecutor: _EnvelopeExecutor(),
      );

      final profile = await client.getProfile();

      expect(profile.id, 42);
      expect(profile.balance.toString(), '12.5');
      expect(profile.frozenBalance.toString(), '1.25');
      expect(profile.balanceNotifyThreshold.toString(), '2.5');
      expect(profile.allowedGroups, <int>[1, 7]);
      expect(profile.avatarUrl, 'https://cdn.example.test/avatar.png');
      expect(adapter.lastRequest?.path, '/api/v1/user/profile');
      expect(adapter.lastRequest?.method, 'GET');
    });

    test(
      'ignores additive profile fields but fails closed for missing fields',
      () async {
        final additiveClient = createSub2ApiUserClient(
          dio: _dio(_FixtureAdapter(_fixture('profile_unknown_field.json'))),
          requestExecutor: _EnvelopeExecutor(),
        );
        final malformedClient = createSub2ApiUserClient(
          dio: _dio(_FixtureAdapter(_fixture('profile_missing_required.json'))),
          requestExecutor: _EnvelopeExecutor(),
        );

        await expectLater(additiveClient.getProfile(), completes);
        await expectLater(
          malformedClient.getProfile(),
          throwsA(
            isA<Object>().having(
              (error) => error.toString(),
              'protocol error',
              contains('protocol.invalid_user_profile'),
            ),
          ),
        );
      },
    );

    test(
      'uses the v0.1.183 profile and password routes with exact payloads',
      () async {
        final profileAdapter = _FixtureAdapter(
          _fixture('profile_success.json'),
        );
        final profileClient = createSub2ApiUserClient(
          dio: _dio(profileAdapter),
          requestExecutor: _EnvelopeExecutor(),
        );
        await profileClient.updateProfile(
          Sub2ApiUpdateUserProfileRequest(
            username: 'updated-name',
            balanceNotifyThreshold: Sub2ApiDecimal.parse('3.75'),
          ),
        );
        expect(profileAdapter.lastRequest?.path, '/api/v1/user');
        expect(profileAdapter.lastRequest?.method, 'PUT');
        expect(profileAdapter.lastRequest?.data, <String, Object?>{
          'username': 'updated-name',
          'balance_notify_threshold': 3.75,
        });

        final passwordAdapter = _FixtureAdapter(
          _fixture('profile_success.json'),
        );
        final passwordClient = createSub2ApiUserClient(
          dio: _dio(passwordAdapter),
          requestExecutor: _EnvelopeExecutor(),
        );
        final request = Sub2ApiChangePasswordRequest(
          oldPassword: Sub2ApiPassword('old-secret'),
          newPassword: Sub2ApiPassword('new-secret'),
        );

        await passwordClient.changePassword(request);

        expect(passwordAdapter.lastRequest?.path, '/api/v1/user/password');
        expect(passwordAdapter.lastRequest?.method, 'PUT');
        expect(passwordAdapter.lastRequest?.data, <String, Object?>{
          'old_password': 'old-secret',
          'new_password': 'new-secret',
        });
        expect(request.toString(), isNot(contains('old-secret')));
        expect(request.toString(), isNot(contains('new-secret')));
      },
    );
  });
}

Object? _fixture(String name) {
  return jsonDecode(
    File('test/fixtures/v0_1_183/user/$name').readAsStringSync(),
  );
}

Dio _dio(_FixtureAdapter adapter) {
  return Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
    ..httpClientAdapter = adapter;
}

final class _EnvelopeExecutor implements Sub2ApiRequestExecutor {
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

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
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
