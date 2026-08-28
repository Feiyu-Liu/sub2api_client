// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_access_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sub2ApiReasoningEffortMapping {
  String get from;
  String get to;

  /// Create a copy of Sub2ApiReasoningEffortMapping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiReasoningEffortMappingCopyWith<Sub2ApiReasoningEffortMapping>
  get copyWith =>
      _$Sub2ApiReasoningEffortMappingCopyWithImpl<
        Sub2ApiReasoningEffortMapping
      >(this as Sub2ApiReasoningEffortMapping, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiReasoningEffortMapping &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  @override
  String toString() {
    return 'Sub2ApiReasoningEffortMapping(from: $from, to: $to)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiReasoningEffortMappingCopyWith<$Res> {
  factory $Sub2ApiReasoningEffortMappingCopyWith(
    Sub2ApiReasoningEffortMapping value,
    $Res Function(Sub2ApiReasoningEffortMapping) _then,
  ) = _$Sub2ApiReasoningEffortMappingCopyWithImpl;
  @useResult
  $Res call({String from, String to});
}

/// @nodoc
class _$Sub2ApiReasoningEffortMappingCopyWithImpl<$Res>
    implements $Sub2ApiReasoningEffortMappingCopyWith<$Res> {
  _$Sub2ApiReasoningEffortMappingCopyWithImpl(this._self, this._then);

  final Sub2ApiReasoningEffortMapping _self;
  final $Res Function(Sub2ApiReasoningEffortMapping) _then;

  /// Create a copy of Sub2ApiReasoningEffortMapping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? from = null, Object? to = null}) {
    return _then(
      _self.copyWith(
        from: null == from
            ? _self.from
            : from // ignore: cast_nullable_to_non_nullable
                  as String,
        to: null == to
            ? _self.to
            : to // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiReasoningEffortMapping].
extension Sub2ApiReasoningEffortMappingPatterns
    on Sub2ApiReasoningEffortMapping {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiReasoningEffortMapping value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiReasoningEffortMapping() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiReasoningEffortMapping value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiReasoningEffortMapping():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiReasoningEffortMapping value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiReasoningEffortMapping() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String from, String to)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiReasoningEffortMapping() when $default != null:
        return $default(_that.from, _that.to);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String from, String to) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiReasoningEffortMapping():
        return $default(_that.from, _that.to);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String from, String to)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiReasoningEffortMapping() when $default != null:
        return $default(_that.from, _that.to);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiReasoningEffortMapping implements Sub2ApiReasoningEffortMapping {
  const _Sub2ApiReasoningEffortMapping({required this.from, required this.to});

  @override
  final String from;
  @override
  final String to;

  /// Create a copy of Sub2ApiReasoningEffortMapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiReasoningEffortMappingCopyWith<_Sub2ApiReasoningEffortMapping>
  get copyWith =>
      __$Sub2ApiReasoningEffortMappingCopyWithImpl<
        _Sub2ApiReasoningEffortMapping
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiReasoningEffortMapping &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  @override
  String toString() {
    return 'Sub2ApiReasoningEffortMapping(from: $from, to: $to)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiReasoningEffortMappingCopyWith<$Res>
    implements $Sub2ApiReasoningEffortMappingCopyWith<$Res> {
  factory _$Sub2ApiReasoningEffortMappingCopyWith(
    _Sub2ApiReasoningEffortMapping value,
    $Res Function(_Sub2ApiReasoningEffortMapping) _then,
  ) = __$Sub2ApiReasoningEffortMappingCopyWithImpl;
  @override
  @useResult
  $Res call({String from, String to});
}

/// @nodoc
class __$Sub2ApiReasoningEffortMappingCopyWithImpl<$Res>
    implements _$Sub2ApiReasoningEffortMappingCopyWith<$Res> {
  __$Sub2ApiReasoningEffortMappingCopyWithImpl(this._self, this._then);

  final _Sub2ApiReasoningEffortMapping _self;
  final $Res Function(_Sub2ApiReasoningEffortMapping) _then;

  /// Create a copy of Sub2ApiReasoningEffortMapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? from = null, Object? to = null}) {
    return _then(
      _Sub2ApiReasoningEffortMapping(
        from: null == from
            ? _self.from
            : from // ignore: cast_nullable_to_non_nullable
                  as String,
        to: null == to
            ? _self.to
            : to // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiAvailableGroup {
  int get id;
  String get name;
  String get description;
  String get platform;
  Sub2ApiDecimal get rateMultiplier;
  bool get isExclusive;
  String get status;
  String get subscriptionType;
  Sub2ApiDecimal? get dailyLimitUsd;
  Sub2ApiDecimal? get weeklyLimitUsd;
  Sub2ApiDecimal? get monthlyLimitUsd;
  bool get longContextPricingEnabled;
  bool get allowImageGeneration;
  bool get allowBatchImageGeneration;
  bool get imageRateIndependent;
  Sub2ApiDecimal get imageRateMultiplier;
  Sub2ApiDecimal get batchImageDiscountMultiplier;
  Sub2ApiDecimal get batchImageHoldMultiplier;
  bool get videoRateIndependent;
  Sub2ApiDecimal get videoRateMultiplier;
  bool get peakRateEnabled;
  String get peakStart;
  String get peakEnd;
  Sub2ApiDecimal get peakRateMultiplier;
  Sub2ApiDecimal? get imagePrice1k;
  Sub2ApiDecimal? get imagePrice2k;
  Sub2ApiDecimal? get imagePrice4k;
  Sub2ApiDecimal? get videoPrice480p;
  Sub2ApiDecimal? get videoPrice720p;
  Sub2ApiDecimal? get videoPrice1080p;
  Map<String, Map<String, Sub2ApiDecimal>> get videoModelPrices;
  Sub2ApiDecimal? get webSearchPricePerCall;
  Sub2ApiDecimal? get searchPricePer1k;
  Sub2ApiDecimal? get audioRealtimePricePerMin;
  Sub2ApiDecimal? get audioTtsPricePerMillionChars;
  Sub2ApiDecimal? get audioSttPricePerHour;
  bool get claudeCodeOnly;
  int? get fallbackGroupId;
  int? get fallbackGroupIdOnInvalidRequest;
  bool get allowMessagesDispatch;
  bool get allowLive;
  bool get requireOAuthOnly;
  bool get requirePrivacySet;
  int get rpmLimit;
  String get maxReasoningEffort;
  List<Sub2ApiReasoningEffortMapping> get reasoningEffortMappings;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of Sub2ApiAvailableGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiAvailableGroupCopyWith<Sub2ApiAvailableGroup> get copyWith =>
      _$Sub2ApiAvailableGroupCopyWithImpl<Sub2ApiAvailableGroup>(
        this as Sub2ApiAvailableGroup,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiAvailableGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.rateMultiplier, rateMultiplier) ||
                other.rateMultiplier == rateMultiplier) &&
            (identical(other.isExclusive, isExclusive) ||
                other.isExclusive == isExclusive) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.subscriptionType, subscriptionType) ||
                other.subscriptionType == subscriptionType) &&
            (identical(other.dailyLimitUsd, dailyLimitUsd) ||
                other.dailyLimitUsd == dailyLimitUsd) &&
            (identical(other.weeklyLimitUsd, weeklyLimitUsd) ||
                other.weeklyLimitUsd == weeklyLimitUsd) &&
            (identical(other.monthlyLimitUsd, monthlyLimitUsd) ||
                other.monthlyLimitUsd == monthlyLimitUsd) &&
            (identical(
                  other.longContextPricingEnabled,
                  longContextPricingEnabled,
                ) ||
                other.longContextPricingEnabled == longContextPricingEnabled) &&
            (identical(other.allowImageGeneration, allowImageGeneration) ||
                other.allowImageGeneration == allowImageGeneration) &&
            (identical(
                  other.allowBatchImageGeneration,
                  allowBatchImageGeneration,
                ) ||
                other.allowBatchImageGeneration == allowBatchImageGeneration) &&
            (identical(other.imageRateIndependent, imageRateIndependent) ||
                other.imageRateIndependent == imageRateIndependent) &&
            (identical(other.imageRateMultiplier, imageRateMultiplier) ||
                other.imageRateMultiplier == imageRateMultiplier) &&
            (identical(
                  other.batchImageDiscountMultiplier,
                  batchImageDiscountMultiplier,
                ) ||
                other.batchImageDiscountMultiplier ==
                    batchImageDiscountMultiplier) &&
            (identical(
                  other.batchImageHoldMultiplier,
                  batchImageHoldMultiplier,
                ) ||
                other.batchImageHoldMultiplier == batchImageHoldMultiplier) &&
            (identical(other.videoRateIndependent, videoRateIndependent) ||
                other.videoRateIndependent == videoRateIndependent) &&
            (identical(other.videoRateMultiplier, videoRateMultiplier) ||
                other.videoRateMultiplier == videoRateMultiplier) &&
            (identical(other.peakRateEnabled, peakRateEnabled) ||
                other.peakRateEnabled == peakRateEnabled) &&
            (identical(other.peakStart, peakStart) ||
                other.peakStart == peakStart) &&
            (identical(other.peakEnd, peakEnd) || other.peakEnd == peakEnd) &&
            (identical(other.peakRateMultiplier, peakRateMultiplier) ||
                other.peakRateMultiplier == peakRateMultiplier) &&
            (identical(other.imagePrice1k, imagePrice1k) ||
                other.imagePrice1k == imagePrice1k) &&
            (identical(other.imagePrice2k, imagePrice2k) ||
                other.imagePrice2k == imagePrice2k) &&
            (identical(other.imagePrice4k, imagePrice4k) ||
                other.imagePrice4k == imagePrice4k) &&
            (identical(other.videoPrice480p, videoPrice480p) ||
                other.videoPrice480p == videoPrice480p) &&
            (identical(other.videoPrice720p, videoPrice720p) ||
                other.videoPrice720p == videoPrice720p) &&
            (identical(other.videoPrice1080p, videoPrice1080p) ||
                other.videoPrice1080p == videoPrice1080p) &&
            const DeepCollectionEquality().equals(
              other.videoModelPrices,
              videoModelPrices,
            ) &&
            (identical(other.webSearchPricePerCall, webSearchPricePerCall) ||
                other.webSearchPricePerCall == webSearchPricePerCall) &&
            (identical(other.searchPricePer1k, searchPricePer1k) ||
                other.searchPricePer1k == searchPricePer1k) &&
            (identical(
                  other.audioRealtimePricePerMin,
                  audioRealtimePricePerMin,
                ) ||
                other.audioRealtimePricePerMin == audioRealtimePricePerMin) &&
            (identical(
                  other.audioTtsPricePerMillionChars,
                  audioTtsPricePerMillionChars,
                ) ||
                other.audioTtsPricePerMillionChars ==
                    audioTtsPricePerMillionChars) &&
            (identical(other.audioSttPricePerHour, audioSttPricePerHour) ||
                other.audioSttPricePerHour == audioSttPricePerHour) &&
            (identical(other.claudeCodeOnly, claudeCodeOnly) ||
                other.claudeCodeOnly == claudeCodeOnly) &&
            (identical(other.fallbackGroupId, fallbackGroupId) ||
                other.fallbackGroupId == fallbackGroupId) &&
            (identical(
                  other.fallbackGroupIdOnInvalidRequest,
                  fallbackGroupIdOnInvalidRequest,
                ) ||
                other.fallbackGroupIdOnInvalidRequest ==
                    fallbackGroupIdOnInvalidRequest) &&
            (identical(other.allowMessagesDispatch, allowMessagesDispatch) ||
                other.allowMessagesDispatch == allowMessagesDispatch) &&
            (identical(other.allowLive, allowLive) ||
                other.allowLive == allowLive) &&
            (identical(other.requireOAuthOnly, requireOAuthOnly) ||
                other.requireOAuthOnly == requireOAuthOnly) &&
            (identical(other.requirePrivacySet, requirePrivacySet) ||
                other.requirePrivacySet == requirePrivacySet) &&
            (identical(other.rpmLimit, rpmLimit) ||
                other.rpmLimit == rpmLimit) &&
            (identical(other.maxReasoningEffort, maxReasoningEffort) ||
                other.maxReasoningEffort == maxReasoningEffort) &&
            const DeepCollectionEquality().equals(
              other.reasoningEffortMappings,
              reasoningEffortMappings,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    name,
    description,
    platform,
    rateMultiplier,
    isExclusive,
    status,
    subscriptionType,
    dailyLimitUsd,
    weeklyLimitUsd,
    monthlyLimitUsd,
    longContextPricingEnabled,
    allowImageGeneration,
    allowBatchImageGeneration,
    imageRateIndependent,
    imageRateMultiplier,
    batchImageDiscountMultiplier,
    batchImageHoldMultiplier,
    videoRateIndependent,
    videoRateMultiplier,
    peakRateEnabled,
    peakStart,
    peakEnd,
    peakRateMultiplier,
    imagePrice1k,
    imagePrice2k,
    imagePrice4k,
    videoPrice480p,
    videoPrice720p,
    videoPrice1080p,
    const DeepCollectionEquality().hash(videoModelPrices),
    webSearchPricePerCall,
    searchPricePer1k,
    audioRealtimePricePerMin,
    audioTtsPricePerMillionChars,
    audioSttPricePerHour,
    claudeCodeOnly,
    fallbackGroupId,
    fallbackGroupIdOnInvalidRequest,
    allowMessagesDispatch,
    allowLive,
    requireOAuthOnly,
    requirePrivacySet,
    rpmLimit,
    maxReasoningEffort,
    const DeepCollectionEquality().hash(reasoningEffortMappings),
    createdAt,
    updatedAt,
  ]);

  @override
  String toString() {
    return 'Sub2ApiAvailableGroup(id: $id, name: $name, description: $description, platform: $platform, rateMultiplier: $rateMultiplier, isExclusive: $isExclusive, status: $status, subscriptionType: $subscriptionType, dailyLimitUsd: $dailyLimitUsd, weeklyLimitUsd: $weeklyLimitUsd, monthlyLimitUsd: $monthlyLimitUsd, longContextPricingEnabled: $longContextPricingEnabled, allowImageGeneration: $allowImageGeneration, allowBatchImageGeneration: $allowBatchImageGeneration, imageRateIndependent: $imageRateIndependent, imageRateMultiplier: $imageRateMultiplier, batchImageDiscountMultiplier: $batchImageDiscountMultiplier, batchImageHoldMultiplier: $batchImageHoldMultiplier, videoRateIndependent: $videoRateIndependent, videoRateMultiplier: $videoRateMultiplier, peakRateEnabled: $peakRateEnabled, peakStart: $peakStart, peakEnd: $peakEnd, peakRateMultiplier: $peakRateMultiplier, imagePrice1k: $imagePrice1k, imagePrice2k: $imagePrice2k, imagePrice4k: $imagePrice4k, videoPrice480p: $videoPrice480p, videoPrice720p: $videoPrice720p, videoPrice1080p: $videoPrice1080p, videoModelPrices: $videoModelPrices, webSearchPricePerCall: $webSearchPricePerCall, searchPricePer1k: $searchPricePer1k, audioRealtimePricePerMin: $audioRealtimePricePerMin, audioTtsPricePerMillionChars: $audioTtsPricePerMillionChars, audioSttPricePerHour: $audioSttPricePerHour, claudeCodeOnly: $claudeCodeOnly, fallbackGroupId: $fallbackGroupId, fallbackGroupIdOnInvalidRequest: $fallbackGroupIdOnInvalidRequest, allowMessagesDispatch: $allowMessagesDispatch, allowLive: $allowLive, requireOAuthOnly: $requireOAuthOnly, requirePrivacySet: $requirePrivacySet, rpmLimit: $rpmLimit, maxReasoningEffort: $maxReasoningEffort, reasoningEffortMappings: $reasoningEffortMappings, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiAvailableGroupCopyWith<$Res> {
  factory $Sub2ApiAvailableGroupCopyWith(
    Sub2ApiAvailableGroup value,
    $Res Function(Sub2ApiAvailableGroup) _then,
  ) = _$Sub2ApiAvailableGroupCopyWithImpl;
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    String platform,
    Sub2ApiDecimal rateMultiplier,
    bool isExclusive,
    String status,
    String subscriptionType,
    Sub2ApiDecimal? dailyLimitUsd,
    Sub2ApiDecimal? weeklyLimitUsd,
    Sub2ApiDecimal? monthlyLimitUsd,
    bool longContextPricingEnabled,
    bool allowImageGeneration,
    bool allowBatchImageGeneration,
    bool imageRateIndependent,
    Sub2ApiDecimal imageRateMultiplier,
    Sub2ApiDecimal batchImageDiscountMultiplier,
    Sub2ApiDecimal batchImageHoldMultiplier,
    bool videoRateIndependent,
    Sub2ApiDecimal videoRateMultiplier,
    bool peakRateEnabled,
    String peakStart,
    String peakEnd,
    Sub2ApiDecimal peakRateMultiplier,
    Sub2ApiDecimal? imagePrice1k,
    Sub2ApiDecimal? imagePrice2k,
    Sub2ApiDecimal? imagePrice4k,
    Sub2ApiDecimal? videoPrice480p,
    Sub2ApiDecimal? videoPrice720p,
    Sub2ApiDecimal? videoPrice1080p,
    Map<String, Map<String, Sub2ApiDecimal>> videoModelPrices,
    Sub2ApiDecimal? webSearchPricePerCall,
    Sub2ApiDecimal? searchPricePer1k,
    Sub2ApiDecimal? audioRealtimePricePerMin,
    Sub2ApiDecimal? audioTtsPricePerMillionChars,
    Sub2ApiDecimal? audioSttPricePerHour,
    bool claudeCodeOnly,
    int? fallbackGroupId,
    int? fallbackGroupIdOnInvalidRequest,
    bool allowMessagesDispatch,
    bool allowLive,
    bool requireOAuthOnly,
    bool requirePrivacySet,
    int rpmLimit,
    String maxReasoningEffort,
    List<Sub2ApiReasoningEffortMapping> reasoningEffortMappings,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$Sub2ApiAvailableGroupCopyWithImpl<$Res>
    implements $Sub2ApiAvailableGroupCopyWith<$Res> {
  _$Sub2ApiAvailableGroupCopyWithImpl(this._self, this._then);

  final Sub2ApiAvailableGroup _self;
  final $Res Function(Sub2ApiAvailableGroup) _then;

  /// Create a copy of Sub2ApiAvailableGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? platform = null,
    Object? rateMultiplier = null,
    Object? isExclusive = null,
    Object? status = null,
    Object? subscriptionType = null,
    Object? dailyLimitUsd = freezed,
    Object? weeklyLimitUsd = freezed,
    Object? monthlyLimitUsd = freezed,
    Object? longContextPricingEnabled = null,
    Object? allowImageGeneration = null,
    Object? allowBatchImageGeneration = null,
    Object? imageRateIndependent = null,
    Object? imageRateMultiplier = null,
    Object? batchImageDiscountMultiplier = null,
    Object? batchImageHoldMultiplier = null,
    Object? videoRateIndependent = null,
    Object? videoRateMultiplier = null,
    Object? peakRateEnabled = null,
    Object? peakStart = null,
    Object? peakEnd = null,
    Object? peakRateMultiplier = null,
    Object? imagePrice1k = freezed,
    Object? imagePrice2k = freezed,
    Object? imagePrice4k = freezed,
    Object? videoPrice480p = freezed,
    Object? videoPrice720p = freezed,
    Object? videoPrice1080p = freezed,
    Object? videoModelPrices = null,
    Object? webSearchPricePerCall = freezed,
    Object? searchPricePer1k = freezed,
    Object? audioRealtimePricePerMin = freezed,
    Object? audioTtsPricePerMillionChars = freezed,
    Object? audioSttPricePerHour = freezed,
    Object? claudeCodeOnly = null,
    Object? fallbackGroupId = freezed,
    Object? fallbackGroupIdOnInvalidRequest = freezed,
    Object? allowMessagesDispatch = null,
    Object? allowLive = null,
    Object? requireOAuthOnly = null,
    Object? requirePrivacySet = null,
    Object? rpmLimit = null,
    Object? maxReasoningEffort = null,
    Object? reasoningEffortMappings = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        rateMultiplier: null == rateMultiplier
            ? _self.rateMultiplier
            : rateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        isExclusive: null == isExclusive
            ? _self.isExclusive
            : isExclusive // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        subscriptionType: null == subscriptionType
            ? _self.subscriptionType
            : subscriptionType // ignore: cast_nullable_to_non_nullable
                  as String,
        dailyLimitUsd: freezed == dailyLimitUsd
            ? _self.dailyLimitUsd
            : dailyLimitUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        weeklyLimitUsd: freezed == weeklyLimitUsd
            ? _self.weeklyLimitUsd
            : weeklyLimitUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        monthlyLimitUsd: freezed == monthlyLimitUsd
            ? _self.monthlyLimitUsd
            : monthlyLimitUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        longContextPricingEnabled: null == longContextPricingEnabled
            ? _self.longContextPricingEnabled
            : longContextPricingEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowImageGeneration: null == allowImageGeneration
            ? _self.allowImageGeneration
            : allowImageGeneration // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowBatchImageGeneration: null == allowBatchImageGeneration
            ? _self.allowBatchImageGeneration
            : allowBatchImageGeneration // ignore: cast_nullable_to_non_nullable
                  as bool,
        imageRateIndependent: null == imageRateIndependent
            ? _self.imageRateIndependent
            : imageRateIndependent // ignore: cast_nullable_to_non_nullable
                  as bool,
        imageRateMultiplier: null == imageRateMultiplier
            ? _self.imageRateMultiplier
            : imageRateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        batchImageDiscountMultiplier: null == batchImageDiscountMultiplier
            ? _self.batchImageDiscountMultiplier
            : batchImageDiscountMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        batchImageHoldMultiplier: null == batchImageHoldMultiplier
            ? _self.batchImageHoldMultiplier
            : batchImageHoldMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        videoRateIndependent: null == videoRateIndependent
            ? _self.videoRateIndependent
            : videoRateIndependent // ignore: cast_nullable_to_non_nullable
                  as bool,
        videoRateMultiplier: null == videoRateMultiplier
            ? _self.videoRateMultiplier
            : videoRateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        peakRateEnabled: null == peakRateEnabled
            ? _self.peakRateEnabled
            : peakRateEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        peakStart: null == peakStart
            ? _self.peakStart
            : peakStart // ignore: cast_nullable_to_non_nullable
                  as String,
        peakEnd: null == peakEnd
            ? _self.peakEnd
            : peakEnd // ignore: cast_nullable_to_non_nullable
                  as String,
        peakRateMultiplier: null == peakRateMultiplier
            ? _self.peakRateMultiplier
            : peakRateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        imagePrice1k: freezed == imagePrice1k
            ? _self.imagePrice1k
            : imagePrice1k // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        imagePrice2k: freezed == imagePrice2k
            ? _self.imagePrice2k
            : imagePrice2k // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        imagePrice4k: freezed == imagePrice4k
            ? _self.imagePrice4k
            : imagePrice4k // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        videoPrice480p: freezed == videoPrice480p
            ? _self.videoPrice480p
            : videoPrice480p // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        videoPrice720p: freezed == videoPrice720p
            ? _self.videoPrice720p
            : videoPrice720p // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        videoPrice1080p: freezed == videoPrice1080p
            ? _self.videoPrice1080p
            : videoPrice1080p // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        videoModelPrices: null == videoModelPrices
            ? _self.videoModelPrices
            : videoModelPrices // ignore: cast_nullable_to_non_nullable
                  as Map<String, Map<String, Sub2ApiDecimal>>,
        webSearchPricePerCall: freezed == webSearchPricePerCall
            ? _self.webSearchPricePerCall
            : webSearchPricePerCall // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        searchPricePer1k: freezed == searchPricePer1k
            ? _self.searchPricePer1k
            : searchPricePer1k // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        audioRealtimePricePerMin: freezed == audioRealtimePricePerMin
            ? _self.audioRealtimePricePerMin
            : audioRealtimePricePerMin // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        audioTtsPricePerMillionChars: freezed == audioTtsPricePerMillionChars
            ? _self.audioTtsPricePerMillionChars
            : audioTtsPricePerMillionChars // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        audioSttPricePerHour: freezed == audioSttPricePerHour
            ? _self.audioSttPricePerHour
            : audioSttPricePerHour // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        claudeCodeOnly: null == claudeCodeOnly
            ? _self.claudeCodeOnly
            : claudeCodeOnly // ignore: cast_nullable_to_non_nullable
                  as bool,
        fallbackGroupId: freezed == fallbackGroupId
            ? _self.fallbackGroupId
            : fallbackGroupId // ignore: cast_nullable_to_non_nullable
                  as int?,
        fallbackGroupIdOnInvalidRequest:
            freezed == fallbackGroupIdOnInvalidRequest
            ? _self.fallbackGroupIdOnInvalidRequest
            : fallbackGroupIdOnInvalidRequest // ignore: cast_nullable_to_non_nullable
                  as int?,
        allowMessagesDispatch: null == allowMessagesDispatch
            ? _self.allowMessagesDispatch
            : allowMessagesDispatch // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowLive: null == allowLive
            ? _self.allowLive
            : allowLive // ignore: cast_nullable_to_non_nullable
                  as bool,
        requireOAuthOnly: null == requireOAuthOnly
            ? _self.requireOAuthOnly
            : requireOAuthOnly // ignore: cast_nullable_to_non_nullable
                  as bool,
        requirePrivacySet: null == requirePrivacySet
            ? _self.requirePrivacySet
            : requirePrivacySet // ignore: cast_nullable_to_non_nullable
                  as bool,
        rpmLimit: null == rpmLimit
            ? _self.rpmLimit
            : rpmLimit // ignore: cast_nullable_to_non_nullable
                  as int,
        maxReasoningEffort: null == maxReasoningEffort
            ? _self.maxReasoningEffort
            : maxReasoningEffort // ignore: cast_nullable_to_non_nullable
                  as String,
        reasoningEffortMappings: null == reasoningEffortMappings
            ? _self.reasoningEffortMappings
            : reasoningEffortMappings // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiReasoningEffortMapping>,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _self.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiAvailableGroup].
extension Sub2ApiAvailableGroupPatterns on Sub2ApiAvailableGroup {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiAvailableGroup value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAvailableGroup() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiAvailableGroup value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAvailableGroup():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiAvailableGroup value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAvailableGroup() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int id,
      String name,
      String description,
      String platform,
      Sub2ApiDecimal rateMultiplier,
      bool isExclusive,
      String status,
      String subscriptionType,
      Sub2ApiDecimal? dailyLimitUsd,
      Sub2ApiDecimal? weeklyLimitUsd,
      Sub2ApiDecimal? monthlyLimitUsd,
      bool longContextPricingEnabled,
      bool allowImageGeneration,
      bool allowBatchImageGeneration,
      bool imageRateIndependent,
      Sub2ApiDecimal imageRateMultiplier,
      Sub2ApiDecimal batchImageDiscountMultiplier,
      Sub2ApiDecimal batchImageHoldMultiplier,
      bool videoRateIndependent,
      Sub2ApiDecimal videoRateMultiplier,
      bool peakRateEnabled,
      String peakStart,
      String peakEnd,
      Sub2ApiDecimal peakRateMultiplier,
      Sub2ApiDecimal? imagePrice1k,
      Sub2ApiDecimal? imagePrice2k,
      Sub2ApiDecimal? imagePrice4k,
      Sub2ApiDecimal? videoPrice480p,
      Sub2ApiDecimal? videoPrice720p,
      Sub2ApiDecimal? videoPrice1080p,
      Map<String, Map<String, Sub2ApiDecimal>> videoModelPrices,
      Sub2ApiDecimal? webSearchPricePerCall,
      Sub2ApiDecimal? searchPricePer1k,
      Sub2ApiDecimal? audioRealtimePricePerMin,
      Sub2ApiDecimal? audioTtsPricePerMillionChars,
      Sub2ApiDecimal? audioSttPricePerHour,
      bool claudeCodeOnly,
      int? fallbackGroupId,
      int? fallbackGroupIdOnInvalidRequest,
      bool allowMessagesDispatch,
      bool allowLive,
      bool requireOAuthOnly,
      bool requirePrivacySet,
      int rpmLimit,
      String maxReasoningEffort,
      List<Sub2ApiReasoningEffortMapping> reasoningEffortMappings,
      DateTime createdAt,
      DateTime updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAvailableGroup() when $default != null:
        return $default(
          _that.id,
          _that.name,
          _that.description,
          _that.platform,
          _that.rateMultiplier,
          _that.isExclusive,
          _that.status,
          _that.subscriptionType,
          _that.dailyLimitUsd,
          _that.weeklyLimitUsd,
          _that.monthlyLimitUsd,
          _that.longContextPricingEnabled,
          _that.allowImageGeneration,
          _that.allowBatchImageGeneration,
          _that.imageRateIndependent,
          _that.imageRateMultiplier,
          _that.batchImageDiscountMultiplier,
          _that.batchImageHoldMultiplier,
          _that.videoRateIndependent,
          _that.videoRateMultiplier,
          _that.peakRateEnabled,
          _that.peakStart,
          _that.peakEnd,
          _that.peakRateMultiplier,
          _that.imagePrice1k,
          _that.imagePrice2k,
          _that.imagePrice4k,
          _that.videoPrice480p,
          _that.videoPrice720p,
          _that.videoPrice1080p,
          _that.videoModelPrices,
          _that.webSearchPricePerCall,
          _that.searchPricePer1k,
          _that.audioRealtimePricePerMin,
          _that.audioTtsPricePerMillionChars,
          _that.audioSttPricePerHour,
          _that.claudeCodeOnly,
          _that.fallbackGroupId,
          _that.fallbackGroupIdOnInvalidRequest,
          _that.allowMessagesDispatch,
          _that.allowLive,
          _that.requireOAuthOnly,
          _that.requirePrivacySet,
          _that.rpmLimit,
          _that.maxReasoningEffort,
          _that.reasoningEffortMappings,
          _that.createdAt,
          _that.updatedAt,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int id,
      String name,
      String description,
      String platform,
      Sub2ApiDecimal rateMultiplier,
      bool isExclusive,
      String status,
      String subscriptionType,
      Sub2ApiDecimal? dailyLimitUsd,
      Sub2ApiDecimal? weeklyLimitUsd,
      Sub2ApiDecimal? monthlyLimitUsd,
      bool longContextPricingEnabled,
      bool allowImageGeneration,
      bool allowBatchImageGeneration,
      bool imageRateIndependent,
      Sub2ApiDecimal imageRateMultiplier,
      Sub2ApiDecimal batchImageDiscountMultiplier,
      Sub2ApiDecimal batchImageHoldMultiplier,
      bool videoRateIndependent,
      Sub2ApiDecimal videoRateMultiplier,
      bool peakRateEnabled,
      String peakStart,
      String peakEnd,
      Sub2ApiDecimal peakRateMultiplier,
      Sub2ApiDecimal? imagePrice1k,
      Sub2ApiDecimal? imagePrice2k,
      Sub2ApiDecimal? imagePrice4k,
      Sub2ApiDecimal? videoPrice480p,
      Sub2ApiDecimal? videoPrice720p,
      Sub2ApiDecimal? videoPrice1080p,
      Map<String, Map<String, Sub2ApiDecimal>> videoModelPrices,
      Sub2ApiDecimal? webSearchPricePerCall,
      Sub2ApiDecimal? searchPricePer1k,
      Sub2ApiDecimal? audioRealtimePricePerMin,
      Sub2ApiDecimal? audioTtsPricePerMillionChars,
      Sub2ApiDecimal? audioSttPricePerHour,
      bool claudeCodeOnly,
      int? fallbackGroupId,
      int? fallbackGroupIdOnInvalidRequest,
      bool allowMessagesDispatch,
      bool allowLive,
      bool requireOAuthOnly,
      bool requirePrivacySet,
      int rpmLimit,
      String maxReasoningEffort,
      List<Sub2ApiReasoningEffortMapping> reasoningEffortMappings,
      DateTime createdAt,
      DateTime updatedAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAvailableGroup():
        return $default(
          _that.id,
          _that.name,
          _that.description,
          _that.platform,
          _that.rateMultiplier,
          _that.isExclusive,
          _that.status,
          _that.subscriptionType,
          _that.dailyLimitUsd,
          _that.weeklyLimitUsd,
          _that.monthlyLimitUsd,
          _that.longContextPricingEnabled,
          _that.allowImageGeneration,
          _that.allowBatchImageGeneration,
          _that.imageRateIndependent,
          _that.imageRateMultiplier,
          _that.batchImageDiscountMultiplier,
          _that.batchImageHoldMultiplier,
          _that.videoRateIndependent,
          _that.videoRateMultiplier,
          _that.peakRateEnabled,
          _that.peakStart,
          _that.peakEnd,
          _that.peakRateMultiplier,
          _that.imagePrice1k,
          _that.imagePrice2k,
          _that.imagePrice4k,
          _that.videoPrice480p,
          _that.videoPrice720p,
          _that.videoPrice1080p,
          _that.videoModelPrices,
          _that.webSearchPricePerCall,
          _that.searchPricePer1k,
          _that.audioRealtimePricePerMin,
          _that.audioTtsPricePerMillionChars,
          _that.audioSttPricePerHour,
          _that.claudeCodeOnly,
          _that.fallbackGroupId,
          _that.fallbackGroupIdOnInvalidRequest,
          _that.allowMessagesDispatch,
          _that.allowLive,
          _that.requireOAuthOnly,
          _that.requirePrivacySet,
          _that.rpmLimit,
          _that.maxReasoningEffort,
          _that.reasoningEffortMappings,
          _that.createdAt,
          _that.updatedAt,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int id,
      String name,
      String description,
      String platform,
      Sub2ApiDecimal rateMultiplier,
      bool isExclusive,
      String status,
      String subscriptionType,
      Sub2ApiDecimal? dailyLimitUsd,
      Sub2ApiDecimal? weeklyLimitUsd,
      Sub2ApiDecimal? monthlyLimitUsd,
      bool longContextPricingEnabled,
      bool allowImageGeneration,
      bool allowBatchImageGeneration,
      bool imageRateIndependent,
      Sub2ApiDecimal imageRateMultiplier,
      Sub2ApiDecimal batchImageDiscountMultiplier,
      Sub2ApiDecimal batchImageHoldMultiplier,
      bool videoRateIndependent,
      Sub2ApiDecimal videoRateMultiplier,
      bool peakRateEnabled,
      String peakStart,
      String peakEnd,
      Sub2ApiDecimal peakRateMultiplier,
      Sub2ApiDecimal? imagePrice1k,
      Sub2ApiDecimal? imagePrice2k,
      Sub2ApiDecimal? imagePrice4k,
      Sub2ApiDecimal? videoPrice480p,
      Sub2ApiDecimal? videoPrice720p,
      Sub2ApiDecimal? videoPrice1080p,
      Map<String, Map<String, Sub2ApiDecimal>> videoModelPrices,
      Sub2ApiDecimal? webSearchPricePerCall,
      Sub2ApiDecimal? searchPricePer1k,
      Sub2ApiDecimal? audioRealtimePricePerMin,
      Sub2ApiDecimal? audioTtsPricePerMillionChars,
      Sub2ApiDecimal? audioSttPricePerHour,
      bool claudeCodeOnly,
      int? fallbackGroupId,
      int? fallbackGroupIdOnInvalidRequest,
      bool allowMessagesDispatch,
      bool allowLive,
      bool requireOAuthOnly,
      bool requirePrivacySet,
      int rpmLimit,
      String maxReasoningEffort,
      List<Sub2ApiReasoningEffortMapping> reasoningEffortMappings,
      DateTime createdAt,
      DateTime updatedAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAvailableGroup() when $default != null:
        return $default(
          _that.id,
          _that.name,
          _that.description,
          _that.platform,
          _that.rateMultiplier,
          _that.isExclusive,
          _that.status,
          _that.subscriptionType,
          _that.dailyLimitUsd,
          _that.weeklyLimitUsd,
          _that.monthlyLimitUsd,
          _that.longContextPricingEnabled,
          _that.allowImageGeneration,
          _that.allowBatchImageGeneration,
          _that.imageRateIndependent,
          _that.imageRateMultiplier,
          _that.batchImageDiscountMultiplier,
          _that.batchImageHoldMultiplier,
          _that.videoRateIndependent,
          _that.videoRateMultiplier,
          _that.peakRateEnabled,
          _that.peakStart,
          _that.peakEnd,
          _that.peakRateMultiplier,
          _that.imagePrice1k,
          _that.imagePrice2k,
          _that.imagePrice4k,
          _that.videoPrice480p,
          _that.videoPrice720p,
          _that.videoPrice1080p,
          _that.videoModelPrices,
          _that.webSearchPricePerCall,
          _that.searchPricePer1k,
          _that.audioRealtimePricePerMin,
          _that.audioTtsPricePerMillionChars,
          _that.audioSttPricePerHour,
          _that.claudeCodeOnly,
          _that.fallbackGroupId,
          _that.fallbackGroupIdOnInvalidRequest,
          _that.allowMessagesDispatch,
          _that.allowLive,
          _that.requireOAuthOnly,
          _that.requirePrivacySet,
          _that.rpmLimit,
          _that.maxReasoningEffort,
          _that.reasoningEffortMappings,
          _that.createdAt,
          _that.updatedAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiAvailableGroup implements Sub2ApiAvailableGroup {
  const _Sub2ApiAvailableGroup({
    required this.id,
    required this.name,
    required this.description,
    required this.platform,
    required this.rateMultiplier,
    required this.isExclusive,
    required this.status,
    required this.subscriptionType,
    required this.dailyLimitUsd,
    required this.weeklyLimitUsd,
    required this.monthlyLimitUsd,
    required this.longContextPricingEnabled,
    required this.allowImageGeneration,
    required this.allowBatchImageGeneration,
    required this.imageRateIndependent,
    required this.imageRateMultiplier,
    required this.batchImageDiscountMultiplier,
    required this.batchImageHoldMultiplier,
    required this.videoRateIndependent,
    required this.videoRateMultiplier,
    required this.peakRateEnabled,
    required this.peakStart,
    required this.peakEnd,
    required this.peakRateMultiplier,
    required this.imagePrice1k,
    required this.imagePrice2k,
    required this.imagePrice4k,
    required this.videoPrice480p,
    required this.videoPrice720p,
    required this.videoPrice1080p,
    required final Map<String, Map<String, Sub2ApiDecimal>> videoModelPrices,
    required this.webSearchPricePerCall,
    required this.searchPricePer1k,
    required this.audioRealtimePricePerMin,
    required this.audioTtsPricePerMillionChars,
    required this.audioSttPricePerHour,
    required this.claudeCodeOnly,
    required this.fallbackGroupId,
    required this.fallbackGroupIdOnInvalidRequest,
    required this.allowMessagesDispatch,
    required this.allowLive,
    required this.requireOAuthOnly,
    required this.requirePrivacySet,
    required this.rpmLimit,
    required this.maxReasoningEffort,
    required final List<Sub2ApiReasoningEffortMapping> reasoningEffortMappings,
    required this.createdAt,
    required this.updatedAt,
  }) : _videoModelPrices = videoModelPrices,
       _reasoningEffortMappings = reasoningEffortMappings;

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String platform;
  @override
  final Sub2ApiDecimal rateMultiplier;
  @override
  final bool isExclusive;
  @override
  final String status;
  @override
  final String subscriptionType;
  @override
  final Sub2ApiDecimal? dailyLimitUsd;
  @override
  final Sub2ApiDecimal? weeklyLimitUsd;
  @override
  final Sub2ApiDecimal? monthlyLimitUsd;
  @override
  final bool longContextPricingEnabled;
  @override
  final bool allowImageGeneration;
  @override
  final bool allowBatchImageGeneration;
  @override
  final bool imageRateIndependent;
  @override
  final Sub2ApiDecimal imageRateMultiplier;
  @override
  final Sub2ApiDecimal batchImageDiscountMultiplier;
  @override
  final Sub2ApiDecimal batchImageHoldMultiplier;
  @override
  final bool videoRateIndependent;
  @override
  final Sub2ApiDecimal videoRateMultiplier;
  @override
  final bool peakRateEnabled;
  @override
  final String peakStart;
  @override
  final String peakEnd;
  @override
  final Sub2ApiDecimal peakRateMultiplier;
  @override
  final Sub2ApiDecimal? imagePrice1k;
  @override
  final Sub2ApiDecimal? imagePrice2k;
  @override
  final Sub2ApiDecimal? imagePrice4k;
  @override
  final Sub2ApiDecimal? videoPrice480p;
  @override
  final Sub2ApiDecimal? videoPrice720p;
  @override
  final Sub2ApiDecimal? videoPrice1080p;
  final Map<String, Map<String, Sub2ApiDecimal>> _videoModelPrices;
  @override
  Map<String, Map<String, Sub2ApiDecimal>> get videoModelPrices {
    if (_videoModelPrices is EqualUnmodifiableMapView) return _videoModelPrices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_videoModelPrices);
  }

  @override
  final Sub2ApiDecimal? webSearchPricePerCall;
  @override
  final Sub2ApiDecimal? searchPricePer1k;
  @override
  final Sub2ApiDecimal? audioRealtimePricePerMin;
  @override
  final Sub2ApiDecimal? audioTtsPricePerMillionChars;
  @override
  final Sub2ApiDecimal? audioSttPricePerHour;
  @override
  final bool claudeCodeOnly;
  @override
  final int? fallbackGroupId;
  @override
  final int? fallbackGroupIdOnInvalidRequest;
  @override
  final bool allowMessagesDispatch;
  @override
  final bool allowLive;
  @override
  final bool requireOAuthOnly;
  @override
  final bool requirePrivacySet;
  @override
  final int rpmLimit;
  @override
  final String maxReasoningEffort;
  final List<Sub2ApiReasoningEffortMapping> _reasoningEffortMappings;
  @override
  List<Sub2ApiReasoningEffortMapping> get reasoningEffortMappings {
    if (_reasoningEffortMappings is EqualUnmodifiableListView)
      return _reasoningEffortMappings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reasoningEffortMappings);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of Sub2ApiAvailableGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiAvailableGroupCopyWith<_Sub2ApiAvailableGroup> get copyWith =>
      __$Sub2ApiAvailableGroupCopyWithImpl<_Sub2ApiAvailableGroup>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiAvailableGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.rateMultiplier, rateMultiplier) ||
                other.rateMultiplier == rateMultiplier) &&
            (identical(other.isExclusive, isExclusive) ||
                other.isExclusive == isExclusive) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.subscriptionType, subscriptionType) ||
                other.subscriptionType == subscriptionType) &&
            (identical(other.dailyLimitUsd, dailyLimitUsd) ||
                other.dailyLimitUsd == dailyLimitUsd) &&
            (identical(other.weeklyLimitUsd, weeklyLimitUsd) ||
                other.weeklyLimitUsd == weeklyLimitUsd) &&
            (identical(other.monthlyLimitUsd, monthlyLimitUsd) ||
                other.monthlyLimitUsd == monthlyLimitUsd) &&
            (identical(
                  other.longContextPricingEnabled,
                  longContextPricingEnabled,
                ) ||
                other.longContextPricingEnabled == longContextPricingEnabled) &&
            (identical(other.allowImageGeneration, allowImageGeneration) ||
                other.allowImageGeneration == allowImageGeneration) &&
            (identical(
                  other.allowBatchImageGeneration,
                  allowBatchImageGeneration,
                ) ||
                other.allowBatchImageGeneration == allowBatchImageGeneration) &&
            (identical(other.imageRateIndependent, imageRateIndependent) ||
                other.imageRateIndependent == imageRateIndependent) &&
            (identical(other.imageRateMultiplier, imageRateMultiplier) ||
                other.imageRateMultiplier == imageRateMultiplier) &&
            (identical(
                  other.batchImageDiscountMultiplier,
                  batchImageDiscountMultiplier,
                ) ||
                other.batchImageDiscountMultiplier ==
                    batchImageDiscountMultiplier) &&
            (identical(
                  other.batchImageHoldMultiplier,
                  batchImageHoldMultiplier,
                ) ||
                other.batchImageHoldMultiplier == batchImageHoldMultiplier) &&
            (identical(other.videoRateIndependent, videoRateIndependent) ||
                other.videoRateIndependent == videoRateIndependent) &&
            (identical(other.videoRateMultiplier, videoRateMultiplier) ||
                other.videoRateMultiplier == videoRateMultiplier) &&
            (identical(other.peakRateEnabled, peakRateEnabled) ||
                other.peakRateEnabled == peakRateEnabled) &&
            (identical(other.peakStart, peakStart) ||
                other.peakStart == peakStart) &&
            (identical(other.peakEnd, peakEnd) || other.peakEnd == peakEnd) &&
            (identical(other.peakRateMultiplier, peakRateMultiplier) ||
                other.peakRateMultiplier == peakRateMultiplier) &&
            (identical(other.imagePrice1k, imagePrice1k) ||
                other.imagePrice1k == imagePrice1k) &&
            (identical(other.imagePrice2k, imagePrice2k) ||
                other.imagePrice2k == imagePrice2k) &&
            (identical(other.imagePrice4k, imagePrice4k) ||
                other.imagePrice4k == imagePrice4k) &&
            (identical(other.videoPrice480p, videoPrice480p) ||
                other.videoPrice480p == videoPrice480p) &&
            (identical(other.videoPrice720p, videoPrice720p) ||
                other.videoPrice720p == videoPrice720p) &&
            (identical(other.videoPrice1080p, videoPrice1080p) ||
                other.videoPrice1080p == videoPrice1080p) &&
            const DeepCollectionEquality().equals(
              other._videoModelPrices,
              _videoModelPrices,
            ) &&
            (identical(other.webSearchPricePerCall, webSearchPricePerCall) ||
                other.webSearchPricePerCall == webSearchPricePerCall) &&
            (identical(other.searchPricePer1k, searchPricePer1k) ||
                other.searchPricePer1k == searchPricePer1k) &&
            (identical(
                  other.audioRealtimePricePerMin,
                  audioRealtimePricePerMin,
                ) ||
                other.audioRealtimePricePerMin == audioRealtimePricePerMin) &&
            (identical(
                  other.audioTtsPricePerMillionChars,
                  audioTtsPricePerMillionChars,
                ) ||
                other.audioTtsPricePerMillionChars ==
                    audioTtsPricePerMillionChars) &&
            (identical(other.audioSttPricePerHour, audioSttPricePerHour) ||
                other.audioSttPricePerHour == audioSttPricePerHour) &&
            (identical(other.claudeCodeOnly, claudeCodeOnly) ||
                other.claudeCodeOnly == claudeCodeOnly) &&
            (identical(other.fallbackGroupId, fallbackGroupId) ||
                other.fallbackGroupId == fallbackGroupId) &&
            (identical(
                  other.fallbackGroupIdOnInvalidRequest,
                  fallbackGroupIdOnInvalidRequest,
                ) ||
                other.fallbackGroupIdOnInvalidRequest ==
                    fallbackGroupIdOnInvalidRequest) &&
            (identical(other.allowMessagesDispatch, allowMessagesDispatch) ||
                other.allowMessagesDispatch == allowMessagesDispatch) &&
            (identical(other.allowLive, allowLive) ||
                other.allowLive == allowLive) &&
            (identical(other.requireOAuthOnly, requireOAuthOnly) ||
                other.requireOAuthOnly == requireOAuthOnly) &&
            (identical(other.requirePrivacySet, requirePrivacySet) ||
                other.requirePrivacySet == requirePrivacySet) &&
            (identical(other.rpmLimit, rpmLimit) ||
                other.rpmLimit == rpmLimit) &&
            (identical(other.maxReasoningEffort, maxReasoningEffort) ||
                other.maxReasoningEffort == maxReasoningEffort) &&
            const DeepCollectionEquality().equals(
              other._reasoningEffortMappings,
              _reasoningEffortMappings,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    name,
    description,
    platform,
    rateMultiplier,
    isExclusive,
    status,
    subscriptionType,
    dailyLimitUsd,
    weeklyLimitUsd,
    monthlyLimitUsd,
    longContextPricingEnabled,
    allowImageGeneration,
    allowBatchImageGeneration,
    imageRateIndependent,
    imageRateMultiplier,
    batchImageDiscountMultiplier,
    batchImageHoldMultiplier,
    videoRateIndependent,
    videoRateMultiplier,
    peakRateEnabled,
    peakStart,
    peakEnd,
    peakRateMultiplier,
    imagePrice1k,
    imagePrice2k,
    imagePrice4k,
    videoPrice480p,
    videoPrice720p,
    videoPrice1080p,
    const DeepCollectionEquality().hash(_videoModelPrices),
    webSearchPricePerCall,
    searchPricePer1k,
    audioRealtimePricePerMin,
    audioTtsPricePerMillionChars,
    audioSttPricePerHour,
    claudeCodeOnly,
    fallbackGroupId,
    fallbackGroupIdOnInvalidRequest,
    allowMessagesDispatch,
    allowLive,
    requireOAuthOnly,
    requirePrivacySet,
    rpmLimit,
    maxReasoningEffort,
    const DeepCollectionEquality().hash(_reasoningEffortMappings),
    createdAt,
    updatedAt,
  ]);

  @override
  String toString() {
    return 'Sub2ApiAvailableGroup(id: $id, name: $name, description: $description, platform: $platform, rateMultiplier: $rateMultiplier, isExclusive: $isExclusive, status: $status, subscriptionType: $subscriptionType, dailyLimitUsd: $dailyLimitUsd, weeklyLimitUsd: $weeklyLimitUsd, monthlyLimitUsd: $monthlyLimitUsd, longContextPricingEnabled: $longContextPricingEnabled, allowImageGeneration: $allowImageGeneration, allowBatchImageGeneration: $allowBatchImageGeneration, imageRateIndependent: $imageRateIndependent, imageRateMultiplier: $imageRateMultiplier, batchImageDiscountMultiplier: $batchImageDiscountMultiplier, batchImageHoldMultiplier: $batchImageHoldMultiplier, videoRateIndependent: $videoRateIndependent, videoRateMultiplier: $videoRateMultiplier, peakRateEnabled: $peakRateEnabled, peakStart: $peakStart, peakEnd: $peakEnd, peakRateMultiplier: $peakRateMultiplier, imagePrice1k: $imagePrice1k, imagePrice2k: $imagePrice2k, imagePrice4k: $imagePrice4k, videoPrice480p: $videoPrice480p, videoPrice720p: $videoPrice720p, videoPrice1080p: $videoPrice1080p, videoModelPrices: $videoModelPrices, webSearchPricePerCall: $webSearchPricePerCall, searchPricePer1k: $searchPricePer1k, audioRealtimePricePerMin: $audioRealtimePricePerMin, audioTtsPricePerMillionChars: $audioTtsPricePerMillionChars, audioSttPricePerHour: $audioSttPricePerHour, claudeCodeOnly: $claudeCodeOnly, fallbackGroupId: $fallbackGroupId, fallbackGroupIdOnInvalidRequest: $fallbackGroupIdOnInvalidRequest, allowMessagesDispatch: $allowMessagesDispatch, allowLive: $allowLive, requireOAuthOnly: $requireOAuthOnly, requirePrivacySet: $requirePrivacySet, rpmLimit: $rpmLimit, maxReasoningEffort: $maxReasoningEffort, reasoningEffortMappings: $reasoningEffortMappings, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiAvailableGroupCopyWith<$Res>
    implements $Sub2ApiAvailableGroupCopyWith<$Res> {
  factory _$Sub2ApiAvailableGroupCopyWith(
    _Sub2ApiAvailableGroup value,
    $Res Function(_Sub2ApiAvailableGroup) _then,
  ) = __$Sub2ApiAvailableGroupCopyWithImpl;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    String platform,
    Sub2ApiDecimal rateMultiplier,
    bool isExclusive,
    String status,
    String subscriptionType,
    Sub2ApiDecimal? dailyLimitUsd,
    Sub2ApiDecimal? weeklyLimitUsd,
    Sub2ApiDecimal? monthlyLimitUsd,
    bool longContextPricingEnabled,
    bool allowImageGeneration,
    bool allowBatchImageGeneration,
    bool imageRateIndependent,
    Sub2ApiDecimal imageRateMultiplier,
    Sub2ApiDecimal batchImageDiscountMultiplier,
    Sub2ApiDecimal batchImageHoldMultiplier,
    bool videoRateIndependent,
    Sub2ApiDecimal videoRateMultiplier,
    bool peakRateEnabled,
    String peakStart,
    String peakEnd,
    Sub2ApiDecimal peakRateMultiplier,
    Sub2ApiDecimal? imagePrice1k,
    Sub2ApiDecimal? imagePrice2k,
    Sub2ApiDecimal? imagePrice4k,
    Sub2ApiDecimal? videoPrice480p,
    Sub2ApiDecimal? videoPrice720p,
    Sub2ApiDecimal? videoPrice1080p,
    Map<String, Map<String, Sub2ApiDecimal>> videoModelPrices,
    Sub2ApiDecimal? webSearchPricePerCall,
    Sub2ApiDecimal? searchPricePer1k,
    Sub2ApiDecimal? audioRealtimePricePerMin,
    Sub2ApiDecimal? audioTtsPricePerMillionChars,
    Sub2ApiDecimal? audioSttPricePerHour,
    bool claudeCodeOnly,
    int? fallbackGroupId,
    int? fallbackGroupIdOnInvalidRequest,
    bool allowMessagesDispatch,
    bool allowLive,
    bool requireOAuthOnly,
    bool requirePrivacySet,
    int rpmLimit,
    String maxReasoningEffort,
    List<Sub2ApiReasoningEffortMapping> reasoningEffortMappings,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$Sub2ApiAvailableGroupCopyWithImpl<$Res>
    implements _$Sub2ApiAvailableGroupCopyWith<$Res> {
  __$Sub2ApiAvailableGroupCopyWithImpl(this._self, this._then);

  final _Sub2ApiAvailableGroup _self;
  final $Res Function(_Sub2ApiAvailableGroup) _then;

  /// Create a copy of Sub2ApiAvailableGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? platform = null,
    Object? rateMultiplier = null,
    Object? isExclusive = null,
    Object? status = null,
    Object? subscriptionType = null,
    Object? dailyLimitUsd = freezed,
    Object? weeklyLimitUsd = freezed,
    Object? monthlyLimitUsd = freezed,
    Object? longContextPricingEnabled = null,
    Object? allowImageGeneration = null,
    Object? allowBatchImageGeneration = null,
    Object? imageRateIndependent = null,
    Object? imageRateMultiplier = null,
    Object? batchImageDiscountMultiplier = null,
    Object? batchImageHoldMultiplier = null,
    Object? videoRateIndependent = null,
    Object? videoRateMultiplier = null,
    Object? peakRateEnabled = null,
    Object? peakStart = null,
    Object? peakEnd = null,
    Object? peakRateMultiplier = null,
    Object? imagePrice1k = freezed,
    Object? imagePrice2k = freezed,
    Object? imagePrice4k = freezed,
    Object? videoPrice480p = freezed,
    Object? videoPrice720p = freezed,
    Object? videoPrice1080p = freezed,
    Object? videoModelPrices = null,
    Object? webSearchPricePerCall = freezed,
    Object? searchPricePer1k = freezed,
    Object? audioRealtimePricePerMin = freezed,
    Object? audioTtsPricePerMillionChars = freezed,
    Object? audioSttPricePerHour = freezed,
    Object? claudeCodeOnly = null,
    Object? fallbackGroupId = freezed,
    Object? fallbackGroupIdOnInvalidRequest = freezed,
    Object? allowMessagesDispatch = null,
    Object? allowLive = null,
    Object? requireOAuthOnly = null,
    Object? requirePrivacySet = null,
    Object? rpmLimit = null,
    Object? maxReasoningEffort = null,
    Object? reasoningEffortMappings = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _Sub2ApiAvailableGroup(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        rateMultiplier: null == rateMultiplier
            ? _self.rateMultiplier
            : rateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        isExclusive: null == isExclusive
            ? _self.isExclusive
            : isExclusive // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        subscriptionType: null == subscriptionType
            ? _self.subscriptionType
            : subscriptionType // ignore: cast_nullable_to_non_nullable
                  as String,
        dailyLimitUsd: freezed == dailyLimitUsd
            ? _self.dailyLimitUsd
            : dailyLimitUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        weeklyLimitUsd: freezed == weeklyLimitUsd
            ? _self.weeklyLimitUsd
            : weeklyLimitUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        monthlyLimitUsd: freezed == monthlyLimitUsd
            ? _self.monthlyLimitUsd
            : monthlyLimitUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        longContextPricingEnabled: null == longContextPricingEnabled
            ? _self.longContextPricingEnabled
            : longContextPricingEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowImageGeneration: null == allowImageGeneration
            ? _self.allowImageGeneration
            : allowImageGeneration // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowBatchImageGeneration: null == allowBatchImageGeneration
            ? _self.allowBatchImageGeneration
            : allowBatchImageGeneration // ignore: cast_nullable_to_non_nullable
                  as bool,
        imageRateIndependent: null == imageRateIndependent
            ? _self.imageRateIndependent
            : imageRateIndependent // ignore: cast_nullable_to_non_nullable
                  as bool,
        imageRateMultiplier: null == imageRateMultiplier
            ? _self.imageRateMultiplier
            : imageRateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        batchImageDiscountMultiplier: null == batchImageDiscountMultiplier
            ? _self.batchImageDiscountMultiplier
            : batchImageDiscountMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        batchImageHoldMultiplier: null == batchImageHoldMultiplier
            ? _self.batchImageHoldMultiplier
            : batchImageHoldMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        videoRateIndependent: null == videoRateIndependent
            ? _self.videoRateIndependent
            : videoRateIndependent // ignore: cast_nullable_to_non_nullable
                  as bool,
        videoRateMultiplier: null == videoRateMultiplier
            ? _self.videoRateMultiplier
            : videoRateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        peakRateEnabled: null == peakRateEnabled
            ? _self.peakRateEnabled
            : peakRateEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        peakStart: null == peakStart
            ? _self.peakStart
            : peakStart // ignore: cast_nullable_to_non_nullable
                  as String,
        peakEnd: null == peakEnd
            ? _self.peakEnd
            : peakEnd // ignore: cast_nullable_to_non_nullable
                  as String,
        peakRateMultiplier: null == peakRateMultiplier
            ? _self.peakRateMultiplier
            : peakRateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        imagePrice1k: freezed == imagePrice1k
            ? _self.imagePrice1k
            : imagePrice1k // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        imagePrice2k: freezed == imagePrice2k
            ? _self.imagePrice2k
            : imagePrice2k // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        imagePrice4k: freezed == imagePrice4k
            ? _self.imagePrice4k
            : imagePrice4k // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        videoPrice480p: freezed == videoPrice480p
            ? _self.videoPrice480p
            : videoPrice480p // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        videoPrice720p: freezed == videoPrice720p
            ? _self.videoPrice720p
            : videoPrice720p // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        videoPrice1080p: freezed == videoPrice1080p
            ? _self.videoPrice1080p
            : videoPrice1080p // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        videoModelPrices: null == videoModelPrices
            ? _self._videoModelPrices
            : videoModelPrices // ignore: cast_nullable_to_non_nullable
                  as Map<String, Map<String, Sub2ApiDecimal>>,
        webSearchPricePerCall: freezed == webSearchPricePerCall
            ? _self.webSearchPricePerCall
            : webSearchPricePerCall // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        searchPricePer1k: freezed == searchPricePer1k
            ? _self.searchPricePer1k
            : searchPricePer1k // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        audioRealtimePricePerMin: freezed == audioRealtimePricePerMin
            ? _self.audioRealtimePricePerMin
            : audioRealtimePricePerMin // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        audioTtsPricePerMillionChars: freezed == audioTtsPricePerMillionChars
            ? _self.audioTtsPricePerMillionChars
            : audioTtsPricePerMillionChars // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        audioSttPricePerHour: freezed == audioSttPricePerHour
            ? _self.audioSttPricePerHour
            : audioSttPricePerHour // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        claudeCodeOnly: null == claudeCodeOnly
            ? _self.claudeCodeOnly
            : claudeCodeOnly // ignore: cast_nullable_to_non_nullable
                  as bool,
        fallbackGroupId: freezed == fallbackGroupId
            ? _self.fallbackGroupId
            : fallbackGroupId // ignore: cast_nullable_to_non_nullable
                  as int?,
        fallbackGroupIdOnInvalidRequest:
            freezed == fallbackGroupIdOnInvalidRequest
            ? _self.fallbackGroupIdOnInvalidRequest
            : fallbackGroupIdOnInvalidRequest // ignore: cast_nullable_to_non_nullable
                  as int?,
        allowMessagesDispatch: null == allowMessagesDispatch
            ? _self.allowMessagesDispatch
            : allowMessagesDispatch // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowLive: null == allowLive
            ? _self.allowLive
            : allowLive // ignore: cast_nullable_to_non_nullable
                  as bool,
        requireOAuthOnly: null == requireOAuthOnly
            ? _self.requireOAuthOnly
            : requireOAuthOnly // ignore: cast_nullable_to_non_nullable
                  as bool,
        requirePrivacySet: null == requirePrivacySet
            ? _self.requirePrivacySet
            : requirePrivacySet // ignore: cast_nullable_to_non_nullable
                  as bool,
        rpmLimit: null == rpmLimit
            ? _self.rpmLimit
            : rpmLimit // ignore: cast_nullable_to_non_nullable
                  as int,
        maxReasoningEffort: null == maxReasoningEffort
            ? _self.maxReasoningEffort
            : maxReasoningEffort // ignore: cast_nullable_to_non_nullable
                  as String,
        reasoningEffortMappings: null == reasoningEffortMappings
            ? _self._reasoningEffortMappings
            : reasoningEffortMappings // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiReasoningEffortMapping>,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _self.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiPlatformQuotaWindow {
  Sub2ApiDecimal? get limit;
  Sub2ApiDecimal get usage;
  DateTime? get resetsAt;

  /// Create a copy of Sub2ApiPlatformQuotaWindow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiPlatformQuotaWindowCopyWith<Sub2ApiPlatformQuotaWindow>
  get copyWith =>
      _$Sub2ApiPlatformQuotaWindowCopyWithImpl<Sub2ApiPlatformQuotaWindow>(
        this as Sub2ApiPlatformQuotaWindow,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiPlatformQuotaWindow &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            (identical(other.resetsAt, resetsAt) ||
                other.resetsAt == resetsAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, usage, resetsAt);

  @override
  String toString() {
    return 'Sub2ApiPlatformQuotaWindow(limit: $limit, usage: $usage, resetsAt: $resetsAt)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiPlatformQuotaWindowCopyWith<$Res> {
  factory $Sub2ApiPlatformQuotaWindowCopyWith(
    Sub2ApiPlatformQuotaWindow value,
    $Res Function(Sub2ApiPlatformQuotaWindow) _then,
  ) = _$Sub2ApiPlatformQuotaWindowCopyWithImpl;
  @useResult
  $Res call({Sub2ApiDecimal? limit, Sub2ApiDecimal usage, DateTime? resetsAt});
}

/// @nodoc
class _$Sub2ApiPlatformQuotaWindowCopyWithImpl<$Res>
    implements $Sub2ApiPlatformQuotaWindowCopyWith<$Res> {
  _$Sub2ApiPlatformQuotaWindowCopyWithImpl(this._self, this._then);

  final Sub2ApiPlatformQuotaWindow _self;
  final $Res Function(Sub2ApiPlatformQuotaWindow) _then;

  /// Create a copy of Sub2ApiPlatformQuotaWindow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? usage = null,
    Object? resetsAt = freezed,
  }) {
    return _then(
      _self.copyWith(
        limit: freezed == limit
            ? _self.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        usage: null == usage
            ? _self.usage
            : usage // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        resetsAt: freezed == resetsAt
            ? _self.resetsAt
            : resetsAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiPlatformQuotaWindow].
extension Sub2ApiPlatformQuotaWindowPatterns on Sub2ApiPlatformQuotaWindow {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiPlatformQuotaWindow value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPlatformQuotaWindow() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiPlatformQuotaWindow value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPlatformQuotaWindow():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiPlatformQuotaWindow value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPlatformQuotaWindow() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      Sub2ApiDecimal? limit,
      Sub2ApiDecimal usage,
      DateTime? resetsAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPlatformQuotaWindow() when $default != null:
        return $default(_that.limit, _that.usage, _that.resetsAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      Sub2ApiDecimal? limit,
      Sub2ApiDecimal usage,
      DateTime? resetsAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPlatformQuotaWindow():
        return $default(_that.limit, _that.usage, _that.resetsAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      Sub2ApiDecimal? limit,
      Sub2ApiDecimal usage,
      DateTime? resetsAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPlatformQuotaWindow() when $default != null:
        return $default(_that.limit, _that.usage, _that.resetsAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiPlatformQuotaWindow implements Sub2ApiPlatformQuotaWindow {
  const _Sub2ApiPlatformQuotaWindow({
    required this.limit,
    required this.usage,
    this.resetsAt,
  });

  @override
  final Sub2ApiDecimal? limit;
  @override
  final Sub2ApiDecimal usage;
  @override
  final DateTime? resetsAt;

  /// Create a copy of Sub2ApiPlatformQuotaWindow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiPlatformQuotaWindowCopyWith<_Sub2ApiPlatformQuotaWindow>
  get copyWith =>
      __$Sub2ApiPlatformQuotaWindowCopyWithImpl<_Sub2ApiPlatformQuotaWindow>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiPlatformQuotaWindow &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            (identical(other.resetsAt, resetsAt) ||
                other.resetsAt == resetsAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, usage, resetsAt);

  @override
  String toString() {
    return 'Sub2ApiPlatformQuotaWindow(limit: $limit, usage: $usage, resetsAt: $resetsAt)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiPlatformQuotaWindowCopyWith<$Res>
    implements $Sub2ApiPlatformQuotaWindowCopyWith<$Res> {
  factory _$Sub2ApiPlatformQuotaWindowCopyWith(
    _Sub2ApiPlatformQuotaWindow value,
    $Res Function(_Sub2ApiPlatformQuotaWindow) _then,
  ) = __$Sub2ApiPlatformQuotaWindowCopyWithImpl;
  @override
  @useResult
  $Res call({Sub2ApiDecimal? limit, Sub2ApiDecimal usage, DateTime? resetsAt});
}

/// @nodoc
class __$Sub2ApiPlatformQuotaWindowCopyWithImpl<$Res>
    implements _$Sub2ApiPlatformQuotaWindowCopyWith<$Res> {
  __$Sub2ApiPlatformQuotaWindowCopyWithImpl(this._self, this._then);

  final _Sub2ApiPlatformQuotaWindow _self;
  final $Res Function(_Sub2ApiPlatformQuotaWindow) _then;

  /// Create a copy of Sub2ApiPlatformQuotaWindow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? limit = freezed,
    Object? usage = null,
    Object? resetsAt = freezed,
  }) {
    return _then(
      _Sub2ApiPlatformQuotaWindow(
        limit: freezed == limit
            ? _self.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        usage: null == usage
            ? _self.usage
            : usage // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        resetsAt: freezed == resetsAt
            ? _self.resetsAt
            : resetsAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiPlatformQuota {
  String get platform;
  Sub2ApiPlatformQuotaWindow get daily;
  Sub2ApiPlatformQuotaWindow get weekly;
  Sub2ApiPlatformQuotaWindow get monthly;

  /// Create a copy of Sub2ApiPlatformQuota
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiPlatformQuotaCopyWith<Sub2ApiPlatformQuota> get copyWith =>
      _$Sub2ApiPlatformQuotaCopyWithImpl<Sub2ApiPlatformQuota>(
        this as Sub2ApiPlatformQuota,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiPlatformQuota &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.daily, daily) || other.daily == daily) &&
            (identical(other.weekly, weekly) || other.weekly == weekly) &&
            (identical(other.monthly, monthly) || other.monthly == monthly));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, platform, daily, weekly, monthly);

  @override
  String toString() {
    return 'Sub2ApiPlatformQuota(platform: $platform, daily: $daily, weekly: $weekly, monthly: $monthly)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiPlatformQuotaCopyWith<$Res> {
  factory $Sub2ApiPlatformQuotaCopyWith(
    Sub2ApiPlatformQuota value,
    $Res Function(Sub2ApiPlatformQuota) _then,
  ) = _$Sub2ApiPlatformQuotaCopyWithImpl;
  @useResult
  $Res call({
    String platform,
    Sub2ApiPlatformQuotaWindow daily,
    Sub2ApiPlatformQuotaWindow weekly,
    Sub2ApiPlatformQuotaWindow monthly,
  });

  $Sub2ApiPlatformQuotaWindowCopyWith<$Res> get daily;
  $Sub2ApiPlatformQuotaWindowCopyWith<$Res> get weekly;
  $Sub2ApiPlatformQuotaWindowCopyWith<$Res> get monthly;
}

/// @nodoc
class _$Sub2ApiPlatformQuotaCopyWithImpl<$Res>
    implements $Sub2ApiPlatformQuotaCopyWith<$Res> {
  _$Sub2ApiPlatformQuotaCopyWithImpl(this._self, this._then);

  final Sub2ApiPlatformQuota _self;
  final $Res Function(Sub2ApiPlatformQuota) _then;

  /// Create a copy of Sub2ApiPlatformQuota
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? daily = null,
    Object? weekly = null,
    Object? monthly = null,
  }) {
    return _then(
      _self.copyWith(
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        daily: null == daily
            ? _self.daily
            : daily // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiPlatformQuotaWindow,
        weekly: null == weekly
            ? _self.weekly
            : weekly // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiPlatformQuotaWindow,
        monthly: null == monthly
            ? _self.monthly
            : monthly // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiPlatformQuotaWindow,
      ),
    );
  }

  /// Create a copy of Sub2ApiPlatformQuota
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiPlatformQuotaWindowCopyWith<$Res> get daily {
    return $Sub2ApiPlatformQuotaWindowCopyWith<$Res>(_self.daily, (value) {
      return _then(_self.copyWith(daily: value));
    });
  }

  /// Create a copy of Sub2ApiPlatformQuota
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiPlatformQuotaWindowCopyWith<$Res> get weekly {
    return $Sub2ApiPlatformQuotaWindowCopyWith<$Res>(_self.weekly, (value) {
      return _then(_self.copyWith(weekly: value));
    });
  }

  /// Create a copy of Sub2ApiPlatformQuota
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiPlatformQuotaWindowCopyWith<$Res> get monthly {
    return $Sub2ApiPlatformQuotaWindowCopyWith<$Res>(_self.monthly, (value) {
      return _then(_self.copyWith(monthly: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiPlatformQuota].
extension Sub2ApiPlatformQuotaPatterns on Sub2ApiPlatformQuota {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiPlatformQuota value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPlatformQuota() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiPlatformQuota value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPlatformQuota():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiPlatformQuota value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPlatformQuota() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String platform,
      Sub2ApiPlatformQuotaWindow daily,
      Sub2ApiPlatformQuotaWindow weekly,
      Sub2ApiPlatformQuotaWindow monthly,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPlatformQuota() when $default != null:
        return $default(
          _that.platform,
          _that.daily,
          _that.weekly,
          _that.monthly,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String platform,
      Sub2ApiPlatformQuotaWindow daily,
      Sub2ApiPlatformQuotaWindow weekly,
      Sub2ApiPlatformQuotaWindow monthly,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPlatformQuota():
        return $default(
          _that.platform,
          _that.daily,
          _that.weekly,
          _that.monthly,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String platform,
      Sub2ApiPlatformQuotaWindow daily,
      Sub2ApiPlatformQuotaWindow weekly,
      Sub2ApiPlatformQuotaWindow monthly,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPlatformQuota() when $default != null:
        return $default(
          _that.platform,
          _that.daily,
          _that.weekly,
          _that.monthly,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiPlatformQuota implements Sub2ApiPlatformQuota {
  const _Sub2ApiPlatformQuota({
    required this.platform,
    required this.daily,
    required this.weekly,
    required this.monthly,
  });

  @override
  final String platform;
  @override
  final Sub2ApiPlatformQuotaWindow daily;
  @override
  final Sub2ApiPlatformQuotaWindow weekly;
  @override
  final Sub2ApiPlatformQuotaWindow monthly;

  /// Create a copy of Sub2ApiPlatformQuota
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiPlatformQuotaCopyWith<_Sub2ApiPlatformQuota> get copyWith =>
      __$Sub2ApiPlatformQuotaCopyWithImpl<_Sub2ApiPlatformQuota>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiPlatformQuota &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.daily, daily) || other.daily == daily) &&
            (identical(other.weekly, weekly) || other.weekly == weekly) &&
            (identical(other.monthly, monthly) || other.monthly == monthly));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, platform, daily, weekly, monthly);

  @override
  String toString() {
    return 'Sub2ApiPlatformQuota(platform: $platform, daily: $daily, weekly: $weekly, monthly: $monthly)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiPlatformQuotaCopyWith<$Res>
    implements $Sub2ApiPlatformQuotaCopyWith<$Res> {
  factory _$Sub2ApiPlatformQuotaCopyWith(
    _Sub2ApiPlatformQuota value,
    $Res Function(_Sub2ApiPlatformQuota) _then,
  ) = __$Sub2ApiPlatformQuotaCopyWithImpl;
  @override
  @useResult
  $Res call({
    String platform,
    Sub2ApiPlatformQuotaWindow daily,
    Sub2ApiPlatformQuotaWindow weekly,
    Sub2ApiPlatformQuotaWindow monthly,
  });

  @override
  $Sub2ApiPlatformQuotaWindowCopyWith<$Res> get daily;
  @override
  $Sub2ApiPlatformQuotaWindowCopyWith<$Res> get weekly;
  @override
  $Sub2ApiPlatformQuotaWindowCopyWith<$Res> get monthly;
}

/// @nodoc
class __$Sub2ApiPlatformQuotaCopyWithImpl<$Res>
    implements _$Sub2ApiPlatformQuotaCopyWith<$Res> {
  __$Sub2ApiPlatformQuotaCopyWithImpl(this._self, this._then);

  final _Sub2ApiPlatformQuota _self;
  final $Res Function(_Sub2ApiPlatformQuota) _then;

  /// Create a copy of Sub2ApiPlatformQuota
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? platform = null,
    Object? daily = null,
    Object? weekly = null,
    Object? monthly = null,
  }) {
    return _then(
      _Sub2ApiPlatformQuota(
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        daily: null == daily
            ? _self.daily
            : daily // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiPlatformQuotaWindow,
        weekly: null == weekly
            ? _self.weekly
            : weekly // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiPlatformQuotaWindow,
        monthly: null == monthly
            ? _self.monthly
            : monthly // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiPlatformQuotaWindow,
      ),
    );
  }

  /// Create a copy of Sub2ApiPlatformQuota
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiPlatformQuotaWindowCopyWith<$Res> get daily {
    return $Sub2ApiPlatformQuotaWindowCopyWith<$Res>(_self.daily, (value) {
      return _then(_self.copyWith(daily: value));
    });
  }

  /// Create a copy of Sub2ApiPlatformQuota
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiPlatformQuotaWindowCopyWith<$Res> get weekly {
    return $Sub2ApiPlatformQuotaWindowCopyWith<$Res>(_self.weekly, (value) {
      return _then(_self.copyWith(weekly: value));
    });
  }

  /// Create a copy of Sub2ApiPlatformQuota
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiPlatformQuotaWindowCopyWith<$Res> get monthly {
    return $Sub2ApiPlatformQuotaWindowCopyWith<$Res>(_self.monthly, (value) {
      return _then(_self.copyWith(monthly: value));
    });
  }
}

/// @nodoc
mixin _$Sub2ApiChannelGroup {
  int get id;
  String get name;
  String get platform;
  String get subscriptionType;
  Sub2ApiDecimal get rateMultiplier;
  bool get peakRateEnabled;
  String get peakStart;
  String get peakEnd;
  Sub2ApiDecimal get peakRateMultiplier;
  bool get isExclusive;

  /// Create a copy of Sub2ApiChannelGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiChannelGroupCopyWith<Sub2ApiChannelGroup> get copyWith =>
      _$Sub2ApiChannelGroupCopyWithImpl<Sub2ApiChannelGroup>(
        this as Sub2ApiChannelGroup,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiChannelGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.subscriptionType, subscriptionType) ||
                other.subscriptionType == subscriptionType) &&
            (identical(other.rateMultiplier, rateMultiplier) ||
                other.rateMultiplier == rateMultiplier) &&
            (identical(other.peakRateEnabled, peakRateEnabled) ||
                other.peakRateEnabled == peakRateEnabled) &&
            (identical(other.peakStart, peakStart) ||
                other.peakStart == peakStart) &&
            (identical(other.peakEnd, peakEnd) || other.peakEnd == peakEnd) &&
            (identical(other.peakRateMultiplier, peakRateMultiplier) ||
                other.peakRateMultiplier == peakRateMultiplier) &&
            (identical(other.isExclusive, isExclusive) ||
                other.isExclusive == isExclusive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    platform,
    subscriptionType,
    rateMultiplier,
    peakRateEnabled,
    peakStart,
    peakEnd,
    peakRateMultiplier,
    isExclusive,
  );

  @override
  String toString() {
    return 'Sub2ApiChannelGroup(id: $id, name: $name, platform: $platform, subscriptionType: $subscriptionType, rateMultiplier: $rateMultiplier, peakRateEnabled: $peakRateEnabled, peakStart: $peakStart, peakEnd: $peakEnd, peakRateMultiplier: $peakRateMultiplier, isExclusive: $isExclusive)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiChannelGroupCopyWith<$Res> {
  factory $Sub2ApiChannelGroupCopyWith(
    Sub2ApiChannelGroup value,
    $Res Function(Sub2ApiChannelGroup) _then,
  ) = _$Sub2ApiChannelGroupCopyWithImpl;
  @useResult
  $Res call({
    int id,
    String name,
    String platform,
    String subscriptionType,
    Sub2ApiDecimal rateMultiplier,
    bool peakRateEnabled,
    String peakStart,
    String peakEnd,
    Sub2ApiDecimal peakRateMultiplier,
    bool isExclusive,
  });
}

/// @nodoc
class _$Sub2ApiChannelGroupCopyWithImpl<$Res>
    implements $Sub2ApiChannelGroupCopyWith<$Res> {
  _$Sub2ApiChannelGroupCopyWithImpl(this._self, this._then);

  final Sub2ApiChannelGroup _self;
  final $Res Function(Sub2ApiChannelGroup) _then;

  /// Create a copy of Sub2ApiChannelGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? platform = null,
    Object? subscriptionType = null,
    Object? rateMultiplier = null,
    Object? peakRateEnabled = null,
    Object? peakStart = null,
    Object? peakEnd = null,
    Object? peakRateMultiplier = null,
    Object? isExclusive = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        subscriptionType: null == subscriptionType
            ? _self.subscriptionType
            : subscriptionType // ignore: cast_nullable_to_non_nullable
                  as String,
        rateMultiplier: null == rateMultiplier
            ? _self.rateMultiplier
            : rateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        peakRateEnabled: null == peakRateEnabled
            ? _self.peakRateEnabled
            : peakRateEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        peakStart: null == peakStart
            ? _self.peakStart
            : peakStart // ignore: cast_nullable_to_non_nullable
                  as String,
        peakEnd: null == peakEnd
            ? _self.peakEnd
            : peakEnd // ignore: cast_nullable_to_non_nullable
                  as String,
        peakRateMultiplier: null == peakRateMultiplier
            ? _self.peakRateMultiplier
            : peakRateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        isExclusive: null == isExclusive
            ? _self.isExclusive
            : isExclusive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiChannelGroup].
extension Sub2ApiChannelGroupPatterns on Sub2ApiChannelGroup {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiChannelGroup value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiChannelGroup() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiChannelGroup value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiChannelGroup():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiChannelGroup value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiChannelGroup() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int id,
      String name,
      String platform,
      String subscriptionType,
      Sub2ApiDecimal rateMultiplier,
      bool peakRateEnabled,
      String peakStart,
      String peakEnd,
      Sub2ApiDecimal peakRateMultiplier,
      bool isExclusive,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiChannelGroup() when $default != null:
        return $default(
          _that.id,
          _that.name,
          _that.platform,
          _that.subscriptionType,
          _that.rateMultiplier,
          _that.peakRateEnabled,
          _that.peakStart,
          _that.peakEnd,
          _that.peakRateMultiplier,
          _that.isExclusive,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int id,
      String name,
      String platform,
      String subscriptionType,
      Sub2ApiDecimal rateMultiplier,
      bool peakRateEnabled,
      String peakStart,
      String peakEnd,
      Sub2ApiDecimal peakRateMultiplier,
      bool isExclusive,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiChannelGroup():
        return $default(
          _that.id,
          _that.name,
          _that.platform,
          _that.subscriptionType,
          _that.rateMultiplier,
          _that.peakRateEnabled,
          _that.peakStart,
          _that.peakEnd,
          _that.peakRateMultiplier,
          _that.isExclusive,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int id,
      String name,
      String platform,
      String subscriptionType,
      Sub2ApiDecimal rateMultiplier,
      bool peakRateEnabled,
      String peakStart,
      String peakEnd,
      Sub2ApiDecimal peakRateMultiplier,
      bool isExclusive,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiChannelGroup() when $default != null:
        return $default(
          _that.id,
          _that.name,
          _that.platform,
          _that.subscriptionType,
          _that.rateMultiplier,
          _that.peakRateEnabled,
          _that.peakStart,
          _that.peakEnd,
          _that.peakRateMultiplier,
          _that.isExclusive,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiChannelGroup implements Sub2ApiChannelGroup {
  const _Sub2ApiChannelGroup({
    required this.id,
    required this.name,
    required this.platform,
    required this.subscriptionType,
    required this.rateMultiplier,
    required this.peakRateEnabled,
    required this.peakStart,
    required this.peakEnd,
    required this.peakRateMultiplier,
    required this.isExclusive,
  });

  @override
  final int id;
  @override
  final String name;
  @override
  final String platform;
  @override
  final String subscriptionType;
  @override
  final Sub2ApiDecimal rateMultiplier;
  @override
  final bool peakRateEnabled;
  @override
  final String peakStart;
  @override
  final String peakEnd;
  @override
  final Sub2ApiDecimal peakRateMultiplier;
  @override
  final bool isExclusive;

  /// Create a copy of Sub2ApiChannelGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiChannelGroupCopyWith<_Sub2ApiChannelGroup> get copyWith =>
      __$Sub2ApiChannelGroupCopyWithImpl<_Sub2ApiChannelGroup>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiChannelGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.subscriptionType, subscriptionType) ||
                other.subscriptionType == subscriptionType) &&
            (identical(other.rateMultiplier, rateMultiplier) ||
                other.rateMultiplier == rateMultiplier) &&
            (identical(other.peakRateEnabled, peakRateEnabled) ||
                other.peakRateEnabled == peakRateEnabled) &&
            (identical(other.peakStart, peakStart) ||
                other.peakStart == peakStart) &&
            (identical(other.peakEnd, peakEnd) || other.peakEnd == peakEnd) &&
            (identical(other.peakRateMultiplier, peakRateMultiplier) ||
                other.peakRateMultiplier == peakRateMultiplier) &&
            (identical(other.isExclusive, isExclusive) ||
                other.isExclusive == isExclusive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    platform,
    subscriptionType,
    rateMultiplier,
    peakRateEnabled,
    peakStart,
    peakEnd,
    peakRateMultiplier,
    isExclusive,
  );

  @override
  String toString() {
    return 'Sub2ApiChannelGroup(id: $id, name: $name, platform: $platform, subscriptionType: $subscriptionType, rateMultiplier: $rateMultiplier, peakRateEnabled: $peakRateEnabled, peakStart: $peakStart, peakEnd: $peakEnd, peakRateMultiplier: $peakRateMultiplier, isExclusive: $isExclusive)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiChannelGroupCopyWith<$Res>
    implements $Sub2ApiChannelGroupCopyWith<$Res> {
  factory _$Sub2ApiChannelGroupCopyWith(
    _Sub2ApiChannelGroup value,
    $Res Function(_Sub2ApiChannelGroup) _then,
  ) = __$Sub2ApiChannelGroupCopyWithImpl;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String platform,
    String subscriptionType,
    Sub2ApiDecimal rateMultiplier,
    bool peakRateEnabled,
    String peakStart,
    String peakEnd,
    Sub2ApiDecimal peakRateMultiplier,
    bool isExclusive,
  });
}

/// @nodoc
class __$Sub2ApiChannelGroupCopyWithImpl<$Res>
    implements _$Sub2ApiChannelGroupCopyWith<$Res> {
  __$Sub2ApiChannelGroupCopyWithImpl(this._self, this._then);

  final _Sub2ApiChannelGroup _self;
  final $Res Function(_Sub2ApiChannelGroup) _then;

  /// Create a copy of Sub2ApiChannelGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? platform = null,
    Object? subscriptionType = null,
    Object? rateMultiplier = null,
    Object? peakRateEnabled = null,
    Object? peakStart = null,
    Object? peakEnd = null,
    Object? peakRateMultiplier = null,
    Object? isExclusive = null,
  }) {
    return _then(
      _Sub2ApiChannelGroup(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        subscriptionType: null == subscriptionType
            ? _self.subscriptionType
            : subscriptionType // ignore: cast_nullable_to_non_nullable
                  as String,
        rateMultiplier: null == rateMultiplier
            ? _self.rateMultiplier
            : rateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        peakRateEnabled: null == peakRateEnabled
            ? _self.peakRateEnabled
            : peakRateEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        peakStart: null == peakStart
            ? _self.peakStart
            : peakStart // ignore: cast_nullable_to_non_nullable
                  as String,
        peakEnd: null == peakEnd
            ? _self.peakEnd
            : peakEnd // ignore: cast_nullable_to_non_nullable
                  as String,
        peakRateMultiplier: null == peakRateMultiplier
            ? _self.peakRateMultiplier
            : peakRateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        isExclusive: null == isExclusive
            ? _self.isExclusive
            : isExclusive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiPricingInterval {
  int get minTokens;
  int? get maxTokens;
  String? get tierLabel;
  Sub2ApiDecimal? get inputPrice;
  Sub2ApiDecimal? get outputPrice;
  Sub2ApiDecimal? get cacheWritePrice;
  Sub2ApiDecimal? get cacheReadPrice;
  Sub2ApiDecimal? get perRequestPrice;

  /// Create a copy of Sub2ApiPricingInterval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiPricingIntervalCopyWith<Sub2ApiPricingInterval> get copyWith =>
      _$Sub2ApiPricingIntervalCopyWithImpl<Sub2ApiPricingInterval>(
        this as Sub2ApiPricingInterval,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiPricingInterval &&
            (identical(other.minTokens, minTokens) ||
                other.minTokens == minTokens) &&
            (identical(other.maxTokens, maxTokens) ||
                other.maxTokens == maxTokens) &&
            (identical(other.tierLabel, tierLabel) ||
                other.tierLabel == tierLabel) &&
            (identical(other.inputPrice, inputPrice) ||
                other.inputPrice == inputPrice) &&
            (identical(other.outputPrice, outputPrice) ||
                other.outputPrice == outputPrice) &&
            (identical(other.cacheWritePrice, cacheWritePrice) ||
                other.cacheWritePrice == cacheWritePrice) &&
            (identical(other.cacheReadPrice, cacheReadPrice) ||
                other.cacheReadPrice == cacheReadPrice) &&
            (identical(other.perRequestPrice, perRequestPrice) ||
                other.perRequestPrice == perRequestPrice));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    minTokens,
    maxTokens,
    tierLabel,
    inputPrice,
    outputPrice,
    cacheWritePrice,
    cacheReadPrice,
    perRequestPrice,
  );

  @override
  String toString() {
    return 'Sub2ApiPricingInterval(minTokens: $minTokens, maxTokens: $maxTokens, tierLabel: $tierLabel, inputPrice: $inputPrice, outputPrice: $outputPrice, cacheWritePrice: $cacheWritePrice, cacheReadPrice: $cacheReadPrice, perRequestPrice: $perRequestPrice)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiPricingIntervalCopyWith<$Res> {
  factory $Sub2ApiPricingIntervalCopyWith(
    Sub2ApiPricingInterval value,
    $Res Function(Sub2ApiPricingInterval) _then,
  ) = _$Sub2ApiPricingIntervalCopyWithImpl;
  @useResult
  $Res call({
    int minTokens,
    int? maxTokens,
    String? tierLabel,
    Sub2ApiDecimal? inputPrice,
    Sub2ApiDecimal? outputPrice,
    Sub2ApiDecimal? cacheWritePrice,
    Sub2ApiDecimal? cacheReadPrice,
    Sub2ApiDecimal? perRequestPrice,
  });
}

/// @nodoc
class _$Sub2ApiPricingIntervalCopyWithImpl<$Res>
    implements $Sub2ApiPricingIntervalCopyWith<$Res> {
  _$Sub2ApiPricingIntervalCopyWithImpl(this._self, this._then);

  final Sub2ApiPricingInterval _self;
  final $Res Function(Sub2ApiPricingInterval) _then;

  /// Create a copy of Sub2ApiPricingInterval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minTokens = null,
    Object? maxTokens = freezed,
    Object? tierLabel = freezed,
    Object? inputPrice = freezed,
    Object? outputPrice = freezed,
    Object? cacheWritePrice = freezed,
    Object? cacheReadPrice = freezed,
    Object? perRequestPrice = freezed,
  }) {
    return _then(
      _self.copyWith(
        minTokens: null == minTokens
            ? _self.minTokens
            : minTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        maxTokens: freezed == maxTokens
            ? _self.maxTokens
            : maxTokens // ignore: cast_nullable_to_non_nullable
                  as int?,
        tierLabel: freezed == tierLabel
            ? _self.tierLabel
            : tierLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        inputPrice: freezed == inputPrice
            ? _self.inputPrice
            : inputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        outputPrice: freezed == outputPrice
            ? _self.outputPrice
            : outputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        cacheWritePrice: freezed == cacheWritePrice
            ? _self.cacheWritePrice
            : cacheWritePrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        cacheReadPrice: freezed == cacheReadPrice
            ? _self.cacheReadPrice
            : cacheReadPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        perRequestPrice: freezed == perRequestPrice
            ? _self.perRequestPrice
            : perRequestPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiPricingInterval].
extension Sub2ApiPricingIntervalPatterns on Sub2ApiPricingInterval {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiPricingInterval value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPricingInterval() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiPricingInterval value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPricingInterval():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiPricingInterval value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPricingInterval() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int minTokens,
      int? maxTokens,
      String? tierLabel,
      Sub2ApiDecimal? inputPrice,
      Sub2ApiDecimal? outputPrice,
      Sub2ApiDecimal? cacheWritePrice,
      Sub2ApiDecimal? cacheReadPrice,
      Sub2ApiDecimal? perRequestPrice,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPricingInterval() when $default != null:
        return $default(
          _that.minTokens,
          _that.maxTokens,
          _that.tierLabel,
          _that.inputPrice,
          _that.outputPrice,
          _that.cacheWritePrice,
          _that.cacheReadPrice,
          _that.perRequestPrice,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int minTokens,
      int? maxTokens,
      String? tierLabel,
      Sub2ApiDecimal? inputPrice,
      Sub2ApiDecimal? outputPrice,
      Sub2ApiDecimal? cacheWritePrice,
      Sub2ApiDecimal? cacheReadPrice,
      Sub2ApiDecimal? perRequestPrice,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPricingInterval():
        return $default(
          _that.minTokens,
          _that.maxTokens,
          _that.tierLabel,
          _that.inputPrice,
          _that.outputPrice,
          _that.cacheWritePrice,
          _that.cacheReadPrice,
          _that.perRequestPrice,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int minTokens,
      int? maxTokens,
      String? tierLabel,
      Sub2ApiDecimal? inputPrice,
      Sub2ApiDecimal? outputPrice,
      Sub2ApiDecimal? cacheWritePrice,
      Sub2ApiDecimal? cacheReadPrice,
      Sub2ApiDecimal? perRequestPrice,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiPricingInterval() when $default != null:
        return $default(
          _that.minTokens,
          _that.maxTokens,
          _that.tierLabel,
          _that.inputPrice,
          _that.outputPrice,
          _that.cacheWritePrice,
          _that.cacheReadPrice,
          _that.perRequestPrice,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiPricingInterval implements Sub2ApiPricingInterval {
  const _Sub2ApiPricingInterval({
    required this.minTokens,
    required this.maxTokens,
    required this.tierLabel,
    required this.inputPrice,
    required this.outputPrice,
    required this.cacheWritePrice,
    required this.cacheReadPrice,
    required this.perRequestPrice,
  });

  @override
  final int minTokens;
  @override
  final int? maxTokens;
  @override
  final String? tierLabel;
  @override
  final Sub2ApiDecimal? inputPrice;
  @override
  final Sub2ApiDecimal? outputPrice;
  @override
  final Sub2ApiDecimal? cacheWritePrice;
  @override
  final Sub2ApiDecimal? cacheReadPrice;
  @override
  final Sub2ApiDecimal? perRequestPrice;

  /// Create a copy of Sub2ApiPricingInterval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiPricingIntervalCopyWith<_Sub2ApiPricingInterval> get copyWith =>
      __$Sub2ApiPricingIntervalCopyWithImpl<_Sub2ApiPricingInterval>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiPricingInterval &&
            (identical(other.minTokens, minTokens) ||
                other.minTokens == minTokens) &&
            (identical(other.maxTokens, maxTokens) ||
                other.maxTokens == maxTokens) &&
            (identical(other.tierLabel, tierLabel) ||
                other.tierLabel == tierLabel) &&
            (identical(other.inputPrice, inputPrice) ||
                other.inputPrice == inputPrice) &&
            (identical(other.outputPrice, outputPrice) ||
                other.outputPrice == outputPrice) &&
            (identical(other.cacheWritePrice, cacheWritePrice) ||
                other.cacheWritePrice == cacheWritePrice) &&
            (identical(other.cacheReadPrice, cacheReadPrice) ||
                other.cacheReadPrice == cacheReadPrice) &&
            (identical(other.perRequestPrice, perRequestPrice) ||
                other.perRequestPrice == perRequestPrice));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    minTokens,
    maxTokens,
    tierLabel,
    inputPrice,
    outputPrice,
    cacheWritePrice,
    cacheReadPrice,
    perRequestPrice,
  );

  @override
  String toString() {
    return 'Sub2ApiPricingInterval(minTokens: $minTokens, maxTokens: $maxTokens, tierLabel: $tierLabel, inputPrice: $inputPrice, outputPrice: $outputPrice, cacheWritePrice: $cacheWritePrice, cacheReadPrice: $cacheReadPrice, perRequestPrice: $perRequestPrice)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiPricingIntervalCopyWith<$Res>
    implements $Sub2ApiPricingIntervalCopyWith<$Res> {
  factory _$Sub2ApiPricingIntervalCopyWith(
    _Sub2ApiPricingInterval value,
    $Res Function(_Sub2ApiPricingInterval) _then,
  ) = __$Sub2ApiPricingIntervalCopyWithImpl;
  @override
  @useResult
  $Res call({
    int minTokens,
    int? maxTokens,
    String? tierLabel,
    Sub2ApiDecimal? inputPrice,
    Sub2ApiDecimal? outputPrice,
    Sub2ApiDecimal? cacheWritePrice,
    Sub2ApiDecimal? cacheReadPrice,
    Sub2ApiDecimal? perRequestPrice,
  });
}

/// @nodoc
class __$Sub2ApiPricingIntervalCopyWithImpl<$Res>
    implements _$Sub2ApiPricingIntervalCopyWith<$Res> {
  __$Sub2ApiPricingIntervalCopyWithImpl(this._self, this._then);

  final _Sub2ApiPricingInterval _self;
  final $Res Function(_Sub2ApiPricingInterval) _then;

  /// Create a copy of Sub2ApiPricingInterval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? minTokens = null,
    Object? maxTokens = freezed,
    Object? tierLabel = freezed,
    Object? inputPrice = freezed,
    Object? outputPrice = freezed,
    Object? cacheWritePrice = freezed,
    Object? cacheReadPrice = freezed,
    Object? perRequestPrice = freezed,
  }) {
    return _then(
      _Sub2ApiPricingInterval(
        minTokens: null == minTokens
            ? _self.minTokens
            : minTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        maxTokens: freezed == maxTokens
            ? _self.maxTokens
            : maxTokens // ignore: cast_nullable_to_non_nullable
                  as int?,
        tierLabel: freezed == tierLabel
            ? _self.tierLabel
            : tierLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        inputPrice: freezed == inputPrice
            ? _self.inputPrice
            : inputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        outputPrice: freezed == outputPrice
            ? _self.outputPrice
            : outputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        cacheWritePrice: freezed == cacheWritePrice
            ? _self.cacheWritePrice
            : cacheWritePrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        cacheReadPrice: freezed == cacheReadPrice
            ? _self.cacheReadPrice
            : cacheReadPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        perRequestPrice: freezed == perRequestPrice
            ? _self.perRequestPrice
            : perRequestPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiSupportedModelPricing {
  String get billingMode;
  Sub2ApiDecimal? get inputPrice;
  Sub2ApiDecimal? get outputPrice;
  Sub2ApiDecimal? get cacheWritePrice;
  Sub2ApiDecimal? get cacheReadPrice;
  Sub2ApiDecimal? get imageInputPrice;
  Sub2ApiDecimal? get imageOutputPrice;
  Sub2ApiDecimal? get perRequestPrice;
  List<Sub2ApiPricingInterval> get intervals;

  /// Create a copy of Sub2ApiSupportedModelPricing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiSupportedModelPricingCopyWith<Sub2ApiSupportedModelPricing>
  get copyWith =>
      _$Sub2ApiSupportedModelPricingCopyWithImpl<Sub2ApiSupportedModelPricing>(
        this as Sub2ApiSupportedModelPricing,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiSupportedModelPricing &&
            (identical(other.billingMode, billingMode) ||
                other.billingMode == billingMode) &&
            (identical(other.inputPrice, inputPrice) ||
                other.inputPrice == inputPrice) &&
            (identical(other.outputPrice, outputPrice) ||
                other.outputPrice == outputPrice) &&
            (identical(other.cacheWritePrice, cacheWritePrice) ||
                other.cacheWritePrice == cacheWritePrice) &&
            (identical(other.cacheReadPrice, cacheReadPrice) ||
                other.cacheReadPrice == cacheReadPrice) &&
            (identical(other.imageInputPrice, imageInputPrice) ||
                other.imageInputPrice == imageInputPrice) &&
            (identical(other.imageOutputPrice, imageOutputPrice) ||
                other.imageOutputPrice == imageOutputPrice) &&
            (identical(other.perRequestPrice, perRequestPrice) ||
                other.perRequestPrice == perRequestPrice) &&
            const DeepCollectionEquality().equals(other.intervals, intervals));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    billingMode,
    inputPrice,
    outputPrice,
    cacheWritePrice,
    cacheReadPrice,
    imageInputPrice,
    imageOutputPrice,
    perRequestPrice,
    const DeepCollectionEquality().hash(intervals),
  );

  @override
  String toString() {
    return 'Sub2ApiSupportedModelPricing(billingMode: $billingMode, inputPrice: $inputPrice, outputPrice: $outputPrice, cacheWritePrice: $cacheWritePrice, cacheReadPrice: $cacheReadPrice, imageInputPrice: $imageInputPrice, imageOutputPrice: $imageOutputPrice, perRequestPrice: $perRequestPrice, intervals: $intervals)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiSupportedModelPricingCopyWith<$Res> {
  factory $Sub2ApiSupportedModelPricingCopyWith(
    Sub2ApiSupportedModelPricing value,
    $Res Function(Sub2ApiSupportedModelPricing) _then,
  ) = _$Sub2ApiSupportedModelPricingCopyWithImpl;
  @useResult
  $Res call({
    String billingMode,
    Sub2ApiDecimal? inputPrice,
    Sub2ApiDecimal? outputPrice,
    Sub2ApiDecimal? cacheWritePrice,
    Sub2ApiDecimal? cacheReadPrice,
    Sub2ApiDecimal? imageInputPrice,
    Sub2ApiDecimal? imageOutputPrice,
    Sub2ApiDecimal? perRequestPrice,
    List<Sub2ApiPricingInterval> intervals,
  });
}

/// @nodoc
class _$Sub2ApiSupportedModelPricingCopyWithImpl<$Res>
    implements $Sub2ApiSupportedModelPricingCopyWith<$Res> {
  _$Sub2ApiSupportedModelPricingCopyWithImpl(this._self, this._then);

  final Sub2ApiSupportedModelPricing _self;
  final $Res Function(Sub2ApiSupportedModelPricing) _then;

  /// Create a copy of Sub2ApiSupportedModelPricing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billingMode = null,
    Object? inputPrice = freezed,
    Object? outputPrice = freezed,
    Object? cacheWritePrice = freezed,
    Object? cacheReadPrice = freezed,
    Object? imageInputPrice = freezed,
    Object? imageOutputPrice = freezed,
    Object? perRequestPrice = freezed,
    Object? intervals = null,
  }) {
    return _then(
      _self.copyWith(
        billingMode: null == billingMode
            ? _self.billingMode
            : billingMode // ignore: cast_nullable_to_non_nullable
                  as String,
        inputPrice: freezed == inputPrice
            ? _self.inputPrice
            : inputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        outputPrice: freezed == outputPrice
            ? _self.outputPrice
            : outputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        cacheWritePrice: freezed == cacheWritePrice
            ? _self.cacheWritePrice
            : cacheWritePrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        cacheReadPrice: freezed == cacheReadPrice
            ? _self.cacheReadPrice
            : cacheReadPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        imageInputPrice: freezed == imageInputPrice
            ? _self.imageInputPrice
            : imageInputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        imageOutputPrice: freezed == imageOutputPrice
            ? _self.imageOutputPrice
            : imageOutputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        perRequestPrice: freezed == perRequestPrice
            ? _self.perRequestPrice
            : perRequestPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        intervals: null == intervals
            ? _self.intervals
            : intervals // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiPricingInterval>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiSupportedModelPricing].
extension Sub2ApiSupportedModelPricingPatterns on Sub2ApiSupportedModelPricing {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiSupportedModelPricing value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSupportedModelPricing() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiSupportedModelPricing value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSupportedModelPricing():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiSupportedModelPricing value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSupportedModelPricing() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String billingMode,
      Sub2ApiDecimal? inputPrice,
      Sub2ApiDecimal? outputPrice,
      Sub2ApiDecimal? cacheWritePrice,
      Sub2ApiDecimal? cacheReadPrice,
      Sub2ApiDecimal? imageInputPrice,
      Sub2ApiDecimal? imageOutputPrice,
      Sub2ApiDecimal? perRequestPrice,
      List<Sub2ApiPricingInterval> intervals,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSupportedModelPricing() when $default != null:
        return $default(
          _that.billingMode,
          _that.inputPrice,
          _that.outputPrice,
          _that.cacheWritePrice,
          _that.cacheReadPrice,
          _that.imageInputPrice,
          _that.imageOutputPrice,
          _that.perRequestPrice,
          _that.intervals,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String billingMode,
      Sub2ApiDecimal? inputPrice,
      Sub2ApiDecimal? outputPrice,
      Sub2ApiDecimal? cacheWritePrice,
      Sub2ApiDecimal? cacheReadPrice,
      Sub2ApiDecimal? imageInputPrice,
      Sub2ApiDecimal? imageOutputPrice,
      Sub2ApiDecimal? perRequestPrice,
      List<Sub2ApiPricingInterval> intervals,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSupportedModelPricing():
        return $default(
          _that.billingMode,
          _that.inputPrice,
          _that.outputPrice,
          _that.cacheWritePrice,
          _that.cacheReadPrice,
          _that.imageInputPrice,
          _that.imageOutputPrice,
          _that.perRequestPrice,
          _that.intervals,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String billingMode,
      Sub2ApiDecimal? inputPrice,
      Sub2ApiDecimal? outputPrice,
      Sub2ApiDecimal? cacheWritePrice,
      Sub2ApiDecimal? cacheReadPrice,
      Sub2ApiDecimal? imageInputPrice,
      Sub2ApiDecimal? imageOutputPrice,
      Sub2ApiDecimal? perRequestPrice,
      List<Sub2ApiPricingInterval> intervals,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSupportedModelPricing() when $default != null:
        return $default(
          _that.billingMode,
          _that.inputPrice,
          _that.outputPrice,
          _that.cacheWritePrice,
          _that.cacheReadPrice,
          _that.imageInputPrice,
          _that.imageOutputPrice,
          _that.perRequestPrice,
          _that.intervals,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiSupportedModelPricing implements Sub2ApiSupportedModelPricing {
  const _Sub2ApiSupportedModelPricing({
    required this.billingMode,
    required this.inputPrice,
    required this.outputPrice,
    required this.cacheWritePrice,
    required this.cacheReadPrice,
    required this.imageInputPrice,
    required this.imageOutputPrice,
    required this.perRequestPrice,
    required final List<Sub2ApiPricingInterval> intervals,
  }) : _intervals = intervals;

  @override
  final String billingMode;
  @override
  final Sub2ApiDecimal? inputPrice;
  @override
  final Sub2ApiDecimal? outputPrice;
  @override
  final Sub2ApiDecimal? cacheWritePrice;
  @override
  final Sub2ApiDecimal? cacheReadPrice;
  @override
  final Sub2ApiDecimal? imageInputPrice;
  @override
  final Sub2ApiDecimal? imageOutputPrice;
  @override
  final Sub2ApiDecimal? perRequestPrice;
  final List<Sub2ApiPricingInterval> _intervals;
  @override
  List<Sub2ApiPricingInterval> get intervals {
    if (_intervals is EqualUnmodifiableListView) return _intervals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_intervals);
  }

  /// Create a copy of Sub2ApiSupportedModelPricing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiSupportedModelPricingCopyWith<_Sub2ApiSupportedModelPricing>
  get copyWith =>
      __$Sub2ApiSupportedModelPricingCopyWithImpl<
        _Sub2ApiSupportedModelPricing
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiSupportedModelPricing &&
            (identical(other.billingMode, billingMode) ||
                other.billingMode == billingMode) &&
            (identical(other.inputPrice, inputPrice) ||
                other.inputPrice == inputPrice) &&
            (identical(other.outputPrice, outputPrice) ||
                other.outputPrice == outputPrice) &&
            (identical(other.cacheWritePrice, cacheWritePrice) ||
                other.cacheWritePrice == cacheWritePrice) &&
            (identical(other.cacheReadPrice, cacheReadPrice) ||
                other.cacheReadPrice == cacheReadPrice) &&
            (identical(other.imageInputPrice, imageInputPrice) ||
                other.imageInputPrice == imageInputPrice) &&
            (identical(other.imageOutputPrice, imageOutputPrice) ||
                other.imageOutputPrice == imageOutputPrice) &&
            (identical(other.perRequestPrice, perRequestPrice) ||
                other.perRequestPrice == perRequestPrice) &&
            const DeepCollectionEquality().equals(
              other._intervals,
              _intervals,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    billingMode,
    inputPrice,
    outputPrice,
    cacheWritePrice,
    cacheReadPrice,
    imageInputPrice,
    imageOutputPrice,
    perRequestPrice,
    const DeepCollectionEquality().hash(_intervals),
  );

  @override
  String toString() {
    return 'Sub2ApiSupportedModelPricing(billingMode: $billingMode, inputPrice: $inputPrice, outputPrice: $outputPrice, cacheWritePrice: $cacheWritePrice, cacheReadPrice: $cacheReadPrice, imageInputPrice: $imageInputPrice, imageOutputPrice: $imageOutputPrice, perRequestPrice: $perRequestPrice, intervals: $intervals)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiSupportedModelPricingCopyWith<$Res>
    implements $Sub2ApiSupportedModelPricingCopyWith<$Res> {
  factory _$Sub2ApiSupportedModelPricingCopyWith(
    _Sub2ApiSupportedModelPricing value,
    $Res Function(_Sub2ApiSupportedModelPricing) _then,
  ) = __$Sub2ApiSupportedModelPricingCopyWithImpl;
  @override
  @useResult
  $Res call({
    String billingMode,
    Sub2ApiDecimal? inputPrice,
    Sub2ApiDecimal? outputPrice,
    Sub2ApiDecimal? cacheWritePrice,
    Sub2ApiDecimal? cacheReadPrice,
    Sub2ApiDecimal? imageInputPrice,
    Sub2ApiDecimal? imageOutputPrice,
    Sub2ApiDecimal? perRequestPrice,
    List<Sub2ApiPricingInterval> intervals,
  });
}

/// @nodoc
class __$Sub2ApiSupportedModelPricingCopyWithImpl<$Res>
    implements _$Sub2ApiSupportedModelPricingCopyWith<$Res> {
  __$Sub2ApiSupportedModelPricingCopyWithImpl(this._self, this._then);

  final _Sub2ApiSupportedModelPricing _self;
  final $Res Function(_Sub2ApiSupportedModelPricing) _then;

  /// Create a copy of Sub2ApiSupportedModelPricing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? billingMode = null,
    Object? inputPrice = freezed,
    Object? outputPrice = freezed,
    Object? cacheWritePrice = freezed,
    Object? cacheReadPrice = freezed,
    Object? imageInputPrice = freezed,
    Object? imageOutputPrice = freezed,
    Object? perRequestPrice = freezed,
    Object? intervals = null,
  }) {
    return _then(
      _Sub2ApiSupportedModelPricing(
        billingMode: null == billingMode
            ? _self.billingMode
            : billingMode // ignore: cast_nullable_to_non_nullable
                  as String,
        inputPrice: freezed == inputPrice
            ? _self.inputPrice
            : inputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        outputPrice: freezed == outputPrice
            ? _self.outputPrice
            : outputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        cacheWritePrice: freezed == cacheWritePrice
            ? _self.cacheWritePrice
            : cacheWritePrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        cacheReadPrice: freezed == cacheReadPrice
            ? _self.cacheReadPrice
            : cacheReadPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        imageInputPrice: freezed == imageInputPrice
            ? _self.imageInputPrice
            : imageInputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        imageOutputPrice: freezed == imageOutputPrice
            ? _self.imageOutputPrice
            : imageOutputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        perRequestPrice: freezed == perRequestPrice
            ? _self.perRequestPrice
            : perRequestPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        intervals: null == intervals
            ? _self._intervals
            : intervals // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiPricingInterval>,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiSupportedModel {
  String get name;
  String get platform;
  Sub2ApiSupportedModelPricing? get pricing;

  /// Create a copy of Sub2ApiSupportedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiSupportedModelCopyWith<Sub2ApiSupportedModel> get copyWith =>
      _$Sub2ApiSupportedModelCopyWithImpl<Sub2ApiSupportedModel>(
        this as Sub2ApiSupportedModel,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiSupportedModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.pricing, pricing) || other.pricing == pricing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, platform, pricing);

  @override
  String toString() {
    return 'Sub2ApiSupportedModel(name: $name, platform: $platform, pricing: $pricing)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiSupportedModelCopyWith<$Res> {
  factory $Sub2ApiSupportedModelCopyWith(
    Sub2ApiSupportedModel value,
    $Res Function(Sub2ApiSupportedModel) _then,
  ) = _$Sub2ApiSupportedModelCopyWithImpl;
  @useResult
  $Res call({
    String name,
    String platform,
    Sub2ApiSupportedModelPricing? pricing,
  });

  $Sub2ApiSupportedModelPricingCopyWith<$Res>? get pricing;
}

/// @nodoc
class _$Sub2ApiSupportedModelCopyWithImpl<$Res>
    implements $Sub2ApiSupportedModelCopyWith<$Res> {
  _$Sub2ApiSupportedModelCopyWithImpl(this._self, this._then);

  final Sub2ApiSupportedModel _self;
  final $Res Function(Sub2ApiSupportedModel) _then;

  /// Create a copy of Sub2ApiSupportedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? platform = null,
    Object? pricing = freezed,
  }) {
    return _then(
      _self.copyWith(
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        pricing: freezed == pricing
            ? _self.pricing
            : pricing // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiSupportedModelPricing?,
      ),
    );
  }

  /// Create a copy of Sub2ApiSupportedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiSupportedModelPricingCopyWith<$Res>? get pricing {
    if (_self.pricing == null) {
      return null;
    }

    return $Sub2ApiSupportedModelPricingCopyWith<$Res>(_self.pricing!, (value) {
      return _then(_self.copyWith(pricing: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiSupportedModel].
extension Sub2ApiSupportedModelPatterns on Sub2ApiSupportedModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiSupportedModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSupportedModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiSupportedModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSupportedModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiSupportedModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSupportedModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String name,
      String platform,
      Sub2ApiSupportedModelPricing? pricing,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSupportedModel() when $default != null:
        return $default(_that.name, _that.platform, _that.pricing);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String name,
      String platform,
      Sub2ApiSupportedModelPricing? pricing,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSupportedModel():
        return $default(_that.name, _that.platform, _that.pricing);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String name,
      String platform,
      Sub2ApiSupportedModelPricing? pricing,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSupportedModel() when $default != null:
        return $default(_that.name, _that.platform, _that.pricing);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiSupportedModel implements Sub2ApiSupportedModel {
  const _Sub2ApiSupportedModel({
    required this.name,
    required this.platform,
    required this.pricing,
  });

  @override
  final String name;
  @override
  final String platform;
  @override
  final Sub2ApiSupportedModelPricing? pricing;

  /// Create a copy of Sub2ApiSupportedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiSupportedModelCopyWith<_Sub2ApiSupportedModel> get copyWith =>
      __$Sub2ApiSupportedModelCopyWithImpl<_Sub2ApiSupportedModel>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiSupportedModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.pricing, pricing) || other.pricing == pricing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, platform, pricing);

  @override
  String toString() {
    return 'Sub2ApiSupportedModel(name: $name, platform: $platform, pricing: $pricing)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiSupportedModelCopyWith<$Res>
    implements $Sub2ApiSupportedModelCopyWith<$Res> {
  factory _$Sub2ApiSupportedModelCopyWith(
    _Sub2ApiSupportedModel value,
    $Res Function(_Sub2ApiSupportedModel) _then,
  ) = __$Sub2ApiSupportedModelCopyWithImpl;
  @override
  @useResult
  $Res call({
    String name,
    String platform,
    Sub2ApiSupportedModelPricing? pricing,
  });

  @override
  $Sub2ApiSupportedModelPricingCopyWith<$Res>? get pricing;
}

/// @nodoc
class __$Sub2ApiSupportedModelCopyWithImpl<$Res>
    implements _$Sub2ApiSupportedModelCopyWith<$Res> {
  __$Sub2ApiSupportedModelCopyWithImpl(this._self, this._then);

  final _Sub2ApiSupportedModel _self;
  final $Res Function(_Sub2ApiSupportedModel) _then;

  /// Create a copy of Sub2ApiSupportedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? platform = null,
    Object? pricing = freezed,
  }) {
    return _then(
      _Sub2ApiSupportedModel(
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        pricing: freezed == pricing
            ? _self.pricing
            : pricing // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiSupportedModelPricing?,
      ),
    );
  }

  /// Create a copy of Sub2ApiSupportedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiSupportedModelPricingCopyWith<$Res>? get pricing {
    if (_self.pricing == null) {
      return null;
    }

    return $Sub2ApiSupportedModelPricingCopyWith<$Res>(_self.pricing!, (value) {
      return _then(_self.copyWith(pricing: value));
    });
  }
}

/// @nodoc
mixin _$Sub2ApiChannelPlatformSection {
  String get platform;
  List<Sub2ApiChannelGroup> get groups;
  List<Sub2ApiSupportedModel> get supportedModels;

  /// Create a copy of Sub2ApiChannelPlatformSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiChannelPlatformSectionCopyWith<Sub2ApiChannelPlatformSection>
  get copyWith =>
      _$Sub2ApiChannelPlatformSectionCopyWithImpl<
        Sub2ApiChannelPlatformSection
      >(this as Sub2ApiChannelPlatformSection, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiChannelPlatformSection &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            const DeepCollectionEquality().equals(other.groups, groups) &&
            const DeepCollectionEquality().equals(
              other.supportedModels,
              supportedModels,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    platform,
    const DeepCollectionEquality().hash(groups),
    const DeepCollectionEquality().hash(supportedModels),
  );

  @override
  String toString() {
    return 'Sub2ApiChannelPlatformSection(platform: $platform, groups: $groups, supportedModels: $supportedModels)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiChannelPlatformSectionCopyWith<$Res> {
  factory $Sub2ApiChannelPlatformSectionCopyWith(
    Sub2ApiChannelPlatformSection value,
    $Res Function(Sub2ApiChannelPlatformSection) _then,
  ) = _$Sub2ApiChannelPlatformSectionCopyWithImpl;
  @useResult
  $Res call({
    String platform,
    List<Sub2ApiChannelGroup> groups,
    List<Sub2ApiSupportedModel> supportedModels,
  });
}

/// @nodoc
class _$Sub2ApiChannelPlatformSectionCopyWithImpl<$Res>
    implements $Sub2ApiChannelPlatformSectionCopyWith<$Res> {
  _$Sub2ApiChannelPlatformSectionCopyWithImpl(this._self, this._then);

  final Sub2ApiChannelPlatformSection _self;
  final $Res Function(Sub2ApiChannelPlatformSection) _then;

  /// Create a copy of Sub2ApiChannelPlatformSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? groups = null,
    Object? supportedModels = null,
  }) {
    return _then(
      _self.copyWith(
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        groups: null == groups
            ? _self.groups
            : groups // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiChannelGroup>,
        supportedModels: null == supportedModels
            ? _self.supportedModels
            : supportedModels // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiSupportedModel>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiChannelPlatformSection].
extension Sub2ApiChannelPlatformSectionPatterns
    on Sub2ApiChannelPlatformSection {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiChannelPlatformSection value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiChannelPlatformSection() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiChannelPlatformSection value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiChannelPlatformSection():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiChannelPlatformSection value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiChannelPlatformSection() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String platform,
      List<Sub2ApiChannelGroup> groups,
      List<Sub2ApiSupportedModel> supportedModels,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiChannelPlatformSection() when $default != null:
        return $default(_that.platform, _that.groups, _that.supportedModels);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String platform,
      List<Sub2ApiChannelGroup> groups,
      List<Sub2ApiSupportedModel> supportedModels,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiChannelPlatformSection():
        return $default(_that.platform, _that.groups, _that.supportedModels);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String platform,
      List<Sub2ApiChannelGroup> groups,
      List<Sub2ApiSupportedModel> supportedModels,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiChannelPlatformSection() when $default != null:
        return $default(_that.platform, _that.groups, _that.supportedModels);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiChannelPlatformSection implements Sub2ApiChannelPlatformSection {
  const _Sub2ApiChannelPlatformSection({
    required this.platform,
    required final List<Sub2ApiChannelGroup> groups,
    required final List<Sub2ApiSupportedModel> supportedModels,
  }) : _groups = groups,
       _supportedModels = supportedModels;

  @override
  final String platform;
  final List<Sub2ApiChannelGroup> _groups;
  @override
  List<Sub2ApiChannelGroup> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  final List<Sub2ApiSupportedModel> _supportedModels;
  @override
  List<Sub2ApiSupportedModel> get supportedModels {
    if (_supportedModels is EqualUnmodifiableListView) return _supportedModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedModels);
  }

  /// Create a copy of Sub2ApiChannelPlatformSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiChannelPlatformSectionCopyWith<_Sub2ApiChannelPlatformSection>
  get copyWith =>
      __$Sub2ApiChannelPlatformSectionCopyWithImpl<
        _Sub2ApiChannelPlatformSection
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiChannelPlatformSection &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality().equals(
              other._supportedModels,
              _supportedModels,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    platform,
    const DeepCollectionEquality().hash(_groups),
    const DeepCollectionEquality().hash(_supportedModels),
  );

  @override
  String toString() {
    return 'Sub2ApiChannelPlatformSection(platform: $platform, groups: $groups, supportedModels: $supportedModels)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiChannelPlatformSectionCopyWith<$Res>
    implements $Sub2ApiChannelPlatformSectionCopyWith<$Res> {
  factory _$Sub2ApiChannelPlatformSectionCopyWith(
    _Sub2ApiChannelPlatformSection value,
    $Res Function(_Sub2ApiChannelPlatformSection) _then,
  ) = __$Sub2ApiChannelPlatformSectionCopyWithImpl;
  @override
  @useResult
  $Res call({
    String platform,
    List<Sub2ApiChannelGroup> groups,
    List<Sub2ApiSupportedModel> supportedModels,
  });
}

/// @nodoc
class __$Sub2ApiChannelPlatformSectionCopyWithImpl<$Res>
    implements _$Sub2ApiChannelPlatformSectionCopyWith<$Res> {
  __$Sub2ApiChannelPlatformSectionCopyWithImpl(this._self, this._then);

  final _Sub2ApiChannelPlatformSection _self;
  final $Res Function(_Sub2ApiChannelPlatformSection) _then;

  /// Create a copy of Sub2ApiChannelPlatformSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? platform = null,
    Object? groups = null,
    Object? supportedModels = null,
  }) {
    return _then(
      _Sub2ApiChannelPlatformSection(
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        groups: null == groups
            ? _self._groups
            : groups // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiChannelGroup>,
        supportedModels: null == supportedModels
            ? _self._supportedModels
            : supportedModels // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiSupportedModel>,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiAvailableChannel {
  String get name;
  String get description;
  List<Sub2ApiChannelPlatformSection> get platforms;

  /// Create a copy of Sub2ApiAvailableChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiAvailableChannelCopyWith<Sub2ApiAvailableChannel> get copyWith =>
      _$Sub2ApiAvailableChannelCopyWithImpl<Sub2ApiAvailableChannel>(
        this as Sub2ApiAvailableChannel,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiAvailableChannel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.platforms, platforms));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    description,
    const DeepCollectionEquality().hash(platforms),
  );

  @override
  String toString() {
    return 'Sub2ApiAvailableChannel(name: $name, description: $description, platforms: $platforms)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiAvailableChannelCopyWith<$Res> {
  factory $Sub2ApiAvailableChannelCopyWith(
    Sub2ApiAvailableChannel value,
    $Res Function(Sub2ApiAvailableChannel) _then,
  ) = _$Sub2ApiAvailableChannelCopyWithImpl;
  @useResult
  $Res call({
    String name,
    String description,
    List<Sub2ApiChannelPlatformSection> platforms,
  });
}

/// @nodoc
class _$Sub2ApiAvailableChannelCopyWithImpl<$Res>
    implements $Sub2ApiAvailableChannelCopyWith<$Res> {
  _$Sub2ApiAvailableChannelCopyWithImpl(this._self, this._then);

  final Sub2ApiAvailableChannel _self;
  final $Res Function(Sub2ApiAvailableChannel) _then;

  /// Create a copy of Sub2ApiAvailableChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? platforms = null,
  }) {
    return _then(
      _self.copyWith(
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        platforms: null == platforms
            ? _self.platforms
            : platforms // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiChannelPlatformSection>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiAvailableChannel].
extension Sub2ApiAvailableChannelPatterns on Sub2ApiAvailableChannel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiAvailableChannel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAvailableChannel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiAvailableChannel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAvailableChannel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiAvailableChannel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAvailableChannel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String name,
      String description,
      List<Sub2ApiChannelPlatformSection> platforms,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAvailableChannel() when $default != null:
        return $default(_that.name, _that.description, _that.platforms);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String name,
      String description,
      List<Sub2ApiChannelPlatformSection> platforms,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAvailableChannel():
        return $default(_that.name, _that.description, _that.platforms);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String name,
      String description,
      List<Sub2ApiChannelPlatformSection> platforms,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAvailableChannel() when $default != null:
        return $default(_that.name, _that.description, _that.platforms);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiAvailableChannel implements Sub2ApiAvailableChannel {
  const _Sub2ApiAvailableChannel({
    required this.name,
    required this.description,
    required final List<Sub2ApiChannelPlatformSection> platforms,
  }) : _platforms = platforms;

  @override
  final String name;
  @override
  final String description;
  final List<Sub2ApiChannelPlatformSection> _platforms;
  @override
  List<Sub2ApiChannelPlatformSection> get platforms {
    if (_platforms is EqualUnmodifiableListView) return _platforms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_platforms);
  }

  /// Create a copy of Sub2ApiAvailableChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiAvailableChannelCopyWith<_Sub2ApiAvailableChannel> get copyWith =>
      __$Sub2ApiAvailableChannelCopyWithImpl<_Sub2ApiAvailableChannel>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiAvailableChannel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._platforms,
              _platforms,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    description,
    const DeepCollectionEquality().hash(_platforms),
  );

  @override
  String toString() {
    return 'Sub2ApiAvailableChannel(name: $name, description: $description, platforms: $platforms)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiAvailableChannelCopyWith<$Res>
    implements $Sub2ApiAvailableChannelCopyWith<$Res> {
  factory _$Sub2ApiAvailableChannelCopyWith(
    _Sub2ApiAvailableChannel value,
    $Res Function(_Sub2ApiAvailableChannel) _then,
  ) = __$Sub2ApiAvailableChannelCopyWithImpl;
  @override
  @useResult
  $Res call({
    String name,
    String description,
    List<Sub2ApiChannelPlatformSection> platforms,
  });
}

/// @nodoc
class __$Sub2ApiAvailableChannelCopyWithImpl<$Res>
    implements _$Sub2ApiAvailableChannelCopyWith<$Res> {
  __$Sub2ApiAvailableChannelCopyWithImpl(this._self, this._then);

  final _Sub2ApiAvailableChannel _self;
  final $Res Function(_Sub2ApiAvailableChannel) _then;

  /// Create a copy of Sub2ApiAvailableChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? platforms = null,
  }) {
    return _then(
      _Sub2ApiAvailableChannel(
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        platforms: null == platforms
            ? _self._platforms
            : platforms // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiChannelPlatformSection>,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiApiKeyDailyUsagePoint {
  DateTime get date;
  int get requests;
  int get inputTokens;
  int get outputTokens;
  int get cacheReadTokens;
  int get cacheWriteTokens;
  int get totalTokens;
  Sub2ApiDecimal get cost;
  Sub2ApiDecimal get actualCost;

  /// Create a copy of Sub2ApiApiKeyDailyUsagePoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiApiKeyDailyUsagePointCopyWith<Sub2ApiApiKeyDailyUsagePoint>
  get copyWith =>
      _$Sub2ApiApiKeyDailyUsagePointCopyWithImpl<Sub2ApiApiKeyDailyUsagePoint>(
        this as Sub2ApiApiKeyDailyUsagePoint,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiApiKeyDailyUsagePoint &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.requests, requests) ||
                other.requests == requests) &&
            (identical(other.inputTokens, inputTokens) ||
                other.inputTokens == inputTokens) &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens) &&
            (identical(other.cacheReadTokens, cacheReadTokens) ||
                other.cacheReadTokens == cacheReadTokens) &&
            (identical(other.cacheWriteTokens, cacheWriteTokens) ||
                other.cacheWriteTokens == cacheWriteTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.actualCost, actualCost) ||
                other.actualCost == actualCost));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    requests,
    inputTokens,
    outputTokens,
    cacheReadTokens,
    cacheWriteTokens,
    totalTokens,
    cost,
    actualCost,
  );

  @override
  String toString() {
    return 'Sub2ApiApiKeyDailyUsagePoint(date: $date, requests: $requests, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheReadTokens: $cacheReadTokens, cacheWriteTokens: $cacheWriteTokens, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiApiKeyDailyUsagePointCopyWith<$Res> {
  factory $Sub2ApiApiKeyDailyUsagePointCopyWith(
    Sub2ApiApiKeyDailyUsagePoint value,
    $Res Function(Sub2ApiApiKeyDailyUsagePoint) _then,
  ) = _$Sub2ApiApiKeyDailyUsagePointCopyWithImpl;
  @useResult
  $Res call({
    DateTime date,
    int requests,
    int inputTokens,
    int outputTokens,
    int cacheReadTokens,
    int cacheWriteTokens,
    int totalTokens,
    Sub2ApiDecimal cost,
    Sub2ApiDecimal actualCost,
  });
}

/// @nodoc
class _$Sub2ApiApiKeyDailyUsagePointCopyWithImpl<$Res>
    implements $Sub2ApiApiKeyDailyUsagePointCopyWith<$Res> {
  _$Sub2ApiApiKeyDailyUsagePointCopyWithImpl(this._self, this._then);

  final Sub2ApiApiKeyDailyUsagePoint _self;
  final $Res Function(Sub2ApiApiKeyDailyUsagePoint) _then;

  /// Create a copy of Sub2ApiApiKeyDailyUsagePoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? requests = null,
    Object? inputTokens = null,
    Object? outputTokens = null,
    Object? cacheReadTokens = null,
    Object? cacheWriteTokens = null,
    Object? totalTokens = null,
    Object? cost = null,
    Object? actualCost = null,
  }) {
    return _then(
      _self.copyWith(
        date: null == date
            ? _self.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        requests: null == requests
            ? _self.requests
            : requests // ignore: cast_nullable_to_non_nullable
                  as int,
        inputTokens: null == inputTokens
            ? _self.inputTokens
            : inputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        outputTokens: null == outputTokens
            ? _self.outputTokens
            : outputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheReadTokens: null == cacheReadTokens
            ? _self.cacheReadTokens
            : cacheReadTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheWriteTokens: null == cacheWriteTokens
            ? _self.cacheWriteTokens
            : cacheWriteTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalTokens: null == totalTokens
            ? _self.totalTokens
            : totalTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cost: null == cost
            ? _self.cost
            : cost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        actualCost: null == actualCost
            ? _self.actualCost
            : actualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiApiKeyDailyUsagePoint].
extension Sub2ApiApiKeyDailyUsagePointPatterns on Sub2ApiApiKeyDailyUsagePoint {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiApiKeyDailyUsagePoint value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiApiKeyDailyUsagePoint() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiApiKeyDailyUsagePoint value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiApiKeyDailyUsagePoint():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiApiKeyDailyUsagePoint value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiApiKeyDailyUsagePoint() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      DateTime date,
      int requests,
      int inputTokens,
      int outputTokens,
      int cacheReadTokens,
      int cacheWriteTokens,
      int totalTokens,
      Sub2ApiDecimal cost,
      Sub2ApiDecimal actualCost,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiApiKeyDailyUsagePoint() when $default != null:
        return $default(
          _that.date,
          _that.requests,
          _that.inputTokens,
          _that.outputTokens,
          _that.cacheReadTokens,
          _that.cacheWriteTokens,
          _that.totalTokens,
          _that.cost,
          _that.actualCost,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      DateTime date,
      int requests,
      int inputTokens,
      int outputTokens,
      int cacheReadTokens,
      int cacheWriteTokens,
      int totalTokens,
      Sub2ApiDecimal cost,
      Sub2ApiDecimal actualCost,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiApiKeyDailyUsagePoint():
        return $default(
          _that.date,
          _that.requests,
          _that.inputTokens,
          _that.outputTokens,
          _that.cacheReadTokens,
          _that.cacheWriteTokens,
          _that.totalTokens,
          _that.cost,
          _that.actualCost,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      DateTime date,
      int requests,
      int inputTokens,
      int outputTokens,
      int cacheReadTokens,
      int cacheWriteTokens,
      int totalTokens,
      Sub2ApiDecimal cost,
      Sub2ApiDecimal actualCost,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiApiKeyDailyUsagePoint() when $default != null:
        return $default(
          _that.date,
          _that.requests,
          _that.inputTokens,
          _that.outputTokens,
          _that.cacheReadTokens,
          _that.cacheWriteTokens,
          _that.totalTokens,
          _that.cost,
          _that.actualCost,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiApiKeyDailyUsagePoint implements Sub2ApiApiKeyDailyUsagePoint {
  const _Sub2ApiApiKeyDailyUsagePoint({
    required this.date,
    required this.requests,
    required this.inputTokens,
    required this.outputTokens,
    required this.cacheReadTokens,
    required this.cacheWriteTokens,
    required this.totalTokens,
    required this.cost,
    required this.actualCost,
  });

  @override
  final DateTime date;
  @override
  final int requests;
  @override
  final int inputTokens;
  @override
  final int outputTokens;
  @override
  final int cacheReadTokens;
  @override
  final int cacheWriteTokens;
  @override
  final int totalTokens;
  @override
  final Sub2ApiDecimal cost;
  @override
  final Sub2ApiDecimal actualCost;

  /// Create a copy of Sub2ApiApiKeyDailyUsagePoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiApiKeyDailyUsagePointCopyWith<_Sub2ApiApiKeyDailyUsagePoint>
  get copyWith =>
      __$Sub2ApiApiKeyDailyUsagePointCopyWithImpl<
        _Sub2ApiApiKeyDailyUsagePoint
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiApiKeyDailyUsagePoint &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.requests, requests) ||
                other.requests == requests) &&
            (identical(other.inputTokens, inputTokens) ||
                other.inputTokens == inputTokens) &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens) &&
            (identical(other.cacheReadTokens, cacheReadTokens) ||
                other.cacheReadTokens == cacheReadTokens) &&
            (identical(other.cacheWriteTokens, cacheWriteTokens) ||
                other.cacheWriteTokens == cacheWriteTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.actualCost, actualCost) ||
                other.actualCost == actualCost));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    requests,
    inputTokens,
    outputTokens,
    cacheReadTokens,
    cacheWriteTokens,
    totalTokens,
    cost,
    actualCost,
  );

  @override
  String toString() {
    return 'Sub2ApiApiKeyDailyUsagePoint(date: $date, requests: $requests, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheReadTokens: $cacheReadTokens, cacheWriteTokens: $cacheWriteTokens, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiApiKeyDailyUsagePointCopyWith<$Res>
    implements $Sub2ApiApiKeyDailyUsagePointCopyWith<$Res> {
  factory _$Sub2ApiApiKeyDailyUsagePointCopyWith(
    _Sub2ApiApiKeyDailyUsagePoint value,
    $Res Function(_Sub2ApiApiKeyDailyUsagePoint) _then,
  ) = __$Sub2ApiApiKeyDailyUsagePointCopyWithImpl;
  @override
  @useResult
  $Res call({
    DateTime date,
    int requests,
    int inputTokens,
    int outputTokens,
    int cacheReadTokens,
    int cacheWriteTokens,
    int totalTokens,
    Sub2ApiDecimal cost,
    Sub2ApiDecimal actualCost,
  });
}

/// @nodoc
class __$Sub2ApiApiKeyDailyUsagePointCopyWithImpl<$Res>
    implements _$Sub2ApiApiKeyDailyUsagePointCopyWith<$Res> {
  __$Sub2ApiApiKeyDailyUsagePointCopyWithImpl(this._self, this._then);

  final _Sub2ApiApiKeyDailyUsagePoint _self;
  final $Res Function(_Sub2ApiApiKeyDailyUsagePoint) _then;

  /// Create a copy of Sub2ApiApiKeyDailyUsagePoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? requests = null,
    Object? inputTokens = null,
    Object? outputTokens = null,
    Object? cacheReadTokens = null,
    Object? cacheWriteTokens = null,
    Object? totalTokens = null,
    Object? cost = null,
    Object? actualCost = null,
  }) {
    return _then(
      _Sub2ApiApiKeyDailyUsagePoint(
        date: null == date
            ? _self.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        requests: null == requests
            ? _self.requests
            : requests // ignore: cast_nullable_to_non_nullable
                  as int,
        inputTokens: null == inputTokens
            ? _self.inputTokens
            : inputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        outputTokens: null == outputTokens
            ? _self.outputTokens
            : outputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheReadTokens: null == cacheReadTokens
            ? _self.cacheReadTokens
            : cacheReadTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheWriteTokens: null == cacheWriteTokens
            ? _self.cacheWriteTokens
            : cacheWriteTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalTokens: null == totalTokens
            ? _self.totalTokens
            : totalTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cost: null == cost
            ? _self.cost
            : cost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        actualCost: null == actualCost
            ? _self.actualCost
            : actualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiApiKeyDailyUsage {
  List<Sub2ApiApiKeyDailyUsagePoint> get items;
  int get days;
  DateTime get startDate;
  DateTime get endDate;

  /// Create a copy of Sub2ApiApiKeyDailyUsage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiApiKeyDailyUsageCopyWith<Sub2ApiApiKeyDailyUsage> get copyWith =>
      _$Sub2ApiApiKeyDailyUsageCopyWithImpl<Sub2ApiApiKeyDailyUsage>(
        this as Sub2ApiApiKeyDailyUsage,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiApiKeyDailyUsage &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(items),
    days,
    startDate,
    endDate,
  );

  @override
  String toString() {
    return 'Sub2ApiApiKeyDailyUsage(items: $items, days: $days, startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiApiKeyDailyUsageCopyWith<$Res> {
  factory $Sub2ApiApiKeyDailyUsageCopyWith(
    Sub2ApiApiKeyDailyUsage value,
    $Res Function(Sub2ApiApiKeyDailyUsage) _then,
  ) = _$Sub2ApiApiKeyDailyUsageCopyWithImpl;
  @useResult
  $Res call({
    List<Sub2ApiApiKeyDailyUsagePoint> items,
    int days,
    DateTime startDate,
    DateTime endDate,
  });
}

/// @nodoc
class _$Sub2ApiApiKeyDailyUsageCopyWithImpl<$Res>
    implements $Sub2ApiApiKeyDailyUsageCopyWith<$Res> {
  _$Sub2ApiApiKeyDailyUsageCopyWithImpl(this._self, this._then);

  final Sub2ApiApiKeyDailyUsage _self;
  final $Res Function(Sub2ApiApiKeyDailyUsage) _then;

  /// Create a copy of Sub2ApiApiKeyDailyUsage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? days = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(
      _self.copyWith(
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiApiKeyDailyUsagePoint>,
        days: null == days
            ? _self.days
            : days // ignore: cast_nullable_to_non_nullable
                  as int,
        startDate: null == startDate
            ? _self.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _self.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiApiKeyDailyUsage].
extension Sub2ApiApiKeyDailyUsagePatterns on Sub2ApiApiKeyDailyUsage {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiApiKeyDailyUsage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiApiKeyDailyUsage() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiApiKeyDailyUsage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiApiKeyDailyUsage():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiApiKeyDailyUsage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiApiKeyDailyUsage() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      List<Sub2ApiApiKeyDailyUsagePoint> items,
      int days,
      DateTime startDate,
      DateTime endDate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiApiKeyDailyUsage() when $default != null:
        return $default(
          _that.items,
          _that.days,
          _that.startDate,
          _that.endDate,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      List<Sub2ApiApiKeyDailyUsagePoint> items,
      int days,
      DateTime startDate,
      DateTime endDate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiApiKeyDailyUsage():
        return $default(
          _that.items,
          _that.days,
          _that.startDate,
          _that.endDate,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      List<Sub2ApiApiKeyDailyUsagePoint> items,
      int days,
      DateTime startDate,
      DateTime endDate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiApiKeyDailyUsage() when $default != null:
        return $default(
          _that.items,
          _that.days,
          _that.startDate,
          _that.endDate,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiApiKeyDailyUsage implements Sub2ApiApiKeyDailyUsage {
  const _Sub2ApiApiKeyDailyUsage({
    required final List<Sub2ApiApiKeyDailyUsagePoint> items,
    required this.days,
    required this.startDate,
    required this.endDate,
  }) : _items = items;

  final List<Sub2ApiApiKeyDailyUsagePoint> _items;
  @override
  List<Sub2ApiApiKeyDailyUsagePoint> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int days;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  /// Create a copy of Sub2ApiApiKeyDailyUsage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiApiKeyDailyUsageCopyWith<_Sub2ApiApiKeyDailyUsage> get copyWith =>
      __$Sub2ApiApiKeyDailyUsageCopyWithImpl<_Sub2ApiApiKeyDailyUsage>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiApiKeyDailyUsage &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    days,
    startDate,
    endDate,
  );

  @override
  String toString() {
    return 'Sub2ApiApiKeyDailyUsage(items: $items, days: $days, startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiApiKeyDailyUsageCopyWith<$Res>
    implements $Sub2ApiApiKeyDailyUsageCopyWith<$Res> {
  factory _$Sub2ApiApiKeyDailyUsageCopyWith(
    _Sub2ApiApiKeyDailyUsage value,
    $Res Function(_Sub2ApiApiKeyDailyUsage) _then,
  ) = __$Sub2ApiApiKeyDailyUsageCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<Sub2ApiApiKeyDailyUsagePoint> items,
    int days,
    DateTime startDate,
    DateTime endDate,
  });
}

/// @nodoc
class __$Sub2ApiApiKeyDailyUsageCopyWithImpl<$Res>
    implements _$Sub2ApiApiKeyDailyUsageCopyWith<$Res> {
  __$Sub2ApiApiKeyDailyUsageCopyWithImpl(this._self, this._then);

  final _Sub2ApiApiKeyDailyUsage _self;
  final $Res Function(_Sub2ApiApiKeyDailyUsage) _then;

  /// Create a copy of Sub2ApiApiKeyDailyUsage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? days = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(
      _Sub2ApiApiKeyDailyUsage(
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiApiKeyDailyUsagePoint>,
        days: null == days
            ? _self.days
            : days // ignore: cast_nullable_to_non_nullable
                  as int,
        startDate: null == startDate
            ? _self.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _self.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}
