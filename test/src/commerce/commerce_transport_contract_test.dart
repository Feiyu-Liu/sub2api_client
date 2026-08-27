import 'package:dio/dio.dart';
import 'package:sub2api_client/src/commerce/sub2api_commerce_client.dart';
import 'package:sub2api_client/src/commerce/sub2api_commerce_models.dart';
import 'package:sub2api_client/src/commerce/sub2api_monitor_models.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
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
    accessToken: Sub2ApiAccessToken('commerce-access-sentinel'),
    scope: 'https://sub2api.test',
  );

  test(
    'announcements, redemption, and subscriptions map fixed routes',
    () async {
      var subscriptionReads = 0;
      final adapter = JsonResponseAdapter((request) {
        final fixture = switch (request.path) {
          '/api/v1/announcements' => 'commerce/announcements.json',
          '/api/v1/announcements/11/read' => 'commerce/announcement_read.json',
          '/api/v1/redeem' => 'commerce/redeem_record.json',
          '/api/v1/redeem/history' => 'commerce/redeem_history.json',
          '/api/v1/subscriptions' ||
          '/api/v1/subscriptions/active' => 'commerce/subscriptions.json',
          '/api/v1/subscriptions/progress' =>
            'commerce/subscription_progress.json',
          '/api/v1/subscriptions/summary' =>
            'commerce/subscription_summary.json',
          _ => throw StateError('unexpected path ${request.path}'),
        };
        if (request.path.startsWith('/api/v1/subscriptions')) {
          subscriptionReads++;
        }
        return JsonResponse(body: readFixture(fixture));
      });
      final client = _client(adapter, session);

      final announcements = await client.listAnnouncements(unreadOnly: true);
      final read = await client.markAnnouncementRead(11);
      final redeemed = await client.redeem(
        const Sub2ApiRedeemRequest(code: ' REDEEM-31 '),
      );
      final history = await client.getRedeemHistory();
      final subscriptions = await client.getSubscriptions();
      final active = await client.getActiveSubscriptions();
      final progress = await client.getSubscriptionProgress();
      final summary = await client.getSubscriptionSummary();

      expect(announcements.single.title, 'Service update');
      expect(read.message, 'ok');
      expect(redeemed.value.toString(), '30');
      expect(redeemed.group?.name, 'Pro');
      expect(history.single.notes, 'Service credit');
      expect(subscriptions.single.monthlyUsageUsd.toString(), '8.75');
      expect(active.single.status, 'active');
      expect(progress.single.progress.daily?.remainingUsd.toString(), '8.75');
      expect(summary.totalUsedUsd.toString(), '8.75');
      expect(subscriptionReads, 4);

      expect(adapter.requests.first.queryParameters, <String, Object?>{
        'unread_only': 1,
      });
      expect(adapter.requests[2].data, <String, Object?>{'code': 'REDEEM-31'});
      expect(adapter.requests.map((request) => request.path), <String>[
        '/api/v1/announcements',
        '/api/v1/announcements/11/read',
        '/api/v1/redeem',
        '/api/v1/redeem/history',
        '/api/v1/subscriptions',
        '/api/v1/subscriptions/active',
        '/api/v1/subscriptions/progress',
        '/api/v1/subscriptions/summary',
      ]);
      for (final request in adapter.requests) {
        expect(
          request.headers,
          containsPair('Authorization', 'Bearer commerce-access-sentinel'),
        );
      }
    },
  );

  test('model plaza uses optional JWT without anonymous downgrade', () async {
    final authenticatedAdapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('commerce/model_plaza.json')),
    );
    final authenticated = _client(authenticatedAdapter, session);

    final plaza = await authenticated.getModelPlaza();

    expect(plaza.groups.single.userRateMultiplier.toString(), '0.75');
    expect(
      plaza.groups.single.models.single.pricing?.inputPrice.toString(),
      '0.00000125',
    );
    expect(
      plaza.groups.single.models.single.officialPricing?.cacheWrite1hPrice
          .toString(),
      '0.000003',
    );
    expect(
      plaza.groups.single.models.single.timePricing?.periods.single.multiplier
          .toString(),
      '1.2',
    );
    expect(authenticatedAdapter.requests.single.path, '/api/v1/model-plaza');
    expect(
      authenticatedAdapter.requests.single.headers,
      containsPair('Authorization', 'Bearer commerce-access-sentinel'),
    );

    final anonymousAdapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('commerce/model_plaza.json')),
    );
    final anonymous = _client(anonymousAdapter, null);
    await anonymous.getModelPlaza();
    expect(
      anonymousAdapter.requests.single.headers,
      isNot(contains('Authorization')),
    );
  });

  test('v1 and v2 channel monitors map typed read-only contracts', () async {
    final adapter = JsonResponseAdapter((request) {
      final fixture = switch (request.path) {
        '/api/v1/channel-monitors' => 'commerce/channel_monitors.json',
        '/api/v1/channel-monitors/51/status' =>
          'commerce/channel_monitor_detail.json',
        '/api/v1/channel-monitor-v2/dimensions' =>
          'commerce/monitor_v2_dimensions.json',
        '/api/v1/channel-monitor-v2/snapshot' =>
          'commerce/monitor_v2_snapshot.json',
        '/api/v1/channel-monitor-v2/models' =>
          'commerce/monitor_v2_models.json',
        '/api/v1/channel-monitor-v2/matrix' =>
          'commerce/monitor_v2_matrix.json',
        '/api/v1/channel-monitor-v2/errors' =>
          'commerce/monitor_v2_errors.json',
        '/api/v1/channel-monitor-v2/users' => 'commerce/monitor_v2_users.json',
        _ => throw StateError('unexpected path ${request.path}'),
      };
      return JsonResponse(body: readFixture(fixture));
    });
    final client = _client(adapter, session);
    const filter = Sub2ApiMonitorFilter(
      range: Sub2ApiMonitorRange.day,
      platforms: <String>['openai', 'anthropic'],
      groupIds: <int>[7, 9],
      models: <String>['gpt-5.6'],
    );

    final monitors = await client.getChannelMonitors();
    final detail = await client.getChannelMonitorStatus(51);
    final dimensions = await client.getMonitorDimensions(filter);
    final snapshot = await client.getMonitorSnapshot(filter);
    final models = await client.getMonitorModels(filter);
    final matrix = await client.getMonitorMatrix(
      filter,
      Sub2ApiMonitorGroupBy.platformGroupModel,
    );
    final errors = await client.getMonitorErrors(filter);
    final users = await client.getMonitorUsers(filter);

    expect(monitors.single.availability7d.toString(), '99.95');
    expect(monitors.single.latestQuota?.balance.toString(), '12.5');
    expect(detail.models.single.availability30d.toString(), '99.8');
    expect(dimensions.groups.single.id, 7);
    expect(snapshot.metrics.successRate.toString(), '0.98');
    expect(snapshot.health.score.toString(), '91.5');
    expect(models.items, isEmpty);
    expect(matrix.groupBy, Sub2ApiMonitorGroupBy.platformGroupModel);
    expect(errors.items.single.category, 'rate_or_capacity');
    expect(errors.items.single.details, isEmpty);
    expect(users.items, isEmpty);

    final query = adapter.requests[2].queryParameters;
    expect(query['range'], '24h');
    expect(query['platform'], <String>['openai', 'anthropic']);
    expect(query['group_id'], <int>[7, 9]);
    expect(query['model'], <String>['gpt-5.6']);
    expect(
      adapter.requests[5].queryParameters['group_by'],
      'platform_group_model',
    );
    expect(adapter.requests.map((request) => request.path), <String>[
      '/api/v1/channel-monitors',
      '/api/v1/channel-monitors/51/status',
      '/api/v1/channel-monitor-v2/dimensions',
      '/api/v1/channel-monitor-v2/snapshot',
      '/api/v1/channel-monitor-v2/models',
      '/api/v1/channel-monitor-v2/matrix',
      '/api/v1/channel-monitor-v2/errors',
      '/api/v1/channel-monitor-v2/users',
    ]);
  });
}

Sub2ApiCommerceClient _client(
  JsonResponseAdapter adapter,
  Sub2ApiSession? session,
) {
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
  return createSub2ApiCommerceClient(dio: dio, requestExecutor: executor);
}
