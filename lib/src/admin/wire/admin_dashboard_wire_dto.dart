import 'package:json_annotation/json_annotation.dart';

part 'admin_dashboard_wire_dto.g.dart';

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardStatsWireDto {
  const AdminDashboardStatsWireDto({
    required this.totalUsers,
    required this.todayNewUsers,
    required this.activeUsers,
    required this.hourlyActiveUsers,
    required this.statsUpdatedAt,
    required this.statsStale,
    required this.totalApiKeys,
    required this.activeApiKeys,
    required this.totalAccounts,
    required this.normalAccounts,
    required this.errorAccounts,
    required this.ratelimitAccounts,
    required this.overloadAccounts,
    required this.totalRequests,
    required this.totalInputTokens,
    required this.totalOutputTokens,
    required this.totalCacheCreationTokens,
    required this.totalCacheReadTokens,
    required this.totalTokens,
    required this.totalCost,
    required this.totalActualCost,
    required this.todayRequests,
    required this.todayInputTokens,
    required this.todayOutputTokens,
    required this.todayCacheCreationTokens,
    required this.todayCacheReadTokens,
    required this.todayTokens,
    required this.todayCost,
    required this.todayActualCost,
    required this.averageDurationMs,
    required this.uptime,
    required this.rpm,
    required this.tpm,
  });

  factory AdminDashboardStatsWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminDashboardStatsWireDtoFromJson(json);

  final int totalUsers;
  final int todayNewUsers;
  final int activeUsers;
  final int hourlyActiveUsers;
  final String statsUpdatedAt;
  final bool statsStale;
  final int totalApiKeys;
  final int activeApiKeys;
  final int totalAccounts;
  final int normalAccounts;
  final int errorAccounts;
  @JsonKey(name: 'ratelimit_accounts')
  final int ratelimitAccounts;
  final int overloadAccounts;
  final int totalRequests;
  final int totalInputTokens;
  final int totalOutputTokens;
  final int totalCacheCreationTokens;
  final int totalCacheReadTokens;
  final int totalTokens;
  final num totalCost;
  final num totalActualCost;
  final int todayRequests;
  final int todayInputTokens;
  final int todayOutputTokens;
  final int todayCacheCreationTokens;
  final int todayCacheReadTokens;
  final int todayTokens;
  final num todayCost;
  final num todayActualCost;
  final num averageDurationMs;
  final int uptime;
  final int rpm;
  final int tpm;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardSnapshotStatsWireDto {
  const AdminDashboardSnapshotStatsWireDto({
    required this.totalUsers,
    required this.todayNewUsers,
    required this.activeUsers,
    required this.hourlyActiveUsers,
    required this.statsUpdatedAt,
    required this.statsStale,
    required this.totalApiKeys,
    required this.activeApiKeys,
    required this.totalAccounts,
    required this.normalAccounts,
    required this.errorAccounts,
    required this.ratelimitAccounts,
    required this.overloadAccounts,
    required this.totalRequests,
    required this.totalInputTokens,
    required this.totalOutputTokens,
    required this.totalCacheCreationTokens,
    required this.totalCacheReadTokens,
    required this.totalTokens,
    required this.totalCost,
    required this.totalActualCost,
    required this.totalAccountCost,
    required this.todayRequests,
    required this.todayInputTokens,
    required this.todayOutputTokens,
    required this.todayCacheCreationTokens,
    required this.todayCacheReadTokens,
    required this.todayTokens,
    required this.todayCost,
    required this.todayActualCost,
    required this.todayAccountCost,
    required this.averageDurationMs,
    required this.rpm,
    required this.tpm,
    required this.uptime,
  });

  factory AdminDashboardSnapshotStatsWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminDashboardSnapshotStatsWireDtoFromJson(json);

  final int totalUsers;
  final int todayNewUsers;
  final int activeUsers;
  final int hourlyActiveUsers;
  final String statsUpdatedAt;
  final bool statsStale;
  final int totalApiKeys;
  final int activeApiKeys;
  final int totalAccounts;
  final int normalAccounts;
  final int errorAccounts;
  @JsonKey(name: 'ratelimit_accounts')
  final int ratelimitAccounts;
  final int overloadAccounts;
  final int totalRequests;
  final int totalInputTokens;
  final int totalOutputTokens;
  final int totalCacheCreationTokens;
  final int totalCacheReadTokens;
  final int totalTokens;
  final num totalCost;
  final num totalActualCost;
  final num totalAccountCost;
  final int todayRequests;
  final int todayInputTokens;
  final int todayOutputTokens;
  final int todayCacheCreationTokens;
  final int todayCacheReadTokens;
  final int todayTokens;
  final num todayCost;
  final num todayActualCost;
  final num todayAccountCost;
  final num averageDurationMs;
  final int rpm;
  final int tpm;
  final int uptime;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardRealtimeWireDto {
  const AdminDashboardRealtimeWireDto({
    required this.activeRequests,
    required this.requestsPerMinute,
    required this.averageResponseTime,
    required this.errorRate,
  });

  factory AdminDashboardRealtimeWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminDashboardRealtimeWireDtoFromJson(json);

  final int activeRequests;
  final int requestsPerMinute;
  final num averageResponseTime;
  final num errorRate;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardTrendPointWireDto {
  const AdminDashboardTrendPointWireDto({
    required this.date,
    required this.requests,
    required this.inputTokens,
    required this.outputTokens,
    required this.cacheCreationTokens,
    required this.cacheReadTokens,
    required this.totalTokens,
    required this.cost,
    required this.actualCost,
  });

  factory AdminDashboardTrendPointWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminDashboardTrendPointWireDtoFromJson(json);

  final String date;
  final int requests;
  final int inputTokens;
  final int outputTokens;
  final int cacheCreationTokens;
  final int cacheReadTokens;
  final int totalTokens;
  final num cost;
  final num actualCost;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardModelStatsWireDto {
  const AdminDashboardModelStatsWireDto({
    required this.model,
    required this.requests,
    required this.inputTokens,
    required this.outputTokens,
    required this.cacheCreationTokens,
    required this.cacheReadTokens,
    required this.totalTokens,
    required this.cost,
    required this.actualCost,
    required this.accountCost,
  });

  factory AdminDashboardModelStatsWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminDashboardModelStatsWireDtoFromJson(json);

  final String model;
  final int requests;
  final int inputTokens;
  final int outputTokens;
  final int cacheCreationTokens;
  final int cacheReadTokens;
  final int totalTokens;
  final num cost;
  final num actualCost;
  final num accountCost;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardGroupStatsWireDto {
  const AdminDashboardGroupStatsWireDto({
    required this.groupId,
    required this.groupName,
    required this.requests,
    required this.totalTokens,
    required this.cost,
    required this.actualCost,
    required this.accountCost,
  });

  factory AdminDashboardGroupStatsWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminDashboardGroupStatsWireDtoFromJson(json);

  final int groupId;
  final String groupName;
  final int requests;
  final int totalTokens;
  final num cost;
  final num actualCost;
  final num accountCost;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardTrendWireDto {
  const AdminDashboardTrendWireDto({
    required this.trend,
    required this.startDate,
    required this.endDate,
    required this.granularity,
  });

  factory AdminDashboardTrendWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminDashboardTrendWireDtoFromJson(json);

  final List<AdminDashboardTrendPointWireDto> trend;
  final String startDate;
  final String endDate;
  final String granularity;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardModelsWireDto {
  const AdminDashboardModelsWireDto({
    required this.models,
    required this.startDate,
    required this.endDate,
  });

  factory AdminDashboardModelsWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminDashboardModelsWireDtoFromJson(json);

  final List<AdminDashboardModelStatsWireDto> models;
  final String startDate;
  final String endDate;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardGroupsWireDto {
  const AdminDashboardGroupsWireDto({
    required this.groups,
    required this.startDate,
    required this.endDate,
  });

  factory AdminDashboardGroupsWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminDashboardGroupsWireDtoFromJson(json);

  final List<AdminDashboardGroupStatsWireDto> groups;
  final String startDate;
  final String endDate;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardApiKeyTrendPointWireDto {
  const AdminDashboardApiKeyTrendPointWireDto({
    required this.date,
    required this.apiKeyId,
    required this.keyName,
    required this.requests,
    required this.tokens,
  });

  factory AdminDashboardApiKeyTrendPointWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminDashboardApiKeyTrendPointWireDtoFromJson(json);

  final String date;
  final int apiKeyId;
  final String keyName;
  final int requests;
  final int tokens;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardApiKeyTrendWireDto {
  const AdminDashboardApiKeyTrendWireDto({
    required this.trend,
    required this.startDate,
    required this.endDate,
    required this.granularity,
  });

  factory AdminDashboardApiKeyTrendWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminDashboardApiKeyTrendWireDtoFromJson(json);

  final List<AdminDashboardApiKeyTrendPointWireDto> trend;
  final String startDate;
  final String endDate;
  final String granularity;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardUserTrendPointWireDto {
  const AdminDashboardUserTrendPointWireDto({
    required this.date,
    required this.userId,
    required this.email,
    required this.username,
    required this.requests,
    required this.tokens,
    required this.cost,
    required this.actualCost,
  });

  factory AdminDashboardUserTrendPointWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminDashboardUserTrendPointWireDtoFromJson(json);

  final String date;
  final int userId;
  final String email;
  final String username;
  final int requests;
  final int tokens;
  final num cost;
  final num actualCost;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardUserTrendWireDto {
  const AdminDashboardUserTrendWireDto({
    required this.trend,
    required this.startDate,
    required this.endDate,
    required this.granularity,
  });

  factory AdminDashboardUserTrendWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminDashboardUserTrendWireDtoFromJson(json);

  final List<AdminDashboardUserTrendPointWireDto> trend;
  final String startDate;
  final String endDate;
  final String granularity;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardUserRankingItemWireDto {
  const AdminDashboardUserRankingItemWireDto({
    required this.userId,
    required this.email,
    required this.username,
    required this.actualCost,
    required this.requests,
    required this.tokens,
  });

  factory AdminDashboardUserRankingItemWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminDashboardUserRankingItemWireDtoFromJson(json);

  final int userId;
  final String email;
  final String username;
  final num actualCost;
  final int requests;
  final int tokens;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardUserRankingWireDto {
  const AdminDashboardUserRankingWireDto({
    required this.ranking,
    required this.totalActualCost,
    required this.totalRequests,
    required this.totalTokens,
    required this.startDate,
    required this.endDate,
  });

  factory AdminDashboardUserRankingWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminDashboardUserRankingWireDtoFromJson(json);

  final List<AdminDashboardUserRankingItemWireDto> ranking;
  final num totalActualCost;
  final int totalRequests;
  final int totalTokens;
  final String startDate;
  final String endDate;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardPlatformUsageWireDto {
  const AdminDashboardPlatformUsageWireDto({
    required this.platform,
    required this.todayActualCost,
    required this.totalActualCost,
  });

  factory AdminDashboardPlatformUsageWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminDashboardPlatformUsageWireDtoFromJson(json);

  final String platform;
  final num todayActualCost;
  final num totalActualCost;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardBatchUserUsageWireDto {
  const AdminDashboardBatchUserUsageWireDto({
    required this.userId,
    required this.todayActualCost,
    required this.totalActualCost,
    this.byPlatform,
  });

  factory AdminDashboardBatchUserUsageWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminDashboardBatchUserUsageWireDtoFromJson(json);

  final int userId;
  final num todayActualCost;
  final num totalActualCost;
  final List<AdminDashboardPlatformUsageWireDto>? byPlatform;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardBatchApiKeyUsageWireDto {
  const AdminDashboardBatchApiKeyUsageWireDto({
    required this.apiKeyId,
    required this.todayActualCost,
    required this.totalActualCost,
  });

  factory AdminDashboardBatchApiKeyUsageWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminDashboardBatchApiKeyUsageWireDtoFromJson(json);

  final int apiKeyId;
  final num todayActualCost;
  final num totalActualCost;
}

@JsonSerializable(createToJson: false, checked: true)
final class AdminDashboardBatchUsersWireDto {
  const AdminDashboardBatchUsersWireDto({required this.stats});

  factory AdminDashboardBatchUsersWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminDashboardBatchUsersWireDtoFromJson(json);

  final Map<String, AdminDashboardBatchUserUsageWireDto> stats;
}

@JsonSerializable(createToJson: false, checked: true)
final class AdminDashboardBatchApiKeysWireDto {
  const AdminDashboardBatchApiKeysWireDto({required this.stats});

  factory AdminDashboardBatchApiKeysWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminDashboardBatchApiKeysWireDtoFromJson(json);

  final Map<String, AdminDashboardBatchApiKeyUsageWireDto> stats;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardUserBreakdownItemWireDto {
  const AdminDashboardUserBreakdownItemWireDto({
    required this.userId,
    required this.email,
    required this.requests,
    required this.inputTokens,
    required this.outputTokens,
    required this.cacheTokens,
    required this.totalTokens,
    required this.cost,
    required this.actualCost,
    required this.accountCost,
  });

  factory AdminDashboardUserBreakdownItemWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminDashboardUserBreakdownItemWireDtoFromJson(json);

  final int userId;
  final String email;
  final int requests;
  final int inputTokens;
  final int outputTokens;
  final int cacheTokens;
  final int totalTokens;
  final num cost;
  final num actualCost;
  final num accountCost;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardUserBreakdownWireDto {
  const AdminDashboardUserBreakdownWireDto({
    required this.users,
    required this.startDate,
    required this.endDate,
  });

  factory AdminDashboardUserBreakdownWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminDashboardUserBreakdownWireDtoFromJson(json);

  final List<AdminDashboardUserBreakdownItemWireDto> users;
  final String startDate;
  final String endDate;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminDashboardSnapshotWireDto {
  const AdminDashboardSnapshotWireDto({
    required this.generatedAt,
    required this.startDate,
    required this.endDate,
    required this.granularity,
    this.stats,
    this.trend,
    this.models,
    this.groups,
    this.usersTrend,
  });

  factory AdminDashboardSnapshotWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminDashboardSnapshotWireDtoFromJson(json);

  final String generatedAt;
  final String startDate;
  final String endDate;
  final String granularity;
  final AdminDashboardSnapshotStatsWireDto? stats;
  final List<AdminDashboardTrendPointWireDto>? trend;
  final List<AdminDashboardModelStatsWireDto>? models;
  final List<AdminDashboardGroupStatsWireDto>? groups;
  final List<AdminDashboardUserTrendPointWireDto>? usersTrend;
}

@JsonSerializable(createToJson: false, checked: true)
final class AdminDashboardBackfillResultWireDto {
  const AdminDashboardBackfillResultWireDto({required this.status});

  factory AdminDashboardBackfillResultWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminDashboardBackfillResultWireDtoFromJson(json);

  final String status;
}

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake)
final class AdminDashboardBackfillRequestWireDto {
  const AdminDashboardBackfillRequestWireDto({
    required this.start,
    required this.end,
  });

  final String start;
  final String end;

  Map<String, Object?> toJson() =>
      _$AdminDashboardBackfillRequestWireDtoToJson(this);
}

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake)
final class AdminDashboardUserIdsWireDto {
  const AdminDashboardUserIdsWireDto(this.userIds);

  final List<int> userIds;

  Map<String, Object?> toJson() => _$AdminDashboardUserIdsWireDtoToJson(this);
}

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake)
final class AdminDashboardApiKeyIdsWireDto {
  const AdminDashboardApiKeyIdsWireDto(this.apiKeyIds);

  final List<int> apiKeyIds;

  Map<String, Object?> toJson() => _$AdminDashboardApiKeyIdsWireDtoToJson(this);
}
