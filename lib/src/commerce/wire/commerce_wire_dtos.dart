import 'package:json_annotation/json_annotation.dart';

import '../../access/wire/access_wire_dtos.dart';

part 'commerce_wire_dtos.g.dart';

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class AnnouncementWireDto {
  const AnnouncementWireDto({
    required this.id,
    required this.title,
    required this.content,
    required this.notifyMode,
    required this.createdAt,
    required this.updatedAt,
    this.startsAt,
    this.endsAt,
    this.readAt,
  });

  factory AnnouncementWireDto.fromJson(Map<String, Object?> json) =>
      _$AnnouncementWireDtoFromJson(json);

  final int id;
  final String title;
  final String content;
  final String notifyMode;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final DateTime? readAt;
  final DateTime createdAt;
  final DateTime updatedAt;
}

@JsonSerializable(createToJson: false, checked: true)
final class CommerceMessageWireDto {
  const CommerceMessageWireDto({required this.message});

  factory CommerceMessageWireDto.fromJson(Map<String, Object?> json) =>
      _$CommerceMessageWireDtoFromJson(json);

  final String message;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class CommerceGroupWireDto {
  const CommerceGroupWireDto({
    required this.id,
    required this.name,
    required this.platform,
    required this.subscriptionType,
  });

  factory CommerceGroupWireDto.fromJson(Map<String, Object?> json) =>
      _$CommerceGroupWireDtoFromJson(json);

  final int id;
  final String name;
  final String platform;
  final String subscriptionType;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class RedeemRecordWireDto {
  const RedeemRecordWireDto({
    required this.id,
    required this.code,
    required this.type,
    required this.value,
    required this.status,
    required this.createdAt,
    required this.validityDays,
    this.usedBy,
    this.usedAt,
    this.expiresAt,
    this.groupId,
    this.notes,
    this.group,
  });

  factory RedeemRecordWireDto.fromJson(Map<String, Object?> json) =>
      _$RedeemRecordWireDtoFromJson(json);

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
  final String? notes;
  final CommerceGroupWireDto? group;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class UserSubscriptionWireDto {
  const UserSubscriptionWireDto({
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
    this.group,
  });

  factory UserSubscriptionWireDto.fromJson(Map<String, Object?> json) =>
      _$UserSubscriptionWireDtoFromJson(json);

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
  final CommerceGroupWireDto? group;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class SubscriptionUsageWindowWireDto {
  const SubscriptionUsageWindowWireDto({
    required this.limitUsd,
    required this.usedUsd,
    required this.remainingUsd,
    required this.percentage,
    required this.windowStart,
    required this.resetsAt,
    required this.resetsInSeconds,
  });

  factory SubscriptionUsageWindowWireDto.fromJson(Map<String, Object?> json) =>
      _$SubscriptionUsageWindowWireDtoFromJson(json);

  final num limitUsd;
  final num usedUsd;
  final num remainingUsd;
  final num percentage;
  final DateTime windowStart;
  final DateTime resetsAt;
  final int resetsInSeconds;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class SubscriptionProgressWireDto {
  const SubscriptionProgressWireDto({
    required this.id,
    required this.groupName,
    required this.expiresAt,
    required this.expiresInDays,
    this.daily,
    this.weekly,
    this.monthly,
  });

  factory SubscriptionProgressWireDto.fromJson(Map<String, Object?> json) =>
      _$SubscriptionProgressWireDtoFromJson(json);

  final int id;
  final String groupName;
  final DateTime expiresAt;
  final int expiresInDays;
  final SubscriptionUsageWindowWireDto? daily;
  final SubscriptionUsageWindowWireDto? weekly;
  final SubscriptionUsageWindowWireDto? monthly;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class SubscriptionProgressInfoWireDto {
  const SubscriptionProgressInfoWireDto({
    required this.subscription,
    required this.progress,
  });

  factory SubscriptionProgressInfoWireDto.fromJson(Map<String, Object?> json) =>
      _$SubscriptionProgressInfoWireDtoFromJson(json);

  final UserSubscriptionWireDto subscription;
  final SubscriptionProgressWireDto progress;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class SubscriptionSummaryItemWireDto {
  const SubscriptionSummaryItemWireDto({
    required this.id,
    required this.groupId,
    required this.groupName,
    required this.status,
    this.dailyUsedUsd = 0,
    this.dailyLimitUsd = 0,
    this.weeklyUsedUsd = 0,
    this.weeklyLimitUsd = 0,
    this.monthlyUsedUsd = 0,
    this.monthlyLimitUsd = 0,
    this.expiresAt,
  });

  factory SubscriptionSummaryItemWireDto.fromJson(Map<String, Object?> json) =>
      _$SubscriptionSummaryItemWireDtoFromJson(json);

  final int id;
  final int groupId;
  final String groupName;
  final String status;
  @JsonKey(defaultValue: 0)
  final num dailyUsedUsd;
  @JsonKey(defaultValue: 0)
  final num dailyLimitUsd;
  @JsonKey(defaultValue: 0)
  final num weeklyUsedUsd;
  @JsonKey(defaultValue: 0)
  final num weeklyLimitUsd;
  @JsonKey(defaultValue: 0)
  final num monthlyUsedUsd;
  @JsonKey(defaultValue: 0)
  final num monthlyLimitUsd;
  final DateTime? expiresAt;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class SubscriptionSummaryWireDto {
  const SubscriptionSummaryWireDto({
    required this.activeCount,
    required this.totalUsedUsd,
    required this.subscriptions,
  });

  factory SubscriptionSummaryWireDto.fromJson(Map<String, Object?> json) =>
      _$SubscriptionSummaryWireDtoFromJson(json);

  final int activeCount;
  final num totalUsedUsd;
  final List<SubscriptionSummaryItemWireDto> subscriptions;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class ModelPlazaOfficialPricingWireDto {
  const ModelPlazaOfficialPricingWireDto({
    required this.inputPrice,
    required this.outputPrice,
    required this.cacheWritePrice,
    required this.cacheReadPrice,
    this.cacheWrite1hPrice,
    this.intervals = const <PricingIntervalWireDto>[],
  });

  factory ModelPlazaOfficialPricingWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$ModelPlazaOfficialPricingWireDtoFromJson(json);

  final num? inputPrice;
  final num? outputPrice;
  final num? cacheWritePrice;
  @JsonKey(name: 'cache_write_1h_price')
  final num? cacheWrite1hPrice;
  final num? cacheReadPrice;
  @JsonKey(defaultValue: <PricingIntervalWireDto>[])
  final List<PricingIntervalWireDto> intervals;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class ModelPlazaTimePeriodWireDto {
  const ModelPlazaTimePeriodWireDto({
    required this.startTime,
    required this.endTime,
    required this.multiplier,
  });

  factory ModelPlazaTimePeriodWireDto.fromJson(Map<String, Object?> json) =>
      _$ModelPlazaTimePeriodWireDtoFromJson(json);

  final String startTime;
  final String endTime;
  final num multiplier;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class ModelPlazaTimePricingWireDto {
  const ModelPlazaTimePricingWireDto({
    required this.timezone,
    required this.periods,
    this.weekdaysOnly = false,
  });

  factory ModelPlazaTimePricingWireDto.fromJson(Map<String, Object?> json) =>
      _$ModelPlazaTimePricingWireDtoFromJson(json);

  final String timezone;
  @JsonKey(defaultValue: false)
  final bool weekdaysOnly;
  final List<ModelPlazaTimePeriodWireDto> periods;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class ModelPlazaModelWireDto {
  const ModelPlazaModelWireDto({
    required this.name,
    required this.platform,
    this.pricing,
    this.officialPricing,
    this.longContextBasis,
    this.timePricing,
  });

  factory ModelPlazaModelWireDto.fromJson(Map<String, Object?> json) =>
      _$ModelPlazaModelWireDtoFromJson(json);

  final String name;
  final String platform;
  final SupportedModelPricingWireDto? pricing;
  final ModelPlazaOfficialPricingWireDto? officialPricing;
  final String? longContextBasis;
  final ModelPlazaTimePricingWireDto? timePricing;
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class ModelPlazaGroupWireDto {
  const ModelPlazaGroupWireDto({
    required this.id,
    required this.name,
    required this.description,
    required this.platform,
    required this.subscriptionType,
    required this.rateMultiplier,
    required this.peakRateEnabled,
    required this.peakStart,
    required this.peakEnd,
    required this.peakRateMultiplier,
    required this.isExclusive,
    required this.imageRateIndependent,
    required this.imageRateMultiplier,
    required this.longContextPricingEnabled,
    required this.models,
    this.userRateMultiplier,
  });

  factory ModelPlazaGroupWireDto.fromJson(Map<String, Object?> json) =>
      _$ModelPlazaGroupWireDtoFromJson(json);

  final int id;
  final String name;
  final String description;
  final String platform;
  final String subscriptionType;
  final num rateMultiplier;
  final num? userRateMultiplier;
  final bool peakRateEnabled;
  final String peakStart;
  final String peakEnd;
  final num peakRateMultiplier;
  final bool isExclusive;
  final bool imageRateIndependent;
  final num imageRateMultiplier;
  final bool longContextPricingEnabled;
  final List<ModelPlazaModelWireDto> models;
}

@JsonSerializable(createToJson: false, checked: true)
final class ModelPlazaWireDto {
  const ModelPlazaWireDto({required this.description, required this.groups});

  factory ModelPlazaWireDto.fromJson(Map<String, Object?> json) =>
      _$ModelPlazaWireDtoFromJson(json);

  final String description;
  final List<ModelPlazaGroupWireDto> groups;
}
