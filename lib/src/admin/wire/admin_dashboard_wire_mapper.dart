import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../sub2api_admin_models.dart';
import 'admin_dashboard_wire_dto.dart';

Sub2ApiAdminDashboardStats mapAdminDashboardStats(Object? data) => _map(() {
  final source = AdminDashboardStatsWireDto.fromJson(_requireMap(data));
  return Sub2ApiAdminDashboardStats(
    totalUsers: source.totalUsers,
    todayNewUsers: source.todayNewUsers,
    activeUsers: source.activeUsers,
    hourlyActiveUsers: source.hourlyActiveUsers,
    statsUpdatedAt: _dateTime(source.statsUpdatedAt),
    statsStale: source.statsStale,
    totalApiKeys: source.totalApiKeys,
    activeApiKeys: source.activeApiKeys,
    totalAccounts: source.totalAccounts,
    normalAccounts: source.normalAccounts,
    errorAccounts: source.errorAccounts,
    rateLimitAccounts: source.ratelimitAccounts,
    overloadAccounts: source.overloadAccounts,
    totalRequests: source.totalRequests,
    totalInputTokens: source.totalInputTokens,
    totalOutputTokens: source.totalOutputTokens,
    totalCacheCreationTokens: source.totalCacheCreationTokens,
    totalCacheReadTokens: source.totalCacheReadTokens,
    totalTokens: source.totalTokens,
    totalCost: Sub2ApiDecimal.fromJson(source.totalCost),
    totalActualCost: Sub2ApiDecimal.fromJson(source.totalActualCost),
    todayRequests: source.todayRequests,
    todayInputTokens: source.todayInputTokens,
    todayOutputTokens: source.todayOutputTokens,
    todayCacheCreationTokens: source.todayCacheCreationTokens,
    todayCacheReadTokens: source.todayCacheReadTokens,
    todayTokens: source.todayTokens,
    todayCost: Sub2ApiDecimal.fromJson(source.todayCost),
    todayActualCost: Sub2ApiDecimal.fromJson(source.todayActualCost),
    averageDurationMs: Sub2ApiDecimal.fromJson(source.averageDurationMs),
    uptime: source.uptime,
    rpm: source.rpm,
    tpm: source.tpm,
  );
});

Sub2ApiAdminDashboardRealtimeMetrics mapAdminDashboardRealtime(Object? data) =>
    _map(() {
      final source = AdminDashboardRealtimeWireDto.fromJson(_requireMap(data));
      return Sub2ApiAdminDashboardRealtimeMetrics(
        activeRequests: source.activeRequests,
        requestsPerMinute: source.requestsPerMinute,
        averageResponseTime: Sub2ApiDecimal.fromJson(
          source.averageResponseTime,
        ),
        errorRate: Sub2ApiDecimal.fromJson(source.errorRate),
      );
    });

Sub2ApiAdminDashboardTrend mapAdminDashboardTrend(Object? data) => _map(() {
  final source = AdminDashboardTrendWireDto.fromJson(_requireMap(data));
  return Sub2ApiAdminDashboardTrend(
    points: source.trend.map(_trendPoint).toList(growable: false),
    startDate: _dateOnly(source.startDate),
    endDate: _dateOnly(source.endDate),
    granularity: _granularity(source.granularity),
  );
});

Sub2ApiAdminDashboardModels mapAdminDashboardModels(Object? data) => _map(() {
  final source = AdminDashboardModelsWireDto.fromJson(_requireMap(data));
  return Sub2ApiAdminDashboardModels(
    models: source.models.map(_modelStats).toList(growable: false),
    startDate: _dateOnly(source.startDate),
    endDate: _dateOnly(source.endDate),
  );
});

Sub2ApiAdminDashboardGroups mapAdminDashboardGroups(Object? data) => _map(() {
  final source = AdminDashboardGroupsWireDto.fromJson(_requireMap(data));
  return Sub2ApiAdminDashboardGroups(
    groups: source.groups.map(_groupStats).toList(growable: false),
    startDate: _dateOnly(source.startDate),
    endDate: _dateOnly(source.endDate),
  );
});

Sub2ApiAdminApiKeyUsageTrend mapAdminDashboardApiKeyTrend(Object? data) => _map(
  () {
    final source = AdminDashboardApiKeyTrendWireDto.fromJson(_requireMap(data));
    return Sub2ApiAdminApiKeyUsageTrend(
      points: source.trend
          .map(
            (point) => Sub2ApiAdminApiKeyUsageTrendPoint(
              date: point.date,
              apiKeyId: point.apiKeyId,
              keyName: point.keyName,
              requests: point.requests,
              tokens: point.tokens,
            ),
          )
          .toList(growable: false),
      startDate: _dateOnly(source.startDate),
      endDate: _dateOnly(source.endDate),
      granularity: _granularity(source.granularity),
    );
  },
);

Sub2ApiAdminUserUsageTrend mapAdminDashboardUserTrend(Object? data) => _map(() {
  final source = AdminDashboardUserTrendWireDto.fromJson(_requireMap(data));
  return Sub2ApiAdminUserUsageTrend(
    points: source.trend.map(_userTrendPoint).toList(growable: false),
    startDate: _dateOnly(source.startDate),
    endDate: _dateOnly(source.endDate),
    granularity: _granularity(source.granularity),
  );
});

Sub2ApiAdminUserSpendingRanking mapAdminDashboardUserRanking(Object? data) =>
    _map(() {
      final source = AdminDashboardUserRankingWireDto.fromJson(
        _requireMap(data),
      );
      return Sub2ApiAdminUserSpendingRanking(
        ranking: source.ranking
            .map(
              (item) => Sub2ApiAdminUserSpendingRankingItem(
                userId: item.userId,
                email: item.email,
                username: item.username,
                actualCost: Sub2ApiDecimal.fromJson(item.actualCost),
                requests: item.requests,
                tokens: item.tokens,
              ),
            )
            .toList(growable: false),
        totalActualCost: Sub2ApiDecimal.fromJson(source.totalActualCost),
        totalRequests: source.totalRequests,
        totalTokens: source.totalTokens,
        startDate: _dateOnly(source.startDate),
        endDate: _dateOnly(source.endDate),
      );
    });

Map<int, Sub2ApiAdminBatchUserUsageStats> mapAdminDashboardBatchUsers(
  Object? data,
) => _map(() {
  final source = AdminDashboardBatchUsersWireDto.fromJson(_requireMap(data));
  final result = <int, Sub2ApiAdminBatchUserUsageStats>{};
  for (final entry in source.stats.entries) {
    final id = int.tryParse(entry.key);
    if (id == null || id <= 0 || entry.value.userId != id) {
      throw _invalidAdminDashboard;
    }
    result[id] = Sub2ApiAdminBatchUserUsageStats(
      userId: id,
      todayActualCost: Sub2ApiDecimal.fromJson(entry.value.todayActualCost),
      totalActualCost: Sub2ApiDecimal.fromJson(entry.value.totalActualCost),
      byPlatform: entry.value.byPlatform
          ?.map(
            (platform) => Sub2ApiAdminPlatformUsage(
              platform: platform.platform,
              todayActualCost: Sub2ApiDecimal.fromJson(
                platform.todayActualCost,
              ),
              totalActualCost: Sub2ApiDecimal.fromJson(
                platform.totalActualCost,
              ),
            ),
          )
          .toList(growable: false),
    );
  }
  return Map<int, Sub2ApiAdminBatchUserUsageStats>.unmodifiable(result);
});

Map<int, Sub2ApiAdminBatchApiKeyUsageStats> mapAdminDashboardBatchApiKeys(
  Object? data,
) => _map(() {
  final source = AdminDashboardBatchApiKeysWireDto.fromJson(_requireMap(data));
  final result = <int, Sub2ApiAdminBatchApiKeyUsageStats>{};
  for (final entry in source.stats.entries) {
    final id = int.tryParse(entry.key);
    if (id == null || id <= 0 || entry.value.apiKeyId != id) {
      throw _invalidAdminDashboard;
    }
    result[id] = Sub2ApiAdminBatchApiKeyUsageStats(
      apiKeyId: id,
      todayActualCost: Sub2ApiDecimal.fromJson(entry.value.todayActualCost),
      totalActualCost: Sub2ApiDecimal.fromJson(entry.value.totalActualCost),
    );
  }
  return Map<int, Sub2ApiAdminBatchApiKeyUsageStats>.unmodifiable(result);
});

Sub2ApiAdminUserBreakdown mapAdminDashboardUserBreakdown(Object? data) =>
    _map(() {
      final source = AdminDashboardUserBreakdownWireDto.fromJson(
        _requireMap(data),
      );
      return Sub2ApiAdminUserBreakdown(
        users: source.users
            .map(
              (item) => Sub2ApiAdminUserBreakdownItem(
                userId: item.userId,
                email: item.email,
                requests: item.requests,
                inputTokens: item.inputTokens,
                outputTokens: item.outputTokens,
                cacheTokens: item.cacheTokens,
                totalTokens: item.totalTokens,
                cost: Sub2ApiDecimal.fromJson(item.cost),
                actualCost: Sub2ApiDecimal.fromJson(item.actualCost),
                accountCost: Sub2ApiDecimal.fromJson(item.accountCost),
              ),
            )
            .toList(growable: false),
        startDate: _dateOnly(source.startDate),
        endDate: _dateOnly(source.endDate),
      );
    });

Sub2ApiAdminDashboardSnapshot mapAdminDashboardSnapshot(Object? data) =>
    _map(() {
      final source = AdminDashboardSnapshotWireDto.fromJson(_requireMap(data));
      return Sub2ApiAdminDashboardSnapshot(
        generatedAt: _dateTime(source.generatedAt),
        startDate: _dateOnly(source.startDate),
        endDate: _dateOnly(source.endDate),
        granularity: _granularity(source.granularity),
        stats: source.stats == null ? null : _snapshotStats(source.stats!),
        trend: source.trend?.map(_trendPoint).toList(growable: false),
        models: source.models?.map(_modelStats).toList(growable: false),
        groups: source.groups?.map(_groupStats).toList(growable: false),
        usersTrend: source.usersTrend
            ?.map(_userTrendPoint)
            .toList(growable: false),
      );
    });

Sub2ApiAdminAggregationBackfillResult mapAdminDashboardBackfill(Object? data) =>
    _map(() {
      final source = AdminDashboardBackfillResultWireDto.fromJson(
        _requireMap(data),
      );
      if (source.status.isEmpty) throw _invalidAdminDashboard;
      return Sub2ApiAdminAggregationBackfillResult(status: source.status);
    });

Sub2ApiAdminDashboardTrendPoint _trendPoint(
  AdminDashboardTrendPointWireDto source,
) => Sub2ApiAdminDashboardTrendPoint(
  date: source.date,
  requests: source.requests,
  inputTokens: source.inputTokens,
  outputTokens: source.outputTokens,
  cacheCreationTokens: source.cacheCreationTokens,
  cacheReadTokens: source.cacheReadTokens,
  totalTokens: source.totalTokens,
  cost: Sub2ApiDecimal.fromJson(source.cost),
  actualCost: Sub2ApiDecimal.fromJson(source.actualCost),
);

Sub2ApiAdminDashboardModelStats _modelStats(
  AdminDashboardModelStatsWireDto source,
) => Sub2ApiAdminDashboardModelStats(
  model: source.model,
  requests: source.requests,
  inputTokens: source.inputTokens,
  outputTokens: source.outputTokens,
  cacheCreationTokens: source.cacheCreationTokens,
  cacheReadTokens: source.cacheReadTokens,
  totalTokens: source.totalTokens,
  cost: Sub2ApiDecimal.fromJson(source.cost),
  actualCost: Sub2ApiDecimal.fromJson(source.actualCost),
  accountCost: Sub2ApiDecimal.fromJson(source.accountCost),
);

Sub2ApiAdminDashboardGroupStats _groupStats(
  AdminDashboardGroupStatsWireDto source,
) => Sub2ApiAdminDashboardGroupStats(
  groupId: source.groupId,
  groupName: source.groupName,
  requests: source.requests,
  totalTokens: source.totalTokens,
  cost: Sub2ApiDecimal.fromJson(source.cost),
  actualCost: Sub2ApiDecimal.fromJson(source.actualCost),
  accountCost: Sub2ApiDecimal.fromJson(source.accountCost),
);

Sub2ApiAdminUserUsageTrendPoint _userTrendPoint(
  AdminDashboardUserTrendPointWireDto source,
) => Sub2ApiAdminUserUsageTrendPoint(
  date: source.date,
  userId: source.userId,
  email: source.email,
  username: source.username,
  requests: source.requests,
  tokens: source.tokens,
  cost: Sub2ApiDecimal.fromJson(source.cost),
  actualCost: Sub2ApiDecimal.fromJson(source.actualCost),
);

Sub2ApiAdminDashboardSnapshotStats _snapshotStats(
  AdminDashboardSnapshotStatsWireDto source,
) => Sub2ApiAdminDashboardSnapshotStats(
  totalUsers: source.totalUsers,
  todayNewUsers: source.todayNewUsers,
  activeUsers: source.activeUsers,
  hourlyActiveUsers: source.hourlyActiveUsers,
  statsUpdatedAt: _dateTime(source.statsUpdatedAt),
  statsStale: source.statsStale,
  totalApiKeys: source.totalApiKeys,
  activeApiKeys: source.activeApiKeys,
  totalAccounts: source.totalAccounts,
  normalAccounts: source.normalAccounts,
  errorAccounts: source.errorAccounts,
  rateLimitAccounts: source.ratelimitAccounts,
  overloadAccounts: source.overloadAccounts,
  totalRequests: source.totalRequests,
  totalInputTokens: source.totalInputTokens,
  totalOutputTokens: source.totalOutputTokens,
  totalCacheCreationTokens: source.totalCacheCreationTokens,
  totalCacheReadTokens: source.totalCacheReadTokens,
  totalTokens: source.totalTokens,
  totalCost: Sub2ApiDecimal.fromJson(source.totalCost),
  totalActualCost: Sub2ApiDecimal.fromJson(source.totalActualCost),
  totalAccountCost: Sub2ApiDecimal.fromJson(source.totalAccountCost),
  todayRequests: source.todayRequests,
  todayInputTokens: source.todayInputTokens,
  todayOutputTokens: source.todayOutputTokens,
  todayCacheCreationTokens: source.todayCacheCreationTokens,
  todayCacheReadTokens: source.todayCacheReadTokens,
  todayTokens: source.todayTokens,
  todayCost: Sub2ApiDecimal.fromJson(source.todayCost),
  todayActualCost: Sub2ApiDecimal.fromJson(source.todayActualCost),
  todayAccountCost: Sub2ApiDecimal.fromJson(source.todayAccountCost),
  averageDurationMs: Sub2ApiDecimal.fromJson(source.averageDurationMs),
  rpm: source.rpm,
  tpm: source.tpm,
  uptime: source.uptime,
);

Map<String, Object?> _requireMap(Object? value) {
  if (value is! Map) throw _invalidAdminDashboard;
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) throw _invalidAdminDashboard;
    result[entry.key as String] = entry.value;
  }
  return result;
}

DateTime _dateOnly(String value) {
  final match = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$').firstMatch(value);
  if (match == null) throw _invalidAdminDashboard;
  return DateTime.utc(
    int.parse(match.group(1)!),
    int.parse(match.group(2)!),
    int.parse(match.group(3)!),
  );
}

DateTime _dateTime(String value) {
  final parsed = DateTime.tryParse(value);
  if (parsed == null) throw _invalidAdminDashboard;
  return parsed.toUtc();
}

Sub2ApiAdminUsageGranularity _granularity(String value) => switch (value) {
  'day' => Sub2ApiAdminUsageGranularity.day,
  'hour' => Sub2ApiAdminUsageGranularity.hour,
  _ => throw _invalidAdminDashboard,
};

T _map<T>(T Function() convert) {
  try {
    return convert();
  } on Sub2ApiException {
    rethrow;
  } on Object {
    throw _invalidAdminDashboard;
  }
}

const _invalidAdminDashboard = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_dashboard_response',
  retryable: false,
);
