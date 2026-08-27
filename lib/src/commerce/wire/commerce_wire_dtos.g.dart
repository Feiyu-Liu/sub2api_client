// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commerce_wire_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementWireDto _$AnnouncementWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AnnouncementWireDto',
      json,
      ($checkedConvert) {
        final val = AnnouncementWireDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          title: $checkedConvert('title', (v) => v as String),
          content: $checkedConvert('content', (v) => v as String),
          notifyMode: $checkedConvert('notify_mode', (v) => v as String),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => DateTime.parse(v as String),
          ),
          startsAt: $checkedConvert(
            'starts_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          endsAt: $checkedConvert(
            'ends_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          readAt: $checkedConvert(
            'read_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'notifyMode': 'notify_mode',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'startsAt': 'starts_at',
        'endsAt': 'ends_at',
        'readAt': 'read_at',
      },
    );

CommerceMessageWireDto _$CommerceMessageWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CommerceMessageWireDto', json, ($checkedConvert) {
  final val = CommerceMessageWireDto(
    message: $checkedConvert('message', (v) => v as String),
  );
  return val;
});

CommerceGroupWireDto _$CommerceGroupWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CommerceGroupWireDto',
  json,
  ($checkedConvert) {
    final val = CommerceGroupWireDto(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      platform: $checkedConvert('platform', (v) => v as String),
      subscriptionType: $checkedConvert(
        'subscription_type',
        (v) => v as String,
      ),
    );
    return val;
  },
  fieldKeyMap: const {'subscriptionType': 'subscription_type'},
);

RedeemRecordWireDto _$RedeemRecordWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RedeemRecordWireDto',
      json,
      ($checkedConvert) {
        final val = RedeemRecordWireDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          code: $checkedConvert('code', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
          value: $checkedConvert('value', (v) => v as num),
          status: $checkedConvert('status', (v) => v as String),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          validityDays: $checkedConvert(
            'validity_days',
            (v) => (v as num).toInt(),
          ),
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
          notes: $checkedConvert('notes', (v) => v as String?),
          group: $checkedConvert(
            'group',
            (v) => v == null
                ? null
                : CommerceGroupWireDto.fromJson(v as Map<String, dynamic>),
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

UserSubscriptionWireDto _$UserSubscriptionWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UserSubscriptionWireDto',
  json,
  ($checkedConvert) {
    final val = UserSubscriptionWireDto(
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
      group: $checkedConvert(
        'group',
        (v) => v == null
            ? null
            : CommerceGroupWireDto.fromJson(v as Map<String, dynamic>),
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

SubscriptionUsageWindowWireDto _$SubscriptionUsageWindowWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SubscriptionUsageWindowWireDto',
  json,
  ($checkedConvert) {
    final val = SubscriptionUsageWindowWireDto(
      limitUsd: $checkedConvert('limit_usd', (v) => v as num),
      usedUsd: $checkedConvert('used_usd', (v) => v as num),
      remainingUsd: $checkedConvert('remaining_usd', (v) => v as num),
      percentage: $checkedConvert('percentage', (v) => v as num),
      windowStart: $checkedConvert(
        'window_start',
        (v) => DateTime.parse(v as String),
      ),
      resetsAt: $checkedConvert(
        'resets_at',
        (v) => DateTime.parse(v as String),
      ),
      resetsInSeconds: $checkedConvert(
        'resets_in_seconds',
        (v) => (v as num).toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'limitUsd': 'limit_usd',
    'usedUsd': 'used_usd',
    'remainingUsd': 'remaining_usd',
    'windowStart': 'window_start',
    'resetsAt': 'resets_at',
    'resetsInSeconds': 'resets_in_seconds',
  },
);

SubscriptionProgressWireDto _$SubscriptionProgressWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SubscriptionProgressWireDto',
  json,
  ($checkedConvert) {
    final val = SubscriptionProgressWireDto(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      groupName: $checkedConvert('group_name', (v) => v as String),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => DateTime.parse(v as String),
      ),
      expiresInDays: $checkedConvert(
        'expires_in_days',
        (v) => (v as num).toInt(),
      ),
      daily: $checkedConvert(
        'daily',
        (v) => v == null
            ? null
            : SubscriptionUsageWindowWireDto.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      weekly: $checkedConvert(
        'weekly',
        (v) => v == null
            ? null
            : SubscriptionUsageWindowWireDto.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      monthly: $checkedConvert(
        'monthly',
        (v) => v == null
            ? null
            : SubscriptionUsageWindowWireDto.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'groupName': 'group_name',
    'expiresAt': 'expires_at',
    'expiresInDays': 'expires_in_days',
  },
);

SubscriptionProgressInfoWireDto _$SubscriptionProgressInfoWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SubscriptionProgressInfoWireDto', json, ($checkedConvert) {
  final val = SubscriptionProgressInfoWireDto(
    subscription: $checkedConvert(
      'subscription',
      (v) => UserSubscriptionWireDto.fromJson(v as Map<String, dynamic>),
    ),
    progress: $checkedConvert(
      'progress',
      (v) => SubscriptionProgressWireDto.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

SubscriptionSummaryItemWireDto _$SubscriptionSummaryItemWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SubscriptionSummaryItemWireDto',
  json,
  ($checkedConvert) {
    final val = SubscriptionSummaryItemWireDto(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      groupId: $checkedConvert('group_id', (v) => (v as num).toInt()),
      groupName: $checkedConvert('group_name', (v) => v as String),
      status: $checkedConvert('status', (v) => v as String),
      dailyUsedUsd: $checkedConvert('daily_used_usd', (v) => v as num? ?? 0),
      dailyLimitUsd: $checkedConvert('daily_limit_usd', (v) => v as num? ?? 0),
      weeklyUsedUsd: $checkedConvert('weekly_used_usd', (v) => v as num? ?? 0),
      weeklyLimitUsd: $checkedConvert(
        'weekly_limit_usd',
        (v) => v as num? ?? 0,
      ),
      monthlyUsedUsd: $checkedConvert(
        'monthly_used_usd',
        (v) => v as num? ?? 0,
      ),
      monthlyLimitUsd: $checkedConvert(
        'monthly_limit_usd',
        (v) => v as num? ?? 0,
      ),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'groupId': 'group_id',
    'groupName': 'group_name',
    'dailyUsedUsd': 'daily_used_usd',
    'dailyLimitUsd': 'daily_limit_usd',
    'weeklyUsedUsd': 'weekly_used_usd',
    'weeklyLimitUsd': 'weekly_limit_usd',
    'monthlyUsedUsd': 'monthly_used_usd',
    'monthlyLimitUsd': 'monthly_limit_usd',
    'expiresAt': 'expires_at',
  },
);

SubscriptionSummaryWireDto _$SubscriptionSummaryWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SubscriptionSummaryWireDto',
  json,
  ($checkedConvert) {
    final val = SubscriptionSummaryWireDto(
      activeCount: $checkedConvert('active_count', (v) => (v as num).toInt()),
      totalUsedUsd: $checkedConvert('total_used_usd', (v) => v as num),
      subscriptions: $checkedConvert(
        'subscriptions',
        (v) => (v as List<dynamic>)
            .map(
              (e) => SubscriptionSummaryItemWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'activeCount': 'active_count',
    'totalUsedUsd': 'total_used_usd',
  },
);

ModelPlazaOfficialPricingWireDto _$ModelPlazaOfficialPricingWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ModelPlazaOfficialPricingWireDto',
  json,
  ($checkedConvert) {
    final val = ModelPlazaOfficialPricingWireDto(
      inputPrice: $checkedConvert('input_price', (v) => v as num?),
      outputPrice: $checkedConvert('output_price', (v) => v as num?),
      cacheWritePrice: $checkedConvert('cache_write_price', (v) => v as num?),
      cacheReadPrice: $checkedConvert('cache_read_price', (v) => v as num?),
      cacheWrite1hPrice: $checkedConvert(
        'cache_write_1h_price',
        (v) => v as num?,
      ),
      intervals: $checkedConvert(
        'intervals',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => PricingIntervalWireDto.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'inputPrice': 'input_price',
    'outputPrice': 'output_price',
    'cacheWritePrice': 'cache_write_price',
    'cacheReadPrice': 'cache_read_price',
    'cacheWrite1hPrice': 'cache_write_1h_price',
  },
);

ModelPlazaTimePeriodWireDto _$ModelPlazaTimePeriodWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ModelPlazaTimePeriodWireDto',
  json,
  ($checkedConvert) {
    final val = ModelPlazaTimePeriodWireDto(
      startTime: $checkedConvert('start_time', (v) => v as String),
      endTime: $checkedConvert('end_time', (v) => v as String),
      multiplier: $checkedConvert('multiplier', (v) => v as num),
    );
    return val;
  },
  fieldKeyMap: const {'startTime': 'start_time', 'endTime': 'end_time'},
);

ModelPlazaTimePricingWireDto _$ModelPlazaTimePricingWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ModelPlazaTimePricingWireDto',
  json,
  ($checkedConvert) {
    final val = ModelPlazaTimePricingWireDto(
      timezone: $checkedConvert('timezone', (v) => v as String),
      periods: $checkedConvert(
        'periods',
        (v) => (v as List<dynamic>)
            .map(
              (e) => ModelPlazaTimePeriodWireDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      weekdaysOnly: $checkedConvert(
        'weekdays_only',
        (v) => v as bool? ?? false,
      ),
    );
    return val;
  },
  fieldKeyMap: const {'weekdaysOnly': 'weekdays_only'},
);

ModelPlazaModelWireDto _$ModelPlazaModelWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ModelPlazaModelWireDto',
  json,
  ($checkedConvert) {
    final val = ModelPlazaModelWireDto(
      name: $checkedConvert('name', (v) => v as String),
      platform: $checkedConvert('platform', (v) => v as String),
      pricing: $checkedConvert(
        'pricing',
        (v) => v == null
            ? null
            : SupportedModelPricingWireDto.fromJson(v as Map<String, dynamic>),
      ),
      officialPricing: $checkedConvert(
        'official_pricing',
        (v) => v == null
            ? null
            : ModelPlazaOfficialPricingWireDto.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      longContextBasis: $checkedConvert(
        'long_context_basis',
        (v) => v as String?,
      ),
      timePricing: $checkedConvert(
        'time_pricing',
        (v) => v == null
            ? null
            : ModelPlazaTimePricingWireDto.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'officialPricing': 'official_pricing',
    'longContextBasis': 'long_context_basis',
    'timePricing': 'time_pricing',
  },
);

ModelPlazaGroupWireDto _$ModelPlazaGroupWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ModelPlazaGroupWireDto',
  json,
  ($checkedConvert) {
    final val = ModelPlazaGroupWireDto(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      platform: $checkedConvert('platform', (v) => v as String),
      subscriptionType: $checkedConvert(
        'subscription_type',
        (v) => v as String,
      ),
      rateMultiplier: $checkedConvert('rate_multiplier', (v) => v as num),
      peakRateEnabled: $checkedConvert('peak_rate_enabled', (v) => v as bool),
      peakStart: $checkedConvert('peak_start', (v) => v as String),
      peakEnd: $checkedConvert('peak_end', (v) => v as String),
      peakRateMultiplier: $checkedConvert(
        'peak_rate_multiplier',
        (v) => v as num,
      ),
      isExclusive: $checkedConvert('is_exclusive', (v) => v as bool),
      imageRateIndependent: $checkedConvert(
        'image_rate_independent',
        (v) => v as bool,
      ),
      imageRateMultiplier: $checkedConvert(
        'image_rate_multiplier',
        (v) => v as num,
      ),
      longContextPricingEnabled: $checkedConvert(
        'long_context_pricing_enabled',
        (v) => v as bool,
      ),
      models: $checkedConvert(
        'models',
        (v) => (v as List<dynamic>)
            .map(
              (e) => ModelPlazaModelWireDto.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      userRateMultiplier: $checkedConvert(
        'user_rate_multiplier',
        (v) => v as num?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'subscriptionType': 'subscription_type',
    'rateMultiplier': 'rate_multiplier',
    'peakRateEnabled': 'peak_rate_enabled',
    'peakStart': 'peak_start',
    'peakEnd': 'peak_end',
    'peakRateMultiplier': 'peak_rate_multiplier',
    'isExclusive': 'is_exclusive',
    'imageRateIndependent': 'image_rate_independent',
    'imageRateMultiplier': 'image_rate_multiplier',
    'longContextPricingEnabled': 'long_context_pricing_enabled',
    'userRateMultiplier': 'user_rate_multiplier',
  },
);

ModelPlazaWireDto _$ModelPlazaWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ModelPlazaWireDto', json, ($checkedConvert) {
      final val = ModelPlazaWireDto(
        description: $checkedConvert('description', (v) => v as String),
        groups: $checkedConvert(
          'groups',
          (v) => (v as List<dynamic>)
              .map(
                (e) =>
                    ModelPlazaGroupWireDto.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });
