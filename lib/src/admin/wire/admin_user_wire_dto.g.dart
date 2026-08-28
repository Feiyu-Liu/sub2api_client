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

AdminUserSubscriptionWireDto _$AdminUserSubscriptionWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminUserSubscriptionWireDto',
  json,
  ($checkedConvert) {
    final val = AdminUserSubscriptionWireDto(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
      groupId: $checkedConvert('group_id', (v) => (v as num).toInt()),
      startsAt: $checkedConvert(
        'starts_at',
        (v) => DateTime.parse(v as String),
      ),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => DateTime.parse(v as String),
      ),
      status: $checkedConvert('status', (v) => v as String),
      dailyUsageUsd: $checkedConvert('daily_usage_usd', (v) => v as num),
      weeklyUsageUsd: $checkedConvert('weekly_usage_usd', (v) => v as num),
      monthlyUsageUsd: $checkedConvert('monthly_usage_usd', (v) => v as num),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      dailyWindowStart: $checkedConvert(
        'daily_window_start',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      weeklyWindowStart: $checkedConvert(
        'weekly_window_start',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      monthlyWindowStart: $checkedConvert(
        'monthly_window_start',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      revokedAt: $checkedConvert(
        'revoked_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'groupId': 'group_id',
    'startsAt': 'starts_at',
    'expiresAt': 'expires_at',
    'dailyUsageUsd': 'daily_usage_usd',
    'weeklyUsageUsd': 'weekly_usage_usd',
    'monthlyUsageUsd': 'monthly_usage_usd',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
    'dailyWindowStart': 'daily_window_start',
    'weeklyWindowStart': 'weekly_window_start',
    'monthlyWindowStart': 'monthly_window_start',
    'revokedAt': 'revoked_at',
  },
);

AdminUserWireDto _$AdminUserWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminUserWireDto',
  json,
  ($checkedConvert) {
    final val = AdminUserWireDto(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      email: $checkedConvert('email', (v) => v as String),
      username: $checkedConvert('username', (v) => v as String),
      role: $checkedConvert('role', (v) => v as String),
      balance: $checkedConvert('balance', (v) => v as num),
      frozenBalance: $checkedConvert('frozen_balance', (v) => v as num),
      concurrency: $checkedConvert('concurrency', (v) => (v as num).toInt()),
      rpmLimit: $checkedConvert('rpm_limit', (v) => (v as num).toInt()),
      status: $checkedConvert('status', (v) => v as String),
      balanceNotifyEnabled: $checkedConvert(
        'balance_notify_enabled',
        (v) => v as bool,
      ),
      balanceNotifyThresholdType: $checkedConvert(
        'balance_notify_threshold_type',
        (v) => v as String,
      ),
      balanceNotifyExtraEmails: $checkedConvert(
        'balance_notify_extra_emails',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => UserAccountNotifyEmailWireDto.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      totalRecharged: $checkedConvert('total_recharged', (v) => v as num),
      notes: $checkedConvert('notes', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      allowedGroups: $checkedConvert(
        'allowed_groups',
        (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
      ),
      balanceNotifyThreshold: $checkedConvert(
        'balance_notify_threshold',
        (v) => v as num?,
      ),
      groupRates: $checkedConvert(
        'group_rates',
        (v) =>
            (v as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as num)),
      ),
      apiKeys: $checkedConvert(
        'api_keys',
        (v) => (v as List<dynamic>?)
            ?.map((e) => ApiKeyWireDto.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      subscriptions: $checkedConvert(
        'subscriptions',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => AdminUserSubscriptionWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      currentConcurrency: $checkedConvert(
        'current_concurrency',
        (v) => (v as num?)?.toInt(),
      ),
      lastActiveAt: $checkedConvert(
        'last_active_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      lastUsedAt: $checkedConvert(
        'last_used_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      deletedAt: $checkedConvert(
        'deleted_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'frozenBalance': 'frozen_balance',
    'rpmLimit': 'rpm_limit',
    'balanceNotifyEnabled': 'balance_notify_enabled',
    'balanceNotifyThresholdType': 'balance_notify_threshold_type',
    'balanceNotifyExtraEmails': 'balance_notify_extra_emails',
    'totalRecharged': 'total_recharged',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
    'allowedGroups': 'allowed_groups',
    'balanceNotifyThreshold': 'balance_notify_threshold',
    'groupRates': 'group_rates',
    'apiKeys': 'api_keys',
    'currentConcurrency': 'current_concurrency',
    'lastActiveAt': 'last_active_at',
    'lastUsedAt': 'last_used_at',
    'deletedAt': 'deleted_at',
  },
);

AdminUserPageWireDto _$AdminUserPageWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminUserPageWireDto', json, ($checkedConvert) {
  final val = AdminUserPageWireDto(
    items: $checkedConvert(
      'items',
      (v) => (v as List<dynamic>)
          .map((e) => AdminUserWireDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    total: $checkedConvert('total', (v) => (v as num).toInt()),
    page: $checkedConvert('page', (v) => (v as num).toInt()),
    pageSize: $checkedConvert('page_size', (v) => (v as num).toInt()),
    pages: $checkedConvert('pages', (v) => (v as num).toInt()),
  );
  return val;
}, fieldKeyMap: const {'pageSize': 'page_size'});

AdminBoundIdentityChannelWireDto _$AdminBoundIdentityChannelWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminBoundIdentityChannelWireDto',
  json,
  ($checkedConvert) {
    final val = AdminBoundIdentityChannelWireDto(
      channel: $checkedConvert('channel', (v) => v as String),
      channelAppId: $checkedConvert('channel_app_id', (v) => v as String),
      channelSubject: $checkedConvert('channel_subject', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      metadata: $checkedConvert('metadata', (v) => v as Map<String, dynamic>?),
    );
    return val;
  },
  fieldKeyMap: const {
    'channelAppId': 'channel_app_id',
    'channelSubject': 'channel_subject',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

AdminBoundIdentityWireDto _$AdminBoundIdentityWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminBoundIdentityWireDto',
  json,
  ($checkedConvert) {
    final val = AdminBoundIdentityWireDto(
      userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
      providerType: $checkedConvert('provider_type', (v) => v as String),
      providerKey: $checkedConvert('provider_key', (v) => v as String),
      providerSubject: $checkedConvert('provider_subject', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      verifiedAt: $checkedConvert(
        'verified_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      issuer: $checkedConvert('issuer', (v) => v as String?),
      metadata: $checkedConvert('metadata', (v) => v as Map<String, dynamic>?),
      channel: $checkedConvert(
        'channel',
        (v) => v == null
            ? null
            : AdminBoundIdentityChannelWireDto.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'providerType': 'provider_type',
    'providerKey': 'provider_key',
    'providerSubject': 'provider_subject',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
    'verifiedAt': 'verified_at',
  },
);

AdminUserUsageWireDto _$AdminUserUsageWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminUserUsageWireDto',
  json,
  ($checkedConvert) {
    final val = AdminUserUsageWireDto(
      period: $checkedConvert('period', (v) => v as String),
      totalRequests: $checkedConvert(
        'total_requests',
        (v) => (v as num).toInt(),
      ),
      totalCost: $checkedConvert('total_cost', (v) => v as num),
      totalTokens: $checkedConvert('total_tokens', (v) => (v as num).toInt()),
      avgDurationMs: $checkedConvert('avg_duration_ms', (v) => v as num),
    );
    return val;
  },
  fieldKeyMap: const {
    'totalRequests': 'total_requests',
    'totalCost': 'total_cost',
    'totalTokens': 'total_tokens',
    'avgDurationMs': 'avg_duration_ms',
  },
);

AdminBalanceHistoryUserWireDto _$AdminBalanceHistoryUserWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminBalanceHistoryUserWireDto', json, ($checkedConvert) {
  final val = AdminBalanceHistoryUserWireDto(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    email: $checkedConvert('email', (v) => v as String),
  );
  return val;
});

AdminBalanceHistoryGroupWireDto _$AdminBalanceHistoryGroupWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminBalanceHistoryGroupWireDto', json, ($checkedConvert) {
  final val = AdminBalanceHistoryGroupWireDto(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String),
  );
  return val;
});

AdminBalanceHistoryRecordWireDto _$AdminBalanceHistoryRecordWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminBalanceHistoryRecordWireDto',
  json,
  ($checkedConvert) {
    final val = AdminBalanceHistoryRecordWireDto(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      code: $checkedConvert('code', (v) => v as String),
      type: $checkedConvert('type', (v) => v as String),
      value: $checkedConvert('value', (v) => v as num),
      status: $checkedConvert('status', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      validityDays: $checkedConvert('validity_days', (v) => (v as num).toInt()),
      notes: $checkedConvert('notes', (v) => v as String),
      usedBy: $checkedConvert('used_by', (v) => (v as num?)?.toInt()),
      usedAt: $checkedConvert(
        'used_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      groupId: $checkedConvert('group_id', (v) => (v as num?)?.toInt()),
      user: $checkedConvert(
        'user',
        (v) => v == null
            ? null
            : AdminBalanceHistoryUserWireDto.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      group: $checkedConvert(
        'group',
        (v) => v == null
            ? null
            : AdminBalanceHistoryGroupWireDto.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'createdAt': 'created_at',
    'validityDays': 'validity_days',
    'usedBy': 'used_by',
    'usedAt': 'used_at',
    'expiresAt': 'expires_at',
    'groupId': 'group_id',
  },
);

AdminBalanceHistoryPageWireDto _$AdminBalanceHistoryPageWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminBalanceHistoryPageWireDto',
  json,
  ($checkedConvert) {
    final val = AdminBalanceHistoryPageWireDto(
      items: $checkedConvert(
        'items',
        (v) => (v as List<dynamic>)
            .map(
              (e) => AdminBalanceHistoryRecordWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      total: $checkedConvert('total', (v) => (v as num).toInt()),
      page: $checkedConvert('page', (v) => (v as num).toInt()),
      pageSize: $checkedConvert('page_size', (v) => (v as num).toInt()),
      pages: $checkedConvert('pages', (v) => (v as num).toInt()),
      totalRecharged: $checkedConvert('total_recharged', (v) => v as num),
    );
    return val;
  },
  fieldKeyMap: const {
    'pageSize': 'page_size',
    'totalRecharged': 'total_recharged',
  },
);

AdminDeleteUserResultWireDto _$AdminDeleteUserResultWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminDeleteUserResultWireDto', json, ($checkedConvert) {
  final val = AdminDeleteUserResultWireDto(
    message: $checkedConvert('message', (v) => v as String),
  );
  return val;
});
