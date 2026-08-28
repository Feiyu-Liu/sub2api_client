// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_dashboard_wire_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminDashboardStatsWireDto _$AdminDashboardStatsWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardStatsWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardStatsWireDto(
      totalUsers: $checkedConvert('total_users', (v) => (v as num).toInt()),
      todayNewUsers: $checkedConvert(
        'today_new_users',
        (v) => (v as num).toInt(),
      ),
      activeUsers: $checkedConvert('active_users', (v) => (v as num).toInt()),
      hourlyActiveUsers: $checkedConvert(
        'hourly_active_users',
        (v) => (v as num).toInt(),
      ),
      statsUpdatedAt: $checkedConvert('stats_updated_at', (v) => v as String),
      statsStale: $checkedConvert('stats_stale', (v) => v as bool),
      totalApiKeys: $checkedConvert(
        'total_api_keys',
        (v) => (v as num).toInt(),
      ),
      activeApiKeys: $checkedConvert(
        'active_api_keys',
        (v) => (v as num).toInt(),
      ),
      totalAccounts: $checkedConvert(
        'total_accounts',
        (v) => (v as num).toInt(),
      ),
      normalAccounts: $checkedConvert(
        'normal_accounts',
        (v) => (v as num).toInt(),
      ),
      errorAccounts: $checkedConvert(
        'error_accounts',
        (v) => (v as num).toInt(),
      ),
      ratelimitAccounts: $checkedConvert(
        'ratelimit_accounts',
        (v) => (v as num).toInt(),
      ),
      overloadAccounts: $checkedConvert(
        'overload_accounts',
        (v) => (v as num).toInt(),
      ),
      totalRequests: $checkedConvert(
        'total_requests',
        (v) => (v as num).toInt(),
      ),
      totalInputTokens: $checkedConvert(
        'total_input_tokens',
        (v) => (v as num).toInt(),
      ),
      totalOutputTokens: $checkedConvert(
        'total_output_tokens',
        (v) => (v as num).toInt(),
      ),
      totalCacheCreationTokens: $checkedConvert(
        'total_cache_creation_tokens',
        (v) => (v as num).toInt(),
      ),
      totalCacheReadTokens: $checkedConvert(
        'total_cache_read_tokens',
        (v) => (v as num).toInt(),
      ),
      totalTokens: $checkedConvert('total_tokens', (v) => (v as num).toInt()),
      totalCost: $checkedConvert('total_cost', (v) => v as num),
      totalActualCost: $checkedConvert('total_actual_cost', (v) => v as num),
      todayRequests: $checkedConvert(
        'today_requests',
        (v) => (v as num).toInt(),
      ),
      todayInputTokens: $checkedConvert(
        'today_input_tokens',
        (v) => (v as num).toInt(),
      ),
      todayOutputTokens: $checkedConvert(
        'today_output_tokens',
        (v) => (v as num).toInt(),
      ),
      todayCacheCreationTokens: $checkedConvert(
        'today_cache_creation_tokens',
        (v) => (v as num).toInt(),
      ),
      todayCacheReadTokens: $checkedConvert(
        'today_cache_read_tokens',
        (v) => (v as num).toInt(),
      ),
      todayTokens: $checkedConvert('today_tokens', (v) => (v as num).toInt()),
      todayCost: $checkedConvert('today_cost', (v) => v as num),
      todayActualCost: $checkedConvert('today_actual_cost', (v) => v as num),
      averageDurationMs: $checkedConvert(
        'average_duration_ms',
        (v) => v as num,
      ),
      uptime: $checkedConvert('uptime', (v) => (v as num).toInt()),
      rpm: $checkedConvert('rpm', (v) => (v as num).toInt()),
      tpm: $checkedConvert('tpm', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'totalUsers': 'total_users',
    'todayNewUsers': 'today_new_users',
    'activeUsers': 'active_users',
    'hourlyActiveUsers': 'hourly_active_users',
    'statsUpdatedAt': 'stats_updated_at',
    'statsStale': 'stats_stale',
    'totalApiKeys': 'total_api_keys',
    'activeApiKeys': 'active_api_keys',
    'totalAccounts': 'total_accounts',
    'normalAccounts': 'normal_accounts',
    'errorAccounts': 'error_accounts',
    'ratelimitAccounts': 'ratelimit_accounts',
    'overloadAccounts': 'overload_accounts',
    'totalRequests': 'total_requests',
    'totalInputTokens': 'total_input_tokens',
    'totalOutputTokens': 'total_output_tokens',
    'totalCacheCreationTokens': 'total_cache_creation_tokens',
    'totalCacheReadTokens': 'total_cache_read_tokens',
    'totalTokens': 'total_tokens',
    'totalCost': 'total_cost',
    'totalActualCost': 'total_actual_cost',
    'todayRequests': 'today_requests',
    'todayInputTokens': 'today_input_tokens',
    'todayOutputTokens': 'today_output_tokens',
    'todayCacheCreationTokens': 'today_cache_creation_tokens',
    'todayCacheReadTokens': 'today_cache_read_tokens',
    'todayTokens': 'today_tokens',
    'todayCost': 'today_cost',
    'todayActualCost': 'today_actual_cost',
    'averageDurationMs': 'average_duration_ms',
  },
);

AdminDashboardSnapshotStatsWireDto _$AdminDashboardSnapshotStatsWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardSnapshotStatsWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardSnapshotStatsWireDto(
      totalUsers: $checkedConvert('total_users', (v) => (v as num).toInt()),
      todayNewUsers: $checkedConvert(
        'today_new_users',
        (v) => (v as num).toInt(),
      ),
      activeUsers: $checkedConvert('active_users', (v) => (v as num).toInt()),
      hourlyActiveUsers: $checkedConvert(
        'hourly_active_users',
        (v) => (v as num).toInt(),
      ),
      statsUpdatedAt: $checkedConvert('stats_updated_at', (v) => v as String),
      statsStale: $checkedConvert('stats_stale', (v) => v as bool),
      totalApiKeys: $checkedConvert(
        'total_api_keys',
        (v) => (v as num).toInt(),
      ),
      activeApiKeys: $checkedConvert(
        'active_api_keys',
        (v) => (v as num).toInt(),
      ),
      totalAccounts: $checkedConvert(
        'total_accounts',
        (v) => (v as num).toInt(),
      ),
      normalAccounts: $checkedConvert(
        'normal_accounts',
        (v) => (v as num).toInt(),
      ),
      errorAccounts: $checkedConvert(
        'error_accounts',
        (v) => (v as num).toInt(),
      ),
      ratelimitAccounts: $checkedConvert(
        'ratelimit_accounts',
        (v) => (v as num).toInt(),
      ),
      overloadAccounts: $checkedConvert(
        'overload_accounts',
        (v) => (v as num).toInt(),
      ),
      totalRequests: $checkedConvert(
        'total_requests',
        (v) => (v as num).toInt(),
      ),
      totalInputTokens: $checkedConvert(
        'total_input_tokens',
        (v) => (v as num).toInt(),
      ),
      totalOutputTokens: $checkedConvert(
        'total_output_tokens',
        (v) => (v as num).toInt(),
      ),
      totalCacheCreationTokens: $checkedConvert(
        'total_cache_creation_tokens',
        (v) => (v as num).toInt(),
      ),
      totalCacheReadTokens: $checkedConvert(
        'total_cache_read_tokens',
        (v) => (v as num).toInt(),
      ),
      totalTokens: $checkedConvert('total_tokens', (v) => (v as num).toInt()),
      totalCost: $checkedConvert('total_cost', (v) => v as num),
      totalActualCost: $checkedConvert('total_actual_cost', (v) => v as num),
      totalAccountCost: $checkedConvert('total_account_cost', (v) => v as num),
      todayRequests: $checkedConvert(
        'today_requests',
        (v) => (v as num).toInt(),
      ),
      todayInputTokens: $checkedConvert(
        'today_input_tokens',
        (v) => (v as num).toInt(),
      ),
      todayOutputTokens: $checkedConvert(
        'today_output_tokens',
        (v) => (v as num).toInt(),
      ),
      todayCacheCreationTokens: $checkedConvert(
        'today_cache_creation_tokens',
        (v) => (v as num).toInt(),
      ),
      todayCacheReadTokens: $checkedConvert(
        'today_cache_read_tokens',
        (v) => (v as num).toInt(),
      ),
      todayTokens: $checkedConvert('today_tokens', (v) => (v as num).toInt()),
      todayCost: $checkedConvert('today_cost', (v) => v as num),
      todayActualCost: $checkedConvert('today_actual_cost', (v) => v as num),
      todayAccountCost: $checkedConvert('today_account_cost', (v) => v as num),
      averageDurationMs: $checkedConvert(
        'average_duration_ms',
        (v) => v as num,
      ),
      rpm: $checkedConvert('rpm', (v) => (v as num).toInt()),
      tpm: $checkedConvert('tpm', (v) => (v as num).toInt()),
      uptime: $checkedConvert('uptime', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'totalUsers': 'total_users',
    'todayNewUsers': 'today_new_users',
    'activeUsers': 'active_users',
    'hourlyActiveUsers': 'hourly_active_users',
    'statsUpdatedAt': 'stats_updated_at',
    'statsStale': 'stats_stale',
    'totalApiKeys': 'total_api_keys',
    'activeApiKeys': 'active_api_keys',
    'totalAccounts': 'total_accounts',
    'normalAccounts': 'normal_accounts',
    'errorAccounts': 'error_accounts',
    'ratelimitAccounts': 'ratelimit_accounts',
    'overloadAccounts': 'overload_accounts',
    'totalRequests': 'total_requests',
    'totalInputTokens': 'total_input_tokens',
    'totalOutputTokens': 'total_output_tokens',
    'totalCacheCreationTokens': 'total_cache_creation_tokens',
    'totalCacheReadTokens': 'total_cache_read_tokens',
    'totalTokens': 'total_tokens',
    'totalCost': 'total_cost',
    'totalActualCost': 'total_actual_cost',
    'totalAccountCost': 'total_account_cost',
    'todayRequests': 'today_requests',
    'todayInputTokens': 'today_input_tokens',
    'todayOutputTokens': 'today_output_tokens',
    'todayCacheCreationTokens': 'today_cache_creation_tokens',
    'todayCacheReadTokens': 'today_cache_read_tokens',
    'todayTokens': 'today_tokens',
    'todayCost': 'today_cost',
    'todayActualCost': 'today_actual_cost',
    'todayAccountCost': 'today_account_cost',
    'averageDurationMs': 'average_duration_ms',
  },
);

AdminDashboardRealtimeWireDto _$AdminDashboardRealtimeWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardRealtimeWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardRealtimeWireDto(
      activeRequests: $checkedConvert(
        'active_requests',
        (v) => (v as num).toInt(),
      ),
      requestsPerMinute: $checkedConvert(
        'requests_per_minute',
        (v) => (v as num).toInt(),
      ),
      averageResponseTime: $checkedConvert(
        'average_response_time',
        (v) => v as num,
      ),
      errorRate: $checkedConvert('error_rate', (v) => v as num),
    );
    return val;
  },
  fieldKeyMap: const {
    'activeRequests': 'active_requests',
    'requestsPerMinute': 'requests_per_minute',
    'averageResponseTime': 'average_response_time',
    'errorRate': 'error_rate',
  },
);

AdminDashboardTrendPointWireDto _$AdminDashboardTrendPointWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardTrendPointWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardTrendPointWireDto(
      date: $checkedConvert('date', (v) => v as String),
      requests: $checkedConvert('requests', (v) => (v as num).toInt()),
      inputTokens: $checkedConvert('input_tokens', (v) => (v as num).toInt()),
      outputTokens: $checkedConvert('output_tokens', (v) => (v as num).toInt()),
      cacheCreationTokens: $checkedConvert(
        'cache_creation_tokens',
        (v) => (v as num).toInt(),
      ),
      cacheReadTokens: $checkedConvert(
        'cache_read_tokens',
        (v) => (v as num).toInt(),
      ),
      totalTokens: $checkedConvert('total_tokens', (v) => (v as num).toInt()),
      cost: $checkedConvert('cost', (v) => v as num),
      actualCost: $checkedConvert('actual_cost', (v) => v as num),
    );
    return val;
  },
  fieldKeyMap: const {
    'inputTokens': 'input_tokens',
    'outputTokens': 'output_tokens',
    'cacheCreationTokens': 'cache_creation_tokens',
    'cacheReadTokens': 'cache_read_tokens',
    'totalTokens': 'total_tokens',
    'actualCost': 'actual_cost',
  },
);

AdminDashboardModelStatsWireDto _$AdminDashboardModelStatsWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardModelStatsWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardModelStatsWireDto(
      model: $checkedConvert('model', (v) => v as String),
      requests: $checkedConvert('requests', (v) => (v as num).toInt()),
      inputTokens: $checkedConvert('input_tokens', (v) => (v as num).toInt()),
      outputTokens: $checkedConvert('output_tokens', (v) => (v as num).toInt()),
      cacheCreationTokens: $checkedConvert(
        'cache_creation_tokens',
        (v) => (v as num).toInt(),
      ),
      cacheReadTokens: $checkedConvert(
        'cache_read_tokens',
        (v) => (v as num).toInt(),
      ),
      totalTokens: $checkedConvert('total_tokens', (v) => (v as num).toInt()),
      cost: $checkedConvert('cost', (v) => v as num),
      actualCost: $checkedConvert('actual_cost', (v) => v as num),
      accountCost: $checkedConvert('account_cost', (v) => v as num),
    );
    return val;
  },
  fieldKeyMap: const {
    'inputTokens': 'input_tokens',
    'outputTokens': 'output_tokens',
    'cacheCreationTokens': 'cache_creation_tokens',
    'cacheReadTokens': 'cache_read_tokens',
    'totalTokens': 'total_tokens',
    'actualCost': 'actual_cost',
    'accountCost': 'account_cost',
  },
);

AdminDashboardGroupStatsWireDto _$AdminDashboardGroupStatsWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardGroupStatsWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardGroupStatsWireDto(
      groupId: $checkedConvert('group_id', (v) => (v as num).toInt()),
      groupName: $checkedConvert('group_name', (v) => v as String),
      requests: $checkedConvert('requests', (v) => (v as num).toInt()),
      totalTokens: $checkedConvert('total_tokens', (v) => (v as num).toInt()),
      cost: $checkedConvert('cost', (v) => v as num),
      actualCost: $checkedConvert('actual_cost', (v) => v as num),
      accountCost: $checkedConvert('account_cost', (v) => v as num),
    );
    return val;
  },
  fieldKeyMap: const {
    'groupId': 'group_id',
    'groupName': 'group_name',
    'totalTokens': 'total_tokens',
    'actualCost': 'actual_cost',
    'accountCost': 'account_cost',
  },
);

AdminDashboardTrendWireDto _$AdminDashboardTrendWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardTrendWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardTrendWireDto(
      trend: $checkedConvert(
        'trend',
        (v) => (v as List<dynamic>)
            .map(
              (e) => AdminDashboardTrendPointWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      startDate: $checkedConvert('start_date', (v) => v as String),
      endDate: $checkedConvert('end_date', (v) => v as String),
      granularity: $checkedConvert('granularity', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'startDate': 'start_date', 'endDate': 'end_date'},
);

AdminDashboardModelsWireDto _$AdminDashboardModelsWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardModelsWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardModelsWireDto(
      models: $checkedConvert(
        'models',
        (v) => (v as List<dynamic>)
            .map(
              (e) => AdminDashboardModelStatsWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      startDate: $checkedConvert('start_date', (v) => v as String),
      endDate: $checkedConvert('end_date', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'startDate': 'start_date', 'endDate': 'end_date'},
);

AdminDashboardGroupsWireDto _$AdminDashboardGroupsWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardGroupsWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardGroupsWireDto(
      groups: $checkedConvert(
        'groups',
        (v) => (v as List<dynamic>)
            .map(
              (e) => AdminDashboardGroupStatsWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      startDate: $checkedConvert('start_date', (v) => v as String),
      endDate: $checkedConvert('end_date', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'startDate': 'start_date', 'endDate': 'end_date'},
);

AdminDashboardApiKeyTrendPointWireDto
_$AdminDashboardApiKeyTrendPointWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AdminDashboardApiKeyTrendPointWireDto',
      json,
      ($checkedConvert) {
        final val = AdminDashboardApiKeyTrendPointWireDto(
          date: $checkedConvert('date', (v) => v as String),
          apiKeyId: $checkedConvert('api_key_id', (v) => (v as num).toInt()),
          keyName: $checkedConvert('key_name', (v) => v as String),
          requests: $checkedConvert('requests', (v) => (v as num).toInt()),
          tokens: $checkedConvert('tokens', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'apiKeyId': 'api_key_id', 'keyName': 'key_name'},
    );

AdminDashboardApiKeyTrendWireDto _$AdminDashboardApiKeyTrendWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardApiKeyTrendWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardApiKeyTrendWireDto(
      trend: $checkedConvert(
        'trend',
        (v) => (v as List<dynamic>)
            .map(
              (e) => AdminDashboardApiKeyTrendPointWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      startDate: $checkedConvert('start_date', (v) => v as String),
      endDate: $checkedConvert('end_date', (v) => v as String),
      granularity: $checkedConvert('granularity', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'startDate': 'start_date', 'endDate': 'end_date'},
);

AdminDashboardUserTrendPointWireDto
_$AdminDashboardUserTrendPointWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AdminDashboardUserTrendPointWireDto',
      json,
      ($checkedConvert) {
        final val = AdminDashboardUserTrendPointWireDto(
          date: $checkedConvert('date', (v) => v as String),
          userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
          email: $checkedConvert('email', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          requests: $checkedConvert('requests', (v) => (v as num).toInt()),
          tokens: $checkedConvert('tokens', (v) => (v as num).toInt()),
          cost: $checkedConvert('cost', (v) => v as num),
          actualCost: $checkedConvert('actual_cost', (v) => v as num),
        );
        return val;
      },
      fieldKeyMap: const {'userId': 'user_id', 'actualCost': 'actual_cost'},
    );

AdminDashboardUserTrendWireDto _$AdminDashboardUserTrendWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardUserTrendWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardUserTrendWireDto(
      trend: $checkedConvert(
        'trend',
        (v) => (v as List<dynamic>)
            .map(
              (e) => AdminDashboardUserTrendPointWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      startDate: $checkedConvert('start_date', (v) => v as String),
      endDate: $checkedConvert('end_date', (v) => v as String),
      granularity: $checkedConvert('granularity', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'startDate': 'start_date', 'endDate': 'end_date'},
);

AdminDashboardUserRankingItemWireDto
_$AdminDashboardUserRankingItemWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AdminDashboardUserRankingItemWireDto',
      json,
      ($checkedConvert) {
        final val = AdminDashboardUserRankingItemWireDto(
          userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
          email: $checkedConvert('email', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          actualCost: $checkedConvert('actual_cost', (v) => v as num),
          requests: $checkedConvert('requests', (v) => (v as num).toInt()),
          tokens: $checkedConvert('tokens', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'userId': 'user_id', 'actualCost': 'actual_cost'},
    );

AdminDashboardUserRankingWireDto _$AdminDashboardUserRankingWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardUserRankingWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardUserRankingWireDto(
      ranking: $checkedConvert(
        'ranking',
        (v) => (v as List<dynamic>)
            .map(
              (e) => AdminDashboardUserRankingItemWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      totalActualCost: $checkedConvert('total_actual_cost', (v) => v as num),
      totalRequests: $checkedConvert(
        'total_requests',
        (v) => (v as num).toInt(),
      ),
      totalTokens: $checkedConvert('total_tokens', (v) => (v as num).toInt()),
      startDate: $checkedConvert('start_date', (v) => v as String),
      endDate: $checkedConvert('end_date', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'totalActualCost': 'total_actual_cost',
    'totalRequests': 'total_requests',
    'totalTokens': 'total_tokens',
    'startDate': 'start_date',
    'endDate': 'end_date',
  },
);

AdminDashboardPlatformUsageWireDto _$AdminDashboardPlatformUsageWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardPlatformUsageWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardPlatformUsageWireDto(
      platform: $checkedConvert('platform', (v) => v as String),
      todayActualCost: $checkedConvert('today_actual_cost', (v) => v as num),
      totalActualCost: $checkedConvert('total_actual_cost', (v) => v as num),
    );
    return val;
  },
  fieldKeyMap: const {
    'todayActualCost': 'today_actual_cost',
    'totalActualCost': 'total_actual_cost',
  },
);

AdminDashboardBatchUserUsageWireDto
_$AdminDashboardBatchUserUsageWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardBatchUserUsageWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardBatchUserUsageWireDto(
      userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
      todayActualCost: $checkedConvert('today_actual_cost', (v) => v as num),
      totalActualCost: $checkedConvert('total_actual_cost', (v) => v as num),
      byPlatform: $checkedConvert(
        'by_platform',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => AdminDashboardPlatformUsageWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'todayActualCost': 'today_actual_cost',
    'totalActualCost': 'total_actual_cost',
    'byPlatform': 'by_platform',
  },
);

AdminDashboardBatchApiKeyUsageWireDto
_$AdminDashboardBatchApiKeyUsageWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardBatchApiKeyUsageWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardBatchApiKeyUsageWireDto(
      apiKeyId: $checkedConvert('api_key_id', (v) => (v as num).toInt()),
      todayActualCost: $checkedConvert('today_actual_cost', (v) => v as num),
      totalActualCost: $checkedConvert('total_actual_cost', (v) => v as num),
    );
    return val;
  },
  fieldKeyMap: const {
    'apiKeyId': 'api_key_id',
    'todayActualCost': 'today_actual_cost',
    'totalActualCost': 'total_actual_cost',
  },
);

AdminDashboardBatchUsersWireDto _$AdminDashboardBatchUsersWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminDashboardBatchUsersWireDto', json, ($checkedConvert) {
  final val = AdminDashboardBatchUsersWireDto(
    stats: $checkedConvert(
      'stats',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          AdminDashboardBatchUserUsageWireDto.fromJson(
            e as Map<String, dynamic>,
          ),
        ),
      ),
    ),
  );
  return val;
});

AdminDashboardBatchApiKeysWireDto _$AdminDashboardBatchApiKeysWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminDashboardBatchApiKeysWireDto', json, (
  $checkedConvert,
) {
  final val = AdminDashboardBatchApiKeysWireDto(
    stats: $checkedConvert(
      'stats',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          AdminDashboardBatchApiKeyUsageWireDto.fromJson(
            e as Map<String, dynamic>,
          ),
        ),
      ),
    ),
  );
  return val;
});

AdminDashboardUserBreakdownItemWireDto
_$AdminDashboardUserBreakdownItemWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardUserBreakdownItemWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardUserBreakdownItemWireDto(
      userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
      email: $checkedConvert('email', (v) => v as String),
      requests: $checkedConvert('requests', (v) => (v as num).toInt()),
      inputTokens: $checkedConvert('input_tokens', (v) => (v as num).toInt()),
      outputTokens: $checkedConvert('output_tokens', (v) => (v as num).toInt()),
      cacheTokens: $checkedConvert('cache_tokens', (v) => (v as num).toInt()),
      totalTokens: $checkedConvert('total_tokens', (v) => (v as num).toInt()),
      cost: $checkedConvert('cost', (v) => v as num),
      actualCost: $checkedConvert('actual_cost', (v) => v as num),
      accountCost: $checkedConvert('account_cost', (v) => v as num),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'inputTokens': 'input_tokens',
    'outputTokens': 'output_tokens',
    'cacheTokens': 'cache_tokens',
    'totalTokens': 'total_tokens',
    'actualCost': 'actual_cost',
    'accountCost': 'account_cost',
  },
);

AdminDashboardUserBreakdownWireDto _$AdminDashboardUserBreakdownWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardUserBreakdownWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardUserBreakdownWireDto(
      users: $checkedConvert(
        'users',
        (v) => (v as List<dynamic>)
            .map(
              (e) => AdminDashboardUserBreakdownItemWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      startDate: $checkedConvert('start_date', (v) => v as String),
      endDate: $checkedConvert('end_date', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'startDate': 'start_date', 'endDate': 'end_date'},
);

AdminDashboardSnapshotWireDto _$AdminDashboardSnapshotWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminDashboardSnapshotWireDto',
  json,
  ($checkedConvert) {
    final val = AdminDashboardSnapshotWireDto(
      generatedAt: $checkedConvert('generated_at', (v) => v as String),
      startDate: $checkedConvert('start_date', (v) => v as String),
      endDate: $checkedConvert('end_date', (v) => v as String),
      granularity: $checkedConvert('granularity', (v) => v as String),
      stats: $checkedConvert(
        'stats',
        (v) => v == null
            ? null
            : AdminDashboardSnapshotStatsWireDto.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      trend: $checkedConvert(
        'trend',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => AdminDashboardTrendPointWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      models: $checkedConvert(
        'models',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => AdminDashboardModelStatsWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      groups: $checkedConvert(
        'groups',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => AdminDashboardGroupStatsWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      usersTrend: $checkedConvert(
        'users_trend',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => AdminDashboardUserTrendPointWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'generatedAt': 'generated_at',
    'startDate': 'start_date',
    'endDate': 'end_date',
    'usersTrend': 'users_trend',
  },
);

AdminDashboardBackfillResultWireDto
_$AdminDashboardBackfillResultWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminDashboardBackfillResultWireDto', json, (
      $checkedConvert,
    ) {
      final val = AdminDashboardBackfillResultWireDto(
        status: $checkedConvert('status', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$AdminDashboardBackfillRequestWireDtoToJson(
  AdminDashboardBackfillRequestWireDto instance,
) => <String, dynamic>{'start': instance.start, 'end': instance.end};

Map<String, dynamic> _$AdminDashboardUserIdsWireDtoToJson(
  AdminDashboardUserIdsWireDto instance,
) => <String, dynamic>{'user_ids': instance.userIds};

Map<String, dynamic> _$AdminDashboardApiKeyIdsWireDtoToJson(
  AdminDashboardApiKeyIdsWireDto instance,
) => <String, dynamic>{'api_key_ids': instance.apiKeyIds};
