import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_announcement_models.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_client.dart';
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
  test('Ops executes all admin announcement routes', () async {
    final adapter = JsonResponseAdapter(
      (r) => JsonResponse(body: _response(r)),
    );
    final client = _client(configuration, adapter);
    addTearDown(client.close);
    final page = await client.announcements.list(
      query: const Sub2ApiAdminAnnouncementQuery(
        status: Sub2ApiAdminAnnouncementStatus.active,
        search: ' maintenance ',
      ),
    );
    final item = await client.announcements.get(7);
    final targeting = Sub2ApiAdminAnnouncementTargeting(
      anyOf: <Sub2ApiAdminAnnouncementConditionGroup>[
        Sub2ApiAdminAnnouncementConditionGroup(
          <Sub2ApiAdminAnnouncementCondition>[
            Sub2ApiAdminAnnouncementBalanceCondition(
              operator: Sub2ApiAdminAnnouncementBalanceOperator.gte,
              value: Sub2ApiDecimal.parse('10.5'),
            ),
          ],
        ),
      ],
    );
    final created = await client.announcements.create(
      Sub2ApiAdminCreateAnnouncementRequest(
        title: ' Maintenance ',
        content: ' Window ',
        status: Sub2ApiAdminAnnouncementStatus.active,
        notifyMode: Sub2ApiAdminAnnouncementNotifyMode.popup,
        targeting: targeting,
        startsAt: DateTime.utc(2026, 8, 27, 12),
        endsAt: DateTime.utc(2026, 8, 28, 12),
      ),
    );
    final updated = await client.announcements.update(
      7,
      const Sub2ApiAdminUpdateAnnouncementRequest(
        endsAt: Sub2ApiAdminAnnouncementTimeUpdate.clear(),
      ),
    );
    final read = await client.announcements.listReadStatus(
      7,
      query: const Sub2ApiAdminAnnouncementReadStatusQuery(
        page: 1,
        pageSize: 20,
        sortBy: Sub2ApiAdminAnnouncementReadSortBy.balance,
        sortOrder: Sub2ApiAdminAnnouncementSortOrder.desc,
      ),
    );
    final deleted = await client.announcements.delete(7);
    expect(page.items.single.id, 7);
    expect(item.targeting.anyOf, hasLength(2));
    expect(created.status, Sub2ApiAdminAnnouncementStatus.active);
    expect(updated.id, 7);
    expect(read.items.single.balance.toString(), '25.75');
    expect(deleted.message, 'Announcement deleted successfully');
    expect(adapter.requests[0].path, '/api/v1/admin/announcements');
    expect(adapter.requests[1].path, '/api/v1/admin/announcements/7');
    expect(
      adapter.requests[4].path,
      '/api/v1/admin/announcements/7/read-status',
    );
    expect(adapter.requests[3].data, containsPair('ends_at', 0));
  });
  test('announcement validation and malformed data fail closed', () async {
    final validationAdapter = JsonResponseAdapter(
      (_) => throw StateError('validation must not send'),
    );
    final validationClient = _client(configuration, validationAdapter);
    addTearDown(validationClient.close);
    expect(
      () => validationClient.announcements.create(
        Sub2ApiAdminCreateAnnouncementRequest(title: ' ', content: 'body'),
      ),
      throwsA(_code('admin.announcements.invalid_title')),
    );
    expect(
      () => validationClient.announcements.create(
        Sub2ApiAdminCreateAnnouncementRequest(title: 'title', content: ' '),
      ),
      throwsA(_code('admin.announcements.content_required')),
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
      malformedClient.announcements.get(7),
      throwsA(_code('protocol.invalid_admin_announcement_response')),
    );
  });

  test('Admin JWT announcement read runs after role bootstrap', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('announcement-admin-jwt'),
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
    await client.announcements.get(7);
    expect(adapter.requests.first.path, '/api/v1/auth/me');
    expect(
      adapter.requests.last.headers,
      containsPair('Authorization', 'Bearer announcement-admin-jwt'),
    );
  });

  test('announcement mutation disables automatic refresh replay', () async {
    const session = Sub2ApiSession(
      accessToken: Sub2ApiAccessToken('expired-announcement-jwt'),
      refreshToken: Sub2ApiRefreshToken('refresh-announcement-jwt'),
      scope: 'https://sub2api.test',
    );
    final adapter = JsonResponseAdapter((request) {
      if (request.path == '/api/v1/auth/me') {
        return JsonResponse(
          body: readFixture('auth/current_user_success.json'),
        );
      }
      if (request.path == '/api/v1/auth/refresh') {
        return JsonResponse(
          body: readFixture('auth/refresh_rotated_pair.json'),
        );
      }
      return JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      );
    });
    final client = createSub2ApiAdminClientForTesting(
      configuration: configuration,
      sessionStore: RecordingSessionStore(session),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = adapter,
    );
    addTearDown(client.close);
    await expectLater(
      client.announcements.delete(7),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(
      adapter.requests.where(
        (request) => request.path == '/api/v1/auth/refresh',
      ),
      isEmpty,
    );
  });
}

Map<String, Object?> _fixture() => readFixture('admin/admin_announcement.json');
Object _response(RequestOptions r) {
  final Object? data;
  if (r.method == 'DELETE') {
    data = <String, Object?>{'message': 'Announcement deleted successfully'};
  } else if (r.path.endsWith('/read-status')) {
    data = _fixture()['read_status'];
  } else if (r.method == 'GET' && !r.path.endsWith('/7')) {
    data = <String, Object?>{
      'items': <Object?>[_fixture()['announcement']],
      'total': 1,
      'page': 1,
      'page_size': 20,
      'pages': 1,
    };
  } else {
    data = _fixture()['announcement'];
  }
  return <String, Object?>{'code': 0, 'message': 'success', 'data': data};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('announcement-key-sentinel'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String code) =>
    isA<Sub2ApiException>().having((e) => e.code, 'code', code);
