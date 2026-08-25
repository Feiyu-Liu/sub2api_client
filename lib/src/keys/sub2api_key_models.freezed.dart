// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_key_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sub2ApiKeySummary {

 int get id; int get userId; String get name; String get status; List<String> get ipWhitelist; List<String> get ipBlacklist; Sub2ApiDecimal get quota; Sub2ApiDecimal get quotaUsed; int get currentConcurrency; Sub2ApiKeyUsageWindow get fiveHourWindow; Sub2ApiKeyUsageWindow get oneDayWindow; Sub2ApiKeyUsageWindow get sevenDayWindow; DateTime get createdAt; DateTime get updatedAt; int? get groupId; DateTime? get expiresAt; DateTime? get lastUsedAt; String? get lastUsedIp;
/// Create a copy of Sub2ApiKeySummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiKeySummaryCopyWith<Sub2ApiKeySummary> get copyWith => _$Sub2ApiKeySummaryCopyWithImpl<Sub2ApiKeySummary>(this as Sub2ApiKeySummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiKeySummary&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.ipWhitelist, ipWhitelist)&&const DeepCollectionEquality().equals(other.ipBlacklist, ipBlacklist)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.quotaUsed, quotaUsed) || other.quotaUsed == quotaUsed)&&(identical(other.currentConcurrency, currentConcurrency) || other.currentConcurrency == currentConcurrency)&&(identical(other.fiveHourWindow, fiveHourWindow) || other.fiveHourWindow == fiveHourWindow)&&(identical(other.oneDayWindow, oneDayWindow) || other.oneDayWindow == oneDayWindow)&&(identical(other.sevenDayWindow, sevenDayWindow) || other.sevenDayWindow == sevenDayWindow)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt)&&(identical(other.lastUsedIp, lastUsedIp) || other.lastUsedIp == lastUsedIp));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,name,status,const DeepCollectionEquality().hash(ipWhitelist),const DeepCollectionEquality().hash(ipBlacklist),quota,quotaUsed,currentConcurrency,fiveHourWindow,oneDayWindow,sevenDayWindow,createdAt,updatedAt,groupId,expiresAt,lastUsedAt,lastUsedIp);

@override
String toString() {
  return 'Sub2ApiKeySummary(id: $id, userId: $userId, name: $name, status: $status, ipWhitelist: $ipWhitelist, ipBlacklist: $ipBlacklist, quota: $quota, quotaUsed: $quotaUsed, currentConcurrency: $currentConcurrency, fiveHourWindow: $fiveHourWindow, oneDayWindow: $oneDayWindow, sevenDayWindow: $sevenDayWindow, createdAt: $createdAt, updatedAt: $updatedAt, groupId: $groupId, expiresAt: $expiresAt, lastUsedAt: $lastUsedAt, lastUsedIp: $lastUsedIp)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiKeySummaryCopyWith<$Res>  {
  factory $Sub2ApiKeySummaryCopyWith(Sub2ApiKeySummary value, $Res Function(Sub2ApiKeySummary) _then) = _$Sub2ApiKeySummaryCopyWithImpl;
@useResult
$Res call({
 int id, int userId, String name, String status, List<String> ipWhitelist, List<String> ipBlacklist, Sub2ApiDecimal quota, Sub2ApiDecimal quotaUsed, int currentConcurrency, Sub2ApiKeyUsageWindow fiveHourWindow, Sub2ApiKeyUsageWindow oneDayWindow, Sub2ApiKeyUsageWindow sevenDayWindow, DateTime createdAt, DateTime updatedAt, int? groupId, DateTime? expiresAt, DateTime? lastUsedAt, String? lastUsedIp
});


$Sub2ApiKeyUsageWindowCopyWith<$Res> get fiveHourWindow;$Sub2ApiKeyUsageWindowCopyWith<$Res> get oneDayWindow;$Sub2ApiKeyUsageWindowCopyWith<$Res> get sevenDayWindow;

}
/// @nodoc
class _$Sub2ApiKeySummaryCopyWithImpl<$Res>
    implements $Sub2ApiKeySummaryCopyWith<$Res> {
  _$Sub2ApiKeySummaryCopyWithImpl(this._self, this._then);

  final Sub2ApiKeySummary _self;
  final $Res Function(Sub2ApiKeySummary) _then;

/// Create a copy of Sub2ApiKeySummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? status = null,Object? ipWhitelist = null,Object? ipBlacklist = null,Object? quota = null,Object? quotaUsed = null,Object? currentConcurrency = null,Object? fiveHourWindow = null,Object? oneDayWindow = null,Object? sevenDayWindow = null,Object? createdAt = null,Object? updatedAt = null,Object? groupId = freezed,Object? expiresAt = freezed,Object? lastUsedAt = freezed,Object? lastUsedIp = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,ipWhitelist: null == ipWhitelist ? _self.ipWhitelist : ipWhitelist // ignore: cast_nullable_to_non_nullable
as List<String>,ipBlacklist: null == ipBlacklist ? _self.ipBlacklist : ipBlacklist // ignore: cast_nullable_to_non_nullable
as List<String>,quota: null == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,quotaUsed: null == quotaUsed ? _self.quotaUsed : quotaUsed // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,currentConcurrency: null == currentConcurrency ? _self.currentConcurrency : currentConcurrency // ignore: cast_nullable_to_non_nullable
as int,fiveHourWindow: null == fiveHourWindow ? _self.fiveHourWindow : fiveHourWindow // ignore: cast_nullable_to_non_nullable
as Sub2ApiKeyUsageWindow,oneDayWindow: null == oneDayWindow ? _self.oneDayWindow : oneDayWindow // ignore: cast_nullable_to_non_nullable
as Sub2ApiKeyUsageWindow,sevenDayWindow: null == sevenDayWindow ? _self.sevenDayWindow : sevenDayWindow // ignore: cast_nullable_to_non_nullable
as Sub2ApiKeyUsageWindow,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUsedIp: freezed == lastUsedIp ? _self.lastUsedIp : lastUsedIp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Sub2ApiKeySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiKeyUsageWindowCopyWith<$Res> get fiveHourWindow {
  
  return $Sub2ApiKeyUsageWindowCopyWith<$Res>(_self.fiveHourWindow, (value) {
    return _then(_self.copyWith(fiveHourWindow: value));
  });
}/// Create a copy of Sub2ApiKeySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiKeyUsageWindowCopyWith<$Res> get oneDayWindow {
  
  return $Sub2ApiKeyUsageWindowCopyWith<$Res>(_self.oneDayWindow, (value) {
    return _then(_self.copyWith(oneDayWindow: value));
  });
}/// Create a copy of Sub2ApiKeySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiKeyUsageWindowCopyWith<$Res> get sevenDayWindow {
  
  return $Sub2ApiKeyUsageWindowCopyWith<$Res>(_self.sevenDayWindow, (value) {
    return _then(_self.copyWith(sevenDayWindow: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sub2ApiKeySummary].
extension Sub2ApiKeySummaryPatterns on Sub2ApiKeySummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiKeySummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiKeySummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiKeySummary value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiKeySummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiKeySummary value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiKeySummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userId,  String name,  String status,  List<String> ipWhitelist,  List<String> ipBlacklist,  Sub2ApiDecimal quota,  Sub2ApiDecimal quotaUsed,  int currentConcurrency,  Sub2ApiKeyUsageWindow fiveHourWindow,  Sub2ApiKeyUsageWindow oneDayWindow,  Sub2ApiKeyUsageWindow sevenDayWindow,  DateTime createdAt,  DateTime updatedAt,  int? groupId,  DateTime? expiresAt,  DateTime? lastUsedAt,  String? lastUsedIp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiKeySummary() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.status,_that.ipWhitelist,_that.ipBlacklist,_that.quota,_that.quotaUsed,_that.currentConcurrency,_that.fiveHourWindow,_that.oneDayWindow,_that.sevenDayWindow,_that.createdAt,_that.updatedAt,_that.groupId,_that.expiresAt,_that.lastUsedAt,_that.lastUsedIp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userId,  String name,  String status,  List<String> ipWhitelist,  List<String> ipBlacklist,  Sub2ApiDecimal quota,  Sub2ApiDecimal quotaUsed,  int currentConcurrency,  Sub2ApiKeyUsageWindow fiveHourWindow,  Sub2ApiKeyUsageWindow oneDayWindow,  Sub2ApiKeyUsageWindow sevenDayWindow,  DateTime createdAt,  DateTime updatedAt,  int? groupId,  DateTime? expiresAt,  DateTime? lastUsedAt,  String? lastUsedIp)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiKeySummary():
return $default(_that.id,_that.userId,_that.name,_that.status,_that.ipWhitelist,_that.ipBlacklist,_that.quota,_that.quotaUsed,_that.currentConcurrency,_that.fiveHourWindow,_that.oneDayWindow,_that.sevenDayWindow,_that.createdAt,_that.updatedAt,_that.groupId,_that.expiresAt,_that.lastUsedAt,_that.lastUsedIp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userId,  String name,  String status,  List<String> ipWhitelist,  List<String> ipBlacklist,  Sub2ApiDecimal quota,  Sub2ApiDecimal quotaUsed,  int currentConcurrency,  Sub2ApiKeyUsageWindow fiveHourWindow,  Sub2ApiKeyUsageWindow oneDayWindow,  Sub2ApiKeyUsageWindow sevenDayWindow,  DateTime createdAt,  DateTime updatedAt,  int? groupId,  DateTime? expiresAt,  DateTime? lastUsedAt,  String? lastUsedIp)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiKeySummary() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.status,_that.ipWhitelist,_that.ipBlacklist,_that.quota,_that.quotaUsed,_that.currentConcurrency,_that.fiveHourWindow,_that.oneDayWindow,_that.sevenDayWindow,_that.createdAt,_that.updatedAt,_that.groupId,_that.expiresAt,_that.lastUsedAt,_that.lastUsedIp);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiKeySummary implements Sub2ApiKeySummary {
  const _Sub2ApiKeySummary({required this.id, required this.userId, required this.name, required this.status, required final  List<String> ipWhitelist, required final  List<String> ipBlacklist, required this.quota, required this.quotaUsed, required this.currentConcurrency, required this.fiveHourWindow, required this.oneDayWindow, required this.sevenDayWindow, required this.createdAt, required this.updatedAt, this.groupId, this.expiresAt, this.lastUsedAt, this.lastUsedIp}): _ipWhitelist = ipWhitelist,_ipBlacklist = ipBlacklist;
  

@override final  int id;
@override final  int userId;
@override final  String name;
@override final  String status;
 final  List<String> _ipWhitelist;
@override List<String> get ipWhitelist {
  if (_ipWhitelist is EqualUnmodifiableListView) return _ipWhitelist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ipWhitelist);
}

 final  List<String> _ipBlacklist;
@override List<String> get ipBlacklist {
  if (_ipBlacklist is EqualUnmodifiableListView) return _ipBlacklist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ipBlacklist);
}

@override final  Sub2ApiDecimal quota;
@override final  Sub2ApiDecimal quotaUsed;
@override final  int currentConcurrency;
@override final  Sub2ApiKeyUsageWindow fiveHourWindow;
@override final  Sub2ApiKeyUsageWindow oneDayWindow;
@override final  Sub2ApiKeyUsageWindow sevenDayWindow;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int? groupId;
@override final  DateTime? expiresAt;
@override final  DateTime? lastUsedAt;
@override final  String? lastUsedIp;

/// Create a copy of Sub2ApiKeySummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiKeySummaryCopyWith<_Sub2ApiKeySummary> get copyWith => __$Sub2ApiKeySummaryCopyWithImpl<_Sub2ApiKeySummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiKeySummary&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._ipWhitelist, _ipWhitelist)&&const DeepCollectionEquality().equals(other._ipBlacklist, _ipBlacklist)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.quotaUsed, quotaUsed) || other.quotaUsed == quotaUsed)&&(identical(other.currentConcurrency, currentConcurrency) || other.currentConcurrency == currentConcurrency)&&(identical(other.fiveHourWindow, fiveHourWindow) || other.fiveHourWindow == fiveHourWindow)&&(identical(other.oneDayWindow, oneDayWindow) || other.oneDayWindow == oneDayWindow)&&(identical(other.sevenDayWindow, sevenDayWindow) || other.sevenDayWindow == sevenDayWindow)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt)&&(identical(other.lastUsedIp, lastUsedIp) || other.lastUsedIp == lastUsedIp));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,name,status,const DeepCollectionEquality().hash(_ipWhitelist),const DeepCollectionEquality().hash(_ipBlacklist),quota,quotaUsed,currentConcurrency,fiveHourWindow,oneDayWindow,sevenDayWindow,createdAt,updatedAt,groupId,expiresAt,lastUsedAt,lastUsedIp);

@override
String toString() {
  return 'Sub2ApiKeySummary(id: $id, userId: $userId, name: $name, status: $status, ipWhitelist: $ipWhitelist, ipBlacklist: $ipBlacklist, quota: $quota, quotaUsed: $quotaUsed, currentConcurrency: $currentConcurrency, fiveHourWindow: $fiveHourWindow, oneDayWindow: $oneDayWindow, sevenDayWindow: $sevenDayWindow, createdAt: $createdAt, updatedAt: $updatedAt, groupId: $groupId, expiresAt: $expiresAt, lastUsedAt: $lastUsedAt, lastUsedIp: $lastUsedIp)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiKeySummaryCopyWith<$Res> implements $Sub2ApiKeySummaryCopyWith<$Res> {
  factory _$Sub2ApiKeySummaryCopyWith(_Sub2ApiKeySummary value, $Res Function(_Sub2ApiKeySummary) _then) = __$Sub2ApiKeySummaryCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, String name, String status, List<String> ipWhitelist, List<String> ipBlacklist, Sub2ApiDecimal quota, Sub2ApiDecimal quotaUsed, int currentConcurrency, Sub2ApiKeyUsageWindow fiveHourWindow, Sub2ApiKeyUsageWindow oneDayWindow, Sub2ApiKeyUsageWindow sevenDayWindow, DateTime createdAt, DateTime updatedAt, int? groupId, DateTime? expiresAt, DateTime? lastUsedAt, String? lastUsedIp
});


@override $Sub2ApiKeyUsageWindowCopyWith<$Res> get fiveHourWindow;@override $Sub2ApiKeyUsageWindowCopyWith<$Res> get oneDayWindow;@override $Sub2ApiKeyUsageWindowCopyWith<$Res> get sevenDayWindow;

}
/// @nodoc
class __$Sub2ApiKeySummaryCopyWithImpl<$Res>
    implements _$Sub2ApiKeySummaryCopyWith<$Res> {
  __$Sub2ApiKeySummaryCopyWithImpl(this._self, this._then);

  final _Sub2ApiKeySummary _self;
  final $Res Function(_Sub2ApiKeySummary) _then;

/// Create a copy of Sub2ApiKeySummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? status = null,Object? ipWhitelist = null,Object? ipBlacklist = null,Object? quota = null,Object? quotaUsed = null,Object? currentConcurrency = null,Object? fiveHourWindow = null,Object? oneDayWindow = null,Object? sevenDayWindow = null,Object? createdAt = null,Object? updatedAt = null,Object? groupId = freezed,Object? expiresAt = freezed,Object? lastUsedAt = freezed,Object? lastUsedIp = freezed,}) {
  return _then(_Sub2ApiKeySummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,ipWhitelist: null == ipWhitelist ? _self._ipWhitelist : ipWhitelist // ignore: cast_nullable_to_non_nullable
as List<String>,ipBlacklist: null == ipBlacklist ? _self._ipBlacklist : ipBlacklist // ignore: cast_nullable_to_non_nullable
as List<String>,quota: null == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,quotaUsed: null == quotaUsed ? _self.quotaUsed : quotaUsed // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,currentConcurrency: null == currentConcurrency ? _self.currentConcurrency : currentConcurrency // ignore: cast_nullable_to_non_nullable
as int,fiveHourWindow: null == fiveHourWindow ? _self.fiveHourWindow : fiveHourWindow // ignore: cast_nullable_to_non_nullable
as Sub2ApiKeyUsageWindow,oneDayWindow: null == oneDayWindow ? _self.oneDayWindow : oneDayWindow // ignore: cast_nullable_to_non_nullable
as Sub2ApiKeyUsageWindow,sevenDayWindow: null == sevenDayWindow ? _self.sevenDayWindow : sevenDayWindow // ignore: cast_nullable_to_non_nullable
as Sub2ApiKeyUsageWindow,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUsedIp: freezed == lastUsedIp ? _self.lastUsedIp : lastUsedIp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Sub2ApiKeySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiKeyUsageWindowCopyWith<$Res> get fiveHourWindow {
  
  return $Sub2ApiKeyUsageWindowCopyWith<$Res>(_self.fiveHourWindow, (value) {
    return _then(_self.copyWith(fiveHourWindow: value));
  });
}/// Create a copy of Sub2ApiKeySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiKeyUsageWindowCopyWith<$Res> get oneDayWindow {
  
  return $Sub2ApiKeyUsageWindowCopyWith<$Res>(_self.oneDayWindow, (value) {
    return _then(_self.copyWith(oneDayWindow: value));
  });
}/// Create a copy of Sub2ApiKeySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiKeyUsageWindowCopyWith<$Res> get sevenDayWindow {
  
  return $Sub2ApiKeyUsageWindowCopyWith<$Res>(_self.sevenDayWindow, (value) {
    return _then(_self.copyWith(sevenDayWindow: value));
  });
}
}

/// @nodoc
mixin _$Sub2ApiKeyUsageWindow {

 Sub2ApiDecimal get limit; Sub2ApiDecimal get used; DateTime? get startedAt; DateTime? get resetsAt;
/// Create a copy of Sub2ApiKeyUsageWindow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiKeyUsageWindowCopyWith<Sub2ApiKeyUsageWindow> get copyWith => _$Sub2ApiKeyUsageWindowCopyWithImpl<Sub2ApiKeyUsageWindow>(this as Sub2ApiKeyUsageWindow, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiKeyUsageWindow&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.used, used) || other.used == used)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.resetsAt, resetsAt) || other.resetsAt == resetsAt));
}


@override
int get hashCode => Object.hash(runtimeType,limit,used,startedAt,resetsAt);

@override
String toString() {
  return 'Sub2ApiKeyUsageWindow(limit: $limit, used: $used, startedAt: $startedAt, resetsAt: $resetsAt)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiKeyUsageWindowCopyWith<$Res>  {
  factory $Sub2ApiKeyUsageWindowCopyWith(Sub2ApiKeyUsageWindow value, $Res Function(Sub2ApiKeyUsageWindow) _then) = _$Sub2ApiKeyUsageWindowCopyWithImpl;
@useResult
$Res call({
 Sub2ApiDecimal limit, Sub2ApiDecimal used, DateTime? startedAt, DateTime? resetsAt
});




}
/// @nodoc
class _$Sub2ApiKeyUsageWindowCopyWithImpl<$Res>
    implements $Sub2ApiKeyUsageWindowCopyWith<$Res> {
  _$Sub2ApiKeyUsageWindowCopyWithImpl(this._self, this._then);

  final Sub2ApiKeyUsageWindow _self;
  final $Res Function(Sub2ApiKeyUsageWindow) _then;

/// Create a copy of Sub2ApiKeyUsageWindow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? used = null,Object? startedAt = freezed,Object? resetsAt = freezed,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resetsAt: freezed == resetsAt ? _self.resetsAt : resetsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiKeyUsageWindow].
extension Sub2ApiKeyUsageWindowPatterns on Sub2ApiKeyUsageWindow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiKeyUsageWindow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiKeyUsageWindow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiKeyUsageWindow value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiKeyUsageWindow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiKeyUsageWindow value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiKeyUsageWindow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiDecimal limit,  Sub2ApiDecimal used,  DateTime? startedAt,  DateTime? resetsAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiKeyUsageWindow() when $default != null:
return $default(_that.limit,_that.used,_that.startedAt,_that.resetsAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiDecimal limit,  Sub2ApiDecimal used,  DateTime? startedAt,  DateTime? resetsAt)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiKeyUsageWindow():
return $default(_that.limit,_that.used,_that.startedAt,_that.resetsAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiDecimal limit,  Sub2ApiDecimal used,  DateTime? startedAt,  DateTime? resetsAt)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiKeyUsageWindow() when $default != null:
return $default(_that.limit,_that.used,_that.startedAt,_that.resetsAt);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiKeyUsageWindow implements Sub2ApiKeyUsageWindow {
  const _Sub2ApiKeyUsageWindow({required this.limit, required this.used, this.startedAt, this.resetsAt});
  

@override final  Sub2ApiDecimal limit;
@override final  Sub2ApiDecimal used;
@override final  DateTime? startedAt;
@override final  DateTime? resetsAt;

/// Create a copy of Sub2ApiKeyUsageWindow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiKeyUsageWindowCopyWith<_Sub2ApiKeyUsageWindow> get copyWith => __$Sub2ApiKeyUsageWindowCopyWithImpl<_Sub2ApiKeyUsageWindow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiKeyUsageWindow&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.used, used) || other.used == used)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.resetsAt, resetsAt) || other.resetsAt == resetsAt));
}


@override
int get hashCode => Object.hash(runtimeType,limit,used,startedAt,resetsAt);

@override
String toString() {
  return 'Sub2ApiKeyUsageWindow(limit: $limit, used: $used, startedAt: $startedAt, resetsAt: $resetsAt)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiKeyUsageWindowCopyWith<$Res> implements $Sub2ApiKeyUsageWindowCopyWith<$Res> {
  factory _$Sub2ApiKeyUsageWindowCopyWith(_Sub2ApiKeyUsageWindow value, $Res Function(_Sub2ApiKeyUsageWindow) _then) = __$Sub2ApiKeyUsageWindowCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiDecimal limit, Sub2ApiDecimal used, DateTime? startedAt, DateTime? resetsAt
});




}
/// @nodoc
class __$Sub2ApiKeyUsageWindowCopyWithImpl<$Res>
    implements _$Sub2ApiKeyUsageWindowCopyWith<$Res> {
  __$Sub2ApiKeyUsageWindowCopyWithImpl(this._self, this._then);

  final _Sub2ApiKeyUsageWindow _self;
  final $Res Function(_Sub2ApiKeyUsageWindow) _then;

/// Create a copy of Sub2ApiKeyUsageWindow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? used = null,Object? startedAt = freezed,Object? resetsAt = freezed,}) {
  return _then(_Sub2ApiKeyUsageWindow(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resetsAt: freezed == resetsAt ? _self.resetsAt : resetsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiKeyDetails {

 Sub2ApiKeySummary get summary; Sub2ApiApiKeySecret get secret;
/// Create a copy of Sub2ApiKeyDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiKeyDetailsCopyWith<Sub2ApiKeyDetails> get copyWith => _$Sub2ApiKeyDetailsCopyWithImpl<Sub2ApiKeyDetails>(this as Sub2ApiKeyDetails, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiKeyDetails&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.secret, secret) || other.secret == secret));
}


@override
int get hashCode => Object.hash(runtimeType,summary,secret);

@override
String toString() {
  return 'Sub2ApiKeyDetails(summary: $summary, secret: $secret)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiKeyDetailsCopyWith<$Res>  {
  factory $Sub2ApiKeyDetailsCopyWith(Sub2ApiKeyDetails value, $Res Function(Sub2ApiKeyDetails) _then) = _$Sub2ApiKeyDetailsCopyWithImpl;
@useResult
$Res call({
 Sub2ApiKeySummary summary, Sub2ApiApiKeySecret secret
});


$Sub2ApiKeySummaryCopyWith<$Res> get summary;

}
/// @nodoc
class _$Sub2ApiKeyDetailsCopyWithImpl<$Res>
    implements $Sub2ApiKeyDetailsCopyWith<$Res> {
  _$Sub2ApiKeyDetailsCopyWithImpl(this._self, this._then);

  final Sub2ApiKeyDetails _self;
  final $Res Function(Sub2ApiKeyDetails) _then;

/// Create a copy of Sub2ApiKeyDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? secret = null,}) {
  return _then(_self.copyWith(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Sub2ApiKeySummary,secret: null == secret ? _self.secret : secret // ignore: cast_nullable_to_non_nullable
as Sub2ApiApiKeySecret,
  ));
}
/// Create a copy of Sub2ApiKeyDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiKeySummaryCopyWith<$Res> get summary {
  
  return $Sub2ApiKeySummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sub2ApiKeyDetails].
extension Sub2ApiKeyDetailsPatterns on Sub2ApiKeyDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiKeyDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiKeyDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiKeyDetails value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiKeyDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiKeyDetails value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiKeyDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiKeySummary summary,  Sub2ApiApiKeySecret secret)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiKeyDetails() when $default != null:
return $default(_that.summary,_that.secret);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiKeySummary summary,  Sub2ApiApiKeySecret secret)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiKeyDetails():
return $default(_that.summary,_that.secret);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiKeySummary summary,  Sub2ApiApiKeySecret secret)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiKeyDetails() when $default != null:
return $default(_that.summary,_that.secret);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiKeyDetails implements Sub2ApiKeyDetails {
  const _Sub2ApiKeyDetails({required this.summary, required this.secret});
  

@override final  Sub2ApiKeySummary summary;
@override final  Sub2ApiApiKeySecret secret;

/// Create a copy of Sub2ApiKeyDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiKeyDetailsCopyWith<_Sub2ApiKeyDetails> get copyWith => __$Sub2ApiKeyDetailsCopyWithImpl<_Sub2ApiKeyDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiKeyDetails&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.secret, secret) || other.secret == secret));
}


@override
int get hashCode => Object.hash(runtimeType,summary,secret);

@override
String toString() {
  return 'Sub2ApiKeyDetails(summary: $summary, secret: $secret)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiKeyDetailsCopyWith<$Res> implements $Sub2ApiKeyDetailsCopyWith<$Res> {
  factory _$Sub2ApiKeyDetailsCopyWith(_Sub2ApiKeyDetails value, $Res Function(_Sub2ApiKeyDetails) _then) = __$Sub2ApiKeyDetailsCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiKeySummary summary, Sub2ApiApiKeySecret secret
});


@override $Sub2ApiKeySummaryCopyWith<$Res> get summary;

}
/// @nodoc
class __$Sub2ApiKeyDetailsCopyWithImpl<$Res>
    implements _$Sub2ApiKeyDetailsCopyWith<$Res> {
  __$Sub2ApiKeyDetailsCopyWithImpl(this._self, this._then);

  final _Sub2ApiKeyDetails _self;
  final $Res Function(_Sub2ApiKeyDetails) _then;

/// Create a copy of Sub2ApiKeyDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? secret = null,}) {
  return _then(_Sub2ApiKeyDetails(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Sub2ApiKeySummary,secret: null == secret ? _self.secret : secret // ignore: cast_nullable_to_non_nullable
as Sub2ApiApiKeySecret,
  ));
}

/// Create a copy of Sub2ApiKeyDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiKeySummaryCopyWith<$Res> get summary {
  
  return $Sub2ApiKeySummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

/// @nodoc
mixin _$Sub2ApiKeyListRequest {

 int? get page; int? get pageSize; String? get sortBy; String? get sortOrder; String? get search; String? get status; int? get groupId;
/// Create a copy of Sub2ApiKeyListRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiKeyListRequestCopyWith<Sub2ApiKeyListRequest> get copyWith => _$Sub2ApiKeyListRequestCopyWithImpl<Sub2ApiKeyListRequest>(this as Sub2ApiKeyListRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiKeyListRequest&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.search, search) || other.search == search)&&(identical(other.status, status) || other.status == status)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}


@override
int get hashCode => Object.hash(runtimeType,page,pageSize,sortBy,sortOrder,search,status,groupId);

@override
String toString() {
  return 'Sub2ApiKeyListRequest(page: $page, pageSize: $pageSize, sortBy: $sortBy, sortOrder: $sortOrder, search: $search, status: $status, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiKeyListRequestCopyWith<$Res>  {
  factory $Sub2ApiKeyListRequestCopyWith(Sub2ApiKeyListRequest value, $Res Function(Sub2ApiKeyListRequest) _then) = _$Sub2ApiKeyListRequestCopyWithImpl;
@useResult
$Res call({
 int? page, int? pageSize, String? sortBy, String? sortOrder, String? search, String? status, int? groupId
});




}
/// @nodoc
class _$Sub2ApiKeyListRequestCopyWithImpl<$Res>
    implements $Sub2ApiKeyListRequestCopyWith<$Res> {
  _$Sub2ApiKeyListRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiKeyListRequest _self;
  final $Res Function(Sub2ApiKeyListRequest) _then;

/// Create a copy of Sub2ApiKeyListRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = freezed,Object? pageSize = freezed,Object? sortBy = freezed,Object? sortOrder = freezed,Object? search = freezed,Object? status = freezed,Object? groupId = freezed,}) {
  return _then(_self.copyWith(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiKeyListRequest].
extension Sub2ApiKeyListRequestPatterns on Sub2ApiKeyListRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiKeyListRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiKeyListRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiKeyListRequest value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiKeyListRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiKeyListRequest value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiKeyListRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? page,  int? pageSize,  String? sortBy,  String? sortOrder,  String? search,  String? status,  int? groupId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiKeyListRequest() when $default != null:
return $default(_that.page,_that.pageSize,_that.sortBy,_that.sortOrder,_that.search,_that.status,_that.groupId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? page,  int? pageSize,  String? sortBy,  String? sortOrder,  String? search,  String? status,  int? groupId)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiKeyListRequest():
return $default(_that.page,_that.pageSize,_that.sortBy,_that.sortOrder,_that.search,_that.status,_that.groupId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? page,  int? pageSize,  String? sortBy,  String? sortOrder,  String? search,  String? status,  int? groupId)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiKeyListRequest() when $default != null:
return $default(_that.page,_that.pageSize,_that.sortBy,_that.sortOrder,_that.search,_that.status,_that.groupId);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiKeyListRequest implements Sub2ApiKeyListRequest {
  const _Sub2ApiKeyListRequest({this.page, this.pageSize, this.sortBy, this.sortOrder, this.search, this.status, this.groupId});
  

@override final  int? page;
@override final  int? pageSize;
@override final  String? sortBy;
@override final  String? sortOrder;
@override final  String? search;
@override final  String? status;
@override final  int? groupId;

/// Create a copy of Sub2ApiKeyListRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiKeyListRequestCopyWith<_Sub2ApiKeyListRequest> get copyWith => __$Sub2ApiKeyListRequestCopyWithImpl<_Sub2ApiKeyListRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiKeyListRequest&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.search, search) || other.search == search)&&(identical(other.status, status) || other.status == status)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}


@override
int get hashCode => Object.hash(runtimeType,page,pageSize,sortBy,sortOrder,search,status,groupId);

@override
String toString() {
  return 'Sub2ApiKeyListRequest(page: $page, pageSize: $pageSize, sortBy: $sortBy, sortOrder: $sortOrder, search: $search, status: $status, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiKeyListRequestCopyWith<$Res> implements $Sub2ApiKeyListRequestCopyWith<$Res> {
  factory _$Sub2ApiKeyListRequestCopyWith(_Sub2ApiKeyListRequest value, $Res Function(_Sub2ApiKeyListRequest) _then) = __$Sub2ApiKeyListRequestCopyWithImpl;
@override @useResult
$Res call({
 int? page, int? pageSize, String? sortBy, String? sortOrder, String? search, String? status, int? groupId
});




}
/// @nodoc
class __$Sub2ApiKeyListRequestCopyWithImpl<$Res>
    implements _$Sub2ApiKeyListRequestCopyWith<$Res> {
  __$Sub2ApiKeyListRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiKeyListRequest _self;
  final $Res Function(_Sub2ApiKeyListRequest) _then;

/// Create a copy of Sub2ApiKeyListRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = freezed,Object? pageSize = freezed,Object? sortBy = freezed,Object? sortOrder = freezed,Object? search = freezed,Object? status = freezed,Object? groupId = freezed,}) {
  return _then(_Sub2ApiKeyListRequest(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiCreateKeyRequest {

 String get name; String get idempotencyKey; int? get groupId; Sub2ApiApiKeySecret? get customKey; List<String>? get ipWhitelist; List<String>? get ipBlacklist; Sub2ApiDecimal? get quota; int? get expiresInDays; Sub2ApiDecimal? get rateLimit5h; Sub2ApiDecimal? get rateLimit1d; Sub2ApiDecimal? get rateLimit7d;
/// Create a copy of Sub2ApiCreateKeyRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiCreateKeyRequestCopyWith<Sub2ApiCreateKeyRequest> get copyWith => _$Sub2ApiCreateKeyRequestCopyWithImpl<Sub2ApiCreateKeyRequest>(this as Sub2ApiCreateKeyRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiCreateKeyRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.idempotencyKey, idempotencyKey) || other.idempotencyKey == idempotencyKey)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.customKey, customKey) || other.customKey == customKey)&&const DeepCollectionEquality().equals(other.ipWhitelist, ipWhitelist)&&const DeepCollectionEquality().equals(other.ipBlacklist, ipBlacklist)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.expiresInDays, expiresInDays) || other.expiresInDays == expiresInDays)&&(identical(other.rateLimit5h, rateLimit5h) || other.rateLimit5h == rateLimit5h)&&(identical(other.rateLimit1d, rateLimit1d) || other.rateLimit1d == rateLimit1d)&&(identical(other.rateLimit7d, rateLimit7d) || other.rateLimit7d == rateLimit7d));
}


@override
int get hashCode => Object.hash(runtimeType,name,idempotencyKey,groupId,customKey,const DeepCollectionEquality().hash(ipWhitelist),const DeepCollectionEquality().hash(ipBlacklist),quota,expiresInDays,rateLimit5h,rateLimit1d,rateLimit7d);

@override
String toString() {
  return 'Sub2ApiCreateKeyRequest(name: $name, idempotencyKey: $idempotencyKey, groupId: $groupId, customKey: $customKey, ipWhitelist: $ipWhitelist, ipBlacklist: $ipBlacklist, quota: $quota, expiresInDays: $expiresInDays, rateLimit5h: $rateLimit5h, rateLimit1d: $rateLimit1d, rateLimit7d: $rateLimit7d)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiCreateKeyRequestCopyWith<$Res>  {
  factory $Sub2ApiCreateKeyRequestCopyWith(Sub2ApiCreateKeyRequest value, $Res Function(Sub2ApiCreateKeyRequest) _then) = _$Sub2ApiCreateKeyRequestCopyWithImpl;
@useResult
$Res call({
 String name, String idempotencyKey, int? groupId, Sub2ApiApiKeySecret? customKey, List<String>? ipWhitelist, List<String>? ipBlacklist, Sub2ApiDecimal? quota, int? expiresInDays, Sub2ApiDecimal? rateLimit5h, Sub2ApiDecimal? rateLimit1d, Sub2ApiDecimal? rateLimit7d
});




}
/// @nodoc
class _$Sub2ApiCreateKeyRequestCopyWithImpl<$Res>
    implements $Sub2ApiCreateKeyRequestCopyWith<$Res> {
  _$Sub2ApiCreateKeyRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiCreateKeyRequest _self;
  final $Res Function(Sub2ApiCreateKeyRequest) _then;

/// Create a copy of Sub2ApiCreateKeyRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? idempotencyKey = null,Object? groupId = freezed,Object? customKey = freezed,Object? ipWhitelist = freezed,Object? ipBlacklist = freezed,Object? quota = freezed,Object? expiresInDays = freezed,Object? rateLimit5h = freezed,Object? rateLimit1d = freezed,Object? rateLimit7d = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,idempotencyKey: null == idempotencyKey ? _self.idempotencyKey : idempotencyKey // ignore: cast_nullable_to_non_nullable
as String,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,customKey: freezed == customKey ? _self.customKey : customKey // ignore: cast_nullable_to_non_nullable
as Sub2ApiApiKeySecret?,ipWhitelist: freezed == ipWhitelist ? _self.ipWhitelist : ipWhitelist // ignore: cast_nullable_to_non_nullable
as List<String>?,ipBlacklist: freezed == ipBlacklist ? _self.ipBlacklist : ipBlacklist // ignore: cast_nullable_to_non_nullable
as List<String>?,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,expiresInDays: freezed == expiresInDays ? _self.expiresInDays : expiresInDays // ignore: cast_nullable_to_non_nullable
as int?,rateLimit5h: freezed == rateLimit5h ? _self.rateLimit5h : rateLimit5h // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,rateLimit1d: freezed == rateLimit1d ? _self.rateLimit1d : rateLimit1d // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,rateLimit7d: freezed == rateLimit7d ? _self.rateLimit7d : rateLimit7d // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiCreateKeyRequest].
extension Sub2ApiCreateKeyRequestPatterns on Sub2ApiCreateKeyRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiCreateKeyRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiCreateKeyRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiCreateKeyRequest value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiCreateKeyRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiCreateKeyRequest value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiCreateKeyRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String idempotencyKey,  int? groupId,  Sub2ApiApiKeySecret? customKey,  List<String>? ipWhitelist,  List<String>? ipBlacklist,  Sub2ApiDecimal? quota,  int? expiresInDays,  Sub2ApiDecimal? rateLimit5h,  Sub2ApiDecimal? rateLimit1d,  Sub2ApiDecimal? rateLimit7d)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiCreateKeyRequest() when $default != null:
return $default(_that.name,_that.idempotencyKey,_that.groupId,_that.customKey,_that.ipWhitelist,_that.ipBlacklist,_that.quota,_that.expiresInDays,_that.rateLimit5h,_that.rateLimit1d,_that.rateLimit7d);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String idempotencyKey,  int? groupId,  Sub2ApiApiKeySecret? customKey,  List<String>? ipWhitelist,  List<String>? ipBlacklist,  Sub2ApiDecimal? quota,  int? expiresInDays,  Sub2ApiDecimal? rateLimit5h,  Sub2ApiDecimal? rateLimit1d,  Sub2ApiDecimal? rateLimit7d)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiCreateKeyRequest():
return $default(_that.name,_that.idempotencyKey,_that.groupId,_that.customKey,_that.ipWhitelist,_that.ipBlacklist,_that.quota,_that.expiresInDays,_that.rateLimit5h,_that.rateLimit1d,_that.rateLimit7d);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String idempotencyKey,  int? groupId,  Sub2ApiApiKeySecret? customKey,  List<String>? ipWhitelist,  List<String>? ipBlacklist,  Sub2ApiDecimal? quota,  int? expiresInDays,  Sub2ApiDecimal? rateLimit5h,  Sub2ApiDecimal? rateLimit1d,  Sub2ApiDecimal? rateLimit7d)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiCreateKeyRequest() when $default != null:
return $default(_that.name,_that.idempotencyKey,_that.groupId,_that.customKey,_that.ipWhitelist,_that.ipBlacklist,_that.quota,_that.expiresInDays,_that.rateLimit5h,_that.rateLimit1d,_that.rateLimit7d);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiCreateKeyRequest implements Sub2ApiCreateKeyRequest {
  const _Sub2ApiCreateKeyRequest({required this.name, required this.idempotencyKey, this.groupId, this.customKey, final  List<String>? ipWhitelist, final  List<String>? ipBlacklist, this.quota, this.expiresInDays, this.rateLimit5h, this.rateLimit1d, this.rateLimit7d}): _ipWhitelist = ipWhitelist,_ipBlacklist = ipBlacklist;
  

@override final  String name;
@override final  String idempotencyKey;
@override final  int? groupId;
@override final  Sub2ApiApiKeySecret? customKey;
 final  List<String>? _ipWhitelist;
@override List<String>? get ipWhitelist {
  final value = _ipWhitelist;
  if (value == null) return null;
  if (_ipWhitelist is EqualUnmodifiableListView) return _ipWhitelist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _ipBlacklist;
@override List<String>? get ipBlacklist {
  final value = _ipBlacklist;
  if (value == null) return null;
  if (_ipBlacklist is EqualUnmodifiableListView) return _ipBlacklist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Sub2ApiDecimal? quota;
@override final  int? expiresInDays;
@override final  Sub2ApiDecimal? rateLimit5h;
@override final  Sub2ApiDecimal? rateLimit1d;
@override final  Sub2ApiDecimal? rateLimit7d;

/// Create a copy of Sub2ApiCreateKeyRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiCreateKeyRequestCopyWith<_Sub2ApiCreateKeyRequest> get copyWith => __$Sub2ApiCreateKeyRequestCopyWithImpl<_Sub2ApiCreateKeyRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiCreateKeyRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.idempotencyKey, idempotencyKey) || other.idempotencyKey == idempotencyKey)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.customKey, customKey) || other.customKey == customKey)&&const DeepCollectionEquality().equals(other._ipWhitelist, _ipWhitelist)&&const DeepCollectionEquality().equals(other._ipBlacklist, _ipBlacklist)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.expiresInDays, expiresInDays) || other.expiresInDays == expiresInDays)&&(identical(other.rateLimit5h, rateLimit5h) || other.rateLimit5h == rateLimit5h)&&(identical(other.rateLimit1d, rateLimit1d) || other.rateLimit1d == rateLimit1d)&&(identical(other.rateLimit7d, rateLimit7d) || other.rateLimit7d == rateLimit7d));
}


@override
int get hashCode => Object.hash(runtimeType,name,idempotencyKey,groupId,customKey,const DeepCollectionEquality().hash(_ipWhitelist),const DeepCollectionEquality().hash(_ipBlacklist),quota,expiresInDays,rateLimit5h,rateLimit1d,rateLimit7d);

@override
String toString() {
  return 'Sub2ApiCreateKeyRequest(name: $name, idempotencyKey: $idempotencyKey, groupId: $groupId, customKey: $customKey, ipWhitelist: $ipWhitelist, ipBlacklist: $ipBlacklist, quota: $quota, expiresInDays: $expiresInDays, rateLimit5h: $rateLimit5h, rateLimit1d: $rateLimit1d, rateLimit7d: $rateLimit7d)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiCreateKeyRequestCopyWith<$Res> implements $Sub2ApiCreateKeyRequestCopyWith<$Res> {
  factory _$Sub2ApiCreateKeyRequestCopyWith(_Sub2ApiCreateKeyRequest value, $Res Function(_Sub2ApiCreateKeyRequest) _then) = __$Sub2ApiCreateKeyRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String idempotencyKey, int? groupId, Sub2ApiApiKeySecret? customKey, List<String>? ipWhitelist, List<String>? ipBlacklist, Sub2ApiDecimal? quota, int? expiresInDays, Sub2ApiDecimal? rateLimit5h, Sub2ApiDecimal? rateLimit1d, Sub2ApiDecimal? rateLimit7d
});




}
/// @nodoc
class __$Sub2ApiCreateKeyRequestCopyWithImpl<$Res>
    implements _$Sub2ApiCreateKeyRequestCopyWith<$Res> {
  __$Sub2ApiCreateKeyRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiCreateKeyRequest _self;
  final $Res Function(_Sub2ApiCreateKeyRequest) _then;

/// Create a copy of Sub2ApiCreateKeyRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? idempotencyKey = null,Object? groupId = freezed,Object? customKey = freezed,Object? ipWhitelist = freezed,Object? ipBlacklist = freezed,Object? quota = freezed,Object? expiresInDays = freezed,Object? rateLimit5h = freezed,Object? rateLimit1d = freezed,Object? rateLimit7d = freezed,}) {
  return _then(_Sub2ApiCreateKeyRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,idempotencyKey: null == idempotencyKey ? _self.idempotencyKey : idempotencyKey // ignore: cast_nullable_to_non_nullable
as String,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,customKey: freezed == customKey ? _self.customKey : customKey // ignore: cast_nullable_to_non_nullable
as Sub2ApiApiKeySecret?,ipWhitelist: freezed == ipWhitelist ? _self._ipWhitelist : ipWhitelist // ignore: cast_nullable_to_non_nullable
as List<String>?,ipBlacklist: freezed == ipBlacklist ? _self._ipBlacklist : ipBlacklist // ignore: cast_nullable_to_non_nullable
as List<String>?,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,expiresInDays: freezed == expiresInDays ? _self.expiresInDays : expiresInDays // ignore: cast_nullable_to_non_nullable
as int?,rateLimit5h: freezed == rateLimit5h ? _self.rateLimit5h : rateLimit5h // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,rateLimit1d: freezed == rateLimit1d ? _self.rateLimit1d : rateLimit1d // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,rateLimit7d: freezed == rateLimit7d ? _self.rateLimit7d : rateLimit7d // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiUpdateKeyRequest {

 String? get name; int? get groupId; String? get status; List<String>? get ipWhitelist; List<String>? get ipBlacklist; Sub2ApiDecimal? get quota; DateTime? get expiresAt; bool get clearExpiration; bool? get resetQuota; Sub2ApiDecimal? get rateLimit5h; Sub2ApiDecimal? get rateLimit1d; Sub2ApiDecimal? get rateLimit7d; bool? get resetRateLimitUsage;
/// Create a copy of Sub2ApiUpdateKeyRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiUpdateKeyRequestCopyWith<Sub2ApiUpdateKeyRequest> get copyWith => _$Sub2ApiUpdateKeyRequestCopyWithImpl<Sub2ApiUpdateKeyRequest>(this as Sub2ApiUpdateKeyRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiUpdateKeyRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.ipWhitelist, ipWhitelist)&&const DeepCollectionEquality().equals(other.ipBlacklist, ipBlacklist)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.clearExpiration, clearExpiration) || other.clearExpiration == clearExpiration)&&(identical(other.resetQuota, resetQuota) || other.resetQuota == resetQuota)&&(identical(other.rateLimit5h, rateLimit5h) || other.rateLimit5h == rateLimit5h)&&(identical(other.rateLimit1d, rateLimit1d) || other.rateLimit1d == rateLimit1d)&&(identical(other.rateLimit7d, rateLimit7d) || other.rateLimit7d == rateLimit7d)&&(identical(other.resetRateLimitUsage, resetRateLimitUsage) || other.resetRateLimitUsage == resetRateLimitUsage));
}


@override
int get hashCode => Object.hash(runtimeType,name,groupId,status,const DeepCollectionEquality().hash(ipWhitelist),const DeepCollectionEquality().hash(ipBlacklist),quota,expiresAt,clearExpiration,resetQuota,rateLimit5h,rateLimit1d,rateLimit7d,resetRateLimitUsage);

@override
String toString() {
  return 'Sub2ApiUpdateKeyRequest(name: $name, groupId: $groupId, status: $status, ipWhitelist: $ipWhitelist, ipBlacklist: $ipBlacklist, quota: $quota, expiresAt: $expiresAt, clearExpiration: $clearExpiration, resetQuota: $resetQuota, rateLimit5h: $rateLimit5h, rateLimit1d: $rateLimit1d, rateLimit7d: $rateLimit7d, resetRateLimitUsage: $resetRateLimitUsage)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiUpdateKeyRequestCopyWith<$Res>  {
  factory $Sub2ApiUpdateKeyRequestCopyWith(Sub2ApiUpdateKeyRequest value, $Res Function(Sub2ApiUpdateKeyRequest) _then) = _$Sub2ApiUpdateKeyRequestCopyWithImpl;
@useResult
$Res call({
 String? name, int? groupId, String? status, List<String>? ipWhitelist, List<String>? ipBlacklist, Sub2ApiDecimal? quota, DateTime? expiresAt, bool clearExpiration, bool? resetQuota, Sub2ApiDecimal? rateLimit5h, Sub2ApiDecimal? rateLimit1d, Sub2ApiDecimal? rateLimit7d, bool? resetRateLimitUsage
});




}
/// @nodoc
class _$Sub2ApiUpdateKeyRequestCopyWithImpl<$Res>
    implements $Sub2ApiUpdateKeyRequestCopyWith<$Res> {
  _$Sub2ApiUpdateKeyRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiUpdateKeyRequest _self;
  final $Res Function(Sub2ApiUpdateKeyRequest) _then;

/// Create a copy of Sub2ApiUpdateKeyRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? groupId = freezed,Object? status = freezed,Object? ipWhitelist = freezed,Object? ipBlacklist = freezed,Object? quota = freezed,Object? expiresAt = freezed,Object? clearExpiration = null,Object? resetQuota = freezed,Object? rateLimit5h = freezed,Object? rateLimit1d = freezed,Object? rateLimit7d = freezed,Object? resetRateLimitUsage = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,ipWhitelist: freezed == ipWhitelist ? _self.ipWhitelist : ipWhitelist // ignore: cast_nullable_to_non_nullable
as List<String>?,ipBlacklist: freezed == ipBlacklist ? _self.ipBlacklist : ipBlacklist // ignore: cast_nullable_to_non_nullable
as List<String>?,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,clearExpiration: null == clearExpiration ? _self.clearExpiration : clearExpiration // ignore: cast_nullable_to_non_nullable
as bool,resetQuota: freezed == resetQuota ? _self.resetQuota : resetQuota // ignore: cast_nullable_to_non_nullable
as bool?,rateLimit5h: freezed == rateLimit5h ? _self.rateLimit5h : rateLimit5h // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,rateLimit1d: freezed == rateLimit1d ? _self.rateLimit1d : rateLimit1d // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,rateLimit7d: freezed == rateLimit7d ? _self.rateLimit7d : rateLimit7d // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,resetRateLimitUsage: freezed == resetRateLimitUsage ? _self.resetRateLimitUsage : resetRateLimitUsage // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiUpdateKeyRequest].
extension Sub2ApiUpdateKeyRequestPatterns on Sub2ApiUpdateKeyRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiUpdateKeyRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiUpdateKeyRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiUpdateKeyRequest value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiUpdateKeyRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiUpdateKeyRequest value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiUpdateKeyRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  int? groupId,  String? status,  List<String>? ipWhitelist,  List<String>? ipBlacklist,  Sub2ApiDecimal? quota,  DateTime? expiresAt,  bool clearExpiration,  bool? resetQuota,  Sub2ApiDecimal? rateLimit5h,  Sub2ApiDecimal? rateLimit1d,  Sub2ApiDecimal? rateLimit7d,  bool? resetRateLimitUsage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiUpdateKeyRequest() when $default != null:
return $default(_that.name,_that.groupId,_that.status,_that.ipWhitelist,_that.ipBlacklist,_that.quota,_that.expiresAt,_that.clearExpiration,_that.resetQuota,_that.rateLimit5h,_that.rateLimit1d,_that.rateLimit7d,_that.resetRateLimitUsage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  int? groupId,  String? status,  List<String>? ipWhitelist,  List<String>? ipBlacklist,  Sub2ApiDecimal? quota,  DateTime? expiresAt,  bool clearExpiration,  bool? resetQuota,  Sub2ApiDecimal? rateLimit5h,  Sub2ApiDecimal? rateLimit1d,  Sub2ApiDecimal? rateLimit7d,  bool? resetRateLimitUsage)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiUpdateKeyRequest():
return $default(_that.name,_that.groupId,_that.status,_that.ipWhitelist,_that.ipBlacklist,_that.quota,_that.expiresAt,_that.clearExpiration,_that.resetQuota,_that.rateLimit5h,_that.rateLimit1d,_that.rateLimit7d,_that.resetRateLimitUsage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  int? groupId,  String? status,  List<String>? ipWhitelist,  List<String>? ipBlacklist,  Sub2ApiDecimal? quota,  DateTime? expiresAt,  bool clearExpiration,  bool? resetQuota,  Sub2ApiDecimal? rateLimit5h,  Sub2ApiDecimal? rateLimit1d,  Sub2ApiDecimal? rateLimit7d,  bool? resetRateLimitUsage)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiUpdateKeyRequest() when $default != null:
return $default(_that.name,_that.groupId,_that.status,_that.ipWhitelist,_that.ipBlacklist,_that.quota,_that.expiresAt,_that.clearExpiration,_that.resetQuota,_that.rateLimit5h,_that.rateLimit1d,_that.rateLimit7d,_that.resetRateLimitUsage);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiUpdateKeyRequest implements Sub2ApiUpdateKeyRequest {
  const _Sub2ApiUpdateKeyRequest({this.name, this.groupId, this.status, final  List<String>? ipWhitelist, final  List<String>? ipBlacklist, this.quota, this.expiresAt, this.clearExpiration = false, this.resetQuota, this.rateLimit5h, this.rateLimit1d, this.rateLimit7d, this.resetRateLimitUsage}): _ipWhitelist = ipWhitelist,_ipBlacklist = ipBlacklist;
  

@override final  String? name;
@override final  int? groupId;
@override final  String? status;
 final  List<String>? _ipWhitelist;
@override List<String>? get ipWhitelist {
  final value = _ipWhitelist;
  if (value == null) return null;
  if (_ipWhitelist is EqualUnmodifiableListView) return _ipWhitelist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _ipBlacklist;
@override List<String>? get ipBlacklist {
  final value = _ipBlacklist;
  if (value == null) return null;
  if (_ipBlacklist is EqualUnmodifiableListView) return _ipBlacklist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Sub2ApiDecimal? quota;
@override final  DateTime? expiresAt;
@override@JsonKey() final  bool clearExpiration;
@override final  bool? resetQuota;
@override final  Sub2ApiDecimal? rateLimit5h;
@override final  Sub2ApiDecimal? rateLimit1d;
@override final  Sub2ApiDecimal? rateLimit7d;
@override final  bool? resetRateLimitUsage;

/// Create a copy of Sub2ApiUpdateKeyRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiUpdateKeyRequestCopyWith<_Sub2ApiUpdateKeyRequest> get copyWith => __$Sub2ApiUpdateKeyRequestCopyWithImpl<_Sub2ApiUpdateKeyRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiUpdateKeyRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._ipWhitelist, _ipWhitelist)&&const DeepCollectionEquality().equals(other._ipBlacklist, _ipBlacklist)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.clearExpiration, clearExpiration) || other.clearExpiration == clearExpiration)&&(identical(other.resetQuota, resetQuota) || other.resetQuota == resetQuota)&&(identical(other.rateLimit5h, rateLimit5h) || other.rateLimit5h == rateLimit5h)&&(identical(other.rateLimit1d, rateLimit1d) || other.rateLimit1d == rateLimit1d)&&(identical(other.rateLimit7d, rateLimit7d) || other.rateLimit7d == rateLimit7d)&&(identical(other.resetRateLimitUsage, resetRateLimitUsage) || other.resetRateLimitUsage == resetRateLimitUsage));
}


@override
int get hashCode => Object.hash(runtimeType,name,groupId,status,const DeepCollectionEquality().hash(_ipWhitelist),const DeepCollectionEquality().hash(_ipBlacklist),quota,expiresAt,clearExpiration,resetQuota,rateLimit5h,rateLimit1d,rateLimit7d,resetRateLimitUsage);

@override
String toString() {
  return 'Sub2ApiUpdateKeyRequest(name: $name, groupId: $groupId, status: $status, ipWhitelist: $ipWhitelist, ipBlacklist: $ipBlacklist, quota: $quota, expiresAt: $expiresAt, clearExpiration: $clearExpiration, resetQuota: $resetQuota, rateLimit5h: $rateLimit5h, rateLimit1d: $rateLimit1d, rateLimit7d: $rateLimit7d, resetRateLimitUsage: $resetRateLimitUsage)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiUpdateKeyRequestCopyWith<$Res> implements $Sub2ApiUpdateKeyRequestCopyWith<$Res> {
  factory _$Sub2ApiUpdateKeyRequestCopyWith(_Sub2ApiUpdateKeyRequest value, $Res Function(_Sub2ApiUpdateKeyRequest) _then) = __$Sub2ApiUpdateKeyRequestCopyWithImpl;
@override @useResult
$Res call({
 String? name, int? groupId, String? status, List<String>? ipWhitelist, List<String>? ipBlacklist, Sub2ApiDecimal? quota, DateTime? expiresAt, bool clearExpiration, bool? resetQuota, Sub2ApiDecimal? rateLimit5h, Sub2ApiDecimal? rateLimit1d, Sub2ApiDecimal? rateLimit7d, bool? resetRateLimitUsage
});




}
/// @nodoc
class __$Sub2ApiUpdateKeyRequestCopyWithImpl<$Res>
    implements _$Sub2ApiUpdateKeyRequestCopyWith<$Res> {
  __$Sub2ApiUpdateKeyRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiUpdateKeyRequest _self;
  final $Res Function(_Sub2ApiUpdateKeyRequest) _then;

/// Create a copy of Sub2ApiUpdateKeyRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? groupId = freezed,Object? status = freezed,Object? ipWhitelist = freezed,Object? ipBlacklist = freezed,Object? quota = freezed,Object? expiresAt = freezed,Object? clearExpiration = null,Object? resetQuota = freezed,Object? rateLimit5h = freezed,Object? rateLimit1d = freezed,Object? rateLimit7d = freezed,Object? resetRateLimitUsage = freezed,}) {
  return _then(_Sub2ApiUpdateKeyRequest(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,ipWhitelist: freezed == ipWhitelist ? _self._ipWhitelist : ipWhitelist // ignore: cast_nullable_to_non_nullable
as List<String>?,ipBlacklist: freezed == ipBlacklist ? _self._ipBlacklist : ipBlacklist // ignore: cast_nullable_to_non_nullable
as List<String>?,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,clearExpiration: null == clearExpiration ? _self.clearExpiration : clearExpiration // ignore: cast_nullable_to_non_nullable
as bool,resetQuota: freezed == resetQuota ? _self.resetQuota : resetQuota // ignore: cast_nullable_to_non_nullable
as bool?,rateLimit5h: freezed == rateLimit5h ? _self.rateLimit5h : rateLimit5h // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,rateLimit1d: freezed == rateLimit1d ? _self.rateLimit1d : rateLimit1d // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,rateLimit7d: freezed == rateLimit7d ? _self.rateLimit7d : rateLimit7d // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,resetRateLimitUsage: freezed == resetRateLimitUsage ? _self.resetRateLimitUsage : resetRateLimitUsage // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
