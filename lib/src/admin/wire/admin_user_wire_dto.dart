import 'package:json_annotation/json_annotation.dart';

import '../../keys/internal/key_wire_dtos.dart';
import '../../shared/wire/sub2api_user_account_wire_dto.dart';

part 'admin_user_wire_dto.g.dart';

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminReplaceUserGroupResultWireDto {
  const AdminReplaceUserGroupResultWireDto({required this.migratedKeys});

  factory AdminReplaceUserGroupResultWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminReplaceUserGroupResultWireDtoFromJson(json);

  final int migratedKeys;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminUserGroupRpmStatusWireDto {
  const AdminUserGroupRpmStatusWireDto({
    required this.groupId,
    required this.groupName,
    required this.used,
    required this.limit,
    required this.source,
  });

  factory AdminUserGroupRpmStatusWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminUserGroupRpmStatusWireDtoFromJson(json);

  final int groupId;
  final String groupName;
  final int used;
  final int limit;
  final String source;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminUserRpmStatusWireDto {
  const AdminUserRpmStatusWireDto({
    required this.userRpmUsed,
    required this.userRpmLimit,
    required this.perGroup,
  });

  factory AdminUserRpmStatusWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminUserRpmStatusWireDtoFromJson(json);

  final int userRpmUsed;
  final int userRpmLimit;
  final List<AdminUserGroupRpmStatusWireDto> perGroup;
}

@JsonSerializable(createToJson: false, checked: true)
final class AdminAffectedUsersWireDto {
  const AdminAffectedUsersWireDto({required this.affected});

  factory AdminAffectedUsersWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminAffectedUsersWireDtoFromJson(json);

  final int affected;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminUserPlatformQuotaWireDto {
  const AdminUserPlatformQuotaWireDto({
    required this.platform,
    required this.dailyUsageUsd,
    this.dailyLimitUsd,
    this.dailyWindowResetsAt,
    this.dailyWindowStart,
    required this.weeklyUsageUsd,
    this.weeklyLimitUsd,
    this.weeklyWindowResetsAt,
    this.weeklyWindowStart,
    required this.monthlyUsageUsd,
    this.monthlyLimitUsd,
    this.monthlyWindowResetsAt,
    this.monthlyWindowStart,
  });

  factory AdminUserPlatformQuotaWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminUserPlatformQuotaWireDtoFromJson(json);

  final String platform;
  final num dailyUsageUsd;
  final num? dailyLimitUsd;
  final String? dailyWindowResetsAt;
  final String? dailyWindowStart;
  final num weeklyUsageUsd;
  final num? weeklyLimitUsd;
  final String? weeklyWindowResetsAt;
  final String? weeklyWindowStart;
  final num monthlyUsageUsd;
  final num? monthlyLimitUsd;
  final String? monthlyWindowResetsAt;
  final String? monthlyWindowStart;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminUserPlatformQuotasWireDto {
  const AdminUserPlatformQuotasWireDto({required this.platformQuotas});

  factory AdminUserPlatformQuotasWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminUserPlatformQuotasWireDtoFromJson(json);

  final List<AdminUserPlatformQuotaWireDto> platformQuotas;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminUserAttributeValueWireDto {
  const AdminUserAttributeValueWireDto({
    required this.id,
    required this.userId,
    required this.attributeId,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdminUserAttributeValueWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminUserAttributeValueWireDtoFromJson(json);

  final int id;
  final int userId;
  final int attributeId;
  final String value;
  final String createdAt;
  final String updatedAt;
}

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake)
final class AdminReplaceUserGroupRequestWireDto {
  const AdminReplaceUserGroupRequestWireDto({
    required this.oldGroupId,
    required this.newGroupId,
  });

  final int oldGroupId;
  final int newGroupId;

  Map<String, Object?> toJson() =>
      _$AdminReplaceUserGroupRequestWireDtoToJson(this);
}

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake)
final class AdminBatchConcurrencyRequestWireDto {
  const AdminBatchConcurrencyRequestWireDto({
    required this.userIds,
    required this.all,
    required this.concurrency,
    required this.mode,
  });

  final List<int> userIds;
  final bool all;
  final int concurrency;
  final String mode;

  Map<String, Object?> toJson() =>
      _$AdminBatchConcurrencyRequestWireDtoToJson(this);
}

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake)
final class AdminBatchLimitsRequestWireDto {
  const AdminBatchLimitsRequestWireDto({
    required this.userIds,
    required this.all,
    this.concurrency,
    this.rpmLimit,
  });

  final List<int> userIds;
  final bool all;
  final int? concurrency;
  final int? rpmLimit;

  Map<String, Object?> toJson() => _$AdminBatchLimitsRequestWireDtoToJson(this);
}

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake)
final class AdminPlatformQuotaInputWireDto {
  const AdminPlatformQuotaInputWireDto({
    required this.platform,
    this.dailyLimitUsd,
    this.weeklyLimitUsd,
    this.monthlyLimitUsd,
  });

  final String platform;
  final double? dailyLimitUsd;
  final double? weeklyLimitUsd;
  final double? monthlyLimitUsd;

  Map<String, Object?> toJson() => _$AdminPlatformQuotaInputWireDtoToJson(this);
}

@JsonSerializable(
  createFactory: false,
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
final class AdminUpdatePlatformQuotasRequestWireDto {
  const AdminUpdatePlatformQuotasRequestWireDto({required this.quotas});

  final List<AdminPlatformQuotaInputWireDto> quotas;

  Map<String, Object?> toJson() =>
      _$AdminUpdatePlatformQuotasRequestWireDtoToJson(this);
}

@JsonSerializable(createFactory: false)
final class AdminResetPlatformQuotaRequestWireDto {
  const AdminResetPlatformQuotaRequestWireDto({
    required this.platform,
    required this.window,
  });

  final String platform;
  final String window;

  Map<String, Object?> toJson() =>
      _$AdminResetPlatformQuotaRequestWireDtoToJson(this);
}

@JsonSerializable(createFactory: false)
final class AdminUpdateUserAttributesRequestWireDto {
  const AdminUpdateUserAttributesRequestWireDto({required this.values});

  final Map<String, String> values;

  Map<String, Object?> toJson() =>
      _$AdminUpdateUserAttributesRequestWireDtoToJson(this);
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminUserSubscriptionWireDto {
  const AdminUserSubscriptionWireDto({
    required this.id,
    required this.userId,
    required this.groupId,
    required this.startsAt,
    required this.expiresAt,
    required this.status,
    required this.dailyUsageUsd,
    required this.weeklyUsageUsd,
    required this.monthlyUsageUsd,
    required this.createdAt,
    required this.updatedAt,
    this.dailyWindowStart,
    this.weeklyWindowStart,
    this.monthlyWindowStart,
    this.revokedAt,
  });

  factory AdminUserSubscriptionWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminUserSubscriptionWireDtoFromJson(json);

  final int id;
  final int userId;
  final int groupId;
  final DateTime startsAt;
  final DateTime expiresAt;
  final String status;
  final DateTime? dailyWindowStart;
  final DateTime? weeklyWindowStart;
  final DateTime? monthlyWindowStart;
  final num dailyUsageUsd;
  final num weeklyUsageUsd;
  final num monthlyUsageUsd;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? revokedAt;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminUserWireDto {
  const AdminUserWireDto({
    required this.id,
    required this.email,
    required this.username,
    required this.role,
    required this.balance,
    required this.frozenBalance,
    required this.concurrency,
    required this.rpmLimit,
    required this.status,
    required this.balanceNotifyEnabled,
    required this.balanceNotifyThresholdType,
    required this.balanceNotifyExtraEmails,
    required this.totalRecharged,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.allowedGroups,
    this.balanceNotifyThreshold,
    this.groupRates,
    this.apiKeys,
    this.subscriptions,
    this.currentConcurrency,
    this.lastActiveAt,
    this.lastUsedAt,
    this.deletedAt,
  });

  factory AdminUserWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminUserWireDtoFromJson(json);

  final int id;
  final String email;
  final String username;
  final String role;
  final num balance;
  final num frozenBalance;
  final int concurrency;
  final int rpmLimit;
  final String status;
  final List<int>? allowedGroups;
  final bool balanceNotifyEnabled;
  final String balanceNotifyThresholdType;
  final num? balanceNotifyThreshold;
  @JsonKey(defaultValue: <UserAccountNotifyEmailWireDto>[])
  final List<UserAccountNotifyEmailWireDto> balanceNotifyExtraEmails;
  final num totalRecharged;
  final String notes;
  final Map<String, num>? groupRates;
  final List<ApiKeyWireDto>? apiKeys;
  final List<AdminUserSubscriptionWireDto>? subscriptions;
  final int? currentConcurrency;
  final DateTime? lastActiveAt;
  final DateTime? lastUsedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminUserPageWireDto {
  const AdminUserPageWireDto({
    required this.items,
    required this.total,
    required this.page,
    required this.pageSize,
    required this.pages,
  });

  factory AdminUserPageWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminUserPageWireDtoFromJson(json);

  final List<AdminUserWireDto> items;
  final int total;
  final int page;
  final int pageSize;
  final int pages;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminBoundIdentityChannelWireDto {
  const AdminBoundIdentityChannelWireDto({
    required this.channel,
    required this.channelAppId,
    required this.channelSubject,
    required this.createdAt,
    required this.updatedAt,
    this.metadata,
  });

  factory AdminBoundIdentityChannelWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminBoundIdentityChannelWireDtoFromJson(json);

  final String channel;
  final String channelAppId;
  final String channelSubject;
  final Map<String, Object?>? metadata;
  final DateTime createdAt;
  final DateTime updatedAt;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminBoundIdentityWireDto {
  const AdminBoundIdentityWireDto({
    required this.userId,
    required this.providerType,
    required this.providerKey,
    required this.providerSubject,
    required this.createdAt,
    required this.updatedAt,
    this.verifiedAt,
    this.issuer,
    this.metadata,
    this.channel,
  });

  factory AdminBoundIdentityWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminBoundIdentityWireDtoFromJson(json);

  final int userId;
  final String providerType;
  final String providerKey;
  final String providerSubject;
  final DateTime? verifiedAt;
  final String? issuer;
  final Map<String, Object?>? metadata;
  final DateTime createdAt;
  final DateTime updatedAt;
  final AdminBoundIdentityChannelWireDto? channel;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminUserUsageWireDto {
  const AdminUserUsageWireDto({
    required this.period,
    required this.totalRequests,
    required this.totalCost,
    required this.totalTokens,
    required this.avgDurationMs,
  });

  factory AdminUserUsageWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminUserUsageWireDtoFromJson(json);

  final String period;
  final int totalRequests;
  final num totalCost;
  final int totalTokens;
  final num avgDurationMs;
}

@JsonSerializable(createToJson: false, checked: true)
final class AdminBalanceHistoryUserWireDto {
  const AdminBalanceHistoryUserWireDto({required this.id, required this.email});

  factory AdminBalanceHistoryUserWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminBalanceHistoryUserWireDtoFromJson(json);

  final int id;
  final String email;
}

@JsonSerializable(createToJson: false, checked: true)
final class AdminBalanceHistoryGroupWireDto {
  const AdminBalanceHistoryGroupWireDto({required this.id, required this.name});

  factory AdminBalanceHistoryGroupWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminBalanceHistoryGroupWireDtoFromJson(json);

  final int id;
  final String name;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminBalanceHistoryRecordWireDto {
  const AdminBalanceHistoryRecordWireDto({
    required this.id,
    required this.code,
    required this.type,
    required this.value,
    required this.status,
    required this.createdAt,
    required this.validityDays,
    required this.notes,
    this.usedBy,
    this.usedAt,
    this.expiresAt,
    this.groupId,
    this.user,
    this.group,
  });

  factory AdminBalanceHistoryRecordWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$AdminBalanceHistoryRecordWireDtoFromJson(json);

  final int id;
  final String code;
  final String type;
  final num value;
  final String status;
  final int? usedBy;
  final DateTime? usedAt;
  final DateTime createdAt;
  final DateTime? expiresAt;
  final int? groupId;
  final int validityDays;
  final String notes;
  final AdminBalanceHistoryUserWireDto? user;
  final AdminBalanceHistoryGroupWireDto? group;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AdminBalanceHistoryPageWireDto {
  const AdminBalanceHistoryPageWireDto({
    required this.items,
    required this.total,
    required this.page,
    required this.pageSize,
    required this.pages,
    required this.totalRecharged,
  });

  factory AdminBalanceHistoryPageWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminBalanceHistoryPageWireDtoFromJson(json);

  final List<AdminBalanceHistoryRecordWireDto> items;
  final int total;
  final int page;
  final int pageSize;
  final int pages;
  final num totalRecharged;
}

@JsonSerializable(createToJson: false, checked: true)
final class AdminDeleteUserResultWireDto {
  const AdminDeleteUserResultWireDto({required this.message});

  factory AdminDeleteUserResultWireDto.fromJson(Map<String, Object?> json) =>
      _$AdminDeleteUserResultWireDtoFromJson(json);

  final String message;
}
