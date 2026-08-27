// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_wire_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminReplaceUserGroupResultWireDto _$AdminReplaceUserGroupResultWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminReplaceUserGroupResultWireDto',
  json,
  ($checkedConvert) {
    final val = AdminReplaceUserGroupResultWireDto(
      migratedKeys: $checkedConvert('migrated_keys', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {'migratedKeys': 'migrated_keys'},
);

AdminUserGroupRpmStatusWireDto _$AdminUserGroupRpmStatusWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminUserGroupRpmStatusWireDto',
  json,
  ($checkedConvert) {
    final val = AdminUserGroupRpmStatusWireDto(
      groupId: $checkedConvert('group_id', (v) => (v as num).toInt()),
      groupName: $checkedConvert('group_name', (v) => v as String),
      used: $checkedConvert('used', (v) => (v as num).toInt()),
      limit: $checkedConvert('limit', (v) => (v as num).toInt()),
      source: $checkedConvert('source', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'groupId': 'group_id', 'groupName': 'group_name'},
);

AdminUserRpmStatusWireDto _$AdminUserRpmStatusWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminUserRpmStatusWireDto',
  json,
  ($checkedConvert) {
    final val = AdminUserRpmStatusWireDto(
      userRpmUsed: $checkedConvert('user_rpm_used', (v) => (v as num).toInt()),
      userRpmLimit: $checkedConvert(
        'user_rpm_limit',
        (v) => (v as num).toInt(),
      ),
      perGroup: $checkedConvert(
        'per_group',
        (v) => (v as List<dynamic>)
            .map(
              (e) => AdminUserGroupRpmStatusWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'userRpmUsed': 'user_rpm_used',
    'userRpmLimit': 'user_rpm_limit',
    'perGroup': 'per_group',
  },
);

AdminAffectedUsersWireDto _$AdminAffectedUsersWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminAffectedUsersWireDto', json, ($checkedConvert) {
  final val = AdminAffectedUsersWireDto(
    affected: $checkedConvert('affected', (v) => (v as num).toInt()),
  );
  return val;
});

AdminUserPlatformQuotaWireDto _$AdminUserPlatformQuotaWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminUserPlatformQuotaWireDto',
  json,
  ($checkedConvert) {
    final val = AdminUserPlatformQuotaWireDto(
      platform: $checkedConvert('platform', (v) => v as String),
      dailyUsageUsd: $checkedConvert('daily_usage_usd', (v) => v as num),
      dailyLimitUsd: $checkedConvert('daily_limit_usd', (v) => v as num?),
      dailyWindowResetsAt: $checkedConvert(
        'daily_window_resets_at',
        (v) => v as String?,
      ),
      dailyWindowStart: $checkedConvert(
        'daily_window_start',
        (v) => v as String?,
      ),
      weeklyUsageUsd: $checkedConvert('weekly_usage_usd', (v) => v as num),
      weeklyLimitUsd: $checkedConvert('weekly_limit_usd', (v) => v as num?),
      weeklyWindowResetsAt: $checkedConvert(
        'weekly_window_resets_at',
        (v) => v as String?,
      ),
      weeklyWindowStart: $checkedConvert(
        'weekly_window_start',
        (v) => v as String?,
      ),
      monthlyUsageUsd: $checkedConvert('monthly_usage_usd', (v) => v as num),
      monthlyLimitUsd: $checkedConvert('monthly_limit_usd', (v) => v as num?),
      monthlyWindowResetsAt: $checkedConvert(
        'monthly_window_resets_at',
        (v) => v as String?,
      ),
      monthlyWindowStart: $checkedConvert(
        'monthly_window_start',
        (v) => v as String?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'dailyUsageUsd': 'daily_usage_usd',
    'dailyLimitUsd': 'daily_limit_usd',
    'dailyWindowResetsAt': 'daily_window_resets_at',
    'dailyWindowStart': 'daily_window_start',
    'weeklyUsageUsd': 'weekly_usage_usd',
    'weeklyLimitUsd': 'weekly_limit_usd',
    'weeklyWindowResetsAt': 'weekly_window_resets_at',
    'weeklyWindowStart': 'weekly_window_start',
    'monthlyUsageUsd': 'monthly_usage_usd',
    'monthlyLimitUsd': 'monthly_limit_usd',
    'monthlyWindowResetsAt': 'monthly_window_resets_at',
    'monthlyWindowStart': 'monthly_window_start',
  },
);

AdminUserPlatformQuotasWireDto _$AdminUserPlatformQuotasWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminUserPlatformQuotasWireDto',
  json,
  ($checkedConvert) {
    final val = AdminUserPlatformQuotasWireDto(
      platformQuotas: $checkedConvert(
        'platform_quotas',
        (v) => (v as List<dynamic>)
            .map(
              (e) => AdminUserPlatformQuotaWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'platformQuotas': 'platform_quotas'},
);

AdminUserAttributeValueWireDto _$AdminUserAttributeValueWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminUserAttributeValueWireDto',
  json,
  ($checkedConvert) {
    final val = AdminUserAttributeValueWireDto(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
      attributeId: $checkedConvert('attribute_id', (v) => (v as num).toInt()),
      value: $checkedConvert('value', (v) => v as String),
      createdAt: $checkedConvert('created_at', (v) => v as String),
      updatedAt: $checkedConvert('updated_at', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'attributeId': 'attribute_id',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$AdminReplaceUserGroupRequestWireDtoToJson(
  AdminReplaceUserGroupRequestWireDto instance,
) => <String, dynamic>{
  'old_group_id': instance.oldGroupId,
  'new_group_id': instance.newGroupId,
};

Map<String, dynamic> _$AdminBatchConcurrencyRequestWireDtoToJson(
  AdminBatchConcurrencyRequestWireDto instance,
) => <String, dynamic>{
  'user_ids': instance.userIds,
  'all': instance.all,
  'concurrency': instance.concurrency,
  'mode': instance.mode,
};

Map<String, dynamic> _$AdminBatchLimitsRequestWireDtoToJson(
  AdminBatchLimitsRequestWireDto instance,
) => <String, dynamic>{
  'user_ids': instance.userIds,
  'all': instance.all,
  'concurrency': instance.concurrency,
  'rpm_limit': instance.rpmLimit,
};

Map<String, dynamic> _$AdminPlatformQuotaInputWireDtoToJson(
  AdminPlatformQuotaInputWireDto instance,
) => <String, dynamic>{
  'platform': instance.platform,
  'daily_limit_usd': instance.dailyLimitUsd,
  'weekly_limit_usd': instance.weeklyLimitUsd,
  'monthly_limit_usd': instance.monthlyLimitUsd,
};

Map<String, dynamic> _$AdminUpdatePlatformQuotasRequestWireDtoToJson(
  AdminUpdatePlatformQuotasRequestWireDto instance,
) => <String, dynamic>{
  'quotas': instance.quotas.map((e) => e.toJson()).toList(),
};

Map<String, dynamic> _$AdminResetPlatformQuotaRequestWireDtoToJson(
  AdminResetPlatformQuotaRequestWireDto instance,
) => <String, dynamic>{
  'platform': instance.platform,
  'window': instance.window,
};

Map<String, dynamic> _$AdminUpdateUserAttributesRequestWireDtoToJson(
  AdminUpdateUserAttributesRequestWireDto instance,
) => <String, dynamic>{'values': instance.values};
