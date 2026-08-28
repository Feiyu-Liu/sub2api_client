import 'package:freezed_annotation/freezed_annotation.dart';

import '../access/sub2api_access_models.dart';
import '../shared/models/sub2api_decimal.dart';

part 'sub2api_commerce_models.freezed.dart';

/// A user-visible announcement and its read state.
@freezed
abstract class Sub2ApiAnnouncement with _$Sub2ApiAnnouncement {
  const factory Sub2ApiAnnouncement({
    required int id,
    required String title,
    required String content,
    required String notifyMode,
    DateTime? startsAt,
    DateTime? endsAt,
    DateTime? readAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Sub2ApiAnnouncement;
}

/// Server acknowledgement after marking an announcement as read.
final class Sub2ApiAnnouncementReadResult {
  const Sub2ApiAnnouncementReadResult({required this.message});

  final String message;
}

/// A user-visible group relation embedded by commerce resources.
@freezed
abstract class Sub2ApiCommerceGroupSummary with _$Sub2ApiCommerceGroupSummary {
  const factory Sub2ApiCommerceGroupSummary({
    required int id,
    required String name,
    required String platform,
    required String subscriptionType,
  }) = _Sub2ApiCommerceGroupSummary;
}

/// Request to consume one redeem code.
final class Sub2ApiRedeemRequest {
  const Sub2ApiRedeemRequest({required this.code});

  final String code;
}

/// One redeemed-code record returned to the current user.
@freezed
abstract class Sub2ApiRedeemRecord with _$Sub2ApiRedeemRecord {
  const factory Sub2ApiRedeemRecord({
    required int id,
    required String code,
    required String type,
    required Sub2ApiDecimal value,
    required String status,
    int? usedBy,
    DateTime? usedAt,
    required DateTime createdAt,
    DateTime? expiresAt,
    int? groupId,
    required int validityDays,
    String? notes,
    Sub2ApiCommerceGroupSummary? group,
  }) = _Sub2ApiRedeemRecord;
}

/// Current-user subscription and rolling usage windows.
@freezed
abstract class Sub2ApiUserSubscription with _$Sub2ApiUserSubscription {
  const factory Sub2ApiUserSubscription({
    required int id,
    required int userId,
    required int groupId,
    required DateTime startsAt,
    required DateTime expiresAt,
    required String status,
    DateTime? dailyWindowStart,
    DateTime? weeklyWindowStart,
    DateTime? monthlyWindowStart,
    required Sub2ApiDecimal dailyUsageUsd,
    required Sub2ApiDecimal weeklyUsageUsd,
    required Sub2ApiDecimal monthlyUsageUsd,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? revokedAt,
    Sub2ApiCommerceGroupSummary? group,
  }) = _Sub2ApiUserSubscription;
}

/// One daily, weekly, or monthly subscription usage window.
@freezed
abstract class Sub2ApiSubscriptionUsageWindow
    with _$Sub2ApiSubscriptionUsageWindow {
  const factory Sub2ApiSubscriptionUsageWindow({
    required Sub2ApiDecimal limitUsd,
    required Sub2ApiDecimal usedUsd,
    required Sub2ApiDecimal remainingUsd,
    required Sub2ApiDecimal percentage,
    required DateTime windowStart,
    required DateTime resetsAt,
    required int resetsInSeconds,
  }) = _Sub2ApiSubscriptionUsageWindow;
}

/// Calculated progress for one active subscription.
@freezed
abstract class Sub2ApiSubscriptionProgress with _$Sub2ApiSubscriptionProgress {
  const factory Sub2ApiSubscriptionProgress({
    required int id,
    required String groupName,
    required DateTime expiresAt,
    required int expiresInDays,
    Sub2ApiSubscriptionUsageWindow? daily,
    Sub2ApiSubscriptionUsageWindow? weekly,
    Sub2ApiSubscriptionUsageWindow? monthly,
  }) = _Sub2ApiSubscriptionProgress;
}

/// Subscription paired with its calculated progress.
@freezed
abstract class Sub2ApiSubscriptionProgressInfo
    with _$Sub2ApiSubscriptionProgressInfo {
  const factory Sub2ApiSubscriptionProgressInfo({
    required Sub2ApiUserSubscription subscription,
    required Sub2ApiSubscriptionProgress progress,
  }) = _Sub2ApiSubscriptionProgressInfo;
}

/// Compact subscription row used by the dashboard summary.
@freezed
abstract class Sub2ApiSubscriptionSummaryItem
    with _$Sub2ApiSubscriptionSummaryItem {
  const factory Sub2ApiSubscriptionSummaryItem({
    required int id,
    required int groupId,
    required String groupName,
    required String status,
    required Sub2ApiDecimal dailyUsedUsd,
    required Sub2ApiDecimal dailyLimitUsd,
    required Sub2ApiDecimal weeklyUsedUsd,
    required Sub2ApiDecimal weeklyLimitUsd,
    required Sub2ApiDecimal monthlyUsedUsd,
    required Sub2ApiDecimal monthlyLimitUsd,
    DateTime? expiresAt,
  }) = _Sub2ApiSubscriptionSummaryItem;
}

/// Current-user active subscription count and monthly usage total.
@freezed
abstract class Sub2ApiSubscriptionSummary with _$Sub2ApiSubscriptionSummary {
  const factory Sub2ApiSubscriptionSummary({
    required int activeCount,
    required Sub2ApiDecimal totalUsedUsd,
    required List<Sub2ApiSubscriptionSummaryItem> subscriptions,
  }) = _Sub2ApiSubscriptionSummary;
}

/// Official catalog reference prices for a model-plaza entry.
@freezed
abstract class Sub2ApiModelPlazaOfficialPricing
    with _$Sub2ApiModelPlazaOfficialPricing {
  const factory Sub2ApiModelPlazaOfficialPricing({
    Sub2ApiDecimal? inputPrice,
    Sub2ApiDecimal? outputPrice,
    Sub2ApiDecimal? cacheWritePrice,
    Sub2ApiDecimal? cacheWrite1hPrice,
    Sub2ApiDecimal? cacheReadPrice,
    required List<Sub2ApiPricingInterval> intervals,
  }) = _Sub2ApiModelPlazaOfficialPricing;
}

/// One time-of-day price multiplier period.
@freezed
abstract class Sub2ApiModelPlazaTimePeriod with _$Sub2ApiModelPlazaTimePeriod {
  const factory Sub2ApiModelPlazaTimePeriod({
    required String startTime,
    required String endTime,
    required Sub2ApiDecimal multiplier,
  }) = _Sub2ApiModelPlazaTimePeriod;
}

/// Timezone-aware pricing schedule displayed by the model plaza.
@freezed
abstract class Sub2ApiModelPlazaTimePricing
    with _$Sub2ApiModelPlazaTimePricing {
  const factory Sub2ApiModelPlazaTimePricing({
    required String timezone,
    required bool weekdaysOnly,
    required List<Sub2ApiModelPlazaTimePeriod> periods,
  }) = _Sub2ApiModelPlazaTimePricing;
}

/// One priced model in a model-plaza group.
@freezed
abstract class Sub2ApiModelPlazaModel with _$Sub2ApiModelPlazaModel {
  const factory Sub2ApiModelPlazaModel({
    required String name,
    required String platform,
    Sub2ApiSupportedModelPricing? pricing,
    Sub2ApiModelPlazaOfficialPricing? officialPricing,
    String? longContextBasis,
    Sub2ApiModelPlazaTimePricing? timePricing,
  }) = _Sub2ApiModelPlazaModel;
}

/// One group and its user-visible models in the model plaza.
@freezed
abstract class Sub2ApiModelPlazaGroup with _$Sub2ApiModelPlazaGroup {
  const factory Sub2ApiModelPlazaGroup({
    required int id,
    required String name,
    required String description,
    required String platform,
    required String subscriptionType,
    required Sub2ApiDecimal rateMultiplier,
    Sub2ApiDecimal? userRateMultiplier,
    required bool peakRateEnabled,
    required String peakStart,
    required String peakEnd,
    required Sub2ApiDecimal peakRateMultiplier,
    required bool isExclusive,
    required bool imageRateIndependent,
    required Sub2ApiDecimal imageRateMultiplier,
    required bool longContextPricingEnabled,
    required List<Sub2ApiModelPlazaModel> models,
  }) = _Sub2ApiModelPlazaGroup;
}

/// Public or authenticated model-plaza response.
@freezed
abstract class Sub2ApiModelPlaza with _$Sub2ApiModelPlaza {
  const factory Sub2ApiModelPlaza({
    required String description,
    required List<Sub2ApiModelPlazaGroup> groups,
  }) = _Sub2ApiModelPlaza;
}
