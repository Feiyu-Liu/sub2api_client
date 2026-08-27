// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_admin_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sub2ApiAdminDashboardFilter {

 DateTime? get startDate; DateTime? get endDate; String? get timezone; int? get userId; int? get apiKeyId; int? get accountId; int? get groupId; Sub2ApiAdminUsageRequestType? get requestType; bool? get stream; Sub2ApiAdminBillingType? get billingType; bool? get upstreamModelMismatch;
/// Create a copy of Sub2ApiAdminDashboardFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardFilterCopyWith<Sub2ApiAdminDashboardFilter> get copyWith => _$Sub2ApiAdminDashboardFilterCopyWithImpl<Sub2ApiAdminDashboardFilter>(this as Sub2ApiAdminDashboardFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminDashboardFilter&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.apiKeyId, apiKeyId) || other.apiKeyId == apiKeyId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.upstreamModelMismatch, upstreamModelMismatch) || other.upstreamModelMismatch == upstreamModelMismatch));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,timezone,userId,apiKeyId,accountId,groupId,requestType,stream,billingType,upstreamModelMismatch);

@override
String toString() {
  return 'Sub2ApiAdminDashboardFilter(startDate: $startDate, endDate: $endDate, timezone: $timezone, userId: $userId, apiKeyId: $apiKeyId, accountId: $accountId, groupId: $groupId, requestType: $requestType, stream: $stream, billingType: $billingType, upstreamModelMismatch: $upstreamModelMismatch)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminDashboardFilterCopyWith<$Res>  {
  factory $Sub2ApiAdminDashboardFilterCopyWith(Sub2ApiAdminDashboardFilter value, $Res Function(Sub2ApiAdminDashboardFilter) _then) = _$Sub2ApiAdminDashboardFilterCopyWithImpl;
@useResult
$Res call({
 DateTime? startDate, DateTime? endDate, String? timezone, int? userId, int? apiKeyId, int? accountId, int? groupId, Sub2ApiAdminUsageRequestType? requestType, bool? stream, Sub2ApiAdminBillingType? billingType, bool? upstreamModelMismatch
});




}
/// @nodoc
class _$Sub2ApiAdminDashboardFilterCopyWithImpl<$Res>
    implements $Sub2ApiAdminDashboardFilterCopyWith<$Res> {
  _$Sub2ApiAdminDashboardFilterCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminDashboardFilter _self;
  final $Res Function(Sub2ApiAdminDashboardFilter) _then;

/// Create a copy of Sub2ApiAdminDashboardFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = freezed,Object? endDate = freezed,Object? timezone = freezed,Object? userId = freezed,Object? apiKeyId = freezed,Object? accountId = freezed,Object? groupId = freezed,Object? requestType = freezed,Object? stream = freezed,Object? billingType = freezed,Object? upstreamModelMismatch = freezed,}) {
  return _then(_self.copyWith(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,apiKeyId: freezed == apiKeyId ? _self.apiKeyId : apiKeyId // ignore: cast_nullable_to_non_nullable
as int?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,requestType: freezed == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageRequestType?,stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool?,billingType: freezed == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminBillingType?,upstreamModelMismatch: freezed == upstreamModelMismatch ? _self.upstreamModelMismatch : upstreamModelMismatch // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminDashboardFilter].
extension Sub2ApiAdminDashboardFilterPatterns on Sub2ApiAdminDashboardFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardFilter() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardFilter value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardFilter():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminDashboardFilter value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardFilter() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? startDate,  DateTime? endDate,  String? timezone,  int? userId,  int? apiKeyId,  int? accountId,  int? groupId,  Sub2ApiAdminUsageRequestType? requestType,  bool? stream,  Sub2ApiAdminBillingType? billingType,  bool? upstreamModelMismatch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardFilter() when $default != null:
return $default(_that.startDate,_that.endDate,_that.timezone,_that.userId,_that.apiKeyId,_that.accountId,_that.groupId,_that.requestType,_that.stream,_that.billingType,_that.upstreamModelMismatch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? startDate,  DateTime? endDate,  String? timezone,  int? userId,  int? apiKeyId,  int? accountId,  int? groupId,  Sub2ApiAdminUsageRequestType? requestType,  bool? stream,  Sub2ApiAdminBillingType? billingType,  bool? upstreamModelMismatch)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardFilter():
return $default(_that.startDate,_that.endDate,_that.timezone,_that.userId,_that.apiKeyId,_that.accountId,_that.groupId,_that.requestType,_that.stream,_that.billingType,_that.upstreamModelMismatch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? startDate,  DateTime? endDate,  String? timezone,  int? userId,  int? apiKeyId,  int? accountId,  int? groupId,  Sub2ApiAdminUsageRequestType? requestType,  bool? stream,  Sub2ApiAdminBillingType? billingType,  bool? upstreamModelMismatch)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardFilter() when $default != null:
return $default(_that.startDate,_that.endDate,_that.timezone,_that.userId,_that.apiKeyId,_that.accountId,_that.groupId,_that.requestType,_that.stream,_that.billingType,_that.upstreamModelMismatch);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminDashboardFilter implements Sub2ApiAdminDashboardFilter {
  const _Sub2ApiAdminDashboardFilter({this.startDate, this.endDate, this.timezone, this.userId, this.apiKeyId, this.accountId, this.groupId, this.requestType, this.stream, this.billingType, this.upstreamModelMismatch});


@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  String? timezone;
@override final  int? userId;
@override final  int? apiKeyId;
@override final  int? accountId;
@override final  int? groupId;
@override final  Sub2ApiAdminUsageRequestType? requestType;
@override final  bool? stream;
@override final  Sub2ApiAdminBillingType? billingType;
@override final  bool? upstreamModelMismatch;

/// Create a copy of Sub2ApiAdminDashboardFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminDashboardFilterCopyWith<_Sub2ApiAdminDashboardFilter> get copyWith => __$Sub2ApiAdminDashboardFilterCopyWithImpl<_Sub2ApiAdminDashboardFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminDashboardFilter&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.apiKeyId, apiKeyId) || other.apiKeyId == apiKeyId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.upstreamModelMismatch, upstreamModelMismatch) || other.upstreamModelMismatch == upstreamModelMismatch));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,timezone,userId,apiKeyId,accountId,groupId,requestType,stream,billingType,upstreamModelMismatch);

@override
String toString() {
  return 'Sub2ApiAdminDashboardFilter(startDate: $startDate, endDate: $endDate, timezone: $timezone, userId: $userId, apiKeyId: $apiKeyId, accountId: $accountId, groupId: $groupId, requestType: $requestType, stream: $stream, billingType: $billingType, upstreamModelMismatch: $upstreamModelMismatch)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminDashboardFilterCopyWith<$Res> implements $Sub2ApiAdminDashboardFilterCopyWith<$Res> {
  factory _$Sub2ApiAdminDashboardFilterCopyWith(_Sub2ApiAdminDashboardFilter value, $Res Function(_Sub2ApiAdminDashboardFilter) _then) = __$Sub2ApiAdminDashboardFilterCopyWithImpl;
@override @useResult
$Res call({
 DateTime? startDate, DateTime? endDate, String? timezone, int? userId, int? apiKeyId, int? accountId, int? groupId, Sub2ApiAdminUsageRequestType? requestType, bool? stream, Sub2ApiAdminBillingType? billingType, bool? upstreamModelMismatch
});




}
/// @nodoc
class __$Sub2ApiAdminDashboardFilterCopyWithImpl<$Res>
    implements _$Sub2ApiAdminDashboardFilterCopyWith<$Res> {
  __$Sub2ApiAdminDashboardFilterCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminDashboardFilter _self;
  final $Res Function(_Sub2ApiAdminDashboardFilter) _then;

/// Create a copy of Sub2ApiAdminDashboardFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = freezed,Object? endDate = freezed,Object? timezone = freezed,Object? userId = freezed,Object? apiKeyId = freezed,Object? accountId = freezed,Object? groupId = freezed,Object? requestType = freezed,Object? stream = freezed,Object? billingType = freezed,Object? upstreamModelMismatch = freezed,}) {
  return _then(_Sub2ApiAdminDashboardFilter(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,apiKeyId: freezed == apiKeyId ? _self.apiKeyId : apiKeyId // ignore: cast_nullable_to_non_nullable
as int?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,requestType: freezed == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageRequestType?,stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool?,billingType: freezed == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminBillingType?,upstreamModelMismatch: freezed == upstreamModelMismatch ? _self.upstreamModelMismatch : upstreamModelMismatch // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUsageTrendQuery {

 Sub2ApiAdminDashboardFilter get filter; Sub2ApiAdminUsageGranularity get granularity; String? get model;
/// Create a copy of Sub2ApiAdminUsageTrendQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUsageTrendQueryCopyWith<Sub2ApiAdminUsageTrendQuery> get copyWith => _$Sub2ApiAdminUsageTrendQueryCopyWithImpl<Sub2ApiAdminUsageTrendQuery>(this as Sub2ApiAdminUsageTrendQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUsageTrendQuery&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.model, model) || other.model == model));
}


@override
int get hashCode => Object.hash(runtimeType,filter,granularity,model);

@override
String toString() {
  return 'Sub2ApiAdminUsageTrendQuery(filter: $filter, granularity: $granularity, model: $model)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUsageTrendQueryCopyWith<$Res>  {
  factory $Sub2ApiAdminUsageTrendQueryCopyWith(Sub2ApiAdminUsageTrendQuery value, $Res Function(Sub2ApiAdminUsageTrendQuery) _then) = _$Sub2ApiAdminUsageTrendQueryCopyWithImpl;
@useResult
$Res call({
 Sub2ApiAdminDashboardFilter filter, Sub2ApiAdminUsageGranularity granularity, String? model
});


$Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$Sub2ApiAdminUsageTrendQueryCopyWithImpl<$Res>
    implements $Sub2ApiAdminUsageTrendQueryCopyWith<$Res> {
  _$Sub2ApiAdminUsageTrendQueryCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUsageTrendQuery _self;
  final $Res Function(Sub2ApiAdminUsageTrendQuery) _then;

/// Create a copy of Sub2ApiAdminUsageTrendQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,Object? granularity = null,Object? model = freezed,}) {
  return _then(_self.copyWith(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminDashboardFilter,granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageGranularity,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Sub2ApiAdminUsageTrendQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter {

  return $Sub2ApiAdminDashboardFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUsageTrendQuery].
extension Sub2ApiAdminUsageTrendQueryPatterns on Sub2ApiAdminUsageTrendQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUsageTrendQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUsageTrendQuery() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUsageTrendQuery value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUsageTrendQuery():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUsageTrendQuery value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUsageTrendQuery() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiAdminDashboardFilter filter,  Sub2ApiAdminUsageGranularity granularity,  String? model)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUsageTrendQuery() when $default != null:
return $default(_that.filter,_that.granularity,_that.model);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiAdminDashboardFilter filter,  Sub2ApiAdminUsageGranularity granularity,  String? model)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUsageTrendQuery():
return $default(_that.filter,_that.granularity,_that.model);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiAdminDashboardFilter filter,  Sub2ApiAdminUsageGranularity granularity,  String? model)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUsageTrendQuery() when $default != null:
return $default(_that.filter,_that.granularity,_that.model);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUsageTrendQuery implements Sub2ApiAdminUsageTrendQuery {
  const _Sub2ApiAdminUsageTrendQuery({this.filter = const Sub2ApiAdminDashboardFilter(), this.granularity = Sub2ApiAdminUsageGranularity.day, this.model});


@override@JsonKey() final  Sub2ApiAdminDashboardFilter filter;
@override@JsonKey() final  Sub2ApiAdminUsageGranularity granularity;
@override final  String? model;

/// Create a copy of Sub2ApiAdminUsageTrendQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUsageTrendQueryCopyWith<_Sub2ApiAdminUsageTrendQuery> get copyWith => __$Sub2ApiAdminUsageTrendQueryCopyWithImpl<_Sub2ApiAdminUsageTrendQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUsageTrendQuery&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.model, model) || other.model == model));
}


@override
int get hashCode => Object.hash(runtimeType,filter,granularity,model);

@override
String toString() {
  return 'Sub2ApiAdminUsageTrendQuery(filter: $filter, granularity: $granularity, model: $model)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUsageTrendQueryCopyWith<$Res> implements $Sub2ApiAdminUsageTrendQueryCopyWith<$Res> {
  factory _$Sub2ApiAdminUsageTrendQueryCopyWith(_Sub2ApiAdminUsageTrendQuery value, $Res Function(_Sub2ApiAdminUsageTrendQuery) _then) = __$Sub2ApiAdminUsageTrendQueryCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiAdminDashboardFilter filter, Sub2ApiAdminUsageGranularity granularity, String? model
});


@override $Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter;

}
/// @nodoc
class __$Sub2ApiAdminUsageTrendQueryCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUsageTrendQueryCopyWith<$Res> {
  __$Sub2ApiAdminUsageTrendQueryCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUsageTrendQuery _self;
  final $Res Function(_Sub2ApiAdminUsageTrendQuery) _then;

/// Create a copy of Sub2ApiAdminUsageTrendQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,Object? granularity = null,Object? model = freezed,}) {
  return _then(_Sub2ApiAdminUsageTrendQuery(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminDashboardFilter,granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageGranularity,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Sub2ApiAdminUsageTrendQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter {

  return $Sub2ApiAdminDashboardFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc
mixin _$Sub2ApiAdminModelStatsQuery {

 Sub2ApiAdminDashboardFilter get filter; Sub2ApiAdminModelSource get modelSource;
/// Create a copy of Sub2ApiAdminModelStatsQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminModelStatsQueryCopyWith<Sub2ApiAdminModelStatsQuery> get copyWith => _$Sub2ApiAdminModelStatsQueryCopyWithImpl<Sub2ApiAdminModelStatsQuery>(this as Sub2ApiAdminModelStatsQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminModelStatsQuery&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.modelSource, modelSource) || other.modelSource == modelSource));
}


@override
int get hashCode => Object.hash(runtimeType,filter,modelSource);

@override
String toString() {
  return 'Sub2ApiAdminModelStatsQuery(filter: $filter, modelSource: $modelSource)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminModelStatsQueryCopyWith<$Res>  {
  factory $Sub2ApiAdminModelStatsQueryCopyWith(Sub2ApiAdminModelStatsQuery value, $Res Function(Sub2ApiAdminModelStatsQuery) _then) = _$Sub2ApiAdminModelStatsQueryCopyWithImpl;
@useResult
$Res call({
 Sub2ApiAdminDashboardFilter filter, Sub2ApiAdminModelSource modelSource
});


$Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$Sub2ApiAdminModelStatsQueryCopyWithImpl<$Res>
    implements $Sub2ApiAdminModelStatsQueryCopyWith<$Res> {
  _$Sub2ApiAdminModelStatsQueryCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminModelStatsQuery _self;
  final $Res Function(Sub2ApiAdminModelStatsQuery) _then;

/// Create a copy of Sub2ApiAdminModelStatsQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,Object? modelSource = null,}) {
  return _then(_self.copyWith(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminDashboardFilter,modelSource: null == modelSource ? _self.modelSource : modelSource // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminModelSource,
  ));
}
/// Create a copy of Sub2ApiAdminModelStatsQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter {

  return $Sub2ApiAdminDashboardFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sub2ApiAdminModelStatsQuery].
extension Sub2ApiAdminModelStatsQueryPatterns on Sub2ApiAdminModelStatsQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminModelStatsQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminModelStatsQuery() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminModelStatsQuery value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminModelStatsQuery():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminModelStatsQuery value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminModelStatsQuery() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiAdminDashboardFilter filter,  Sub2ApiAdminModelSource modelSource)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminModelStatsQuery() when $default != null:
return $default(_that.filter,_that.modelSource);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiAdminDashboardFilter filter,  Sub2ApiAdminModelSource modelSource)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminModelStatsQuery():
return $default(_that.filter,_that.modelSource);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiAdminDashboardFilter filter,  Sub2ApiAdminModelSource modelSource)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminModelStatsQuery() when $default != null:
return $default(_that.filter,_that.modelSource);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminModelStatsQuery implements Sub2ApiAdminModelStatsQuery {
  const _Sub2ApiAdminModelStatsQuery({this.filter = const Sub2ApiAdminDashboardFilter(), this.modelSource = Sub2ApiAdminModelSource.requested});


@override@JsonKey() final  Sub2ApiAdminDashboardFilter filter;
@override@JsonKey() final  Sub2ApiAdminModelSource modelSource;

/// Create a copy of Sub2ApiAdminModelStatsQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminModelStatsQueryCopyWith<_Sub2ApiAdminModelStatsQuery> get copyWith => __$Sub2ApiAdminModelStatsQueryCopyWithImpl<_Sub2ApiAdminModelStatsQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminModelStatsQuery&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.modelSource, modelSource) || other.modelSource == modelSource));
}


@override
int get hashCode => Object.hash(runtimeType,filter,modelSource);

@override
String toString() {
  return 'Sub2ApiAdminModelStatsQuery(filter: $filter, modelSource: $modelSource)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminModelStatsQueryCopyWith<$Res> implements $Sub2ApiAdminModelStatsQueryCopyWith<$Res> {
  factory _$Sub2ApiAdminModelStatsQueryCopyWith(_Sub2ApiAdminModelStatsQuery value, $Res Function(_Sub2ApiAdminModelStatsQuery) _then) = __$Sub2ApiAdminModelStatsQueryCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiAdminDashboardFilter filter, Sub2ApiAdminModelSource modelSource
});


@override $Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter;

}
/// @nodoc
class __$Sub2ApiAdminModelStatsQueryCopyWithImpl<$Res>
    implements _$Sub2ApiAdminModelStatsQueryCopyWith<$Res> {
  __$Sub2ApiAdminModelStatsQueryCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminModelStatsQuery _self;
  final $Res Function(_Sub2ApiAdminModelStatsQuery) _then;

/// Create a copy of Sub2ApiAdminModelStatsQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,Object? modelSource = null,}) {
  return _then(_Sub2ApiAdminModelStatsQuery(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminDashboardFilter,modelSource: null == modelSource ? _self.modelSource : modelSource // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminModelSource,
  ));
}

/// Create a copy of Sub2ApiAdminModelStatsQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter {

  return $Sub2ApiAdminDashboardFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc
mixin _$Sub2ApiAdminGroupStatsQuery {

 Sub2ApiAdminDashboardFilter get filter;
/// Create a copy of Sub2ApiAdminGroupStatsQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminGroupStatsQueryCopyWith<Sub2ApiAdminGroupStatsQuery> get copyWith => _$Sub2ApiAdminGroupStatsQueryCopyWithImpl<Sub2ApiAdminGroupStatsQuery>(this as Sub2ApiAdminGroupStatsQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminGroupStatsQuery&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'Sub2ApiAdminGroupStatsQuery(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminGroupStatsQueryCopyWith<$Res>  {
  factory $Sub2ApiAdminGroupStatsQueryCopyWith(Sub2ApiAdminGroupStatsQuery value, $Res Function(Sub2ApiAdminGroupStatsQuery) _then) = _$Sub2ApiAdminGroupStatsQueryCopyWithImpl;
@useResult
$Res call({
 Sub2ApiAdminDashboardFilter filter
});


$Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$Sub2ApiAdminGroupStatsQueryCopyWithImpl<$Res>
    implements $Sub2ApiAdminGroupStatsQueryCopyWith<$Res> {
  _$Sub2ApiAdminGroupStatsQueryCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminGroupStatsQuery _self;
  final $Res Function(Sub2ApiAdminGroupStatsQuery) _then;

/// Create a copy of Sub2ApiAdminGroupStatsQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,}) {
  return _then(_self.copyWith(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminDashboardFilter,
  ));
}
/// Create a copy of Sub2ApiAdminGroupStatsQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter {

  return $Sub2ApiAdminDashboardFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sub2ApiAdminGroupStatsQuery].
extension Sub2ApiAdminGroupStatsQueryPatterns on Sub2ApiAdminGroupStatsQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminGroupStatsQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminGroupStatsQuery() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminGroupStatsQuery value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminGroupStatsQuery():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminGroupStatsQuery value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminGroupStatsQuery() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiAdminDashboardFilter filter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminGroupStatsQuery() when $default != null:
return $default(_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiAdminDashboardFilter filter)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminGroupStatsQuery():
return $default(_that.filter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiAdminDashboardFilter filter)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminGroupStatsQuery() when $default != null:
return $default(_that.filter);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminGroupStatsQuery implements Sub2ApiAdminGroupStatsQuery {
  const _Sub2ApiAdminGroupStatsQuery({this.filter = const Sub2ApiAdminDashboardFilter()});


@override@JsonKey() final  Sub2ApiAdminDashboardFilter filter;

/// Create a copy of Sub2ApiAdminGroupStatsQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminGroupStatsQueryCopyWith<_Sub2ApiAdminGroupStatsQuery> get copyWith => __$Sub2ApiAdminGroupStatsQueryCopyWithImpl<_Sub2ApiAdminGroupStatsQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminGroupStatsQuery&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'Sub2ApiAdminGroupStatsQuery(filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminGroupStatsQueryCopyWith<$Res> implements $Sub2ApiAdminGroupStatsQueryCopyWith<$Res> {
  factory _$Sub2ApiAdminGroupStatsQueryCopyWith(_Sub2ApiAdminGroupStatsQuery value, $Res Function(_Sub2ApiAdminGroupStatsQuery) _then) = __$Sub2ApiAdminGroupStatsQueryCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiAdminDashboardFilter filter
});


@override $Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter;

}
/// @nodoc
class __$Sub2ApiAdminGroupStatsQueryCopyWithImpl<$Res>
    implements _$Sub2ApiAdminGroupStatsQueryCopyWith<$Res> {
  __$Sub2ApiAdminGroupStatsQueryCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminGroupStatsQuery _self;
  final $Res Function(_Sub2ApiAdminGroupStatsQuery) _then;

/// Create a copy of Sub2ApiAdminGroupStatsQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(_Sub2ApiAdminGroupStatsQuery(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminDashboardFilter,
  ));
}

/// Create a copy of Sub2ApiAdminGroupStatsQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter {

  return $Sub2ApiAdminDashboardFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc
mixin _$Sub2ApiAdminEntityTrendQuery {

 DateTime? get startDate; DateTime? get endDate; String? get timezone; Sub2ApiAdminUsageGranularity get granularity; int? get limit;
/// Create a copy of Sub2ApiAdminEntityTrendQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminEntityTrendQueryCopyWith<Sub2ApiAdminEntityTrendQuery> get copyWith => _$Sub2ApiAdminEntityTrendQueryCopyWithImpl<Sub2ApiAdminEntityTrendQuery>(this as Sub2ApiAdminEntityTrendQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminEntityTrendQuery&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,timezone,granularity,limit);

@override
String toString() {
  return 'Sub2ApiAdminEntityTrendQuery(startDate: $startDate, endDate: $endDate, timezone: $timezone, granularity: $granularity, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminEntityTrendQueryCopyWith<$Res>  {
  factory $Sub2ApiAdminEntityTrendQueryCopyWith(Sub2ApiAdminEntityTrendQuery value, $Res Function(Sub2ApiAdminEntityTrendQuery) _then) = _$Sub2ApiAdminEntityTrendQueryCopyWithImpl;
@useResult
$Res call({
 DateTime? startDate, DateTime? endDate, String? timezone, Sub2ApiAdminUsageGranularity granularity, int? limit
});




}
/// @nodoc
class _$Sub2ApiAdminEntityTrendQueryCopyWithImpl<$Res>
    implements $Sub2ApiAdminEntityTrendQueryCopyWith<$Res> {
  _$Sub2ApiAdminEntityTrendQueryCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminEntityTrendQuery _self;
  final $Res Function(Sub2ApiAdminEntityTrendQuery) _then;

/// Create a copy of Sub2ApiAdminEntityTrendQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = freezed,Object? endDate = freezed,Object? timezone = freezed,Object? granularity = null,Object? limit = freezed,}) {
  return _then(_self.copyWith(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageGranularity,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminEntityTrendQuery].
extension Sub2ApiAdminEntityTrendQueryPatterns on Sub2ApiAdminEntityTrendQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminEntityTrendQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminEntityTrendQuery() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminEntityTrendQuery value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminEntityTrendQuery():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminEntityTrendQuery value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminEntityTrendQuery() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? startDate,  DateTime? endDate,  String? timezone,  Sub2ApiAdminUsageGranularity granularity,  int? limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminEntityTrendQuery() when $default != null:
return $default(_that.startDate,_that.endDate,_that.timezone,_that.granularity,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? startDate,  DateTime? endDate,  String? timezone,  Sub2ApiAdminUsageGranularity granularity,  int? limit)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminEntityTrendQuery():
return $default(_that.startDate,_that.endDate,_that.timezone,_that.granularity,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? startDate,  DateTime? endDate,  String? timezone,  Sub2ApiAdminUsageGranularity granularity,  int? limit)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminEntityTrendQuery() when $default != null:
return $default(_that.startDate,_that.endDate,_that.timezone,_that.granularity,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminEntityTrendQuery implements Sub2ApiAdminEntityTrendQuery {
  const _Sub2ApiAdminEntityTrendQuery({this.startDate, this.endDate, this.timezone, this.granularity = Sub2ApiAdminUsageGranularity.day, this.limit});


@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  String? timezone;
@override@JsonKey() final  Sub2ApiAdminUsageGranularity granularity;
@override final  int? limit;

/// Create a copy of Sub2ApiAdminEntityTrendQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminEntityTrendQueryCopyWith<_Sub2ApiAdminEntityTrendQuery> get copyWith => __$Sub2ApiAdminEntityTrendQueryCopyWithImpl<_Sub2ApiAdminEntityTrendQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminEntityTrendQuery&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,timezone,granularity,limit);

@override
String toString() {
  return 'Sub2ApiAdminEntityTrendQuery(startDate: $startDate, endDate: $endDate, timezone: $timezone, granularity: $granularity, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminEntityTrendQueryCopyWith<$Res> implements $Sub2ApiAdminEntityTrendQueryCopyWith<$Res> {
  factory _$Sub2ApiAdminEntityTrendQueryCopyWith(_Sub2ApiAdminEntityTrendQuery value, $Res Function(_Sub2ApiAdminEntityTrendQuery) _then) = __$Sub2ApiAdminEntityTrendQueryCopyWithImpl;
@override @useResult
$Res call({
 DateTime? startDate, DateTime? endDate, String? timezone, Sub2ApiAdminUsageGranularity granularity, int? limit
});




}
/// @nodoc
class __$Sub2ApiAdminEntityTrendQueryCopyWithImpl<$Res>
    implements _$Sub2ApiAdminEntityTrendQueryCopyWith<$Res> {
  __$Sub2ApiAdminEntityTrendQueryCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminEntityTrendQuery _self;
  final $Res Function(_Sub2ApiAdminEntityTrendQuery) _then;

/// Create a copy of Sub2ApiAdminEntityTrendQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = freezed,Object? endDate = freezed,Object? timezone = freezed,Object? granularity = null,Object? limit = freezed,}) {
  return _then(_Sub2ApiAdminEntityTrendQuery(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageGranularity,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUserSpendingRankingQuery {

 DateTime? get startDate; DateTime? get endDate; String? get timezone; int? get limit;
/// Create a copy of Sub2ApiAdminUserSpendingRankingQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUserSpendingRankingQueryCopyWith<Sub2ApiAdminUserSpendingRankingQuery> get copyWith => _$Sub2ApiAdminUserSpendingRankingQueryCopyWithImpl<Sub2ApiAdminUserSpendingRankingQuery>(this as Sub2ApiAdminUserSpendingRankingQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUserSpendingRankingQuery&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,timezone,limit);

@override
String toString() {
  return 'Sub2ApiAdminUserSpendingRankingQuery(startDate: $startDate, endDate: $endDate, timezone: $timezone, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUserSpendingRankingQueryCopyWith<$Res>  {
  factory $Sub2ApiAdminUserSpendingRankingQueryCopyWith(Sub2ApiAdminUserSpendingRankingQuery value, $Res Function(Sub2ApiAdminUserSpendingRankingQuery) _then) = _$Sub2ApiAdminUserSpendingRankingQueryCopyWithImpl;
@useResult
$Res call({
 DateTime? startDate, DateTime? endDate, String? timezone, int? limit
});




}
/// @nodoc
class _$Sub2ApiAdminUserSpendingRankingQueryCopyWithImpl<$Res>
    implements $Sub2ApiAdminUserSpendingRankingQueryCopyWith<$Res> {
  _$Sub2ApiAdminUserSpendingRankingQueryCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUserSpendingRankingQuery _self;
  final $Res Function(Sub2ApiAdminUserSpendingRankingQuery) _then;

/// Create a copy of Sub2ApiAdminUserSpendingRankingQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = freezed,Object? endDate = freezed,Object? timezone = freezed,Object? limit = freezed,}) {
  return _then(_self.copyWith(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUserSpendingRankingQuery].
extension Sub2ApiAdminUserSpendingRankingQueryPatterns on Sub2ApiAdminUserSpendingRankingQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserSpendingRankingQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRankingQuery() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserSpendingRankingQuery value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRankingQuery():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUserSpendingRankingQuery value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRankingQuery() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? startDate,  DateTime? endDate,  String? timezone,  int? limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRankingQuery() when $default != null:
return $default(_that.startDate,_that.endDate,_that.timezone,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? startDate,  DateTime? endDate,  String? timezone,  int? limit)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRankingQuery():
return $default(_that.startDate,_that.endDate,_that.timezone,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? startDate,  DateTime? endDate,  String? timezone,  int? limit)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRankingQuery() when $default != null:
return $default(_that.startDate,_that.endDate,_that.timezone,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUserSpendingRankingQuery implements Sub2ApiAdminUserSpendingRankingQuery {
  const _Sub2ApiAdminUserSpendingRankingQuery({this.startDate, this.endDate, this.timezone, this.limit});


@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  String? timezone;
@override final  int? limit;

/// Create a copy of Sub2ApiAdminUserSpendingRankingQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUserSpendingRankingQueryCopyWith<_Sub2ApiAdminUserSpendingRankingQuery> get copyWith => __$Sub2ApiAdminUserSpendingRankingQueryCopyWithImpl<_Sub2ApiAdminUserSpendingRankingQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUserSpendingRankingQuery&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,timezone,limit);

@override
String toString() {
  return 'Sub2ApiAdminUserSpendingRankingQuery(startDate: $startDate, endDate: $endDate, timezone: $timezone, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUserSpendingRankingQueryCopyWith<$Res> implements $Sub2ApiAdminUserSpendingRankingQueryCopyWith<$Res> {
  factory _$Sub2ApiAdminUserSpendingRankingQueryCopyWith(_Sub2ApiAdminUserSpendingRankingQuery value, $Res Function(_Sub2ApiAdminUserSpendingRankingQuery) _then) = __$Sub2ApiAdminUserSpendingRankingQueryCopyWithImpl;
@override @useResult
$Res call({
 DateTime? startDate, DateTime? endDate, String? timezone, int? limit
});




}
/// @nodoc
class __$Sub2ApiAdminUserSpendingRankingQueryCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUserSpendingRankingQueryCopyWith<$Res> {
  __$Sub2ApiAdminUserSpendingRankingQueryCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUserSpendingRankingQuery _self;
  final $Res Function(_Sub2ApiAdminUserSpendingRankingQuery) _then;

/// Create a copy of Sub2ApiAdminUserSpendingRankingQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = freezed,Object? endDate = freezed,Object? timezone = freezed,Object? limit = freezed,}) {
  return _then(_Sub2ApiAdminUserSpendingRankingQuery(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUserBreakdownQuery {

 DateTime? get startDate; DateTime? get endDate; String? get timezone; int? get groupId; String? get model; Sub2ApiAdminModelSource get modelSource; String? get endpoint; Sub2ApiAdminEndpointType get endpointType; int? get userId; int? get apiKeyId; int? get accountId; Sub2ApiAdminUsageRequestType? get requestType; bool? get stream; Sub2ApiAdminBillingType? get billingType; Sub2ApiAdminUserBreakdownSort? get sortBy; int get limit;
/// Create a copy of Sub2ApiAdminUserBreakdownQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUserBreakdownQueryCopyWith<Sub2ApiAdminUserBreakdownQuery> get copyWith => _$Sub2ApiAdminUserBreakdownQueryCopyWithImpl<Sub2ApiAdminUserBreakdownQuery>(this as Sub2ApiAdminUserBreakdownQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUserBreakdownQuery&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.model, model) || other.model == model)&&(identical(other.modelSource, modelSource) || other.modelSource == modelSource)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.endpointType, endpointType) || other.endpointType == endpointType)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.apiKeyId, apiKeyId) || other.apiKeyId == apiKeyId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,timezone,groupId,model,modelSource,endpoint,endpointType,userId,apiKeyId,accountId,requestType,stream,billingType,sortBy,limit);

@override
String toString() {
  return 'Sub2ApiAdminUserBreakdownQuery(startDate: $startDate, endDate: $endDate, timezone: $timezone, groupId: $groupId, model: $model, modelSource: $modelSource, endpoint: $endpoint, endpointType: $endpointType, userId: $userId, apiKeyId: $apiKeyId, accountId: $accountId, requestType: $requestType, stream: $stream, billingType: $billingType, sortBy: $sortBy, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUserBreakdownQueryCopyWith<$Res>  {
  factory $Sub2ApiAdminUserBreakdownQueryCopyWith(Sub2ApiAdminUserBreakdownQuery value, $Res Function(Sub2ApiAdminUserBreakdownQuery) _then) = _$Sub2ApiAdminUserBreakdownQueryCopyWithImpl;
@useResult
$Res call({
 DateTime? startDate, DateTime? endDate, String? timezone, int? groupId, String? model, Sub2ApiAdminModelSource modelSource, String? endpoint, Sub2ApiAdminEndpointType endpointType, int? userId, int? apiKeyId, int? accountId, Sub2ApiAdminUsageRequestType? requestType, bool? stream, Sub2ApiAdminBillingType? billingType, Sub2ApiAdminUserBreakdownSort? sortBy, int limit
});




}
/// @nodoc
class _$Sub2ApiAdminUserBreakdownQueryCopyWithImpl<$Res>
    implements $Sub2ApiAdminUserBreakdownQueryCopyWith<$Res> {
  _$Sub2ApiAdminUserBreakdownQueryCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUserBreakdownQuery _self;
  final $Res Function(Sub2ApiAdminUserBreakdownQuery) _then;

/// Create a copy of Sub2ApiAdminUserBreakdownQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = freezed,Object? endDate = freezed,Object? timezone = freezed,Object? groupId = freezed,Object? model = freezed,Object? modelSource = null,Object? endpoint = freezed,Object? endpointType = null,Object? userId = freezed,Object? apiKeyId = freezed,Object? accountId = freezed,Object? requestType = freezed,Object? stream = freezed,Object? billingType = freezed,Object? sortBy = freezed,Object? limit = null,}) {
  return _then(_self.copyWith(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,modelSource: null == modelSource ? _self.modelSource : modelSource // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminModelSource,endpoint: freezed == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String?,endpointType: null == endpointType ? _self.endpointType : endpointType // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminEndpointType,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,apiKeyId: freezed == apiKeyId ? _self.apiKeyId : apiKeyId // ignore: cast_nullable_to_non_nullable
as int?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,requestType: freezed == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageRequestType?,stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool?,billingType: freezed == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminBillingType?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUserBreakdownSort?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUserBreakdownQuery].
extension Sub2ApiAdminUserBreakdownQueryPatterns on Sub2ApiAdminUserBreakdownQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserBreakdownQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdownQuery() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserBreakdownQuery value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdownQuery():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUserBreakdownQuery value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdownQuery() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? startDate,  DateTime? endDate,  String? timezone,  int? groupId,  String? model,  Sub2ApiAdminModelSource modelSource,  String? endpoint,  Sub2ApiAdminEndpointType endpointType,  int? userId,  int? apiKeyId,  int? accountId,  Sub2ApiAdminUsageRequestType? requestType,  bool? stream,  Sub2ApiAdminBillingType? billingType,  Sub2ApiAdminUserBreakdownSort? sortBy,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdownQuery() when $default != null:
return $default(_that.startDate,_that.endDate,_that.timezone,_that.groupId,_that.model,_that.modelSource,_that.endpoint,_that.endpointType,_that.userId,_that.apiKeyId,_that.accountId,_that.requestType,_that.stream,_that.billingType,_that.sortBy,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? startDate,  DateTime? endDate,  String? timezone,  int? groupId,  String? model,  Sub2ApiAdminModelSource modelSource,  String? endpoint,  Sub2ApiAdminEndpointType endpointType,  int? userId,  int? apiKeyId,  int? accountId,  Sub2ApiAdminUsageRequestType? requestType,  bool? stream,  Sub2ApiAdminBillingType? billingType,  Sub2ApiAdminUserBreakdownSort? sortBy,  int limit)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdownQuery():
return $default(_that.startDate,_that.endDate,_that.timezone,_that.groupId,_that.model,_that.modelSource,_that.endpoint,_that.endpointType,_that.userId,_that.apiKeyId,_that.accountId,_that.requestType,_that.stream,_that.billingType,_that.sortBy,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? startDate,  DateTime? endDate,  String? timezone,  int? groupId,  String? model,  Sub2ApiAdminModelSource modelSource,  String? endpoint,  Sub2ApiAdminEndpointType endpointType,  int? userId,  int? apiKeyId,  int? accountId,  Sub2ApiAdminUsageRequestType? requestType,  bool? stream,  Sub2ApiAdminBillingType? billingType,  Sub2ApiAdminUserBreakdownSort? sortBy,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdownQuery() when $default != null:
return $default(_that.startDate,_that.endDate,_that.timezone,_that.groupId,_that.model,_that.modelSource,_that.endpoint,_that.endpointType,_that.userId,_that.apiKeyId,_that.accountId,_that.requestType,_that.stream,_that.billingType,_that.sortBy,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUserBreakdownQuery implements Sub2ApiAdminUserBreakdownQuery {
  const _Sub2ApiAdminUserBreakdownQuery({this.startDate, this.endDate, this.timezone, this.groupId, this.model, this.modelSource = Sub2ApiAdminModelSource.requested, this.endpoint, this.endpointType = Sub2ApiAdminEndpointType.inbound, this.userId, this.apiKeyId, this.accountId, this.requestType, this.stream, this.billingType, this.sortBy, this.limit = 50});


@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  String? timezone;
@override final  int? groupId;
@override final  String? model;
@override@JsonKey() final  Sub2ApiAdminModelSource modelSource;
@override final  String? endpoint;
@override@JsonKey() final  Sub2ApiAdminEndpointType endpointType;
@override final  int? userId;
@override final  int? apiKeyId;
@override final  int? accountId;
@override final  Sub2ApiAdminUsageRequestType? requestType;
@override final  bool? stream;
@override final  Sub2ApiAdminBillingType? billingType;
@override final  Sub2ApiAdminUserBreakdownSort? sortBy;
@override@JsonKey() final  int limit;

/// Create a copy of Sub2ApiAdminUserBreakdownQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUserBreakdownQueryCopyWith<_Sub2ApiAdminUserBreakdownQuery> get copyWith => __$Sub2ApiAdminUserBreakdownQueryCopyWithImpl<_Sub2ApiAdminUserBreakdownQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUserBreakdownQuery&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.model, model) || other.model == model)&&(identical(other.modelSource, modelSource) || other.modelSource == modelSource)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.endpointType, endpointType) || other.endpointType == endpointType)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.apiKeyId, apiKeyId) || other.apiKeyId == apiKeyId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,timezone,groupId,model,modelSource,endpoint,endpointType,userId,apiKeyId,accountId,requestType,stream,billingType,sortBy,limit);

@override
String toString() {
  return 'Sub2ApiAdminUserBreakdownQuery(startDate: $startDate, endDate: $endDate, timezone: $timezone, groupId: $groupId, model: $model, modelSource: $modelSource, endpoint: $endpoint, endpointType: $endpointType, userId: $userId, apiKeyId: $apiKeyId, accountId: $accountId, requestType: $requestType, stream: $stream, billingType: $billingType, sortBy: $sortBy, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUserBreakdownQueryCopyWith<$Res> implements $Sub2ApiAdminUserBreakdownQueryCopyWith<$Res> {
  factory _$Sub2ApiAdminUserBreakdownQueryCopyWith(_Sub2ApiAdminUserBreakdownQuery value, $Res Function(_Sub2ApiAdminUserBreakdownQuery) _then) = __$Sub2ApiAdminUserBreakdownQueryCopyWithImpl;
@override @useResult
$Res call({
 DateTime? startDate, DateTime? endDate, String? timezone, int? groupId, String? model, Sub2ApiAdminModelSource modelSource, String? endpoint, Sub2ApiAdminEndpointType endpointType, int? userId, int? apiKeyId, int? accountId, Sub2ApiAdminUsageRequestType? requestType, bool? stream, Sub2ApiAdminBillingType? billingType, Sub2ApiAdminUserBreakdownSort? sortBy, int limit
});




}
/// @nodoc
class __$Sub2ApiAdminUserBreakdownQueryCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUserBreakdownQueryCopyWith<$Res> {
  __$Sub2ApiAdminUserBreakdownQueryCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUserBreakdownQuery _self;
  final $Res Function(_Sub2ApiAdminUserBreakdownQuery) _then;

/// Create a copy of Sub2ApiAdminUserBreakdownQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = freezed,Object? endDate = freezed,Object? timezone = freezed,Object? groupId = freezed,Object? model = freezed,Object? modelSource = null,Object? endpoint = freezed,Object? endpointType = null,Object? userId = freezed,Object? apiKeyId = freezed,Object? accountId = freezed,Object? requestType = freezed,Object? stream = freezed,Object? billingType = freezed,Object? sortBy = freezed,Object? limit = null,}) {
  return _then(_Sub2ApiAdminUserBreakdownQuery(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,modelSource: null == modelSource ? _self.modelSource : modelSource // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminModelSource,endpoint: freezed == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String?,endpointType: null == endpointType ? _self.endpointType : endpointType // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminEndpointType,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,apiKeyId: freezed == apiKeyId ? _self.apiKeyId : apiKeyId // ignore: cast_nullable_to_non_nullable
as int?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,requestType: freezed == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageRequestType?,stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool?,billingType: freezed == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminBillingType?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUserBreakdownSort?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminDashboardSnapshotRequest {

 Sub2ApiAdminDashboardFilter get filter; Sub2ApiAdminUsageGranularity get granularity; String? get model; bool get includeStats; bool get includeTrend; bool get includeModelStats; bool get includeGroupStats; bool get includeUsersTrend; int get usersTrendLimit;
/// Create a copy of Sub2ApiAdminDashboardSnapshotRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardSnapshotRequestCopyWith<Sub2ApiAdminDashboardSnapshotRequest> get copyWith => _$Sub2ApiAdminDashboardSnapshotRequestCopyWithImpl<Sub2ApiAdminDashboardSnapshotRequest>(this as Sub2ApiAdminDashboardSnapshotRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminDashboardSnapshotRequest&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.model, model) || other.model == model)&&(identical(other.includeStats, includeStats) || other.includeStats == includeStats)&&(identical(other.includeTrend, includeTrend) || other.includeTrend == includeTrend)&&(identical(other.includeModelStats, includeModelStats) || other.includeModelStats == includeModelStats)&&(identical(other.includeGroupStats, includeGroupStats) || other.includeGroupStats == includeGroupStats)&&(identical(other.includeUsersTrend, includeUsersTrend) || other.includeUsersTrend == includeUsersTrend)&&(identical(other.usersTrendLimit, usersTrendLimit) || other.usersTrendLimit == usersTrendLimit));
}


@override
int get hashCode => Object.hash(runtimeType,filter,granularity,model,includeStats,includeTrend,includeModelStats,includeGroupStats,includeUsersTrend,usersTrendLimit);

@override
String toString() {
  return 'Sub2ApiAdminDashboardSnapshotRequest(filter: $filter, granularity: $granularity, model: $model, includeStats: $includeStats, includeTrend: $includeTrend, includeModelStats: $includeModelStats, includeGroupStats: $includeGroupStats, includeUsersTrend: $includeUsersTrend, usersTrendLimit: $usersTrendLimit)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminDashboardSnapshotRequestCopyWith<$Res>  {
  factory $Sub2ApiAdminDashboardSnapshotRequestCopyWith(Sub2ApiAdminDashboardSnapshotRequest value, $Res Function(Sub2ApiAdminDashboardSnapshotRequest) _then) = _$Sub2ApiAdminDashboardSnapshotRequestCopyWithImpl;
@useResult
$Res call({
 Sub2ApiAdminDashboardFilter filter, Sub2ApiAdminUsageGranularity granularity, String? model, bool includeStats, bool includeTrend, bool includeModelStats, bool includeGroupStats, bool includeUsersTrend, int usersTrendLimit
});


$Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$Sub2ApiAdminDashboardSnapshotRequestCopyWithImpl<$Res>
    implements $Sub2ApiAdminDashboardSnapshotRequestCopyWith<$Res> {
  _$Sub2ApiAdminDashboardSnapshotRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminDashboardSnapshotRequest _self;
  final $Res Function(Sub2ApiAdminDashboardSnapshotRequest) _then;

/// Create a copy of Sub2ApiAdminDashboardSnapshotRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,Object? granularity = null,Object? model = freezed,Object? includeStats = null,Object? includeTrend = null,Object? includeModelStats = null,Object? includeGroupStats = null,Object? includeUsersTrend = null,Object? usersTrendLimit = null,}) {
  return _then(_self.copyWith(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminDashboardFilter,granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageGranularity,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,includeStats: null == includeStats ? _self.includeStats : includeStats // ignore: cast_nullable_to_non_nullable
as bool,includeTrend: null == includeTrend ? _self.includeTrend : includeTrend // ignore: cast_nullable_to_non_nullable
as bool,includeModelStats: null == includeModelStats ? _self.includeModelStats : includeModelStats // ignore: cast_nullable_to_non_nullable
as bool,includeGroupStats: null == includeGroupStats ? _self.includeGroupStats : includeGroupStats // ignore: cast_nullable_to_non_nullable
as bool,includeUsersTrend: null == includeUsersTrend ? _self.includeUsersTrend : includeUsersTrend // ignore: cast_nullable_to_non_nullable
as bool,usersTrendLimit: null == usersTrendLimit ? _self.usersTrendLimit : usersTrendLimit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Sub2ApiAdminDashboardSnapshotRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter {

  return $Sub2ApiAdminDashboardFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sub2ApiAdminDashboardSnapshotRequest].
extension Sub2ApiAdminDashboardSnapshotRequestPatterns on Sub2ApiAdminDashboardSnapshotRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardSnapshotRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshotRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardSnapshotRequest value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshotRequest():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminDashboardSnapshotRequest value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshotRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiAdminDashboardFilter filter,  Sub2ApiAdminUsageGranularity granularity,  String? model,  bool includeStats,  bool includeTrend,  bool includeModelStats,  bool includeGroupStats,  bool includeUsersTrend,  int usersTrendLimit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshotRequest() when $default != null:
return $default(_that.filter,_that.granularity,_that.model,_that.includeStats,_that.includeTrend,_that.includeModelStats,_that.includeGroupStats,_that.includeUsersTrend,_that.usersTrendLimit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiAdminDashboardFilter filter,  Sub2ApiAdminUsageGranularity granularity,  String? model,  bool includeStats,  bool includeTrend,  bool includeModelStats,  bool includeGroupStats,  bool includeUsersTrend,  int usersTrendLimit)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshotRequest():
return $default(_that.filter,_that.granularity,_that.model,_that.includeStats,_that.includeTrend,_that.includeModelStats,_that.includeGroupStats,_that.includeUsersTrend,_that.usersTrendLimit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiAdminDashboardFilter filter,  Sub2ApiAdminUsageGranularity granularity,  String? model,  bool includeStats,  bool includeTrend,  bool includeModelStats,  bool includeGroupStats,  bool includeUsersTrend,  int usersTrendLimit)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshotRequest() when $default != null:
return $default(_that.filter,_that.granularity,_that.model,_that.includeStats,_that.includeTrend,_that.includeModelStats,_that.includeGroupStats,_that.includeUsersTrend,_that.usersTrendLimit);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminDashboardSnapshotRequest implements Sub2ApiAdminDashboardSnapshotRequest {
  const _Sub2ApiAdminDashboardSnapshotRequest({this.filter = const Sub2ApiAdminDashboardFilter(), this.granularity = Sub2ApiAdminUsageGranularity.day, this.model, this.includeStats = true, this.includeTrend = true, this.includeModelStats = true, this.includeGroupStats = false, this.includeUsersTrend = false, this.usersTrendLimit = 12});


@override@JsonKey() final  Sub2ApiAdminDashboardFilter filter;
@override@JsonKey() final  Sub2ApiAdminUsageGranularity granularity;
@override final  String? model;
@override@JsonKey() final  bool includeStats;
@override@JsonKey() final  bool includeTrend;
@override@JsonKey() final  bool includeModelStats;
@override@JsonKey() final  bool includeGroupStats;
@override@JsonKey() final  bool includeUsersTrend;
@override@JsonKey() final  int usersTrendLimit;

/// Create a copy of Sub2ApiAdminDashboardSnapshotRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminDashboardSnapshotRequestCopyWith<_Sub2ApiAdminDashboardSnapshotRequest> get copyWith => __$Sub2ApiAdminDashboardSnapshotRequestCopyWithImpl<_Sub2ApiAdminDashboardSnapshotRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminDashboardSnapshotRequest&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.model, model) || other.model == model)&&(identical(other.includeStats, includeStats) || other.includeStats == includeStats)&&(identical(other.includeTrend, includeTrend) || other.includeTrend == includeTrend)&&(identical(other.includeModelStats, includeModelStats) || other.includeModelStats == includeModelStats)&&(identical(other.includeGroupStats, includeGroupStats) || other.includeGroupStats == includeGroupStats)&&(identical(other.includeUsersTrend, includeUsersTrend) || other.includeUsersTrend == includeUsersTrend)&&(identical(other.usersTrendLimit, usersTrendLimit) || other.usersTrendLimit == usersTrendLimit));
}


@override
int get hashCode => Object.hash(runtimeType,filter,granularity,model,includeStats,includeTrend,includeModelStats,includeGroupStats,includeUsersTrend,usersTrendLimit);

@override
String toString() {
  return 'Sub2ApiAdminDashboardSnapshotRequest(filter: $filter, granularity: $granularity, model: $model, includeStats: $includeStats, includeTrend: $includeTrend, includeModelStats: $includeModelStats, includeGroupStats: $includeGroupStats, includeUsersTrend: $includeUsersTrend, usersTrendLimit: $usersTrendLimit)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminDashboardSnapshotRequestCopyWith<$Res> implements $Sub2ApiAdminDashboardSnapshotRequestCopyWith<$Res> {
  factory _$Sub2ApiAdminDashboardSnapshotRequestCopyWith(_Sub2ApiAdminDashboardSnapshotRequest value, $Res Function(_Sub2ApiAdminDashboardSnapshotRequest) _then) = __$Sub2ApiAdminDashboardSnapshotRequestCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiAdminDashboardFilter filter, Sub2ApiAdminUsageGranularity granularity, String? model, bool includeStats, bool includeTrend, bool includeModelStats, bool includeGroupStats, bool includeUsersTrend, int usersTrendLimit
});


@override $Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter;

}
/// @nodoc
class __$Sub2ApiAdminDashboardSnapshotRequestCopyWithImpl<$Res>
    implements _$Sub2ApiAdminDashboardSnapshotRequestCopyWith<$Res> {
  __$Sub2ApiAdminDashboardSnapshotRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminDashboardSnapshotRequest _self;
  final $Res Function(_Sub2ApiAdminDashboardSnapshotRequest) _then;

/// Create a copy of Sub2ApiAdminDashboardSnapshotRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,Object? granularity = null,Object? model = freezed,Object? includeStats = null,Object? includeTrend = null,Object? includeModelStats = null,Object? includeGroupStats = null,Object? includeUsersTrend = null,Object? usersTrendLimit = null,}) {
  return _then(_Sub2ApiAdminDashboardSnapshotRequest(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminDashboardFilter,granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageGranularity,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,includeStats: null == includeStats ? _self.includeStats : includeStats // ignore: cast_nullable_to_non_nullable
as bool,includeTrend: null == includeTrend ? _self.includeTrend : includeTrend // ignore: cast_nullable_to_non_nullable
as bool,includeModelStats: null == includeModelStats ? _self.includeModelStats : includeModelStats // ignore: cast_nullable_to_non_nullable
as bool,includeGroupStats: null == includeGroupStats ? _self.includeGroupStats : includeGroupStats // ignore: cast_nullable_to_non_nullable
as bool,includeUsersTrend: null == includeUsersTrend ? _self.includeUsersTrend : includeUsersTrend // ignore: cast_nullable_to_non_nullable
as bool,usersTrendLimit: null == usersTrendLimit ? _self.usersTrendLimit : usersTrendLimit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Sub2ApiAdminDashboardSnapshotRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardFilterCopyWith<$Res> get filter {

  return $Sub2ApiAdminDashboardFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc
mixin _$Sub2ApiAdminAggregationBackfillRequest {

 DateTime get start; DateTime get end;
/// Create a copy of Sub2ApiAdminAggregationBackfillRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminAggregationBackfillRequestCopyWith<Sub2ApiAdminAggregationBackfillRequest> get copyWith => _$Sub2ApiAdminAggregationBackfillRequestCopyWithImpl<Sub2ApiAdminAggregationBackfillRequest>(this as Sub2ApiAdminAggregationBackfillRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminAggregationBackfillRequest&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'Sub2ApiAdminAggregationBackfillRequest(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminAggregationBackfillRequestCopyWith<$Res>  {
  factory $Sub2ApiAdminAggregationBackfillRequestCopyWith(Sub2ApiAdminAggregationBackfillRequest value, $Res Function(Sub2ApiAdminAggregationBackfillRequest) _then) = _$Sub2ApiAdminAggregationBackfillRequestCopyWithImpl;
@useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class _$Sub2ApiAdminAggregationBackfillRequestCopyWithImpl<$Res>
    implements $Sub2ApiAdminAggregationBackfillRequestCopyWith<$Res> {
  _$Sub2ApiAdminAggregationBackfillRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminAggregationBackfillRequest _self;
  final $Res Function(Sub2ApiAdminAggregationBackfillRequest) _then;

/// Create a copy of Sub2ApiAdminAggregationBackfillRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminAggregationBackfillRequest].
extension Sub2ApiAdminAggregationBackfillRequestPatterns on Sub2ApiAdminAggregationBackfillRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminAggregationBackfillRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminAggregationBackfillRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminAggregationBackfillRequest value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminAggregationBackfillRequest():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminAggregationBackfillRequest value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminAggregationBackfillRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime start,  DateTime end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminAggregationBackfillRequest() when $default != null:
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime start,  DateTime end)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminAggregationBackfillRequest():
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime start,  DateTime end)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminAggregationBackfillRequest() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminAggregationBackfillRequest implements Sub2ApiAdminAggregationBackfillRequest {
  const _Sub2ApiAdminAggregationBackfillRequest({required this.start, required this.end});


@override final  DateTime start;
@override final  DateTime end;

/// Create a copy of Sub2ApiAdminAggregationBackfillRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminAggregationBackfillRequestCopyWith<_Sub2ApiAdminAggregationBackfillRequest> get copyWith => __$Sub2ApiAdminAggregationBackfillRequestCopyWithImpl<_Sub2ApiAdminAggregationBackfillRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminAggregationBackfillRequest&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'Sub2ApiAdminAggregationBackfillRequest(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminAggregationBackfillRequestCopyWith<$Res> implements $Sub2ApiAdminAggregationBackfillRequestCopyWith<$Res> {
  factory _$Sub2ApiAdminAggregationBackfillRequestCopyWith(_Sub2ApiAdminAggregationBackfillRequest value, $Res Function(_Sub2ApiAdminAggregationBackfillRequest) _then) = __$Sub2ApiAdminAggregationBackfillRequestCopyWithImpl;
@override @useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class __$Sub2ApiAdminAggregationBackfillRequestCopyWithImpl<$Res>
    implements _$Sub2ApiAdminAggregationBackfillRequestCopyWith<$Res> {
  __$Sub2ApiAdminAggregationBackfillRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminAggregationBackfillRequest _self;
  final $Res Function(_Sub2ApiAdminAggregationBackfillRequest) _then;

/// Create a copy of Sub2ApiAdminAggregationBackfillRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(_Sub2ApiAdminAggregationBackfillRequest(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminDashboardStats {

 int get totalUsers; int get todayNewUsers; int get activeUsers; int get hourlyActiveUsers; DateTime get statsUpdatedAt; bool get statsStale; int get totalApiKeys; int get activeApiKeys; int get totalAccounts; int get normalAccounts; int get errorAccounts; int get rateLimitAccounts; int get overloadAccounts; int get totalRequests; int get totalInputTokens; int get totalOutputTokens; int get totalCacheCreationTokens; int get totalCacheReadTokens; int get totalTokens; Sub2ApiDecimal get totalCost; Sub2ApiDecimal get totalActualCost; int get todayRequests; int get todayInputTokens; int get todayOutputTokens; int get todayCacheCreationTokens; int get todayCacheReadTokens; int get todayTokens; Sub2ApiDecimal get todayCost; Sub2ApiDecimal get todayActualCost; Sub2ApiDecimal get averageDurationMs; int get uptime; int get rpm; int get tpm;
/// Create a copy of Sub2ApiAdminDashboardStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardStatsCopyWith<Sub2ApiAdminDashboardStats> get copyWith => _$Sub2ApiAdminDashboardStatsCopyWithImpl<Sub2ApiAdminDashboardStats>(this as Sub2ApiAdminDashboardStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminDashboardStats&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers)&&(identical(other.todayNewUsers, todayNewUsers) || other.todayNewUsers == todayNewUsers)&&(identical(other.activeUsers, activeUsers) || other.activeUsers == activeUsers)&&(identical(other.hourlyActiveUsers, hourlyActiveUsers) || other.hourlyActiveUsers == hourlyActiveUsers)&&(identical(other.statsUpdatedAt, statsUpdatedAt) || other.statsUpdatedAt == statsUpdatedAt)&&(identical(other.statsStale, statsStale) || other.statsStale == statsStale)&&(identical(other.totalApiKeys, totalApiKeys) || other.totalApiKeys == totalApiKeys)&&(identical(other.activeApiKeys, activeApiKeys) || other.activeApiKeys == activeApiKeys)&&(identical(other.totalAccounts, totalAccounts) || other.totalAccounts == totalAccounts)&&(identical(other.normalAccounts, normalAccounts) || other.normalAccounts == normalAccounts)&&(identical(other.errorAccounts, errorAccounts) || other.errorAccounts == errorAccounts)&&(identical(other.rateLimitAccounts, rateLimitAccounts) || other.rateLimitAccounts == rateLimitAccounts)&&(identical(other.overloadAccounts, overloadAccounts) || other.overloadAccounts == overloadAccounts)&&(identical(other.totalRequests, totalRequests) || other.totalRequests == totalRequests)&&(identical(other.totalInputTokens, totalInputTokens) || other.totalInputTokens == totalInputTokens)&&(identical(other.totalOutputTokens, totalOutputTokens) || other.totalOutputTokens == totalOutputTokens)&&(identical(other.totalCacheCreationTokens, totalCacheCreationTokens) || other.totalCacheCreationTokens == totalCacheCreationTokens)&&(identical(other.totalCacheReadTokens, totalCacheReadTokens) || other.totalCacheReadTokens == totalCacheReadTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.totalActualCost, totalActualCost) || other.totalActualCost == totalActualCost)&&(identical(other.todayRequests, todayRequests) || other.todayRequests == todayRequests)&&(identical(other.todayInputTokens, todayInputTokens) || other.todayInputTokens == todayInputTokens)&&(identical(other.todayOutputTokens, todayOutputTokens) || other.todayOutputTokens == todayOutputTokens)&&(identical(other.todayCacheCreationTokens, todayCacheCreationTokens) || other.todayCacheCreationTokens == todayCacheCreationTokens)&&(identical(other.todayCacheReadTokens, todayCacheReadTokens) || other.todayCacheReadTokens == todayCacheReadTokens)&&(identical(other.todayTokens, todayTokens) || other.todayTokens == todayTokens)&&(identical(other.todayCost, todayCost) || other.todayCost == todayCost)&&(identical(other.todayActualCost, todayActualCost) || other.todayActualCost == todayActualCost)&&(identical(other.averageDurationMs, averageDurationMs) || other.averageDurationMs == averageDurationMs)&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.rpm, rpm) || other.rpm == rpm)&&(identical(other.tpm, tpm) || other.tpm == tpm));
}


@override
int get hashCode => Object.hashAll([runtimeType,totalUsers,todayNewUsers,activeUsers,hourlyActiveUsers,statsUpdatedAt,statsStale,totalApiKeys,activeApiKeys,totalAccounts,normalAccounts,errorAccounts,rateLimitAccounts,overloadAccounts,totalRequests,totalInputTokens,totalOutputTokens,totalCacheCreationTokens,totalCacheReadTokens,totalTokens,totalCost,totalActualCost,todayRequests,todayInputTokens,todayOutputTokens,todayCacheCreationTokens,todayCacheReadTokens,todayTokens,todayCost,todayActualCost,averageDurationMs,uptime,rpm,tpm]);

@override
String toString() {
  return 'Sub2ApiAdminDashboardStats(totalUsers: $totalUsers, todayNewUsers: $todayNewUsers, activeUsers: $activeUsers, hourlyActiveUsers: $hourlyActiveUsers, statsUpdatedAt: $statsUpdatedAt, statsStale: $statsStale, totalApiKeys: $totalApiKeys, activeApiKeys: $activeApiKeys, totalAccounts: $totalAccounts, normalAccounts: $normalAccounts, errorAccounts: $errorAccounts, rateLimitAccounts: $rateLimitAccounts, overloadAccounts: $overloadAccounts, totalRequests: $totalRequests, totalInputTokens: $totalInputTokens, totalOutputTokens: $totalOutputTokens, totalCacheCreationTokens: $totalCacheCreationTokens, totalCacheReadTokens: $totalCacheReadTokens, totalTokens: $totalTokens, totalCost: $totalCost, totalActualCost: $totalActualCost, todayRequests: $todayRequests, todayInputTokens: $todayInputTokens, todayOutputTokens: $todayOutputTokens, todayCacheCreationTokens: $todayCacheCreationTokens, todayCacheReadTokens: $todayCacheReadTokens, todayTokens: $todayTokens, todayCost: $todayCost, todayActualCost: $todayActualCost, averageDurationMs: $averageDurationMs, uptime: $uptime, rpm: $rpm, tpm: $tpm)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminDashboardStatsCopyWith<$Res>  {
  factory $Sub2ApiAdminDashboardStatsCopyWith(Sub2ApiAdminDashboardStats value, $Res Function(Sub2ApiAdminDashboardStats) _then) = _$Sub2ApiAdminDashboardStatsCopyWithImpl;
@useResult
$Res call({
 int totalUsers, int todayNewUsers, int activeUsers, int hourlyActiveUsers, DateTime statsUpdatedAt, bool statsStale, int totalApiKeys, int activeApiKeys, int totalAccounts, int normalAccounts, int errorAccounts, int rateLimitAccounts, int overloadAccounts, int totalRequests, int totalInputTokens, int totalOutputTokens, int totalCacheCreationTokens, int totalCacheReadTokens, int totalTokens, Sub2ApiDecimal totalCost, Sub2ApiDecimal totalActualCost, int todayRequests, int todayInputTokens, int todayOutputTokens, int todayCacheCreationTokens, int todayCacheReadTokens, int todayTokens, Sub2ApiDecimal todayCost, Sub2ApiDecimal todayActualCost, Sub2ApiDecimal averageDurationMs, int uptime, int rpm, int tpm
});




}
/// @nodoc
class _$Sub2ApiAdminDashboardStatsCopyWithImpl<$Res>
    implements $Sub2ApiAdminDashboardStatsCopyWith<$Res> {
  _$Sub2ApiAdminDashboardStatsCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminDashboardStats _self;
  final $Res Function(Sub2ApiAdminDashboardStats) _then;

/// Create a copy of Sub2ApiAdminDashboardStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalUsers = null,Object? todayNewUsers = null,Object? activeUsers = null,Object? hourlyActiveUsers = null,Object? statsUpdatedAt = null,Object? statsStale = null,Object? totalApiKeys = null,Object? activeApiKeys = null,Object? totalAccounts = null,Object? normalAccounts = null,Object? errorAccounts = null,Object? rateLimitAccounts = null,Object? overloadAccounts = null,Object? totalRequests = null,Object? totalInputTokens = null,Object? totalOutputTokens = null,Object? totalCacheCreationTokens = null,Object? totalCacheReadTokens = null,Object? totalTokens = null,Object? totalCost = null,Object? totalActualCost = null,Object? todayRequests = null,Object? todayInputTokens = null,Object? todayOutputTokens = null,Object? todayCacheCreationTokens = null,Object? todayCacheReadTokens = null,Object? todayTokens = null,Object? todayCost = null,Object? todayActualCost = null,Object? averageDurationMs = null,Object? uptime = null,Object? rpm = null,Object? tpm = null,}) {
  return _then(_self.copyWith(
totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,todayNewUsers: null == todayNewUsers ? _self.todayNewUsers : todayNewUsers // ignore: cast_nullable_to_non_nullable
as int,activeUsers: null == activeUsers ? _self.activeUsers : activeUsers // ignore: cast_nullable_to_non_nullable
as int,hourlyActiveUsers: null == hourlyActiveUsers ? _self.hourlyActiveUsers : hourlyActiveUsers // ignore: cast_nullable_to_non_nullable
as int,statsUpdatedAt: null == statsUpdatedAt ? _self.statsUpdatedAt : statsUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,statsStale: null == statsStale ? _self.statsStale : statsStale // ignore: cast_nullable_to_non_nullable
as bool,totalApiKeys: null == totalApiKeys ? _self.totalApiKeys : totalApiKeys // ignore: cast_nullable_to_non_nullable
as int,activeApiKeys: null == activeApiKeys ? _self.activeApiKeys : activeApiKeys // ignore: cast_nullable_to_non_nullable
as int,totalAccounts: null == totalAccounts ? _self.totalAccounts : totalAccounts // ignore: cast_nullable_to_non_nullable
as int,normalAccounts: null == normalAccounts ? _self.normalAccounts : normalAccounts // ignore: cast_nullable_to_non_nullable
as int,errorAccounts: null == errorAccounts ? _self.errorAccounts : errorAccounts // ignore: cast_nullable_to_non_nullable
as int,rateLimitAccounts: null == rateLimitAccounts ? _self.rateLimitAccounts : rateLimitAccounts // ignore: cast_nullable_to_non_nullable
as int,overloadAccounts: null == overloadAccounts ? _self.overloadAccounts : overloadAccounts // ignore: cast_nullable_to_non_nullable
as int,totalRequests: null == totalRequests ? _self.totalRequests : totalRequests // ignore: cast_nullable_to_non_nullable
as int,totalInputTokens: null == totalInputTokens ? _self.totalInputTokens : totalInputTokens // ignore: cast_nullable_to_non_nullable
as int,totalOutputTokens: null == totalOutputTokens ? _self.totalOutputTokens : totalOutputTokens // ignore: cast_nullable_to_non_nullable
as int,totalCacheCreationTokens: null == totalCacheCreationTokens ? _self.totalCacheCreationTokens : totalCacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,totalCacheReadTokens: null == totalCacheReadTokens ? _self.totalCacheReadTokens : totalCacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,totalCost: null == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalActualCost: null == totalActualCost ? _self.totalActualCost : totalActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,todayRequests: null == todayRequests ? _self.todayRequests : todayRequests // ignore: cast_nullable_to_non_nullable
as int,todayInputTokens: null == todayInputTokens ? _self.todayInputTokens : todayInputTokens // ignore: cast_nullable_to_non_nullable
as int,todayOutputTokens: null == todayOutputTokens ? _self.todayOutputTokens : todayOutputTokens // ignore: cast_nullable_to_non_nullable
as int,todayCacheCreationTokens: null == todayCacheCreationTokens ? _self.todayCacheCreationTokens : todayCacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,todayCacheReadTokens: null == todayCacheReadTokens ? _self.todayCacheReadTokens : todayCacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,todayTokens: null == todayTokens ? _self.todayTokens : todayTokens // ignore: cast_nullable_to_non_nullable
as int,todayCost: null == todayCost ? _self.todayCost : todayCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,todayActualCost: null == todayActualCost ? _self.todayActualCost : todayActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,averageDurationMs: null == averageDurationMs ? _self.averageDurationMs : averageDurationMs // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as int,rpm: null == rpm ? _self.rpm : rpm // ignore: cast_nullable_to_non_nullable
as int,tpm: null == tpm ? _self.tpm : tpm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminDashboardStats].
extension Sub2ApiAdminDashboardStatsPatterns on Sub2ApiAdminDashboardStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardStats() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardStats value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardStats():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminDashboardStats value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardStats() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalUsers,  int todayNewUsers,  int activeUsers,  int hourlyActiveUsers,  DateTime statsUpdatedAt,  bool statsStale,  int totalApiKeys,  int activeApiKeys,  int totalAccounts,  int normalAccounts,  int errorAccounts,  int rateLimitAccounts,  int overloadAccounts,  int totalRequests,  int totalInputTokens,  int totalOutputTokens,  int totalCacheCreationTokens,  int totalCacheReadTokens,  int totalTokens,  Sub2ApiDecimal totalCost,  Sub2ApiDecimal totalActualCost,  int todayRequests,  int todayInputTokens,  int todayOutputTokens,  int todayCacheCreationTokens,  int todayCacheReadTokens,  int todayTokens,  Sub2ApiDecimal todayCost,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal averageDurationMs,  int uptime,  int rpm,  int tpm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardStats() when $default != null:
return $default(_that.totalUsers,_that.todayNewUsers,_that.activeUsers,_that.hourlyActiveUsers,_that.statsUpdatedAt,_that.statsStale,_that.totalApiKeys,_that.activeApiKeys,_that.totalAccounts,_that.normalAccounts,_that.errorAccounts,_that.rateLimitAccounts,_that.overloadAccounts,_that.totalRequests,_that.totalInputTokens,_that.totalOutputTokens,_that.totalCacheCreationTokens,_that.totalCacheReadTokens,_that.totalTokens,_that.totalCost,_that.totalActualCost,_that.todayRequests,_that.todayInputTokens,_that.todayOutputTokens,_that.todayCacheCreationTokens,_that.todayCacheReadTokens,_that.todayTokens,_that.todayCost,_that.todayActualCost,_that.averageDurationMs,_that.uptime,_that.rpm,_that.tpm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalUsers,  int todayNewUsers,  int activeUsers,  int hourlyActiveUsers,  DateTime statsUpdatedAt,  bool statsStale,  int totalApiKeys,  int activeApiKeys,  int totalAccounts,  int normalAccounts,  int errorAccounts,  int rateLimitAccounts,  int overloadAccounts,  int totalRequests,  int totalInputTokens,  int totalOutputTokens,  int totalCacheCreationTokens,  int totalCacheReadTokens,  int totalTokens,  Sub2ApiDecimal totalCost,  Sub2ApiDecimal totalActualCost,  int todayRequests,  int todayInputTokens,  int todayOutputTokens,  int todayCacheCreationTokens,  int todayCacheReadTokens,  int todayTokens,  Sub2ApiDecimal todayCost,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal averageDurationMs,  int uptime,  int rpm,  int tpm)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardStats():
return $default(_that.totalUsers,_that.todayNewUsers,_that.activeUsers,_that.hourlyActiveUsers,_that.statsUpdatedAt,_that.statsStale,_that.totalApiKeys,_that.activeApiKeys,_that.totalAccounts,_that.normalAccounts,_that.errorAccounts,_that.rateLimitAccounts,_that.overloadAccounts,_that.totalRequests,_that.totalInputTokens,_that.totalOutputTokens,_that.totalCacheCreationTokens,_that.totalCacheReadTokens,_that.totalTokens,_that.totalCost,_that.totalActualCost,_that.todayRequests,_that.todayInputTokens,_that.todayOutputTokens,_that.todayCacheCreationTokens,_that.todayCacheReadTokens,_that.todayTokens,_that.todayCost,_that.todayActualCost,_that.averageDurationMs,_that.uptime,_that.rpm,_that.tpm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalUsers,  int todayNewUsers,  int activeUsers,  int hourlyActiveUsers,  DateTime statsUpdatedAt,  bool statsStale,  int totalApiKeys,  int activeApiKeys,  int totalAccounts,  int normalAccounts,  int errorAccounts,  int rateLimitAccounts,  int overloadAccounts,  int totalRequests,  int totalInputTokens,  int totalOutputTokens,  int totalCacheCreationTokens,  int totalCacheReadTokens,  int totalTokens,  Sub2ApiDecimal totalCost,  Sub2ApiDecimal totalActualCost,  int todayRequests,  int todayInputTokens,  int todayOutputTokens,  int todayCacheCreationTokens,  int todayCacheReadTokens,  int todayTokens,  Sub2ApiDecimal todayCost,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal averageDurationMs,  int uptime,  int rpm,  int tpm)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardStats() when $default != null:
return $default(_that.totalUsers,_that.todayNewUsers,_that.activeUsers,_that.hourlyActiveUsers,_that.statsUpdatedAt,_that.statsStale,_that.totalApiKeys,_that.activeApiKeys,_that.totalAccounts,_that.normalAccounts,_that.errorAccounts,_that.rateLimitAccounts,_that.overloadAccounts,_that.totalRequests,_that.totalInputTokens,_that.totalOutputTokens,_that.totalCacheCreationTokens,_that.totalCacheReadTokens,_that.totalTokens,_that.totalCost,_that.totalActualCost,_that.todayRequests,_that.todayInputTokens,_that.todayOutputTokens,_that.todayCacheCreationTokens,_that.todayCacheReadTokens,_that.todayTokens,_that.todayCost,_that.todayActualCost,_that.averageDurationMs,_that.uptime,_that.rpm,_that.tpm);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminDashboardStats implements Sub2ApiAdminDashboardStats {
  const _Sub2ApiAdminDashboardStats({required this.totalUsers, required this.todayNewUsers, required this.activeUsers, required this.hourlyActiveUsers, required this.statsUpdatedAt, required this.statsStale, required this.totalApiKeys, required this.activeApiKeys, required this.totalAccounts, required this.normalAccounts, required this.errorAccounts, required this.rateLimitAccounts, required this.overloadAccounts, required this.totalRequests, required this.totalInputTokens, required this.totalOutputTokens, required this.totalCacheCreationTokens, required this.totalCacheReadTokens, required this.totalTokens, required this.totalCost, required this.totalActualCost, required this.todayRequests, required this.todayInputTokens, required this.todayOutputTokens, required this.todayCacheCreationTokens, required this.todayCacheReadTokens, required this.todayTokens, required this.todayCost, required this.todayActualCost, required this.averageDurationMs, required this.uptime, required this.rpm, required this.tpm});


@override final  int totalUsers;
@override final  int todayNewUsers;
@override final  int activeUsers;
@override final  int hourlyActiveUsers;
@override final  DateTime statsUpdatedAt;
@override final  bool statsStale;
@override final  int totalApiKeys;
@override final  int activeApiKeys;
@override final  int totalAccounts;
@override final  int normalAccounts;
@override final  int errorAccounts;
@override final  int rateLimitAccounts;
@override final  int overloadAccounts;
@override final  int totalRequests;
@override final  int totalInputTokens;
@override final  int totalOutputTokens;
@override final  int totalCacheCreationTokens;
@override final  int totalCacheReadTokens;
@override final  int totalTokens;
@override final  Sub2ApiDecimal totalCost;
@override final  Sub2ApiDecimal totalActualCost;
@override final  int todayRequests;
@override final  int todayInputTokens;
@override final  int todayOutputTokens;
@override final  int todayCacheCreationTokens;
@override final  int todayCacheReadTokens;
@override final  int todayTokens;
@override final  Sub2ApiDecimal todayCost;
@override final  Sub2ApiDecimal todayActualCost;
@override final  Sub2ApiDecimal averageDurationMs;
@override final  int uptime;
@override final  int rpm;
@override final  int tpm;

/// Create a copy of Sub2ApiAdminDashboardStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminDashboardStatsCopyWith<_Sub2ApiAdminDashboardStats> get copyWith => __$Sub2ApiAdminDashboardStatsCopyWithImpl<_Sub2ApiAdminDashboardStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminDashboardStats&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers)&&(identical(other.todayNewUsers, todayNewUsers) || other.todayNewUsers == todayNewUsers)&&(identical(other.activeUsers, activeUsers) || other.activeUsers == activeUsers)&&(identical(other.hourlyActiveUsers, hourlyActiveUsers) || other.hourlyActiveUsers == hourlyActiveUsers)&&(identical(other.statsUpdatedAt, statsUpdatedAt) || other.statsUpdatedAt == statsUpdatedAt)&&(identical(other.statsStale, statsStale) || other.statsStale == statsStale)&&(identical(other.totalApiKeys, totalApiKeys) || other.totalApiKeys == totalApiKeys)&&(identical(other.activeApiKeys, activeApiKeys) || other.activeApiKeys == activeApiKeys)&&(identical(other.totalAccounts, totalAccounts) || other.totalAccounts == totalAccounts)&&(identical(other.normalAccounts, normalAccounts) || other.normalAccounts == normalAccounts)&&(identical(other.errorAccounts, errorAccounts) || other.errorAccounts == errorAccounts)&&(identical(other.rateLimitAccounts, rateLimitAccounts) || other.rateLimitAccounts == rateLimitAccounts)&&(identical(other.overloadAccounts, overloadAccounts) || other.overloadAccounts == overloadAccounts)&&(identical(other.totalRequests, totalRequests) || other.totalRequests == totalRequests)&&(identical(other.totalInputTokens, totalInputTokens) || other.totalInputTokens == totalInputTokens)&&(identical(other.totalOutputTokens, totalOutputTokens) || other.totalOutputTokens == totalOutputTokens)&&(identical(other.totalCacheCreationTokens, totalCacheCreationTokens) || other.totalCacheCreationTokens == totalCacheCreationTokens)&&(identical(other.totalCacheReadTokens, totalCacheReadTokens) || other.totalCacheReadTokens == totalCacheReadTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.totalActualCost, totalActualCost) || other.totalActualCost == totalActualCost)&&(identical(other.todayRequests, todayRequests) || other.todayRequests == todayRequests)&&(identical(other.todayInputTokens, todayInputTokens) || other.todayInputTokens == todayInputTokens)&&(identical(other.todayOutputTokens, todayOutputTokens) || other.todayOutputTokens == todayOutputTokens)&&(identical(other.todayCacheCreationTokens, todayCacheCreationTokens) || other.todayCacheCreationTokens == todayCacheCreationTokens)&&(identical(other.todayCacheReadTokens, todayCacheReadTokens) || other.todayCacheReadTokens == todayCacheReadTokens)&&(identical(other.todayTokens, todayTokens) || other.todayTokens == todayTokens)&&(identical(other.todayCost, todayCost) || other.todayCost == todayCost)&&(identical(other.todayActualCost, todayActualCost) || other.todayActualCost == todayActualCost)&&(identical(other.averageDurationMs, averageDurationMs) || other.averageDurationMs == averageDurationMs)&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.rpm, rpm) || other.rpm == rpm)&&(identical(other.tpm, tpm) || other.tpm == tpm));
}


@override
int get hashCode => Object.hashAll([runtimeType,totalUsers,todayNewUsers,activeUsers,hourlyActiveUsers,statsUpdatedAt,statsStale,totalApiKeys,activeApiKeys,totalAccounts,normalAccounts,errorAccounts,rateLimitAccounts,overloadAccounts,totalRequests,totalInputTokens,totalOutputTokens,totalCacheCreationTokens,totalCacheReadTokens,totalTokens,totalCost,totalActualCost,todayRequests,todayInputTokens,todayOutputTokens,todayCacheCreationTokens,todayCacheReadTokens,todayTokens,todayCost,todayActualCost,averageDurationMs,uptime,rpm,tpm]);

@override
String toString() {
  return 'Sub2ApiAdminDashboardStats(totalUsers: $totalUsers, todayNewUsers: $todayNewUsers, activeUsers: $activeUsers, hourlyActiveUsers: $hourlyActiveUsers, statsUpdatedAt: $statsUpdatedAt, statsStale: $statsStale, totalApiKeys: $totalApiKeys, activeApiKeys: $activeApiKeys, totalAccounts: $totalAccounts, normalAccounts: $normalAccounts, errorAccounts: $errorAccounts, rateLimitAccounts: $rateLimitAccounts, overloadAccounts: $overloadAccounts, totalRequests: $totalRequests, totalInputTokens: $totalInputTokens, totalOutputTokens: $totalOutputTokens, totalCacheCreationTokens: $totalCacheCreationTokens, totalCacheReadTokens: $totalCacheReadTokens, totalTokens: $totalTokens, totalCost: $totalCost, totalActualCost: $totalActualCost, todayRequests: $todayRequests, todayInputTokens: $todayInputTokens, todayOutputTokens: $todayOutputTokens, todayCacheCreationTokens: $todayCacheCreationTokens, todayCacheReadTokens: $todayCacheReadTokens, todayTokens: $todayTokens, todayCost: $todayCost, todayActualCost: $todayActualCost, averageDurationMs: $averageDurationMs, uptime: $uptime, rpm: $rpm, tpm: $tpm)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminDashboardStatsCopyWith<$Res> implements $Sub2ApiAdminDashboardStatsCopyWith<$Res> {
  factory _$Sub2ApiAdminDashboardStatsCopyWith(_Sub2ApiAdminDashboardStats value, $Res Function(_Sub2ApiAdminDashboardStats) _then) = __$Sub2ApiAdminDashboardStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalUsers, int todayNewUsers, int activeUsers, int hourlyActiveUsers, DateTime statsUpdatedAt, bool statsStale, int totalApiKeys, int activeApiKeys, int totalAccounts, int normalAccounts, int errorAccounts, int rateLimitAccounts, int overloadAccounts, int totalRequests, int totalInputTokens, int totalOutputTokens, int totalCacheCreationTokens, int totalCacheReadTokens, int totalTokens, Sub2ApiDecimal totalCost, Sub2ApiDecimal totalActualCost, int todayRequests, int todayInputTokens, int todayOutputTokens, int todayCacheCreationTokens, int todayCacheReadTokens, int todayTokens, Sub2ApiDecimal todayCost, Sub2ApiDecimal todayActualCost, Sub2ApiDecimal averageDurationMs, int uptime, int rpm, int tpm
});




}
/// @nodoc
class __$Sub2ApiAdminDashboardStatsCopyWithImpl<$Res>
    implements _$Sub2ApiAdminDashboardStatsCopyWith<$Res> {
  __$Sub2ApiAdminDashboardStatsCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminDashboardStats _self;
  final $Res Function(_Sub2ApiAdminDashboardStats) _then;

/// Create a copy of Sub2ApiAdminDashboardStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalUsers = null,Object? todayNewUsers = null,Object? activeUsers = null,Object? hourlyActiveUsers = null,Object? statsUpdatedAt = null,Object? statsStale = null,Object? totalApiKeys = null,Object? activeApiKeys = null,Object? totalAccounts = null,Object? normalAccounts = null,Object? errorAccounts = null,Object? rateLimitAccounts = null,Object? overloadAccounts = null,Object? totalRequests = null,Object? totalInputTokens = null,Object? totalOutputTokens = null,Object? totalCacheCreationTokens = null,Object? totalCacheReadTokens = null,Object? totalTokens = null,Object? totalCost = null,Object? totalActualCost = null,Object? todayRequests = null,Object? todayInputTokens = null,Object? todayOutputTokens = null,Object? todayCacheCreationTokens = null,Object? todayCacheReadTokens = null,Object? todayTokens = null,Object? todayCost = null,Object? todayActualCost = null,Object? averageDurationMs = null,Object? uptime = null,Object? rpm = null,Object? tpm = null,}) {
  return _then(_Sub2ApiAdminDashboardStats(
totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,todayNewUsers: null == todayNewUsers ? _self.todayNewUsers : todayNewUsers // ignore: cast_nullable_to_non_nullable
as int,activeUsers: null == activeUsers ? _self.activeUsers : activeUsers // ignore: cast_nullable_to_non_nullable
as int,hourlyActiveUsers: null == hourlyActiveUsers ? _self.hourlyActiveUsers : hourlyActiveUsers // ignore: cast_nullable_to_non_nullable
as int,statsUpdatedAt: null == statsUpdatedAt ? _self.statsUpdatedAt : statsUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,statsStale: null == statsStale ? _self.statsStale : statsStale // ignore: cast_nullable_to_non_nullable
as bool,totalApiKeys: null == totalApiKeys ? _self.totalApiKeys : totalApiKeys // ignore: cast_nullable_to_non_nullable
as int,activeApiKeys: null == activeApiKeys ? _self.activeApiKeys : activeApiKeys // ignore: cast_nullable_to_non_nullable
as int,totalAccounts: null == totalAccounts ? _self.totalAccounts : totalAccounts // ignore: cast_nullable_to_non_nullable
as int,normalAccounts: null == normalAccounts ? _self.normalAccounts : normalAccounts // ignore: cast_nullable_to_non_nullable
as int,errorAccounts: null == errorAccounts ? _self.errorAccounts : errorAccounts // ignore: cast_nullable_to_non_nullable
as int,rateLimitAccounts: null == rateLimitAccounts ? _self.rateLimitAccounts : rateLimitAccounts // ignore: cast_nullable_to_non_nullable
as int,overloadAccounts: null == overloadAccounts ? _self.overloadAccounts : overloadAccounts // ignore: cast_nullable_to_non_nullable
as int,totalRequests: null == totalRequests ? _self.totalRequests : totalRequests // ignore: cast_nullable_to_non_nullable
as int,totalInputTokens: null == totalInputTokens ? _self.totalInputTokens : totalInputTokens // ignore: cast_nullable_to_non_nullable
as int,totalOutputTokens: null == totalOutputTokens ? _self.totalOutputTokens : totalOutputTokens // ignore: cast_nullable_to_non_nullable
as int,totalCacheCreationTokens: null == totalCacheCreationTokens ? _self.totalCacheCreationTokens : totalCacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,totalCacheReadTokens: null == totalCacheReadTokens ? _self.totalCacheReadTokens : totalCacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,totalCost: null == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalActualCost: null == totalActualCost ? _self.totalActualCost : totalActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,todayRequests: null == todayRequests ? _self.todayRequests : todayRequests // ignore: cast_nullable_to_non_nullable
as int,todayInputTokens: null == todayInputTokens ? _self.todayInputTokens : todayInputTokens // ignore: cast_nullable_to_non_nullable
as int,todayOutputTokens: null == todayOutputTokens ? _self.todayOutputTokens : todayOutputTokens // ignore: cast_nullable_to_non_nullable
as int,todayCacheCreationTokens: null == todayCacheCreationTokens ? _self.todayCacheCreationTokens : todayCacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,todayCacheReadTokens: null == todayCacheReadTokens ? _self.todayCacheReadTokens : todayCacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,todayTokens: null == todayTokens ? _self.todayTokens : todayTokens // ignore: cast_nullable_to_non_nullable
as int,todayCost: null == todayCost ? _self.todayCost : todayCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,todayActualCost: null == todayActualCost ? _self.todayActualCost : todayActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,averageDurationMs: null == averageDurationMs ? _self.averageDurationMs : averageDurationMs // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as int,rpm: null == rpm ? _self.rpm : rpm // ignore: cast_nullable_to_non_nullable
as int,tpm: null == tpm ? _self.tpm : tpm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminDashboardRealtimeMetrics {

 int get activeRequests; int get requestsPerMinute; Sub2ApiDecimal get averageResponseTime; Sub2ApiDecimal get errorRate;
/// Create a copy of Sub2ApiAdminDashboardRealtimeMetrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardRealtimeMetricsCopyWith<Sub2ApiAdminDashboardRealtimeMetrics> get copyWith => _$Sub2ApiAdminDashboardRealtimeMetricsCopyWithImpl<Sub2ApiAdminDashboardRealtimeMetrics>(this as Sub2ApiAdminDashboardRealtimeMetrics, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminDashboardRealtimeMetrics&&(identical(other.activeRequests, activeRequests) || other.activeRequests == activeRequests)&&(identical(other.requestsPerMinute, requestsPerMinute) || other.requestsPerMinute == requestsPerMinute)&&(identical(other.averageResponseTime, averageResponseTime) || other.averageResponseTime == averageResponseTime)&&(identical(other.errorRate, errorRate) || other.errorRate == errorRate));
}


@override
int get hashCode => Object.hash(runtimeType,activeRequests,requestsPerMinute,averageResponseTime,errorRate);

@override
String toString() {
  return 'Sub2ApiAdminDashboardRealtimeMetrics(activeRequests: $activeRequests, requestsPerMinute: $requestsPerMinute, averageResponseTime: $averageResponseTime, errorRate: $errorRate)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminDashboardRealtimeMetricsCopyWith<$Res>  {
  factory $Sub2ApiAdminDashboardRealtimeMetricsCopyWith(Sub2ApiAdminDashboardRealtimeMetrics value, $Res Function(Sub2ApiAdminDashboardRealtimeMetrics) _then) = _$Sub2ApiAdminDashboardRealtimeMetricsCopyWithImpl;
@useResult
$Res call({
 int activeRequests, int requestsPerMinute, Sub2ApiDecimal averageResponseTime, Sub2ApiDecimal errorRate
});




}
/// @nodoc
class _$Sub2ApiAdminDashboardRealtimeMetricsCopyWithImpl<$Res>
    implements $Sub2ApiAdminDashboardRealtimeMetricsCopyWith<$Res> {
  _$Sub2ApiAdminDashboardRealtimeMetricsCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminDashboardRealtimeMetrics _self;
  final $Res Function(Sub2ApiAdminDashboardRealtimeMetrics) _then;

/// Create a copy of Sub2ApiAdminDashboardRealtimeMetrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeRequests = null,Object? requestsPerMinute = null,Object? averageResponseTime = null,Object? errorRate = null,}) {
  return _then(_self.copyWith(
activeRequests: null == activeRequests ? _self.activeRequests : activeRequests // ignore: cast_nullable_to_non_nullable
as int,requestsPerMinute: null == requestsPerMinute ? _self.requestsPerMinute : requestsPerMinute // ignore: cast_nullable_to_non_nullable
as int,averageResponseTime: null == averageResponseTime ? _self.averageResponseTime : averageResponseTime // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,errorRate: null == errorRate ? _self.errorRate : errorRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminDashboardRealtimeMetrics].
extension Sub2ApiAdminDashboardRealtimeMetricsPatterns on Sub2ApiAdminDashboardRealtimeMetrics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardRealtimeMetrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardRealtimeMetrics() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardRealtimeMetrics value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardRealtimeMetrics():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminDashboardRealtimeMetrics value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardRealtimeMetrics() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int activeRequests,  int requestsPerMinute,  Sub2ApiDecimal averageResponseTime,  Sub2ApiDecimal errorRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardRealtimeMetrics() when $default != null:
return $default(_that.activeRequests,_that.requestsPerMinute,_that.averageResponseTime,_that.errorRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int activeRequests,  int requestsPerMinute,  Sub2ApiDecimal averageResponseTime,  Sub2ApiDecimal errorRate)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardRealtimeMetrics():
return $default(_that.activeRequests,_that.requestsPerMinute,_that.averageResponseTime,_that.errorRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int activeRequests,  int requestsPerMinute,  Sub2ApiDecimal averageResponseTime,  Sub2ApiDecimal errorRate)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardRealtimeMetrics() when $default != null:
return $default(_that.activeRequests,_that.requestsPerMinute,_that.averageResponseTime,_that.errorRate);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminDashboardRealtimeMetrics implements Sub2ApiAdminDashboardRealtimeMetrics {
  const _Sub2ApiAdminDashboardRealtimeMetrics({required this.activeRequests, required this.requestsPerMinute, required this.averageResponseTime, required this.errorRate});


@override final  int activeRequests;
@override final  int requestsPerMinute;
@override final  Sub2ApiDecimal averageResponseTime;
@override final  Sub2ApiDecimal errorRate;

/// Create a copy of Sub2ApiAdminDashboardRealtimeMetrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminDashboardRealtimeMetricsCopyWith<_Sub2ApiAdminDashboardRealtimeMetrics> get copyWith => __$Sub2ApiAdminDashboardRealtimeMetricsCopyWithImpl<_Sub2ApiAdminDashboardRealtimeMetrics>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminDashboardRealtimeMetrics&&(identical(other.activeRequests, activeRequests) || other.activeRequests == activeRequests)&&(identical(other.requestsPerMinute, requestsPerMinute) || other.requestsPerMinute == requestsPerMinute)&&(identical(other.averageResponseTime, averageResponseTime) || other.averageResponseTime == averageResponseTime)&&(identical(other.errorRate, errorRate) || other.errorRate == errorRate));
}


@override
int get hashCode => Object.hash(runtimeType,activeRequests,requestsPerMinute,averageResponseTime,errorRate);

@override
String toString() {
  return 'Sub2ApiAdminDashboardRealtimeMetrics(activeRequests: $activeRequests, requestsPerMinute: $requestsPerMinute, averageResponseTime: $averageResponseTime, errorRate: $errorRate)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminDashboardRealtimeMetricsCopyWith<$Res> implements $Sub2ApiAdminDashboardRealtimeMetricsCopyWith<$Res> {
  factory _$Sub2ApiAdminDashboardRealtimeMetricsCopyWith(_Sub2ApiAdminDashboardRealtimeMetrics value, $Res Function(_Sub2ApiAdminDashboardRealtimeMetrics) _then) = __$Sub2ApiAdminDashboardRealtimeMetricsCopyWithImpl;
@override @useResult
$Res call({
 int activeRequests, int requestsPerMinute, Sub2ApiDecimal averageResponseTime, Sub2ApiDecimal errorRate
});




}
/// @nodoc
class __$Sub2ApiAdminDashboardRealtimeMetricsCopyWithImpl<$Res>
    implements _$Sub2ApiAdminDashboardRealtimeMetricsCopyWith<$Res> {
  __$Sub2ApiAdminDashboardRealtimeMetricsCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminDashboardRealtimeMetrics _self;
  final $Res Function(_Sub2ApiAdminDashboardRealtimeMetrics) _then;

/// Create a copy of Sub2ApiAdminDashboardRealtimeMetrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeRequests = null,Object? requestsPerMinute = null,Object? averageResponseTime = null,Object? errorRate = null,}) {
  return _then(_Sub2ApiAdminDashboardRealtimeMetrics(
activeRequests: null == activeRequests ? _self.activeRequests : activeRequests // ignore: cast_nullable_to_non_nullable
as int,requestsPerMinute: null == requestsPerMinute ? _self.requestsPerMinute : requestsPerMinute // ignore: cast_nullable_to_non_nullable
as int,averageResponseTime: null == averageResponseTime ? _self.averageResponseTime : averageResponseTime // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,errorRate: null == errorRate ? _self.errorRate : errorRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminDashboardTrendPoint {

 String get date; int get requests; int get inputTokens; int get outputTokens; int get cacheCreationTokens; int get cacheReadTokens; int get totalTokens; Sub2ApiDecimal get cost; Sub2ApiDecimal get actualCost;
/// Create a copy of Sub2ApiAdminDashboardTrendPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardTrendPointCopyWith<Sub2ApiAdminDashboardTrendPoint> get copyWith => _$Sub2ApiAdminDashboardTrendPointCopyWithImpl<Sub2ApiAdminDashboardTrendPoint>(this as Sub2ApiAdminDashboardTrendPoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminDashboardTrendPoint&&(identical(other.date, date) || other.date == date)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.inputTokens, inputTokens) || other.inputTokens == inputTokens)&&(identical(other.outputTokens, outputTokens) || other.outputTokens == outputTokens)&&(identical(other.cacheCreationTokens, cacheCreationTokens) || other.cacheCreationTokens == cacheCreationTokens)&&(identical(other.cacheReadTokens, cacheReadTokens) || other.cacheReadTokens == cacheReadTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost));
}


@override
int get hashCode => Object.hash(runtimeType,date,requests,inputTokens,outputTokens,cacheCreationTokens,cacheReadTokens,totalTokens,cost,actualCost);

@override
String toString() {
  return 'Sub2ApiAdminDashboardTrendPoint(date: $date, requests: $requests, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheCreationTokens: $cacheCreationTokens, cacheReadTokens: $cacheReadTokens, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminDashboardTrendPointCopyWith<$Res>  {
  factory $Sub2ApiAdminDashboardTrendPointCopyWith(Sub2ApiAdminDashboardTrendPoint value, $Res Function(Sub2ApiAdminDashboardTrendPoint) _then) = _$Sub2ApiAdminDashboardTrendPointCopyWithImpl;
@useResult
$Res call({
 String date, int requests, int inputTokens, int outputTokens, int cacheCreationTokens, int cacheReadTokens, int totalTokens, Sub2ApiDecimal cost, Sub2ApiDecimal actualCost
});




}
/// @nodoc
class _$Sub2ApiAdminDashboardTrendPointCopyWithImpl<$Res>
    implements $Sub2ApiAdminDashboardTrendPointCopyWith<$Res> {
  _$Sub2ApiAdminDashboardTrendPointCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminDashboardTrendPoint _self;
  final $Res Function(Sub2ApiAdminDashboardTrendPoint) _then;

/// Create a copy of Sub2ApiAdminDashboardTrendPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? requests = null,Object? inputTokens = null,Object? outputTokens = null,Object? cacheCreationTokens = null,Object? cacheReadTokens = null,Object? totalTokens = null,Object? cost = null,Object? actualCost = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,inputTokens: null == inputTokens ? _self.inputTokens : inputTokens // ignore: cast_nullable_to_non_nullable
as int,outputTokens: null == outputTokens ? _self.outputTokens : outputTokens // ignore: cast_nullable_to_non_nullable
as int,cacheCreationTokens: null == cacheCreationTokens ? _self.cacheCreationTokens : cacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,cacheReadTokens: null == cacheReadTokens ? _self.cacheReadTokens : cacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,actualCost: null == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminDashboardTrendPoint].
extension Sub2ApiAdminDashboardTrendPointPatterns on Sub2ApiAdminDashboardTrendPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardTrendPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardTrendPoint() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardTrendPoint value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardTrendPoint():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminDashboardTrendPoint value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardTrendPoint() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  int requests,  int inputTokens,  int outputTokens,  int cacheCreationTokens,  int cacheReadTokens,  int totalTokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardTrendPoint() when $default != null:
return $default(_that.date,_that.requests,_that.inputTokens,_that.outputTokens,_that.cacheCreationTokens,_that.cacheReadTokens,_that.totalTokens,_that.cost,_that.actualCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  int requests,  int inputTokens,  int outputTokens,  int cacheCreationTokens,  int cacheReadTokens,  int totalTokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardTrendPoint():
return $default(_that.date,_that.requests,_that.inputTokens,_that.outputTokens,_that.cacheCreationTokens,_that.cacheReadTokens,_that.totalTokens,_that.cost,_that.actualCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  int requests,  int inputTokens,  int outputTokens,  int cacheCreationTokens,  int cacheReadTokens,  int totalTokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardTrendPoint() when $default != null:
return $default(_that.date,_that.requests,_that.inputTokens,_that.outputTokens,_that.cacheCreationTokens,_that.cacheReadTokens,_that.totalTokens,_that.cost,_that.actualCost);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminDashboardTrendPoint implements Sub2ApiAdminDashboardTrendPoint {
  const _Sub2ApiAdminDashboardTrendPoint({required this.date, required this.requests, required this.inputTokens, required this.outputTokens, required this.cacheCreationTokens, required this.cacheReadTokens, required this.totalTokens, required this.cost, required this.actualCost});


@override final  String date;
@override final  int requests;
@override final  int inputTokens;
@override final  int outputTokens;
@override final  int cacheCreationTokens;
@override final  int cacheReadTokens;
@override final  int totalTokens;
@override final  Sub2ApiDecimal cost;
@override final  Sub2ApiDecimal actualCost;

/// Create a copy of Sub2ApiAdminDashboardTrendPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminDashboardTrendPointCopyWith<_Sub2ApiAdminDashboardTrendPoint> get copyWith => __$Sub2ApiAdminDashboardTrendPointCopyWithImpl<_Sub2ApiAdminDashboardTrendPoint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminDashboardTrendPoint&&(identical(other.date, date) || other.date == date)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.inputTokens, inputTokens) || other.inputTokens == inputTokens)&&(identical(other.outputTokens, outputTokens) || other.outputTokens == outputTokens)&&(identical(other.cacheCreationTokens, cacheCreationTokens) || other.cacheCreationTokens == cacheCreationTokens)&&(identical(other.cacheReadTokens, cacheReadTokens) || other.cacheReadTokens == cacheReadTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost));
}


@override
int get hashCode => Object.hash(runtimeType,date,requests,inputTokens,outputTokens,cacheCreationTokens,cacheReadTokens,totalTokens,cost,actualCost);

@override
String toString() {
  return 'Sub2ApiAdminDashboardTrendPoint(date: $date, requests: $requests, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheCreationTokens: $cacheCreationTokens, cacheReadTokens: $cacheReadTokens, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminDashboardTrendPointCopyWith<$Res> implements $Sub2ApiAdminDashboardTrendPointCopyWith<$Res> {
  factory _$Sub2ApiAdminDashboardTrendPointCopyWith(_Sub2ApiAdminDashboardTrendPoint value, $Res Function(_Sub2ApiAdminDashboardTrendPoint) _then) = __$Sub2ApiAdminDashboardTrendPointCopyWithImpl;
@override @useResult
$Res call({
 String date, int requests, int inputTokens, int outputTokens, int cacheCreationTokens, int cacheReadTokens, int totalTokens, Sub2ApiDecimal cost, Sub2ApiDecimal actualCost
});




}
/// @nodoc
class __$Sub2ApiAdminDashboardTrendPointCopyWithImpl<$Res>
    implements _$Sub2ApiAdminDashboardTrendPointCopyWith<$Res> {
  __$Sub2ApiAdminDashboardTrendPointCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminDashboardTrendPoint _self;
  final $Res Function(_Sub2ApiAdminDashboardTrendPoint) _then;

/// Create a copy of Sub2ApiAdminDashboardTrendPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? requests = null,Object? inputTokens = null,Object? outputTokens = null,Object? cacheCreationTokens = null,Object? cacheReadTokens = null,Object? totalTokens = null,Object? cost = null,Object? actualCost = null,}) {
  return _then(_Sub2ApiAdminDashboardTrendPoint(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,inputTokens: null == inputTokens ? _self.inputTokens : inputTokens // ignore: cast_nullable_to_non_nullable
as int,outputTokens: null == outputTokens ? _self.outputTokens : outputTokens // ignore: cast_nullable_to_non_nullable
as int,cacheCreationTokens: null == cacheCreationTokens ? _self.cacheCreationTokens : cacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,cacheReadTokens: null == cacheReadTokens ? _self.cacheReadTokens : cacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,actualCost: null == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminDashboardTrend {

 List<Sub2ApiAdminDashboardTrendPoint> get points; DateTime get startDate; DateTime get endDate; Sub2ApiAdminUsageGranularity get granularity;
/// Create a copy of Sub2ApiAdminDashboardTrend
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardTrendCopyWith<Sub2ApiAdminDashboardTrend> get copyWith => _$Sub2ApiAdminDashboardTrendCopyWithImpl<Sub2ApiAdminDashboardTrend>(this as Sub2ApiAdminDashboardTrend, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminDashboardTrend&&const DeepCollectionEquality().equals(other.points, points)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.granularity, granularity) || other.granularity == granularity));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(points),startDate,endDate,granularity);

@override
String toString() {
  return 'Sub2ApiAdminDashboardTrend(points: $points, startDate: $startDate, endDate: $endDate, granularity: $granularity)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminDashboardTrendCopyWith<$Res>  {
  factory $Sub2ApiAdminDashboardTrendCopyWith(Sub2ApiAdminDashboardTrend value, $Res Function(Sub2ApiAdminDashboardTrend) _then) = _$Sub2ApiAdminDashboardTrendCopyWithImpl;
@useResult
$Res call({
 List<Sub2ApiAdminDashboardTrendPoint> points, DateTime startDate, DateTime endDate, Sub2ApiAdminUsageGranularity granularity
});




}
/// @nodoc
class _$Sub2ApiAdminDashboardTrendCopyWithImpl<$Res>
    implements $Sub2ApiAdminDashboardTrendCopyWith<$Res> {
  _$Sub2ApiAdminDashboardTrendCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminDashboardTrend _self;
  final $Res Function(Sub2ApiAdminDashboardTrend) _then;

/// Create a copy of Sub2ApiAdminDashboardTrend
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? startDate = null,Object? endDate = null,Object? granularity = null,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminDashboardTrendPoint>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageGranularity,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminDashboardTrend].
extension Sub2ApiAdminDashboardTrendPatterns on Sub2ApiAdminDashboardTrend {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardTrend value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardTrend() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardTrend value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardTrend():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminDashboardTrend value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardTrend() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Sub2ApiAdminDashboardTrendPoint> points,  DateTime startDate,  DateTime endDate,  Sub2ApiAdminUsageGranularity granularity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardTrend() when $default != null:
return $default(_that.points,_that.startDate,_that.endDate,_that.granularity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Sub2ApiAdminDashboardTrendPoint> points,  DateTime startDate,  DateTime endDate,  Sub2ApiAdminUsageGranularity granularity)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardTrend():
return $default(_that.points,_that.startDate,_that.endDate,_that.granularity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Sub2ApiAdminDashboardTrendPoint> points,  DateTime startDate,  DateTime endDate,  Sub2ApiAdminUsageGranularity granularity)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardTrend() when $default != null:
return $default(_that.points,_that.startDate,_that.endDate,_that.granularity);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminDashboardTrend implements Sub2ApiAdminDashboardTrend {
  const _Sub2ApiAdminDashboardTrend({required final  List<Sub2ApiAdminDashboardTrendPoint> points, required this.startDate, required this.endDate, required this.granularity}): _points = points;


 final  List<Sub2ApiAdminDashboardTrendPoint> _points;
@override List<Sub2ApiAdminDashboardTrendPoint> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}

@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  Sub2ApiAdminUsageGranularity granularity;

/// Create a copy of Sub2ApiAdminDashboardTrend
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminDashboardTrendCopyWith<_Sub2ApiAdminDashboardTrend> get copyWith => __$Sub2ApiAdminDashboardTrendCopyWithImpl<_Sub2ApiAdminDashboardTrend>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminDashboardTrend&&const DeepCollectionEquality().equals(other._points, _points)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.granularity, granularity) || other.granularity == granularity));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_points),startDate,endDate,granularity);

@override
String toString() {
  return 'Sub2ApiAdminDashboardTrend(points: $points, startDate: $startDate, endDate: $endDate, granularity: $granularity)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminDashboardTrendCopyWith<$Res> implements $Sub2ApiAdminDashboardTrendCopyWith<$Res> {
  factory _$Sub2ApiAdminDashboardTrendCopyWith(_Sub2ApiAdminDashboardTrend value, $Res Function(_Sub2ApiAdminDashboardTrend) _then) = __$Sub2ApiAdminDashboardTrendCopyWithImpl;
@override @useResult
$Res call({
 List<Sub2ApiAdminDashboardTrendPoint> points, DateTime startDate, DateTime endDate, Sub2ApiAdminUsageGranularity granularity
});




}
/// @nodoc
class __$Sub2ApiAdminDashboardTrendCopyWithImpl<$Res>
    implements _$Sub2ApiAdminDashboardTrendCopyWith<$Res> {
  __$Sub2ApiAdminDashboardTrendCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminDashboardTrend _self;
  final $Res Function(_Sub2ApiAdminDashboardTrend) _then;

/// Create a copy of Sub2ApiAdminDashboardTrend
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? startDate = null,Object? endDate = null,Object? granularity = null,}) {
  return _then(_Sub2ApiAdminDashboardTrend(
points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminDashboardTrendPoint>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageGranularity,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminDashboardModelStats {

 String get model; int get requests; int get inputTokens; int get outputTokens; int get cacheCreationTokens; int get cacheReadTokens; int get totalTokens; Sub2ApiDecimal get cost; Sub2ApiDecimal get actualCost; Sub2ApiDecimal get accountCost;
/// Create a copy of Sub2ApiAdminDashboardModelStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardModelStatsCopyWith<Sub2ApiAdminDashboardModelStats> get copyWith => _$Sub2ApiAdminDashboardModelStatsCopyWithImpl<Sub2ApiAdminDashboardModelStats>(this as Sub2ApiAdminDashboardModelStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminDashboardModelStats&&(identical(other.model, model) || other.model == model)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.inputTokens, inputTokens) || other.inputTokens == inputTokens)&&(identical(other.outputTokens, outputTokens) || other.outputTokens == outputTokens)&&(identical(other.cacheCreationTokens, cacheCreationTokens) || other.cacheCreationTokens == cacheCreationTokens)&&(identical(other.cacheReadTokens, cacheReadTokens) || other.cacheReadTokens == cacheReadTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost)&&(identical(other.accountCost, accountCost) || other.accountCost == accountCost));
}


@override
int get hashCode => Object.hash(runtimeType,model,requests,inputTokens,outputTokens,cacheCreationTokens,cacheReadTokens,totalTokens,cost,actualCost,accountCost);

@override
String toString() {
  return 'Sub2ApiAdminDashboardModelStats(model: $model, requests: $requests, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheCreationTokens: $cacheCreationTokens, cacheReadTokens: $cacheReadTokens, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost, accountCost: $accountCost)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminDashboardModelStatsCopyWith<$Res>  {
  factory $Sub2ApiAdminDashboardModelStatsCopyWith(Sub2ApiAdminDashboardModelStats value, $Res Function(Sub2ApiAdminDashboardModelStats) _then) = _$Sub2ApiAdminDashboardModelStatsCopyWithImpl;
@useResult
$Res call({
 String model, int requests, int inputTokens, int outputTokens, int cacheCreationTokens, int cacheReadTokens, int totalTokens, Sub2ApiDecimal cost, Sub2ApiDecimal actualCost, Sub2ApiDecimal accountCost
});




}
/// @nodoc
class _$Sub2ApiAdminDashboardModelStatsCopyWithImpl<$Res>
    implements $Sub2ApiAdminDashboardModelStatsCopyWith<$Res> {
  _$Sub2ApiAdminDashboardModelStatsCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminDashboardModelStats _self;
  final $Res Function(Sub2ApiAdminDashboardModelStats) _then;

/// Create a copy of Sub2ApiAdminDashboardModelStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? requests = null,Object? inputTokens = null,Object? outputTokens = null,Object? cacheCreationTokens = null,Object? cacheReadTokens = null,Object? totalTokens = null,Object? cost = null,Object? actualCost = null,Object? accountCost = null,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,inputTokens: null == inputTokens ? _self.inputTokens : inputTokens // ignore: cast_nullable_to_non_nullable
as int,outputTokens: null == outputTokens ? _self.outputTokens : outputTokens // ignore: cast_nullable_to_non_nullable
as int,cacheCreationTokens: null == cacheCreationTokens ? _self.cacheCreationTokens : cacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,cacheReadTokens: null == cacheReadTokens ? _self.cacheReadTokens : cacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,actualCost: null == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,accountCost: null == accountCost ? _self.accountCost : accountCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminDashboardModelStats].
extension Sub2ApiAdminDashboardModelStatsPatterns on Sub2ApiAdminDashboardModelStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardModelStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardModelStats() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardModelStats value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardModelStats():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminDashboardModelStats value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardModelStats() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String model,  int requests,  int inputTokens,  int outputTokens,  int cacheCreationTokens,  int cacheReadTokens,  int totalTokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost,  Sub2ApiDecimal accountCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardModelStats() when $default != null:
return $default(_that.model,_that.requests,_that.inputTokens,_that.outputTokens,_that.cacheCreationTokens,_that.cacheReadTokens,_that.totalTokens,_that.cost,_that.actualCost,_that.accountCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String model,  int requests,  int inputTokens,  int outputTokens,  int cacheCreationTokens,  int cacheReadTokens,  int totalTokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost,  Sub2ApiDecimal accountCost)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardModelStats():
return $default(_that.model,_that.requests,_that.inputTokens,_that.outputTokens,_that.cacheCreationTokens,_that.cacheReadTokens,_that.totalTokens,_that.cost,_that.actualCost,_that.accountCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String model,  int requests,  int inputTokens,  int outputTokens,  int cacheCreationTokens,  int cacheReadTokens,  int totalTokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost,  Sub2ApiDecimal accountCost)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardModelStats() when $default != null:
return $default(_that.model,_that.requests,_that.inputTokens,_that.outputTokens,_that.cacheCreationTokens,_that.cacheReadTokens,_that.totalTokens,_that.cost,_that.actualCost,_that.accountCost);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminDashboardModelStats implements Sub2ApiAdminDashboardModelStats {
  const _Sub2ApiAdminDashboardModelStats({required this.model, required this.requests, required this.inputTokens, required this.outputTokens, required this.cacheCreationTokens, required this.cacheReadTokens, required this.totalTokens, required this.cost, required this.actualCost, required this.accountCost});


@override final  String model;
@override final  int requests;
@override final  int inputTokens;
@override final  int outputTokens;
@override final  int cacheCreationTokens;
@override final  int cacheReadTokens;
@override final  int totalTokens;
@override final  Sub2ApiDecimal cost;
@override final  Sub2ApiDecimal actualCost;
@override final  Sub2ApiDecimal accountCost;

/// Create a copy of Sub2ApiAdminDashboardModelStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminDashboardModelStatsCopyWith<_Sub2ApiAdminDashboardModelStats> get copyWith => __$Sub2ApiAdminDashboardModelStatsCopyWithImpl<_Sub2ApiAdminDashboardModelStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminDashboardModelStats&&(identical(other.model, model) || other.model == model)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.inputTokens, inputTokens) || other.inputTokens == inputTokens)&&(identical(other.outputTokens, outputTokens) || other.outputTokens == outputTokens)&&(identical(other.cacheCreationTokens, cacheCreationTokens) || other.cacheCreationTokens == cacheCreationTokens)&&(identical(other.cacheReadTokens, cacheReadTokens) || other.cacheReadTokens == cacheReadTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost)&&(identical(other.accountCost, accountCost) || other.accountCost == accountCost));
}


@override
int get hashCode => Object.hash(runtimeType,model,requests,inputTokens,outputTokens,cacheCreationTokens,cacheReadTokens,totalTokens,cost,actualCost,accountCost);

@override
String toString() {
  return 'Sub2ApiAdminDashboardModelStats(model: $model, requests: $requests, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheCreationTokens: $cacheCreationTokens, cacheReadTokens: $cacheReadTokens, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost, accountCost: $accountCost)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminDashboardModelStatsCopyWith<$Res> implements $Sub2ApiAdminDashboardModelStatsCopyWith<$Res> {
  factory _$Sub2ApiAdminDashboardModelStatsCopyWith(_Sub2ApiAdminDashboardModelStats value, $Res Function(_Sub2ApiAdminDashboardModelStats) _then) = __$Sub2ApiAdminDashboardModelStatsCopyWithImpl;
@override @useResult
$Res call({
 String model, int requests, int inputTokens, int outputTokens, int cacheCreationTokens, int cacheReadTokens, int totalTokens, Sub2ApiDecimal cost, Sub2ApiDecimal actualCost, Sub2ApiDecimal accountCost
});




}
/// @nodoc
class __$Sub2ApiAdminDashboardModelStatsCopyWithImpl<$Res>
    implements _$Sub2ApiAdminDashboardModelStatsCopyWith<$Res> {
  __$Sub2ApiAdminDashboardModelStatsCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminDashboardModelStats _self;
  final $Res Function(_Sub2ApiAdminDashboardModelStats) _then;

/// Create a copy of Sub2ApiAdminDashboardModelStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? requests = null,Object? inputTokens = null,Object? outputTokens = null,Object? cacheCreationTokens = null,Object? cacheReadTokens = null,Object? totalTokens = null,Object? cost = null,Object? actualCost = null,Object? accountCost = null,}) {
  return _then(_Sub2ApiAdminDashboardModelStats(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,inputTokens: null == inputTokens ? _self.inputTokens : inputTokens // ignore: cast_nullable_to_non_nullable
as int,outputTokens: null == outputTokens ? _self.outputTokens : outputTokens // ignore: cast_nullable_to_non_nullable
as int,cacheCreationTokens: null == cacheCreationTokens ? _self.cacheCreationTokens : cacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,cacheReadTokens: null == cacheReadTokens ? _self.cacheReadTokens : cacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,actualCost: null == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,accountCost: null == accountCost ? _self.accountCost : accountCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminDashboardModels {

 List<Sub2ApiAdminDashboardModelStats> get models; DateTime get startDate; DateTime get endDate;
/// Create a copy of Sub2ApiAdminDashboardModels
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardModelsCopyWith<Sub2ApiAdminDashboardModels> get copyWith => _$Sub2ApiAdminDashboardModelsCopyWithImpl<Sub2ApiAdminDashboardModels>(this as Sub2ApiAdminDashboardModels, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminDashboardModels&&const DeepCollectionEquality().equals(other.models, models)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(models),startDate,endDate);

@override
String toString() {
  return 'Sub2ApiAdminDashboardModels(models: $models, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminDashboardModelsCopyWith<$Res>  {
  factory $Sub2ApiAdminDashboardModelsCopyWith(Sub2ApiAdminDashboardModels value, $Res Function(Sub2ApiAdminDashboardModels) _then) = _$Sub2ApiAdminDashboardModelsCopyWithImpl;
@useResult
$Res call({
 List<Sub2ApiAdminDashboardModelStats> models, DateTime startDate, DateTime endDate
});




}
/// @nodoc
class _$Sub2ApiAdminDashboardModelsCopyWithImpl<$Res>
    implements $Sub2ApiAdminDashboardModelsCopyWith<$Res> {
  _$Sub2ApiAdminDashboardModelsCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminDashboardModels _self;
  final $Res Function(Sub2ApiAdminDashboardModels) _then;

/// Create a copy of Sub2ApiAdminDashboardModels
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? models = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
models: null == models ? _self.models : models // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminDashboardModelStats>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminDashboardModels].
extension Sub2ApiAdminDashboardModelsPatterns on Sub2ApiAdminDashboardModels {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardModels value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardModels() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardModels value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardModels():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminDashboardModels value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardModels() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Sub2ApiAdminDashboardModelStats> models,  DateTime startDate,  DateTime endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardModels() when $default != null:
return $default(_that.models,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Sub2ApiAdminDashboardModelStats> models,  DateTime startDate,  DateTime endDate)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardModels():
return $default(_that.models,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Sub2ApiAdminDashboardModelStats> models,  DateTime startDate,  DateTime endDate)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardModels() when $default != null:
return $default(_that.models,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminDashboardModels implements Sub2ApiAdminDashboardModels {
  const _Sub2ApiAdminDashboardModels({required final  List<Sub2ApiAdminDashboardModelStats> models, required this.startDate, required this.endDate}): _models = models;


 final  List<Sub2ApiAdminDashboardModelStats> _models;
@override List<Sub2ApiAdminDashboardModelStats> get models {
  if (_models is EqualUnmodifiableListView) return _models;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_models);
}

@override final  DateTime startDate;
@override final  DateTime endDate;

/// Create a copy of Sub2ApiAdminDashboardModels
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminDashboardModelsCopyWith<_Sub2ApiAdminDashboardModels> get copyWith => __$Sub2ApiAdminDashboardModelsCopyWithImpl<_Sub2ApiAdminDashboardModels>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminDashboardModels&&const DeepCollectionEquality().equals(other._models, _models)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_models),startDate,endDate);

@override
String toString() {
  return 'Sub2ApiAdminDashboardModels(models: $models, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminDashboardModelsCopyWith<$Res> implements $Sub2ApiAdminDashboardModelsCopyWith<$Res> {
  factory _$Sub2ApiAdminDashboardModelsCopyWith(_Sub2ApiAdminDashboardModels value, $Res Function(_Sub2ApiAdminDashboardModels) _then) = __$Sub2ApiAdminDashboardModelsCopyWithImpl;
@override @useResult
$Res call({
 List<Sub2ApiAdminDashboardModelStats> models, DateTime startDate, DateTime endDate
});




}
/// @nodoc
class __$Sub2ApiAdminDashboardModelsCopyWithImpl<$Res>
    implements _$Sub2ApiAdminDashboardModelsCopyWith<$Res> {
  __$Sub2ApiAdminDashboardModelsCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminDashboardModels _self;
  final $Res Function(_Sub2ApiAdminDashboardModels) _then;

/// Create a copy of Sub2ApiAdminDashboardModels
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? models = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_Sub2ApiAdminDashboardModels(
models: null == models ? _self._models : models // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminDashboardModelStats>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminDashboardGroupStats {

 int get groupId; String get groupName; int get requests; int get totalTokens; Sub2ApiDecimal get cost; Sub2ApiDecimal get actualCost; Sub2ApiDecimal get accountCost;
/// Create a copy of Sub2ApiAdminDashboardGroupStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardGroupStatsCopyWith<Sub2ApiAdminDashboardGroupStats> get copyWith => _$Sub2ApiAdminDashboardGroupStatsCopyWithImpl<Sub2ApiAdminDashboardGroupStats>(this as Sub2ApiAdminDashboardGroupStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminDashboardGroupStats&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost)&&(identical(other.accountCost, accountCost) || other.accountCost == accountCost));
}


@override
int get hashCode => Object.hash(runtimeType,groupId,groupName,requests,totalTokens,cost,actualCost,accountCost);

@override
String toString() {
  return 'Sub2ApiAdminDashboardGroupStats(groupId: $groupId, groupName: $groupName, requests: $requests, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost, accountCost: $accountCost)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminDashboardGroupStatsCopyWith<$Res>  {
  factory $Sub2ApiAdminDashboardGroupStatsCopyWith(Sub2ApiAdminDashboardGroupStats value, $Res Function(Sub2ApiAdminDashboardGroupStats) _then) = _$Sub2ApiAdminDashboardGroupStatsCopyWithImpl;
@useResult
$Res call({
 int groupId, String groupName, int requests, int totalTokens, Sub2ApiDecimal cost, Sub2ApiDecimal actualCost, Sub2ApiDecimal accountCost
});




}
/// @nodoc
class _$Sub2ApiAdminDashboardGroupStatsCopyWithImpl<$Res>
    implements $Sub2ApiAdminDashboardGroupStatsCopyWith<$Res> {
  _$Sub2ApiAdminDashboardGroupStatsCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminDashboardGroupStats _self;
  final $Res Function(Sub2ApiAdminDashboardGroupStats) _then;

/// Create a copy of Sub2ApiAdminDashboardGroupStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? groupName = null,Object? requests = null,Object? totalTokens = null,Object? cost = null,Object? actualCost = null,Object? accountCost = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,actualCost: null == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,accountCost: null == accountCost ? _self.accountCost : accountCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminDashboardGroupStats].
extension Sub2ApiAdminDashboardGroupStatsPatterns on Sub2ApiAdminDashboardGroupStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardGroupStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardGroupStats() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardGroupStats value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardGroupStats():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminDashboardGroupStats value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardGroupStats() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int groupId,  String groupName,  int requests,  int totalTokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost,  Sub2ApiDecimal accountCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardGroupStats() when $default != null:
return $default(_that.groupId,_that.groupName,_that.requests,_that.totalTokens,_that.cost,_that.actualCost,_that.accountCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int groupId,  String groupName,  int requests,  int totalTokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost,  Sub2ApiDecimal accountCost)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardGroupStats():
return $default(_that.groupId,_that.groupName,_that.requests,_that.totalTokens,_that.cost,_that.actualCost,_that.accountCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int groupId,  String groupName,  int requests,  int totalTokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost,  Sub2ApiDecimal accountCost)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardGroupStats() when $default != null:
return $default(_that.groupId,_that.groupName,_that.requests,_that.totalTokens,_that.cost,_that.actualCost,_that.accountCost);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminDashboardGroupStats implements Sub2ApiAdminDashboardGroupStats {
  const _Sub2ApiAdminDashboardGroupStats({required this.groupId, required this.groupName, required this.requests, required this.totalTokens, required this.cost, required this.actualCost, required this.accountCost});


@override final  int groupId;
@override final  String groupName;
@override final  int requests;
@override final  int totalTokens;
@override final  Sub2ApiDecimal cost;
@override final  Sub2ApiDecimal actualCost;
@override final  Sub2ApiDecimal accountCost;

/// Create a copy of Sub2ApiAdminDashboardGroupStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminDashboardGroupStatsCopyWith<_Sub2ApiAdminDashboardGroupStats> get copyWith => __$Sub2ApiAdminDashboardGroupStatsCopyWithImpl<_Sub2ApiAdminDashboardGroupStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminDashboardGroupStats&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost)&&(identical(other.accountCost, accountCost) || other.accountCost == accountCost));
}


@override
int get hashCode => Object.hash(runtimeType,groupId,groupName,requests,totalTokens,cost,actualCost,accountCost);

@override
String toString() {
  return 'Sub2ApiAdminDashboardGroupStats(groupId: $groupId, groupName: $groupName, requests: $requests, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost, accountCost: $accountCost)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminDashboardGroupStatsCopyWith<$Res> implements $Sub2ApiAdminDashboardGroupStatsCopyWith<$Res> {
  factory _$Sub2ApiAdminDashboardGroupStatsCopyWith(_Sub2ApiAdminDashboardGroupStats value, $Res Function(_Sub2ApiAdminDashboardGroupStats) _then) = __$Sub2ApiAdminDashboardGroupStatsCopyWithImpl;
@override @useResult
$Res call({
 int groupId, String groupName, int requests, int totalTokens, Sub2ApiDecimal cost, Sub2ApiDecimal actualCost, Sub2ApiDecimal accountCost
});




}
/// @nodoc
class __$Sub2ApiAdminDashboardGroupStatsCopyWithImpl<$Res>
    implements _$Sub2ApiAdminDashboardGroupStatsCopyWith<$Res> {
  __$Sub2ApiAdminDashboardGroupStatsCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminDashboardGroupStats _self;
  final $Res Function(_Sub2ApiAdminDashboardGroupStats) _then;

/// Create a copy of Sub2ApiAdminDashboardGroupStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? groupName = null,Object? requests = null,Object? totalTokens = null,Object? cost = null,Object? actualCost = null,Object? accountCost = null,}) {
  return _then(_Sub2ApiAdminDashboardGroupStats(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,actualCost: null == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,accountCost: null == accountCost ? _self.accountCost : accountCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminDashboardGroups {

 List<Sub2ApiAdminDashboardGroupStats> get groups; DateTime get startDate; DateTime get endDate;
/// Create a copy of Sub2ApiAdminDashboardGroups
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardGroupsCopyWith<Sub2ApiAdminDashboardGroups> get copyWith => _$Sub2ApiAdminDashboardGroupsCopyWithImpl<Sub2ApiAdminDashboardGroups>(this as Sub2ApiAdminDashboardGroups, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminDashboardGroups&&const DeepCollectionEquality().equals(other.groups, groups)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(groups),startDate,endDate);

@override
String toString() {
  return 'Sub2ApiAdminDashboardGroups(groups: $groups, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminDashboardGroupsCopyWith<$Res>  {
  factory $Sub2ApiAdminDashboardGroupsCopyWith(Sub2ApiAdminDashboardGroups value, $Res Function(Sub2ApiAdminDashboardGroups) _then) = _$Sub2ApiAdminDashboardGroupsCopyWithImpl;
@useResult
$Res call({
 List<Sub2ApiAdminDashboardGroupStats> groups, DateTime startDate, DateTime endDate
});




}
/// @nodoc
class _$Sub2ApiAdminDashboardGroupsCopyWithImpl<$Res>
    implements $Sub2ApiAdminDashboardGroupsCopyWith<$Res> {
  _$Sub2ApiAdminDashboardGroupsCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminDashboardGroups _self;
  final $Res Function(Sub2ApiAdminDashboardGroups) _then;

/// Create a copy of Sub2ApiAdminDashboardGroups
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groups = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminDashboardGroupStats>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminDashboardGroups].
extension Sub2ApiAdminDashboardGroupsPatterns on Sub2ApiAdminDashboardGroups {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardGroups value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardGroups() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardGroups value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardGroups():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminDashboardGroups value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardGroups() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Sub2ApiAdminDashboardGroupStats> groups,  DateTime startDate,  DateTime endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardGroups() when $default != null:
return $default(_that.groups,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Sub2ApiAdminDashboardGroupStats> groups,  DateTime startDate,  DateTime endDate)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardGroups():
return $default(_that.groups,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Sub2ApiAdminDashboardGroupStats> groups,  DateTime startDate,  DateTime endDate)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardGroups() when $default != null:
return $default(_that.groups,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminDashboardGroups implements Sub2ApiAdminDashboardGroups {
  const _Sub2ApiAdminDashboardGroups({required final  List<Sub2ApiAdminDashboardGroupStats> groups, required this.startDate, required this.endDate}): _groups = groups;


 final  List<Sub2ApiAdminDashboardGroupStats> _groups;
@override List<Sub2ApiAdminDashboardGroupStats> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

@override final  DateTime startDate;
@override final  DateTime endDate;

/// Create a copy of Sub2ApiAdminDashboardGroups
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminDashboardGroupsCopyWith<_Sub2ApiAdminDashboardGroups> get copyWith => __$Sub2ApiAdminDashboardGroupsCopyWithImpl<_Sub2ApiAdminDashboardGroups>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminDashboardGroups&&const DeepCollectionEquality().equals(other._groups, _groups)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_groups),startDate,endDate);

@override
String toString() {
  return 'Sub2ApiAdminDashboardGroups(groups: $groups, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminDashboardGroupsCopyWith<$Res> implements $Sub2ApiAdminDashboardGroupsCopyWith<$Res> {
  factory _$Sub2ApiAdminDashboardGroupsCopyWith(_Sub2ApiAdminDashboardGroups value, $Res Function(_Sub2ApiAdminDashboardGroups) _then) = __$Sub2ApiAdminDashboardGroupsCopyWithImpl;
@override @useResult
$Res call({
 List<Sub2ApiAdminDashboardGroupStats> groups, DateTime startDate, DateTime endDate
});




}
/// @nodoc
class __$Sub2ApiAdminDashboardGroupsCopyWithImpl<$Res>
    implements _$Sub2ApiAdminDashboardGroupsCopyWith<$Res> {
  __$Sub2ApiAdminDashboardGroupsCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminDashboardGroups _self;
  final $Res Function(_Sub2ApiAdminDashboardGroups) _then;

/// Create a copy of Sub2ApiAdminDashboardGroups
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groups = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_Sub2ApiAdminDashboardGroups(
groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminDashboardGroupStats>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminApiKeyUsageTrendPoint {

 String get date; int get apiKeyId; String get keyName; int get requests; int get tokens;
/// Create a copy of Sub2ApiAdminApiKeyUsageTrendPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminApiKeyUsageTrendPointCopyWith<Sub2ApiAdminApiKeyUsageTrendPoint> get copyWith => _$Sub2ApiAdminApiKeyUsageTrendPointCopyWithImpl<Sub2ApiAdminApiKeyUsageTrendPoint>(this as Sub2ApiAdminApiKeyUsageTrendPoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminApiKeyUsageTrendPoint&&(identical(other.date, date) || other.date == date)&&(identical(other.apiKeyId, apiKeyId) || other.apiKeyId == apiKeyId)&&(identical(other.keyName, keyName) || other.keyName == keyName)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.tokens, tokens) || other.tokens == tokens));
}


@override
int get hashCode => Object.hash(runtimeType,date,apiKeyId,keyName,requests,tokens);

@override
String toString() {
  return 'Sub2ApiAdminApiKeyUsageTrendPoint(date: $date, apiKeyId: $apiKeyId, keyName: $keyName, requests: $requests, tokens: $tokens)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminApiKeyUsageTrendPointCopyWith<$Res>  {
  factory $Sub2ApiAdminApiKeyUsageTrendPointCopyWith(Sub2ApiAdminApiKeyUsageTrendPoint value, $Res Function(Sub2ApiAdminApiKeyUsageTrendPoint) _then) = _$Sub2ApiAdminApiKeyUsageTrendPointCopyWithImpl;
@useResult
$Res call({
 String date, int apiKeyId, String keyName, int requests, int tokens
});




}
/// @nodoc
class _$Sub2ApiAdminApiKeyUsageTrendPointCopyWithImpl<$Res>
    implements $Sub2ApiAdminApiKeyUsageTrendPointCopyWith<$Res> {
  _$Sub2ApiAdminApiKeyUsageTrendPointCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminApiKeyUsageTrendPoint _self;
  final $Res Function(Sub2ApiAdminApiKeyUsageTrendPoint) _then;

/// Create a copy of Sub2ApiAdminApiKeyUsageTrendPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? apiKeyId = null,Object? keyName = null,Object? requests = null,Object? tokens = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,apiKeyId: null == apiKeyId ? _self.apiKeyId : apiKeyId // ignore: cast_nullable_to_non_nullable
as int,keyName: null == keyName ? _self.keyName : keyName // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminApiKeyUsageTrendPoint].
extension Sub2ApiAdminApiKeyUsageTrendPointPatterns on Sub2ApiAdminApiKeyUsageTrendPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminApiKeyUsageTrendPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminApiKeyUsageTrendPoint() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminApiKeyUsageTrendPoint value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminApiKeyUsageTrendPoint():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminApiKeyUsageTrendPoint value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminApiKeyUsageTrendPoint() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  int apiKeyId,  String keyName,  int requests,  int tokens)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminApiKeyUsageTrendPoint() when $default != null:
return $default(_that.date,_that.apiKeyId,_that.keyName,_that.requests,_that.tokens);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  int apiKeyId,  String keyName,  int requests,  int tokens)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminApiKeyUsageTrendPoint():
return $default(_that.date,_that.apiKeyId,_that.keyName,_that.requests,_that.tokens);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  int apiKeyId,  String keyName,  int requests,  int tokens)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminApiKeyUsageTrendPoint() when $default != null:
return $default(_that.date,_that.apiKeyId,_that.keyName,_that.requests,_that.tokens);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminApiKeyUsageTrendPoint implements Sub2ApiAdminApiKeyUsageTrendPoint {
  const _Sub2ApiAdminApiKeyUsageTrendPoint({required this.date, required this.apiKeyId, required this.keyName, required this.requests, required this.tokens});


@override final  String date;
@override final  int apiKeyId;
@override final  String keyName;
@override final  int requests;
@override final  int tokens;

/// Create a copy of Sub2ApiAdminApiKeyUsageTrendPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminApiKeyUsageTrendPointCopyWith<_Sub2ApiAdminApiKeyUsageTrendPoint> get copyWith => __$Sub2ApiAdminApiKeyUsageTrendPointCopyWithImpl<_Sub2ApiAdminApiKeyUsageTrendPoint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminApiKeyUsageTrendPoint&&(identical(other.date, date) || other.date == date)&&(identical(other.apiKeyId, apiKeyId) || other.apiKeyId == apiKeyId)&&(identical(other.keyName, keyName) || other.keyName == keyName)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.tokens, tokens) || other.tokens == tokens));
}


@override
int get hashCode => Object.hash(runtimeType,date,apiKeyId,keyName,requests,tokens);

@override
String toString() {
  return 'Sub2ApiAdminApiKeyUsageTrendPoint(date: $date, apiKeyId: $apiKeyId, keyName: $keyName, requests: $requests, tokens: $tokens)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminApiKeyUsageTrendPointCopyWith<$Res> implements $Sub2ApiAdminApiKeyUsageTrendPointCopyWith<$Res> {
  factory _$Sub2ApiAdminApiKeyUsageTrendPointCopyWith(_Sub2ApiAdminApiKeyUsageTrendPoint value, $Res Function(_Sub2ApiAdminApiKeyUsageTrendPoint) _then) = __$Sub2ApiAdminApiKeyUsageTrendPointCopyWithImpl;
@override @useResult
$Res call({
 String date, int apiKeyId, String keyName, int requests, int tokens
});




}
/// @nodoc
class __$Sub2ApiAdminApiKeyUsageTrendPointCopyWithImpl<$Res>
    implements _$Sub2ApiAdminApiKeyUsageTrendPointCopyWith<$Res> {
  __$Sub2ApiAdminApiKeyUsageTrendPointCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminApiKeyUsageTrendPoint _self;
  final $Res Function(_Sub2ApiAdminApiKeyUsageTrendPoint) _then;

/// Create a copy of Sub2ApiAdminApiKeyUsageTrendPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? apiKeyId = null,Object? keyName = null,Object? requests = null,Object? tokens = null,}) {
  return _then(_Sub2ApiAdminApiKeyUsageTrendPoint(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,apiKeyId: null == apiKeyId ? _self.apiKeyId : apiKeyId // ignore: cast_nullable_to_non_nullable
as int,keyName: null == keyName ? _self.keyName : keyName // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminApiKeyUsageTrend {

 List<Sub2ApiAdminApiKeyUsageTrendPoint> get points; DateTime get startDate; DateTime get endDate; Sub2ApiAdminUsageGranularity get granularity;
/// Create a copy of Sub2ApiAdminApiKeyUsageTrend
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminApiKeyUsageTrendCopyWith<Sub2ApiAdminApiKeyUsageTrend> get copyWith => _$Sub2ApiAdminApiKeyUsageTrendCopyWithImpl<Sub2ApiAdminApiKeyUsageTrend>(this as Sub2ApiAdminApiKeyUsageTrend, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminApiKeyUsageTrend&&const DeepCollectionEquality().equals(other.points, points)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.granularity, granularity) || other.granularity == granularity));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(points),startDate,endDate,granularity);

@override
String toString() {
  return 'Sub2ApiAdminApiKeyUsageTrend(points: $points, startDate: $startDate, endDate: $endDate, granularity: $granularity)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminApiKeyUsageTrendCopyWith<$Res>  {
  factory $Sub2ApiAdminApiKeyUsageTrendCopyWith(Sub2ApiAdminApiKeyUsageTrend value, $Res Function(Sub2ApiAdminApiKeyUsageTrend) _then) = _$Sub2ApiAdminApiKeyUsageTrendCopyWithImpl;
@useResult
$Res call({
 List<Sub2ApiAdminApiKeyUsageTrendPoint> points, DateTime startDate, DateTime endDate, Sub2ApiAdminUsageGranularity granularity
});




}
/// @nodoc
class _$Sub2ApiAdminApiKeyUsageTrendCopyWithImpl<$Res>
    implements $Sub2ApiAdminApiKeyUsageTrendCopyWith<$Res> {
  _$Sub2ApiAdminApiKeyUsageTrendCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminApiKeyUsageTrend _self;
  final $Res Function(Sub2ApiAdminApiKeyUsageTrend) _then;

/// Create a copy of Sub2ApiAdminApiKeyUsageTrend
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? startDate = null,Object? endDate = null,Object? granularity = null,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminApiKeyUsageTrendPoint>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageGranularity,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminApiKeyUsageTrend].
extension Sub2ApiAdminApiKeyUsageTrendPatterns on Sub2ApiAdminApiKeyUsageTrend {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminApiKeyUsageTrend value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminApiKeyUsageTrend() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminApiKeyUsageTrend value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminApiKeyUsageTrend():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminApiKeyUsageTrend value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminApiKeyUsageTrend() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Sub2ApiAdminApiKeyUsageTrendPoint> points,  DateTime startDate,  DateTime endDate,  Sub2ApiAdminUsageGranularity granularity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminApiKeyUsageTrend() when $default != null:
return $default(_that.points,_that.startDate,_that.endDate,_that.granularity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Sub2ApiAdminApiKeyUsageTrendPoint> points,  DateTime startDate,  DateTime endDate,  Sub2ApiAdminUsageGranularity granularity)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminApiKeyUsageTrend():
return $default(_that.points,_that.startDate,_that.endDate,_that.granularity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Sub2ApiAdminApiKeyUsageTrendPoint> points,  DateTime startDate,  DateTime endDate,  Sub2ApiAdminUsageGranularity granularity)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminApiKeyUsageTrend() when $default != null:
return $default(_that.points,_that.startDate,_that.endDate,_that.granularity);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminApiKeyUsageTrend implements Sub2ApiAdminApiKeyUsageTrend {
  const _Sub2ApiAdminApiKeyUsageTrend({required final  List<Sub2ApiAdminApiKeyUsageTrendPoint> points, required this.startDate, required this.endDate, required this.granularity}): _points = points;


 final  List<Sub2ApiAdminApiKeyUsageTrendPoint> _points;
@override List<Sub2ApiAdminApiKeyUsageTrendPoint> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}

@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  Sub2ApiAdminUsageGranularity granularity;

/// Create a copy of Sub2ApiAdminApiKeyUsageTrend
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminApiKeyUsageTrendCopyWith<_Sub2ApiAdminApiKeyUsageTrend> get copyWith => __$Sub2ApiAdminApiKeyUsageTrendCopyWithImpl<_Sub2ApiAdminApiKeyUsageTrend>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminApiKeyUsageTrend&&const DeepCollectionEquality().equals(other._points, _points)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.granularity, granularity) || other.granularity == granularity));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_points),startDate,endDate,granularity);

@override
String toString() {
  return 'Sub2ApiAdminApiKeyUsageTrend(points: $points, startDate: $startDate, endDate: $endDate, granularity: $granularity)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminApiKeyUsageTrendCopyWith<$Res> implements $Sub2ApiAdminApiKeyUsageTrendCopyWith<$Res> {
  factory _$Sub2ApiAdminApiKeyUsageTrendCopyWith(_Sub2ApiAdminApiKeyUsageTrend value, $Res Function(_Sub2ApiAdminApiKeyUsageTrend) _then) = __$Sub2ApiAdminApiKeyUsageTrendCopyWithImpl;
@override @useResult
$Res call({
 List<Sub2ApiAdminApiKeyUsageTrendPoint> points, DateTime startDate, DateTime endDate, Sub2ApiAdminUsageGranularity granularity
});




}
/// @nodoc
class __$Sub2ApiAdminApiKeyUsageTrendCopyWithImpl<$Res>
    implements _$Sub2ApiAdminApiKeyUsageTrendCopyWith<$Res> {
  __$Sub2ApiAdminApiKeyUsageTrendCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminApiKeyUsageTrend _self;
  final $Res Function(_Sub2ApiAdminApiKeyUsageTrend) _then;

/// Create a copy of Sub2ApiAdminApiKeyUsageTrend
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? startDate = null,Object? endDate = null,Object? granularity = null,}) {
  return _then(_Sub2ApiAdminApiKeyUsageTrend(
points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminApiKeyUsageTrendPoint>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageGranularity,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUserUsageTrendPoint {

 String get date; int get userId; String get email; String get username; int get requests; int get tokens; Sub2ApiDecimal get cost; Sub2ApiDecimal get actualCost;
/// Create a copy of Sub2ApiAdminUserUsageTrendPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUserUsageTrendPointCopyWith<Sub2ApiAdminUserUsageTrendPoint> get copyWith => _$Sub2ApiAdminUserUsageTrendPointCopyWithImpl<Sub2ApiAdminUserUsageTrendPoint>(this as Sub2ApiAdminUserUsageTrendPoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUserUsageTrendPoint&&(identical(other.date, date) || other.date == date)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.tokens, tokens) || other.tokens == tokens)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost));
}


@override
int get hashCode => Object.hash(runtimeType,date,userId,email,username,requests,tokens,cost,actualCost);

@override
String toString() {
  return 'Sub2ApiAdminUserUsageTrendPoint(date: $date, userId: $userId, email: $email, username: $username, requests: $requests, tokens: $tokens, cost: $cost, actualCost: $actualCost)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUserUsageTrendPointCopyWith<$Res>  {
  factory $Sub2ApiAdminUserUsageTrendPointCopyWith(Sub2ApiAdminUserUsageTrendPoint value, $Res Function(Sub2ApiAdminUserUsageTrendPoint) _then) = _$Sub2ApiAdminUserUsageTrendPointCopyWithImpl;
@useResult
$Res call({
 String date, int userId, String email, String username, int requests, int tokens, Sub2ApiDecimal cost, Sub2ApiDecimal actualCost
});




}
/// @nodoc
class _$Sub2ApiAdminUserUsageTrendPointCopyWithImpl<$Res>
    implements $Sub2ApiAdminUserUsageTrendPointCopyWith<$Res> {
  _$Sub2ApiAdminUserUsageTrendPointCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUserUsageTrendPoint _self;
  final $Res Function(Sub2ApiAdminUserUsageTrendPoint) _then;

/// Create a copy of Sub2ApiAdminUserUsageTrendPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? userId = null,Object? email = null,Object? username = null,Object? requests = null,Object? tokens = null,Object? cost = null,Object? actualCost = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as int,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,actualCost: null == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUserUsageTrendPoint].
extension Sub2ApiAdminUserUsageTrendPointPatterns on Sub2ApiAdminUserUsageTrendPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserUsageTrendPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserUsageTrendPoint() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserUsageTrendPoint value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserUsageTrendPoint():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUserUsageTrendPoint value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserUsageTrendPoint() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  int userId,  String email,  String username,  int requests,  int tokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserUsageTrendPoint() when $default != null:
return $default(_that.date,_that.userId,_that.email,_that.username,_that.requests,_that.tokens,_that.cost,_that.actualCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  int userId,  String email,  String username,  int requests,  int tokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserUsageTrendPoint():
return $default(_that.date,_that.userId,_that.email,_that.username,_that.requests,_that.tokens,_that.cost,_that.actualCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  int userId,  String email,  String username,  int requests,  int tokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserUsageTrendPoint() when $default != null:
return $default(_that.date,_that.userId,_that.email,_that.username,_that.requests,_that.tokens,_that.cost,_that.actualCost);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUserUsageTrendPoint implements Sub2ApiAdminUserUsageTrendPoint {
  const _Sub2ApiAdminUserUsageTrendPoint({required this.date, required this.userId, required this.email, required this.username, required this.requests, required this.tokens, required this.cost, required this.actualCost});


@override final  String date;
@override final  int userId;
@override final  String email;
@override final  String username;
@override final  int requests;
@override final  int tokens;
@override final  Sub2ApiDecimal cost;
@override final  Sub2ApiDecimal actualCost;

/// Create a copy of Sub2ApiAdminUserUsageTrendPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUserUsageTrendPointCopyWith<_Sub2ApiAdminUserUsageTrendPoint> get copyWith => __$Sub2ApiAdminUserUsageTrendPointCopyWithImpl<_Sub2ApiAdminUserUsageTrendPoint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUserUsageTrendPoint&&(identical(other.date, date) || other.date == date)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.tokens, tokens) || other.tokens == tokens)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost));
}


@override
int get hashCode => Object.hash(runtimeType,date,userId,email,username,requests,tokens,cost,actualCost);

@override
String toString() {
  return 'Sub2ApiAdminUserUsageTrendPoint(date: $date, userId: $userId, email: $email, username: $username, requests: $requests, tokens: $tokens, cost: $cost, actualCost: $actualCost)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUserUsageTrendPointCopyWith<$Res> implements $Sub2ApiAdminUserUsageTrendPointCopyWith<$Res> {
  factory _$Sub2ApiAdminUserUsageTrendPointCopyWith(_Sub2ApiAdminUserUsageTrendPoint value, $Res Function(_Sub2ApiAdminUserUsageTrendPoint) _then) = __$Sub2ApiAdminUserUsageTrendPointCopyWithImpl;
@override @useResult
$Res call({
 String date, int userId, String email, String username, int requests, int tokens, Sub2ApiDecimal cost, Sub2ApiDecimal actualCost
});




}
/// @nodoc
class __$Sub2ApiAdminUserUsageTrendPointCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUserUsageTrendPointCopyWith<$Res> {
  __$Sub2ApiAdminUserUsageTrendPointCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUserUsageTrendPoint _self;
  final $Res Function(_Sub2ApiAdminUserUsageTrendPoint) _then;

/// Create a copy of Sub2ApiAdminUserUsageTrendPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? userId = null,Object? email = null,Object? username = null,Object? requests = null,Object? tokens = null,Object? cost = null,Object? actualCost = null,}) {
  return _then(_Sub2ApiAdminUserUsageTrendPoint(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as int,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,actualCost: null == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUserUsageTrend {

 List<Sub2ApiAdminUserUsageTrendPoint> get points; DateTime get startDate; DateTime get endDate; Sub2ApiAdminUsageGranularity get granularity;
/// Create a copy of Sub2ApiAdminUserUsageTrend
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUserUsageTrendCopyWith<Sub2ApiAdminUserUsageTrend> get copyWith => _$Sub2ApiAdminUserUsageTrendCopyWithImpl<Sub2ApiAdminUserUsageTrend>(this as Sub2ApiAdminUserUsageTrend, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUserUsageTrend&&const DeepCollectionEquality().equals(other.points, points)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.granularity, granularity) || other.granularity == granularity));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(points),startDate,endDate,granularity);

@override
String toString() {
  return 'Sub2ApiAdminUserUsageTrend(points: $points, startDate: $startDate, endDate: $endDate, granularity: $granularity)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUserUsageTrendCopyWith<$Res>  {
  factory $Sub2ApiAdminUserUsageTrendCopyWith(Sub2ApiAdminUserUsageTrend value, $Res Function(Sub2ApiAdminUserUsageTrend) _then) = _$Sub2ApiAdminUserUsageTrendCopyWithImpl;
@useResult
$Res call({
 List<Sub2ApiAdminUserUsageTrendPoint> points, DateTime startDate, DateTime endDate, Sub2ApiAdminUsageGranularity granularity
});




}
/// @nodoc
class _$Sub2ApiAdminUserUsageTrendCopyWithImpl<$Res>
    implements $Sub2ApiAdminUserUsageTrendCopyWith<$Res> {
  _$Sub2ApiAdminUserUsageTrendCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUserUsageTrend _self;
  final $Res Function(Sub2ApiAdminUserUsageTrend) _then;

/// Create a copy of Sub2ApiAdminUserUsageTrend
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? startDate = null,Object? endDate = null,Object? granularity = null,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminUserUsageTrendPoint>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageGranularity,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUserUsageTrend].
extension Sub2ApiAdminUserUsageTrendPatterns on Sub2ApiAdminUserUsageTrend {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserUsageTrend value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserUsageTrend() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserUsageTrend value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserUsageTrend():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUserUsageTrend value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserUsageTrend() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Sub2ApiAdminUserUsageTrendPoint> points,  DateTime startDate,  DateTime endDate,  Sub2ApiAdminUsageGranularity granularity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserUsageTrend() when $default != null:
return $default(_that.points,_that.startDate,_that.endDate,_that.granularity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Sub2ApiAdminUserUsageTrendPoint> points,  DateTime startDate,  DateTime endDate,  Sub2ApiAdminUsageGranularity granularity)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserUsageTrend():
return $default(_that.points,_that.startDate,_that.endDate,_that.granularity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Sub2ApiAdminUserUsageTrendPoint> points,  DateTime startDate,  DateTime endDate,  Sub2ApiAdminUsageGranularity granularity)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserUsageTrend() when $default != null:
return $default(_that.points,_that.startDate,_that.endDate,_that.granularity);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUserUsageTrend implements Sub2ApiAdminUserUsageTrend {
  const _Sub2ApiAdminUserUsageTrend({required final  List<Sub2ApiAdminUserUsageTrendPoint> points, required this.startDate, required this.endDate, required this.granularity}): _points = points;


 final  List<Sub2ApiAdminUserUsageTrendPoint> _points;
@override List<Sub2ApiAdminUserUsageTrendPoint> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}

@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  Sub2ApiAdminUsageGranularity granularity;

/// Create a copy of Sub2ApiAdminUserUsageTrend
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUserUsageTrendCopyWith<_Sub2ApiAdminUserUsageTrend> get copyWith => __$Sub2ApiAdminUserUsageTrendCopyWithImpl<_Sub2ApiAdminUserUsageTrend>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUserUsageTrend&&const DeepCollectionEquality().equals(other._points, _points)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.granularity, granularity) || other.granularity == granularity));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_points),startDate,endDate,granularity);

@override
String toString() {
  return 'Sub2ApiAdminUserUsageTrend(points: $points, startDate: $startDate, endDate: $endDate, granularity: $granularity)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUserUsageTrendCopyWith<$Res> implements $Sub2ApiAdminUserUsageTrendCopyWith<$Res> {
  factory _$Sub2ApiAdminUserUsageTrendCopyWith(_Sub2ApiAdminUserUsageTrend value, $Res Function(_Sub2ApiAdminUserUsageTrend) _then) = __$Sub2ApiAdminUserUsageTrendCopyWithImpl;
@override @useResult
$Res call({
 List<Sub2ApiAdminUserUsageTrendPoint> points, DateTime startDate, DateTime endDate, Sub2ApiAdminUsageGranularity granularity
});




}
/// @nodoc
class __$Sub2ApiAdminUserUsageTrendCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUserUsageTrendCopyWith<$Res> {
  __$Sub2ApiAdminUserUsageTrendCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUserUsageTrend _self;
  final $Res Function(_Sub2ApiAdminUserUsageTrend) _then;

/// Create a copy of Sub2ApiAdminUserUsageTrend
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? startDate = null,Object? endDate = null,Object? granularity = null,}) {
  return _then(_Sub2ApiAdminUserUsageTrend(
points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminUserUsageTrendPoint>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageGranularity,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUserSpendingRankingItem {

 int get userId; String get email; String get username; Sub2ApiDecimal get actualCost; int get requests; int get tokens;
/// Create a copy of Sub2ApiAdminUserSpendingRankingItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUserSpendingRankingItemCopyWith<Sub2ApiAdminUserSpendingRankingItem> get copyWith => _$Sub2ApiAdminUserSpendingRankingItemCopyWithImpl<Sub2ApiAdminUserSpendingRankingItem>(this as Sub2ApiAdminUserSpendingRankingItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUserSpendingRankingItem&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.tokens, tokens) || other.tokens == tokens));
}


@override
int get hashCode => Object.hash(runtimeType,userId,email,username,actualCost,requests,tokens);

@override
String toString() {
  return 'Sub2ApiAdminUserSpendingRankingItem(userId: $userId, email: $email, username: $username, actualCost: $actualCost, requests: $requests, tokens: $tokens)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUserSpendingRankingItemCopyWith<$Res>  {
  factory $Sub2ApiAdminUserSpendingRankingItemCopyWith(Sub2ApiAdminUserSpendingRankingItem value, $Res Function(Sub2ApiAdminUserSpendingRankingItem) _then) = _$Sub2ApiAdminUserSpendingRankingItemCopyWithImpl;
@useResult
$Res call({
 int userId, String email, String username, Sub2ApiDecimal actualCost, int requests, int tokens
});




}
/// @nodoc
class _$Sub2ApiAdminUserSpendingRankingItemCopyWithImpl<$Res>
    implements $Sub2ApiAdminUserSpendingRankingItemCopyWith<$Res> {
  _$Sub2ApiAdminUserSpendingRankingItemCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUserSpendingRankingItem _self;
  final $Res Function(Sub2ApiAdminUserSpendingRankingItem) _then;

/// Create a copy of Sub2ApiAdminUserSpendingRankingItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? email = null,Object? username = null,Object? actualCost = null,Object? requests = null,Object? tokens = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,actualCost: null == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUserSpendingRankingItem].
extension Sub2ApiAdminUserSpendingRankingItemPatterns on Sub2ApiAdminUserSpendingRankingItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserSpendingRankingItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRankingItem() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserSpendingRankingItem value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRankingItem():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUserSpendingRankingItem value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRankingItem() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  String email,  String username,  Sub2ApiDecimal actualCost,  int requests,  int tokens)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRankingItem() when $default != null:
return $default(_that.userId,_that.email,_that.username,_that.actualCost,_that.requests,_that.tokens);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  String email,  String username,  Sub2ApiDecimal actualCost,  int requests,  int tokens)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRankingItem():
return $default(_that.userId,_that.email,_that.username,_that.actualCost,_that.requests,_that.tokens);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  String email,  String username,  Sub2ApiDecimal actualCost,  int requests,  int tokens)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRankingItem() when $default != null:
return $default(_that.userId,_that.email,_that.username,_that.actualCost,_that.requests,_that.tokens);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUserSpendingRankingItem implements Sub2ApiAdminUserSpendingRankingItem {
  const _Sub2ApiAdminUserSpendingRankingItem({required this.userId, required this.email, required this.username, required this.actualCost, required this.requests, required this.tokens});


@override final  int userId;
@override final  String email;
@override final  String username;
@override final  Sub2ApiDecimal actualCost;
@override final  int requests;
@override final  int tokens;

/// Create a copy of Sub2ApiAdminUserSpendingRankingItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUserSpendingRankingItemCopyWith<_Sub2ApiAdminUserSpendingRankingItem> get copyWith => __$Sub2ApiAdminUserSpendingRankingItemCopyWithImpl<_Sub2ApiAdminUserSpendingRankingItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUserSpendingRankingItem&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.tokens, tokens) || other.tokens == tokens));
}


@override
int get hashCode => Object.hash(runtimeType,userId,email,username,actualCost,requests,tokens);

@override
String toString() {
  return 'Sub2ApiAdminUserSpendingRankingItem(userId: $userId, email: $email, username: $username, actualCost: $actualCost, requests: $requests, tokens: $tokens)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUserSpendingRankingItemCopyWith<$Res> implements $Sub2ApiAdminUserSpendingRankingItemCopyWith<$Res> {
  factory _$Sub2ApiAdminUserSpendingRankingItemCopyWith(_Sub2ApiAdminUserSpendingRankingItem value, $Res Function(_Sub2ApiAdminUserSpendingRankingItem) _then) = __$Sub2ApiAdminUserSpendingRankingItemCopyWithImpl;
@override @useResult
$Res call({
 int userId, String email, String username, Sub2ApiDecimal actualCost, int requests, int tokens
});




}
/// @nodoc
class __$Sub2ApiAdminUserSpendingRankingItemCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUserSpendingRankingItemCopyWith<$Res> {
  __$Sub2ApiAdminUserSpendingRankingItemCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUserSpendingRankingItem _self;
  final $Res Function(_Sub2ApiAdminUserSpendingRankingItem) _then;

/// Create a copy of Sub2ApiAdminUserSpendingRankingItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? email = null,Object? username = null,Object? actualCost = null,Object? requests = null,Object? tokens = null,}) {
  return _then(_Sub2ApiAdminUserSpendingRankingItem(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,actualCost: null == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUserSpendingRanking {

 List<Sub2ApiAdminUserSpendingRankingItem> get ranking; Sub2ApiDecimal get totalActualCost; int get totalRequests; int get totalTokens; DateTime get startDate; DateTime get endDate;
/// Create a copy of Sub2ApiAdminUserSpendingRanking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUserSpendingRankingCopyWith<Sub2ApiAdminUserSpendingRanking> get copyWith => _$Sub2ApiAdminUserSpendingRankingCopyWithImpl<Sub2ApiAdminUserSpendingRanking>(this as Sub2ApiAdminUserSpendingRanking, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUserSpendingRanking&&const DeepCollectionEquality().equals(other.ranking, ranking)&&(identical(other.totalActualCost, totalActualCost) || other.totalActualCost == totalActualCost)&&(identical(other.totalRequests, totalRequests) || other.totalRequests == totalRequests)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ranking),totalActualCost,totalRequests,totalTokens,startDate,endDate);

@override
String toString() {
  return 'Sub2ApiAdminUserSpendingRanking(ranking: $ranking, totalActualCost: $totalActualCost, totalRequests: $totalRequests, totalTokens: $totalTokens, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUserSpendingRankingCopyWith<$Res>  {
  factory $Sub2ApiAdminUserSpendingRankingCopyWith(Sub2ApiAdminUserSpendingRanking value, $Res Function(Sub2ApiAdminUserSpendingRanking) _then) = _$Sub2ApiAdminUserSpendingRankingCopyWithImpl;
@useResult
$Res call({
 List<Sub2ApiAdminUserSpendingRankingItem> ranking, Sub2ApiDecimal totalActualCost, int totalRequests, int totalTokens, DateTime startDate, DateTime endDate
});




}
/// @nodoc
class _$Sub2ApiAdminUserSpendingRankingCopyWithImpl<$Res>
    implements $Sub2ApiAdminUserSpendingRankingCopyWith<$Res> {
  _$Sub2ApiAdminUserSpendingRankingCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUserSpendingRanking _self;
  final $Res Function(Sub2ApiAdminUserSpendingRanking) _then;

/// Create a copy of Sub2ApiAdminUserSpendingRanking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ranking = null,Object? totalActualCost = null,Object? totalRequests = null,Object? totalTokens = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
ranking: null == ranking ? _self.ranking : ranking // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminUserSpendingRankingItem>,totalActualCost: null == totalActualCost ? _self.totalActualCost : totalActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalRequests: null == totalRequests ? _self.totalRequests : totalRequests // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUserSpendingRanking].
extension Sub2ApiAdminUserSpendingRankingPatterns on Sub2ApiAdminUserSpendingRanking {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserSpendingRanking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRanking() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserSpendingRanking value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRanking():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUserSpendingRanking value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRanking() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Sub2ApiAdminUserSpendingRankingItem> ranking,  Sub2ApiDecimal totalActualCost,  int totalRequests,  int totalTokens,  DateTime startDate,  DateTime endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRanking() when $default != null:
return $default(_that.ranking,_that.totalActualCost,_that.totalRequests,_that.totalTokens,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Sub2ApiAdminUserSpendingRankingItem> ranking,  Sub2ApiDecimal totalActualCost,  int totalRequests,  int totalTokens,  DateTime startDate,  DateTime endDate)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRanking():
return $default(_that.ranking,_that.totalActualCost,_that.totalRequests,_that.totalTokens,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Sub2ApiAdminUserSpendingRankingItem> ranking,  Sub2ApiDecimal totalActualCost,  int totalRequests,  int totalTokens,  DateTime startDate,  DateTime endDate)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserSpendingRanking() when $default != null:
return $default(_that.ranking,_that.totalActualCost,_that.totalRequests,_that.totalTokens,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUserSpendingRanking implements Sub2ApiAdminUserSpendingRanking {
  const _Sub2ApiAdminUserSpendingRanking({required final  List<Sub2ApiAdminUserSpendingRankingItem> ranking, required this.totalActualCost, required this.totalRequests, required this.totalTokens, required this.startDate, required this.endDate}): _ranking = ranking;


 final  List<Sub2ApiAdminUserSpendingRankingItem> _ranking;
@override List<Sub2ApiAdminUserSpendingRankingItem> get ranking {
  if (_ranking is EqualUnmodifiableListView) return _ranking;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ranking);
}

@override final  Sub2ApiDecimal totalActualCost;
@override final  int totalRequests;
@override final  int totalTokens;
@override final  DateTime startDate;
@override final  DateTime endDate;

/// Create a copy of Sub2ApiAdminUserSpendingRanking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUserSpendingRankingCopyWith<_Sub2ApiAdminUserSpendingRanking> get copyWith => __$Sub2ApiAdminUserSpendingRankingCopyWithImpl<_Sub2ApiAdminUserSpendingRanking>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUserSpendingRanking&&const DeepCollectionEquality().equals(other._ranking, _ranking)&&(identical(other.totalActualCost, totalActualCost) || other.totalActualCost == totalActualCost)&&(identical(other.totalRequests, totalRequests) || other.totalRequests == totalRequests)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ranking),totalActualCost,totalRequests,totalTokens,startDate,endDate);

@override
String toString() {
  return 'Sub2ApiAdminUserSpendingRanking(ranking: $ranking, totalActualCost: $totalActualCost, totalRequests: $totalRequests, totalTokens: $totalTokens, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUserSpendingRankingCopyWith<$Res> implements $Sub2ApiAdminUserSpendingRankingCopyWith<$Res> {
  factory _$Sub2ApiAdminUserSpendingRankingCopyWith(_Sub2ApiAdminUserSpendingRanking value, $Res Function(_Sub2ApiAdminUserSpendingRanking) _then) = __$Sub2ApiAdminUserSpendingRankingCopyWithImpl;
@override @useResult
$Res call({
 List<Sub2ApiAdminUserSpendingRankingItem> ranking, Sub2ApiDecimal totalActualCost, int totalRequests, int totalTokens, DateTime startDate, DateTime endDate
});




}
/// @nodoc
class __$Sub2ApiAdminUserSpendingRankingCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUserSpendingRankingCopyWith<$Res> {
  __$Sub2ApiAdminUserSpendingRankingCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUserSpendingRanking _self;
  final $Res Function(_Sub2ApiAdminUserSpendingRanking) _then;

/// Create a copy of Sub2ApiAdminUserSpendingRanking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ranking = null,Object? totalActualCost = null,Object? totalRequests = null,Object? totalTokens = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_Sub2ApiAdminUserSpendingRanking(
ranking: null == ranking ? _self._ranking : ranking // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminUserSpendingRankingItem>,totalActualCost: null == totalActualCost ? _self.totalActualCost : totalActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalRequests: null == totalRequests ? _self.totalRequests : totalRequests // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminPlatformUsage {

 String get platform; Sub2ApiDecimal get todayActualCost; Sub2ApiDecimal get totalActualCost;
/// Create a copy of Sub2ApiAdminPlatformUsage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminPlatformUsageCopyWith<Sub2ApiAdminPlatformUsage> get copyWith => _$Sub2ApiAdminPlatformUsageCopyWithImpl<Sub2ApiAdminPlatformUsage>(this as Sub2ApiAdminPlatformUsage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminPlatformUsage&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.todayActualCost, todayActualCost) || other.todayActualCost == todayActualCost)&&(identical(other.totalActualCost, totalActualCost) || other.totalActualCost == totalActualCost));
}


@override
int get hashCode => Object.hash(runtimeType,platform,todayActualCost,totalActualCost);

@override
String toString() {
  return 'Sub2ApiAdminPlatformUsage(platform: $platform, todayActualCost: $todayActualCost, totalActualCost: $totalActualCost)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminPlatformUsageCopyWith<$Res>  {
  factory $Sub2ApiAdminPlatformUsageCopyWith(Sub2ApiAdminPlatformUsage value, $Res Function(Sub2ApiAdminPlatformUsage) _then) = _$Sub2ApiAdminPlatformUsageCopyWithImpl;
@useResult
$Res call({
 String platform, Sub2ApiDecimal todayActualCost, Sub2ApiDecimal totalActualCost
});




}
/// @nodoc
class _$Sub2ApiAdminPlatformUsageCopyWithImpl<$Res>
    implements $Sub2ApiAdminPlatformUsageCopyWith<$Res> {
  _$Sub2ApiAdminPlatformUsageCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminPlatformUsage _self;
  final $Res Function(Sub2ApiAdminPlatformUsage) _then;

/// Create a copy of Sub2ApiAdminPlatformUsage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platform = null,Object? todayActualCost = null,Object? totalActualCost = null,}) {
  return _then(_self.copyWith(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,todayActualCost: null == todayActualCost ? _self.todayActualCost : todayActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalActualCost: null == totalActualCost ? _self.totalActualCost : totalActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminPlatformUsage].
extension Sub2ApiAdminPlatformUsagePatterns on Sub2ApiAdminPlatformUsage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminPlatformUsage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminPlatformUsage() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminPlatformUsage value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminPlatformUsage():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminPlatformUsage value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminPlatformUsage() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String platform,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal totalActualCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminPlatformUsage() when $default != null:
return $default(_that.platform,_that.todayActualCost,_that.totalActualCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String platform,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal totalActualCost)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminPlatformUsage():
return $default(_that.platform,_that.todayActualCost,_that.totalActualCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String platform,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal totalActualCost)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminPlatformUsage() when $default != null:
return $default(_that.platform,_that.todayActualCost,_that.totalActualCost);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminPlatformUsage implements Sub2ApiAdminPlatformUsage {
  const _Sub2ApiAdminPlatformUsage({required this.platform, required this.todayActualCost, required this.totalActualCost});


@override final  String platform;
@override final  Sub2ApiDecimal todayActualCost;
@override final  Sub2ApiDecimal totalActualCost;

/// Create a copy of Sub2ApiAdminPlatformUsage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminPlatformUsageCopyWith<_Sub2ApiAdminPlatformUsage> get copyWith => __$Sub2ApiAdminPlatformUsageCopyWithImpl<_Sub2ApiAdminPlatformUsage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminPlatformUsage&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.todayActualCost, todayActualCost) || other.todayActualCost == todayActualCost)&&(identical(other.totalActualCost, totalActualCost) || other.totalActualCost == totalActualCost));
}


@override
int get hashCode => Object.hash(runtimeType,platform,todayActualCost,totalActualCost);

@override
String toString() {
  return 'Sub2ApiAdminPlatformUsage(platform: $platform, todayActualCost: $todayActualCost, totalActualCost: $totalActualCost)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminPlatformUsageCopyWith<$Res> implements $Sub2ApiAdminPlatformUsageCopyWith<$Res> {
  factory _$Sub2ApiAdminPlatformUsageCopyWith(_Sub2ApiAdminPlatformUsage value, $Res Function(_Sub2ApiAdminPlatformUsage) _then) = __$Sub2ApiAdminPlatformUsageCopyWithImpl;
@override @useResult
$Res call({
 String platform, Sub2ApiDecimal todayActualCost, Sub2ApiDecimal totalActualCost
});




}
/// @nodoc
class __$Sub2ApiAdminPlatformUsageCopyWithImpl<$Res>
    implements _$Sub2ApiAdminPlatformUsageCopyWith<$Res> {
  __$Sub2ApiAdminPlatformUsageCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminPlatformUsage _self;
  final $Res Function(_Sub2ApiAdminPlatformUsage) _then;

/// Create a copy of Sub2ApiAdminPlatformUsage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platform = null,Object? todayActualCost = null,Object? totalActualCost = null,}) {
  return _then(_Sub2ApiAdminPlatformUsage(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,todayActualCost: null == todayActualCost ? _self.todayActualCost : todayActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalActualCost: null == totalActualCost ? _self.totalActualCost : totalActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminBatchUserUsageStats {

 int get userId; Sub2ApiDecimal get todayActualCost; Sub2ApiDecimal get totalActualCost; List<Sub2ApiAdminPlatformUsage>? get byPlatform;
/// Create a copy of Sub2ApiAdminBatchUserUsageStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminBatchUserUsageStatsCopyWith<Sub2ApiAdminBatchUserUsageStats> get copyWith => _$Sub2ApiAdminBatchUserUsageStatsCopyWithImpl<Sub2ApiAdminBatchUserUsageStats>(this as Sub2ApiAdminBatchUserUsageStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminBatchUserUsageStats&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.todayActualCost, todayActualCost) || other.todayActualCost == todayActualCost)&&(identical(other.totalActualCost, totalActualCost) || other.totalActualCost == totalActualCost)&&const DeepCollectionEquality().equals(other.byPlatform, byPlatform));
}


@override
int get hashCode => Object.hash(runtimeType,userId,todayActualCost,totalActualCost,const DeepCollectionEquality().hash(byPlatform));

@override
String toString() {
  return 'Sub2ApiAdminBatchUserUsageStats(userId: $userId, todayActualCost: $todayActualCost, totalActualCost: $totalActualCost, byPlatform: $byPlatform)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminBatchUserUsageStatsCopyWith<$Res>  {
  factory $Sub2ApiAdminBatchUserUsageStatsCopyWith(Sub2ApiAdminBatchUserUsageStats value, $Res Function(Sub2ApiAdminBatchUserUsageStats) _then) = _$Sub2ApiAdminBatchUserUsageStatsCopyWithImpl;
@useResult
$Res call({
 int userId, Sub2ApiDecimal todayActualCost, Sub2ApiDecimal totalActualCost, List<Sub2ApiAdminPlatformUsage>? byPlatform
});




}
/// @nodoc
class _$Sub2ApiAdminBatchUserUsageStatsCopyWithImpl<$Res>
    implements $Sub2ApiAdminBatchUserUsageStatsCopyWith<$Res> {
  _$Sub2ApiAdminBatchUserUsageStatsCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminBatchUserUsageStats _self;
  final $Res Function(Sub2ApiAdminBatchUserUsageStats) _then;

/// Create a copy of Sub2ApiAdminBatchUserUsageStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? todayActualCost = null,Object? totalActualCost = null,Object? byPlatform = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,todayActualCost: null == todayActualCost ? _self.todayActualCost : todayActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalActualCost: null == totalActualCost ? _self.totalActualCost : totalActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,byPlatform: freezed == byPlatform ? _self.byPlatform : byPlatform // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminPlatformUsage>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminBatchUserUsageStats].
extension Sub2ApiAdminBatchUserUsageStatsPatterns on Sub2ApiAdminBatchUserUsageStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminBatchUserUsageStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchUserUsageStats() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminBatchUserUsageStats value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchUserUsageStats():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminBatchUserUsageStats value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchUserUsageStats() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal totalActualCost,  List<Sub2ApiAdminPlatformUsage>? byPlatform)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchUserUsageStats() when $default != null:
return $default(_that.userId,_that.todayActualCost,_that.totalActualCost,_that.byPlatform);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal totalActualCost,  List<Sub2ApiAdminPlatformUsage>? byPlatform)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchUserUsageStats():
return $default(_that.userId,_that.todayActualCost,_that.totalActualCost,_that.byPlatform);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal totalActualCost,  List<Sub2ApiAdminPlatformUsage>? byPlatform)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchUserUsageStats() when $default != null:
return $default(_that.userId,_that.todayActualCost,_that.totalActualCost,_that.byPlatform);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminBatchUserUsageStats implements Sub2ApiAdminBatchUserUsageStats {
  const _Sub2ApiAdminBatchUserUsageStats({required this.userId, required this.todayActualCost, required this.totalActualCost, final  List<Sub2ApiAdminPlatformUsage>? byPlatform}): _byPlatform = byPlatform;


@override final  int userId;
@override final  Sub2ApiDecimal todayActualCost;
@override final  Sub2ApiDecimal totalActualCost;
 final  List<Sub2ApiAdminPlatformUsage>? _byPlatform;
@override List<Sub2ApiAdminPlatformUsage>? get byPlatform {
  final value = _byPlatform;
  if (value == null) return null;
  if (_byPlatform is EqualUnmodifiableListView) return _byPlatform;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Sub2ApiAdminBatchUserUsageStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminBatchUserUsageStatsCopyWith<_Sub2ApiAdminBatchUserUsageStats> get copyWith => __$Sub2ApiAdminBatchUserUsageStatsCopyWithImpl<_Sub2ApiAdminBatchUserUsageStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminBatchUserUsageStats&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.todayActualCost, todayActualCost) || other.todayActualCost == todayActualCost)&&(identical(other.totalActualCost, totalActualCost) || other.totalActualCost == totalActualCost)&&const DeepCollectionEquality().equals(other._byPlatform, _byPlatform));
}


@override
int get hashCode => Object.hash(runtimeType,userId,todayActualCost,totalActualCost,const DeepCollectionEquality().hash(_byPlatform));

@override
String toString() {
  return 'Sub2ApiAdminBatchUserUsageStats(userId: $userId, todayActualCost: $todayActualCost, totalActualCost: $totalActualCost, byPlatform: $byPlatform)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminBatchUserUsageStatsCopyWith<$Res> implements $Sub2ApiAdminBatchUserUsageStatsCopyWith<$Res> {
  factory _$Sub2ApiAdminBatchUserUsageStatsCopyWith(_Sub2ApiAdminBatchUserUsageStats value, $Res Function(_Sub2ApiAdminBatchUserUsageStats) _then) = __$Sub2ApiAdminBatchUserUsageStatsCopyWithImpl;
@override @useResult
$Res call({
 int userId, Sub2ApiDecimal todayActualCost, Sub2ApiDecimal totalActualCost, List<Sub2ApiAdminPlatformUsage>? byPlatform
});




}
/// @nodoc
class __$Sub2ApiAdminBatchUserUsageStatsCopyWithImpl<$Res>
    implements _$Sub2ApiAdminBatchUserUsageStatsCopyWith<$Res> {
  __$Sub2ApiAdminBatchUserUsageStatsCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminBatchUserUsageStats _self;
  final $Res Function(_Sub2ApiAdminBatchUserUsageStats) _then;

/// Create a copy of Sub2ApiAdminBatchUserUsageStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? todayActualCost = null,Object? totalActualCost = null,Object? byPlatform = freezed,}) {
  return _then(_Sub2ApiAdminBatchUserUsageStats(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,todayActualCost: null == todayActualCost ? _self.todayActualCost : todayActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalActualCost: null == totalActualCost ? _self.totalActualCost : totalActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,byPlatform: freezed == byPlatform ? _self._byPlatform : byPlatform // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminPlatformUsage>?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminBatchApiKeyUsageStats {

 int get apiKeyId; Sub2ApiDecimal get todayActualCost; Sub2ApiDecimal get totalActualCost;
/// Create a copy of Sub2ApiAdminBatchApiKeyUsageStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminBatchApiKeyUsageStatsCopyWith<Sub2ApiAdminBatchApiKeyUsageStats> get copyWith => _$Sub2ApiAdminBatchApiKeyUsageStatsCopyWithImpl<Sub2ApiAdminBatchApiKeyUsageStats>(this as Sub2ApiAdminBatchApiKeyUsageStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminBatchApiKeyUsageStats&&(identical(other.apiKeyId, apiKeyId) || other.apiKeyId == apiKeyId)&&(identical(other.todayActualCost, todayActualCost) || other.todayActualCost == todayActualCost)&&(identical(other.totalActualCost, totalActualCost) || other.totalActualCost == totalActualCost));
}


@override
int get hashCode => Object.hash(runtimeType,apiKeyId,todayActualCost,totalActualCost);

@override
String toString() {
  return 'Sub2ApiAdminBatchApiKeyUsageStats(apiKeyId: $apiKeyId, todayActualCost: $todayActualCost, totalActualCost: $totalActualCost)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminBatchApiKeyUsageStatsCopyWith<$Res>  {
  factory $Sub2ApiAdminBatchApiKeyUsageStatsCopyWith(Sub2ApiAdminBatchApiKeyUsageStats value, $Res Function(Sub2ApiAdminBatchApiKeyUsageStats) _then) = _$Sub2ApiAdminBatchApiKeyUsageStatsCopyWithImpl;
@useResult
$Res call({
 int apiKeyId, Sub2ApiDecimal todayActualCost, Sub2ApiDecimal totalActualCost
});




}
/// @nodoc
class _$Sub2ApiAdminBatchApiKeyUsageStatsCopyWithImpl<$Res>
    implements $Sub2ApiAdminBatchApiKeyUsageStatsCopyWith<$Res> {
  _$Sub2ApiAdminBatchApiKeyUsageStatsCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminBatchApiKeyUsageStats _self;
  final $Res Function(Sub2ApiAdminBatchApiKeyUsageStats) _then;

/// Create a copy of Sub2ApiAdminBatchApiKeyUsageStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apiKeyId = null,Object? todayActualCost = null,Object? totalActualCost = null,}) {
  return _then(_self.copyWith(
apiKeyId: null == apiKeyId ? _self.apiKeyId : apiKeyId // ignore: cast_nullable_to_non_nullable
as int,todayActualCost: null == todayActualCost ? _self.todayActualCost : todayActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalActualCost: null == totalActualCost ? _self.totalActualCost : totalActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminBatchApiKeyUsageStats].
extension Sub2ApiAdminBatchApiKeyUsageStatsPatterns on Sub2ApiAdminBatchApiKeyUsageStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminBatchApiKeyUsageStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchApiKeyUsageStats() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminBatchApiKeyUsageStats value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchApiKeyUsageStats():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminBatchApiKeyUsageStats value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchApiKeyUsageStats() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int apiKeyId,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal totalActualCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchApiKeyUsageStats() when $default != null:
return $default(_that.apiKeyId,_that.todayActualCost,_that.totalActualCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int apiKeyId,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal totalActualCost)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchApiKeyUsageStats():
return $default(_that.apiKeyId,_that.todayActualCost,_that.totalActualCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int apiKeyId,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal totalActualCost)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchApiKeyUsageStats() when $default != null:
return $default(_that.apiKeyId,_that.todayActualCost,_that.totalActualCost);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminBatchApiKeyUsageStats implements Sub2ApiAdminBatchApiKeyUsageStats {
  const _Sub2ApiAdminBatchApiKeyUsageStats({required this.apiKeyId, required this.todayActualCost, required this.totalActualCost});


@override final  int apiKeyId;
@override final  Sub2ApiDecimal todayActualCost;
@override final  Sub2ApiDecimal totalActualCost;

/// Create a copy of Sub2ApiAdminBatchApiKeyUsageStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminBatchApiKeyUsageStatsCopyWith<_Sub2ApiAdminBatchApiKeyUsageStats> get copyWith => __$Sub2ApiAdminBatchApiKeyUsageStatsCopyWithImpl<_Sub2ApiAdminBatchApiKeyUsageStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminBatchApiKeyUsageStats&&(identical(other.apiKeyId, apiKeyId) || other.apiKeyId == apiKeyId)&&(identical(other.todayActualCost, todayActualCost) || other.todayActualCost == todayActualCost)&&(identical(other.totalActualCost, totalActualCost) || other.totalActualCost == totalActualCost));
}


@override
int get hashCode => Object.hash(runtimeType,apiKeyId,todayActualCost,totalActualCost);

@override
String toString() {
  return 'Sub2ApiAdminBatchApiKeyUsageStats(apiKeyId: $apiKeyId, todayActualCost: $todayActualCost, totalActualCost: $totalActualCost)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminBatchApiKeyUsageStatsCopyWith<$Res> implements $Sub2ApiAdminBatchApiKeyUsageStatsCopyWith<$Res> {
  factory _$Sub2ApiAdminBatchApiKeyUsageStatsCopyWith(_Sub2ApiAdminBatchApiKeyUsageStats value, $Res Function(_Sub2ApiAdminBatchApiKeyUsageStats) _then) = __$Sub2ApiAdminBatchApiKeyUsageStatsCopyWithImpl;
@override @useResult
$Res call({
 int apiKeyId, Sub2ApiDecimal todayActualCost, Sub2ApiDecimal totalActualCost
});




}
/// @nodoc
class __$Sub2ApiAdminBatchApiKeyUsageStatsCopyWithImpl<$Res>
    implements _$Sub2ApiAdminBatchApiKeyUsageStatsCopyWith<$Res> {
  __$Sub2ApiAdminBatchApiKeyUsageStatsCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminBatchApiKeyUsageStats _self;
  final $Res Function(_Sub2ApiAdminBatchApiKeyUsageStats) _then;

/// Create a copy of Sub2ApiAdminBatchApiKeyUsageStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apiKeyId = null,Object? todayActualCost = null,Object? totalActualCost = null,}) {
  return _then(_Sub2ApiAdminBatchApiKeyUsageStats(
apiKeyId: null == apiKeyId ? _self.apiKeyId : apiKeyId // ignore: cast_nullable_to_non_nullable
as int,todayActualCost: null == todayActualCost ? _self.todayActualCost : todayActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalActualCost: null == totalActualCost ? _self.totalActualCost : totalActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUserBreakdownItem {

 int get userId; String get email; int get requests; int get inputTokens; int get outputTokens; int get cacheTokens; int get totalTokens; Sub2ApiDecimal get cost; Sub2ApiDecimal get actualCost; Sub2ApiDecimal get accountCost;
/// Create a copy of Sub2ApiAdminUserBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUserBreakdownItemCopyWith<Sub2ApiAdminUserBreakdownItem> get copyWith => _$Sub2ApiAdminUserBreakdownItemCopyWithImpl<Sub2ApiAdminUserBreakdownItem>(this as Sub2ApiAdminUserBreakdownItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUserBreakdownItem&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.inputTokens, inputTokens) || other.inputTokens == inputTokens)&&(identical(other.outputTokens, outputTokens) || other.outputTokens == outputTokens)&&(identical(other.cacheTokens, cacheTokens) || other.cacheTokens == cacheTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost)&&(identical(other.accountCost, accountCost) || other.accountCost == accountCost));
}


@override
int get hashCode => Object.hash(runtimeType,userId,email,requests,inputTokens,outputTokens,cacheTokens,totalTokens,cost,actualCost,accountCost);

@override
String toString() {
  return 'Sub2ApiAdminUserBreakdownItem(userId: $userId, email: $email, requests: $requests, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheTokens: $cacheTokens, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost, accountCost: $accountCost)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUserBreakdownItemCopyWith<$Res>  {
  factory $Sub2ApiAdminUserBreakdownItemCopyWith(Sub2ApiAdminUserBreakdownItem value, $Res Function(Sub2ApiAdminUserBreakdownItem) _then) = _$Sub2ApiAdminUserBreakdownItemCopyWithImpl;
@useResult
$Res call({
 int userId, String email, int requests, int inputTokens, int outputTokens, int cacheTokens, int totalTokens, Sub2ApiDecimal cost, Sub2ApiDecimal actualCost, Sub2ApiDecimal accountCost
});




}
/// @nodoc
class _$Sub2ApiAdminUserBreakdownItemCopyWithImpl<$Res>
    implements $Sub2ApiAdminUserBreakdownItemCopyWith<$Res> {
  _$Sub2ApiAdminUserBreakdownItemCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUserBreakdownItem _self;
  final $Res Function(Sub2ApiAdminUserBreakdownItem) _then;

/// Create a copy of Sub2ApiAdminUserBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? email = null,Object? requests = null,Object? inputTokens = null,Object? outputTokens = null,Object? cacheTokens = null,Object? totalTokens = null,Object? cost = null,Object? actualCost = null,Object? accountCost = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,inputTokens: null == inputTokens ? _self.inputTokens : inputTokens // ignore: cast_nullable_to_non_nullable
as int,outputTokens: null == outputTokens ? _self.outputTokens : outputTokens // ignore: cast_nullable_to_non_nullable
as int,cacheTokens: null == cacheTokens ? _self.cacheTokens : cacheTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,actualCost: null == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,accountCost: null == accountCost ? _self.accountCost : accountCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUserBreakdownItem].
extension Sub2ApiAdminUserBreakdownItemPatterns on Sub2ApiAdminUserBreakdownItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserBreakdownItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdownItem() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserBreakdownItem value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdownItem():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUserBreakdownItem value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdownItem() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  String email,  int requests,  int inputTokens,  int outputTokens,  int cacheTokens,  int totalTokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost,  Sub2ApiDecimal accountCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdownItem() when $default != null:
return $default(_that.userId,_that.email,_that.requests,_that.inputTokens,_that.outputTokens,_that.cacheTokens,_that.totalTokens,_that.cost,_that.actualCost,_that.accountCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  String email,  int requests,  int inputTokens,  int outputTokens,  int cacheTokens,  int totalTokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost,  Sub2ApiDecimal accountCost)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdownItem():
return $default(_that.userId,_that.email,_that.requests,_that.inputTokens,_that.outputTokens,_that.cacheTokens,_that.totalTokens,_that.cost,_that.actualCost,_that.accountCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  String email,  int requests,  int inputTokens,  int outputTokens,  int cacheTokens,  int totalTokens,  Sub2ApiDecimal cost,  Sub2ApiDecimal actualCost,  Sub2ApiDecimal accountCost)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdownItem() when $default != null:
return $default(_that.userId,_that.email,_that.requests,_that.inputTokens,_that.outputTokens,_that.cacheTokens,_that.totalTokens,_that.cost,_that.actualCost,_that.accountCost);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUserBreakdownItem implements Sub2ApiAdminUserBreakdownItem {
  const _Sub2ApiAdminUserBreakdownItem({required this.userId, required this.email, required this.requests, required this.inputTokens, required this.outputTokens, required this.cacheTokens, required this.totalTokens, required this.cost, required this.actualCost, required this.accountCost});


@override final  int userId;
@override final  String email;
@override final  int requests;
@override final  int inputTokens;
@override final  int outputTokens;
@override final  int cacheTokens;
@override final  int totalTokens;
@override final  Sub2ApiDecimal cost;
@override final  Sub2ApiDecimal actualCost;
@override final  Sub2ApiDecimal accountCost;

/// Create a copy of Sub2ApiAdminUserBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUserBreakdownItemCopyWith<_Sub2ApiAdminUserBreakdownItem> get copyWith => __$Sub2ApiAdminUserBreakdownItemCopyWithImpl<_Sub2ApiAdminUserBreakdownItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUserBreakdownItem&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.requests, requests) || other.requests == requests)&&(identical(other.inputTokens, inputTokens) || other.inputTokens == inputTokens)&&(identical(other.outputTokens, outputTokens) || other.outputTokens == outputTokens)&&(identical(other.cacheTokens, cacheTokens) || other.cacheTokens == cacheTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost)&&(identical(other.accountCost, accountCost) || other.accountCost == accountCost));
}


@override
int get hashCode => Object.hash(runtimeType,userId,email,requests,inputTokens,outputTokens,cacheTokens,totalTokens,cost,actualCost,accountCost);

@override
String toString() {
  return 'Sub2ApiAdminUserBreakdownItem(userId: $userId, email: $email, requests: $requests, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheTokens: $cacheTokens, totalTokens: $totalTokens, cost: $cost, actualCost: $actualCost, accountCost: $accountCost)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUserBreakdownItemCopyWith<$Res> implements $Sub2ApiAdminUserBreakdownItemCopyWith<$Res> {
  factory _$Sub2ApiAdminUserBreakdownItemCopyWith(_Sub2ApiAdminUserBreakdownItem value, $Res Function(_Sub2ApiAdminUserBreakdownItem) _then) = __$Sub2ApiAdminUserBreakdownItemCopyWithImpl;
@override @useResult
$Res call({
 int userId, String email, int requests, int inputTokens, int outputTokens, int cacheTokens, int totalTokens, Sub2ApiDecimal cost, Sub2ApiDecimal actualCost, Sub2ApiDecimal accountCost
});




}
/// @nodoc
class __$Sub2ApiAdminUserBreakdownItemCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUserBreakdownItemCopyWith<$Res> {
  __$Sub2ApiAdminUserBreakdownItemCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUserBreakdownItem _self;
  final $Res Function(_Sub2ApiAdminUserBreakdownItem) _then;

/// Create a copy of Sub2ApiAdminUserBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? email = null,Object? requests = null,Object? inputTokens = null,Object? outputTokens = null,Object? cacheTokens = null,Object? totalTokens = null,Object? cost = null,Object? actualCost = null,Object? accountCost = null,}) {
  return _then(_Sub2ApiAdminUserBreakdownItem(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as int,inputTokens: null == inputTokens ? _self.inputTokens : inputTokens // ignore: cast_nullable_to_non_nullable
as int,outputTokens: null == outputTokens ? _self.outputTokens : outputTokens // ignore: cast_nullable_to_non_nullable
as int,cacheTokens: null == cacheTokens ? _self.cacheTokens : cacheTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,actualCost: null == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,accountCost: null == accountCost ? _self.accountCost : accountCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUserBreakdown {

 List<Sub2ApiAdminUserBreakdownItem> get users; DateTime get startDate; DateTime get endDate;
/// Create a copy of Sub2ApiAdminUserBreakdown
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUserBreakdownCopyWith<Sub2ApiAdminUserBreakdown> get copyWith => _$Sub2ApiAdminUserBreakdownCopyWithImpl<Sub2ApiAdminUserBreakdown>(this as Sub2ApiAdminUserBreakdown, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUserBreakdown&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),startDate,endDate);

@override
String toString() {
  return 'Sub2ApiAdminUserBreakdown(users: $users, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUserBreakdownCopyWith<$Res>  {
  factory $Sub2ApiAdminUserBreakdownCopyWith(Sub2ApiAdminUserBreakdown value, $Res Function(Sub2ApiAdminUserBreakdown) _then) = _$Sub2ApiAdminUserBreakdownCopyWithImpl;
@useResult
$Res call({
 List<Sub2ApiAdminUserBreakdownItem> users, DateTime startDate, DateTime endDate
});




}
/// @nodoc
class _$Sub2ApiAdminUserBreakdownCopyWithImpl<$Res>
    implements $Sub2ApiAdminUserBreakdownCopyWith<$Res> {
  _$Sub2ApiAdminUserBreakdownCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUserBreakdown _self;
  final $Res Function(Sub2ApiAdminUserBreakdown) _then;

/// Create a copy of Sub2ApiAdminUserBreakdown
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminUserBreakdownItem>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUserBreakdown].
extension Sub2ApiAdminUserBreakdownPatterns on Sub2ApiAdminUserBreakdown {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserBreakdown value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdown() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserBreakdown value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdown():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUserBreakdown value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdown() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Sub2ApiAdminUserBreakdownItem> users,  DateTime startDate,  DateTime endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdown() when $default != null:
return $default(_that.users,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Sub2ApiAdminUserBreakdownItem> users,  DateTime startDate,  DateTime endDate)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdown():
return $default(_that.users,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Sub2ApiAdminUserBreakdownItem> users,  DateTime startDate,  DateTime endDate)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserBreakdown() when $default != null:
return $default(_that.users,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUserBreakdown implements Sub2ApiAdminUserBreakdown {
  const _Sub2ApiAdminUserBreakdown({required final  List<Sub2ApiAdminUserBreakdownItem> users, required this.startDate, required this.endDate}): _users = users;


 final  List<Sub2ApiAdminUserBreakdownItem> _users;
@override List<Sub2ApiAdminUserBreakdownItem> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override final  DateTime startDate;
@override final  DateTime endDate;

/// Create a copy of Sub2ApiAdminUserBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUserBreakdownCopyWith<_Sub2ApiAdminUserBreakdown> get copyWith => __$Sub2ApiAdminUserBreakdownCopyWithImpl<_Sub2ApiAdminUserBreakdown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUserBreakdown&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),startDate,endDate);

@override
String toString() {
  return 'Sub2ApiAdminUserBreakdown(users: $users, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUserBreakdownCopyWith<$Res> implements $Sub2ApiAdminUserBreakdownCopyWith<$Res> {
  factory _$Sub2ApiAdminUserBreakdownCopyWith(_Sub2ApiAdminUserBreakdown value, $Res Function(_Sub2ApiAdminUserBreakdown) _then) = __$Sub2ApiAdminUserBreakdownCopyWithImpl;
@override @useResult
$Res call({
 List<Sub2ApiAdminUserBreakdownItem> users, DateTime startDate, DateTime endDate
});




}
/// @nodoc
class __$Sub2ApiAdminUserBreakdownCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUserBreakdownCopyWith<$Res> {
  __$Sub2ApiAdminUserBreakdownCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUserBreakdown _self;
  final $Res Function(_Sub2ApiAdminUserBreakdown) _then;

/// Create a copy of Sub2ApiAdminUserBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_Sub2ApiAdminUserBreakdown(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminUserBreakdownItem>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminDashboardSnapshotStats {

 int get totalUsers; int get todayNewUsers; int get activeUsers; int get hourlyActiveUsers; DateTime get statsUpdatedAt; bool get statsStale; int get totalApiKeys; int get activeApiKeys; int get totalAccounts; int get normalAccounts; int get errorAccounts; int get rateLimitAccounts; int get overloadAccounts; int get totalRequests; int get totalInputTokens; int get totalOutputTokens; int get totalCacheCreationTokens; int get totalCacheReadTokens; int get totalTokens; Sub2ApiDecimal get totalCost; Sub2ApiDecimal get totalActualCost; Sub2ApiDecimal get totalAccountCost; int get todayRequests; int get todayInputTokens; int get todayOutputTokens; int get todayCacheCreationTokens; int get todayCacheReadTokens; int get todayTokens; Sub2ApiDecimal get todayCost; Sub2ApiDecimal get todayActualCost; Sub2ApiDecimal get todayAccountCost; Sub2ApiDecimal get averageDurationMs; int get rpm; int get tpm; int get uptime;
/// Create a copy of Sub2ApiAdminDashboardSnapshotStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardSnapshotStatsCopyWith<Sub2ApiAdminDashboardSnapshotStats> get copyWith => _$Sub2ApiAdminDashboardSnapshotStatsCopyWithImpl<Sub2ApiAdminDashboardSnapshotStats>(this as Sub2ApiAdminDashboardSnapshotStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminDashboardSnapshotStats&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers)&&(identical(other.todayNewUsers, todayNewUsers) || other.todayNewUsers == todayNewUsers)&&(identical(other.activeUsers, activeUsers) || other.activeUsers == activeUsers)&&(identical(other.hourlyActiveUsers, hourlyActiveUsers) || other.hourlyActiveUsers == hourlyActiveUsers)&&(identical(other.statsUpdatedAt, statsUpdatedAt) || other.statsUpdatedAt == statsUpdatedAt)&&(identical(other.statsStale, statsStale) || other.statsStale == statsStale)&&(identical(other.totalApiKeys, totalApiKeys) || other.totalApiKeys == totalApiKeys)&&(identical(other.activeApiKeys, activeApiKeys) || other.activeApiKeys == activeApiKeys)&&(identical(other.totalAccounts, totalAccounts) || other.totalAccounts == totalAccounts)&&(identical(other.normalAccounts, normalAccounts) || other.normalAccounts == normalAccounts)&&(identical(other.errorAccounts, errorAccounts) || other.errorAccounts == errorAccounts)&&(identical(other.rateLimitAccounts, rateLimitAccounts) || other.rateLimitAccounts == rateLimitAccounts)&&(identical(other.overloadAccounts, overloadAccounts) || other.overloadAccounts == overloadAccounts)&&(identical(other.totalRequests, totalRequests) || other.totalRequests == totalRequests)&&(identical(other.totalInputTokens, totalInputTokens) || other.totalInputTokens == totalInputTokens)&&(identical(other.totalOutputTokens, totalOutputTokens) || other.totalOutputTokens == totalOutputTokens)&&(identical(other.totalCacheCreationTokens, totalCacheCreationTokens) || other.totalCacheCreationTokens == totalCacheCreationTokens)&&(identical(other.totalCacheReadTokens, totalCacheReadTokens) || other.totalCacheReadTokens == totalCacheReadTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.totalActualCost, totalActualCost) || other.totalActualCost == totalActualCost)&&(identical(other.totalAccountCost, totalAccountCost) || other.totalAccountCost == totalAccountCost)&&(identical(other.todayRequests, todayRequests) || other.todayRequests == todayRequests)&&(identical(other.todayInputTokens, todayInputTokens) || other.todayInputTokens == todayInputTokens)&&(identical(other.todayOutputTokens, todayOutputTokens) || other.todayOutputTokens == todayOutputTokens)&&(identical(other.todayCacheCreationTokens, todayCacheCreationTokens) || other.todayCacheCreationTokens == todayCacheCreationTokens)&&(identical(other.todayCacheReadTokens, todayCacheReadTokens) || other.todayCacheReadTokens == todayCacheReadTokens)&&(identical(other.todayTokens, todayTokens) || other.todayTokens == todayTokens)&&(identical(other.todayCost, todayCost) || other.todayCost == todayCost)&&(identical(other.todayActualCost, todayActualCost) || other.todayActualCost == todayActualCost)&&(identical(other.todayAccountCost, todayAccountCost) || other.todayAccountCost == todayAccountCost)&&(identical(other.averageDurationMs, averageDurationMs) || other.averageDurationMs == averageDurationMs)&&(identical(other.rpm, rpm) || other.rpm == rpm)&&(identical(other.tpm, tpm) || other.tpm == tpm)&&(identical(other.uptime, uptime) || other.uptime == uptime));
}


@override
int get hashCode => Object.hashAll([runtimeType,totalUsers,todayNewUsers,activeUsers,hourlyActiveUsers,statsUpdatedAt,statsStale,totalApiKeys,activeApiKeys,totalAccounts,normalAccounts,errorAccounts,rateLimitAccounts,overloadAccounts,totalRequests,totalInputTokens,totalOutputTokens,totalCacheCreationTokens,totalCacheReadTokens,totalTokens,totalCost,totalActualCost,totalAccountCost,todayRequests,todayInputTokens,todayOutputTokens,todayCacheCreationTokens,todayCacheReadTokens,todayTokens,todayCost,todayActualCost,todayAccountCost,averageDurationMs,rpm,tpm,uptime]);

@override
String toString() {
  return 'Sub2ApiAdminDashboardSnapshotStats(totalUsers: $totalUsers, todayNewUsers: $todayNewUsers, activeUsers: $activeUsers, hourlyActiveUsers: $hourlyActiveUsers, statsUpdatedAt: $statsUpdatedAt, statsStale: $statsStale, totalApiKeys: $totalApiKeys, activeApiKeys: $activeApiKeys, totalAccounts: $totalAccounts, normalAccounts: $normalAccounts, errorAccounts: $errorAccounts, rateLimitAccounts: $rateLimitAccounts, overloadAccounts: $overloadAccounts, totalRequests: $totalRequests, totalInputTokens: $totalInputTokens, totalOutputTokens: $totalOutputTokens, totalCacheCreationTokens: $totalCacheCreationTokens, totalCacheReadTokens: $totalCacheReadTokens, totalTokens: $totalTokens, totalCost: $totalCost, totalActualCost: $totalActualCost, totalAccountCost: $totalAccountCost, todayRequests: $todayRequests, todayInputTokens: $todayInputTokens, todayOutputTokens: $todayOutputTokens, todayCacheCreationTokens: $todayCacheCreationTokens, todayCacheReadTokens: $todayCacheReadTokens, todayTokens: $todayTokens, todayCost: $todayCost, todayActualCost: $todayActualCost, todayAccountCost: $todayAccountCost, averageDurationMs: $averageDurationMs, rpm: $rpm, tpm: $tpm, uptime: $uptime)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminDashboardSnapshotStatsCopyWith<$Res>  {
  factory $Sub2ApiAdminDashboardSnapshotStatsCopyWith(Sub2ApiAdminDashboardSnapshotStats value, $Res Function(Sub2ApiAdminDashboardSnapshotStats) _then) = _$Sub2ApiAdminDashboardSnapshotStatsCopyWithImpl;
@useResult
$Res call({
 int totalUsers, int todayNewUsers, int activeUsers, int hourlyActiveUsers, DateTime statsUpdatedAt, bool statsStale, int totalApiKeys, int activeApiKeys, int totalAccounts, int normalAccounts, int errorAccounts, int rateLimitAccounts, int overloadAccounts, int totalRequests, int totalInputTokens, int totalOutputTokens, int totalCacheCreationTokens, int totalCacheReadTokens, int totalTokens, Sub2ApiDecimal totalCost, Sub2ApiDecimal totalActualCost, Sub2ApiDecimal totalAccountCost, int todayRequests, int todayInputTokens, int todayOutputTokens, int todayCacheCreationTokens, int todayCacheReadTokens, int todayTokens, Sub2ApiDecimal todayCost, Sub2ApiDecimal todayActualCost, Sub2ApiDecimal todayAccountCost, Sub2ApiDecimal averageDurationMs, int rpm, int tpm, int uptime
});




}
/// @nodoc
class _$Sub2ApiAdminDashboardSnapshotStatsCopyWithImpl<$Res>
    implements $Sub2ApiAdminDashboardSnapshotStatsCopyWith<$Res> {
  _$Sub2ApiAdminDashboardSnapshotStatsCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminDashboardSnapshotStats _self;
  final $Res Function(Sub2ApiAdminDashboardSnapshotStats) _then;

/// Create a copy of Sub2ApiAdminDashboardSnapshotStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalUsers = null,Object? todayNewUsers = null,Object? activeUsers = null,Object? hourlyActiveUsers = null,Object? statsUpdatedAt = null,Object? statsStale = null,Object? totalApiKeys = null,Object? activeApiKeys = null,Object? totalAccounts = null,Object? normalAccounts = null,Object? errorAccounts = null,Object? rateLimitAccounts = null,Object? overloadAccounts = null,Object? totalRequests = null,Object? totalInputTokens = null,Object? totalOutputTokens = null,Object? totalCacheCreationTokens = null,Object? totalCacheReadTokens = null,Object? totalTokens = null,Object? totalCost = null,Object? totalActualCost = null,Object? totalAccountCost = null,Object? todayRequests = null,Object? todayInputTokens = null,Object? todayOutputTokens = null,Object? todayCacheCreationTokens = null,Object? todayCacheReadTokens = null,Object? todayTokens = null,Object? todayCost = null,Object? todayActualCost = null,Object? todayAccountCost = null,Object? averageDurationMs = null,Object? rpm = null,Object? tpm = null,Object? uptime = null,}) {
  return _then(_self.copyWith(
totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,todayNewUsers: null == todayNewUsers ? _self.todayNewUsers : todayNewUsers // ignore: cast_nullable_to_non_nullable
as int,activeUsers: null == activeUsers ? _self.activeUsers : activeUsers // ignore: cast_nullable_to_non_nullable
as int,hourlyActiveUsers: null == hourlyActiveUsers ? _self.hourlyActiveUsers : hourlyActiveUsers // ignore: cast_nullable_to_non_nullable
as int,statsUpdatedAt: null == statsUpdatedAt ? _self.statsUpdatedAt : statsUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,statsStale: null == statsStale ? _self.statsStale : statsStale // ignore: cast_nullable_to_non_nullable
as bool,totalApiKeys: null == totalApiKeys ? _self.totalApiKeys : totalApiKeys // ignore: cast_nullable_to_non_nullable
as int,activeApiKeys: null == activeApiKeys ? _self.activeApiKeys : activeApiKeys // ignore: cast_nullable_to_non_nullable
as int,totalAccounts: null == totalAccounts ? _self.totalAccounts : totalAccounts // ignore: cast_nullable_to_non_nullable
as int,normalAccounts: null == normalAccounts ? _self.normalAccounts : normalAccounts // ignore: cast_nullable_to_non_nullable
as int,errorAccounts: null == errorAccounts ? _self.errorAccounts : errorAccounts // ignore: cast_nullable_to_non_nullable
as int,rateLimitAccounts: null == rateLimitAccounts ? _self.rateLimitAccounts : rateLimitAccounts // ignore: cast_nullable_to_non_nullable
as int,overloadAccounts: null == overloadAccounts ? _self.overloadAccounts : overloadAccounts // ignore: cast_nullable_to_non_nullable
as int,totalRequests: null == totalRequests ? _self.totalRequests : totalRequests // ignore: cast_nullable_to_non_nullable
as int,totalInputTokens: null == totalInputTokens ? _self.totalInputTokens : totalInputTokens // ignore: cast_nullable_to_non_nullable
as int,totalOutputTokens: null == totalOutputTokens ? _self.totalOutputTokens : totalOutputTokens // ignore: cast_nullable_to_non_nullable
as int,totalCacheCreationTokens: null == totalCacheCreationTokens ? _self.totalCacheCreationTokens : totalCacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,totalCacheReadTokens: null == totalCacheReadTokens ? _self.totalCacheReadTokens : totalCacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,totalCost: null == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalActualCost: null == totalActualCost ? _self.totalActualCost : totalActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalAccountCost: null == totalAccountCost ? _self.totalAccountCost : totalAccountCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,todayRequests: null == todayRequests ? _self.todayRequests : todayRequests // ignore: cast_nullable_to_non_nullable
as int,todayInputTokens: null == todayInputTokens ? _self.todayInputTokens : todayInputTokens // ignore: cast_nullable_to_non_nullable
as int,todayOutputTokens: null == todayOutputTokens ? _self.todayOutputTokens : todayOutputTokens // ignore: cast_nullable_to_non_nullable
as int,todayCacheCreationTokens: null == todayCacheCreationTokens ? _self.todayCacheCreationTokens : todayCacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,todayCacheReadTokens: null == todayCacheReadTokens ? _self.todayCacheReadTokens : todayCacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,todayTokens: null == todayTokens ? _self.todayTokens : todayTokens // ignore: cast_nullable_to_non_nullable
as int,todayCost: null == todayCost ? _self.todayCost : todayCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,todayActualCost: null == todayActualCost ? _self.todayActualCost : todayActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,todayAccountCost: null == todayAccountCost ? _self.todayAccountCost : todayAccountCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,averageDurationMs: null == averageDurationMs ? _self.averageDurationMs : averageDurationMs // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,rpm: null == rpm ? _self.rpm : rpm // ignore: cast_nullable_to_non_nullable
as int,tpm: null == tpm ? _self.tpm : tpm // ignore: cast_nullable_to_non_nullable
as int,uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminDashboardSnapshotStats].
extension Sub2ApiAdminDashboardSnapshotStatsPatterns on Sub2ApiAdminDashboardSnapshotStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardSnapshotStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshotStats() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardSnapshotStats value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshotStats():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminDashboardSnapshotStats value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshotStats() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalUsers,  int todayNewUsers,  int activeUsers,  int hourlyActiveUsers,  DateTime statsUpdatedAt,  bool statsStale,  int totalApiKeys,  int activeApiKeys,  int totalAccounts,  int normalAccounts,  int errorAccounts,  int rateLimitAccounts,  int overloadAccounts,  int totalRequests,  int totalInputTokens,  int totalOutputTokens,  int totalCacheCreationTokens,  int totalCacheReadTokens,  int totalTokens,  Sub2ApiDecimal totalCost,  Sub2ApiDecimal totalActualCost,  Sub2ApiDecimal totalAccountCost,  int todayRequests,  int todayInputTokens,  int todayOutputTokens,  int todayCacheCreationTokens,  int todayCacheReadTokens,  int todayTokens,  Sub2ApiDecimal todayCost,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal todayAccountCost,  Sub2ApiDecimal averageDurationMs,  int rpm,  int tpm,  int uptime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshotStats() when $default != null:
return $default(_that.totalUsers,_that.todayNewUsers,_that.activeUsers,_that.hourlyActiveUsers,_that.statsUpdatedAt,_that.statsStale,_that.totalApiKeys,_that.activeApiKeys,_that.totalAccounts,_that.normalAccounts,_that.errorAccounts,_that.rateLimitAccounts,_that.overloadAccounts,_that.totalRequests,_that.totalInputTokens,_that.totalOutputTokens,_that.totalCacheCreationTokens,_that.totalCacheReadTokens,_that.totalTokens,_that.totalCost,_that.totalActualCost,_that.totalAccountCost,_that.todayRequests,_that.todayInputTokens,_that.todayOutputTokens,_that.todayCacheCreationTokens,_that.todayCacheReadTokens,_that.todayTokens,_that.todayCost,_that.todayActualCost,_that.todayAccountCost,_that.averageDurationMs,_that.rpm,_that.tpm,_that.uptime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalUsers,  int todayNewUsers,  int activeUsers,  int hourlyActiveUsers,  DateTime statsUpdatedAt,  bool statsStale,  int totalApiKeys,  int activeApiKeys,  int totalAccounts,  int normalAccounts,  int errorAccounts,  int rateLimitAccounts,  int overloadAccounts,  int totalRequests,  int totalInputTokens,  int totalOutputTokens,  int totalCacheCreationTokens,  int totalCacheReadTokens,  int totalTokens,  Sub2ApiDecimal totalCost,  Sub2ApiDecimal totalActualCost,  Sub2ApiDecimal totalAccountCost,  int todayRequests,  int todayInputTokens,  int todayOutputTokens,  int todayCacheCreationTokens,  int todayCacheReadTokens,  int todayTokens,  Sub2ApiDecimal todayCost,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal todayAccountCost,  Sub2ApiDecimal averageDurationMs,  int rpm,  int tpm,  int uptime)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshotStats():
return $default(_that.totalUsers,_that.todayNewUsers,_that.activeUsers,_that.hourlyActiveUsers,_that.statsUpdatedAt,_that.statsStale,_that.totalApiKeys,_that.activeApiKeys,_that.totalAccounts,_that.normalAccounts,_that.errorAccounts,_that.rateLimitAccounts,_that.overloadAccounts,_that.totalRequests,_that.totalInputTokens,_that.totalOutputTokens,_that.totalCacheCreationTokens,_that.totalCacheReadTokens,_that.totalTokens,_that.totalCost,_that.totalActualCost,_that.totalAccountCost,_that.todayRequests,_that.todayInputTokens,_that.todayOutputTokens,_that.todayCacheCreationTokens,_that.todayCacheReadTokens,_that.todayTokens,_that.todayCost,_that.todayActualCost,_that.todayAccountCost,_that.averageDurationMs,_that.rpm,_that.tpm,_that.uptime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalUsers,  int todayNewUsers,  int activeUsers,  int hourlyActiveUsers,  DateTime statsUpdatedAt,  bool statsStale,  int totalApiKeys,  int activeApiKeys,  int totalAccounts,  int normalAccounts,  int errorAccounts,  int rateLimitAccounts,  int overloadAccounts,  int totalRequests,  int totalInputTokens,  int totalOutputTokens,  int totalCacheCreationTokens,  int totalCacheReadTokens,  int totalTokens,  Sub2ApiDecimal totalCost,  Sub2ApiDecimal totalActualCost,  Sub2ApiDecimal totalAccountCost,  int todayRequests,  int todayInputTokens,  int todayOutputTokens,  int todayCacheCreationTokens,  int todayCacheReadTokens,  int todayTokens,  Sub2ApiDecimal todayCost,  Sub2ApiDecimal todayActualCost,  Sub2ApiDecimal todayAccountCost,  Sub2ApiDecimal averageDurationMs,  int rpm,  int tpm,  int uptime)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshotStats() when $default != null:
return $default(_that.totalUsers,_that.todayNewUsers,_that.activeUsers,_that.hourlyActiveUsers,_that.statsUpdatedAt,_that.statsStale,_that.totalApiKeys,_that.activeApiKeys,_that.totalAccounts,_that.normalAccounts,_that.errorAccounts,_that.rateLimitAccounts,_that.overloadAccounts,_that.totalRequests,_that.totalInputTokens,_that.totalOutputTokens,_that.totalCacheCreationTokens,_that.totalCacheReadTokens,_that.totalTokens,_that.totalCost,_that.totalActualCost,_that.totalAccountCost,_that.todayRequests,_that.todayInputTokens,_that.todayOutputTokens,_that.todayCacheCreationTokens,_that.todayCacheReadTokens,_that.todayTokens,_that.todayCost,_that.todayActualCost,_that.todayAccountCost,_that.averageDurationMs,_that.rpm,_that.tpm,_that.uptime);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminDashboardSnapshotStats implements Sub2ApiAdminDashboardSnapshotStats {
  const _Sub2ApiAdminDashboardSnapshotStats({required this.totalUsers, required this.todayNewUsers, required this.activeUsers, required this.hourlyActiveUsers, required this.statsUpdatedAt, required this.statsStale, required this.totalApiKeys, required this.activeApiKeys, required this.totalAccounts, required this.normalAccounts, required this.errorAccounts, required this.rateLimitAccounts, required this.overloadAccounts, required this.totalRequests, required this.totalInputTokens, required this.totalOutputTokens, required this.totalCacheCreationTokens, required this.totalCacheReadTokens, required this.totalTokens, required this.totalCost, required this.totalActualCost, required this.totalAccountCost, required this.todayRequests, required this.todayInputTokens, required this.todayOutputTokens, required this.todayCacheCreationTokens, required this.todayCacheReadTokens, required this.todayTokens, required this.todayCost, required this.todayActualCost, required this.todayAccountCost, required this.averageDurationMs, required this.rpm, required this.tpm, required this.uptime});


@override final  int totalUsers;
@override final  int todayNewUsers;
@override final  int activeUsers;
@override final  int hourlyActiveUsers;
@override final  DateTime statsUpdatedAt;
@override final  bool statsStale;
@override final  int totalApiKeys;
@override final  int activeApiKeys;
@override final  int totalAccounts;
@override final  int normalAccounts;
@override final  int errorAccounts;
@override final  int rateLimitAccounts;
@override final  int overloadAccounts;
@override final  int totalRequests;
@override final  int totalInputTokens;
@override final  int totalOutputTokens;
@override final  int totalCacheCreationTokens;
@override final  int totalCacheReadTokens;
@override final  int totalTokens;
@override final  Sub2ApiDecimal totalCost;
@override final  Sub2ApiDecimal totalActualCost;
@override final  Sub2ApiDecimal totalAccountCost;
@override final  int todayRequests;
@override final  int todayInputTokens;
@override final  int todayOutputTokens;
@override final  int todayCacheCreationTokens;
@override final  int todayCacheReadTokens;
@override final  int todayTokens;
@override final  Sub2ApiDecimal todayCost;
@override final  Sub2ApiDecimal todayActualCost;
@override final  Sub2ApiDecimal todayAccountCost;
@override final  Sub2ApiDecimal averageDurationMs;
@override final  int rpm;
@override final  int tpm;
@override final  int uptime;

/// Create a copy of Sub2ApiAdminDashboardSnapshotStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminDashboardSnapshotStatsCopyWith<_Sub2ApiAdminDashboardSnapshotStats> get copyWith => __$Sub2ApiAdminDashboardSnapshotStatsCopyWithImpl<_Sub2ApiAdminDashboardSnapshotStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminDashboardSnapshotStats&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers)&&(identical(other.todayNewUsers, todayNewUsers) || other.todayNewUsers == todayNewUsers)&&(identical(other.activeUsers, activeUsers) || other.activeUsers == activeUsers)&&(identical(other.hourlyActiveUsers, hourlyActiveUsers) || other.hourlyActiveUsers == hourlyActiveUsers)&&(identical(other.statsUpdatedAt, statsUpdatedAt) || other.statsUpdatedAt == statsUpdatedAt)&&(identical(other.statsStale, statsStale) || other.statsStale == statsStale)&&(identical(other.totalApiKeys, totalApiKeys) || other.totalApiKeys == totalApiKeys)&&(identical(other.activeApiKeys, activeApiKeys) || other.activeApiKeys == activeApiKeys)&&(identical(other.totalAccounts, totalAccounts) || other.totalAccounts == totalAccounts)&&(identical(other.normalAccounts, normalAccounts) || other.normalAccounts == normalAccounts)&&(identical(other.errorAccounts, errorAccounts) || other.errorAccounts == errorAccounts)&&(identical(other.rateLimitAccounts, rateLimitAccounts) || other.rateLimitAccounts == rateLimitAccounts)&&(identical(other.overloadAccounts, overloadAccounts) || other.overloadAccounts == overloadAccounts)&&(identical(other.totalRequests, totalRequests) || other.totalRequests == totalRequests)&&(identical(other.totalInputTokens, totalInputTokens) || other.totalInputTokens == totalInputTokens)&&(identical(other.totalOutputTokens, totalOutputTokens) || other.totalOutputTokens == totalOutputTokens)&&(identical(other.totalCacheCreationTokens, totalCacheCreationTokens) || other.totalCacheCreationTokens == totalCacheCreationTokens)&&(identical(other.totalCacheReadTokens, totalCacheReadTokens) || other.totalCacheReadTokens == totalCacheReadTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.totalActualCost, totalActualCost) || other.totalActualCost == totalActualCost)&&(identical(other.totalAccountCost, totalAccountCost) || other.totalAccountCost == totalAccountCost)&&(identical(other.todayRequests, todayRequests) || other.todayRequests == todayRequests)&&(identical(other.todayInputTokens, todayInputTokens) || other.todayInputTokens == todayInputTokens)&&(identical(other.todayOutputTokens, todayOutputTokens) || other.todayOutputTokens == todayOutputTokens)&&(identical(other.todayCacheCreationTokens, todayCacheCreationTokens) || other.todayCacheCreationTokens == todayCacheCreationTokens)&&(identical(other.todayCacheReadTokens, todayCacheReadTokens) || other.todayCacheReadTokens == todayCacheReadTokens)&&(identical(other.todayTokens, todayTokens) || other.todayTokens == todayTokens)&&(identical(other.todayCost, todayCost) || other.todayCost == todayCost)&&(identical(other.todayActualCost, todayActualCost) || other.todayActualCost == todayActualCost)&&(identical(other.todayAccountCost, todayAccountCost) || other.todayAccountCost == todayAccountCost)&&(identical(other.averageDurationMs, averageDurationMs) || other.averageDurationMs == averageDurationMs)&&(identical(other.rpm, rpm) || other.rpm == rpm)&&(identical(other.tpm, tpm) || other.tpm == tpm)&&(identical(other.uptime, uptime) || other.uptime == uptime));
}


@override
int get hashCode => Object.hashAll([runtimeType,totalUsers,todayNewUsers,activeUsers,hourlyActiveUsers,statsUpdatedAt,statsStale,totalApiKeys,activeApiKeys,totalAccounts,normalAccounts,errorAccounts,rateLimitAccounts,overloadAccounts,totalRequests,totalInputTokens,totalOutputTokens,totalCacheCreationTokens,totalCacheReadTokens,totalTokens,totalCost,totalActualCost,totalAccountCost,todayRequests,todayInputTokens,todayOutputTokens,todayCacheCreationTokens,todayCacheReadTokens,todayTokens,todayCost,todayActualCost,todayAccountCost,averageDurationMs,rpm,tpm,uptime]);

@override
String toString() {
  return 'Sub2ApiAdminDashboardSnapshotStats(totalUsers: $totalUsers, todayNewUsers: $todayNewUsers, activeUsers: $activeUsers, hourlyActiveUsers: $hourlyActiveUsers, statsUpdatedAt: $statsUpdatedAt, statsStale: $statsStale, totalApiKeys: $totalApiKeys, activeApiKeys: $activeApiKeys, totalAccounts: $totalAccounts, normalAccounts: $normalAccounts, errorAccounts: $errorAccounts, rateLimitAccounts: $rateLimitAccounts, overloadAccounts: $overloadAccounts, totalRequests: $totalRequests, totalInputTokens: $totalInputTokens, totalOutputTokens: $totalOutputTokens, totalCacheCreationTokens: $totalCacheCreationTokens, totalCacheReadTokens: $totalCacheReadTokens, totalTokens: $totalTokens, totalCost: $totalCost, totalActualCost: $totalActualCost, totalAccountCost: $totalAccountCost, todayRequests: $todayRequests, todayInputTokens: $todayInputTokens, todayOutputTokens: $todayOutputTokens, todayCacheCreationTokens: $todayCacheCreationTokens, todayCacheReadTokens: $todayCacheReadTokens, todayTokens: $todayTokens, todayCost: $todayCost, todayActualCost: $todayActualCost, todayAccountCost: $todayAccountCost, averageDurationMs: $averageDurationMs, rpm: $rpm, tpm: $tpm, uptime: $uptime)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminDashboardSnapshotStatsCopyWith<$Res> implements $Sub2ApiAdminDashboardSnapshotStatsCopyWith<$Res> {
  factory _$Sub2ApiAdminDashboardSnapshotStatsCopyWith(_Sub2ApiAdminDashboardSnapshotStats value, $Res Function(_Sub2ApiAdminDashboardSnapshotStats) _then) = __$Sub2ApiAdminDashboardSnapshotStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalUsers, int todayNewUsers, int activeUsers, int hourlyActiveUsers, DateTime statsUpdatedAt, bool statsStale, int totalApiKeys, int activeApiKeys, int totalAccounts, int normalAccounts, int errorAccounts, int rateLimitAccounts, int overloadAccounts, int totalRequests, int totalInputTokens, int totalOutputTokens, int totalCacheCreationTokens, int totalCacheReadTokens, int totalTokens, Sub2ApiDecimal totalCost, Sub2ApiDecimal totalActualCost, Sub2ApiDecimal totalAccountCost, int todayRequests, int todayInputTokens, int todayOutputTokens, int todayCacheCreationTokens, int todayCacheReadTokens, int todayTokens, Sub2ApiDecimal todayCost, Sub2ApiDecimal todayActualCost, Sub2ApiDecimal todayAccountCost, Sub2ApiDecimal averageDurationMs, int rpm, int tpm, int uptime
});




}
/// @nodoc
class __$Sub2ApiAdminDashboardSnapshotStatsCopyWithImpl<$Res>
    implements _$Sub2ApiAdminDashboardSnapshotStatsCopyWith<$Res> {
  __$Sub2ApiAdminDashboardSnapshotStatsCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminDashboardSnapshotStats _self;
  final $Res Function(_Sub2ApiAdminDashboardSnapshotStats) _then;

/// Create a copy of Sub2ApiAdminDashboardSnapshotStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalUsers = null,Object? todayNewUsers = null,Object? activeUsers = null,Object? hourlyActiveUsers = null,Object? statsUpdatedAt = null,Object? statsStale = null,Object? totalApiKeys = null,Object? activeApiKeys = null,Object? totalAccounts = null,Object? normalAccounts = null,Object? errorAccounts = null,Object? rateLimitAccounts = null,Object? overloadAccounts = null,Object? totalRequests = null,Object? totalInputTokens = null,Object? totalOutputTokens = null,Object? totalCacheCreationTokens = null,Object? totalCacheReadTokens = null,Object? totalTokens = null,Object? totalCost = null,Object? totalActualCost = null,Object? totalAccountCost = null,Object? todayRequests = null,Object? todayInputTokens = null,Object? todayOutputTokens = null,Object? todayCacheCreationTokens = null,Object? todayCacheReadTokens = null,Object? todayTokens = null,Object? todayCost = null,Object? todayActualCost = null,Object? todayAccountCost = null,Object? averageDurationMs = null,Object? rpm = null,Object? tpm = null,Object? uptime = null,}) {
  return _then(_Sub2ApiAdminDashboardSnapshotStats(
totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,todayNewUsers: null == todayNewUsers ? _self.todayNewUsers : todayNewUsers // ignore: cast_nullable_to_non_nullable
as int,activeUsers: null == activeUsers ? _self.activeUsers : activeUsers // ignore: cast_nullable_to_non_nullable
as int,hourlyActiveUsers: null == hourlyActiveUsers ? _self.hourlyActiveUsers : hourlyActiveUsers // ignore: cast_nullable_to_non_nullable
as int,statsUpdatedAt: null == statsUpdatedAt ? _self.statsUpdatedAt : statsUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,statsStale: null == statsStale ? _self.statsStale : statsStale // ignore: cast_nullable_to_non_nullable
as bool,totalApiKeys: null == totalApiKeys ? _self.totalApiKeys : totalApiKeys // ignore: cast_nullable_to_non_nullable
as int,activeApiKeys: null == activeApiKeys ? _self.activeApiKeys : activeApiKeys // ignore: cast_nullable_to_non_nullable
as int,totalAccounts: null == totalAccounts ? _self.totalAccounts : totalAccounts // ignore: cast_nullable_to_non_nullable
as int,normalAccounts: null == normalAccounts ? _self.normalAccounts : normalAccounts // ignore: cast_nullable_to_non_nullable
as int,errorAccounts: null == errorAccounts ? _self.errorAccounts : errorAccounts // ignore: cast_nullable_to_non_nullable
as int,rateLimitAccounts: null == rateLimitAccounts ? _self.rateLimitAccounts : rateLimitAccounts // ignore: cast_nullable_to_non_nullable
as int,overloadAccounts: null == overloadAccounts ? _self.overloadAccounts : overloadAccounts // ignore: cast_nullable_to_non_nullable
as int,totalRequests: null == totalRequests ? _self.totalRequests : totalRequests // ignore: cast_nullable_to_non_nullable
as int,totalInputTokens: null == totalInputTokens ? _self.totalInputTokens : totalInputTokens // ignore: cast_nullable_to_non_nullable
as int,totalOutputTokens: null == totalOutputTokens ? _self.totalOutputTokens : totalOutputTokens // ignore: cast_nullable_to_non_nullable
as int,totalCacheCreationTokens: null == totalCacheCreationTokens ? _self.totalCacheCreationTokens : totalCacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,totalCacheReadTokens: null == totalCacheReadTokens ? _self.totalCacheReadTokens : totalCacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,totalCost: null == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalActualCost: null == totalActualCost ? _self.totalActualCost : totalActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalAccountCost: null == totalAccountCost ? _self.totalAccountCost : totalAccountCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,todayRequests: null == todayRequests ? _self.todayRequests : todayRequests // ignore: cast_nullable_to_non_nullable
as int,todayInputTokens: null == todayInputTokens ? _self.todayInputTokens : todayInputTokens // ignore: cast_nullable_to_non_nullable
as int,todayOutputTokens: null == todayOutputTokens ? _self.todayOutputTokens : todayOutputTokens // ignore: cast_nullable_to_non_nullable
as int,todayCacheCreationTokens: null == todayCacheCreationTokens ? _self.todayCacheCreationTokens : todayCacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,todayCacheReadTokens: null == todayCacheReadTokens ? _self.todayCacheReadTokens : todayCacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,todayTokens: null == todayTokens ? _self.todayTokens : todayTokens // ignore: cast_nullable_to_non_nullable
as int,todayCost: null == todayCost ? _self.todayCost : todayCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,todayActualCost: null == todayActualCost ? _self.todayActualCost : todayActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,todayAccountCost: null == todayAccountCost ? _self.todayAccountCost : todayAccountCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,averageDurationMs: null == averageDurationMs ? _self.averageDurationMs : averageDurationMs // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,rpm: null == rpm ? _self.rpm : rpm // ignore: cast_nullable_to_non_nullable
as int,tpm: null == tpm ? _self.tpm : tpm // ignore: cast_nullable_to_non_nullable
as int,uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminDashboardSnapshot {

 DateTime get generatedAt; DateTime get startDate; DateTime get endDate; Sub2ApiAdminUsageGranularity get granularity; Sub2ApiAdminDashboardSnapshotStats? get stats; List<Sub2ApiAdminDashboardTrendPoint>? get trend; List<Sub2ApiAdminDashboardModelStats>? get models; List<Sub2ApiAdminDashboardGroupStats>? get groups; List<Sub2ApiAdminUserUsageTrendPoint>? get usersTrend;
/// Create a copy of Sub2ApiAdminDashboardSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardSnapshotCopyWith<Sub2ApiAdminDashboardSnapshot> get copyWith => _$Sub2ApiAdminDashboardSnapshotCopyWithImpl<Sub2ApiAdminDashboardSnapshot>(this as Sub2ApiAdminDashboardSnapshot, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminDashboardSnapshot&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other.trend, trend)&&const DeepCollectionEquality().equals(other.models, models)&&const DeepCollectionEquality().equals(other.groups, groups)&&const DeepCollectionEquality().equals(other.usersTrend, usersTrend));
}


@override
int get hashCode => Object.hash(runtimeType,generatedAt,startDate,endDate,granularity,stats,const DeepCollectionEquality().hash(trend),const DeepCollectionEquality().hash(models),const DeepCollectionEquality().hash(groups),const DeepCollectionEquality().hash(usersTrend));

@override
String toString() {
  return 'Sub2ApiAdminDashboardSnapshot(generatedAt: $generatedAt, startDate: $startDate, endDate: $endDate, granularity: $granularity, stats: $stats, trend: $trend, models: $models, groups: $groups, usersTrend: $usersTrend)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminDashboardSnapshotCopyWith<$Res>  {
  factory $Sub2ApiAdminDashboardSnapshotCopyWith(Sub2ApiAdminDashboardSnapshot value, $Res Function(Sub2ApiAdminDashboardSnapshot) _then) = _$Sub2ApiAdminDashboardSnapshotCopyWithImpl;
@useResult
$Res call({
 DateTime generatedAt, DateTime startDate, DateTime endDate, Sub2ApiAdminUsageGranularity granularity, Sub2ApiAdminDashboardSnapshotStats? stats, List<Sub2ApiAdminDashboardTrendPoint>? trend, List<Sub2ApiAdminDashboardModelStats>? models, List<Sub2ApiAdminDashboardGroupStats>? groups, List<Sub2ApiAdminUserUsageTrendPoint>? usersTrend
});


$Sub2ApiAdminDashboardSnapshotStatsCopyWith<$Res>? get stats;

}
/// @nodoc
class _$Sub2ApiAdminDashboardSnapshotCopyWithImpl<$Res>
    implements $Sub2ApiAdminDashboardSnapshotCopyWith<$Res> {
  _$Sub2ApiAdminDashboardSnapshotCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminDashboardSnapshot _self;
  final $Res Function(Sub2ApiAdminDashboardSnapshot) _then;

/// Create a copy of Sub2ApiAdminDashboardSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? generatedAt = null,Object? startDate = null,Object? endDate = null,Object? granularity = null,Object? stats = freezed,Object? trend = freezed,Object? models = freezed,Object? groups = freezed,Object? usersTrend = freezed,}) {
  return _then(_self.copyWith(
generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageGranularity,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminDashboardSnapshotStats?,trend: freezed == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminDashboardTrendPoint>?,models: freezed == models ? _self.models : models // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminDashboardModelStats>?,groups: freezed == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminDashboardGroupStats>?,usersTrend: freezed == usersTrend ? _self.usersTrend : usersTrend // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminUserUsageTrendPoint>?,
  ));
}
/// Create a copy of Sub2ApiAdminDashboardSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardSnapshotStatsCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $Sub2ApiAdminDashboardSnapshotStatsCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sub2ApiAdminDashboardSnapshot].
extension Sub2ApiAdminDashboardSnapshotPatterns on Sub2ApiAdminDashboardSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshot() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminDashboardSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshot():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminDashboardSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshot() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime generatedAt,  DateTime startDate,  DateTime endDate,  Sub2ApiAdminUsageGranularity granularity,  Sub2ApiAdminDashboardSnapshotStats? stats,  List<Sub2ApiAdminDashboardTrendPoint>? trend,  List<Sub2ApiAdminDashboardModelStats>? models,  List<Sub2ApiAdminDashboardGroupStats>? groups,  List<Sub2ApiAdminUserUsageTrendPoint>? usersTrend)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshot() when $default != null:
return $default(_that.generatedAt,_that.startDate,_that.endDate,_that.granularity,_that.stats,_that.trend,_that.models,_that.groups,_that.usersTrend);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime generatedAt,  DateTime startDate,  DateTime endDate,  Sub2ApiAdminUsageGranularity granularity,  Sub2ApiAdminDashboardSnapshotStats? stats,  List<Sub2ApiAdminDashboardTrendPoint>? trend,  List<Sub2ApiAdminDashboardModelStats>? models,  List<Sub2ApiAdminDashboardGroupStats>? groups,  List<Sub2ApiAdminUserUsageTrendPoint>? usersTrend)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshot():
return $default(_that.generatedAt,_that.startDate,_that.endDate,_that.granularity,_that.stats,_that.trend,_that.models,_that.groups,_that.usersTrend);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime generatedAt,  DateTime startDate,  DateTime endDate,  Sub2ApiAdminUsageGranularity granularity,  Sub2ApiAdminDashboardSnapshotStats? stats,  List<Sub2ApiAdminDashboardTrendPoint>? trend,  List<Sub2ApiAdminDashboardModelStats>? models,  List<Sub2ApiAdminDashboardGroupStats>? groups,  List<Sub2ApiAdminUserUsageTrendPoint>? usersTrend)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminDashboardSnapshot() when $default != null:
return $default(_that.generatedAt,_that.startDate,_that.endDate,_that.granularity,_that.stats,_that.trend,_that.models,_that.groups,_that.usersTrend);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminDashboardSnapshot implements Sub2ApiAdminDashboardSnapshot {
  const _Sub2ApiAdminDashboardSnapshot({required this.generatedAt, required this.startDate, required this.endDate, required this.granularity, this.stats, final  List<Sub2ApiAdminDashboardTrendPoint>? trend, final  List<Sub2ApiAdminDashboardModelStats>? models, final  List<Sub2ApiAdminDashboardGroupStats>? groups, final  List<Sub2ApiAdminUserUsageTrendPoint>? usersTrend}): _trend = trend,_models = models,_groups = groups,_usersTrend = usersTrend;


@override final  DateTime generatedAt;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  Sub2ApiAdminUsageGranularity granularity;
@override final  Sub2ApiAdminDashboardSnapshotStats? stats;
 final  List<Sub2ApiAdminDashboardTrendPoint>? _trend;
@override List<Sub2ApiAdminDashboardTrendPoint>? get trend {
  final value = _trend;
  if (value == null) return null;
  if (_trend is EqualUnmodifiableListView) return _trend;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Sub2ApiAdminDashboardModelStats>? _models;
@override List<Sub2ApiAdminDashboardModelStats>? get models {
  final value = _models;
  if (value == null) return null;
  if (_models is EqualUnmodifiableListView) return _models;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Sub2ApiAdminDashboardGroupStats>? _groups;
@override List<Sub2ApiAdminDashboardGroupStats>? get groups {
  final value = _groups;
  if (value == null) return null;
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Sub2ApiAdminUserUsageTrendPoint>? _usersTrend;
@override List<Sub2ApiAdminUserUsageTrendPoint>? get usersTrend {
  final value = _usersTrend;
  if (value == null) return null;
  if (_usersTrend is EqualUnmodifiableListView) return _usersTrend;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Sub2ApiAdminDashboardSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminDashboardSnapshotCopyWith<_Sub2ApiAdminDashboardSnapshot> get copyWith => __$Sub2ApiAdminDashboardSnapshotCopyWithImpl<_Sub2ApiAdminDashboardSnapshot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminDashboardSnapshot&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other._trend, _trend)&&const DeepCollectionEquality().equals(other._models, _models)&&const DeepCollectionEquality().equals(other._groups, _groups)&&const DeepCollectionEquality().equals(other._usersTrend, _usersTrend));
}


@override
int get hashCode => Object.hash(runtimeType,generatedAt,startDate,endDate,granularity,stats,const DeepCollectionEquality().hash(_trend),const DeepCollectionEquality().hash(_models),const DeepCollectionEquality().hash(_groups),const DeepCollectionEquality().hash(_usersTrend));

@override
String toString() {
  return 'Sub2ApiAdminDashboardSnapshot(generatedAt: $generatedAt, startDate: $startDate, endDate: $endDate, granularity: $granularity, stats: $stats, trend: $trend, models: $models, groups: $groups, usersTrend: $usersTrend)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminDashboardSnapshotCopyWith<$Res> implements $Sub2ApiAdminDashboardSnapshotCopyWith<$Res> {
  factory _$Sub2ApiAdminDashboardSnapshotCopyWith(_Sub2ApiAdminDashboardSnapshot value, $Res Function(_Sub2ApiAdminDashboardSnapshot) _then) = __$Sub2ApiAdminDashboardSnapshotCopyWithImpl;
@override @useResult
$Res call({
 DateTime generatedAt, DateTime startDate, DateTime endDate, Sub2ApiAdminUsageGranularity granularity, Sub2ApiAdminDashboardSnapshotStats? stats, List<Sub2ApiAdminDashboardTrendPoint>? trend, List<Sub2ApiAdminDashboardModelStats>? models, List<Sub2ApiAdminDashboardGroupStats>? groups, List<Sub2ApiAdminUserUsageTrendPoint>? usersTrend
});


@override $Sub2ApiAdminDashboardSnapshotStatsCopyWith<$Res>? get stats;

}
/// @nodoc
class __$Sub2ApiAdminDashboardSnapshotCopyWithImpl<$Res>
    implements _$Sub2ApiAdminDashboardSnapshotCopyWith<$Res> {
  __$Sub2ApiAdminDashboardSnapshotCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminDashboardSnapshot _self;
  final $Res Function(_Sub2ApiAdminDashboardSnapshot) _then;

/// Create a copy of Sub2ApiAdminDashboardSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? generatedAt = null,Object? startDate = null,Object? endDate = null,Object? granularity = null,Object? stats = freezed,Object? trend = freezed,Object? models = freezed,Object? groups = freezed,Object? usersTrend = freezed,}) {
  return _then(_Sub2ApiAdminDashboardSnapshot(
generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminUsageGranularity,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminDashboardSnapshotStats?,trend: freezed == trend ? _self._trend : trend // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminDashboardTrendPoint>?,models: freezed == models ? _self._models : models // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminDashboardModelStats>?,groups: freezed == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminDashboardGroupStats>?,usersTrend: freezed == usersTrend ? _self._usersTrend : usersTrend // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminUserUsageTrendPoint>?,
  ));
}

/// Create a copy of Sub2ApiAdminDashboardSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiAdminDashboardSnapshotStatsCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $Sub2ApiAdminDashboardSnapshotStatsCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}

/// @nodoc
mixin _$Sub2ApiAdminAggregationBackfillResult {

 String get status;
/// Create a copy of Sub2ApiAdminAggregationBackfillResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminAggregationBackfillResultCopyWith<Sub2ApiAdminAggregationBackfillResult> get copyWith => _$Sub2ApiAdminAggregationBackfillResultCopyWithImpl<Sub2ApiAdminAggregationBackfillResult>(this as Sub2ApiAdminAggregationBackfillResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminAggregationBackfillResult&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'Sub2ApiAdminAggregationBackfillResult(status: $status)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminAggregationBackfillResultCopyWith<$Res>  {
  factory $Sub2ApiAdminAggregationBackfillResultCopyWith(Sub2ApiAdminAggregationBackfillResult value, $Res Function(Sub2ApiAdminAggregationBackfillResult) _then) = _$Sub2ApiAdminAggregationBackfillResultCopyWithImpl;
@useResult
$Res call({
 String status
});




}
/// @nodoc
class _$Sub2ApiAdminAggregationBackfillResultCopyWithImpl<$Res>
    implements $Sub2ApiAdminAggregationBackfillResultCopyWith<$Res> {
  _$Sub2ApiAdminAggregationBackfillResultCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminAggregationBackfillResult _self;
  final $Res Function(Sub2ApiAdminAggregationBackfillResult) _then;

/// Create a copy of Sub2ApiAdminAggregationBackfillResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminAggregationBackfillResult].
extension Sub2ApiAdminAggregationBackfillResultPatterns on Sub2ApiAdminAggregationBackfillResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminAggregationBackfillResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminAggregationBackfillResult() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminAggregationBackfillResult value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminAggregationBackfillResult():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminAggregationBackfillResult value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminAggregationBackfillResult() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminAggregationBackfillResult() when $default != null:
return $default(_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminAggregationBackfillResult():
return $default(_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminAggregationBackfillResult() when $default != null:
return $default(_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminAggregationBackfillResult implements Sub2ApiAdminAggregationBackfillResult {
  const _Sub2ApiAdminAggregationBackfillResult({required this.status});


@override final  String status;

/// Create a copy of Sub2ApiAdminAggregationBackfillResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminAggregationBackfillResultCopyWith<_Sub2ApiAdminAggregationBackfillResult> get copyWith => __$Sub2ApiAdminAggregationBackfillResultCopyWithImpl<_Sub2ApiAdminAggregationBackfillResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminAggregationBackfillResult&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'Sub2ApiAdminAggregationBackfillResult(status: $status)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminAggregationBackfillResultCopyWith<$Res> implements $Sub2ApiAdminAggregationBackfillResultCopyWith<$Res> {
  factory _$Sub2ApiAdminAggregationBackfillResultCopyWith(_Sub2ApiAdminAggregationBackfillResult value, $Res Function(_Sub2ApiAdminAggregationBackfillResult) _then) = __$Sub2ApiAdminAggregationBackfillResultCopyWithImpl;
@override @useResult
$Res call({
 String status
});




}
/// @nodoc
class __$Sub2ApiAdminAggregationBackfillResultCopyWithImpl<$Res>
    implements _$Sub2ApiAdminAggregationBackfillResultCopyWith<$Res> {
  __$Sub2ApiAdminAggregationBackfillResultCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminAggregationBackfillResult _self;
  final $Res Function(_Sub2ApiAdminAggregationBackfillResult) _then;

/// Create a copy of Sub2ApiAdminAggregationBackfillResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_Sub2ApiAdminAggregationBackfillResult(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
