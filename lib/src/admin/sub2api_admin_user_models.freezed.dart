// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_admin_user_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sub2ApiAdminReplaceUserGroupRequest {

 int get oldGroupId; int get newGroupId;
/// Create a copy of Sub2ApiAdminReplaceUserGroupRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminReplaceUserGroupRequestCopyWith<Sub2ApiAdminReplaceUserGroupRequest> get copyWith => _$Sub2ApiAdminReplaceUserGroupRequestCopyWithImpl<Sub2ApiAdminReplaceUserGroupRequest>(this as Sub2ApiAdminReplaceUserGroupRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminReplaceUserGroupRequest&&(identical(other.oldGroupId, oldGroupId) || other.oldGroupId == oldGroupId)&&(identical(other.newGroupId, newGroupId) || other.newGroupId == newGroupId));
}


@override
int get hashCode => Object.hash(runtimeType,oldGroupId,newGroupId);

@override
String toString() {
  return 'Sub2ApiAdminReplaceUserGroupRequest(oldGroupId: $oldGroupId, newGroupId: $newGroupId)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminReplaceUserGroupRequestCopyWith<$Res>  {
  factory $Sub2ApiAdminReplaceUserGroupRequestCopyWith(Sub2ApiAdminReplaceUserGroupRequest value, $Res Function(Sub2ApiAdminReplaceUserGroupRequest) _then) = _$Sub2ApiAdminReplaceUserGroupRequestCopyWithImpl;
@useResult
$Res call({
 int oldGroupId, int newGroupId
});




}
/// @nodoc
class _$Sub2ApiAdminReplaceUserGroupRequestCopyWithImpl<$Res>
    implements $Sub2ApiAdminReplaceUserGroupRequestCopyWith<$Res> {
  _$Sub2ApiAdminReplaceUserGroupRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminReplaceUserGroupRequest _self;
  final $Res Function(Sub2ApiAdminReplaceUserGroupRequest) _then;

/// Create a copy of Sub2ApiAdminReplaceUserGroupRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? oldGroupId = null,Object? newGroupId = null,}) {
  return _then(_self.copyWith(
oldGroupId: null == oldGroupId ? _self.oldGroupId : oldGroupId // ignore: cast_nullable_to_non_nullable
as int,newGroupId: null == newGroupId ? _self.newGroupId : newGroupId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminReplaceUserGroupRequest].
extension Sub2ApiAdminReplaceUserGroupRequestPatterns on Sub2ApiAdminReplaceUserGroupRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminReplaceUserGroupRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminReplaceUserGroupRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminReplaceUserGroupRequest value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminReplaceUserGroupRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminReplaceUserGroupRequest value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminReplaceUserGroupRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int oldGroupId,  int newGroupId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminReplaceUserGroupRequest() when $default != null:
return $default(_that.oldGroupId,_that.newGroupId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int oldGroupId,  int newGroupId)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminReplaceUserGroupRequest():
return $default(_that.oldGroupId,_that.newGroupId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int oldGroupId,  int newGroupId)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminReplaceUserGroupRequest() when $default != null:
return $default(_that.oldGroupId,_that.newGroupId);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminReplaceUserGroupRequest implements Sub2ApiAdminReplaceUserGroupRequest {
  const _Sub2ApiAdminReplaceUserGroupRequest({required this.oldGroupId, required this.newGroupId});


@override final  int oldGroupId;
@override final  int newGroupId;

/// Create a copy of Sub2ApiAdminReplaceUserGroupRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminReplaceUserGroupRequestCopyWith<_Sub2ApiAdminReplaceUserGroupRequest> get copyWith => __$Sub2ApiAdminReplaceUserGroupRequestCopyWithImpl<_Sub2ApiAdminReplaceUserGroupRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminReplaceUserGroupRequest&&(identical(other.oldGroupId, oldGroupId) || other.oldGroupId == oldGroupId)&&(identical(other.newGroupId, newGroupId) || other.newGroupId == newGroupId));
}


@override
int get hashCode => Object.hash(runtimeType,oldGroupId,newGroupId);

@override
String toString() {
  return 'Sub2ApiAdminReplaceUserGroupRequest(oldGroupId: $oldGroupId, newGroupId: $newGroupId)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminReplaceUserGroupRequestCopyWith<$Res> implements $Sub2ApiAdminReplaceUserGroupRequestCopyWith<$Res> {
  factory _$Sub2ApiAdminReplaceUserGroupRequestCopyWith(_Sub2ApiAdminReplaceUserGroupRequest value, $Res Function(_Sub2ApiAdminReplaceUserGroupRequest) _then) = __$Sub2ApiAdminReplaceUserGroupRequestCopyWithImpl;
@override @useResult
$Res call({
 int oldGroupId, int newGroupId
});




}
/// @nodoc
class __$Sub2ApiAdminReplaceUserGroupRequestCopyWithImpl<$Res>
    implements _$Sub2ApiAdminReplaceUserGroupRequestCopyWith<$Res> {
  __$Sub2ApiAdminReplaceUserGroupRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminReplaceUserGroupRequest _self;
  final $Res Function(_Sub2ApiAdminReplaceUserGroupRequest) _then;

/// Create a copy of Sub2ApiAdminReplaceUserGroupRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? oldGroupId = null,Object? newGroupId = null,}) {
  return _then(_Sub2ApiAdminReplaceUserGroupRequest(
oldGroupId: null == oldGroupId ? _self.oldGroupId : oldGroupId // ignore: cast_nullable_to_non_nullable
as int,newGroupId: null == newGroupId ? _self.newGroupId : newGroupId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminBatchConcurrencyRequest {

 List<int> get userIds; bool get all; int get concurrency; Sub2ApiAdminBatchConcurrencyMode get mode;
/// Create a copy of Sub2ApiAdminBatchConcurrencyRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminBatchConcurrencyRequestCopyWith<Sub2ApiAdminBatchConcurrencyRequest> get copyWith => _$Sub2ApiAdminBatchConcurrencyRequestCopyWithImpl<Sub2ApiAdminBatchConcurrencyRequest>(this as Sub2ApiAdminBatchConcurrencyRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminBatchConcurrencyRequest&&const DeepCollectionEquality().equals(other.userIds, userIds)&&(identical(other.all, all) || other.all == all)&&(identical(other.concurrency, concurrency) || other.concurrency == concurrency)&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(userIds),all,concurrency,mode);

@override
String toString() {
  return 'Sub2ApiAdminBatchConcurrencyRequest(userIds: $userIds, all: $all, concurrency: $concurrency, mode: $mode)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminBatchConcurrencyRequestCopyWith<$Res>  {
  factory $Sub2ApiAdminBatchConcurrencyRequestCopyWith(Sub2ApiAdminBatchConcurrencyRequest value, $Res Function(Sub2ApiAdminBatchConcurrencyRequest) _then) = _$Sub2ApiAdminBatchConcurrencyRequestCopyWithImpl;
@useResult
$Res call({
 List<int> userIds, bool all, int concurrency, Sub2ApiAdminBatchConcurrencyMode mode
});




}
/// @nodoc
class _$Sub2ApiAdminBatchConcurrencyRequestCopyWithImpl<$Res>
    implements $Sub2ApiAdminBatchConcurrencyRequestCopyWith<$Res> {
  _$Sub2ApiAdminBatchConcurrencyRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminBatchConcurrencyRequest _self;
  final $Res Function(Sub2ApiAdminBatchConcurrencyRequest) _then;

/// Create a copy of Sub2ApiAdminBatchConcurrencyRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userIds = null,Object? all = null,Object? concurrency = null,Object? mode = null,}) {
  return _then(_self.copyWith(
userIds: null == userIds ? _self.userIds : userIds // ignore: cast_nullable_to_non_nullable
as List<int>,all: null == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as bool,concurrency: null == concurrency ? _self.concurrency : concurrency // ignore: cast_nullable_to_non_nullable
as int,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminBatchConcurrencyMode,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminBatchConcurrencyRequest].
extension Sub2ApiAdminBatchConcurrencyRequestPatterns on Sub2ApiAdminBatchConcurrencyRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminBatchConcurrencyRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchConcurrencyRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminBatchConcurrencyRequest value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchConcurrencyRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminBatchConcurrencyRequest value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchConcurrencyRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> userIds,  bool all,  int concurrency,  Sub2ApiAdminBatchConcurrencyMode mode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchConcurrencyRequest() when $default != null:
return $default(_that.userIds,_that.all,_that.concurrency,_that.mode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> userIds,  bool all,  int concurrency,  Sub2ApiAdminBatchConcurrencyMode mode)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchConcurrencyRequest():
return $default(_that.userIds,_that.all,_that.concurrency,_that.mode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> userIds,  bool all,  int concurrency,  Sub2ApiAdminBatchConcurrencyMode mode)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchConcurrencyRequest() when $default != null:
return $default(_that.userIds,_that.all,_that.concurrency,_that.mode);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminBatchConcurrencyRequest implements Sub2ApiAdminBatchConcurrencyRequest {
  const _Sub2ApiAdminBatchConcurrencyRequest({final  List<int> userIds = const <int>[], this.all = false, required this.concurrency, required this.mode}): _userIds = userIds;


 final  List<int> _userIds;
@override@JsonKey() List<int> get userIds {
  if (_userIds is EqualUnmodifiableListView) return _userIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userIds);
}

@override@JsonKey() final  bool all;
@override final  int concurrency;
@override final  Sub2ApiAdminBatchConcurrencyMode mode;

/// Create a copy of Sub2ApiAdminBatchConcurrencyRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminBatchConcurrencyRequestCopyWith<_Sub2ApiAdminBatchConcurrencyRequest> get copyWith => __$Sub2ApiAdminBatchConcurrencyRequestCopyWithImpl<_Sub2ApiAdminBatchConcurrencyRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminBatchConcurrencyRequest&&const DeepCollectionEquality().equals(other._userIds, _userIds)&&(identical(other.all, all) || other.all == all)&&(identical(other.concurrency, concurrency) || other.concurrency == concurrency)&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_userIds),all,concurrency,mode);

@override
String toString() {
  return 'Sub2ApiAdminBatchConcurrencyRequest(userIds: $userIds, all: $all, concurrency: $concurrency, mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminBatchConcurrencyRequestCopyWith<$Res> implements $Sub2ApiAdminBatchConcurrencyRequestCopyWith<$Res> {
  factory _$Sub2ApiAdminBatchConcurrencyRequestCopyWith(_Sub2ApiAdminBatchConcurrencyRequest value, $Res Function(_Sub2ApiAdminBatchConcurrencyRequest) _then) = __$Sub2ApiAdminBatchConcurrencyRequestCopyWithImpl;
@override @useResult
$Res call({
 List<int> userIds, bool all, int concurrency, Sub2ApiAdminBatchConcurrencyMode mode
});




}
/// @nodoc
class __$Sub2ApiAdminBatchConcurrencyRequestCopyWithImpl<$Res>
    implements _$Sub2ApiAdminBatchConcurrencyRequestCopyWith<$Res> {
  __$Sub2ApiAdminBatchConcurrencyRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminBatchConcurrencyRequest _self;
  final $Res Function(_Sub2ApiAdminBatchConcurrencyRequest) _then;

/// Create a copy of Sub2ApiAdminBatchConcurrencyRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userIds = null,Object? all = null,Object? concurrency = null,Object? mode = null,}) {
  return _then(_Sub2ApiAdminBatchConcurrencyRequest(
userIds: null == userIds ? _self._userIds : userIds // ignore: cast_nullable_to_non_nullable
as List<int>,all: null == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as bool,concurrency: null == concurrency ? _self.concurrency : concurrency // ignore: cast_nullable_to_non_nullable
as int,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminBatchConcurrencyMode,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminBatchLimitsRequest {

 List<int> get userIds; bool get all; int? get concurrency; int? get rpmLimit;
/// Create a copy of Sub2ApiAdminBatchLimitsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminBatchLimitsRequestCopyWith<Sub2ApiAdminBatchLimitsRequest> get copyWith => _$Sub2ApiAdminBatchLimitsRequestCopyWithImpl<Sub2ApiAdminBatchLimitsRequest>(this as Sub2ApiAdminBatchLimitsRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminBatchLimitsRequest&&const DeepCollectionEquality().equals(other.userIds, userIds)&&(identical(other.all, all) || other.all == all)&&(identical(other.concurrency, concurrency) || other.concurrency == concurrency)&&(identical(other.rpmLimit, rpmLimit) || other.rpmLimit == rpmLimit));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(userIds),all,concurrency,rpmLimit);

@override
String toString() {
  return 'Sub2ApiAdminBatchLimitsRequest(userIds: $userIds, all: $all, concurrency: $concurrency, rpmLimit: $rpmLimit)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminBatchLimitsRequestCopyWith<$Res>  {
  factory $Sub2ApiAdminBatchLimitsRequestCopyWith(Sub2ApiAdminBatchLimitsRequest value, $Res Function(Sub2ApiAdminBatchLimitsRequest) _then) = _$Sub2ApiAdminBatchLimitsRequestCopyWithImpl;
@useResult
$Res call({
 List<int> userIds, bool all, int? concurrency, int? rpmLimit
});




}
/// @nodoc
class _$Sub2ApiAdminBatchLimitsRequestCopyWithImpl<$Res>
    implements $Sub2ApiAdminBatchLimitsRequestCopyWith<$Res> {
  _$Sub2ApiAdminBatchLimitsRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminBatchLimitsRequest _self;
  final $Res Function(Sub2ApiAdminBatchLimitsRequest) _then;

/// Create a copy of Sub2ApiAdminBatchLimitsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userIds = null,Object? all = null,Object? concurrency = freezed,Object? rpmLimit = freezed,}) {
  return _then(_self.copyWith(
userIds: null == userIds ? _self.userIds : userIds // ignore: cast_nullable_to_non_nullable
as List<int>,all: null == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as bool,concurrency: freezed == concurrency ? _self.concurrency : concurrency // ignore: cast_nullable_to_non_nullable
as int?,rpmLimit: freezed == rpmLimit ? _self.rpmLimit : rpmLimit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminBatchLimitsRequest].
extension Sub2ApiAdminBatchLimitsRequestPatterns on Sub2ApiAdminBatchLimitsRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminBatchLimitsRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchLimitsRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminBatchLimitsRequest value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchLimitsRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminBatchLimitsRequest value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchLimitsRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> userIds,  bool all,  int? concurrency,  int? rpmLimit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchLimitsRequest() when $default != null:
return $default(_that.userIds,_that.all,_that.concurrency,_that.rpmLimit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> userIds,  bool all,  int? concurrency,  int? rpmLimit)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchLimitsRequest():
return $default(_that.userIds,_that.all,_that.concurrency,_that.rpmLimit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> userIds,  bool all,  int? concurrency,  int? rpmLimit)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminBatchLimitsRequest() when $default != null:
return $default(_that.userIds,_that.all,_that.concurrency,_that.rpmLimit);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminBatchLimitsRequest implements Sub2ApiAdminBatchLimitsRequest {
  const _Sub2ApiAdminBatchLimitsRequest({final  List<int> userIds = const <int>[], this.all = false, this.concurrency, this.rpmLimit}): _userIds = userIds;


 final  List<int> _userIds;
@override@JsonKey() List<int> get userIds {
  if (_userIds is EqualUnmodifiableListView) return _userIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userIds);
}

@override@JsonKey() final  bool all;
@override final  int? concurrency;
@override final  int? rpmLimit;

/// Create a copy of Sub2ApiAdminBatchLimitsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminBatchLimitsRequestCopyWith<_Sub2ApiAdminBatchLimitsRequest> get copyWith => __$Sub2ApiAdminBatchLimitsRequestCopyWithImpl<_Sub2ApiAdminBatchLimitsRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminBatchLimitsRequest&&const DeepCollectionEquality().equals(other._userIds, _userIds)&&(identical(other.all, all) || other.all == all)&&(identical(other.concurrency, concurrency) || other.concurrency == concurrency)&&(identical(other.rpmLimit, rpmLimit) || other.rpmLimit == rpmLimit));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_userIds),all,concurrency,rpmLimit);

@override
String toString() {
  return 'Sub2ApiAdminBatchLimitsRequest(userIds: $userIds, all: $all, concurrency: $concurrency, rpmLimit: $rpmLimit)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminBatchLimitsRequestCopyWith<$Res> implements $Sub2ApiAdminBatchLimitsRequestCopyWith<$Res> {
  factory _$Sub2ApiAdminBatchLimitsRequestCopyWith(_Sub2ApiAdminBatchLimitsRequest value, $Res Function(_Sub2ApiAdminBatchLimitsRequest) _then) = __$Sub2ApiAdminBatchLimitsRequestCopyWithImpl;
@override @useResult
$Res call({
 List<int> userIds, bool all, int? concurrency, int? rpmLimit
});




}
/// @nodoc
class __$Sub2ApiAdminBatchLimitsRequestCopyWithImpl<$Res>
    implements _$Sub2ApiAdminBatchLimitsRequestCopyWith<$Res> {
  __$Sub2ApiAdminBatchLimitsRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminBatchLimitsRequest _self;
  final $Res Function(_Sub2ApiAdminBatchLimitsRequest) _then;

/// Create a copy of Sub2ApiAdminBatchLimitsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userIds = null,Object? all = null,Object? concurrency = freezed,Object? rpmLimit = freezed,}) {
  return _then(_Sub2ApiAdminBatchLimitsRequest(
userIds: null == userIds ? _self._userIds : userIds // ignore: cast_nullable_to_non_nullable
as List<int>,all: null == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as bool,concurrency: freezed == concurrency ? _self.concurrency : concurrency // ignore: cast_nullable_to_non_nullable
as int?,rpmLimit: freezed == rpmLimit ? _self.rpmLimit : rpmLimit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminPlatformQuotaInput {

 Sub2ApiAdminQuotaPlatform get platform; Sub2ApiDecimal? get dailyLimitUsd; Sub2ApiDecimal? get weeklyLimitUsd; Sub2ApiDecimal? get monthlyLimitUsd;
/// Create a copy of Sub2ApiAdminPlatformQuotaInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminPlatformQuotaInputCopyWith<Sub2ApiAdminPlatformQuotaInput> get copyWith => _$Sub2ApiAdminPlatformQuotaInputCopyWithImpl<Sub2ApiAdminPlatformQuotaInput>(this as Sub2ApiAdminPlatformQuotaInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminPlatformQuotaInput&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.dailyLimitUsd, dailyLimitUsd) || other.dailyLimitUsd == dailyLimitUsd)&&(identical(other.weeklyLimitUsd, weeklyLimitUsd) || other.weeklyLimitUsd == weeklyLimitUsd)&&(identical(other.monthlyLimitUsd, monthlyLimitUsd) || other.monthlyLimitUsd == monthlyLimitUsd));
}


@override
int get hashCode => Object.hash(runtimeType,platform,dailyLimitUsd,weeklyLimitUsd,monthlyLimitUsd);

@override
String toString() {
  return 'Sub2ApiAdminPlatformQuotaInput(platform: $platform, dailyLimitUsd: $dailyLimitUsd, weeklyLimitUsd: $weeklyLimitUsd, monthlyLimitUsd: $monthlyLimitUsd)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminPlatformQuotaInputCopyWith<$Res>  {
  factory $Sub2ApiAdminPlatformQuotaInputCopyWith(Sub2ApiAdminPlatformQuotaInput value, $Res Function(Sub2ApiAdminPlatformQuotaInput) _then) = _$Sub2ApiAdminPlatformQuotaInputCopyWithImpl;
@useResult
$Res call({
 Sub2ApiAdminQuotaPlatform platform, Sub2ApiDecimal? dailyLimitUsd, Sub2ApiDecimal? weeklyLimitUsd, Sub2ApiDecimal? monthlyLimitUsd
});




}
/// @nodoc
class _$Sub2ApiAdminPlatformQuotaInputCopyWithImpl<$Res>
    implements $Sub2ApiAdminPlatformQuotaInputCopyWith<$Res> {
  _$Sub2ApiAdminPlatformQuotaInputCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminPlatformQuotaInput _self;
  final $Res Function(Sub2ApiAdminPlatformQuotaInput) _then;

/// Create a copy of Sub2ApiAdminPlatformQuotaInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platform = null,Object? dailyLimitUsd = freezed,Object? weeklyLimitUsd = freezed,Object? monthlyLimitUsd = freezed,}) {
  return _then(_self.copyWith(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminQuotaPlatform,dailyLimitUsd: freezed == dailyLimitUsd ? _self.dailyLimitUsd : dailyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,weeklyLimitUsd: freezed == weeklyLimitUsd ? _self.weeklyLimitUsd : weeklyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,monthlyLimitUsd: freezed == monthlyLimitUsd ? _self.monthlyLimitUsd : monthlyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminPlatformQuotaInput].
extension Sub2ApiAdminPlatformQuotaInputPatterns on Sub2ApiAdminPlatformQuotaInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminPlatformQuotaInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminPlatformQuotaInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminPlatformQuotaInput value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminPlatformQuotaInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminPlatformQuotaInput value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminPlatformQuotaInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiAdminQuotaPlatform platform,  Sub2ApiDecimal? dailyLimitUsd,  Sub2ApiDecimal? weeklyLimitUsd,  Sub2ApiDecimal? monthlyLimitUsd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminPlatformQuotaInput() when $default != null:
return $default(_that.platform,_that.dailyLimitUsd,_that.weeklyLimitUsd,_that.monthlyLimitUsd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiAdminQuotaPlatform platform,  Sub2ApiDecimal? dailyLimitUsd,  Sub2ApiDecimal? weeklyLimitUsd,  Sub2ApiDecimal? monthlyLimitUsd)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminPlatformQuotaInput():
return $default(_that.platform,_that.dailyLimitUsd,_that.weeklyLimitUsd,_that.monthlyLimitUsd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiAdminQuotaPlatform platform,  Sub2ApiDecimal? dailyLimitUsd,  Sub2ApiDecimal? weeklyLimitUsd,  Sub2ApiDecimal? monthlyLimitUsd)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminPlatformQuotaInput() when $default != null:
return $default(_that.platform,_that.dailyLimitUsd,_that.weeklyLimitUsd,_that.monthlyLimitUsd);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminPlatformQuotaInput implements Sub2ApiAdminPlatformQuotaInput {
  const _Sub2ApiAdminPlatformQuotaInput({required this.platform, this.dailyLimitUsd, this.weeklyLimitUsd, this.monthlyLimitUsd});


@override final  Sub2ApiAdminQuotaPlatform platform;
@override final  Sub2ApiDecimal? dailyLimitUsd;
@override final  Sub2ApiDecimal? weeklyLimitUsd;
@override final  Sub2ApiDecimal? monthlyLimitUsd;

/// Create a copy of Sub2ApiAdminPlatformQuotaInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminPlatformQuotaInputCopyWith<_Sub2ApiAdminPlatformQuotaInput> get copyWith => __$Sub2ApiAdminPlatformQuotaInputCopyWithImpl<_Sub2ApiAdminPlatformQuotaInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminPlatformQuotaInput&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.dailyLimitUsd, dailyLimitUsd) || other.dailyLimitUsd == dailyLimitUsd)&&(identical(other.weeklyLimitUsd, weeklyLimitUsd) || other.weeklyLimitUsd == weeklyLimitUsd)&&(identical(other.monthlyLimitUsd, monthlyLimitUsd) || other.monthlyLimitUsd == monthlyLimitUsd));
}


@override
int get hashCode => Object.hash(runtimeType,platform,dailyLimitUsd,weeklyLimitUsd,monthlyLimitUsd);

@override
String toString() {
  return 'Sub2ApiAdminPlatformQuotaInput(platform: $platform, dailyLimitUsd: $dailyLimitUsd, weeklyLimitUsd: $weeklyLimitUsd, monthlyLimitUsd: $monthlyLimitUsd)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminPlatformQuotaInputCopyWith<$Res> implements $Sub2ApiAdminPlatformQuotaInputCopyWith<$Res> {
  factory _$Sub2ApiAdminPlatformQuotaInputCopyWith(_Sub2ApiAdminPlatformQuotaInput value, $Res Function(_Sub2ApiAdminPlatformQuotaInput) _then) = __$Sub2ApiAdminPlatformQuotaInputCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiAdminQuotaPlatform platform, Sub2ApiDecimal? dailyLimitUsd, Sub2ApiDecimal? weeklyLimitUsd, Sub2ApiDecimal? monthlyLimitUsd
});




}
/// @nodoc
class __$Sub2ApiAdminPlatformQuotaInputCopyWithImpl<$Res>
    implements _$Sub2ApiAdminPlatformQuotaInputCopyWith<$Res> {
  __$Sub2ApiAdminPlatformQuotaInputCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminPlatformQuotaInput _self;
  final $Res Function(_Sub2ApiAdminPlatformQuotaInput) _then;

/// Create a copy of Sub2ApiAdminPlatformQuotaInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platform = null,Object? dailyLimitUsd = freezed,Object? weeklyLimitUsd = freezed,Object? monthlyLimitUsd = freezed,}) {
  return _then(_Sub2ApiAdminPlatformQuotaInput(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminQuotaPlatform,dailyLimitUsd: freezed == dailyLimitUsd ? _self.dailyLimitUsd : dailyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,weeklyLimitUsd: freezed == weeklyLimitUsd ? _self.weeklyLimitUsd : weeklyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,monthlyLimitUsd: freezed == monthlyLimitUsd ? _self.monthlyLimitUsd : monthlyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUpdatePlatformQuotasRequest {

 List<Sub2ApiAdminPlatformQuotaInput> get quotas;
/// Create a copy of Sub2ApiAdminUpdatePlatformQuotasRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUpdatePlatformQuotasRequestCopyWith<Sub2ApiAdminUpdatePlatformQuotasRequest> get copyWith => _$Sub2ApiAdminUpdatePlatformQuotasRequestCopyWithImpl<Sub2ApiAdminUpdatePlatformQuotasRequest>(this as Sub2ApiAdminUpdatePlatformQuotasRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUpdatePlatformQuotasRequest&&const DeepCollectionEquality().equals(other.quotas, quotas));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(quotas));

@override
String toString() {
  return 'Sub2ApiAdminUpdatePlatformQuotasRequest(quotas: $quotas)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUpdatePlatformQuotasRequestCopyWith<$Res>  {
  factory $Sub2ApiAdminUpdatePlatformQuotasRequestCopyWith(Sub2ApiAdminUpdatePlatformQuotasRequest value, $Res Function(Sub2ApiAdminUpdatePlatformQuotasRequest) _then) = _$Sub2ApiAdminUpdatePlatformQuotasRequestCopyWithImpl;
@useResult
$Res call({
 List<Sub2ApiAdminPlatformQuotaInput> quotas
});




}
/// @nodoc
class _$Sub2ApiAdminUpdatePlatformQuotasRequestCopyWithImpl<$Res>
    implements $Sub2ApiAdminUpdatePlatformQuotasRequestCopyWith<$Res> {
  _$Sub2ApiAdminUpdatePlatformQuotasRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUpdatePlatformQuotasRequest _self;
  final $Res Function(Sub2ApiAdminUpdatePlatformQuotasRequest) _then;

/// Create a copy of Sub2ApiAdminUpdatePlatformQuotasRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quotas = null,}) {
  return _then(_self.copyWith(
quotas: null == quotas ? _self.quotas : quotas // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminPlatformQuotaInput>,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUpdatePlatformQuotasRequest].
extension Sub2ApiAdminUpdatePlatformQuotasRequestPatterns on Sub2ApiAdminUpdatePlatformQuotasRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUpdatePlatformQuotasRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUpdatePlatformQuotasRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUpdatePlatformQuotasRequest value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUpdatePlatformQuotasRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUpdatePlatformQuotasRequest value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUpdatePlatformQuotasRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Sub2ApiAdminPlatformQuotaInput> quotas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUpdatePlatformQuotasRequest() when $default != null:
return $default(_that.quotas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Sub2ApiAdminPlatformQuotaInput> quotas)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUpdatePlatformQuotasRequest():
return $default(_that.quotas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Sub2ApiAdminPlatformQuotaInput> quotas)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUpdatePlatformQuotasRequest() when $default != null:
return $default(_that.quotas);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUpdatePlatformQuotasRequest implements Sub2ApiAdminUpdatePlatformQuotasRequest {
  const _Sub2ApiAdminUpdatePlatformQuotasRequest({required final  List<Sub2ApiAdminPlatformQuotaInput> quotas}): _quotas = quotas;


 final  List<Sub2ApiAdminPlatformQuotaInput> _quotas;
@override List<Sub2ApiAdminPlatformQuotaInput> get quotas {
  if (_quotas is EqualUnmodifiableListView) return _quotas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quotas);
}


/// Create a copy of Sub2ApiAdminUpdatePlatformQuotasRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUpdatePlatformQuotasRequestCopyWith<_Sub2ApiAdminUpdatePlatformQuotasRequest> get copyWith => __$Sub2ApiAdminUpdatePlatformQuotasRequestCopyWithImpl<_Sub2ApiAdminUpdatePlatformQuotasRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUpdatePlatformQuotasRequest&&const DeepCollectionEquality().equals(other._quotas, _quotas));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_quotas));

@override
String toString() {
  return 'Sub2ApiAdminUpdatePlatformQuotasRequest(quotas: $quotas)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUpdatePlatformQuotasRequestCopyWith<$Res> implements $Sub2ApiAdminUpdatePlatformQuotasRequestCopyWith<$Res> {
  factory _$Sub2ApiAdminUpdatePlatformQuotasRequestCopyWith(_Sub2ApiAdminUpdatePlatformQuotasRequest value, $Res Function(_Sub2ApiAdminUpdatePlatformQuotasRequest) _then) = __$Sub2ApiAdminUpdatePlatformQuotasRequestCopyWithImpl;
@override @useResult
$Res call({
 List<Sub2ApiAdminPlatformQuotaInput> quotas
});




}
/// @nodoc
class __$Sub2ApiAdminUpdatePlatformQuotasRequestCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUpdatePlatformQuotasRequestCopyWith<$Res> {
  __$Sub2ApiAdminUpdatePlatformQuotasRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUpdatePlatformQuotasRequest _self;
  final $Res Function(_Sub2ApiAdminUpdatePlatformQuotasRequest) _then;

/// Create a copy of Sub2ApiAdminUpdatePlatformQuotasRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quotas = null,}) {
  return _then(_Sub2ApiAdminUpdatePlatformQuotasRequest(
quotas: null == quotas ? _self._quotas : quotas // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminPlatformQuotaInput>,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminResetPlatformQuotaRequest {

 Sub2ApiAdminQuotaPlatform get platform; Sub2ApiAdminQuotaWindow get window;
/// Create a copy of Sub2ApiAdminResetPlatformQuotaRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminResetPlatformQuotaRequestCopyWith<Sub2ApiAdminResetPlatformQuotaRequest> get copyWith => _$Sub2ApiAdminResetPlatformQuotaRequestCopyWithImpl<Sub2ApiAdminResetPlatformQuotaRequest>(this as Sub2ApiAdminResetPlatformQuotaRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminResetPlatformQuotaRequest&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.window, window) || other.window == window));
}


@override
int get hashCode => Object.hash(runtimeType,platform,window);

@override
String toString() {
  return 'Sub2ApiAdminResetPlatformQuotaRequest(platform: $platform, window: $window)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminResetPlatformQuotaRequestCopyWith<$Res>  {
  factory $Sub2ApiAdminResetPlatformQuotaRequestCopyWith(Sub2ApiAdminResetPlatformQuotaRequest value, $Res Function(Sub2ApiAdminResetPlatformQuotaRequest) _then) = _$Sub2ApiAdminResetPlatformQuotaRequestCopyWithImpl;
@useResult
$Res call({
 Sub2ApiAdminQuotaPlatform platform, Sub2ApiAdminQuotaWindow window
});




}
/// @nodoc
class _$Sub2ApiAdminResetPlatformQuotaRequestCopyWithImpl<$Res>
    implements $Sub2ApiAdminResetPlatformQuotaRequestCopyWith<$Res> {
  _$Sub2ApiAdminResetPlatformQuotaRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminResetPlatformQuotaRequest _self;
  final $Res Function(Sub2ApiAdminResetPlatformQuotaRequest) _then;

/// Create a copy of Sub2ApiAdminResetPlatformQuotaRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platform = null,Object? window = null,}) {
  return _then(_self.copyWith(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminQuotaPlatform,window: null == window ? _self.window : window // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminQuotaWindow,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminResetPlatformQuotaRequest].
extension Sub2ApiAdminResetPlatformQuotaRequestPatterns on Sub2ApiAdminResetPlatformQuotaRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminResetPlatformQuotaRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminResetPlatformQuotaRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminResetPlatformQuotaRequest value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminResetPlatformQuotaRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminResetPlatformQuotaRequest value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminResetPlatformQuotaRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiAdminQuotaPlatform platform,  Sub2ApiAdminQuotaWindow window)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminResetPlatformQuotaRequest() when $default != null:
return $default(_that.platform,_that.window);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiAdminQuotaPlatform platform,  Sub2ApiAdminQuotaWindow window)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminResetPlatformQuotaRequest():
return $default(_that.platform,_that.window);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiAdminQuotaPlatform platform,  Sub2ApiAdminQuotaWindow window)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminResetPlatformQuotaRequest() when $default != null:
return $default(_that.platform,_that.window);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminResetPlatformQuotaRequest implements Sub2ApiAdminResetPlatformQuotaRequest {
  const _Sub2ApiAdminResetPlatformQuotaRequest({required this.platform, required this.window});


@override final  Sub2ApiAdminQuotaPlatform platform;
@override final  Sub2ApiAdminQuotaWindow window;

/// Create a copy of Sub2ApiAdminResetPlatformQuotaRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminResetPlatformQuotaRequestCopyWith<_Sub2ApiAdminResetPlatformQuotaRequest> get copyWith => __$Sub2ApiAdminResetPlatformQuotaRequestCopyWithImpl<_Sub2ApiAdminResetPlatformQuotaRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminResetPlatformQuotaRequest&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.window, window) || other.window == window));
}


@override
int get hashCode => Object.hash(runtimeType,platform,window);

@override
String toString() {
  return 'Sub2ApiAdminResetPlatformQuotaRequest(platform: $platform, window: $window)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminResetPlatformQuotaRequestCopyWith<$Res> implements $Sub2ApiAdminResetPlatformQuotaRequestCopyWith<$Res> {
  factory _$Sub2ApiAdminResetPlatformQuotaRequestCopyWith(_Sub2ApiAdminResetPlatformQuotaRequest value, $Res Function(_Sub2ApiAdminResetPlatformQuotaRequest) _then) = __$Sub2ApiAdminResetPlatformQuotaRequestCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiAdminQuotaPlatform platform, Sub2ApiAdminQuotaWindow window
});




}
/// @nodoc
class __$Sub2ApiAdminResetPlatformQuotaRequestCopyWithImpl<$Res>
    implements _$Sub2ApiAdminResetPlatformQuotaRequestCopyWith<$Res> {
  __$Sub2ApiAdminResetPlatformQuotaRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminResetPlatformQuotaRequest _self;
  final $Res Function(_Sub2ApiAdminResetPlatformQuotaRequest) _then;

/// Create a copy of Sub2ApiAdminResetPlatformQuotaRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platform = null,Object? window = null,}) {
  return _then(_Sub2ApiAdminResetPlatformQuotaRequest(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminQuotaPlatform,window: null == window ? _self.window : window // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminQuotaWindow,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUpdateUserAttributesRequest {

 Map<int, String> get values;
/// Create a copy of Sub2ApiAdminUpdateUserAttributesRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUpdateUserAttributesRequestCopyWith<Sub2ApiAdminUpdateUserAttributesRequest> get copyWith => _$Sub2ApiAdminUpdateUserAttributesRequestCopyWithImpl<Sub2ApiAdminUpdateUserAttributesRequest>(this as Sub2ApiAdminUpdateUserAttributesRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUpdateUserAttributesRequest&&const DeepCollectionEquality().equals(other.values, values));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(values));

@override
String toString() {
  return 'Sub2ApiAdminUpdateUserAttributesRequest(values: $values)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUpdateUserAttributesRequestCopyWith<$Res>  {
  factory $Sub2ApiAdminUpdateUserAttributesRequestCopyWith(Sub2ApiAdminUpdateUserAttributesRequest value, $Res Function(Sub2ApiAdminUpdateUserAttributesRequest) _then) = _$Sub2ApiAdminUpdateUserAttributesRequestCopyWithImpl;
@useResult
$Res call({
 Map<int, String> values
});




}
/// @nodoc
class _$Sub2ApiAdminUpdateUserAttributesRequestCopyWithImpl<$Res>
    implements $Sub2ApiAdminUpdateUserAttributesRequestCopyWith<$Res> {
  _$Sub2ApiAdminUpdateUserAttributesRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUpdateUserAttributesRequest _self;
  final $Res Function(Sub2ApiAdminUpdateUserAttributesRequest) _then;

/// Create a copy of Sub2ApiAdminUpdateUserAttributesRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? values = null,}) {
  return _then(_self.copyWith(
values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as Map<int, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUpdateUserAttributesRequest].
extension Sub2ApiAdminUpdateUserAttributesRequestPatterns on Sub2ApiAdminUpdateUserAttributesRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUpdateUserAttributesRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUpdateUserAttributesRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUpdateUserAttributesRequest value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUpdateUserAttributesRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUpdateUserAttributesRequest value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUpdateUserAttributesRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<int, String> values)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUpdateUserAttributesRequest() when $default != null:
return $default(_that.values);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<int, String> values)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUpdateUserAttributesRequest():
return $default(_that.values);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<int, String> values)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUpdateUserAttributesRequest() when $default != null:
return $default(_that.values);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUpdateUserAttributesRequest implements Sub2ApiAdminUpdateUserAttributesRequest {
  const _Sub2ApiAdminUpdateUserAttributesRequest({required final  Map<int, String> values}): _values = values;


 final  Map<int, String> _values;
@override Map<int, String> get values {
  if (_values is EqualUnmodifiableMapView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_values);
}


/// Create a copy of Sub2ApiAdminUpdateUserAttributesRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUpdateUserAttributesRequestCopyWith<_Sub2ApiAdminUpdateUserAttributesRequest> get copyWith => __$Sub2ApiAdminUpdateUserAttributesRequestCopyWithImpl<_Sub2ApiAdminUpdateUserAttributesRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUpdateUserAttributesRequest&&const DeepCollectionEquality().equals(other._values, _values));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_values));

@override
String toString() {
  return 'Sub2ApiAdminUpdateUserAttributesRequest(values: $values)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUpdateUserAttributesRequestCopyWith<$Res> implements $Sub2ApiAdminUpdateUserAttributesRequestCopyWith<$Res> {
  factory _$Sub2ApiAdminUpdateUserAttributesRequestCopyWith(_Sub2ApiAdminUpdateUserAttributesRequest value, $Res Function(_Sub2ApiAdminUpdateUserAttributesRequest) _then) = __$Sub2ApiAdminUpdateUserAttributesRequestCopyWithImpl;
@override @useResult
$Res call({
 Map<int, String> values
});




}
/// @nodoc
class __$Sub2ApiAdminUpdateUserAttributesRequestCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUpdateUserAttributesRequestCopyWith<$Res> {
  __$Sub2ApiAdminUpdateUserAttributesRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUpdateUserAttributesRequest _self;
  final $Res Function(_Sub2ApiAdminUpdateUserAttributesRequest) _then;

/// Create a copy of Sub2ApiAdminUpdateUserAttributesRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? values = null,}) {
  return _then(_Sub2ApiAdminUpdateUserAttributesRequest(
values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as Map<int, String>,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminReplaceUserGroupResult {

 int get migratedKeys;
/// Create a copy of Sub2ApiAdminReplaceUserGroupResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminReplaceUserGroupResultCopyWith<Sub2ApiAdminReplaceUserGroupResult> get copyWith => _$Sub2ApiAdminReplaceUserGroupResultCopyWithImpl<Sub2ApiAdminReplaceUserGroupResult>(this as Sub2ApiAdminReplaceUserGroupResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminReplaceUserGroupResult&&(identical(other.migratedKeys, migratedKeys) || other.migratedKeys == migratedKeys));
}


@override
int get hashCode => Object.hash(runtimeType,migratedKeys);

@override
String toString() {
  return 'Sub2ApiAdminReplaceUserGroupResult(migratedKeys: $migratedKeys)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminReplaceUserGroupResultCopyWith<$Res>  {
  factory $Sub2ApiAdminReplaceUserGroupResultCopyWith(Sub2ApiAdminReplaceUserGroupResult value, $Res Function(Sub2ApiAdminReplaceUserGroupResult) _then) = _$Sub2ApiAdminReplaceUserGroupResultCopyWithImpl;
@useResult
$Res call({
 int migratedKeys
});




}
/// @nodoc
class _$Sub2ApiAdminReplaceUserGroupResultCopyWithImpl<$Res>
    implements $Sub2ApiAdminReplaceUserGroupResultCopyWith<$Res> {
  _$Sub2ApiAdminReplaceUserGroupResultCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminReplaceUserGroupResult _self;
  final $Res Function(Sub2ApiAdminReplaceUserGroupResult) _then;

/// Create a copy of Sub2ApiAdminReplaceUserGroupResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? migratedKeys = null,}) {
  return _then(_self.copyWith(
migratedKeys: null == migratedKeys ? _self.migratedKeys : migratedKeys // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminReplaceUserGroupResult].
extension Sub2ApiAdminReplaceUserGroupResultPatterns on Sub2ApiAdminReplaceUserGroupResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminReplaceUserGroupResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminReplaceUserGroupResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminReplaceUserGroupResult value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminReplaceUserGroupResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminReplaceUserGroupResult value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminReplaceUserGroupResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int migratedKeys)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminReplaceUserGroupResult() when $default != null:
return $default(_that.migratedKeys);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int migratedKeys)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminReplaceUserGroupResult():
return $default(_that.migratedKeys);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int migratedKeys)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminReplaceUserGroupResult() when $default != null:
return $default(_that.migratedKeys);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminReplaceUserGroupResult implements Sub2ApiAdminReplaceUserGroupResult {
  const _Sub2ApiAdminReplaceUserGroupResult({required this.migratedKeys});


@override final  int migratedKeys;

/// Create a copy of Sub2ApiAdminReplaceUserGroupResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminReplaceUserGroupResultCopyWith<_Sub2ApiAdminReplaceUserGroupResult> get copyWith => __$Sub2ApiAdminReplaceUserGroupResultCopyWithImpl<_Sub2ApiAdminReplaceUserGroupResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminReplaceUserGroupResult&&(identical(other.migratedKeys, migratedKeys) || other.migratedKeys == migratedKeys));
}


@override
int get hashCode => Object.hash(runtimeType,migratedKeys);

@override
String toString() {
  return 'Sub2ApiAdminReplaceUserGroupResult(migratedKeys: $migratedKeys)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminReplaceUserGroupResultCopyWith<$Res> implements $Sub2ApiAdminReplaceUserGroupResultCopyWith<$Res> {
  factory _$Sub2ApiAdminReplaceUserGroupResultCopyWith(_Sub2ApiAdminReplaceUserGroupResult value, $Res Function(_Sub2ApiAdminReplaceUserGroupResult) _then) = __$Sub2ApiAdminReplaceUserGroupResultCopyWithImpl;
@override @useResult
$Res call({
 int migratedKeys
});




}
/// @nodoc
class __$Sub2ApiAdminReplaceUserGroupResultCopyWithImpl<$Res>
    implements _$Sub2ApiAdminReplaceUserGroupResultCopyWith<$Res> {
  __$Sub2ApiAdminReplaceUserGroupResultCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminReplaceUserGroupResult _self;
  final $Res Function(_Sub2ApiAdminReplaceUserGroupResult) _then;

/// Create a copy of Sub2ApiAdminReplaceUserGroupResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? migratedKeys = null,}) {
  return _then(_Sub2ApiAdminReplaceUserGroupResult(
migratedKeys: null == migratedKeys ? _self.migratedKeys : migratedKeys // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUserGroupRpmStatus {

 int get groupId; String get groupName; int get used; int get limit; String get source;
/// Create a copy of Sub2ApiAdminUserGroupRpmStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUserGroupRpmStatusCopyWith<Sub2ApiAdminUserGroupRpmStatus> get copyWith => _$Sub2ApiAdminUserGroupRpmStatusCopyWithImpl<Sub2ApiAdminUserGroupRpmStatus>(this as Sub2ApiAdminUserGroupRpmStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUserGroupRpmStatus&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.used, used) || other.used == used)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,groupId,groupName,used,limit,source);

@override
String toString() {
  return 'Sub2ApiAdminUserGroupRpmStatus(groupId: $groupId, groupName: $groupName, used: $used, limit: $limit, source: $source)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUserGroupRpmStatusCopyWith<$Res>  {
  factory $Sub2ApiAdminUserGroupRpmStatusCopyWith(Sub2ApiAdminUserGroupRpmStatus value, $Res Function(Sub2ApiAdminUserGroupRpmStatus) _then) = _$Sub2ApiAdminUserGroupRpmStatusCopyWithImpl;
@useResult
$Res call({
 int groupId, String groupName, int used, int limit, String source
});




}
/// @nodoc
class _$Sub2ApiAdminUserGroupRpmStatusCopyWithImpl<$Res>
    implements $Sub2ApiAdminUserGroupRpmStatusCopyWith<$Res> {
  _$Sub2ApiAdminUserGroupRpmStatusCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUserGroupRpmStatus _self;
  final $Res Function(Sub2ApiAdminUserGroupRpmStatus) _then;

/// Create a copy of Sub2ApiAdminUserGroupRpmStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? groupName = null,Object? used = null,Object? limit = null,Object? source = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUserGroupRpmStatus].
extension Sub2ApiAdminUserGroupRpmStatusPatterns on Sub2ApiAdminUserGroupRpmStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserGroupRpmStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserGroupRpmStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserGroupRpmStatus value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserGroupRpmStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUserGroupRpmStatus value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserGroupRpmStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int groupId,  String groupName,  int used,  int limit,  String source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserGroupRpmStatus() when $default != null:
return $default(_that.groupId,_that.groupName,_that.used,_that.limit,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int groupId,  String groupName,  int used,  int limit,  String source)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserGroupRpmStatus():
return $default(_that.groupId,_that.groupName,_that.used,_that.limit,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int groupId,  String groupName,  int used,  int limit,  String source)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserGroupRpmStatus() when $default != null:
return $default(_that.groupId,_that.groupName,_that.used,_that.limit,_that.source);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUserGroupRpmStatus implements Sub2ApiAdminUserGroupRpmStatus {
  const _Sub2ApiAdminUserGroupRpmStatus({required this.groupId, required this.groupName, required this.used, required this.limit, required this.source});


@override final  int groupId;
@override final  String groupName;
@override final  int used;
@override final  int limit;
@override final  String source;

/// Create a copy of Sub2ApiAdminUserGroupRpmStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUserGroupRpmStatusCopyWith<_Sub2ApiAdminUserGroupRpmStatus> get copyWith => __$Sub2ApiAdminUserGroupRpmStatusCopyWithImpl<_Sub2ApiAdminUserGroupRpmStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUserGroupRpmStatus&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.used, used) || other.used == used)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,groupId,groupName,used,limit,source);

@override
String toString() {
  return 'Sub2ApiAdminUserGroupRpmStatus(groupId: $groupId, groupName: $groupName, used: $used, limit: $limit, source: $source)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUserGroupRpmStatusCopyWith<$Res> implements $Sub2ApiAdminUserGroupRpmStatusCopyWith<$Res> {
  factory _$Sub2ApiAdminUserGroupRpmStatusCopyWith(_Sub2ApiAdminUserGroupRpmStatus value, $Res Function(_Sub2ApiAdminUserGroupRpmStatus) _then) = __$Sub2ApiAdminUserGroupRpmStatusCopyWithImpl;
@override @useResult
$Res call({
 int groupId, String groupName, int used, int limit, String source
});




}
/// @nodoc
class __$Sub2ApiAdminUserGroupRpmStatusCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUserGroupRpmStatusCopyWith<$Res> {
  __$Sub2ApiAdminUserGroupRpmStatusCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUserGroupRpmStatus _self;
  final $Res Function(_Sub2ApiAdminUserGroupRpmStatus) _then;

/// Create a copy of Sub2ApiAdminUserGroupRpmStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? groupName = null,Object? used = null,Object? limit = null,Object? source = null,}) {
  return _then(_Sub2ApiAdminUserGroupRpmStatus(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUserRpmStatus {

 int get userRpmUsed; int get userRpmLimit; List<Sub2ApiAdminUserGroupRpmStatus> get perGroup;
/// Create a copy of Sub2ApiAdminUserRpmStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUserRpmStatusCopyWith<Sub2ApiAdminUserRpmStatus> get copyWith => _$Sub2ApiAdminUserRpmStatusCopyWithImpl<Sub2ApiAdminUserRpmStatus>(this as Sub2ApiAdminUserRpmStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUserRpmStatus&&(identical(other.userRpmUsed, userRpmUsed) || other.userRpmUsed == userRpmUsed)&&(identical(other.userRpmLimit, userRpmLimit) || other.userRpmLimit == userRpmLimit)&&const DeepCollectionEquality().equals(other.perGroup, perGroup));
}


@override
int get hashCode => Object.hash(runtimeType,userRpmUsed,userRpmLimit,const DeepCollectionEquality().hash(perGroup));

@override
String toString() {
  return 'Sub2ApiAdminUserRpmStatus(userRpmUsed: $userRpmUsed, userRpmLimit: $userRpmLimit, perGroup: $perGroup)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUserRpmStatusCopyWith<$Res>  {
  factory $Sub2ApiAdminUserRpmStatusCopyWith(Sub2ApiAdminUserRpmStatus value, $Res Function(Sub2ApiAdminUserRpmStatus) _then) = _$Sub2ApiAdminUserRpmStatusCopyWithImpl;
@useResult
$Res call({
 int userRpmUsed, int userRpmLimit, List<Sub2ApiAdminUserGroupRpmStatus> perGroup
});




}
/// @nodoc
class _$Sub2ApiAdminUserRpmStatusCopyWithImpl<$Res>
    implements $Sub2ApiAdminUserRpmStatusCopyWith<$Res> {
  _$Sub2ApiAdminUserRpmStatusCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUserRpmStatus _self;
  final $Res Function(Sub2ApiAdminUserRpmStatus) _then;

/// Create a copy of Sub2ApiAdminUserRpmStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userRpmUsed = null,Object? userRpmLimit = null,Object? perGroup = null,}) {
  return _then(_self.copyWith(
userRpmUsed: null == userRpmUsed ? _self.userRpmUsed : userRpmUsed // ignore: cast_nullable_to_non_nullable
as int,userRpmLimit: null == userRpmLimit ? _self.userRpmLimit : userRpmLimit // ignore: cast_nullable_to_non_nullable
as int,perGroup: null == perGroup ? _self.perGroup : perGroup // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminUserGroupRpmStatus>,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUserRpmStatus].
extension Sub2ApiAdminUserRpmStatusPatterns on Sub2ApiAdminUserRpmStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserRpmStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserRpmStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserRpmStatus value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserRpmStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUserRpmStatus value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserRpmStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userRpmUsed,  int userRpmLimit,  List<Sub2ApiAdminUserGroupRpmStatus> perGroup)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserRpmStatus() when $default != null:
return $default(_that.userRpmUsed,_that.userRpmLimit,_that.perGroup);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userRpmUsed,  int userRpmLimit,  List<Sub2ApiAdminUserGroupRpmStatus> perGroup)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserRpmStatus():
return $default(_that.userRpmUsed,_that.userRpmLimit,_that.perGroup);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userRpmUsed,  int userRpmLimit,  List<Sub2ApiAdminUserGroupRpmStatus> perGroup)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserRpmStatus() when $default != null:
return $default(_that.userRpmUsed,_that.userRpmLimit,_that.perGroup);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUserRpmStatus implements Sub2ApiAdminUserRpmStatus {
  const _Sub2ApiAdminUserRpmStatus({required this.userRpmUsed, required this.userRpmLimit, required final  List<Sub2ApiAdminUserGroupRpmStatus> perGroup}): _perGroup = perGroup;


@override final  int userRpmUsed;
@override final  int userRpmLimit;
 final  List<Sub2ApiAdminUserGroupRpmStatus> _perGroup;
@override List<Sub2ApiAdminUserGroupRpmStatus> get perGroup {
  if (_perGroup is EqualUnmodifiableListView) return _perGroup;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_perGroup);
}


/// Create a copy of Sub2ApiAdminUserRpmStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUserRpmStatusCopyWith<_Sub2ApiAdminUserRpmStatus> get copyWith => __$Sub2ApiAdminUserRpmStatusCopyWithImpl<_Sub2ApiAdminUserRpmStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUserRpmStatus&&(identical(other.userRpmUsed, userRpmUsed) || other.userRpmUsed == userRpmUsed)&&(identical(other.userRpmLimit, userRpmLimit) || other.userRpmLimit == userRpmLimit)&&const DeepCollectionEquality().equals(other._perGroup, _perGroup));
}


@override
int get hashCode => Object.hash(runtimeType,userRpmUsed,userRpmLimit,const DeepCollectionEquality().hash(_perGroup));

@override
String toString() {
  return 'Sub2ApiAdminUserRpmStatus(userRpmUsed: $userRpmUsed, userRpmLimit: $userRpmLimit, perGroup: $perGroup)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUserRpmStatusCopyWith<$Res> implements $Sub2ApiAdminUserRpmStatusCopyWith<$Res> {
  factory _$Sub2ApiAdminUserRpmStatusCopyWith(_Sub2ApiAdminUserRpmStatus value, $Res Function(_Sub2ApiAdminUserRpmStatus) _then) = __$Sub2ApiAdminUserRpmStatusCopyWithImpl;
@override @useResult
$Res call({
 int userRpmUsed, int userRpmLimit, List<Sub2ApiAdminUserGroupRpmStatus> perGroup
});




}
/// @nodoc
class __$Sub2ApiAdminUserRpmStatusCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUserRpmStatusCopyWith<$Res> {
  __$Sub2ApiAdminUserRpmStatusCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUserRpmStatus _self;
  final $Res Function(_Sub2ApiAdminUserRpmStatus) _then;

/// Create a copy of Sub2ApiAdminUserRpmStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userRpmUsed = null,Object? userRpmLimit = null,Object? perGroup = null,}) {
  return _then(_Sub2ApiAdminUserRpmStatus(
userRpmUsed: null == userRpmUsed ? _self.userRpmUsed : userRpmUsed // ignore: cast_nullable_to_non_nullable
as int,userRpmLimit: null == userRpmLimit ? _self.userRpmLimit : userRpmLimit // ignore: cast_nullable_to_non_nullable
as int,perGroup: null == perGroup ? _self._perGroup : perGroup // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminUserGroupRpmStatus>,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminAffectedUsersResult {

 int get affected;
/// Create a copy of Sub2ApiAdminAffectedUsersResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminAffectedUsersResultCopyWith<Sub2ApiAdminAffectedUsersResult> get copyWith => _$Sub2ApiAdminAffectedUsersResultCopyWithImpl<Sub2ApiAdminAffectedUsersResult>(this as Sub2ApiAdminAffectedUsersResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminAffectedUsersResult&&(identical(other.affected, affected) || other.affected == affected));
}


@override
int get hashCode => Object.hash(runtimeType,affected);

@override
String toString() {
  return 'Sub2ApiAdminAffectedUsersResult(affected: $affected)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminAffectedUsersResultCopyWith<$Res>  {
  factory $Sub2ApiAdminAffectedUsersResultCopyWith(Sub2ApiAdminAffectedUsersResult value, $Res Function(Sub2ApiAdminAffectedUsersResult) _then) = _$Sub2ApiAdminAffectedUsersResultCopyWithImpl;
@useResult
$Res call({
 int affected
});




}
/// @nodoc
class _$Sub2ApiAdminAffectedUsersResultCopyWithImpl<$Res>
    implements $Sub2ApiAdminAffectedUsersResultCopyWith<$Res> {
  _$Sub2ApiAdminAffectedUsersResultCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminAffectedUsersResult _self;
  final $Res Function(Sub2ApiAdminAffectedUsersResult) _then;

/// Create a copy of Sub2ApiAdminAffectedUsersResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? affected = null,}) {
  return _then(_self.copyWith(
affected: null == affected ? _self.affected : affected // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminAffectedUsersResult].
extension Sub2ApiAdminAffectedUsersResultPatterns on Sub2ApiAdminAffectedUsersResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminAffectedUsersResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminAffectedUsersResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminAffectedUsersResult value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminAffectedUsersResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminAffectedUsersResult value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminAffectedUsersResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int affected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminAffectedUsersResult() when $default != null:
return $default(_that.affected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int affected)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminAffectedUsersResult():
return $default(_that.affected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int affected)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminAffectedUsersResult() when $default != null:
return $default(_that.affected);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminAffectedUsersResult implements Sub2ApiAdminAffectedUsersResult {
  const _Sub2ApiAdminAffectedUsersResult({required this.affected});


@override final  int affected;

/// Create a copy of Sub2ApiAdminAffectedUsersResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminAffectedUsersResultCopyWith<_Sub2ApiAdminAffectedUsersResult> get copyWith => __$Sub2ApiAdminAffectedUsersResultCopyWithImpl<_Sub2ApiAdminAffectedUsersResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminAffectedUsersResult&&(identical(other.affected, affected) || other.affected == affected));
}


@override
int get hashCode => Object.hash(runtimeType,affected);

@override
String toString() {
  return 'Sub2ApiAdminAffectedUsersResult(affected: $affected)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminAffectedUsersResultCopyWith<$Res> implements $Sub2ApiAdminAffectedUsersResultCopyWith<$Res> {
  factory _$Sub2ApiAdminAffectedUsersResultCopyWith(_Sub2ApiAdminAffectedUsersResult value, $Res Function(_Sub2ApiAdminAffectedUsersResult) _then) = __$Sub2ApiAdminAffectedUsersResultCopyWithImpl;
@override @useResult
$Res call({
 int affected
});




}
/// @nodoc
class __$Sub2ApiAdminAffectedUsersResultCopyWithImpl<$Res>
    implements _$Sub2ApiAdminAffectedUsersResultCopyWith<$Res> {
  __$Sub2ApiAdminAffectedUsersResultCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminAffectedUsersResult _self;
  final $Res Function(_Sub2ApiAdminAffectedUsersResult) _then;

/// Create a copy of Sub2ApiAdminAffectedUsersResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? affected = null,}) {
  return _then(_Sub2ApiAdminAffectedUsersResult(
affected: null == affected ? _self.affected : affected // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUserPlatformQuota {

 Sub2ApiAdminQuotaPlatform get platform; Sub2ApiDecimal get dailyUsageUsd; Sub2ApiDecimal? get dailyLimitUsd; DateTime? get dailyWindowResetsAt; DateTime? get dailyWindowStart; Sub2ApiDecimal get weeklyUsageUsd; Sub2ApiDecimal? get weeklyLimitUsd; DateTime? get weeklyWindowResetsAt; DateTime? get weeklyWindowStart; Sub2ApiDecimal get monthlyUsageUsd; Sub2ApiDecimal? get monthlyLimitUsd; DateTime? get monthlyWindowResetsAt; DateTime? get monthlyWindowStart;
/// Create a copy of Sub2ApiAdminUserPlatformQuota
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUserPlatformQuotaCopyWith<Sub2ApiAdminUserPlatformQuota> get copyWith => _$Sub2ApiAdminUserPlatformQuotaCopyWithImpl<Sub2ApiAdminUserPlatformQuota>(this as Sub2ApiAdminUserPlatformQuota, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUserPlatformQuota&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.dailyUsageUsd, dailyUsageUsd) || other.dailyUsageUsd == dailyUsageUsd)&&(identical(other.dailyLimitUsd, dailyLimitUsd) || other.dailyLimitUsd == dailyLimitUsd)&&(identical(other.dailyWindowResetsAt, dailyWindowResetsAt) || other.dailyWindowResetsAt == dailyWindowResetsAt)&&(identical(other.dailyWindowStart, dailyWindowStart) || other.dailyWindowStart == dailyWindowStart)&&(identical(other.weeklyUsageUsd, weeklyUsageUsd) || other.weeklyUsageUsd == weeklyUsageUsd)&&(identical(other.weeklyLimitUsd, weeklyLimitUsd) || other.weeklyLimitUsd == weeklyLimitUsd)&&(identical(other.weeklyWindowResetsAt, weeklyWindowResetsAt) || other.weeklyWindowResetsAt == weeklyWindowResetsAt)&&(identical(other.weeklyWindowStart, weeklyWindowStart) || other.weeklyWindowStart == weeklyWindowStart)&&(identical(other.monthlyUsageUsd, monthlyUsageUsd) || other.monthlyUsageUsd == monthlyUsageUsd)&&(identical(other.monthlyLimitUsd, monthlyLimitUsd) || other.monthlyLimitUsd == monthlyLimitUsd)&&(identical(other.monthlyWindowResetsAt, monthlyWindowResetsAt) || other.monthlyWindowResetsAt == monthlyWindowResetsAt)&&(identical(other.monthlyWindowStart, monthlyWindowStart) || other.monthlyWindowStart == monthlyWindowStart));
}


@override
int get hashCode => Object.hash(runtimeType,platform,dailyUsageUsd,dailyLimitUsd,dailyWindowResetsAt,dailyWindowStart,weeklyUsageUsd,weeklyLimitUsd,weeklyWindowResetsAt,weeklyWindowStart,monthlyUsageUsd,monthlyLimitUsd,monthlyWindowResetsAt,monthlyWindowStart);

@override
String toString() {
  return 'Sub2ApiAdminUserPlatformQuota(platform: $platform, dailyUsageUsd: $dailyUsageUsd, dailyLimitUsd: $dailyLimitUsd, dailyWindowResetsAt: $dailyWindowResetsAt, dailyWindowStart: $dailyWindowStart, weeklyUsageUsd: $weeklyUsageUsd, weeklyLimitUsd: $weeklyLimitUsd, weeklyWindowResetsAt: $weeklyWindowResetsAt, weeklyWindowStart: $weeklyWindowStart, monthlyUsageUsd: $monthlyUsageUsd, monthlyLimitUsd: $monthlyLimitUsd, monthlyWindowResetsAt: $monthlyWindowResetsAt, monthlyWindowStart: $monthlyWindowStart)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUserPlatformQuotaCopyWith<$Res>  {
  factory $Sub2ApiAdminUserPlatformQuotaCopyWith(Sub2ApiAdminUserPlatformQuota value, $Res Function(Sub2ApiAdminUserPlatformQuota) _then) = _$Sub2ApiAdminUserPlatformQuotaCopyWithImpl;
@useResult
$Res call({
 Sub2ApiAdminQuotaPlatform platform, Sub2ApiDecimal dailyUsageUsd, Sub2ApiDecimal? dailyLimitUsd, DateTime? dailyWindowResetsAt, DateTime? dailyWindowStart, Sub2ApiDecimal weeklyUsageUsd, Sub2ApiDecimal? weeklyLimitUsd, DateTime? weeklyWindowResetsAt, DateTime? weeklyWindowStart, Sub2ApiDecimal monthlyUsageUsd, Sub2ApiDecimal? monthlyLimitUsd, DateTime? monthlyWindowResetsAt, DateTime? monthlyWindowStart
});




}
/// @nodoc
class _$Sub2ApiAdminUserPlatformQuotaCopyWithImpl<$Res>
    implements $Sub2ApiAdminUserPlatformQuotaCopyWith<$Res> {
  _$Sub2ApiAdminUserPlatformQuotaCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUserPlatformQuota _self;
  final $Res Function(Sub2ApiAdminUserPlatformQuota) _then;

/// Create a copy of Sub2ApiAdminUserPlatformQuota
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platform = null,Object? dailyUsageUsd = null,Object? dailyLimitUsd = freezed,Object? dailyWindowResetsAt = freezed,Object? dailyWindowStart = freezed,Object? weeklyUsageUsd = null,Object? weeklyLimitUsd = freezed,Object? weeklyWindowResetsAt = freezed,Object? weeklyWindowStart = freezed,Object? monthlyUsageUsd = null,Object? monthlyLimitUsd = freezed,Object? monthlyWindowResetsAt = freezed,Object? monthlyWindowStart = freezed,}) {
  return _then(_self.copyWith(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminQuotaPlatform,dailyUsageUsd: null == dailyUsageUsd ? _self.dailyUsageUsd : dailyUsageUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,dailyLimitUsd: freezed == dailyLimitUsd ? _self.dailyLimitUsd : dailyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,dailyWindowResetsAt: freezed == dailyWindowResetsAt ? _self.dailyWindowResetsAt : dailyWindowResetsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dailyWindowStart: freezed == dailyWindowStart ? _self.dailyWindowStart : dailyWindowStart // ignore: cast_nullable_to_non_nullable
as DateTime?,weeklyUsageUsd: null == weeklyUsageUsd ? _self.weeklyUsageUsd : weeklyUsageUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,weeklyLimitUsd: freezed == weeklyLimitUsd ? _self.weeklyLimitUsd : weeklyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,weeklyWindowResetsAt: freezed == weeklyWindowResetsAt ? _self.weeklyWindowResetsAt : weeklyWindowResetsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,weeklyWindowStart: freezed == weeklyWindowStart ? _self.weeklyWindowStart : weeklyWindowStart // ignore: cast_nullable_to_non_nullable
as DateTime?,monthlyUsageUsd: null == monthlyUsageUsd ? _self.monthlyUsageUsd : monthlyUsageUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,monthlyLimitUsd: freezed == monthlyLimitUsd ? _self.monthlyLimitUsd : monthlyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,monthlyWindowResetsAt: freezed == monthlyWindowResetsAt ? _self.monthlyWindowResetsAt : monthlyWindowResetsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,monthlyWindowStart: freezed == monthlyWindowStart ? _self.monthlyWindowStart : monthlyWindowStart // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUserPlatformQuota].
extension Sub2ApiAdminUserPlatformQuotaPatterns on Sub2ApiAdminUserPlatformQuota {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserPlatformQuota value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserPlatformQuota() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserPlatformQuota value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserPlatformQuota():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUserPlatformQuota value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserPlatformQuota() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiAdminQuotaPlatform platform,  Sub2ApiDecimal dailyUsageUsd,  Sub2ApiDecimal? dailyLimitUsd,  DateTime? dailyWindowResetsAt,  DateTime? dailyWindowStart,  Sub2ApiDecimal weeklyUsageUsd,  Sub2ApiDecimal? weeklyLimitUsd,  DateTime? weeklyWindowResetsAt,  DateTime? weeklyWindowStart,  Sub2ApiDecimal monthlyUsageUsd,  Sub2ApiDecimal? monthlyLimitUsd,  DateTime? monthlyWindowResetsAt,  DateTime? monthlyWindowStart)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserPlatformQuota() when $default != null:
return $default(_that.platform,_that.dailyUsageUsd,_that.dailyLimitUsd,_that.dailyWindowResetsAt,_that.dailyWindowStart,_that.weeklyUsageUsd,_that.weeklyLimitUsd,_that.weeklyWindowResetsAt,_that.weeklyWindowStart,_that.monthlyUsageUsd,_that.monthlyLimitUsd,_that.monthlyWindowResetsAt,_that.monthlyWindowStart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiAdminQuotaPlatform platform,  Sub2ApiDecimal dailyUsageUsd,  Sub2ApiDecimal? dailyLimitUsd,  DateTime? dailyWindowResetsAt,  DateTime? dailyWindowStart,  Sub2ApiDecimal weeklyUsageUsd,  Sub2ApiDecimal? weeklyLimitUsd,  DateTime? weeklyWindowResetsAt,  DateTime? weeklyWindowStart,  Sub2ApiDecimal monthlyUsageUsd,  Sub2ApiDecimal? monthlyLimitUsd,  DateTime? monthlyWindowResetsAt,  DateTime? monthlyWindowStart)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserPlatformQuota():
return $default(_that.platform,_that.dailyUsageUsd,_that.dailyLimitUsd,_that.dailyWindowResetsAt,_that.dailyWindowStart,_that.weeklyUsageUsd,_that.weeklyLimitUsd,_that.weeklyWindowResetsAt,_that.weeklyWindowStart,_that.monthlyUsageUsd,_that.monthlyLimitUsd,_that.monthlyWindowResetsAt,_that.monthlyWindowStart);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiAdminQuotaPlatform platform,  Sub2ApiDecimal dailyUsageUsd,  Sub2ApiDecimal? dailyLimitUsd,  DateTime? dailyWindowResetsAt,  DateTime? dailyWindowStart,  Sub2ApiDecimal weeklyUsageUsd,  Sub2ApiDecimal? weeklyLimitUsd,  DateTime? weeklyWindowResetsAt,  DateTime? weeklyWindowStart,  Sub2ApiDecimal monthlyUsageUsd,  Sub2ApiDecimal? monthlyLimitUsd,  DateTime? monthlyWindowResetsAt,  DateTime? monthlyWindowStart)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserPlatformQuota() when $default != null:
return $default(_that.platform,_that.dailyUsageUsd,_that.dailyLimitUsd,_that.dailyWindowResetsAt,_that.dailyWindowStart,_that.weeklyUsageUsd,_that.weeklyLimitUsd,_that.weeklyWindowResetsAt,_that.weeklyWindowStart,_that.monthlyUsageUsd,_that.monthlyLimitUsd,_that.monthlyWindowResetsAt,_that.monthlyWindowStart);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUserPlatformQuota implements Sub2ApiAdminUserPlatformQuota {
  const _Sub2ApiAdminUserPlatformQuota({required this.platform, required this.dailyUsageUsd, this.dailyLimitUsd, this.dailyWindowResetsAt, this.dailyWindowStart, required this.weeklyUsageUsd, this.weeklyLimitUsd, this.weeklyWindowResetsAt, this.weeklyWindowStart, required this.monthlyUsageUsd, this.monthlyLimitUsd, this.monthlyWindowResetsAt, this.monthlyWindowStart});


@override final  Sub2ApiAdminQuotaPlatform platform;
@override final  Sub2ApiDecimal dailyUsageUsd;
@override final  Sub2ApiDecimal? dailyLimitUsd;
@override final  DateTime? dailyWindowResetsAt;
@override final  DateTime? dailyWindowStart;
@override final  Sub2ApiDecimal weeklyUsageUsd;
@override final  Sub2ApiDecimal? weeklyLimitUsd;
@override final  DateTime? weeklyWindowResetsAt;
@override final  DateTime? weeklyWindowStart;
@override final  Sub2ApiDecimal monthlyUsageUsd;
@override final  Sub2ApiDecimal? monthlyLimitUsd;
@override final  DateTime? monthlyWindowResetsAt;
@override final  DateTime? monthlyWindowStart;

/// Create a copy of Sub2ApiAdminUserPlatformQuota
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUserPlatformQuotaCopyWith<_Sub2ApiAdminUserPlatformQuota> get copyWith => __$Sub2ApiAdminUserPlatformQuotaCopyWithImpl<_Sub2ApiAdminUserPlatformQuota>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUserPlatformQuota&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.dailyUsageUsd, dailyUsageUsd) || other.dailyUsageUsd == dailyUsageUsd)&&(identical(other.dailyLimitUsd, dailyLimitUsd) || other.dailyLimitUsd == dailyLimitUsd)&&(identical(other.dailyWindowResetsAt, dailyWindowResetsAt) || other.dailyWindowResetsAt == dailyWindowResetsAt)&&(identical(other.dailyWindowStart, dailyWindowStart) || other.dailyWindowStart == dailyWindowStart)&&(identical(other.weeklyUsageUsd, weeklyUsageUsd) || other.weeklyUsageUsd == weeklyUsageUsd)&&(identical(other.weeklyLimitUsd, weeklyLimitUsd) || other.weeklyLimitUsd == weeklyLimitUsd)&&(identical(other.weeklyWindowResetsAt, weeklyWindowResetsAt) || other.weeklyWindowResetsAt == weeklyWindowResetsAt)&&(identical(other.weeklyWindowStart, weeklyWindowStart) || other.weeklyWindowStart == weeklyWindowStart)&&(identical(other.monthlyUsageUsd, monthlyUsageUsd) || other.monthlyUsageUsd == monthlyUsageUsd)&&(identical(other.monthlyLimitUsd, monthlyLimitUsd) || other.monthlyLimitUsd == monthlyLimitUsd)&&(identical(other.monthlyWindowResetsAt, monthlyWindowResetsAt) || other.monthlyWindowResetsAt == monthlyWindowResetsAt)&&(identical(other.monthlyWindowStart, monthlyWindowStart) || other.monthlyWindowStart == monthlyWindowStart));
}


@override
int get hashCode => Object.hash(runtimeType,platform,dailyUsageUsd,dailyLimitUsd,dailyWindowResetsAt,dailyWindowStart,weeklyUsageUsd,weeklyLimitUsd,weeklyWindowResetsAt,weeklyWindowStart,monthlyUsageUsd,monthlyLimitUsd,monthlyWindowResetsAt,monthlyWindowStart);

@override
String toString() {
  return 'Sub2ApiAdminUserPlatformQuota(platform: $platform, dailyUsageUsd: $dailyUsageUsd, dailyLimitUsd: $dailyLimitUsd, dailyWindowResetsAt: $dailyWindowResetsAt, dailyWindowStart: $dailyWindowStart, weeklyUsageUsd: $weeklyUsageUsd, weeklyLimitUsd: $weeklyLimitUsd, weeklyWindowResetsAt: $weeklyWindowResetsAt, weeklyWindowStart: $weeklyWindowStart, monthlyUsageUsd: $monthlyUsageUsd, monthlyLimitUsd: $monthlyLimitUsd, monthlyWindowResetsAt: $monthlyWindowResetsAt, monthlyWindowStart: $monthlyWindowStart)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUserPlatformQuotaCopyWith<$Res> implements $Sub2ApiAdminUserPlatformQuotaCopyWith<$Res> {
  factory _$Sub2ApiAdminUserPlatformQuotaCopyWith(_Sub2ApiAdminUserPlatformQuota value, $Res Function(_Sub2ApiAdminUserPlatformQuota) _then) = __$Sub2ApiAdminUserPlatformQuotaCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiAdminQuotaPlatform platform, Sub2ApiDecimal dailyUsageUsd, Sub2ApiDecimal? dailyLimitUsd, DateTime? dailyWindowResetsAt, DateTime? dailyWindowStart, Sub2ApiDecimal weeklyUsageUsd, Sub2ApiDecimal? weeklyLimitUsd, DateTime? weeklyWindowResetsAt, DateTime? weeklyWindowStart, Sub2ApiDecimal monthlyUsageUsd, Sub2ApiDecimal? monthlyLimitUsd, DateTime? monthlyWindowResetsAt, DateTime? monthlyWindowStart
});




}
/// @nodoc
class __$Sub2ApiAdminUserPlatformQuotaCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUserPlatformQuotaCopyWith<$Res> {
  __$Sub2ApiAdminUserPlatformQuotaCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUserPlatformQuota _self;
  final $Res Function(_Sub2ApiAdminUserPlatformQuota) _then;

/// Create a copy of Sub2ApiAdminUserPlatformQuota
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platform = null,Object? dailyUsageUsd = null,Object? dailyLimitUsd = freezed,Object? dailyWindowResetsAt = freezed,Object? dailyWindowStart = freezed,Object? weeklyUsageUsd = null,Object? weeklyLimitUsd = freezed,Object? weeklyWindowResetsAt = freezed,Object? weeklyWindowStart = freezed,Object? monthlyUsageUsd = null,Object? monthlyLimitUsd = freezed,Object? monthlyWindowResetsAt = freezed,Object? monthlyWindowStart = freezed,}) {
  return _then(_Sub2ApiAdminUserPlatformQuota(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as Sub2ApiAdminQuotaPlatform,dailyUsageUsd: null == dailyUsageUsd ? _self.dailyUsageUsd : dailyUsageUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,dailyLimitUsd: freezed == dailyLimitUsd ? _self.dailyLimitUsd : dailyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,dailyWindowResetsAt: freezed == dailyWindowResetsAt ? _self.dailyWindowResetsAt : dailyWindowResetsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dailyWindowStart: freezed == dailyWindowStart ? _self.dailyWindowStart : dailyWindowStart // ignore: cast_nullable_to_non_nullable
as DateTime?,weeklyUsageUsd: null == weeklyUsageUsd ? _self.weeklyUsageUsd : weeklyUsageUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,weeklyLimitUsd: freezed == weeklyLimitUsd ? _self.weeklyLimitUsd : weeklyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,weeklyWindowResetsAt: freezed == weeklyWindowResetsAt ? _self.weeklyWindowResetsAt : weeklyWindowResetsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,weeklyWindowStart: freezed == weeklyWindowStart ? _self.weeklyWindowStart : weeklyWindowStart // ignore: cast_nullable_to_non_nullable
as DateTime?,monthlyUsageUsd: null == monthlyUsageUsd ? _self.monthlyUsageUsd : monthlyUsageUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,monthlyLimitUsd: freezed == monthlyLimitUsd ? _self.monthlyLimitUsd : monthlyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,monthlyWindowResetsAt: freezed == monthlyWindowResetsAt ? _self.monthlyWindowResetsAt : monthlyWindowResetsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,monthlyWindowStart: freezed == monthlyWindowStart ? _self.monthlyWindowStart : monthlyWindowStart // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUserPlatformQuotas {

 List<Sub2ApiAdminUserPlatformQuota> get quotas;
/// Create a copy of Sub2ApiAdminUserPlatformQuotas
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUserPlatformQuotasCopyWith<Sub2ApiAdminUserPlatformQuotas> get copyWith => _$Sub2ApiAdminUserPlatformQuotasCopyWithImpl<Sub2ApiAdminUserPlatformQuotas>(this as Sub2ApiAdminUserPlatformQuotas, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUserPlatformQuotas&&const DeepCollectionEquality().equals(other.quotas, quotas));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(quotas));

@override
String toString() {
  return 'Sub2ApiAdminUserPlatformQuotas(quotas: $quotas)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUserPlatformQuotasCopyWith<$Res>  {
  factory $Sub2ApiAdminUserPlatformQuotasCopyWith(Sub2ApiAdminUserPlatformQuotas value, $Res Function(Sub2ApiAdminUserPlatformQuotas) _then) = _$Sub2ApiAdminUserPlatformQuotasCopyWithImpl;
@useResult
$Res call({
 List<Sub2ApiAdminUserPlatformQuota> quotas
});




}
/// @nodoc
class _$Sub2ApiAdminUserPlatformQuotasCopyWithImpl<$Res>
    implements $Sub2ApiAdminUserPlatformQuotasCopyWith<$Res> {
  _$Sub2ApiAdminUserPlatformQuotasCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUserPlatformQuotas _self;
  final $Res Function(Sub2ApiAdminUserPlatformQuotas) _then;

/// Create a copy of Sub2ApiAdminUserPlatformQuotas
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quotas = null,}) {
  return _then(_self.copyWith(
quotas: null == quotas ? _self.quotas : quotas // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminUserPlatformQuota>,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUserPlatformQuotas].
extension Sub2ApiAdminUserPlatformQuotasPatterns on Sub2ApiAdminUserPlatformQuotas {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserPlatformQuotas value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserPlatformQuotas() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserPlatformQuotas value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserPlatformQuotas():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUserPlatformQuotas value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserPlatformQuotas() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Sub2ApiAdminUserPlatformQuota> quotas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserPlatformQuotas() when $default != null:
return $default(_that.quotas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Sub2ApiAdminUserPlatformQuota> quotas)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserPlatformQuotas():
return $default(_that.quotas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Sub2ApiAdminUserPlatformQuota> quotas)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserPlatformQuotas() when $default != null:
return $default(_that.quotas);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUserPlatformQuotas implements Sub2ApiAdminUserPlatformQuotas {
  const _Sub2ApiAdminUserPlatformQuotas({required final  List<Sub2ApiAdminUserPlatformQuota> quotas}): _quotas = quotas;


 final  List<Sub2ApiAdminUserPlatformQuota> _quotas;
@override List<Sub2ApiAdminUserPlatformQuota> get quotas {
  if (_quotas is EqualUnmodifiableListView) return _quotas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quotas);
}


/// Create a copy of Sub2ApiAdminUserPlatformQuotas
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUserPlatformQuotasCopyWith<_Sub2ApiAdminUserPlatformQuotas> get copyWith => __$Sub2ApiAdminUserPlatformQuotasCopyWithImpl<_Sub2ApiAdminUserPlatformQuotas>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUserPlatformQuotas&&const DeepCollectionEquality().equals(other._quotas, _quotas));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_quotas));

@override
String toString() {
  return 'Sub2ApiAdminUserPlatformQuotas(quotas: $quotas)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUserPlatformQuotasCopyWith<$Res> implements $Sub2ApiAdminUserPlatformQuotasCopyWith<$Res> {
  factory _$Sub2ApiAdminUserPlatformQuotasCopyWith(_Sub2ApiAdminUserPlatformQuotas value, $Res Function(_Sub2ApiAdminUserPlatformQuotas) _then) = __$Sub2ApiAdminUserPlatformQuotasCopyWithImpl;
@override @useResult
$Res call({
 List<Sub2ApiAdminUserPlatformQuota> quotas
});




}
/// @nodoc
class __$Sub2ApiAdminUserPlatformQuotasCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUserPlatformQuotasCopyWith<$Res> {
  __$Sub2ApiAdminUserPlatformQuotasCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUserPlatformQuotas _self;
  final $Res Function(_Sub2ApiAdminUserPlatformQuotas) _then;

/// Create a copy of Sub2ApiAdminUserPlatformQuotas
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quotas = null,}) {
  return _then(_Sub2ApiAdminUserPlatformQuotas(
quotas: null == quotas ? _self._quotas : quotas // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAdminUserPlatformQuota>,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAdminUserAttributeValue {

 int get id; int get userId; int get attributeId; String get value; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Sub2ApiAdminUserAttributeValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAdminUserAttributeValueCopyWith<Sub2ApiAdminUserAttributeValue> get copyWith => _$Sub2ApiAdminUserAttributeValueCopyWithImpl<Sub2ApiAdminUserAttributeValue>(this as Sub2ApiAdminUserAttributeValue, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAdminUserAttributeValue&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.attributeId, attributeId) || other.attributeId == attributeId)&&(identical(other.value, value) || other.value == value)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,attributeId,value,createdAt,updatedAt);

@override
String toString() {
  return 'Sub2ApiAdminUserAttributeValue(id: $id, userId: $userId, attributeId: $attributeId, value: $value, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAdminUserAttributeValueCopyWith<$Res>  {
  factory $Sub2ApiAdminUserAttributeValueCopyWith(Sub2ApiAdminUserAttributeValue value, $Res Function(Sub2ApiAdminUserAttributeValue) _then) = _$Sub2ApiAdminUserAttributeValueCopyWithImpl;
@useResult
$Res call({
 int id, int userId, int attributeId, String value, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$Sub2ApiAdminUserAttributeValueCopyWithImpl<$Res>
    implements $Sub2ApiAdminUserAttributeValueCopyWith<$Res> {
  _$Sub2ApiAdminUserAttributeValueCopyWithImpl(this._self, this._then);

  final Sub2ApiAdminUserAttributeValue _self;
  final $Res Function(Sub2ApiAdminUserAttributeValue) _then;

/// Create a copy of Sub2ApiAdminUserAttributeValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? attributeId = null,Object? value = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,attributeId: null == attributeId ? _self.attributeId : attributeId // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAdminUserAttributeValue].
extension Sub2ApiAdminUserAttributeValuePatterns on Sub2ApiAdminUserAttributeValue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserAttributeValue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserAttributeValue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAdminUserAttributeValue value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserAttributeValue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAdminUserAttributeValue value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAdminUserAttributeValue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userId,  int attributeId,  String value,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserAttributeValue() when $default != null:
return $default(_that.id,_that.userId,_that.attributeId,_that.value,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userId,  int attributeId,  String value,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserAttributeValue():
return $default(_that.id,_that.userId,_that.attributeId,_that.value,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userId,  int attributeId,  String value,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAdminUserAttributeValue() when $default != null:
return $default(_that.id,_that.userId,_that.attributeId,_that.value,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAdminUserAttributeValue implements Sub2ApiAdminUserAttributeValue {
  const _Sub2ApiAdminUserAttributeValue({required this.id, required this.userId, required this.attributeId, required this.value, required this.createdAt, required this.updatedAt});


@override final  int id;
@override final  int userId;
@override final  int attributeId;
@override final  String value;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Sub2ApiAdminUserAttributeValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAdminUserAttributeValueCopyWith<_Sub2ApiAdminUserAttributeValue> get copyWith => __$Sub2ApiAdminUserAttributeValueCopyWithImpl<_Sub2ApiAdminUserAttributeValue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAdminUserAttributeValue&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.attributeId, attributeId) || other.attributeId == attributeId)&&(identical(other.value, value) || other.value == value)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,attributeId,value,createdAt,updatedAt);

@override
String toString() {
  return 'Sub2ApiAdminUserAttributeValue(id: $id, userId: $userId, attributeId: $attributeId, value: $value, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAdminUserAttributeValueCopyWith<$Res> implements $Sub2ApiAdminUserAttributeValueCopyWith<$Res> {
  factory _$Sub2ApiAdminUserAttributeValueCopyWith(_Sub2ApiAdminUserAttributeValue value, $Res Function(_Sub2ApiAdminUserAttributeValue) _then) = __$Sub2ApiAdminUserAttributeValueCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, int attributeId, String value, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$Sub2ApiAdminUserAttributeValueCopyWithImpl<$Res>
    implements _$Sub2ApiAdminUserAttributeValueCopyWith<$Res> {
  __$Sub2ApiAdminUserAttributeValueCopyWithImpl(this._self, this._then);

  final _Sub2ApiAdminUserAttributeValue _self;
  final $Res Function(_Sub2ApiAdminUserAttributeValue) _then;

/// Create a copy of Sub2ApiAdminUserAttributeValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? attributeId = null,Object? value = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Sub2ApiAdminUserAttributeValue(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,attributeId: null == attributeId ? _self.attributeId : attributeId // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
