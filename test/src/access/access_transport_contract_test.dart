import 'package:dio/dio.dart';
import 'package:sub2api_client/src/client/sub2api_client.dart'
    show createSub2ApiClientForTesting;
import 'package:sub2api_client/sub2api_client.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';
import '../../support/recording_session_store.dart';

void main() {
  const session = Sub2ApiSession(
    accessToken: Sub2ApiAccessToken('access-resource-token-sentinel'),
    scope: 'https://sub2api.test',
  );

  test('daily key usage maps dates, token counts, and exact costs', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('access/api_key_daily_usage.json')),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);

    final usage = await client.access.getApiKeyDailyUsage(
      const Sub2ApiApiKeyDailyUsageRequest(
        apiKeyId: 7,
        days: 7,
        timezone: 'Asia/Shanghai',
      ),
    );

    expect(usage.days, 7);
    expect(usage.startDate, DateTime.utc(2026, 8, 20));
    expect(usage.endDate, DateTime.utc(2026, 8, 26));
    expect(usage.items.single.date, DateTime.utc(2026, 8, 26));
    expect(usage.items.single.totalTokens, 1375);
    expect(usage.items.single.cost.toString(), '1.25');
    expect(usage.items.single.actualCost.toString(), '0.875');
    final sent = adapter.requests.single;
    expect(sent.method, 'GET');
    expect(sent.path, '/api/v1/user/api-keys/7/usage/daily');
    expect(sent.queryParameters, <String, Object?>{
      'days': 7,
      'timezone': 'Asia/Shanghai',
    });
  });

  test('available groups preserve the full user-visible contract', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('access/groups_available.json')),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);

    final groups = await client.access.getAvailableGroups();

    expect(groups, hasLength(1));
    final group = groups.single;
    expect(group.id, 7);
    expect(group.rateMultiplier.toString(), '0.8');
    expect(group.dailyLimitUsd.toString(), '10');
    expect(group.videoModelPrices['grok-video']?['1080p'].toString(), '0.13');
    expect(group.reasoningEffortMappings.single.from, 'xhigh');
    expect(group.allowMessagesDispatch, isTrue);
    expect(adapter.requests.single.path, '/api/v1/groups/available');
  });

  test(
    'custom group rates map positive JSON keys to exact multipliers',
    () async {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(body: readFixture('access/group_rates.json')),
      );
      final client = _client(adapter, session);
      addTearDown(client.close);

      final rates = await client.access.getGroupRates();

      expect(rates[2].toString(), '1.1');
      expect(rates[7].toString(), '0.75');
      expect(adapter.requests.single.path, '/api/v1/groups/rates');
    },
  );

  test('platform quotas map three exact rolling windows', () async {
    final adapter = JsonResponseAdapter(
      (_) => JsonResponse(body: readFixture('access/platform_quotas.json')),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);

    final quotas = await client.access.getPlatformQuotas();

    expect(quotas, hasLength(1));
    final quota = quotas.single;
    expect(quota.platform, 'openai');
    expect(quota.daily.usage.toString(), '1.25');
    expect(quota.daily.limit.toString(), '10');
    expect(quota.weekly.resetsAt, DateTime.utc(2026, 9, 1));
    expect(quota.monthly.limit, isNull);
    expect(quota.monthly.usage.toString(), '20.75');
    expect(adapter.requests.single.path, '/api/v1/user/platform-quotas');
  });

  test(
    'available channels preserve platform, group, model and pricing facts',
    () async {
      final adapter = JsonResponseAdapter(
        (_) =>
            JsonResponse(body: readFixture('access/channels_available.json')),
      );
      final client = _client(adapter, session);
      addTearDown(client.close);

      final channels = await client.access.getAvailableChannels();

      expect(channels, hasLength(1));
      final channel = channels.single;
      expect(channel.name, 'Primary Channel');
      final section = channel.platforms.single;
      expect(section.platform, 'openai');
      expect(section.groups.single.rateMultiplier.toString(), '0.8');
      final model = section.supportedModels.single;
      expect(model.name, 'gpt-5.6');
      expect(model.pricing?.inputPrice.toString(), '1.25');
      expect(model.pricing?.intervals.single.maxTokens, 200000);
      expect(
        model.pricing?.intervals.single.cacheReadPrice.toString(),
        '0.125',
      );
      expect(adapter.requests.single.path, '/api/v1/channels/available');
    },
  );

  test('invalid API key ID is rejected before network I/O', () async {
    final adapter = JsonResponseAdapter(
      (_) => throw StateError('network must not be reached'),
    );
    final client = _client(adapter, session);
    addTearDown(client.close);

    expect(
      () => client.access.getApiKeyDailyUsage(
        const Sub2ApiApiKeyDailyUsageRequest(apiKeyId: 0),
      ),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'access.invalid_api_key_id',
        ),
      ),
    );
    expect(adapter.requests, isEmpty);
  });

  test('days outside 1 through 90 are rejected before network I/O', () async {
    for (final days in <int>[0, 91]) {
      final adapter = JsonResponseAdapter(
        (_) => throw StateError('network must not be reached'),
      );
      final client = _client(adapter, session);
      addTearDown(client.close);

      expect(
        () => client.access.getApiKeyDailyUsage(
          Sub2ApiApiKeyDailyUsageRequest(apiKeyId: 7, days: days),
        ),
        throwsA(
          isA<Sub2ApiException>().having(
            (error) => error.code,
            'code',
            'access.invalid_days',
          ),
        ),
      );
      expect(adapter.requests, isEmpty);
    }
  });

  test('malformed or non-positive group-rate keys fail closed', () async {
    for (final key in <String>['not-an-id', '0', '-2']) {
      final adapter = JsonResponseAdapter(
        (_) => JsonResponse(
          body: <String, Object?>{
            'code': 0,
            'message': 'success',
            'data': <String, Object?>{key: 1},
          },
        ),
      );
      final client = _client(adapter, session);
      addTearDown(client.close);

      await expectLater(
        client.access.getGroupRates(),
        throwsA(
          isA<Sub2ApiException>().having(
            (error) => error.code,
            'code',
            'protocol.invalid_group_rates',
          ),
        ),
      );
    }
  });
}

Sub2ApiClient _client(JsonResponseAdapter adapter, Sub2ApiSession session) {
  final configuration = Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.test'),
  );
  final dio = Dio(BaseOptions(baseUrl: configuration.origin.toString()))
    ..httpClientAdapter = adapter;
  return createSub2ApiClientForTesting(
    configuration: configuration,
    sessionStore: RecordingSessionStore(session),
    dio: dio,
  );
}
