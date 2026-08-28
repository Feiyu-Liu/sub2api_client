// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_usage_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sub2ApiUsageQuery {
  int get page;
  int get pageSize;
  int? get apiKeyId;
  int? get groupId;
  String? get model;
  String? get requestType;
  bool? get stream;
  int? get billingType;
  String? get billingMode;
  DateTime? get startDate;
  DateTime? get endDate;
  String? get timezone;
  String get sortBy;
  String get sortOrder;

  /// Create a copy of Sub2ApiUsageQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageQueryCopyWith<Sub2ApiUsageQuery> get copyWith =>
      _$Sub2ApiUsageQueryCopyWithImpl<Sub2ApiUsageQuery>(
        this as Sub2ApiUsageQuery,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageQuery &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.apiKeyId, apiKeyId) ||
                other.apiKeyId == apiKeyId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.requestType, requestType) ||
                other.requestType == requestType) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.billingType, billingType) ||
                other.billingType == billingType) &&
            (identical(other.billingMode, billingMode) ||
                other.billingMode == billingMode) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    page,
    pageSize,
    apiKeyId,
    groupId,
    model,
    requestType,
    stream,
    billingType,
    billingMode,
    startDate,
    endDate,
    timezone,
    sortBy,
    sortOrder,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageQuery(page: $page, pageSize: $pageSize, apiKeyId: $apiKeyId, groupId: $groupId, model: $model, requestType: $requestType, stream: $stream, billingType: $billingType, billingMode: $billingMode, startDate: $startDate, endDate: $endDate, timezone: $timezone, sortBy: $sortBy, sortOrder: $sortOrder)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageQueryCopyWith<$Res> {
  factory $Sub2ApiUsageQueryCopyWith(
    Sub2ApiUsageQuery value,
    $Res Function(Sub2ApiUsageQuery) _then,
  ) = _$Sub2ApiUsageQueryCopyWithImpl;
  @useResult
  $Res call({
    int page,
    int pageSize,
    int? apiKeyId,
    int? groupId,
    String? model,
    String? requestType,
    bool? stream,
    int? billingType,
    String? billingMode,
    DateTime? startDate,
    DateTime? endDate,
    String? timezone,
    String sortBy,
    String sortOrder,
  });
}

/// @nodoc
class _$Sub2ApiUsageQueryCopyWithImpl<$Res>
    implements $Sub2ApiUsageQueryCopyWith<$Res> {
  _$Sub2ApiUsageQueryCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageQuery _self;
  final $Res Function(Sub2ApiUsageQuery) _then;

  /// Create a copy of Sub2ApiUsageQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? apiKeyId = freezed,
    Object? groupId = freezed,
    Object? model = freezed,
    Object? requestType = freezed,
    Object? stream = freezed,
    Object? billingType = freezed,
    Object? billingMode = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? timezone = freezed,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(
      _self.copyWith(
        page: null == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        pageSize: null == pageSize
            ? _self.pageSize
            : pageSize // ignore: cast_nullable_to_non_nullable
                  as int,
        apiKeyId: freezed == apiKeyId
            ? _self.apiKeyId
            : apiKeyId // ignore: cast_nullable_to_non_nullable
                  as int?,
        groupId: freezed == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int?,
        model: freezed == model
            ? _self.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String?,
        requestType: freezed == requestType
            ? _self.requestType
            : requestType // ignore: cast_nullable_to_non_nullable
                  as String?,
        stream: freezed == stream
            ? _self.stream
            : stream // ignore: cast_nullable_to_non_nullable
                  as bool?,
        billingType: freezed == billingType
            ? _self.billingType
            : billingType // ignore: cast_nullable_to_non_nullable
                  as int?,
        billingMode: freezed == billingMode
            ? _self.billingMode
            : billingMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDate: freezed == startDate
            ? _self.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _self.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        timezone: freezed == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String?,
        sortBy: null == sortBy
            ? _self.sortBy
            : sortBy // ignore: cast_nullable_to_non_nullable
                  as String,
        sortOrder: null == sortOrder
            ? _self.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUsageQuery].
extension Sub2ApiUsageQueryPatterns on Sub2ApiUsageQuery {
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
    TResult Function(_Sub2ApiUsageQuery value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageQuery() when $default != null:
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
    TResult Function(_Sub2ApiUsageQuery value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageQuery():
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
    TResult? Function(_Sub2ApiUsageQuery value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageQuery() when $default != null:
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
      int page,
      int pageSize,
      int? apiKeyId,
      int? groupId,
      String? model,
      String? requestType,
      bool? stream,
      int? billingType,
      String? billingMode,
      DateTime? startDate,
      DateTime? endDate,
      String? timezone,
      String sortBy,
      String sortOrder,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageQuery() when $default != null:
        return $default(
          _that.page,
          _that.pageSize,
          _that.apiKeyId,
          _that.groupId,
          _that.model,
          _that.requestType,
          _that.stream,
          _that.billingType,
          _that.billingMode,
          _that.startDate,
          _that.endDate,
          _that.timezone,
          _that.sortBy,
          _that.sortOrder,
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
      int page,
      int pageSize,
      int? apiKeyId,
      int? groupId,
      String? model,
      String? requestType,
      bool? stream,
      int? billingType,
      String? billingMode,
      DateTime? startDate,
      DateTime? endDate,
      String? timezone,
      String sortBy,
      String sortOrder,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageQuery():
        return $default(
          _that.page,
          _that.pageSize,
          _that.apiKeyId,
          _that.groupId,
          _that.model,
          _that.requestType,
          _that.stream,
          _that.billingType,
          _that.billingMode,
          _that.startDate,
          _that.endDate,
          _that.timezone,
          _that.sortBy,
          _that.sortOrder,
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
      int page,
      int pageSize,
      int? apiKeyId,
      int? groupId,
      String? model,
      String? requestType,
      bool? stream,
      int? billingType,
      String? billingMode,
      DateTime? startDate,
      DateTime? endDate,
      String? timezone,
      String sortBy,
      String sortOrder,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageQuery() when $default != null:
        return $default(
          _that.page,
          _that.pageSize,
          _that.apiKeyId,
          _that.groupId,
          _that.model,
          _that.requestType,
          _that.stream,
          _that.billingType,
          _that.billingMode,
          _that.startDate,
          _that.endDate,
          _that.timezone,
          _that.sortBy,
          _that.sortOrder,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUsageQuery implements Sub2ApiUsageQuery {
  const _Sub2ApiUsageQuery({
    this.page = 1,
    this.pageSize = 20,
    this.apiKeyId,
    this.groupId,
    this.model,
    this.requestType,
    this.stream,
    this.billingType,
    this.billingMode,
    this.startDate,
    this.endDate,
    this.timezone,
    this.sortBy = 'created_at',
    this.sortOrder = 'desc',
  });

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pageSize;
  @override
  final int? apiKeyId;
  @override
  final int? groupId;
  @override
  final String? model;
  @override
  final String? requestType;
  @override
  final bool? stream;
  @override
  final int? billingType;
  @override
  final String? billingMode;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? timezone;
  @override
  @JsonKey()
  final String sortBy;
  @override
  @JsonKey()
  final String sortOrder;

  /// Create a copy of Sub2ApiUsageQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageQueryCopyWith<_Sub2ApiUsageQuery> get copyWith =>
      __$Sub2ApiUsageQueryCopyWithImpl<_Sub2ApiUsageQuery>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageQuery &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.apiKeyId, apiKeyId) ||
                other.apiKeyId == apiKeyId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.requestType, requestType) ||
                other.requestType == requestType) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.billingType, billingType) ||
                other.billingType == billingType) &&
            (identical(other.billingMode, billingMode) ||
                other.billingMode == billingMode) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    page,
    pageSize,
    apiKeyId,
    groupId,
    model,
    requestType,
    stream,
    billingType,
    billingMode,
    startDate,
    endDate,
    timezone,
    sortBy,
    sortOrder,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageQuery(page: $page, pageSize: $pageSize, apiKeyId: $apiKeyId, groupId: $groupId, model: $model, requestType: $requestType, stream: $stream, billingType: $billingType, billingMode: $billingMode, startDate: $startDate, endDate: $endDate, timezone: $timezone, sortBy: $sortBy, sortOrder: $sortOrder)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageQueryCopyWith<$Res>
    implements $Sub2ApiUsageQueryCopyWith<$Res> {
  factory _$Sub2ApiUsageQueryCopyWith(
    _Sub2ApiUsageQuery value,
    $Res Function(_Sub2ApiUsageQuery) _then,
  ) = __$Sub2ApiUsageQueryCopyWithImpl;
  @override
  @useResult
  $Res call({
    int page,
    int pageSize,
    int? apiKeyId,
    int? groupId,
    String? model,
    String? requestType,
    bool? stream,
    int? billingType,
    String? billingMode,
    DateTime? startDate,
    DateTime? endDate,
    String? timezone,
    String sortBy,
    String sortOrder,
  });
}

/// @nodoc
class __$Sub2ApiUsageQueryCopyWithImpl<$Res>
    implements _$Sub2ApiUsageQueryCopyWith<$Res> {
  __$Sub2ApiUsageQueryCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageQuery _self;
  final $Res Function(_Sub2ApiUsageQuery) _then;

  /// Create a copy of Sub2ApiUsageQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? apiKeyId = freezed,
    Object? groupId = freezed,
    Object? model = freezed,
    Object? requestType = freezed,
    Object? stream = freezed,
    Object? billingType = freezed,
    Object? billingMode = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? timezone = freezed,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(
      _Sub2ApiUsageQuery(
        page: null == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        pageSize: null == pageSize
            ? _self.pageSize
            : pageSize // ignore: cast_nullable_to_non_nullable
                  as int,
        apiKeyId: freezed == apiKeyId
            ? _self.apiKeyId
            : apiKeyId // ignore: cast_nullable_to_non_nullable
                  as int?,
        groupId: freezed == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int?,
        model: freezed == model
            ? _self.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String?,
        requestType: freezed == requestType
            ? _self.requestType
            : requestType // ignore: cast_nullable_to_non_nullable
                  as String?,
        stream: freezed == stream
            ? _self.stream
            : stream // ignore: cast_nullable_to_non_nullable
                  as bool?,
        billingType: freezed == billingType
            ? _self.billingType
            : billingType // ignore: cast_nullable_to_non_nullable
                  as int?,
        billingMode: freezed == billingMode
            ? _self.billingMode
            : billingMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDate: freezed == startDate
            ? _self.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _self.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        timezone: freezed == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String?,
        sortBy: null == sortBy
            ? _self.sortBy
            : sortBy // ignore: cast_nullable_to_non_nullable
                  as String,
        sortOrder: null == sortOrder
            ? _self.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiUsageRecord {
  int get id;
  int get userId;
  int get apiKeyId;
  int get accountId;
  String get requestId;
  String get model;
  String? get serviceTier;
  String? get reasoningEffort;
  String? get inboundEndpoint;
  String? get upstreamEndpoint;
  int? get groupId;
  int? get subscriptionId;
  int get inputTokens;
  int get outputTokens;
  int get cacheCreationTokens;
  int get cacheReadTokens;
  int get cacheCreation5mTokens;
  int get cacheCreation1hTokens;
  Sub2ApiDecimal get inputCost;
  Sub2ApiDecimal get outputCost;
  Sub2ApiDecimal get cacheCreationCost;
  Sub2ApiDecimal get cacheReadCost;
  Sub2ApiDecimal get totalCost;
  Sub2ApiDecimal get actualCost;
  Sub2ApiDecimal get rateMultiplier;
  bool get longContextBillingApplied;
  int get billingType;
  String get requestType;
  bool get stream;
  bool get openAiWsMode;
  int? get durationMs;
  int? get firstTokenMs;
  int get imageCount;
  String? get imageSize;
  String? get imageInputSize;
  String? get imageOutputSize;
  int get imageOutputTokens;
  Sub2ApiDecimal get imageOutputCost;
  String? get imageSizeSource;
  Map<String, int>? get imageSizeBreakdown;
  String? get mediaType;
  String? get userAgent;
  String? get ipAddress;
  bool get cacheTtlOverridden;
  String? get billingMode;
  DateTime get createdAt;

  /// Create a copy of Sub2ApiUsageRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageRecordCopyWith<Sub2ApiUsageRecord> get copyWith =>
      _$Sub2ApiUsageRecordCopyWithImpl<Sub2ApiUsageRecord>(
        this as Sub2ApiUsageRecord,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.apiKeyId, apiKeyId) ||
                other.apiKeyId == apiKeyId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.serviceTier, serviceTier) ||
                other.serviceTier == serviceTier) &&
            (identical(other.reasoningEffort, reasoningEffort) ||
                other.reasoningEffort == reasoningEffort) &&
            (identical(other.inboundEndpoint, inboundEndpoint) ||
                other.inboundEndpoint == inboundEndpoint) &&
            (identical(other.upstreamEndpoint, upstreamEndpoint) ||
                other.upstreamEndpoint == upstreamEndpoint) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.inputTokens, inputTokens) ||
                other.inputTokens == inputTokens) &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens) &&
            (identical(other.cacheCreationTokens, cacheCreationTokens) ||
                other.cacheCreationTokens == cacheCreationTokens) &&
            (identical(other.cacheReadTokens, cacheReadTokens) ||
                other.cacheReadTokens == cacheReadTokens) &&
            (identical(other.cacheCreation5mTokens, cacheCreation5mTokens) ||
                other.cacheCreation5mTokens == cacheCreation5mTokens) &&
            (identical(other.cacheCreation1hTokens, cacheCreation1hTokens) ||
                other.cacheCreation1hTokens == cacheCreation1hTokens) &&
            (identical(other.inputCost, inputCost) ||
                other.inputCost == inputCost) &&
            (identical(other.outputCost, outputCost) ||
                other.outputCost == outputCost) &&
            (identical(other.cacheCreationCost, cacheCreationCost) ||
                other.cacheCreationCost == cacheCreationCost) &&
            (identical(other.cacheReadCost, cacheReadCost) ||
                other.cacheReadCost == cacheReadCost) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.actualCost, actualCost) ||
                other.actualCost == actualCost) &&
            (identical(other.rateMultiplier, rateMultiplier) ||
                other.rateMultiplier == rateMultiplier) &&
            (identical(
                  other.longContextBillingApplied,
                  longContextBillingApplied,
                ) ||
                other.longContextBillingApplied == longContextBillingApplied) &&
            (identical(other.billingType, billingType) ||
                other.billingType == billingType) &&
            (identical(other.requestType, requestType) ||
                other.requestType == requestType) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.openAiWsMode, openAiWsMode) ||
                other.openAiWsMode == openAiWsMode) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs) &&
            (identical(other.firstTokenMs, firstTokenMs) ||
                other.firstTokenMs == firstTokenMs) &&
            (identical(other.imageCount, imageCount) ||
                other.imageCount == imageCount) &&
            (identical(other.imageSize, imageSize) ||
                other.imageSize == imageSize) &&
            (identical(other.imageInputSize, imageInputSize) ||
                other.imageInputSize == imageInputSize) &&
            (identical(other.imageOutputSize, imageOutputSize) ||
                other.imageOutputSize == imageOutputSize) &&
            (identical(other.imageOutputTokens, imageOutputTokens) ||
                other.imageOutputTokens == imageOutputTokens) &&
            (identical(other.imageOutputCost, imageOutputCost) ||
                other.imageOutputCost == imageOutputCost) &&
            (identical(other.imageSizeSource, imageSizeSource) ||
                other.imageSizeSource == imageSizeSource) &&
            const DeepCollectionEquality().equals(
              other.imageSizeBreakdown,
              imageSizeBreakdown,
            ) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.userAgent, userAgent) ||
                other.userAgent == userAgent) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.cacheTtlOverridden, cacheTtlOverridden) ||
                other.cacheTtlOverridden == cacheTtlOverridden) &&
            (identical(other.billingMode, billingMode) ||
                other.billingMode == billingMode) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    userId,
    apiKeyId,
    accountId,
    requestId,
    model,
    serviceTier,
    reasoningEffort,
    inboundEndpoint,
    upstreamEndpoint,
    groupId,
    subscriptionId,
    inputTokens,
    outputTokens,
    cacheCreationTokens,
    cacheReadTokens,
    cacheCreation5mTokens,
    cacheCreation1hTokens,
    inputCost,
    outputCost,
    cacheCreationCost,
    cacheReadCost,
    totalCost,
    actualCost,
    rateMultiplier,
    longContextBillingApplied,
    billingType,
    requestType,
    stream,
    openAiWsMode,
    durationMs,
    firstTokenMs,
    imageCount,
    imageSize,
    imageInputSize,
    imageOutputSize,
    imageOutputTokens,
    imageOutputCost,
    imageSizeSource,
    const DeepCollectionEquality().hash(imageSizeBreakdown),
    mediaType,
    userAgent,
    ipAddress,
    cacheTtlOverridden,
    billingMode,
    createdAt,
  ]);

  @override
  String toString() {
    return 'Sub2ApiUsageRecord(id: $id, userId: $userId, apiKeyId: $apiKeyId, accountId: $accountId, requestId: $requestId, model: $model, serviceTier: $serviceTier, reasoningEffort: $reasoningEffort, inboundEndpoint: $inboundEndpoint, upstreamEndpoint: $upstreamEndpoint, groupId: $groupId, subscriptionId: $subscriptionId, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheCreationTokens: $cacheCreationTokens, cacheReadTokens: $cacheReadTokens, cacheCreation5mTokens: $cacheCreation5mTokens, cacheCreation1hTokens: $cacheCreation1hTokens, inputCost: $inputCost, outputCost: $outputCost, cacheCreationCost: $cacheCreationCost, cacheReadCost: $cacheReadCost, totalCost: $totalCost, actualCost: $actualCost, rateMultiplier: $rateMultiplier, longContextBillingApplied: $longContextBillingApplied, billingType: $billingType, requestType: $requestType, stream: $stream, openAiWsMode: $openAiWsMode, durationMs: $durationMs, firstTokenMs: $firstTokenMs, imageCount: $imageCount, imageSize: $imageSize, imageInputSize: $imageInputSize, imageOutputSize: $imageOutputSize, imageOutputTokens: $imageOutputTokens, imageOutputCost: $imageOutputCost, imageSizeSource: $imageSizeSource, imageSizeBreakdown: $imageSizeBreakdown, mediaType: $mediaType, userAgent: $userAgent, ipAddress: $ipAddress, cacheTtlOverridden: $cacheTtlOverridden, billingMode: $billingMode, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageRecordCopyWith<$Res> {
  factory $Sub2ApiUsageRecordCopyWith(
    Sub2ApiUsageRecord value,
    $Res Function(Sub2ApiUsageRecord) _then,
  ) = _$Sub2ApiUsageRecordCopyWithImpl;
  @useResult
  $Res call({
    int id,
    int userId,
    int apiKeyId,
    int accountId,
    String requestId,
    String model,
    String? serviceTier,
    String? reasoningEffort,
    String? inboundEndpoint,
    String? upstreamEndpoint,
    int? groupId,
    int? subscriptionId,
    int inputTokens,
    int outputTokens,
    int cacheCreationTokens,
    int cacheReadTokens,
    int cacheCreation5mTokens,
    int cacheCreation1hTokens,
    Sub2ApiDecimal inputCost,
    Sub2ApiDecimal outputCost,
    Sub2ApiDecimal cacheCreationCost,
    Sub2ApiDecimal cacheReadCost,
    Sub2ApiDecimal totalCost,
    Sub2ApiDecimal actualCost,
    Sub2ApiDecimal rateMultiplier,
    bool longContextBillingApplied,
    int billingType,
    String requestType,
    bool stream,
    bool openAiWsMode,
    int? durationMs,
    int? firstTokenMs,
    int imageCount,
    String? imageSize,
    String? imageInputSize,
    String? imageOutputSize,
    int imageOutputTokens,
    Sub2ApiDecimal imageOutputCost,
    String? imageSizeSource,
    Map<String, int>? imageSizeBreakdown,
    String? mediaType,
    String? userAgent,
    String? ipAddress,
    bool cacheTtlOverridden,
    String? billingMode,
    DateTime createdAt,
  });
}

/// @nodoc
class _$Sub2ApiUsageRecordCopyWithImpl<$Res>
    implements $Sub2ApiUsageRecordCopyWith<$Res> {
  _$Sub2ApiUsageRecordCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageRecord _self;
  final $Res Function(Sub2ApiUsageRecord) _then;

  /// Create a copy of Sub2ApiUsageRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? apiKeyId = null,
    Object? accountId = null,
    Object? requestId = null,
    Object? model = null,
    Object? serviceTier = freezed,
    Object? reasoningEffort = freezed,
    Object? inboundEndpoint = freezed,
    Object? upstreamEndpoint = freezed,
    Object? groupId = freezed,
    Object? subscriptionId = freezed,
    Object? inputTokens = null,
    Object? outputTokens = null,
    Object? cacheCreationTokens = null,
    Object? cacheReadTokens = null,
    Object? cacheCreation5mTokens = null,
    Object? cacheCreation1hTokens = null,
    Object? inputCost = null,
    Object? outputCost = null,
    Object? cacheCreationCost = null,
    Object? cacheReadCost = null,
    Object? totalCost = null,
    Object? actualCost = null,
    Object? rateMultiplier = null,
    Object? longContextBillingApplied = null,
    Object? billingType = null,
    Object? requestType = null,
    Object? stream = null,
    Object? openAiWsMode = null,
    Object? durationMs = freezed,
    Object? firstTokenMs = freezed,
    Object? imageCount = null,
    Object? imageSize = freezed,
    Object? imageInputSize = freezed,
    Object? imageOutputSize = freezed,
    Object? imageOutputTokens = null,
    Object? imageOutputCost = null,
    Object? imageSizeSource = freezed,
    Object? imageSizeBreakdown = freezed,
    Object? mediaType = freezed,
    Object? userAgent = freezed,
    Object? ipAddress = freezed,
    Object? cacheTtlOverridden = null,
    Object? billingMode = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _self.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        apiKeyId: null == apiKeyId
            ? _self.apiKeyId
            : apiKeyId // ignore: cast_nullable_to_non_nullable
                  as int,
        accountId: null == accountId
            ? _self.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as int,
        requestId: null == requestId
            ? _self.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String,
        model: null == model
            ? _self.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String,
        serviceTier: freezed == serviceTier
            ? _self.serviceTier
            : serviceTier // ignore: cast_nullable_to_non_nullable
                  as String?,
        reasoningEffort: freezed == reasoningEffort
            ? _self.reasoningEffort
            : reasoningEffort // ignore: cast_nullable_to_non_nullable
                  as String?,
        inboundEndpoint: freezed == inboundEndpoint
            ? _self.inboundEndpoint
            : inboundEndpoint // ignore: cast_nullable_to_non_nullable
                  as String?,
        upstreamEndpoint: freezed == upstreamEndpoint
            ? _self.upstreamEndpoint
            : upstreamEndpoint // ignore: cast_nullable_to_non_nullable
                  as String?,
        groupId: freezed == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int?,
        subscriptionId: freezed == subscriptionId
            ? _self.subscriptionId
            : subscriptionId // ignore: cast_nullable_to_non_nullable
                  as int?,
        inputTokens: null == inputTokens
            ? _self.inputTokens
            : inputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        outputTokens: null == outputTokens
            ? _self.outputTokens
            : outputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheCreationTokens: null == cacheCreationTokens
            ? _self.cacheCreationTokens
            : cacheCreationTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheReadTokens: null == cacheReadTokens
            ? _self.cacheReadTokens
            : cacheReadTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheCreation5mTokens: null == cacheCreation5mTokens
            ? _self.cacheCreation5mTokens
            : cacheCreation5mTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheCreation1hTokens: null == cacheCreation1hTokens
            ? _self.cacheCreation1hTokens
            : cacheCreation1hTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        inputCost: null == inputCost
            ? _self.inputCost
            : inputCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        outputCost: null == outputCost
            ? _self.outputCost
            : outputCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        cacheCreationCost: null == cacheCreationCost
            ? _self.cacheCreationCost
            : cacheCreationCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        cacheReadCost: null == cacheReadCost
            ? _self.cacheReadCost
            : cacheReadCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        totalCost: null == totalCost
            ? _self.totalCost
            : totalCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        actualCost: null == actualCost
            ? _self.actualCost
            : actualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        rateMultiplier: null == rateMultiplier
            ? _self.rateMultiplier
            : rateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        longContextBillingApplied: null == longContextBillingApplied
            ? _self.longContextBillingApplied
            : longContextBillingApplied // ignore: cast_nullable_to_non_nullable
                  as bool,
        billingType: null == billingType
            ? _self.billingType
            : billingType // ignore: cast_nullable_to_non_nullable
                  as int,
        requestType: null == requestType
            ? _self.requestType
            : requestType // ignore: cast_nullable_to_non_nullable
                  as String,
        stream: null == stream
            ? _self.stream
            : stream // ignore: cast_nullable_to_non_nullable
                  as bool,
        openAiWsMode: null == openAiWsMode
            ? _self.openAiWsMode
            : openAiWsMode // ignore: cast_nullable_to_non_nullable
                  as bool,
        durationMs: freezed == durationMs
            ? _self.durationMs
            : durationMs // ignore: cast_nullable_to_non_nullable
                  as int?,
        firstTokenMs: freezed == firstTokenMs
            ? _self.firstTokenMs
            : firstTokenMs // ignore: cast_nullable_to_non_nullable
                  as int?,
        imageCount: null == imageCount
            ? _self.imageCount
            : imageCount // ignore: cast_nullable_to_non_nullable
                  as int,
        imageSize: freezed == imageSize
            ? _self.imageSize
            : imageSize // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageInputSize: freezed == imageInputSize
            ? _self.imageInputSize
            : imageInputSize // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageOutputSize: freezed == imageOutputSize
            ? _self.imageOutputSize
            : imageOutputSize // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageOutputTokens: null == imageOutputTokens
            ? _self.imageOutputTokens
            : imageOutputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        imageOutputCost: null == imageOutputCost
            ? _self.imageOutputCost
            : imageOutputCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        imageSizeSource: freezed == imageSizeSource
            ? _self.imageSizeSource
            : imageSizeSource // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageSizeBreakdown: freezed == imageSizeBreakdown
            ? _self.imageSizeBreakdown
            : imageSizeBreakdown // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>?,
        mediaType: freezed == mediaType
            ? _self.mediaType
            : mediaType // ignore: cast_nullable_to_non_nullable
                  as String?,
        userAgent: freezed == userAgent
            ? _self.userAgent
            : userAgent // ignore: cast_nullable_to_non_nullable
                  as String?,
        ipAddress: freezed == ipAddress
            ? _self.ipAddress
            : ipAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        cacheTtlOverridden: null == cacheTtlOverridden
            ? _self.cacheTtlOverridden
            : cacheTtlOverridden // ignore: cast_nullable_to_non_nullable
                  as bool,
        billingMode: freezed == billingMode
            ? _self.billingMode
            : billingMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUsageRecord].
extension Sub2ApiUsageRecordPatterns on Sub2ApiUsageRecord {
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
    TResult Function(_Sub2ApiUsageRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageRecord() when $default != null:
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
    TResult Function(_Sub2ApiUsageRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageRecord():
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
    TResult? Function(_Sub2ApiUsageRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageRecord() when $default != null:
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
      int userId,
      int apiKeyId,
      int accountId,
      String requestId,
      String model,
      String? serviceTier,
      String? reasoningEffort,
      String? inboundEndpoint,
      String? upstreamEndpoint,
      int? groupId,
      int? subscriptionId,
      int inputTokens,
      int outputTokens,
      int cacheCreationTokens,
      int cacheReadTokens,
      int cacheCreation5mTokens,
      int cacheCreation1hTokens,
      Sub2ApiDecimal inputCost,
      Sub2ApiDecimal outputCost,
      Sub2ApiDecimal cacheCreationCost,
      Sub2ApiDecimal cacheReadCost,
      Sub2ApiDecimal totalCost,
      Sub2ApiDecimal actualCost,
      Sub2ApiDecimal rateMultiplier,
      bool longContextBillingApplied,
      int billingType,
      String requestType,
      bool stream,
      bool openAiWsMode,
      int? durationMs,
      int? firstTokenMs,
      int imageCount,
      String? imageSize,
      String? imageInputSize,
      String? imageOutputSize,
      int imageOutputTokens,
      Sub2ApiDecimal imageOutputCost,
      String? imageSizeSource,
      Map<String, int>? imageSizeBreakdown,
      String? mediaType,
      String? userAgent,
      String? ipAddress,
      bool cacheTtlOverridden,
      String? billingMode,
      DateTime createdAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageRecord() when $default != null:
        return $default(
          _that.id,
          _that.userId,
          _that.apiKeyId,
          _that.accountId,
          _that.requestId,
          _that.model,
          _that.serviceTier,
          _that.reasoningEffort,
          _that.inboundEndpoint,
          _that.upstreamEndpoint,
          _that.groupId,
          _that.subscriptionId,
          _that.inputTokens,
          _that.outputTokens,
          _that.cacheCreationTokens,
          _that.cacheReadTokens,
          _that.cacheCreation5mTokens,
          _that.cacheCreation1hTokens,
          _that.inputCost,
          _that.outputCost,
          _that.cacheCreationCost,
          _that.cacheReadCost,
          _that.totalCost,
          _that.actualCost,
          _that.rateMultiplier,
          _that.longContextBillingApplied,
          _that.billingType,
          _that.requestType,
          _that.stream,
          _that.openAiWsMode,
          _that.durationMs,
          _that.firstTokenMs,
          _that.imageCount,
          _that.imageSize,
          _that.imageInputSize,
          _that.imageOutputSize,
          _that.imageOutputTokens,
          _that.imageOutputCost,
          _that.imageSizeSource,
          _that.imageSizeBreakdown,
          _that.mediaType,
          _that.userAgent,
          _that.ipAddress,
          _that.cacheTtlOverridden,
          _that.billingMode,
          _that.createdAt,
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
      int userId,
      int apiKeyId,
      int accountId,
      String requestId,
      String model,
      String? serviceTier,
      String? reasoningEffort,
      String? inboundEndpoint,
      String? upstreamEndpoint,
      int? groupId,
      int? subscriptionId,
      int inputTokens,
      int outputTokens,
      int cacheCreationTokens,
      int cacheReadTokens,
      int cacheCreation5mTokens,
      int cacheCreation1hTokens,
      Sub2ApiDecimal inputCost,
      Sub2ApiDecimal outputCost,
      Sub2ApiDecimal cacheCreationCost,
      Sub2ApiDecimal cacheReadCost,
      Sub2ApiDecimal totalCost,
      Sub2ApiDecimal actualCost,
      Sub2ApiDecimal rateMultiplier,
      bool longContextBillingApplied,
      int billingType,
      String requestType,
      bool stream,
      bool openAiWsMode,
      int? durationMs,
      int? firstTokenMs,
      int imageCount,
      String? imageSize,
      String? imageInputSize,
      String? imageOutputSize,
      int imageOutputTokens,
      Sub2ApiDecimal imageOutputCost,
      String? imageSizeSource,
      Map<String, int>? imageSizeBreakdown,
      String? mediaType,
      String? userAgent,
      String? ipAddress,
      bool cacheTtlOverridden,
      String? billingMode,
      DateTime createdAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageRecord():
        return $default(
          _that.id,
          _that.userId,
          _that.apiKeyId,
          _that.accountId,
          _that.requestId,
          _that.model,
          _that.serviceTier,
          _that.reasoningEffort,
          _that.inboundEndpoint,
          _that.upstreamEndpoint,
          _that.groupId,
          _that.subscriptionId,
          _that.inputTokens,
          _that.outputTokens,
          _that.cacheCreationTokens,
          _that.cacheReadTokens,
          _that.cacheCreation5mTokens,
          _that.cacheCreation1hTokens,
          _that.inputCost,
          _that.outputCost,
          _that.cacheCreationCost,
          _that.cacheReadCost,
          _that.totalCost,
          _that.actualCost,
          _that.rateMultiplier,
          _that.longContextBillingApplied,
          _that.billingType,
          _that.requestType,
          _that.stream,
          _that.openAiWsMode,
          _that.durationMs,
          _that.firstTokenMs,
          _that.imageCount,
          _that.imageSize,
          _that.imageInputSize,
          _that.imageOutputSize,
          _that.imageOutputTokens,
          _that.imageOutputCost,
          _that.imageSizeSource,
          _that.imageSizeBreakdown,
          _that.mediaType,
          _that.userAgent,
          _that.ipAddress,
          _that.cacheTtlOverridden,
          _that.billingMode,
          _that.createdAt,
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
      int userId,
      int apiKeyId,
      int accountId,
      String requestId,
      String model,
      String? serviceTier,
      String? reasoningEffort,
      String? inboundEndpoint,
      String? upstreamEndpoint,
      int? groupId,
      int? subscriptionId,
      int inputTokens,
      int outputTokens,
      int cacheCreationTokens,
      int cacheReadTokens,
      int cacheCreation5mTokens,
      int cacheCreation1hTokens,
      Sub2ApiDecimal inputCost,
      Sub2ApiDecimal outputCost,
      Sub2ApiDecimal cacheCreationCost,
      Sub2ApiDecimal cacheReadCost,
      Sub2ApiDecimal totalCost,
      Sub2ApiDecimal actualCost,
      Sub2ApiDecimal rateMultiplier,
      bool longContextBillingApplied,
      int billingType,
      String requestType,
      bool stream,
      bool openAiWsMode,
      int? durationMs,
      int? firstTokenMs,
      int imageCount,
      String? imageSize,
      String? imageInputSize,
      String? imageOutputSize,
      int imageOutputTokens,
      Sub2ApiDecimal imageOutputCost,
      String? imageSizeSource,
      Map<String, int>? imageSizeBreakdown,
      String? mediaType,
      String? userAgent,
      String? ipAddress,
      bool cacheTtlOverridden,
      String? billingMode,
      DateTime createdAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageRecord() when $default != null:
        return $default(
          _that.id,
          _that.userId,
          _that.apiKeyId,
          _that.accountId,
          _that.requestId,
          _that.model,
          _that.serviceTier,
          _that.reasoningEffort,
          _that.inboundEndpoint,
          _that.upstreamEndpoint,
          _that.groupId,
          _that.subscriptionId,
          _that.inputTokens,
          _that.outputTokens,
          _that.cacheCreationTokens,
          _that.cacheReadTokens,
          _that.cacheCreation5mTokens,
          _that.cacheCreation1hTokens,
          _that.inputCost,
          _that.outputCost,
          _that.cacheCreationCost,
          _that.cacheReadCost,
          _that.totalCost,
          _that.actualCost,
          _that.rateMultiplier,
          _that.longContextBillingApplied,
          _that.billingType,
          _that.requestType,
          _that.stream,
          _that.openAiWsMode,
          _that.durationMs,
          _that.firstTokenMs,
          _that.imageCount,
          _that.imageSize,
          _that.imageInputSize,
          _that.imageOutputSize,
          _that.imageOutputTokens,
          _that.imageOutputCost,
          _that.imageSizeSource,
          _that.imageSizeBreakdown,
          _that.mediaType,
          _that.userAgent,
          _that.ipAddress,
          _that.cacheTtlOverridden,
          _that.billingMode,
          _that.createdAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUsageRecord implements Sub2ApiUsageRecord {
  const _Sub2ApiUsageRecord({
    required this.id,
    required this.userId,
    required this.apiKeyId,
    required this.accountId,
    required this.requestId,
    required this.model,
    this.serviceTier,
    this.reasoningEffort,
    this.inboundEndpoint,
    this.upstreamEndpoint,
    this.groupId,
    this.subscriptionId,
    required this.inputTokens,
    required this.outputTokens,
    required this.cacheCreationTokens,
    required this.cacheReadTokens,
    required this.cacheCreation5mTokens,
    required this.cacheCreation1hTokens,
    required this.inputCost,
    required this.outputCost,
    required this.cacheCreationCost,
    required this.cacheReadCost,
    required this.totalCost,
    required this.actualCost,
    required this.rateMultiplier,
    required this.longContextBillingApplied,
    required this.billingType,
    required this.requestType,
    required this.stream,
    required this.openAiWsMode,
    this.durationMs,
    this.firstTokenMs,
    required this.imageCount,
    this.imageSize,
    this.imageInputSize,
    this.imageOutputSize,
    required this.imageOutputTokens,
    required this.imageOutputCost,
    this.imageSizeSource,
    final Map<String, int>? imageSizeBreakdown,
    this.mediaType,
    this.userAgent,
    this.ipAddress,
    required this.cacheTtlOverridden,
    this.billingMode,
    required this.createdAt,
  }) : _imageSizeBreakdown = imageSizeBreakdown;

  @override
  final int id;
  @override
  final int userId;
  @override
  final int apiKeyId;
  @override
  final int accountId;
  @override
  final String requestId;
  @override
  final String model;
  @override
  final String? serviceTier;
  @override
  final String? reasoningEffort;
  @override
  final String? inboundEndpoint;
  @override
  final String? upstreamEndpoint;
  @override
  final int? groupId;
  @override
  final int? subscriptionId;
  @override
  final int inputTokens;
  @override
  final int outputTokens;
  @override
  final int cacheCreationTokens;
  @override
  final int cacheReadTokens;
  @override
  final int cacheCreation5mTokens;
  @override
  final int cacheCreation1hTokens;
  @override
  final Sub2ApiDecimal inputCost;
  @override
  final Sub2ApiDecimal outputCost;
  @override
  final Sub2ApiDecimal cacheCreationCost;
  @override
  final Sub2ApiDecimal cacheReadCost;
  @override
  final Sub2ApiDecimal totalCost;
  @override
  final Sub2ApiDecimal actualCost;
  @override
  final Sub2ApiDecimal rateMultiplier;
  @override
  final bool longContextBillingApplied;
  @override
  final int billingType;
  @override
  final String requestType;
  @override
  final bool stream;
  @override
  final bool openAiWsMode;
  @override
  final int? durationMs;
  @override
  final int? firstTokenMs;
  @override
  final int imageCount;
  @override
  final String? imageSize;
  @override
  final String? imageInputSize;
  @override
  final String? imageOutputSize;
  @override
  final int imageOutputTokens;
  @override
  final Sub2ApiDecimal imageOutputCost;
  @override
  final String? imageSizeSource;
  final Map<String, int>? _imageSizeBreakdown;
  @override
  Map<String, int>? get imageSizeBreakdown {
    final value = _imageSizeBreakdown;
    if (value == null) return null;
    if (_imageSizeBreakdown is EqualUnmodifiableMapView)
      return _imageSizeBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? mediaType;
  @override
  final String? userAgent;
  @override
  final String? ipAddress;
  @override
  final bool cacheTtlOverridden;
  @override
  final String? billingMode;
  @override
  final DateTime createdAt;

  /// Create a copy of Sub2ApiUsageRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageRecordCopyWith<_Sub2ApiUsageRecord> get copyWith =>
      __$Sub2ApiUsageRecordCopyWithImpl<_Sub2ApiUsageRecord>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.apiKeyId, apiKeyId) ||
                other.apiKeyId == apiKeyId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.serviceTier, serviceTier) ||
                other.serviceTier == serviceTier) &&
            (identical(other.reasoningEffort, reasoningEffort) ||
                other.reasoningEffort == reasoningEffort) &&
            (identical(other.inboundEndpoint, inboundEndpoint) ||
                other.inboundEndpoint == inboundEndpoint) &&
            (identical(other.upstreamEndpoint, upstreamEndpoint) ||
                other.upstreamEndpoint == upstreamEndpoint) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.inputTokens, inputTokens) ||
                other.inputTokens == inputTokens) &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens) &&
            (identical(other.cacheCreationTokens, cacheCreationTokens) ||
                other.cacheCreationTokens == cacheCreationTokens) &&
            (identical(other.cacheReadTokens, cacheReadTokens) ||
                other.cacheReadTokens == cacheReadTokens) &&
            (identical(other.cacheCreation5mTokens, cacheCreation5mTokens) ||
                other.cacheCreation5mTokens == cacheCreation5mTokens) &&
            (identical(other.cacheCreation1hTokens, cacheCreation1hTokens) ||
                other.cacheCreation1hTokens == cacheCreation1hTokens) &&
            (identical(other.inputCost, inputCost) ||
                other.inputCost == inputCost) &&
            (identical(other.outputCost, outputCost) ||
                other.outputCost == outputCost) &&
            (identical(other.cacheCreationCost, cacheCreationCost) ||
                other.cacheCreationCost == cacheCreationCost) &&
            (identical(other.cacheReadCost, cacheReadCost) ||
                other.cacheReadCost == cacheReadCost) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.actualCost, actualCost) ||
                other.actualCost == actualCost) &&
            (identical(other.rateMultiplier, rateMultiplier) ||
                other.rateMultiplier == rateMultiplier) &&
            (identical(
                  other.longContextBillingApplied,
                  longContextBillingApplied,
                ) ||
                other.longContextBillingApplied == longContextBillingApplied) &&
            (identical(other.billingType, billingType) ||
                other.billingType == billingType) &&
            (identical(other.requestType, requestType) ||
                other.requestType == requestType) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.openAiWsMode, openAiWsMode) ||
                other.openAiWsMode == openAiWsMode) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs) &&
            (identical(other.firstTokenMs, firstTokenMs) ||
                other.firstTokenMs == firstTokenMs) &&
            (identical(other.imageCount, imageCount) ||
                other.imageCount == imageCount) &&
            (identical(other.imageSize, imageSize) ||
                other.imageSize == imageSize) &&
            (identical(other.imageInputSize, imageInputSize) ||
                other.imageInputSize == imageInputSize) &&
            (identical(other.imageOutputSize, imageOutputSize) ||
                other.imageOutputSize == imageOutputSize) &&
            (identical(other.imageOutputTokens, imageOutputTokens) ||
                other.imageOutputTokens == imageOutputTokens) &&
            (identical(other.imageOutputCost, imageOutputCost) ||
                other.imageOutputCost == imageOutputCost) &&
            (identical(other.imageSizeSource, imageSizeSource) ||
                other.imageSizeSource == imageSizeSource) &&
            const DeepCollectionEquality().equals(
              other._imageSizeBreakdown,
              _imageSizeBreakdown,
            ) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.userAgent, userAgent) ||
                other.userAgent == userAgent) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.cacheTtlOverridden, cacheTtlOverridden) ||
                other.cacheTtlOverridden == cacheTtlOverridden) &&
            (identical(other.billingMode, billingMode) ||
                other.billingMode == billingMode) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    userId,
    apiKeyId,
    accountId,
    requestId,
    model,
    serviceTier,
    reasoningEffort,
    inboundEndpoint,
    upstreamEndpoint,
    groupId,
    subscriptionId,
    inputTokens,
    outputTokens,
    cacheCreationTokens,
    cacheReadTokens,
    cacheCreation5mTokens,
    cacheCreation1hTokens,
    inputCost,
    outputCost,
    cacheCreationCost,
    cacheReadCost,
    totalCost,
    actualCost,
    rateMultiplier,
    longContextBillingApplied,
    billingType,
    requestType,
    stream,
    openAiWsMode,
    durationMs,
    firstTokenMs,
    imageCount,
    imageSize,
    imageInputSize,
    imageOutputSize,
    imageOutputTokens,
    imageOutputCost,
    imageSizeSource,
    const DeepCollectionEquality().hash(_imageSizeBreakdown),
    mediaType,
    userAgent,
    ipAddress,
    cacheTtlOverridden,
    billingMode,
    createdAt,
  ]);

  @override
  String toString() {
    return 'Sub2ApiUsageRecord(id: $id, userId: $userId, apiKeyId: $apiKeyId, accountId: $accountId, requestId: $requestId, model: $model, serviceTier: $serviceTier, reasoningEffort: $reasoningEffort, inboundEndpoint: $inboundEndpoint, upstreamEndpoint: $upstreamEndpoint, groupId: $groupId, subscriptionId: $subscriptionId, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheCreationTokens: $cacheCreationTokens, cacheReadTokens: $cacheReadTokens, cacheCreation5mTokens: $cacheCreation5mTokens, cacheCreation1hTokens: $cacheCreation1hTokens, inputCost: $inputCost, outputCost: $outputCost, cacheCreationCost: $cacheCreationCost, cacheReadCost: $cacheReadCost, totalCost: $totalCost, actualCost: $actualCost, rateMultiplier: $rateMultiplier, longContextBillingApplied: $longContextBillingApplied, billingType: $billingType, requestType: $requestType, stream: $stream, openAiWsMode: $openAiWsMode, durationMs: $durationMs, firstTokenMs: $firstTokenMs, imageCount: $imageCount, imageSize: $imageSize, imageInputSize: $imageInputSize, imageOutputSize: $imageOutputSize, imageOutputTokens: $imageOutputTokens, imageOutputCost: $imageOutputCost, imageSizeSource: $imageSizeSource, imageSizeBreakdown: $imageSizeBreakdown, mediaType: $mediaType, userAgent: $userAgent, ipAddress: $ipAddress, cacheTtlOverridden: $cacheTtlOverridden, billingMode: $billingMode, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageRecordCopyWith<$Res>
    implements $Sub2ApiUsageRecordCopyWith<$Res> {
  factory _$Sub2ApiUsageRecordCopyWith(
    _Sub2ApiUsageRecord value,
    $Res Function(_Sub2ApiUsageRecord) _then,
  ) = __$Sub2ApiUsageRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    int id,
    int userId,
    int apiKeyId,
    int accountId,
    String requestId,
    String model,
    String? serviceTier,
    String? reasoningEffort,
    String? inboundEndpoint,
    String? upstreamEndpoint,
    int? groupId,
    int? subscriptionId,
    int inputTokens,
    int outputTokens,
    int cacheCreationTokens,
    int cacheReadTokens,
    int cacheCreation5mTokens,
    int cacheCreation1hTokens,
    Sub2ApiDecimal inputCost,
    Sub2ApiDecimal outputCost,
    Sub2ApiDecimal cacheCreationCost,
    Sub2ApiDecimal cacheReadCost,
    Sub2ApiDecimal totalCost,
    Sub2ApiDecimal actualCost,
    Sub2ApiDecimal rateMultiplier,
    bool longContextBillingApplied,
    int billingType,
    String requestType,
    bool stream,
    bool openAiWsMode,
    int? durationMs,
    int? firstTokenMs,
    int imageCount,
    String? imageSize,
    String? imageInputSize,
    String? imageOutputSize,
    int imageOutputTokens,
    Sub2ApiDecimal imageOutputCost,
    String? imageSizeSource,
    Map<String, int>? imageSizeBreakdown,
    String? mediaType,
    String? userAgent,
    String? ipAddress,
    bool cacheTtlOverridden,
    String? billingMode,
    DateTime createdAt,
  });
}

/// @nodoc
class __$Sub2ApiUsageRecordCopyWithImpl<$Res>
    implements _$Sub2ApiUsageRecordCopyWith<$Res> {
  __$Sub2ApiUsageRecordCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageRecord _self;
  final $Res Function(_Sub2ApiUsageRecord) _then;

  /// Create a copy of Sub2ApiUsageRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? apiKeyId = null,
    Object? accountId = null,
    Object? requestId = null,
    Object? model = null,
    Object? serviceTier = freezed,
    Object? reasoningEffort = freezed,
    Object? inboundEndpoint = freezed,
    Object? upstreamEndpoint = freezed,
    Object? groupId = freezed,
    Object? subscriptionId = freezed,
    Object? inputTokens = null,
    Object? outputTokens = null,
    Object? cacheCreationTokens = null,
    Object? cacheReadTokens = null,
    Object? cacheCreation5mTokens = null,
    Object? cacheCreation1hTokens = null,
    Object? inputCost = null,
    Object? outputCost = null,
    Object? cacheCreationCost = null,
    Object? cacheReadCost = null,
    Object? totalCost = null,
    Object? actualCost = null,
    Object? rateMultiplier = null,
    Object? longContextBillingApplied = null,
    Object? billingType = null,
    Object? requestType = null,
    Object? stream = null,
    Object? openAiWsMode = null,
    Object? durationMs = freezed,
    Object? firstTokenMs = freezed,
    Object? imageCount = null,
    Object? imageSize = freezed,
    Object? imageInputSize = freezed,
    Object? imageOutputSize = freezed,
    Object? imageOutputTokens = null,
    Object? imageOutputCost = null,
    Object? imageSizeSource = freezed,
    Object? imageSizeBreakdown = freezed,
    Object? mediaType = freezed,
    Object? userAgent = freezed,
    Object? ipAddress = freezed,
    Object? cacheTtlOverridden = null,
    Object? billingMode = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _Sub2ApiUsageRecord(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _self.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        apiKeyId: null == apiKeyId
            ? _self.apiKeyId
            : apiKeyId // ignore: cast_nullable_to_non_nullable
                  as int,
        accountId: null == accountId
            ? _self.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as int,
        requestId: null == requestId
            ? _self.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String,
        model: null == model
            ? _self.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String,
        serviceTier: freezed == serviceTier
            ? _self.serviceTier
            : serviceTier // ignore: cast_nullable_to_non_nullable
                  as String?,
        reasoningEffort: freezed == reasoningEffort
            ? _self.reasoningEffort
            : reasoningEffort // ignore: cast_nullable_to_non_nullable
                  as String?,
        inboundEndpoint: freezed == inboundEndpoint
            ? _self.inboundEndpoint
            : inboundEndpoint // ignore: cast_nullable_to_non_nullable
                  as String?,
        upstreamEndpoint: freezed == upstreamEndpoint
            ? _self.upstreamEndpoint
            : upstreamEndpoint // ignore: cast_nullable_to_non_nullable
                  as String?,
        groupId: freezed == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int?,
        subscriptionId: freezed == subscriptionId
            ? _self.subscriptionId
            : subscriptionId // ignore: cast_nullable_to_non_nullable
                  as int?,
        inputTokens: null == inputTokens
            ? _self.inputTokens
            : inputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        outputTokens: null == outputTokens
            ? _self.outputTokens
            : outputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheCreationTokens: null == cacheCreationTokens
            ? _self.cacheCreationTokens
            : cacheCreationTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheReadTokens: null == cacheReadTokens
            ? _self.cacheReadTokens
            : cacheReadTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheCreation5mTokens: null == cacheCreation5mTokens
            ? _self.cacheCreation5mTokens
            : cacheCreation5mTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheCreation1hTokens: null == cacheCreation1hTokens
            ? _self.cacheCreation1hTokens
            : cacheCreation1hTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        inputCost: null == inputCost
            ? _self.inputCost
            : inputCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        outputCost: null == outputCost
            ? _self.outputCost
            : outputCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        cacheCreationCost: null == cacheCreationCost
            ? _self.cacheCreationCost
            : cacheCreationCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        cacheReadCost: null == cacheReadCost
            ? _self.cacheReadCost
            : cacheReadCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        totalCost: null == totalCost
            ? _self.totalCost
            : totalCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        actualCost: null == actualCost
            ? _self.actualCost
            : actualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        rateMultiplier: null == rateMultiplier
            ? _self.rateMultiplier
            : rateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        longContextBillingApplied: null == longContextBillingApplied
            ? _self.longContextBillingApplied
            : longContextBillingApplied // ignore: cast_nullable_to_non_nullable
                  as bool,
        billingType: null == billingType
            ? _self.billingType
            : billingType // ignore: cast_nullable_to_non_nullable
                  as int,
        requestType: null == requestType
            ? _self.requestType
            : requestType // ignore: cast_nullable_to_non_nullable
                  as String,
        stream: null == stream
            ? _self.stream
            : stream // ignore: cast_nullable_to_non_nullable
                  as bool,
        openAiWsMode: null == openAiWsMode
            ? _self.openAiWsMode
            : openAiWsMode // ignore: cast_nullable_to_non_nullable
                  as bool,
        durationMs: freezed == durationMs
            ? _self.durationMs
            : durationMs // ignore: cast_nullable_to_non_nullable
                  as int?,
        firstTokenMs: freezed == firstTokenMs
            ? _self.firstTokenMs
            : firstTokenMs // ignore: cast_nullable_to_non_nullable
                  as int?,
        imageCount: null == imageCount
            ? _self.imageCount
            : imageCount // ignore: cast_nullable_to_non_nullable
                  as int,
        imageSize: freezed == imageSize
            ? _self.imageSize
            : imageSize // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageInputSize: freezed == imageInputSize
            ? _self.imageInputSize
            : imageInputSize // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageOutputSize: freezed == imageOutputSize
            ? _self.imageOutputSize
            : imageOutputSize // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageOutputTokens: null == imageOutputTokens
            ? _self.imageOutputTokens
            : imageOutputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        imageOutputCost: null == imageOutputCost
            ? _self.imageOutputCost
            : imageOutputCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        imageSizeSource: freezed == imageSizeSource
            ? _self.imageSizeSource
            : imageSizeSource // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageSizeBreakdown: freezed == imageSizeBreakdown
            ? _self._imageSizeBreakdown
            : imageSizeBreakdown // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>?,
        mediaType: freezed == mediaType
            ? _self.mediaType
            : mediaType // ignore: cast_nullable_to_non_nullable
                  as String?,
        userAgent: freezed == userAgent
            ? _self.userAgent
            : userAgent // ignore: cast_nullable_to_non_nullable
                  as String?,
        ipAddress: freezed == ipAddress
            ? _self.ipAddress
            : ipAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        cacheTtlOverridden: null == cacheTtlOverridden
            ? _self.cacheTtlOverridden
            : cacheTtlOverridden // ignore: cast_nullable_to_non_nullable
                  as bool,
        billingMode: freezed == billingMode
            ? _self.billingMode
            : billingMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiUsageStats {
  int get totalRequests;
  int get totalInputTokens;
  int get totalOutputTokens;
  int get totalCacheTokens;
  int get totalCacheCreationTokens;
  int get totalCacheReadTokens;
  int get totalTokens;
  Sub2ApiDecimal get totalCost;
  Sub2ApiDecimal get totalActualCost;
  Sub2ApiDecimal get averageDurationMs;

  /// Create a copy of Sub2ApiUsageStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageStatsCopyWith<Sub2ApiUsageStats> get copyWith =>
      _$Sub2ApiUsageStatsCopyWithImpl<Sub2ApiUsageStats>(
        this as Sub2ApiUsageStats,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageStats &&
            (identical(other.totalRequests, totalRequests) ||
                other.totalRequests == totalRequests) &&
            (identical(other.totalInputTokens, totalInputTokens) ||
                other.totalInputTokens == totalInputTokens) &&
            (identical(other.totalOutputTokens, totalOutputTokens) ||
                other.totalOutputTokens == totalOutputTokens) &&
            (identical(other.totalCacheTokens, totalCacheTokens) ||
                other.totalCacheTokens == totalCacheTokens) &&
            (identical(
                  other.totalCacheCreationTokens,
                  totalCacheCreationTokens,
                ) ||
                other.totalCacheCreationTokens == totalCacheCreationTokens) &&
            (identical(other.totalCacheReadTokens, totalCacheReadTokens) ||
                other.totalCacheReadTokens == totalCacheReadTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.totalActualCost, totalActualCost) ||
                other.totalActualCost == totalActualCost) &&
            (identical(other.averageDurationMs, averageDurationMs) ||
                other.averageDurationMs == averageDurationMs));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalRequests,
    totalInputTokens,
    totalOutputTokens,
    totalCacheTokens,
    totalCacheCreationTokens,
    totalCacheReadTokens,
    totalTokens,
    totalCost,
    totalActualCost,
    averageDurationMs,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageStats(totalRequests: $totalRequests, totalInputTokens: $totalInputTokens, totalOutputTokens: $totalOutputTokens, totalCacheTokens: $totalCacheTokens, totalCacheCreationTokens: $totalCacheCreationTokens, totalCacheReadTokens: $totalCacheReadTokens, totalTokens: $totalTokens, totalCost: $totalCost, totalActualCost: $totalActualCost, averageDurationMs: $averageDurationMs)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageStatsCopyWith<$Res> {
  factory $Sub2ApiUsageStatsCopyWith(
    Sub2ApiUsageStats value,
    $Res Function(Sub2ApiUsageStats) _then,
  ) = _$Sub2ApiUsageStatsCopyWithImpl;
  @useResult
  $Res call({
    int totalRequests,
    int totalInputTokens,
    int totalOutputTokens,
    int totalCacheTokens,
    int totalCacheCreationTokens,
    int totalCacheReadTokens,
    int totalTokens,
    Sub2ApiDecimal totalCost,
    Sub2ApiDecimal totalActualCost,
    Sub2ApiDecimal averageDurationMs,
  });
}

/// @nodoc
class _$Sub2ApiUsageStatsCopyWithImpl<$Res>
    implements $Sub2ApiUsageStatsCopyWith<$Res> {
  _$Sub2ApiUsageStatsCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageStats _self;
  final $Res Function(Sub2ApiUsageStats) _then;

  /// Create a copy of Sub2ApiUsageStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRequests = null,
    Object? totalInputTokens = null,
    Object? totalOutputTokens = null,
    Object? totalCacheTokens = null,
    Object? totalCacheCreationTokens = null,
    Object? totalCacheReadTokens = null,
    Object? totalTokens = null,
    Object? totalCost = null,
    Object? totalActualCost = null,
    Object? averageDurationMs = null,
  }) {
    return _then(
      _self.copyWith(
        totalRequests: null == totalRequests
            ? _self.totalRequests
            : totalRequests // ignore: cast_nullable_to_non_nullable
                  as int,
        totalInputTokens: null == totalInputTokens
            ? _self.totalInputTokens
            : totalInputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalOutputTokens: null == totalOutputTokens
            ? _self.totalOutputTokens
            : totalOutputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCacheTokens: null == totalCacheTokens
            ? _self.totalCacheTokens
            : totalCacheTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCacheCreationTokens: null == totalCacheCreationTokens
            ? _self.totalCacheCreationTokens
            : totalCacheCreationTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCacheReadTokens: null == totalCacheReadTokens
            ? _self.totalCacheReadTokens
            : totalCacheReadTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalTokens: null == totalTokens
            ? _self.totalTokens
            : totalTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCost: null == totalCost
            ? _self.totalCost
            : totalCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        totalActualCost: null == totalActualCost
            ? _self.totalActualCost
            : totalActualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        averageDurationMs: null == averageDurationMs
            ? _self.averageDurationMs
            : averageDurationMs // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUsageStats].
extension Sub2ApiUsageStatsPatterns on Sub2ApiUsageStats {
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
    TResult Function(_Sub2ApiUsageStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageStats() when $default != null:
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
    TResult Function(_Sub2ApiUsageStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageStats():
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
    TResult? Function(_Sub2ApiUsageStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageStats() when $default != null:
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
      int totalRequests,
      int totalInputTokens,
      int totalOutputTokens,
      int totalCacheTokens,
      int totalCacheCreationTokens,
      int totalCacheReadTokens,
      int totalTokens,
      Sub2ApiDecimal totalCost,
      Sub2ApiDecimal totalActualCost,
      Sub2ApiDecimal averageDurationMs,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageStats() when $default != null:
        return $default(
          _that.totalRequests,
          _that.totalInputTokens,
          _that.totalOutputTokens,
          _that.totalCacheTokens,
          _that.totalCacheCreationTokens,
          _that.totalCacheReadTokens,
          _that.totalTokens,
          _that.totalCost,
          _that.totalActualCost,
          _that.averageDurationMs,
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
      int totalRequests,
      int totalInputTokens,
      int totalOutputTokens,
      int totalCacheTokens,
      int totalCacheCreationTokens,
      int totalCacheReadTokens,
      int totalTokens,
      Sub2ApiDecimal totalCost,
      Sub2ApiDecimal totalActualCost,
      Sub2ApiDecimal averageDurationMs,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageStats():
        return $default(
          _that.totalRequests,
          _that.totalInputTokens,
          _that.totalOutputTokens,
          _that.totalCacheTokens,
          _that.totalCacheCreationTokens,
          _that.totalCacheReadTokens,
          _that.totalTokens,
          _that.totalCost,
          _that.totalActualCost,
          _that.averageDurationMs,
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
      int totalRequests,
      int totalInputTokens,
      int totalOutputTokens,
      int totalCacheTokens,
      int totalCacheCreationTokens,
      int totalCacheReadTokens,
      int totalTokens,
      Sub2ApiDecimal totalCost,
      Sub2ApiDecimal totalActualCost,
      Sub2ApiDecimal averageDurationMs,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageStats() when $default != null:
        return $default(
          _that.totalRequests,
          _that.totalInputTokens,
          _that.totalOutputTokens,
          _that.totalCacheTokens,
          _that.totalCacheCreationTokens,
          _that.totalCacheReadTokens,
          _that.totalTokens,
          _that.totalCost,
          _that.totalActualCost,
          _that.averageDurationMs,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUsageStats implements Sub2ApiUsageStats {
  const _Sub2ApiUsageStats({
    required this.totalRequests,
    required this.totalInputTokens,
    required this.totalOutputTokens,
    required this.totalCacheTokens,
    required this.totalCacheCreationTokens,
    required this.totalCacheReadTokens,
    required this.totalTokens,
    required this.totalCost,
    required this.totalActualCost,
    required this.averageDurationMs,
  });

  @override
  final int totalRequests;
  @override
  final int totalInputTokens;
  @override
  final int totalOutputTokens;
  @override
  final int totalCacheTokens;
  @override
  final int totalCacheCreationTokens;
  @override
  final int totalCacheReadTokens;
  @override
  final int totalTokens;
  @override
  final Sub2ApiDecimal totalCost;
  @override
  final Sub2ApiDecimal totalActualCost;
  @override
  final Sub2ApiDecimal averageDurationMs;

  /// Create a copy of Sub2ApiUsageStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageStatsCopyWith<_Sub2ApiUsageStats> get copyWith =>
      __$Sub2ApiUsageStatsCopyWithImpl<_Sub2ApiUsageStats>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageStats &&
            (identical(other.totalRequests, totalRequests) ||
                other.totalRequests == totalRequests) &&
            (identical(other.totalInputTokens, totalInputTokens) ||
                other.totalInputTokens == totalInputTokens) &&
            (identical(other.totalOutputTokens, totalOutputTokens) ||
                other.totalOutputTokens == totalOutputTokens) &&
            (identical(other.totalCacheTokens, totalCacheTokens) ||
                other.totalCacheTokens == totalCacheTokens) &&
            (identical(
                  other.totalCacheCreationTokens,
                  totalCacheCreationTokens,
                ) ||
                other.totalCacheCreationTokens == totalCacheCreationTokens) &&
            (identical(other.totalCacheReadTokens, totalCacheReadTokens) ||
                other.totalCacheReadTokens == totalCacheReadTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.totalActualCost, totalActualCost) ||
                other.totalActualCost == totalActualCost) &&
            (identical(other.averageDurationMs, averageDurationMs) ||
                other.averageDurationMs == averageDurationMs));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalRequests,
    totalInputTokens,
    totalOutputTokens,
    totalCacheTokens,
    totalCacheCreationTokens,
    totalCacheReadTokens,
    totalTokens,
    totalCost,
    totalActualCost,
    averageDurationMs,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageStats(totalRequests: $totalRequests, totalInputTokens: $totalInputTokens, totalOutputTokens: $totalOutputTokens, totalCacheTokens: $totalCacheTokens, totalCacheCreationTokens: $totalCacheCreationTokens, totalCacheReadTokens: $totalCacheReadTokens, totalTokens: $totalTokens, totalCost: $totalCost, totalActualCost: $totalActualCost, averageDurationMs: $averageDurationMs)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageStatsCopyWith<$Res>
    implements $Sub2ApiUsageStatsCopyWith<$Res> {
  factory _$Sub2ApiUsageStatsCopyWith(
    _Sub2ApiUsageStats value,
    $Res Function(_Sub2ApiUsageStats) _then,
  ) = __$Sub2ApiUsageStatsCopyWithImpl;
  @override
  @useResult
  $Res call({
    int totalRequests,
    int totalInputTokens,
    int totalOutputTokens,
    int totalCacheTokens,
    int totalCacheCreationTokens,
    int totalCacheReadTokens,
    int totalTokens,
    Sub2ApiDecimal totalCost,
    Sub2ApiDecimal totalActualCost,
    Sub2ApiDecimal averageDurationMs,
  });
}

/// @nodoc
class __$Sub2ApiUsageStatsCopyWithImpl<$Res>
    implements _$Sub2ApiUsageStatsCopyWith<$Res> {
  __$Sub2ApiUsageStatsCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageStats _self;
  final $Res Function(_Sub2ApiUsageStats) _then;

  /// Create a copy of Sub2ApiUsageStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalRequests = null,
    Object? totalInputTokens = null,
    Object? totalOutputTokens = null,
    Object? totalCacheTokens = null,
    Object? totalCacheCreationTokens = null,
    Object? totalCacheReadTokens = null,
    Object? totalTokens = null,
    Object? totalCost = null,
    Object? totalActualCost = null,
    Object? averageDurationMs = null,
  }) {
    return _then(
      _Sub2ApiUsageStats(
        totalRequests: null == totalRequests
            ? _self.totalRequests
            : totalRequests // ignore: cast_nullable_to_non_nullable
                  as int,
        totalInputTokens: null == totalInputTokens
            ? _self.totalInputTokens
            : totalInputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalOutputTokens: null == totalOutputTokens
            ? _self.totalOutputTokens
            : totalOutputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCacheTokens: null == totalCacheTokens
            ? _self.totalCacheTokens
            : totalCacheTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCacheCreationTokens: null == totalCacheCreationTokens
            ? _self.totalCacheCreationTokens
            : totalCacheCreationTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCacheReadTokens: null == totalCacheReadTokens
            ? _self.totalCacheReadTokens
            : totalCacheReadTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalTokens: null == totalTokens
            ? _self.totalTokens
            : totalTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCost: null == totalCost
            ? _self.totalCost
            : totalCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        totalActualCost: null == totalActualCost
            ? _self.totalActualCost
            : totalActualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        averageDurationMs: null == averageDurationMs
            ? _self.averageDurationMs
            : averageDurationMs // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiUsageErrorQuery {
  int get page;
  int get pageSize;
  DateTime? get startDate;
  DateTime? get endDate;
  String? get timezone;
  String? get model;
  int? get statusCode;
  String? get category;
  int? get apiKeyId;
  String get sortBy;
  String get sortOrder;

  /// Create a copy of Sub2ApiUsageErrorQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageErrorQueryCopyWith<Sub2ApiUsageErrorQuery> get copyWith =>
      _$Sub2ApiUsageErrorQueryCopyWithImpl<Sub2ApiUsageErrorQuery>(
        this as Sub2ApiUsageErrorQuery,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageErrorQuery &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.apiKeyId, apiKeyId) ||
                other.apiKeyId == apiKeyId) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    page,
    pageSize,
    startDate,
    endDate,
    timezone,
    model,
    statusCode,
    category,
    apiKeyId,
    sortBy,
    sortOrder,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageErrorQuery(page: $page, pageSize: $pageSize, startDate: $startDate, endDate: $endDate, timezone: $timezone, model: $model, statusCode: $statusCode, category: $category, apiKeyId: $apiKeyId, sortBy: $sortBy, sortOrder: $sortOrder)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageErrorQueryCopyWith<$Res> {
  factory $Sub2ApiUsageErrorQueryCopyWith(
    Sub2ApiUsageErrorQuery value,
    $Res Function(Sub2ApiUsageErrorQuery) _then,
  ) = _$Sub2ApiUsageErrorQueryCopyWithImpl;
  @useResult
  $Res call({
    int page,
    int pageSize,
    DateTime? startDate,
    DateTime? endDate,
    String? timezone,
    String? model,
    int? statusCode,
    String? category,
    int? apiKeyId,
    String sortBy,
    String sortOrder,
  });
}

/// @nodoc
class _$Sub2ApiUsageErrorQueryCopyWithImpl<$Res>
    implements $Sub2ApiUsageErrorQueryCopyWith<$Res> {
  _$Sub2ApiUsageErrorQueryCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageErrorQuery _self;
  final $Res Function(Sub2ApiUsageErrorQuery) _then;

  /// Create a copy of Sub2ApiUsageErrorQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? timezone = freezed,
    Object? model = freezed,
    Object? statusCode = freezed,
    Object? category = freezed,
    Object? apiKeyId = freezed,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(
      _self.copyWith(
        page: null == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        pageSize: null == pageSize
            ? _self.pageSize
            : pageSize // ignore: cast_nullable_to_non_nullable
                  as int,
        startDate: freezed == startDate
            ? _self.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _self.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        timezone: freezed == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String?,
        model: freezed == model
            ? _self.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String?,
        statusCode: freezed == statusCode
            ? _self.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as int?,
        category: freezed == category
            ? _self.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        apiKeyId: freezed == apiKeyId
            ? _self.apiKeyId
            : apiKeyId // ignore: cast_nullable_to_non_nullable
                  as int?,
        sortBy: null == sortBy
            ? _self.sortBy
            : sortBy // ignore: cast_nullable_to_non_nullable
                  as String,
        sortOrder: null == sortOrder
            ? _self.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUsageErrorQuery].
extension Sub2ApiUsageErrorQueryPatterns on Sub2ApiUsageErrorQuery {
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
    TResult Function(_Sub2ApiUsageErrorQuery value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageErrorQuery() when $default != null:
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
    TResult Function(_Sub2ApiUsageErrorQuery value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageErrorQuery():
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
    TResult? Function(_Sub2ApiUsageErrorQuery value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageErrorQuery() when $default != null:
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
      int page,
      int pageSize,
      DateTime? startDate,
      DateTime? endDate,
      String? timezone,
      String? model,
      int? statusCode,
      String? category,
      int? apiKeyId,
      String sortBy,
      String sortOrder,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageErrorQuery() when $default != null:
        return $default(
          _that.page,
          _that.pageSize,
          _that.startDate,
          _that.endDate,
          _that.timezone,
          _that.model,
          _that.statusCode,
          _that.category,
          _that.apiKeyId,
          _that.sortBy,
          _that.sortOrder,
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
      int page,
      int pageSize,
      DateTime? startDate,
      DateTime? endDate,
      String? timezone,
      String? model,
      int? statusCode,
      String? category,
      int? apiKeyId,
      String sortBy,
      String sortOrder,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageErrorQuery():
        return $default(
          _that.page,
          _that.pageSize,
          _that.startDate,
          _that.endDate,
          _that.timezone,
          _that.model,
          _that.statusCode,
          _that.category,
          _that.apiKeyId,
          _that.sortBy,
          _that.sortOrder,
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
      int page,
      int pageSize,
      DateTime? startDate,
      DateTime? endDate,
      String? timezone,
      String? model,
      int? statusCode,
      String? category,
      int? apiKeyId,
      String sortBy,
      String sortOrder,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageErrorQuery() when $default != null:
        return $default(
          _that.page,
          _that.pageSize,
          _that.startDate,
          _that.endDate,
          _that.timezone,
          _that.model,
          _that.statusCode,
          _that.category,
          _that.apiKeyId,
          _that.sortBy,
          _that.sortOrder,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUsageErrorQuery implements Sub2ApiUsageErrorQuery {
  const _Sub2ApiUsageErrorQuery({
    this.page = 1,
    this.pageSize = 20,
    this.startDate,
    this.endDate,
    this.timezone,
    this.model,
    this.statusCode,
    this.category,
    this.apiKeyId,
    this.sortBy = 'created_at',
    this.sortOrder = 'desc',
  });

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pageSize;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? timezone;
  @override
  final String? model;
  @override
  final int? statusCode;
  @override
  final String? category;
  @override
  final int? apiKeyId;
  @override
  @JsonKey()
  final String sortBy;
  @override
  @JsonKey()
  final String sortOrder;

  /// Create a copy of Sub2ApiUsageErrorQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageErrorQueryCopyWith<_Sub2ApiUsageErrorQuery> get copyWith =>
      __$Sub2ApiUsageErrorQueryCopyWithImpl<_Sub2ApiUsageErrorQuery>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageErrorQuery &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.apiKeyId, apiKeyId) ||
                other.apiKeyId == apiKeyId) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    page,
    pageSize,
    startDate,
    endDate,
    timezone,
    model,
    statusCode,
    category,
    apiKeyId,
    sortBy,
    sortOrder,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageErrorQuery(page: $page, pageSize: $pageSize, startDate: $startDate, endDate: $endDate, timezone: $timezone, model: $model, statusCode: $statusCode, category: $category, apiKeyId: $apiKeyId, sortBy: $sortBy, sortOrder: $sortOrder)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageErrorQueryCopyWith<$Res>
    implements $Sub2ApiUsageErrorQueryCopyWith<$Res> {
  factory _$Sub2ApiUsageErrorQueryCopyWith(
    _Sub2ApiUsageErrorQuery value,
    $Res Function(_Sub2ApiUsageErrorQuery) _then,
  ) = __$Sub2ApiUsageErrorQueryCopyWithImpl;
  @override
  @useResult
  $Res call({
    int page,
    int pageSize,
    DateTime? startDate,
    DateTime? endDate,
    String? timezone,
    String? model,
    int? statusCode,
    String? category,
    int? apiKeyId,
    String sortBy,
    String sortOrder,
  });
}

/// @nodoc
class __$Sub2ApiUsageErrorQueryCopyWithImpl<$Res>
    implements _$Sub2ApiUsageErrorQueryCopyWith<$Res> {
  __$Sub2ApiUsageErrorQueryCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageErrorQuery _self;
  final $Res Function(_Sub2ApiUsageErrorQuery) _then;

  /// Create a copy of Sub2ApiUsageErrorQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? timezone = freezed,
    Object? model = freezed,
    Object? statusCode = freezed,
    Object? category = freezed,
    Object? apiKeyId = freezed,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(
      _Sub2ApiUsageErrorQuery(
        page: null == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        pageSize: null == pageSize
            ? _self.pageSize
            : pageSize // ignore: cast_nullable_to_non_nullable
                  as int,
        startDate: freezed == startDate
            ? _self.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _self.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        timezone: freezed == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String?,
        model: freezed == model
            ? _self.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String?,
        statusCode: freezed == statusCode
            ? _self.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as int?,
        category: freezed == category
            ? _self.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        apiKeyId: freezed == apiKeyId
            ? _self.apiKeyId
            : apiKeyId // ignore: cast_nullable_to_non_nullable
                  as int?,
        sortBy: null == sortBy
            ? _self.sortBy
            : sortBy // ignore: cast_nullable_to_non_nullable
                  as String,
        sortOrder: null == sortOrder
            ? _self.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiUsageError {
  int get id;
  DateTime get createdAt;
  String get model;
  String get inboundEndpoint;
  int get statusCode;
  String get category;
  String get platform;
  String get message;
  String get keyName;
  bool get keyDeleted;
  String? get clientIp;
  String? get groupName;
  int? get requestType;
  bool get stream;
  String? get userAgent;

  /// Create a copy of Sub2ApiUsageError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageErrorCopyWith<Sub2ApiUsageError> get copyWith =>
      _$Sub2ApiUsageErrorCopyWithImpl<Sub2ApiUsageError>(
        this as Sub2ApiUsageError,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageError &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.inboundEndpoint, inboundEndpoint) ||
                other.inboundEndpoint == inboundEndpoint) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.keyName, keyName) || other.keyName == keyName) &&
            (identical(other.keyDeleted, keyDeleted) ||
                other.keyDeleted == keyDeleted) &&
            (identical(other.clientIp, clientIp) ||
                other.clientIp == clientIp) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.requestType, requestType) ||
                other.requestType == requestType) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.userAgent, userAgent) ||
                other.userAgent == userAgent));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    model,
    inboundEndpoint,
    statusCode,
    category,
    platform,
    message,
    keyName,
    keyDeleted,
    clientIp,
    groupName,
    requestType,
    stream,
    userAgent,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageError(id: $id, createdAt: $createdAt, model: $model, inboundEndpoint: $inboundEndpoint, statusCode: $statusCode, category: $category, platform: $platform, message: $message, keyName: $keyName, keyDeleted: $keyDeleted, clientIp: $clientIp, groupName: $groupName, requestType: $requestType, stream: $stream, userAgent: $userAgent)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageErrorCopyWith<$Res> {
  factory $Sub2ApiUsageErrorCopyWith(
    Sub2ApiUsageError value,
    $Res Function(Sub2ApiUsageError) _then,
  ) = _$Sub2ApiUsageErrorCopyWithImpl;
  @useResult
  $Res call({
    int id,
    DateTime createdAt,
    String model,
    String inboundEndpoint,
    int statusCode,
    String category,
    String platform,
    String message,
    String keyName,
    bool keyDeleted,
    String? clientIp,
    String? groupName,
    int? requestType,
    bool stream,
    String? userAgent,
  });
}

/// @nodoc
class _$Sub2ApiUsageErrorCopyWithImpl<$Res>
    implements $Sub2ApiUsageErrorCopyWith<$Res> {
  _$Sub2ApiUsageErrorCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageError _self;
  final $Res Function(Sub2ApiUsageError) _then;

  /// Create a copy of Sub2ApiUsageError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? model = null,
    Object? inboundEndpoint = null,
    Object? statusCode = null,
    Object? category = null,
    Object? platform = null,
    Object? message = null,
    Object? keyName = null,
    Object? keyDeleted = null,
    Object? clientIp = freezed,
    Object? groupName = freezed,
    Object? requestType = freezed,
    Object? stream = null,
    Object? userAgent = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        model: null == model
            ? _self.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String,
        inboundEndpoint: null == inboundEndpoint
            ? _self.inboundEndpoint
            : inboundEndpoint // ignore: cast_nullable_to_non_nullable
                  as String,
        statusCode: null == statusCode
            ? _self.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as int,
        category: null == category
            ? _self.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        keyName: null == keyName
            ? _self.keyName
            : keyName // ignore: cast_nullable_to_non_nullable
                  as String,
        keyDeleted: null == keyDeleted
            ? _self.keyDeleted
            : keyDeleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        clientIp: freezed == clientIp
            ? _self.clientIp
            : clientIp // ignore: cast_nullable_to_non_nullable
                  as String?,
        groupName: freezed == groupName
            ? _self.groupName
            : groupName // ignore: cast_nullable_to_non_nullable
                  as String?,
        requestType: freezed == requestType
            ? _self.requestType
            : requestType // ignore: cast_nullable_to_non_nullable
                  as int?,
        stream: null == stream
            ? _self.stream
            : stream // ignore: cast_nullable_to_non_nullable
                  as bool,
        userAgent: freezed == userAgent
            ? _self.userAgent
            : userAgent // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUsageError].
extension Sub2ApiUsageErrorPatterns on Sub2ApiUsageError {
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
    TResult Function(_Sub2ApiUsageError value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageError() when $default != null:
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
    TResult Function(_Sub2ApiUsageError value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageError():
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
    TResult? Function(_Sub2ApiUsageError value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageError() when $default != null:
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
      DateTime createdAt,
      String model,
      String inboundEndpoint,
      int statusCode,
      String category,
      String platform,
      String message,
      String keyName,
      bool keyDeleted,
      String? clientIp,
      String? groupName,
      int? requestType,
      bool stream,
      String? userAgent,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageError() when $default != null:
        return $default(
          _that.id,
          _that.createdAt,
          _that.model,
          _that.inboundEndpoint,
          _that.statusCode,
          _that.category,
          _that.platform,
          _that.message,
          _that.keyName,
          _that.keyDeleted,
          _that.clientIp,
          _that.groupName,
          _that.requestType,
          _that.stream,
          _that.userAgent,
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
      DateTime createdAt,
      String model,
      String inboundEndpoint,
      int statusCode,
      String category,
      String platform,
      String message,
      String keyName,
      bool keyDeleted,
      String? clientIp,
      String? groupName,
      int? requestType,
      bool stream,
      String? userAgent,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageError():
        return $default(
          _that.id,
          _that.createdAt,
          _that.model,
          _that.inboundEndpoint,
          _that.statusCode,
          _that.category,
          _that.platform,
          _that.message,
          _that.keyName,
          _that.keyDeleted,
          _that.clientIp,
          _that.groupName,
          _that.requestType,
          _that.stream,
          _that.userAgent,
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
      DateTime createdAt,
      String model,
      String inboundEndpoint,
      int statusCode,
      String category,
      String platform,
      String message,
      String keyName,
      bool keyDeleted,
      String? clientIp,
      String? groupName,
      int? requestType,
      bool stream,
      String? userAgent,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageError() when $default != null:
        return $default(
          _that.id,
          _that.createdAt,
          _that.model,
          _that.inboundEndpoint,
          _that.statusCode,
          _that.category,
          _that.platform,
          _that.message,
          _that.keyName,
          _that.keyDeleted,
          _that.clientIp,
          _that.groupName,
          _that.requestType,
          _that.stream,
          _that.userAgent,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUsageError implements Sub2ApiUsageError {
  const _Sub2ApiUsageError({
    required this.id,
    required this.createdAt,
    required this.model,
    required this.inboundEndpoint,
    required this.statusCode,
    required this.category,
    required this.platform,
    required this.message,
    required this.keyName,
    required this.keyDeleted,
    this.clientIp,
    this.groupName,
    this.requestType,
    required this.stream,
    this.userAgent,
  });

  @override
  final int id;
  @override
  final DateTime createdAt;
  @override
  final String model;
  @override
  final String inboundEndpoint;
  @override
  final int statusCode;
  @override
  final String category;
  @override
  final String platform;
  @override
  final String message;
  @override
  final String keyName;
  @override
  final bool keyDeleted;
  @override
  final String? clientIp;
  @override
  final String? groupName;
  @override
  final int? requestType;
  @override
  final bool stream;
  @override
  final String? userAgent;

  /// Create a copy of Sub2ApiUsageError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageErrorCopyWith<_Sub2ApiUsageError> get copyWith =>
      __$Sub2ApiUsageErrorCopyWithImpl<_Sub2ApiUsageError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageError &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.inboundEndpoint, inboundEndpoint) ||
                other.inboundEndpoint == inboundEndpoint) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.keyName, keyName) || other.keyName == keyName) &&
            (identical(other.keyDeleted, keyDeleted) ||
                other.keyDeleted == keyDeleted) &&
            (identical(other.clientIp, clientIp) ||
                other.clientIp == clientIp) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.requestType, requestType) ||
                other.requestType == requestType) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.userAgent, userAgent) ||
                other.userAgent == userAgent));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    model,
    inboundEndpoint,
    statusCode,
    category,
    platform,
    message,
    keyName,
    keyDeleted,
    clientIp,
    groupName,
    requestType,
    stream,
    userAgent,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageError(id: $id, createdAt: $createdAt, model: $model, inboundEndpoint: $inboundEndpoint, statusCode: $statusCode, category: $category, platform: $platform, message: $message, keyName: $keyName, keyDeleted: $keyDeleted, clientIp: $clientIp, groupName: $groupName, requestType: $requestType, stream: $stream, userAgent: $userAgent)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageErrorCopyWith<$Res>
    implements $Sub2ApiUsageErrorCopyWith<$Res> {
  factory _$Sub2ApiUsageErrorCopyWith(
    _Sub2ApiUsageError value,
    $Res Function(_Sub2ApiUsageError) _then,
  ) = __$Sub2ApiUsageErrorCopyWithImpl;
  @override
  @useResult
  $Res call({
    int id,
    DateTime createdAt,
    String model,
    String inboundEndpoint,
    int statusCode,
    String category,
    String platform,
    String message,
    String keyName,
    bool keyDeleted,
    String? clientIp,
    String? groupName,
    int? requestType,
    bool stream,
    String? userAgent,
  });
}

/// @nodoc
class __$Sub2ApiUsageErrorCopyWithImpl<$Res>
    implements _$Sub2ApiUsageErrorCopyWith<$Res> {
  __$Sub2ApiUsageErrorCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageError _self;
  final $Res Function(_Sub2ApiUsageError) _then;

  /// Create a copy of Sub2ApiUsageError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? model = null,
    Object? inboundEndpoint = null,
    Object? statusCode = null,
    Object? category = null,
    Object? platform = null,
    Object? message = null,
    Object? keyName = null,
    Object? keyDeleted = null,
    Object? clientIp = freezed,
    Object? groupName = freezed,
    Object? requestType = freezed,
    Object? stream = null,
    Object? userAgent = freezed,
  }) {
    return _then(
      _Sub2ApiUsageError(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        model: null == model
            ? _self.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String,
        inboundEndpoint: null == inboundEndpoint
            ? _self.inboundEndpoint
            : inboundEndpoint // ignore: cast_nullable_to_non_nullable
                  as String,
        statusCode: null == statusCode
            ? _self.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as int,
        category: null == category
            ? _self.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        keyName: null == keyName
            ? _self.keyName
            : keyName // ignore: cast_nullable_to_non_nullable
                  as String,
        keyDeleted: null == keyDeleted
            ? _self.keyDeleted
            : keyDeleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        clientIp: freezed == clientIp
            ? _self.clientIp
            : clientIp // ignore: cast_nullable_to_non_nullable
                  as String?,
        groupName: freezed == groupName
            ? _self.groupName
            : groupName // ignore: cast_nullable_to_non_nullable
                  as String?,
        requestType: freezed == requestType
            ? _self.requestType
            : requestType // ignore: cast_nullable_to_non_nullable
                  as int?,
        stream: null == stream
            ? _self.stream
            : stream // ignore: cast_nullable_to_non_nullable
                  as bool,
        userAgent: freezed == userAgent
            ? _self.userAgent
            : userAgent // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiUsageErrorDetail {
  Sub2ApiUsageError get summary;
  String get errorBody;
  int? get upstreamStatusCode;

  /// Create a copy of Sub2ApiUsageErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageErrorDetailCopyWith<Sub2ApiUsageErrorDetail> get copyWith =>
      _$Sub2ApiUsageErrorDetailCopyWithImpl<Sub2ApiUsageErrorDetail>(
        this as Sub2ApiUsageErrorDetail,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageErrorDetail &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.errorBody, errorBody) ||
                other.errorBody == errorBody) &&
            (identical(other.upstreamStatusCode, upstreamStatusCode) ||
                other.upstreamStatusCode == upstreamStatusCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, summary, errorBody, upstreamStatusCode);

  @override
  String toString() {
    return 'Sub2ApiUsageErrorDetail(summary: $summary, errorBody: $errorBody, upstreamStatusCode: $upstreamStatusCode)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageErrorDetailCopyWith<$Res> {
  factory $Sub2ApiUsageErrorDetailCopyWith(
    Sub2ApiUsageErrorDetail value,
    $Res Function(Sub2ApiUsageErrorDetail) _then,
  ) = _$Sub2ApiUsageErrorDetailCopyWithImpl;
  @useResult
  $Res call({
    Sub2ApiUsageError summary,
    String errorBody,
    int? upstreamStatusCode,
  });

  $Sub2ApiUsageErrorCopyWith<$Res> get summary;
}

/// @nodoc
class _$Sub2ApiUsageErrorDetailCopyWithImpl<$Res>
    implements $Sub2ApiUsageErrorDetailCopyWith<$Res> {
  _$Sub2ApiUsageErrorDetailCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageErrorDetail _self;
  final $Res Function(Sub2ApiUsageErrorDetail) _then;

  /// Create a copy of Sub2ApiUsageErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? errorBody = null,
    Object? upstreamStatusCode = freezed,
  }) {
    return _then(
      _self.copyWith(
        summary: null == summary
            ? _self.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiUsageError,
        errorBody: null == errorBody
            ? _self.errorBody
            : errorBody // ignore: cast_nullable_to_non_nullable
                  as String,
        upstreamStatusCode: freezed == upstreamStatusCode
            ? _self.upstreamStatusCode
            : upstreamStatusCode // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }

  /// Create a copy of Sub2ApiUsageErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageErrorCopyWith<$Res> get summary {
    return $Sub2ApiUsageErrorCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUsageErrorDetail].
extension Sub2ApiUsageErrorDetailPatterns on Sub2ApiUsageErrorDetail {
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
    TResult Function(_Sub2ApiUsageErrorDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageErrorDetail() when $default != null:
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
    TResult Function(_Sub2ApiUsageErrorDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageErrorDetail():
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
    TResult? Function(_Sub2ApiUsageErrorDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageErrorDetail() when $default != null:
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
      Sub2ApiUsageError summary,
      String errorBody,
      int? upstreamStatusCode,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageErrorDetail() when $default != null:
        return $default(
          _that.summary,
          _that.errorBody,
          _that.upstreamStatusCode,
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
      Sub2ApiUsageError summary,
      String errorBody,
      int? upstreamStatusCode,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageErrorDetail():
        return $default(
          _that.summary,
          _that.errorBody,
          _that.upstreamStatusCode,
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
      Sub2ApiUsageError summary,
      String errorBody,
      int? upstreamStatusCode,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageErrorDetail() when $default != null:
        return $default(
          _that.summary,
          _that.errorBody,
          _that.upstreamStatusCode,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUsageErrorDetail implements Sub2ApiUsageErrorDetail {
  const _Sub2ApiUsageErrorDetail({
    required this.summary,
    required this.errorBody,
    this.upstreamStatusCode,
  });

  @override
  final Sub2ApiUsageError summary;
  @override
  final String errorBody;
  @override
  final int? upstreamStatusCode;

  /// Create a copy of Sub2ApiUsageErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageErrorDetailCopyWith<_Sub2ApiUsageErrorDetail> get copyWith =>
      __$Sub2ApiUsageErrorDetailCopyWithImpl<_Sub2ApiUsageErrorDetail>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageErrorDetail &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.errorBody, errorBody) ||
                other.errorBody == errorBody) &&
            (identical(other.upstreamStatusCode, upstreamStatusCode) ||
                other.upstreamStatusCode == upstreamStatusCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, summary, errorBody, upstreamStatusCode);

  @override
  String toString() {
    return 'Sub2ApiUsageErrorDetail(summary: $summary, errorBody: $errorBody, upstreamStatusCode: $upstreamStatusCode)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageErrorDetailCopyWith<$Res>
    implements $Sub2ApiUsageErrorDetailCopyWith<$Res> {
  factory _$Sub2ApiUsageErrorDetailCopyWith(
    _Sub2ApiUsageErrorDetail value,
    $Res Function(_Sub2ApiUsageErrorDetail) _then,
  ) = __$Sub2ApiUsageErrorDetailCopyWithImpl;
  @override
  @useResult
  $Res call({
    Sub2ApiUsageError summary,
    String errorBody,
    int? upstreamStatusCode,
  });

  @override
  $Sub2ApiUsageErrorCopyWith<$Res> get summary;
}

/// @nodoc
class __$Sub2ApiUsageErrorDetailCopyWithImpl<$Res>
    implements _$Sub2ApiUsageErrorDetailCopyWith<$Res> {
  __$Sub2ApiUsageErrorDetailCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageErrorDetail _self;
  final $Res Function(_Sub2ApiUsageErrorDetail) _then;

  /// Create a copy of Sub2ApiUsageErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? summary = null,
    Object? errorBody = null,
    Object? upstreamStatusCode = freezed,
  }) {
    return _then(
      _Sub2ApiUsageErrorDetail(
        summary: null == summary
            ? _self.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiUsageError,
        errorBody: null == errorBody
            ? _self.errorBody
            : errorBody // ignore: cast_nullable_to_non_nullable
                  as String,
        upstreamStatusCode: freezed == upstreamStatusCode
            ? _self.upstreamStatusCode
            : upstreamStatusCode // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }

  /// Create a copy of Sub2ApiUsageErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageErrorCopyWith<$Res> get summary {
    return $Sub2ApiUsageErrorCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }
}

/// @nodoc
mixin _$Sub2ApiUsagePlatformStats {
  String get platform;
  int get totalRequests;
  int get totalTokens;
  Sub2ApiDecimal get totalActualCost;
  int get todayRequests;
  int get todayTokens;
  Sub2ApiDecimal get todayActualCost;

  /// Create a copy of Sub2ApiUsagePlatformStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsagePlatformStatsCopyWith<Sub2ApiUsagePlatformStats> get copyWith =>
      _$Sub2ApiUsagePlatformStatsCopyWithImpl<Sub2ApiUsagePlatformStats>(
        this as Sub2ApiUsagePlatformStats,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsagePlatformStats &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.totalRequests, totalRequests) ||
                other.totalRequests == totalRequests) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.totalActualCost, totalActualCost) ||
                other.totalActualCost == totalActualCost) &&
            (identical(other.todayRequests, todayRequests) ||
                other.todayRequests == todayRequests) &&
            (identical(other.todayTokens, todayTokens) ||
                other.todayTokens == todayTokens) &&
            (identical(other.todayActualCost, todayActualCost) ||
                other.todayActualCost == todayActualCost));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    platform,
    totalRequests,
    totalTokens,
    totalActualCost,
    todayRequests,
    todayTokens,
    todayActualCost,
  );

  @override
  String toString() {
    return 'Sub2ApiUsagePlatformStats(platform: $platform, totalRequests: $totalRequests, totalTokens: $totalTokens, totalActualCost: $totalActualCost, todayRequests: $todayRequests, todayTokens: $todayTokens, todayActualCost: $todayActualCost)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsagePlatformStatsCopyWith<$Res> {
  factory $Sub2ApiUsagePlatformStatsCopyWith(
    Sub2ApiUsagePlatformStats value,
    $Res Function(Sub2ApiUsagePlatformStats) _then,
  ) = _$Sub2ApiUsagePlatformStatsCopyWithImpl;
  @useResult
  $Res call({
    String platform,
    int totalRequests,
    int totalTokens,
    Sub2ApiDecimal totalActualCost,
    int todayRequests,
    int todayTokens,
    Sub2ApiDecimal todayActualCost,
  });
}

/// @nodoc
class _$Sub2ApiUsagePlatformStatsCopyWithImpl<$Res>
    implements $Sub2ApiUsagePlatformStatsCopyWith<$Res> {
  _$Sub2ApiUsagePlatformStatsCopyWithImpl(this._self, this._then);

  final Sub2ApiUsagePlatformStats _self;
  final $Res Function(Sub2ApiUsagePlatformStats) _then;

  /// Create a copy of Sub2ApiUsagePlatformStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? totalRequests = null,
    Object? totalTokens = null,
    Object? totalActualCost = null,
    Object? todayRequests = null,
    Object? todayTokens = null,
    Object? todayActualCost = null,
  }) {
    return _then(
      _self.copyWith(
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        totalRequests: null == totalRequests
            ? _self.totalRequests
            : totalRequests // ignore: cast_nullable_to_non_nullable
                  as int,
        totalTokens: null == totalTokens
            ? _self.totalTokens
            : totalTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalActualCost: null == totalActualCost
            ? _self.totalActualCost
            : totalActualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        todayRequests: null == todayRequests
            ? _self.todayRequests
            : todayRequests // ignore: cast_nullable_to_non_nullable
                  as int,
        todayTokens: null == todayTokens
            ? _self.todayTokens
            : todayTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        todayActualCost: null == todayActualCost
            ? _self.todayActualCost
            : todayActualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUsagePlatformStats].
extension Sub2ApiUsagePlatformStatsPatterns on Sub2ApiUsagePlatformStats {
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
    TResult Function(_Sub2ApiUsagePlatformStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsagePlatformStats() when $default != null:
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
    TResult Function(_Sub2ApiUsagePlatformStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsagePlatformStats():
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
    TResult? Function(_Sub2ApiUsagePlatformStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsagePlatformStats() when $default != null:
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
      int totalRequests,
      int totalTokens,
      Sub2ApiDecimal totalActualCost,
      int todayRequests,
      int todayTokens,
      Sub2ApiDecimal todayActualCost,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsagePlatformStats() when $default != null:
        return $default(
          _that.platform,
          _that.totalRequests,
          _that.totalTokens,
          _that.totalActualCost,
          _that.todayRequests,
          _that.todayTokens,
          _that.todayActualCost,
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
      int totalRequests,
      int totalTokens,
      Sub2ApiDecimal totalActualCost,
      int todayRequests,
      int todayTokens,
      Sub2ApiDecimal todayActualCost,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsagePlatformStats():
        return $default(
          _that.platform,
          _that.totalRequests,
          _that.totalTokens,
          _that.totalActualCost,
          _that.todayRequests,
          _that.todayTokens,
          _that.todayActualCost,
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
      int totalRequests,
      int totalTokens,
      Sub2ApiDecimal totalActualCost,
      int todayRequests,
      int todayTokens,
      Sub2ApiDecimal todayActualCost,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsagePlatformStats() when $default != null:
        return $default(
          _that.platform,
          _that.totalRequests,
          _that.totalTokens,
          _that.totalActualCost,
          _that.todayRequests,
          _that.todayTokens,
          _that.todayActualCost,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUsagePlatformStats implements Sub2ApiUsagePlatformStats {
  const _Sub2ApiUsagePlatformStats({
    required this.platform,
    required this.totalRequests,
    required this.totalTokens,
    required this.totalActualCost,
    required this.todayRequests,
    required this.todayTokens,
    required this.todayActualCost,
  });

  @override
  final String platform;
  @override
  final int totalRequests;
  @override
  final int totalTokens;
  @override
  final Sub2ApiDecimal totalActualCost;
  @override
  final int todayRequests;
  @override
  final int todayTokens;
  @override
  final Sub2ApiDecimal todayActualCost;

  /// Create a copy of Sub2ApiUsagePlatformStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsagePlatformStatsCopyWith<_Sub2ApiUsagePlatformStats>
  get copyWith =>
      __$Sub2ApiUsagePlatformStatsCopyWithImpl<_Sub2ApiUsagePlatformStats>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsagePlatformStats &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.totalRequests, totalRequests) ||
                other.totalRequests == totalRequests) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.totalActualCost, totalActualCost) ||
                other.totalActualCost == totalActualCost) &&
            (identical(other.todayRequests, todayRequests) ||
                other.todayRequests == todayRequests) &&
            (identical(other.todayTokens, todayTokens) ||
                other.todayTokens == todayTokens) &&
            (identical(other.todayActualCost, todayActualCost) ||
                other.todayActualCost == todayActualCost));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    platform,
    totalRequests,
    totalTokens,
    totalActualCost,
    todayRequests,
    todayTokens,
    todayActualCost,
  );

  @override
  String toString() {
    return 'Sub2ApiUsagePlatformStats(platform: $platform, totalRequests: $totalRequests, totalTokens: $totalTokens, totalActualCost: $totalActualCost, todayRequests: $todayRequests, todayTokens: $todayTokens, todayActualCost: $todayActualCost)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsagePlatformStatsCopyWith<$Res>
    implements $Sub2ApiUsagePlatformStatsCopyWith<$Res> {
  factory _$Sub2ApiUsagePlatformStatsCopyWith(
    _Sub2ApiUsagePlatformStats value,
    $Res Function(_Sub2ApiUsagePlatformStats) _then,
  ) = __$Sub2ApiUsagePlatformStatsCopyWithImpl;
  @override
  @useResult
  $Res call({
    String platform,
    int totalRequests,
    int totalTokens,
    Sub2ApiDecimal totalActualCost,
    int todayRequests,
    int todayTokens,
    Sub2ApiDecimal todayActualCost,
  });
}

/// @nodoc
class __$Sub2ApiUsagePlatformStatsCopyWithImpl<$Res>
    implements _$Sub2ApiUsagePlatformStatsCopyWith<$Res> {
  __$Sub2ApiUsagePlatformStatsCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsagePlatformStats _self;
  final $Res Function(_Sub2ApiUsagePlatformStats) _then;

  /// Create a copy of Sub2ApiUsagePlatformStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? platform = null,
    Object? totalRequests = null,
    Object? totalTokens = null,
    Object? totalActualCost = null,
    Object? todayRequests = null,
    Object? todayTokens = null,
    Object? todayActualCost = null,
  }) {
    return _then(
      _Sub2ApiUsagePlatformStats(
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        totalRequests: null == totalRequests
            ? _self.totalRequests
            : totalRequests // ignore: cast_nullable_to_non_nullable
                  as int,
        totalTokens: null == totalTokens
            ? _self.totalTokens
            : totalTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalActualCost: null == totalActualCost
            ? _self.totalActualCost
            : totalActualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        todayRequests: null == todayRequests
            ? _self.todayRequests
            : todayRequests // ignore: cast_nullable_to_non_nullable
                  as int,
        todayTokens: null == todayTokens
            ? _self.todayTokens
            : todayTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        todayActualCost: null == todayActualCost
            ? _self.todayActualCost
            : todayActualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiUsageDashboardStats {
  int get totalApiKeys;
  int get activeApiKeys;
  int get totalRequests;
  int get totalInputTokens;
  int get totalOutputTokens;
  int get totalCacheCreationTokens;
  int get totalCacheReadTokens;
  int get totalTokens;
  Sub2ApiDecimal get totalCost;
  Sub2ApiDecimal get totalActualCost;
  int get todayRequests;
  int get todayInputTokens;
  int get todayOutputTokens;
  int get todayCacheCreationTokens;
  int get todayCacheReadTokens;
  int get todayTokens;
  Sub2ApiDecimal get todayCost;
  Sub2ApiDecimal get todayActualCost;
  Sub2ApiDecimal get averageDurationMs;
  int get rpm;
  int get tpm;
  List<Sub2ApiUsagePlatformStats> get byPlatform;

  /// Create a copy of Sub2ApiUsageDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageDashboardStatsCopyWith<Sub2ApiUsageDashboardStats>
  get copyWith =>
      _$Sub2ApiUsageDashboardStatsCopyWithImpl<Sub2ApiUsageDashboardStats>(
        this as Sub2ApiUsageDashboardStats,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageDashboardStats &&
            (identical(other.totalApiKeys, totalApiKeys) ||
                other.totalApiKeys == totalApiKeys) &&
            (identical(other.activeApiKeys, activeApiKeys) ||
                other.activeApiKeys == activeApiKeys) &&
            (identical(other.totalRequests, totalRequests) ||
                other.totalRequests == totalRequests) &&
            (identical(other.totalInputTokens, totalInputTokens) ||
                other.totalInputTokens == totalInputTokens) &&
            (identical(other.totalOutputTokens, totalOutputTokens) ||
                other.totalOutputTokens == totalOutputTokens) &&
            (identical(
                  other.totalCacheCreationTokens,
                  totalCacheCreationTokens,
                ) ||
                other.totalCacheCreationTokens == totalCacheCreationTokens) &&
            (identical(other.totalCacheReadTokens, totalCacheReadTokens) ||
                other.totalCacheReadTokens == totalCacheReadTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.totalActualCost, totalActualCost) ||
                other.totalActualCost == totalActualCost) &&
            (identical(other.todayRequests, todayRequests) ||
                other.todayRequests == todayRequests) &&
            (identical(other.todayInputTokens, todayInputTokens) ||
                other.todayInputTokens == todayInputTokens) &&
            (identical(other.todayOutputTokens, todayOutputTokens) ||
                other.todayOutputTokens == todayOutputTokens) &&
            (identical(
                  other.todayCacheCreationTokens,
                  todayCacheCreationTokens,
                ) ||
                other.todayCacheCreationTokens == todayCacheCreationTokens) &&
            (identical(other.todayCacheReadTokens, todayCacheReadTokens) ||
                other.todayCacheReadTokens == todayCacheReadTokens) &&
            (identical(other.todayTokens, todayTokens) ||
                other.todayTokens == todayTokens) &&
            (identical(other.todayCost, todayCost) ||
                other.todayCost == todayCost) &&
            (identical(other.todayActualCost, todayActualCost) ||
                other.todayActualCost == todayActualCost) &&
            (identical(other.averageDurationMs, averageDurationMs) ||
                other.averageDurationMs == averageDurationMs) &&
            (identical(other.rpm, rpm) || other.rpm == rpm) &&
            (identical(other.tpm, tpm) || other.tpm == tpm) &&
            const DeepCollectionEquality().equals(
              other.byPlatform,
              byPlatform,
            ));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    totalApiKeys,
    activeApiKeys,
    totalRequests,
    totalInputTokens,
    totalOutputTokens,
    totalCacheCreationTokens,
    totalCacheReadTokens,
    totalTokens,
    totalCost,
    totalActualCost,
    todayRequests,
    todayInputTokens,
    todayOutputTokens,
    todayCacheCreationTokens,
    todayCacheReadTokens,
    todayTokens,
    todayCost,
    todayActualCost,
    averageDurationMs,
    rpm,
    tpm,
    const DeepCollectionEquality().hash(byPlatform),
  ]);

  @override
  String toString() {
    return 'Sub2ApiUsageDashboardStats(totalApiKeys: $totalApiKeys, activeApiKeys: $activeApiKeys, totalRequests: $totalRequests, totalInputTokens: $totalInputTokens, totalOutputTokens: $totalOutputTokens, totalCacheCreationTokens: $totalCacheCreationTokens, totalCacheReadTokens: $totalCacheReadTokens, totalTokens: $totalTokens, totalCost: $totalCost, totalActualCost: $totalActualCost, todayRequests: $todayRequests, todayInputTokens: $todayInputTokens, todayOutputTokens: $todayOutputTokens, todayCacheCreationTokens: $todayCacheCreationTokens, todayCacheReadTokens: $todayCacheReadTokens, todayTokens: $todayTokens, todayCost: $todayCost, todayActualCost: $todayActualCost, averageDurationMs: $averageDurationMs, rpm: $rpm, tpm: $tpm, byPlatform: $byPlatform)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageDashboardStatsCopyWith<$Res> {
  factory $Sub2ApiUsageDashboardStatsCopyWith(
    Sub2ApiUsageDashboardStats value,
    $Res Function(Sub2ApiUsageDashboardStats) _then,
  ) = _$Sub2ApiUsageDashboardStatsCopyWithImpl;
  @useResult
  $Res call({
    int totalApiKeys,
    int activeApiKeys,
    int totalRequests,
    int totalInputTokens,
    int totalOutputTokens,
    int totalCacheCreationTokens,
    int totalCacheReadTokens,
    int totalTokens,
    Sub2ApiDecimal totalCost,
    Sub2ApiDecimal totalActualCost,
    int todayRequests,
    int todayInputTokens,
    int todayOutputTokens,
    int todayCacheCreationTokens,
    int todayCacheReadTokens,
    int todayTokens,
    Sub2ApiDecimal todayCost,
    Sub2ApiDecimal todayActualCost,
    Sub2ApiDecimal averageDurationMs,
    int rpm,
    int tpm,
    List<Sub2ApiUsagePlatformStats> byPlatform,
  });
}

/// @nodoc
class _$Sub2ApiUsageDashboardStatsCopyWithImpl<$Res>
    implements $Sub2ApiUsageDashboardStatsCopyWith<$Res> {
  _$Sub2ApiUsageDashboardStatsCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageDashboardStats _self;
  final $Res Function(Sub2ApiUsageDashboardStats) _then;

  /// Create a copy of Sub2ApiUsageDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalApiKeys = null,
    Object? activeApiKeys = null,
    Object? totalRequests = null,
    Object? totalInputTokens = null,
    Object? totalOutputTokens = null,
    Object? totalCacheCreationTokens = null,
    Object? totalCacheReadTokens = null,
    Object? totalTokens = null,
    Object? totalCost = null,
    Object? totalActualCost = null,
    Object? todayRequests = null,
    Object? todayInputTokens = null,
    Object? todayOutputTokens = null,
    Object? todayCacheCreationTokens = null,
    Object? todayCacheReadTokens = null,
    Object? todayTokens = null,
    Object? todayCost = null,
    Object? todayActualCost = null,
    Object? averageDurationMs = null,
    Object? rpm = null,
    Object? tpm = null,
    Object? byPlatform = null,
  }) {
    return _then(
      _self.copyWith(
        totalApiKeys: null == totalApiKeys
            ? _self.totalApiKeys
            : totalApiKeys // ignore: cast_nullable_to_non_nullable
                  as int,
        activeApiKeys: null == activeApiKeys
            ? _self.activeApiKeys
            : activeApiKeys // ignore: cast_nullable_to_non_nullable
                  as int,
        totalRequests: null == totalRequests
            ? _self.totalRequests
            : totalRequests // ignore: cast_nullable_to_non_nullable
                  as int,
        totalInputTokens: null == totalInputTokens
            ? _self.totalInputTokens
            : totalInputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalOutputTokens: null == totalOutputTokens
            ? _self.totalOutputTokens
            : totalOutputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCacheCreationTokens: null == totalCacheCreationTokens
            ? _self.totalCacheCreationTokens
            : totalCacheCreationTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCacheReadTokens: null == totalCacheReadTokens
            ? _self.totalCacheReadTokens
            : totalCacheReadTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalTokens: null == totalTokens
            ? _self.totalTokens
            : totalTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCost: null == totalCost
            ? _self.totalCost
            : totalCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        totalActualCost: null == totalActualCost
            ? _self.totalActualCost
            : totalActualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        todayRequests: null == todayRequests
            ? _self.todayRequests
            : todayRequests // ignore: cast_nullable_to_non_nullable
                  as int,
        todayInputTokens: null == todayInputTokens
            ? _self.todayInputTokens
            : todayInputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        todayOutputTokens: null == todayOutputTokens
            ? _self.todayOutputTokens
            : todayOutputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        todayCacheCreationTokens: null == todayCacheCreationTokens
            ? _self.todayCacheCreationTokens
            : todayCacheCreationTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        todayCacheReadTokens: null == todayCacheReadTokens
            ? _self.todayCacheReadTokens
            : todayCacheReadTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        todayTokens: null == todayTokens
            ? _self.todayTokens
            : todayTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        todayCost: null == todayCost
            ? _self.todayCost
            : todayCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        todayActualCost: null == todayActualCost
            ? _self.todayActualCost
            : todayActualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        averageDurationMs: null == averageDurationMs
            ? _self.averageDurationMs
            : averageDurationMs // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        rpm: null == rpm
            ? _self.rpm
            : rpm // ignore: cast_nullable_to_non_nullable
                  as int,
        tpm: null == tpm
            ? _self.tpm
            : tpm // ignore: cast_nullable_to_non_nullable
                  as int,
        byPlatform: null == byPlatform
            ? _self.byPlatform
            : byPlatform // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiUsagePlatformStats>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUsageDashboardStats].
extension Sub2ApiUsageDashboardStatsPatterns on Sub2ApiUsageDashboardStats {
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
    TResult Function(_Sub2ApiUsageDashboardStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardStats() when $default != null:
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
    TResult Function(_Sub2ApiUsageDashboardStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardStats():
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
    TResult? Function(_Sub2ApiUsageDashboardStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardStats() when $default != null:
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
      int totalApiKeys,
      int activeApiKeys,
      int totalRequests,
      int totalInputTokens,
      int totalOutputTokens,
      int totalCacheCreationTokens,
      int totalCacheReadTokens,
      int totalTokens,
      Sub2ApiDecimal totalCost,
      Sub2ApiDecimal totalActualCost,
      int todayRequests,
      int todayInputTokens,
      int todayOutputTokens,
      int todayCacheCreationTokens,
      int todayCacheReadTokens,
      int todayTokens,
      Sub2ApiDecimal todayCost,
      Sub2ApiDecimal todayActualCost,
      Sub2ApiDecimal averageDurationMs,
      int rpm,
      int tpm,
      List<Sub2ApiUsagePlatformStats> byPlatform,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardStats() when $default != null:
        return $default(
          _that.totalApiKeys,
          _that.activeApiKeys,
          _that.totalRequests,
          _that.totalInputTokens,
          _that.totalOutputTokens,
          _that.totalCacheCreationTokens,
          _that.totalCacheReadTokens,
          _that.totalTokens,
          _that.totalCost,
          _that.totalActualCost,
          _that.todayRequests,
          _that.todayInputTokens,
          _that.todayOutputTokens,
          _that.todayCacheCreationTokens,
          _that.todayCacheReadTokens,
          _that.todayTokens,
          _that.todayCost,
          _that.todayActualCost,
          _that.averageDurationMs,
          _that.rpm,
          _that.tpm,
          _that.byPlatform,
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
      int totalApiKeys,
      int activeApiKeys,
      int totalRequests,
      int totalInputTokens,
      int totalOutputTokens,
      int totalCacheCreationTokens,
      int totalCacheReadTokens,
      int totalTokens,
      Sub2ApiDecimal totalCost,
      Sub2ApiDecimal totalActualCost,
      int todayRequests,
      int todayInputTokens,
      int todayOutputTokens,
      int todayCacheCreationTokens,
      int todayCacheReadTokens,
      int todayTokens,
      Sub2ApiDecimal todayCost,
      Sub2ApiDecimal todayActualCost,
      Sub2ApiDecimal averageDurationMs,
      int rpm,
      int tpm,
      List<Sub2ApiUsagePlatformStats> byPlatform,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardStats():
        return $default(
          _that.totalApiKeys,
          _that.activeApiKeys,
          _that.totalRequests,
          _that.totalInputTokens,
          _that.totalOutputTokens,
          _that.totalCacheCreationTokens,
          _that.totalCacheReadTokens,
          _that.totalTokens,
          _that.totalCost,
          _that.totalActualCost,
          _that.todayRequests,
          _that.todayInputTokens,
          _that.todayOutputTokens,
          _that.todayCacheCreationTokens,
          _that.todayCacheReadTokens,
          _that.todayTokens,
          _that.todayCost,
          _that.todayActualCost,
          _that.averageDurationMs,
          _that.rpm,
          _that.tpm,
          _that.byPlatform,
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
      int totalApiKeys,
      int activeApiKeys,
      int totalRequests,
      int totalInputTokens,
      int totalOutputTokens,
      int totalCacheCreationTokens,
      int totalCacheReadTokens,
      int totalTokens,
      Sub2ApiDecimal totalCost,
      Sub2ApiDecimal totalActualCost,
      int todayRequests,
      int todayInputTokens,
      int todayOutputTokens,
      int todayCacheCreationTokens,
      int todayCacheReadTokens,
      int todayTokens,
      Sub2ApiDecimal todayCost,
      Sub2ApiDecimal todayActualCost,
      Sub2ApiDecimal averageDurationMs,
      int rpm,
      int tpm,
      List<Sub2ApiUsagePlatformStats> byPlatform,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardStats() when $default != null:
        return $default(
          _that.totalApiKeys,
          _that.activeApiKeys,
          _that.totalRequests,
          _that.totalInputTokens,
          _that.totalOutputTokens,
          _that.totalCacheCreationTokens,
          _that.totalCacheReadTokens,
          _that.totalTokens,
          _that.totalCost,
          _that.totalActualCost,
          _that.todayRequests,
          _that.todayInputTokens,
          _that.todayOutputTokens,
          _that.todayCacheCreationTokens,
          _that.todayCacheReadTokens,
          _that.todayTokens,
          _that.todayCost,
          _that.todayActualCost,
          _that.averageDurationMs,
          _that.rpm,
          _that.tpm,
          _that.byPlatform,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUsageDashboardStats implements Sub2ApiUsageDashboardStats {
  const _Sub2ApiUsageDashboardStats({
    required this.totalApiKeys,
    required this.activeApiKeys,
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
    required this.rpm,
    required this.tpm,
    required final List<Sub2ApiUsagePlatformStats> byPlatform,
  }) : _byPlatform = byPlatform;

  @override
  final int totalApiKeys;
  @override
  final int activeApiKeys;
  @override
  final int totalRequests;
  @override
  final int totalInputTokens;
  @override
  final int totalOutputTokens;
  @override
  final int totalCacheCreationTokens;
  @override
  final int totalCacheReadTokens;
  @override
  final int totalTokens;
  @override
  final Sub2ApiDecimal totalCost;
  @override
  final Sub2ApiDecimal totalActualCost;
  @override
  final int todayRequests;
  @override
  final int todayInputTokens;
  @override
  final int todayOutputTokens;
  @override
  final int todayCacheCreationTokens;
  @override
  final int todayCacheReadTokens;
  @override
  final int todayTokens;
  @override
  final Sub2ApiDecimal todayCost;
  @override
  final Sub2ApiDecimal todayActualCost;
  @override
  final Sub2ApiDecimal averageDurationMs;
  @override
  final int rpm;
  @override
  final int tpm;
  final List<Sub2ApiUsagePlatformStats> _byPlatform;
  @override
  List<Sub2ApiUsagePlatformStats> get byPlatform {
    if (_byPlatform is EqualUnmodifiableListView) return _byPlatform;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_byPlatform);
  }

  /// Create a copy of Sub2ApiUsageDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageDashboardStatsCopyWith<_Sub2ApiUsageDashboardStats>
  get copyWith =>
      __$Sub2ApiUsageDashboardStatsCopyWithImpl<_Sub2ApiUsageDashboardStats>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageDashboardStats &&
            (identical(other.totalApiKeys, totalApiKeys) ||
                other.totalApiKeys == totalApiKeys) &&
            (identical(other.activeApiKeys, activeApiKeys) ||
                other.activeApiKeys == activeApiKeys) &&
            (identical(other.totalRequests, totalRequests) ||
                other.totalRequests == totalRequests) &&
            (identical(other.totalInputTokens, totalInputTokens) ||
                other.totalInputTokens == totalInputTokens) &&
            (identical(other.totalOutputTokens, totalOutputTokens) ||
                other.totalOutputTokens == totalOutputTokens) &&
            (identical(
                  other.totalCacheCreationTokens,
                  totalCacheCreationTokens,
                ) ||
                other.totalCacheCreationTokens == totalCacheCreationTokens) &&
            (identical(other.totalCacheReadTokens, totalCacheReadTokens) ||
                other.totalCacheReadTokens == totalCacheReadTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.totalActualCost, totalActualCost) ||
                other.totalActualCost == totalActualCost) &&
            (identical(other.todayRequests, todayRequests) ||
                other.todayRequests == todayRequests) &&
            (identical(other.todayInputTokens, todayInputTokens) ||
                other.todayInputTokens == todayInputTokens) &&
            (identical(other.todayOutputTokens, todayOutputTokens) ||
                other.todayOutputTokens == todayOutputTokens) &&
            (identical(
                  other.todayCacheCreationTokens,
                  todayCacheCreationTokens,
                ) ||
                other.todayCacheCreationTokens == todayCacheCreationTokens) &&
            (identical(other.todayCacheReadTokens, todayCacheReadTokens) ||
                other.todayCacheReadTokens == todayCacheReadTokens) &&
            (identical(other.todayTokens, todayTokens) ||
                other.todayTokens == todayTokens) &&
            (identical(other.todayCost, todayCost) ||
                other.todayCost == todayCost) &&
            (identical(other.todayActualCost, todayActualCost) ||
                other.todayActualCost == todayActualCost) &&
            (identical(other.averageDurationMs, averageDurationMs) ||
                other.averageDurationMs == averageDurationMs) &&
            (identical(other.rpm, rpm) || other.rpm == rpm) &&
            (identical(other.tpm, tpm) || other.tpm == tpm) &&
            const DeepCollectionEquality().equals(
              other._byPlatform,
              _byPlatform,
            ));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    totalApiKeys,
    activeApiKeys,
    totalRequests,
    totalInputTokens,
    totalOutputTokens,
    totalCacheCreationTokens,
    totalCacheReadTokens,
    totalTokens,
    totalCost,
    totalActualCost,
    todayRequests,
    todayInputTokens,
    todayOutputTokens,
    todayCacheCreationTokens,
    todayCacheReadTokens,
    todayTokens,
    todayCost,
    todayActualCost,
    averageDurationMs,
    rpm,
    tpm,
    const DeepCollectionEquality().hash(_byPlatform),
  ]);

  @override
  String toString() {
    return 'Sub2ApiUsageDashboardStats(totalApiKeys: $totalApiKeys, activeApiKeys: $activeApiKeys, totalRequests: $totalRequests, totalInputTokens: $totalInputTokens, totalOutputTokens: $totalOutputTokens, totalCacheCreationTokens: $totalCacheCreationTokens, totalCacheReadTokens: $totalCacheReadTokens, totalTokens: $totalTokens, totalCost: $totalCost, totalActualCost: $totalActualCost, todayRequests: $todayRequests, todayInputTokens: $todayInputTokens, todayOutputTokens: $todayOutputTokens, todayCacheCreationTokens: $todayCacheCreationTokens, todayCacheReadTokens: $todayCacheReadTokens, todayTokens: $todayTokens, todayCost: $todayCost, todayActualCost: $todayActualCost, averageDurationMs: $averageDurationMs, rpm: $rpm, tpm: $tpm, byPlatform: $byPlatform)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageDashboardStatsCopyWith<$Res>
    implements $Sub2ApiUsageDashboardStatsCopyWith<$Res> {
  factory _$Sub2ApiUsageDashboardStatsCopyWith(
    _Sub2ApiUsageDashboardStats value,
    $Res Function(_Sub2ApiUsageDashboardStats) _then,
  ) = __$Sub2ApiUsageDashboardStatsCopyWithImpl;
  @override
  @useResult
  $Res call({
    int totalApiKeys,
    int activeApiKeys,
    int totalRequests,
    int totalInputTokens,
    int totalOutputTokens,
    int totalCacheCreationTokens,
    int totalCacheReadTokens,
    int totalTokens,
    Sub2ApiDecimal totalCost,
    Sub2ApiDecimal totalActualCost,
    int todayRequests,
    int todayInputTokens,
    int todayOutputTokens,
    int todayCacheCreationTokens,
    int todayCacheReadTokens,
    int todayTokens,
    Sub2ApiDecimal todayCost,
    Sub2ApiDecimal todayActualCost,
    Sub2ApiDecimal averageDurationMs,
    int rpm,
    int tpm,
    List<Sub2ApiUsagePlatformStats> byPlatform,
  });
}

/// @nodoc
class __$Sub2ApiUsageDashboardStatsCopyWithImpl<$Res>
    implements _$Sub2ApiUsageDashboardStatsCopyWith<$Res> {
  __$Sub2ApiUsageDashboardStatsCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageDashboardStats _self;
  final $Res Function(_Sub2ApiUsageDashboardStats) _then;

  /// Create a copy of Sub2ApiUsageDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalApiKeys = null,
    Object? activeApiKeys = null,
    Object? totalRequests = null,
    Object? totalInputTokens = null,
    Object? totalOutputTokens = null,
    Object? totalCacheCreationTokens = null,
    Object? totalCacheReadTokens = null,
    Object? totalTokens = null,
    Object? totalCost = null,
    Object? totalActualCost = null,
    Object? todayRequests = null,
    Object? todayInputTokens = null,
    Object? todayOutputTokens = null,
    Object? todayCacheCreationTokens = null,
    Object? todayCacheReadTokens = null,
    Object? todayTokens = null,
    Object? todayCost = null,
    Object? todayActualCost = null,
    Object? averageDurationMs = null,
    Object? rpm = null,
    Object? tpm = null,
    Object? byPlatform = null,
  }) {
    return _then(
      _Sub2ApiUsageDashboardStats(
        totalApiKeys: null == totalApiKeys
            ? _self.totalApiKeys
            : totalApiKeys // ignore: cast_nullable_to_non_nullable
                  as int,
        activeApiKeys: null == activeApiKeys
            ? _self.activeApiKeys
            : activeApiKeys // ignore: cast_nullable_to_non_nullable
                  as int,
        totalRequests: null == totalRequests
            ? _self.totalRequests
            : totalRequests // ignore: cast_nullable_to_non_nullable
                  as int,
        totalInputTokens: null == totalInputTokens
            ? _self.totalInputTokens
            : totalInputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalOutputTokens: null == totalOutputTokens
            ? _self.totalOutputTokens
            : totalOutputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCacheCreationTokens: null == totalCacheCreationTokens
            ? _self.totalCacheCreationTokens
            : totalCacheCreationTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCacheReadTokens: null == totalCacheReadTokens
            ? _self.totalCacheReadTokens
            : totalCacheReadTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalTokens: null == totalTokens
            ? _self.totalTokens
            : totalTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCost: null == totalCost
            ? _self.totalCost
            : totalCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        totalActualCost: null == totalActualCost
            ? _self.totalActualCost
            : totalActualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        todayRequests: null == todayRequests
            ? _self.todayRequests
            : todayRequests // ignore: cast_nullable_to_non_nullable
                  as int,
        todayInputTokens: null == todayInputTokens
            ? _self.todayInputTokens
            : todayInputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        todayOutputTokens: null == todayOutputTokens
            ? _self.todayOutputTokens
            : todayOutputTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        todayCacheCreationTokens: null == todayCacheCreationTokens
            ? _self.todayCacheCreationTokens
            : todayCacheCreationTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        todayCacheReadTokens: null == todayCacheReadTokens
            ? _self.todayCacheReadTokens
            : todayCacheReadTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        todayTokens: null == todayTokens
            ? _self.todayTokens
            : todayTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        todayCost: null == todayCost
            ? _self.todayCost
            : todayCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        todayActualCost: null == todayActualCost
            ? _self.todayActualCost
            : todayActualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        averageDurationMs: null == averageDurationMs
            ? _self.averageDurationMs
            : averageDurationMs // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        rpm: null == rpm
            ? _self.rpm
            : rpm // ignore: cast_nullable_to_non_nullable
                  as int,
        tpm: null == tpm
            ? _self.tpm
            : tpm // ignore: cast_nullable_to_non_nullable
                  as int,
        byPlatform: null == byPlatform
            ? _self._byPlatform
            : byPlatform // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiUsagePlatformStats>,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiUsageDashboardQuery {
  DateTime? get startDate;
  DateTime? get endDate;
  String? get period;
  Sub2ApiUsageGranularity get granularity;
  int? get apiKeyId;
  int? get groupId;
  String? get model;
  String? get requestType;
  bool? get stream;
  int? get billingType;
  String? get billingMode;
  String? get timezone;

  /// Create a copy of Sub2ApiUsageDashboardQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageDashboardQueryCopyWith<Sub2ApiUsageDashboardQuery>
  get copyWith =>
      _$Sub2ApiUsageDashboardQueryCopyWithImpl<Sub2ApiUsageDashboardQuery>(
        this as Sub2ApiUsageDashboardQuery,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageDashboardQuery &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.granularity, granularity) ||
                other.granularity == granularity) &&
            (identical(other.apiKeyId, apiKeyId) ||
                other.apiKeyId == apiKeyId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.requestType, requestType) ||
                other.requestType == requestType) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.billingType, billingType) ||
                other.billingType == billingType) &&
            (identical(other.billingMode, billingMode) ||
                other.billingMode == billingMode) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    startDate,
    endDate,
    period,
    granularity,
    apiKeyId,
    groupId,
    model,
    requestType,
    stream,
    billingType,
    billingMode,
    timezone,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageDashboardQuery(startDate: $startDate, endDate: $endDate, period: $period, granularity: $granularity, apiKeyId: $apiKeyId, groupId: $groupId, model: $model, requestType: $requestType, stream: $stream, billingType: $billingType, billingMode: $billingMode, timezone: $timezone)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageDashboardQueryCopyWith<$Res> {
  factory $Sub2ApiUsageDashboardQueryCopyWith(
    Sub2ApiUsageDashboardQuery value,
    $Res Function(Sub2ApiUsageDashboardQuery) _then,
  ) = _$Sub2ApiUsageDashboardQueryCopyWithImpl;
  @useResult
  $Res call({
    DateTime? startDate,
    DateTime? endDate,
    String? period,
    Sub2ApiUsageGranularity granularity,
    int? apiKeyId,
    int? groupId,
    String? model,
    String? requestType,
    bool? stream,
    int? billingType,
    String? billingMode,
    String? timezone,
  });
}

/// @nodoc
class _$Sub2ApiUsageDashboardQueryCopyWithImpl<$Res>
    implements $Sub2ApiUsageDashboardQueryCopyWith<$Res> {
  _$Sub2ApiUsageDashboardQueryCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageDashboardQuery _self;
  final $Res Function(Sub2ApiUsageDashboardQuery) _then;

  /// Create a copy of Sub2ApiUsageDashboardQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? period = freezed,
    Object? granularity = null,
    Object? apiKeyId = freezed,
    Object? groupId = freezed,
    Object? model = freezed,
    Object? requestType = freezed,
    Object? stream = freezed,
    Object? billingType = freezed,
    Object? billingMode = freezed,
    Object? timezone = freezed,
  }) {
    return _then(
      _self.copyWith(
        startDate: freezed == startDate
            ? _self.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _self.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        period: freezed == period
            ? _self.period
            : period // ignore: cast_nullable_to_non_nullable
                  as String?,
        granularity: null == granularity
            ? _self.granularity
            : granularity // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiUsageGranularity,
        apiKeyId: freezed == apiKeyId
            ? _self.apiKeyId
            : apiKeyId // ignore: cast_nullable_to_non_nullable
                  as int?,
        groupId: freezed == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int?,
        model: freezed == model
            ? _self.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String?,
        requestType: freezed == requestType
            ? _self.requestType
            : requestType // ignore: cast_nullable_to_non_nullable
                  as String?,
        stream: freezed == stream
            ? _self.stream
            : stream // ignore: cast_nullable_to_non_nullable
                  as bool?,
        billingType: freezed == billingType
            ? _self.billingType
            : billingType // ignore: cast_nullable_to_non_nullable
                  as int?,
        billingMode: freezed == billingMode
            ? _self.billingMode
            : billingMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        timezone: freezed == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUsageDashboardQuery].
extension Sub2ApiUsageDashboardQueryPatterns on Sub2ApiUsageDashboardQuery {
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
    TResult Function(_Sub2ApiUsageDashboardQuery value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardQuery() when $default != null:
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
    TResult Function(_Sub2ApiUsageDashboardQuery value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardQuery():
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
    TResult? Function(_Sub2ApiUsageDashboardQuery value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardQuery() when $default != null:
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
      DateTime? startDate,
      DateTime? endDate,
      String? period,
      Sub2ApiUsageGranularity granularity,
      int? apiKeyId,
      int? groupId,
      String? model,
      String? requestType,
      bool? stream,
      int? billingType,
      String? billingMode,
      String? timezone,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardQuery() when $default != null:
        return $default(
          _that.startDate,
          _that.endDate,
          _that.period,
          _that.granularity,
          _that.apiKeyId,
          _that.groupId,
          _that.model,
          _that.requestType,
          _that.stream,
          _that.billingType,
          _that.billingMode,
          _that.timezone,
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
      DateTime? startDate,
      DateTime? endDate,
      String? period,
      Sub2ApiUsageGranularity granularity,
      int? apiKeyId,
      int? groupId,
      String? model,
      String? requestType,
      bool? stream,
      int? billingType,
      String? billingMode,
      String? timezone,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardQuery():
        return $default(
          _that.startDate,
          _that.endDate,
          _that.period,
          _that.granularity,
          _that.apiKeyId,
          _that.groupId,
          _that.model,
          _that.requestType,
          _that.stream,
          _that.billingType,
          _that.billingMode,
          _that.timezone,
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
      DateTime? startDate,
      DateTime? endDate,
      String? period,
      Sub2ApiUsageGranularity granularity,
      int? apiKeyId,
      int? groupId,
      String? model,
      String? requestType,
      bool? stream,
      int? billingType,
      String? billingMode,
      String? timezone,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardQuery() when $default != null:
        return $default(
          _that.startDate,
          _that.endDate,
          _that.period,
          _that.granularity,
          _that.apiKeyId,
          _that.groupId,
          _that.model,
          _that.requestType,
          _that.stream,
          _that.billingType,
          _that.billingMode,
          _that.timezone,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUsageDashboardQuery implements Sub2ApiUsageDashboardQuery {
  const _Sub2ApiUsageDashboardQuery({
    this.startDate,
    this.endDate,
    this.period,
    this.granularity = Sub2ApiUsageGranularity.day,
    this.apiKeyId,
    this.groupId,
    this.model,
    this.requestType,
    this.stream,
    this.billingType,
    this.billingMode,
    this.timezone,
  });

  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? period;
  @override
  @JsonKey()
  final Sub2ApiUsageGranularity granularity;
  @override
  final int? apiKeyId;
  @override
  final int? groupId;
  @override
  final String? model;
  @override
  final String? requestType;
  @override
  final bool? stream;
  @override
  final int? billingType;
  @override
  final String? billingMode;
  @override
  final String? timezone;

  /// Create a copy of Sub2ApiUsageDashboardQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageDashboardQueryCopyWith<_Sub2ApiUsageDashboardQuery>
  get copyWith =>
      __$Sub2ApiUsageDashboardQueryCopyWithImpl<_Sub2ApiUsageDashboardQuery>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageDashboardQuery &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.granularity, granularity) ||
                other.granularity == granularity) &&
            (identical(other.apiKeyId, apiKeyId) ||
                other.apiKeyId == apiKeyId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.requestType, requestType) ||
                other.requestType == requestType) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.billingType, billingType) ||
                other.billingType == billingType) &&
            (identical(other.billingMode, billingMode) ||
                other.billingMode == billingMode) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    startDate,
    endDate,
    period,
    granularity,
    apiKeyId,
    groupId,
    model,
    requestType,
    stream,
    billingType,
    billingMode,
    timezone,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageDashboardQuery(startDate: $startDate, endDate: $endDate, period: $period, granularity: $granularity, apiKeyId: $apiKeyId, groupId: $groupId, model: $model, requestType: $requestType, stream: $stream, billingType: $billingType, billingMode: $billingMode, timezone: $timezone)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageDashboardQueryCopyWith<$Res>
    implements $Sub2ApiUsageDashboardQueryCopyWith<$Res> {
  factory _$Sub2ApiUsageDashboardQueryCopyWith(
    _Sub2ApiUsageDashboardQuery value,
    $Res Function(_Sub2ApiUsageDashboardQuery) _then,
  ) = __$Sub2ApiUsageDashboardQueryCopyWithImpl;
  @override
  @useResult
  $Res call({
    DateTime? startDate,
    DateTime? endDate,
    String? period,
    Sub2ApiUsageGranularity granularity,
    int? apiKeyId,
    int? groupId,
    String? model,
    String? requestType,
    bool? stream,
    int? billingType,
    String? billingMode,
    String? timezone,
  });
}

/// @nodoc
class __$Sub2ApiUsageDashboardQueryCopyWithImpl<$Res>
    implements _$Sub2ApiUsageDashboardQueryCopyWith<$Res> {
  __$Sub2ApiUsageDashboardQueryCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageDashboardQuery _self;
  final $Res Function(_Sub2ApiUsageDashboardQuery) _then;

  /// Create a copy of Sub2ApiUsageDashboardQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? period = freezed,
    Object? granularity = null,
    Object? apiKeyId = freezed,
    Object? groupId = freezed,
    Object? model = freezed,
    Object? requestType = freezed,
    Object? stream = freezed,
    Object? billingType = freezed,
    Object? billingMode = freezed,
    Object? timezone = freezed,
  }) {
    return _then(
      _Sub2ApiUsageDashboardQuery(
        startDate: freezed == startDate
            ? _self.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _self.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        period: freezed == period
            ? _self.period
            : period // ignore: cast_nullable_to_non_nullable
                  as String?,
        granularity: null == granularity
            ? _self.granularity
            : granularity // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiUsageGranularity,
        apiKeyId: freezed == apiKeyId
            ? _self.apiKeyId
            : apiKeyId // ignore: cast_nullable_to_non_nullable
                  as int?,
        groupId: freezed == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int?,
        model: freezed == model
            ? _self.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String?,
        requestType: freezed == requestType
            ? _self.requestType
            : requestType // ignore: cast_nullable_to_non_nullable
                  as String?,
        stream: freezed == stream
            ? _self.stream
            : stream // ignore: cast_nullable_to_non_nullable
                  as bool?,
        billingType: freezed == billingType
            ? _self.billingType
            : billingType // ignore: cast_nullable_to_non_nullable
                  as int?,
        billingMode: freezed == billingMode
            ? _self.billingMode
            : billingMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        timezone: freezed == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiUsageTrendPoint {
  String get date;
  int get requests;
  int get inputTokens;
  int get outputTokens;
  int get cacheCreationTokens;
  int get cacheReadTokens;
  int get totalTokens;
  Sub2ApiDecimal get cost;
  Sub2ApiDecimal get actualCost;

  /// Create a copy of Sub2ApiUsageTrendPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageTrendPointCopyWith<Sub2ApiUsageTrendPoint> get copyWith =>
      _$Sub2ApiUsageTrendPointCopyWithImpl<Sub2ApiUsageTrendPoint>(
        this as Sub2ApiUsageTrendPoint,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageTrendPoint &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.requests, requests) ||
                other.requests == requests) &&
            (identical(other.inputTokens, inputTokens) ||
                other.inputTokens == inputTokens) &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens) &&
            (identical(other.cacheCreationTokens, cacheCreationTokens) ||
                other.cacheCreationTokens == cacheCreationTokens) &&
            (identical(other.cacheReadTokens, cacheReadTokens) ||
                other.cacheReadTokens == cacheReadTokens) &&
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
    cacheCreationTokens,
    cacheReadTokens,
    totalTokens,
    cost,
    actualCost,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageTrendPoint(date: $date, requests: $requests, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheCreationTokens: $cacheCreationTokens, cacheReadTokens: $cacheReadTokens, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageTrendPointCopyWith<$Res> {
  factory $Sub2ApiUsageTrendPointCopyWith(
    Sub2ApiUsageTrendPoint value,
    $Res Function(Sub2ApiUsageTrendPoint) _then,
  ) = _$Sub2ApiUsageTrendPointCopyWithImpl;
  @useResult
  $Res call({
    String date,
    int requests,
    int inputTokens,
    int outputTokens,
    int cacheCreationTokens,
    int cacheReadTokens,
    int totalTokens,
    Sub2ApiDecimal cost,
    Sub2ApiDecimal actualCost,
  });
}

/// @nodoc
class _$Sub2ApiUsageTrendPointCopyWithImpl<$Res>
    implements $Sub2ApiUsageTrendPointCopyWith<$Res> {
  _$Sub2ApiUsageTrendPointCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageTrendPoint _self;
  final $Res Function(Sub2ApiUsageTrendPoint) _then;

  /// Create a copy of Sub2ApiUsageTrendPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? requests = null,
    Object? inputTokens = null,
    Object? outputTokens = null,
    Object? cacheCreationTokens = null,
    Object? cacheReadTokens = null,
    Object? totalTokens = null,
    Object? cost = null,
    Object? actualCost = null,
  }) {
    return _then(
      _self.copyWith(
        date: null == date
            ? _self.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
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
        cacheCreationTokens: null == cacheCreationTokens
            ? _self.cacheCreationTokens
            : cacheCreationTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheReadTokens: null == cacheReadTokens
            ? _self.cacheReadTokens
            : cacheReadTokens // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [Sub2ApiUsageTrendPoint].
extension Sub2ApiUsageTrendPointPatterns on Sub2ApiUsageTrendPoint {
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
    TResult Function(_Sub2ApiUsageTrendPoint value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageTrendPoint() when $default != null:
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
    TResult Function(_Sub2ApiUsageTrendPoint value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageTrendPoint():
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
    TResult? Function(_Sub2ApiUsageTrendPoint value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageTrendPoint() when $default != null:
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
      String date,
      int requests,
      int inputTokens,
      int outputTokens,
      int cacheCreationTokens,
      int cacheReadTokens,
      int totalTokens,
      Sub2ApiDecimal cost,
      Sub2ApiDecimal actualCost,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageTrendPoint() when $default != null:
        return $default(
          _that.date,
          _that.requests,
          _that.inputTokens,
          _that.outputTokens,
          _that.cacheCreationTokens,
          _that.cacheReadTokens,
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
      String date,
      int requests,
      int inputTokens,
      int outputTokens,
      int cacheCreationTokens,
      int cacheReadTokens,
      int totalTokens,
      Sub2ApiDecimal cost,
      Sub2ApiDecimal actualCost,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageTrendPoint():
        return $default(
          _that.date,
          _that.requests,
          _that.inputTokens,
          _that.outputTokens,
          _that.cacheCreationTokens,
          _that.cacheReadTokens,
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
      String date,
      int requests,
      int inputTokens,
      int outputTokens,
      int cacheCreationTokens,
      int cacheReadTokens,
      int totalTokens,
      Sub2ApiDecimal cost,
      Sub2ApiDecimal actualCost,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageTrendPoint() when $default != null:
        return $default(
          _that.date,
          _that.requests,
          _that.inputTokens,
          _that.outputTokens,
          _that.cacheCreationTokens,
          _that.cacheReadTokens,
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

class _Sub2ApiUsageTrendPoint implements Sub2ApiUsageTrendPoint {
  const _Sub2ApiUsageTrendPoint({
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

  @override
  final String date;
  @override
  final int requests;
  @override
  final int inputTokens;
  @override
  final int outputTokens;
  @override
  final int cacheCreationTokens;
  @override
  final int cacheReadTokens;
  @override
  final int totalTokens;
  @override
  final Sub2ApiDecimal cost;
  @override
  final Sub2ApiDecimal actualCost;

  /// Create a copy of Sub2ApiUsageTrendPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageTrendPointCopyWith<_Sub2ApiUsageTrendPoint> get copyWith =>
      __$Sub2ApiUsageTrendPointCopyWithImpl<_Sub2ApiUsageTrendPoint>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageTrendPoint &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.requests, requests) ||
                other.requests == requests) &&
            (identical(other.inputTokens, inputTokens) ||
                other.inputTokens == inputTokens) &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens) &&
            (identical(other.cacheCreationTokens, cacheCreationTokens) ||
                other.cacheCreationTokens == cacheCreationTokens) &&
            (identical(other.cacheReadTokens, cacheReadTokens) ||
                other.cacheReadTokens == cacheReadTokens) &&
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
    cacheCreationTokens,
    cacheReadTokens,
    totalTokens,
    cost,
    actualCost,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageTrendPoint(date: $date, requests: $requests, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheCreationTokens: $cacheCreationTokens, cacheReadTokens: $cacheReadTokens, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageTrendPointCopyWith<$Res>
    implements $Sub2ApiUsageTrendPointCopyWith<$Res> {
  factory _$Sub2ApiUsageTrendPointCopyWith(
    _Sub2ApiUsageTrendPoint value,
    $Res Function(_Sub2ApiUsageTrendPoint) _then,
  ) = __$Sub2ApiUsageTrendPointCopyWithImpl;
  @override
  @useResult
  $Res call({
    String date,
    int requests,
    int inputTokens,
    int outputTokens,
    int cacheCreationTokens,
    int cacheReadTokens,
    int totalTokens,
    Sub2ApiDecimal cost,
    Sub2ApiDecimal actualCost,
  });
}

/// @nodoc
class __$Sub2ApiUsageTrendPointCopyWithImpl<$Res>
    implements _$Sub2ApiUsageTrendPointCopyWith<$Res> {
  __$Sub2ApiUsageTrendPointCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageTrendPoint _self;
  final $Res Function(_Sub2ApiUsageTrendPoint) _then;

  /// Create a copy of Sub2ApiUsageTrendPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? requests = null,
    Object? inputTokens = null,
    Object? outputTokens = null,
    Object? cacheCreationTokens = null,
    Object? cacheReadTokens = null,
    Object? totalTokens = null,
    Object? cost = null,
    Object? actualCost = null,
  }) {
    return _then(
      _Sub2ApiUsageTrendPoint(
        date: null == date
            ? _self.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
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
        cacheCreationTokens: null == cacheCreationTokens
            ? _self.cacheCreationTokens
            : cacheCreationTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheReadTokens: null == cacheReadTokens
            ? _self.cacheReadTokens
            : cacheReadTokens // ignore: cast_nullable_to_non_nullable
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
mixin _$Sub2ApiUsageTrend {
  List<Sub2ApiUsageTrendPoint> get points;
  DateTime get startDate;
  DateTime get endDate;
  Sub2ApiUsageGranularity get granularity;

  /// Create a copy of Sub2ApiUsageTrend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageTrendCopyWith<Sub2ApiUsageTrend> get copyWith =>
      _$Sub2ApiUsageTrendCopyWithImpl<Sub2ApiUsageTrend>(
        this as Sub2ApiUsageTrend,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageTrend &&
            const DeepCollectionEquality().equals(other.points, points) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.granularity, granularity) ||
                other.granularity == granularity));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(points),
    startDate,
    endDate,
    granularity,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageTrend(points: $points, startDate: $startDate, endDate: $endDate, granularity: $granularity)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageTrendCopyWith<$Res> {
  factory $Sub2ApiUsageTrendCopyWith(
    Sub2ApiUsageTrend value,
    $Res Function(Sub2ApiUsageTrend) _then,
  ) = _$Sub2ApiUsageTrendCopyWithImpl;
  @useResult
  $Res call({
    List<Sub2ApiUsageTrendPoint> points,
    DateTime startDate,
    DateTime endDate,
    Sub2ApiUsageGranularity granularity,
  });
}

/// @nodoc
class _$Sub2ApiUsageTrendCopyWithImpl<$Res>
    implements $Sub2ApiUsageTrendCopyWith<$Res> {
  _$Sub2ApiUsageTrendCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageTrend _self;
  final $Res Function(Sub2ApiUsageTrend) _then;

  /// Create a copy of Sub2ApiUsageTrend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? granularity = null,
  }) {
    return _then(
      _self.copyWith(
        points: null == points
            ? _self.points
            : points // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiUsageTrendPoint>,
        startDate: null == startDate
            ? _self.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _self.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        granularity: null == granularity
            ? _self.granularity
            : granularity // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiUsageGranularity,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUsageTrend].
extension Sub2ApiUsageTrendPatterns on Sub2ApiUsageTrend {
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
    TResult Function(_Sub2ApiUsageTrend value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageTrend() when $default != null:
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
    TResult Function(_Sub2ApiUsageTrend value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageTrend():
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
    TResult? Function(_Sub2ApiUsageTrend value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageTrend() when $default != null:
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
      List<Sub2ApiUsageTrendPoint> points,
      DateTime startDate,
      DateTime endDate,
      Sub2ApiUsageGranularity granularity,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageTrend() when $default != null:
        return $default(
          _that.points,
          _that.startDate,
          _that.endDate,
          _that.granularity,
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
      List<Sub2ApiUsageTrendPoint> points,
      DateTime startDate,
      DateTime endDate,
      Sub2ApiUsageGranularity granularity,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageTrend():
        return $default(
          _that.points,
          _that.startDate,
          _that.endDate,
          _that.granularity,
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
      List<Sub2ApiUsageTrendPoint> points,
      DateTime startDate,
      DateTime endDate,
      Sub2ApiUsageGranularity granularity,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageTrend() when $default != null:
        return $default(
          _that.points,
          _that.startDate,
          _that.endDate,
          _that.granularity,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUsageTrend implements Sub2ApiUsageTrend {
  const _Sub2ApiUsageTrend({
    required final List<Sub2ApiUsageTrendPoint> points,
    required this.startDate,
    required this.endDate,
    required this.granularity,
  }) : _points = points;

  final List<Sub2ApiUsageTrendPoint> _points;
  @override
  List<Sub2ApiUsageTrendPoint> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final Sub2ApiUsageGranularity granularity;

  /// Create a copy of Sub2ApiUsageTrend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageTrendCopyWith<_Sub2ApiUsageTrend> get copyWith =>
      __$Sub2ApiUsageTrendCopyWithImpl<_Sub2ApiUsageTrend>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageTrend &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.granularity, granularity) ||
                other.granularity == granularity));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_points),
    startDate,
    endDate,
    granularity,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageTrend(points: $points, startDate: $startDate, endDate: $endDate, granularity: $granularity)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageTrendCopyWith<$Res>
    implements $Sub2ApiUsageTrendCopyWith<$Res> {
  factory _$Sub2ApiUsageTrendCopyWith(
    _Sub2ApiUsageTrend value,
    $Res Function(_Sub2ApiUsageTrend) _then,
  ) = __$Sub2ApiUsageTrendCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<Sub2ApiUsageTrendPoint> points,
    DateTime startDate,
    DateTime endDate,
    Sub2ApiUsageGranularity granularity,
  });
}

/// @nodoc
class __$Sub2ApiUsageTrendCopyWithImpl<$Res>
    implements _$Sub2ApiUsageTrendCopyWith<$Res> {
  __$Sub2ApiUsageTrendCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageTrend _self;
  final $Res Function(_Sub2ApiUsageTrend) _then;

  /// Create a copy of Sub2ApiUsageTrend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? points = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? granularity = null,
  }) {
    return _then(
      _Sub2ApiUsageTrend(
        points: null == points
            ? _self._points
            : points // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiUsageTrendPoint>,
        startDate: null == startDate
            ? _self.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _self.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        granularity: null == granularity
            ? _self.granularity
            : granularity // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiUsageGranularity,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiUsageModelStats {
  String get model;
  int get requests;
  int get inputTokens;
  int get outputTokens;
  int get cacheCreationTokens;
  int get cacheReadTokens;
  int get totalTokens;
  Sub2ApiDecimal get cost;
  Sub2ApiDecimal get actualCost;

  /// Create a copy of Sub2ApiUsageModelStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageModelStatsCopyWith<Sub2ApiUsageModelStats> get copyWith =>
      _$Sub2ApiUsageModelStatsCopyWithImpl<Sub2ApiUsageModelStats>(
        this as Sub2ApiUsageModelStats,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageModelStats &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.requests, requests) ||
                other.requests == requests) &&
            (identical(other.inputTokens, inputTokens) ||
                other.inputTokens == inputTokens) &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens) &&
            (identical(other.cacheCreationTokens, cacheCreationTokens) ||
                other.cacheCreationTokens == cacheCreationTokens) &&
            (identical(other.cacheReadTokens, cacheReadTokens) ||
                other.cacheReadTokens == cacheReadTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.actualCost, actualCost) ||
                other.actualCost == actualCost));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    model,
    requests,
    inputTokens,
    outputTokens,
    cacheCreationTokens,
    cacheReadTokens,
    totalTokens,
    cost,
    actualCost,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageModelStats(model: $model, requests: $requests, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheCreationTokens: $cacheCreationTokens, cacheReadTokens: $cacheReadTokens, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageModelStatsCopyWith<$Res> {
  factory $Sub2ApiUsageModelStatsCopyWith(
    Sub2ApiUsageModelStats value,
    $Res Function(Sub2ApiUsageModelStats) _then,
  ) = _$Sub2ApiUsageModelStatsCopyWithImpl;
  @useResult
  $Res call({
    String model,
    int requests,
    int inputTokens,
    int outputTokens,
    int cacheCreationTokens,
    int cacheReadTokens,
    int totalTokens,
    Sub2ApiDecimal cost,
    Sub2ApiDecimal actualCost,
  });
}

/// @nodoc
class _$Sub2ApiUsageModelStatsCopyWithImpl<$Res>
    implements $Sub2ApiUsageModelStatsCopyWith<$Res> {
  _$Sub2ApiUsageModelStatsCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageModelStats _self;
  final $Res Function(Sub2ApiUsageModelStats) _then;

  /// Create a copy of Sub2ApiUsageModelStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? requests = null,
    Object? inputTokens = null,
    Object? outputTokens = null,
    Object? cacheCreationTokens = null,
    Object? cacheReadTokens = null,
    Object? totalTokens = null,
    Object? cost = null,
    Object? actualCost = null,
  }) {
    return _then(
      _self.copyWith(
        model: null == model
            ? _self.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String,
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
        cacheCreationTokens: null == cacheCreationTokens
            ? _self.cacheCreationTokens
            : cacheCreationTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheReadTokens: null == cacheReadTokens
            ? _self.cacheReadTokens
            : cacheReadTokens // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [Sub2ApiUsageModelStats].
extension Sub2ApiUsageModelStatsPatterns on Sub2ApiUsageModelStats {
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
    TResult Function(_Sub2ApiUsageModelStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageModelStats() when $default != null:
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
    TResult Function(_Sub2ApiUsageModelStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageModelStats():
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
    TResult? Function(_Sub2ApiUsageModelStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageModelStats() when $default != null:
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
      String model,
      int requests,
      int inputTokens,
      int outputTokens,
      int cacheCreationTokens,
      int cacheReadTokens,
      int totalTokens,
      Sub2ApiDecimal cost,
      Sub2ApiDecimal actualCost,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageModelStats() when $default != null:
        return $default(
          _that.model,
          _that.requests,
          _that.inputTokens,
          _that.outputTokens,
          _that.cacheCreationTokens,
          _that.cacheReadTokens,
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
      String model,
      int requests,
      int inputTokens,
      int outputTokens,
      int cacheCreationTokens,
      int cacheReadTokens,
      int totalTokens,
      Sub2ApiDecimal cost,
      Sub2ApiDecimal actualCost,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageModelStats():
        return $default(
          _that.model,
          _that.requests,
          _that.inputTokens,
          _that.outputTokens,
          _that.cacheCreationTokens,
          _that.cacheReadTokens,
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
      String model,
      int requests,
      int inputTokens,
      int outputTokens,
      int cacheCreationTokens,
      int cacheReadTokens,
      int totalTokens,
      Sub2ApiDecimal cost,
      Sub2ApiDecimal actualCost,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageModelStats() when $default != null:
        return $default(
          _that.model,
          _that.requests,
          _that.inputTokens,
          _that.outputTokens,
          _that.cacheCreationTokens,
          _that.cacheReadTokens,
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

class _Sub2ApiUsageModelStats implements Sub2ApiUsageModelStats {
  const _Sub2ApiUsageModelStats({
    required this.model,
    required this.requests,
    required this.inputTokens,
    required this.outputTokens,
    required this.cacheCreationTokens,
    required this.cacheReadTokens,
    required this.totalTokens,
    required this.cost,
    required this.actualCost,
  });

  @override
  final String model;
  @override
  final int requests;
  @override
  final int inputTokens;
  @override
  final int outputTokens;
  @override
  final int cacheCreationTokens;
  @override
  final int cacheReadTokens;
  @override
  final int totalTokens;
  @override
  final Sub2ApiDecimal cost;
  @override
  final Sub2ApiDecimal actualCost;

  /// Create a copy of Sub2ApiUsageModelStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageModelStatsCopyWith<_Sub2ApiUsageModelStats> get copyWith =>
      __$Sub2ApiUsageModelStatsCopyWithImpl<_Sub2ApiUsageModelStats>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageModelStats &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.requests, requests) ||
                other.requests == requests) &&
            (identical(other.inputTokens, inputTokens) ||
                other.inputTokens == inputTokens) &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens) &&
            (identical(other.cacheCreationTokens, cacheCreationTokens) ||
                other.cacheCreationTokens == cacheCreationTokens) &&
            (identical(other.cacheReadTokens, cacheReadTokens) ||
                other.cacheReadTokens == cacheReadTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.actualCost, actualCost) ||
                other.actualCost == actualCost));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    model,
    requests,
    inputTokens,
    outputTokens,
    cacheCreationTokens,
    cacheReadTokens,
    totalTokens,
    cost,
    actualCost,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageModelStats(model: $model, requests: $requests, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheCreationTokens: $cacheCreationTokens, cacheReadTokens: $cacheReadTokens, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageModelStatsCopyWith<$Res>
    implements $Sub2ApiUsageModelStatsCopyWith<$Res> {
  factory _$Sub2ApiUsageModelStatsCopyWith(
    _Sub2ApiUsageModelStats value,
    $Res Function(_Sub2ApiUsageModelStats) _then,
  ) = __$Sub2ApiUsageModelStatsCopyWithImpl;
  @override
  @useResult
  $Res call({
    String model,
    int requests,
    int inputTokens,
    int outputTokens,
    int cacheCreationTokens,
    int cacheReadTokens,
    int totalTokens,
    Sub2ApiDecimal cost,
    Sub2ApiDecimal actualCost,
  });
}

/// @nodoc
class __$Sub2ApiUsageModelStatsCopyWithImpl<$Res>
    implements _$Sub2ApiUsageModelStatsCopyWith<$Res> {
  __$Sub2ApiUsageModelStatsCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageModelStats _self;
  final $Res Function(_Sub2ApiUsageModelStats) _then;

  /// Create a copy of Sub2ApiUsageModelStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? model = null,
    Object? requests = null,
    Object? inputTokens = null,
    Object? outputTokens = null,
    Object? cacheCreationTokens = null,
    Object? cacheReadTokens = null,
    Object? totalTokens = null,
    Object? cost = null,
    Object? actualCost = null,
  }) {
    return _then(
      _Sub2ApiUsageModelStats(
        model: null == model
            ? _self.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String,
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
        cacheCreationTokens: null == cacheCreationTokens
            ? _self.cacheCreationTokens
            : cacheCreationTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        cacheReadTokens: null == cacheReadTokens
            ? _self.cacheReadTokens
            : cacheReadTokens // ignore: cast_nullable_to_non_nullable
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
mixin _$Sub2ApiUsageModels {
  List<Sub2ApiUsageModelStats> get models;
  DateTime get startDate;
  DateTime get endDate;

  /// Create a copy of Sub2ApiUsageModels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageModelsCopyWith<Sub2ApiUsageModels> get copyWith =>
      _$Sub2ApiUsageModelsCopyWithImpl<Sub2ApiUsageModels>(
        this as Sub2ApiUsageModels,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageModels &&
            const DeepCollectionEquality().equals(other.models, models) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(models),
    startDate,
    endDate,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageModels(models: $models, startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageModelsCopyWith<$Res> {
  factory $Sub2ApiUsageModelsCopyWith(
    Sub2ApiUsageModels value,
    $Res Function(Sub2ApiUsageModels) _then,
  ) = _$Sub2ApiUsageModelsCopyWithImpl;
  @useResult
  $Res call({
    List<Sub2ApiUsageModelStats> models,
    DateTime startDate,
    DateTime endDate,
  });
}

/// @nodoc
class _$Sub2ApiUsageModelsCopyWithImpl<$Res>
    implements $Sub2ApiUsageModelsCopyWith<$Res> {
  _$Sub2ApiUsageModelsCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageModels _self;
  final $Res Function(Sub2ApiUsageModels) _then;

  /// Create a copy of Sub2ApiUsageModels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? models = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(
      _self.copyWith(
        models: null == models
            ? _self.models
            : models // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiUsageModelStats>,
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

/// Adds pattern-matching-related methods to [Sub2ApiUsageModels].
extension Sub2ApiUsageModelsPatterns on Sub2ApiUsageModels {
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
    TResult Function(_Sub2ApiUsageModels value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageModels() when $default != null:
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
    TResult Function(_Sub2ApiUsageModels value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageModels():
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
    TResult? Function(_Sub2ApiUsageModels value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageModels() when $default != null:
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
      List<Sub2ApiUsageModelStats> models,
      DateTime startDate,
      DateTime endDate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageModels() when $default != null:
        return $default(_that.models, _that.startDate, _that.endDate);
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
      List<Sub2ApiUsageModelStats> models,
      DateTime startDate,
      DateTime endDate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageModels():
        return $default(_that.models, _that.startDate, _that.endDate);
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
      List<Sub2ApiUsageModelStats> models,
      DateTime startDate,
      DateTime endDate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageModels() when $default != null:
        return $default(_that.models, _that.startDate, _that.endDate);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUsageModels implements Sub2ApiUsageModels {
  const _Sub2ApiUsageModels({
    required final List<Sub2ApiUsageModelStats> models,
    required this.startDate,
    required this.endDate,
  }) : _models = models;

  final List<Sub2ApiUsageModelStats> _models;
  @override
  List<Sub2ApiUsageModelStats> get models {
    if (_models is EqualUnmodifiableListView) return _models;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_models);
  }

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  /// Create a copy of Sub2ApiUsageModels
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageModelsCopyWith<_Sub2ApiUsageModels> get copyWith =>
      __$Sub2ApiUsageModelsCopyWithImpl<_Sub2ApiUsageModels>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageModels &&
            const DeepCollectionEquality().equals(other._models, _models) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_models),
    startDate,
    endDate,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageModels(models: $models, startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageModelsCopyWith<$Res>
    implements $Sub2ApiUsageModelsCopyWith<$Res> {
  factory _$Sub2ApiUsageModelsCopyWith(
    _Sub2ApiUsageModels value,
    $Res Function(_Sub2ApiUsageModels) _then,
  ) = __$Sub2ApiUsageModelsCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<Sub2ApiUsageModelStats> models,
    DateTime startDate,
    DateTime endDate,
  });
}

/// @nodoc
class __$Sub2ApiUsageModelsCopyWithImpl<$Res>
    implements _$Sub2ApiUsageModelsCopyWith<$Res> {
  __$Sub2ApiUsageModelsCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageModels _self;
  final $Res Function(_Sub2ApiUsageModels) _then;

  /// Create a copy of Sub2ApiUsageModels
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? models = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(
      _Sub2ApiUsageModels(
        models: null == models
            ? _self._models
            : models // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiUsageModelStats>,
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

/// @nodoc
mixin _$Sub2ApiUsageGroupStats {
  int get groupId;
  String get groupName;
  int get requests;
  int get totalTokens;
  Sub2ApiDecimal get cost;
  Sub2ApiDecimal get actualCost;

  /// Create a copy of Sub2ApiUsageGroupStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageGroupStatsCopyWith<Sub2ApiUsageGroupStats> get copyWith =>
      _$Sub2ApiUsageGroupStatsCopyWithImpl<Sub2ApiUsageGroupStats>(
        this as Sub2ApiUsageGroupStats,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageGroupStats &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.requests, requests) ||
                other.requests == requests) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.actualCost, actualCost) ||
                other.actualCost == actualCost));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    groupId,
    groupName,
    requests,
    totalTokens,
    cost,
    actualCost,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageGroupStats(groupId: $groupId, groupName: $groupName, requests: $requests, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageGroupStatsCopyWith<$Res> {
  factory $Sub2ApiUsageGroupStatsCopyWith(
    Sub2ApiUsageGroupStats value,
    $Res Function(Sub2ApiUsageGroupStats) _then,
  ) = _$Sub2ApiUsageGroupStatsCopyWithImpl;
  @useResult
  $Res call({
    int groupId,
    String groupName,
    int requests,
    int totalTokens,
    Sub2ApiDecimal cost,
    Sub2ApiDecimal actualCost,
  });
}

/// @nodoc
class _$Sub2ApiUsageGroupStatsCopyWithImpl<$Res>
    implements $Sub2ApiUsageGroupStatsCopyWith<$Res> {
  _$Sub2ApiUsageGroupStatsCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageGroupStats _self;
  final $Res Function(Sub2ApiUsageGroupStats) _then;

  /// Create a copy of Sub2ApiUsageGroupStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? groupName = null,
    Object? requests = null,
    Object? totalTokens = null,
    Object? cost = null,
    Object? actualCost = null,
  }) {
    return _then(
      _self.copyWith(
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int,
        groupName: null == groupName
            ? _self.groupName
            : groupName // ignore: cast_nullable_to_non_nullable
                  as String,
        requests: null == requests
            ? _self.requests
            : requests // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [Sub2ApiUsageGroupStats].
extension Sub2ApiUsageGroupStatsPatterns on Sub2ApiUsageGroupStats {
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
    TResult Function(_Sub2ApiUsageGroupStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageGroupStats() when $default != null:
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
    TResult Function(_Sub2ApiUsageGroupStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageGroupStats():
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
    TResult? Function(_Sub2ApiUsageGroupStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageGroupStats() when $default != null:
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
      int groupId,
      String groupName,
      int requests,
      int totalTokens,
      Sub2ApiDecimal cost,
      Sub2ApiDecimal actualCost,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageGroupStats() when $default != null:
        return $default(
          _that.groupId,
          _that.groupName,
          _that.requests,
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
      int groupId,
      String groupName,
      int requests,
      int totalTokens,
      Sub2ApiDecimal cost,
      Sub2ApiDecimal actualCost,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageGroupStats():
        return $default(
          _that.groupId,
          _that.groupName,
          _that.requests,
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
      int groupId,
      String groupName,
      int requests,
      int totalTokens,
      Sub2ApiDecimal cost,
      Sub2ApiDecimal actualCost,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageGroupStats() when $default != null:
        return $default(
          _that.groupId,
          _that.groupName,
          _that.requests,
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

class _Sub2ApiUsageGroupStats implements Sub2ApiUsageGroupStats {
  const _Sub2ApiUsageGroupStats({
    required this.groupId,
    required this.groupName,
    required this.requests,
    required this.totalTokens,
    required this.cost,
    required this.actualCost,
  });

  @override
  final int groupId;
  @override
  final String groupName;
  @override
  final int requests;
  @override
  final int totalTokens;
  @override
  final Sub2ApiDecimal cost;
  @override
  final Sub2ApiDecimal actualCost;

  /// Create a copy of Sub2ApiUsageGroupStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageGroupStatsCopyWith<_Sub2ApiUsageGroupStats> get copyWith =>
      __$Sub2ApiUsageGroupStatsCopyWithImpl<_Sub2ApiUsageGroupStats>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageGroupStats &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.requests, requests) ||
                other.requests == requests) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.actualCost, actualCost) ||
                other.actualCost == actualCost));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    groupId,
    groupName,
    requests,
    totalTokens,
    cost,
    actualCost,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageGroupStats(groupId: $groupId, groupName: $groupName, requests: $requests, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageGroupStatsCopyWith<$Res>
    implements $Sub2ApiUsageGroupStatsCopyWith<$Res> {
  factory _$Sub2ApiUsageGroupStatsCopyWith(
    _Sub2ApiUsageGroupStats value,
    $Res Function(_Sub2ApiUsageGroupStats) _then,
  ) = __$Sub2ApiUsageGroupStatsCopyWithImpl;
  @override
  @useResult
  $Res call({
    int groupId,
    String groupName,
    int requests,
    int totalTokens,
    Sub2ApiDecimal cost,
    Sub2ApiDecimal actualCost,
  });
}

/// @nodoc
class __$Sub2ApiUsageGroupStatsCopyWithImpl<$Res>
    implements _$Sub2ApiUsageGroupStatsCopyWith<$Res> {
  __$Sub2ApiUsageGroupStatsCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageGroupStats _self;
  final $Res Function(_Sub2ApiUsageGroupStats) _then;

  /// Create a copy of Sub2ApiUsageGroupStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? groupId = null,
    Object? groupName = null,
    Object? requests = null,
    Object? totalTokens = null,
    Object? cost = null,
    Object? actualCost = null,
  }) {
    return _then(
      _Sub2ApiUsageGroupStats(
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int,
        groupName: null == groupName
            ? _self.groupName
            : groupName // ignore: cast_nullable_to_non_nullable
                  as String,
        requests: null == requests
            ? _self.requests
            : requests // ignore: cast_nullable_to_non_nullable
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
mixin _$Sub2ApiUsageDashboardSnapshotRequest {
  Sub2ApiUsageDashboardQuery get query;
  bool get includeTrend;
  bool get includeModelStats;
  bool get includeGroupStats;

  /// Create a copy of Sub2ApiUsageDashboardSnapshotRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageDashboardSnapshotRequestCopyWith<
    Sub2ApiUsageDashboardSnapshotRequest
  >
  get copyWith =>
      _$Sub2ApiUsageDashboardSnapshotRequestCopyWithImpl<
        Sub2ApiUsageDashboardSnapshotRequest
      >(this as Sub2ApiUsageDashboardSnapshotRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageDashboardSnapshotRequest &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.includeTrend, includeTrend) ||
                other.includeTrend == includeTrend) &&
            (identical(other.includeModelStats, includeModelStats) ||
                other.includeModelStats == includeModelStats) &&
            (identical(other.includeGroupStats, includeGroupStats) ||
                other.includeGroupStats == includeGroupStats));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    query,
    includeTrend,
    includeModelStats,
    includeGroupStats,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageDashboardSnapshotRequest(query: $query, includeTrend: $includeTrend, includeModelStats: $includeModelStats, includeGroupStats: $includeGroupStats)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageDashboardSnapshotRequestCopyWith<$Res> {
  factory $Sub2ApiUsageDashboardSnapshotRequestCopyWith(
    Sub2ApiUsageDashboardSnapshotRequest value,
    $Res Function(Sub2ApiUsageDashboardSnapshotRequest) _then,
  ) = _$Sub2ApiUsageDashboardSnapshotRequestCopyWithImpl;
  @useResult
  $Res call({
    Sub2ApiUsageDashboardQuery query,
    bool includeTrend,
    bool includeModelStats,
    bool includeGroupStats,
  });

  $Sub2ApiUsageDashboardQueryCopyWith<$Res> get query;
}

/// @nodoc
class _$Sub2ApiUsageDashboardSnapshotRequestCopyWithImpl<$Res>
    implements $Sub2ApiUsageDashboardSnapshotRequestCopyWith<$Res> {
  _$Sub2ApiUsageDashboardSnapshotRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageDashboardSnapshotRequest _self;
  final $Res Function(Sub2ApiUsageDashboardSnapshotRequest) _then;

  /// Create a copy of Sub2ApiUsageDashboardSnapshotRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? includeTrend = null,
    Object? includeModelStats = null,
    Object? includeGroupStats = null,
  }) {
    return _then(
      _self.copyWith(
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiUsageDashboardQuery,
        includeTrend: null == includeTrend
            ? _self.includeTrend
            : includeTrend // ignore: cast_nullable_to_non_nullable
                  as bool,
        includeModelStats: null == includeModelStats
            ? _self.includeModelStats
            : includeModelStats // ignore: cast_nullable_to_non_nullable
                  as bool,
        includeGroupStats: null == includeGroupStats
            ? _self.includeGroupStats
            : includeGroupStats // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of Sub2ApiUsageDashboardSnapshotRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageDashboardQueryCopyWith<$Res> get query {
    return $Sub2ApiUsageDashboardQueryCopyWith<$Res>(_self.query, (value) {
      return _then(_self.copyWith(query: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUsageDashboardSnapshotRequest].
extension Sub2ApiUsageDashboardSnapshotRequestPatterns
    on Sub2ApiUsageDashboardSnapshotRequest {
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
    TResult Function(_Sub2ApiUsageDashboardSnapshotRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardSnapshotRequest() when $default != null:
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
    TResult Function(_Sub2ApiUsageDashboardSnapshotRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardSnapshotRequest():
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
    TResult? Function(_Sub2ApiUsageDashboardSnapshotRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardSnapshotRequest() when $default != null:
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
      Sub2ApiUsageDashboardQuery query,
      bool includeTrend,
      bool includeModelStats,
      bool includeGroupStats,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardSnapshotRequest() when $default != null:
        return $default(
          _that.query,
          _that.includeTrend,
          _that.includeModelStats,
          _that.includeGroupStats,
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
      Sub2ApiUsageDashboardQuery query,
      bool includeTrend,
      bool includeModelStats,
      bool includeGroupStats,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardSnapshotRequest():
        return $default(
          _that.query,
          _that.includeTrend,
          _that.includeModelStats,
          _that.includeGroupStats,
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
      Sub2ApiUsageDashboardQuery query,
      bool includeTrend,
      bool includeModelStats,
      bool includeGroupStats,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardSnapshotRequest() when $default != null:
        return $default(
          _that.query,
          _that.includeTrend,
          _that.includeModelStats,
          _that.includeGroupStats,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUsageDashboardSnapshotRequest
    implements Sub2ApiUsageDashboardSnapshotRequest {
  const _Sub2ApiUsageDashboardSnapshotRequest({
    this.query = const Sub2ApiUsageDashboardQuery(),
    this.includeTrend = true,
    this.includeModelStats = true,
    this.includeGroupStats = false,
  });

  @override
  @JsonKey()
  final Sub2ApiUsageDashboardQuery query;
  @override
  @JsonKey()
  final bool includeTrend;
  @override
  @JsonKey()
  final bool includeModelStats;
  @override
  @JsonKey()
  final bool includeGroupStats;

  /// Create a copy of Sub2ApiUsageDashboardSnapshotRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageDashboardSnapshotRequestCopyWith<
    _Sub2ApiUsageDashboardSnapshotRequest
  >
  get copyWith =>
      __$Sub2ApiUsageDashboardSnapshotRequestCopyWithImpl<
        _Sub2ApiUsageDashboardSnapshotRequest
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageDashboardSnapshotRequest &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.includeTrend, includeTrend) ||
                other.includeTrend == includeTrend) &&
            (identical(other.includeModelStats, includeModelStats) ||
                other.includeModelStats == includeModelStats) &&
            (identical(other.includeGroupStats, includeGroupStats) ||
                other.includeGroupStats == includeGroupStats));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    query,
    includeTrend,
    includeModelStats,
    includeGroupStats,
  );

  @override
  String toString() {
    return 'Sub2ApiUsageDashboardSnapshotRequest(query: $query, includeTrend: $includeTrend, includeModelStats: $includeModelStats, includeGroupStats: $includeGroupStats)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageDashboardSnapshotRequestCopyWith<$Res>
    implements $Sub2ApiUsageDashboardSnapshotRequestCopyWith<$Res> {
  factory _$Sub2ApiUsageDashboardSnapshotRequestCopyWith(
    _Sub2ApiUsageDashboardSnapshotRequest value,
    $Res Function(_Sub2ApiUsageDashboardSnapshotRequest) _then,
  ) = __$Sub2ApiUsageDashboardSnapshotRequestCopyWithImpl;
  @override
  @useResult
  $Res call({
    Sub2ApiUsageDashboardQuery query,
    bool includeTrend,
    bool includeModelStats,
    bool includeGroupStats,
  });

  @override
  $Sub2ApiUsageDashboardQueryCopyWith<$Res> get query;
}

/// @nodoc
class __$Sub2ApiUsageDashboardSnapshotRequestCopyWithImpl<$Res>
    implements _$Sub2ApiUsageDashboardSnapshotRequestCopyWith<$Res> {
  __$Sub2ApiUsageDashboardSnapshotRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageDashboardSnapshotRequest _self;
  final $Res Function(_Sub2ApiUsageDashboardSnapshotRequest) _then;

  /// Create a copy of Sub2ApiUsageDashboardSnapshotRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? includeTrend = null,
    Object? includeModelStats = null,
    Object? includeGroupStats = null,
  }) {
    return _then(
      _Sub2ApiUsageDashboardSnapshotRequest(
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiUsageDashboardQuery,
        includeTrend: null == includeTrend
            ? _self.includeTrend
            : includeTrend // ignore: cast_nullable_to_non_nullable
                  as bool,
        includeModelStats: null == includeModelStats
            ? _self.includeModelStats
            : includeModelStats // ignore: cast_nullable_to_non_nullable
                  as bool,
        includeGroupStats: null == includeGroupStats
            ? _self.includeGroupStats
            : includeGroupStats // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of Sub2ApiUsageDashboardSnapshotRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageDashboardQueryCopyWith<$Res> get query {
    return $Sub2ApiUsageDashboardQueryCopyWith<$Res>(_self.query, (value) {
      return _then(_self.copyWith(query: value));
    });
  }
}

/// @nodoc
mixin _$Sub2ApiUsageDashboardSnapshot {
  DateTime get generatedAt;
  DateTime get startDate;
  DateTime get endDate;
  Sub2ApiUsageGranularity get granularity;
  List<Sub2ApiUsageTrendPoint>? get trend;
  List<Sub2ApiUsageModelStats>? get models;
  List<Sub2ApiUsageGroupStats>? get groups;

  /// Create a copy of Sub2ApiUsageDashboardSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageDashboardSnapshotCopyWith<Sub2ApiUsageDashboardSnapshot>
  get copyWith =>
      _$Sub2ApiUsageDashboardSnapshotCopyWithImpl<
        Sub2ApiUsageDashboardSnapshot
      >(this as Sub2ApiUsageDashboardSnapshot, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageDashboardSnapshot &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.granularity, granularity) ||
                other.granularity == granularity) &&
            const DeepCollectionEquality().equals(other.trend, trend) &&
            const DeepCollectionEquality().equals(other.models, models) &&
            const DeepCollectionEquality().equals(other.groups, groups));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    generatedAt,
    startDate,
    endDate,
    granularity,
    const DeepCollectionEquality().hash(trend),
    const DeepCollectionEquality().hash(models),
    const DeepCollectionEquality().hash(groups),
  );

  @override
  String toString() {
    return 'Sub2ApiUsageDashboardSnapshot(generatedAt: $generatedAt, startDate: $startDate, endDate: $endDate, granularity: $granularity, trend: $trend, models: $models, groups: $groups)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageDashboardSnapshotCopyWith<$Res> {
  factory $Sub2ApiUsageDashboardSnapshotCopyWith(
    Sub2ApiUsageDashboardSnapshot value,
    $Res Function(Sub2ApiUsageDashboardSnapshot) _then,
  ) = _$Sub2ApiUsageDashboardSnapshotCopyWithImpl;
  @useResult
  $Res call({
    DateTime generatedAt,
    DateTime startDate,
    DateTime endDate,
    Sub2ApiUsageGranularity granularity,
    List<Sub2ApiUsageTrendPoint>? trend,
    List<Sub2ApiUsageModelStats>? models,
    List<Sub2ApiUsageGroupStats>? groups,
  });
}

/// @nodoc
class _$Sub2ApiUsageDashboardSnapshotCopyWithImpl<$Res>
    implements $Sub2ApiUsageDashboardSnapshotCopyWith<$Res> {
  _$Sub2ApiUsageDashboardSnapshotCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageDashboardSnapshot _self;
  final $Res Function(Sub2ApiUsageDashboardSnapshot) _then;

  /// Create a copy of Sub2ApiUsageDashboardSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedAt = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? granularity = null,
    Object? trend = freezed,
    Object? models = freezed,
    Object? groups = freezed,
  }) {
    return _then(
      _self.copyWith(
        generatedAt: null == generatedAt
            ? _self.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        startDate: null == startDate
            ? _self.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _self.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        granularity: null == granularity
            ? _self.granularity
            : granularity // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiUsageGranularity,
        trend: freezed == trend
            ? _self.trend
            : trend // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiUsageTrendPoint>?,
        models: freezed == models
            ? _self.models
            : models // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiUsageModelStats>?,
        groups: freezed == groups
            ? _self.groups
            : groups // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiUsageGroupStats>?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUsageDashboardSnapshot].
extension Sub2ApiUsageDashboardSnapshotPatterns
    on Sub2ApiUsageDashboardSnapshot {
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
    TResult Function(_Sub2ApiUsageDashboardSnapshot value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardSnapshot() when $default != null:
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
    TResult Function(_Sub2ApiUsageDashboardSnapshot value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardSnapshot():
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
    TResult? Function(_Sub2ApiUsageDashboardSnapshot value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardSnapshot() when $default != null:
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
      DateTime generatedAt,
      DateTime startDate,
      DateTime endDate,
      Sub2ApiUsageGranularity granularity,
      List<Sub2ApiUsageTrendPoint>? trend,
      List<Sub2ApiUsageModelStats>? models,
      List<Sub2ApiUsageGroupStats>? groups,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardSnapshot() when $default != null:
        return $default(
          _that.generatedAt,
          _that.startDate,
          _that.endDate,
          _that.granularity,
          _that.trend,
          _that.models,
          _that.groups,
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
      DateTime generatedAt,
      DateTime startDate,
      DateTime endDate,
      Sub2ApiUsageGranularity granularity,
      List<Sub2ApiUsageTrendPoint>? trend,
      List<Sub2ApiUsageModelStats>? models,
      List<Sub2ApiUsageGroupStats>? groups,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardSnapshot():
        return $default(
          _that.generatedAt,
          _that.startDate,
          _that.endDate,
          _that.granularity,
          _that.trend,
          _that.models,
          _that.groups,
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
      DateTime generatedAt,
      DateTime startDate,
      DateTime endDate,
      Sub2ApiUsageGranularity granularity,
      List<Sub2ApiUsageTrendPoint>? trend,
      List<Sub2ApiUsageModelStats>? models,
      List<Sub2ApiUsageGroupStats>? groups,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageDashboardSnapshot() when $default != null:
        return $default(
          _that.generatedAt,
          _that.startDate,
          _that.endDate,
          _that.granularity,
          _that.trend,
          _that.models,
          _that.groups,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUsageDashboardSnapshot implements Sub2ApiUsageDashboardSnapshot {
  const _Sub2ApiUsageDashboardSnapshot({
    required this.generatedAt,
    required this.startDate,
    required this.endDate,
    required this.granularity,
    final List<Sub2ApiUsageTrendPoint>? trend,
    final List<Sub2ApiUsageModelStats>? models,
    final List<Sub2ApiUsageGroupStats>? groups,
  }) : _trend = trend,
       _models = models,
       _groups = groups;

  @override
  final DateTime generatedAt;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final Sub2ApiUsageGranularity granularity;
  final List<Sub2ApiUsageTrendPoint>? _trend;
  @override
  List<Sub2ApiUsageTrendPoint>? get trend {
    final value = _trend;
    if (value == null) return null;
    if (_trend is EqualUnmodifiableListView) return _trend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Sub2ApiUsageModelStats>? _models;
  @override
  List<Sub2ApiUsageModelStats>? get models {
    final value = _models;
    if (value == null) return null;
    if (_models is EqualUnmodifiableListView) return _models;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Sub2ApiUsageGroupStats>? _groups;
  @override
  List<Sub2ApiUsageGroupStats>? get groups {
    final value = _groups;
    if (value == null) return null;
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Sub2ApiUsageDashboardSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageDashboardSnapshotCopyWith<_Sub2ApiUsageDashboardSnapshot>
  get copyWith =>
      __$Sub2ApiUsageDashboardSnapshotCopyWithImpl<
        _Sub2ApiUsageDashboardSnapshot
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageDashboardSnapshot &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.granularity, granularity) ||
                other.granularity == granularity) &&
            const DeepCollectionEquality().equals(other._trend, _trend) &&
            const DeepCollectionEquality().equals(other._models, _models) &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    generatedAt,
    startDate,
    endDate,
    granularity,
    const DeepCollectionEquality().hash(_trend),
    const DeepCollectionEquality().hash(_models),
    const DeepCollectionEquality().hash(_groups),
  );

  @override
  String toString() {
    return 'Sub2ApiUsageDashboardSnapshot(generatedAt: $generatedAt, startDate: $startDate, endDate: $endDate, granularity: $granularity, trend: $trend, models: $models, groups: $groups)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageDashboardSnapshotCopyWith<$Res>
    implements $Sub2ApiUsageDashboardSnapshotCopyWith<$Res> {
  factory _$Sub2ApiUsageDashboardSnapshotCopyWith(
    _Sub2ApiUsageDashboardSnapshot value,
    $Res Function(_Sub2ApiUsageDashboardSnapshot) _then,
  ) = __$Sub2ApiUsageDashboardSnapshotCopyWithImpl;
  @override
  @useResult
  $Res call({
    DateTime generatedAt,
    DateTime startDate,
    DateTime endDate,
    Sub2ApiUsageGranularity granularity,
    List<Sub2ApiUsageTrendPoint>? trend,
    List<Sub2ApiUsageModelStats>? models,
    List<Sub2ApiUsageGroupStats>? groups,
  });
}

/// @nodoc
class __$Sub2ApiUsageDashboardSnapshotCopyWithImpl<$Res>
    implements _$Sub2ApiUsageDashboardSnapshotCopyWith<$Res> {
  __$Sub2ApiUsageDashboardSnapshotCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageDashboardSnapshot _self;
  final $Res Function(_Sub2ApiUsageDashboardSnapshot) _then;

  /// Create a copy of Sub2ApiUsageDashboardSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? generatedAt = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? granularity = null,
    Object? trend = freezed,
    Object? models = freezed,
    Object? groups = freezed,
  }) {
    return _then(
      _Sub2ApiUsageDashboardSnapshot(
        generatedAt: null == generatedAt
            ? _self.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        startDate: null == startDate
            ? _self.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _self.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        granularity: null == granularity
            ? _self.granularity
            : granularity // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiUsageGranularity,
        trend: freezed == trend
            ? _self._trend
            : trend // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiUsageTrendPoint>?,
        models: freezed == models
            ? _self._models
            : models // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiUsageModelStats>?,
        groups: freezed == groups
            ? _self._groups
            : groups // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiUsageGroupStats>?,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiUsageApiKeyStats {
  int get apiKeyId;
  Sub2ApiDecimal get todayActualCost;
  Sub2ApiDecimal get totalActualCost;

  /// Create a copy of Sub2ApiUsageApiKeyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUsageApiKeyStatsCopyWith<Sub2ApiUsageApiKeyStats> get copyWith =>
      _$Sub2ApiUsageApiKeyStatsCopyWithImpl<Sub2ApiUsageApiKeyStats>(
        this as Sub2ApiUsageApiKeyStats,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUsageApiKeyStats &&
            (identical(other.apiKeyId, apiKeyId) ||
                other.apiKeyId == apiKeyId) &&
            (identical(other.todayActualCost, todayActualCost) ||
                other.todayActualCost == todayActualCost) &&
            (identical(other.totalActualCost, totalActualCost) ||
                other.totalActualCost == totalActualCost));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, apiKeyId, todayActualCost, totalActualCost);

  @override
  String toString() {
    return 'Sub2ApiUsageApiKeyStats(apiKeyId: $apiKeyId, todayActualCost: $todayActualCost, totalActualCost: $totalActualCost)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUsageApiKeyStatsCopyWith<$Res> {
  factory $Sub2ApiUsageApiKeyStatsCopyWith(
    Sub2ApiUsageApiKeyStats value,
    $Res Function(Sub2ApiUsageApiKeyStats) _then,
  ) = _$Sub2ApiUsageApiKeyStatsCopyWithImpl;
  @useResult
  $Res call({
    int apiKeyId,
    Sub2ApiDecimal todayActualCost,
    Sub2ApiDecimal totalActualCost,
  });
}

/// @nodoc
class _$Sub2ApiUsageApiKeyStatsCopyWithImpl<$Res>
    implements $Sub2ApiUsageApiKeyStatsCopyWith<$Res> {
  _$Sub2ApiUsageApiKeyStatsCopyWithImpl(this._self, this._then);

  final Sub2ApiUsageApiKeyStats _self;
  final $Res Function(Sub2ApiUsageApiKeyStats) _then;

  /// Create a copy of Sub2ApiUsageApiKeyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKeyId = null,
    Object? todayActualCost = null,
    Object? totalActualCost = null,
  }) {
    return _then(
      _self.copyWith(
        apiKeyId: null == apiKeyId
            ? _self.apiKeyId
            : apiKeyId // ignore: cast_nullable_to_non_nullable
                  as int,
        todayActualCost: null == todayActualCost
            ? _self.todayActualCost
            : todayActualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        totalActualCost: null == totalActualCost
            ? _self.totalActualCost
            : totalActualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUsageApiKeyStats].
extension Sub2ApiUsageApiKeyStatsPatterns on Sub2ApiUsageApiKeyStats {
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
    TResult Function(_Sub2ApiUsageApiKeyStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageApiKeyStats() when $default != null:
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
    TResult Function(_Sub2ApiUsageApiKeyStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageApiKeyStats():
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
    TResult? Function(_Sub2ApiUsageApiKeyStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageApiKeyStats() when $default != null:
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
      int apiKeyId,
      Sub2ApiDecimal todayActualCost,
      Sub2ApiDecimal totalActualCost,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageApiKeyStats() when $default != null:
        return $default(
          _that.apiKeyId,
          _that.todayActualCost,
          _that.totalActualCost,
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
      int apiKeyId,
      Sub2ApiDecimal todayActualCost,
      Sub2ApiDecimal totalActualCost,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageApiKeyStats():
        return $default(
          _that.apiKeyId,
          _that.todayActualCost,
          _that.totalActualCost,
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
      int apiKeyId,
      Sub2ApiDecimal todayActualCost,
      Sub2ApiDecimal totalActualCost,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUsageApiKeyStats() when $default != null:
        return $default(
          _that.apiKeyId,
          _that.todayActualCost,
          _that.totalActualCost,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUsageApiKeyStats implements Sub2ApiUsageApiKeyStats {
  const _Sub2ApiUsageApiKeyStats({
    required this.apiKeyId,
    required this.todayActualCost,
    required this.totalActualCost,
  });

  @override
  final int apiKeyId;
  @override
  final Sub2ApiDecimal todayActualCost;
  @override
  final Sub2ApiDecimal totalActualCost;

  /// Create a copy of Sub2ApiUsageApiKeyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUsageApiKeyStatsCopyWith<_Sub2ApiUsageApiKeyStats> get copyWith =>
      __$Sub2ApiUsageApiKeyStatsCopyWithImpl<_Sub2ApiUsageApiKeyStats>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUsageApiKeyStats &&
            (identical(other.apiKeyId, apiKeyId) ||
                other.apiKeyId == apiKeyId) &&
            (identical(other.todayActualCost, todayActualCost) ||
                other.todayActualCost == todayActualCost) &&
            (identical(other.totalActualCost, totalActualCost) ||
                other.totalActualCost == totalActualCost));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, apiKeyId, todayActualCost, totalActualCost);

  @override
  String toString() {
    return 'Sub2ApiUsageApiKeyStats(apiKeyId: $apiKeyId, todayActualCost: $todayActualCost, totalActualCost: $totalActualCost)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUsageApiKeyStatsCopyWith<$Res>
    implements $Sub2ApiUsageApiKeyStatsCopyWith<$Res> {
  factory _$Sub2ApiUsageApiKeyStatsCopyWith(
    _Sub2ApiUsageApiKeyStats value,
    $Res Function(_Sub2ApiUsageApiKeyStats) _then,
  ) = __$Sub2ApiUsageApiKeyStatsCopyWithImpl;
  @override
  @useResult
  $Res call({
    int apiKeyId,
    Sub2ApiDecimal todayActualCost,
    Sub2ApiDecimal totalActualCost,
  });
}

/// @nodoc
class __$Sub2ApiUsageApiKeyStatsCopyWithImpl<$Res>
    implements _$Sub2ApiUsageApiKeyStatsCopyWith<$Res> {
  __$Sub2ApiUsageApiKeyStatsCopyWithImpl(this._self, this._then);

  final _Sub2ApiUsageApiKeyStats _self;
  final $Res Function(_Sub2ApiUsageApiKeyStats) _then;

  /// Create a copy of Sub2ApiUsageApiKeyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? apiKeyId = null,
    Object? todayActualCost = null,
    Object? totalActualCost = null,
  }) {
    return _then(
      _Sub2ApiUsageApiKeyStats(
        apiKeyId: null == apiKeyId
            ? _self.apiKeyId
            : apiKeyId // ignore: cast_nullable_to_non_nullable
                  as int,
        todayActualCost: null == todayActualCost
            ? _self.todayActualCost
            : todayActualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        totalActualCost: null == totalActualCost
            ? _self.totalActualCost
            : totalActualCost // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
      ),
    );
  }
}
