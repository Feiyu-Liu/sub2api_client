import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';

void main() {
  test('Ops consumes the authenticated QPS WebSocket contract', () async {
    String? apiKey;
    String? origin;
    String? path;
    List<String> protocols = const <String>[];
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));
    server.listen((request) async {
      path = request.uri.path;
      apiKey = request.headers.value('x-api-key');
      origin = request.headers.value('origin');
      final socket = await WebSocketTransformer.upgrade(
        request,
        protocolSelector: (offered) {
          protocols = List<String>.of(offered);
          return 'sub2api-admin';
        },
      );
      socket.add(jsonEncode(readFixture('admin/ops_qps.json')));
      await socket.close(WebSocketStatus.normalClosure, 'done');
    });
    final configuration = Sub2ApiConfiguration(
      origin: Uri.parse('http://127.0.0.1:${server.port}'),
      allowInsecureHttp: true,
    );
    final client = _client(configuration);
    addTearDown(client.close);

    final update = await client.operationsQps.watch().first;

    expect(update.qps.toString(), '2.5');
    expect(update.tps.toString(), '140.2');
    expect(update.requestCount, 150);
    expect(apiKey, 'ops-qps-key');
    expect(path, '/api/v1/admin/ops/ws/qps');
    expect(origin, 'http://127.0.0.1:${server.port}');
    expect(protocols, contains('sub2api-admin'));
  });

  test('QPS close code 4001 maps realtime-disabled', () async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));
    server.listen((request) async {
      final socket = await WebSocketTransformer.upgrade(request);
      await socket.close(4001, 'realtime_disabled');
    });
    final client = _client(
      Sub2ApiConfiguration(
        origin: Uri.parse('http://127.0.0.1:${server.port}'),
        allowInsecureHttp: true,
      ),
    );
    addTearDown(client.close);

    await expectLater(
      client.operationsQps.watch(),
      emitsError(_code('admin.ops.realtime_disabled')),
    );
  });

  test('malformed QPS frame fails closed', () async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));
    server.listen((request) async {
      final socket = await WebSocketTransformer.upgrade(request);
      socket.add('{"type":"unknown"}');
      await socket.close(WebSocketStatus.normalClosure, 'done');
    });
    final client = _client(
      Sub2ApiConfiguration(
        origin: Uri.parse('http://127.0.0.1:${server.port}'),
        allowInsecureHttp: true,
      ),
    );
    addTearDown(client.close);

    await expectLater(
      client.operationsQps.watch(),
      emitsError(_code('protocol.invalid_admin_ops_qps_update')),
    );
  });
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration configuration) =>
    createSub2ApiOpsClientForTesting(
      configuration: configuration,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('ops-qps-key'),
      ),
      dio: Dio(BaseOptions(baseUrl: configuration.origin.toString())),
    );

Matcher _code(String code) =>
    isA<Sub2ApiException>().having((error) => error.code, 'code', code);
