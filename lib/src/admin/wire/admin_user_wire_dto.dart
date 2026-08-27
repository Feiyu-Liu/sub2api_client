import 'package:json_annotation/json_annotation.dart';

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
