// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_totp_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sub2ApiTotpStatus {

 bool get enabled; bool get featureEnabled; DateTime? get enabledAt;
/// Create a copy of Sub2ApiTotpStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiTotpStatusCopyWith<Sub2ApiTotpStatus> get copyWith => _$Sub2ApiTotpStatusCopyWithImpl<Sub2ApiTotpStatus>(this as Sub2ApiTotpStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiTotpStatus&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.featureEnabled, featureEnabled) || other.featureEnabled == featureEnabled)&&(identical(other.enabledAt, enabledAt) || other.enabledAt == enabledAt));
}


@override
int get hashCode => Object.hash(runtimeType,enabled,featureEnabled,enabledAt);

@override
String toString() {
  return 'Sub2ApiTotpStatus(enabled: $enabled, featureEnabled: $featureEnabled, enabledAt: $enabledAt)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiTotpStatusCopyWith<$Res>  {
  factory $Sub2ApiTotpStatusCopyWith(Sub2ApiTotpStatus value, $Res Function(Sub2ApiTotpStatus) _then) = _$Sub2ApiTotpStatusCopyWithImpl;
@useResult
$Res call({
 bool enabled, bool featureEnabled, DateTime? enabledAt
});




}
/// @nodoc
class _$Sub2ApiTotpStatusCopyWithImpl<$Res>
    implements $Sub2ApiTotpStatusCopyWith<$Res> {
  _$Sub2ApiTotpStatusCopyWithImpl(this._self, this._then);

  final Sub2ApiTotpStatus _self;
  final $Res Function(Sub2ApiTotpStatus) _then;

/// Create a copy of Sub2ApiTotpStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? featureEnabled = null,Object? enabledAt = freezed,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,featureEnabled: null == featureEnabled ? _self.featureEnabled : featureEnabled // ignore: cast_nullable_to_non_nullable
as bool,enabledAt: freezed == enabledAt ? _self.enabledAt : enabledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiTotpStatus].
extension Sub2ApiTotpStatusPatterns on Sub2ApiTotpStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiTotpStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiTotpStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiTotpStatus value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiTotpStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiTotpStatus value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiTotpStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  bool featureEnabled,  DateTime? enabledAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiTotpStatus() when $default != null:
return $default(_that.enabled,_that.featureEnabled,_that.enabledAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  bool featureEnabled,  DateTime? enabledAt)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiTotpStatus():
return $default(_that.enabled,_that.featureEnabled,_that.enabledAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  bool featureEnabled,  DateTime? enabledAt)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiTotpStatus() when $default != null:
return $default(_that.enabled,_that.featureEnabled,_that.enabledAt);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiTotpStatus implements Sub2ApiTotpStatus {
  const _Sub2ApiTotpStatus({required this.enabled, required this.featureEnabled, this.enabledAt});


@override final  bool enabled;
@override final  bool featureEnabled;
@override final  DateTime? enabledAt;

/// Create a copy of Sub2ApiTotpStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiTotpStatusCopyWith<_Sub2ApiTotpStatus> get copyWith => __$Sub2ApiTotpStatusCopyWithImpl<_Sub2ApiTotpStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiTotpStatus&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.featureEnabled, featureEnabled) || other.featureEnabled == featureEnabled)&&(identical(other.enabledAt, enabledAt) || other.enabledAt == enabledAt));
}


@override
int get hashCode => Object.hash(runtimeType,enabled,featureEnabled,enabledAt);

@override
String toString() {
  return 'Sub2ApiTotpStatus(enabled: $enabled, featureEnabled: $featureEnabled, enabledAt: $enabledAt)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiTotpStatusCopyWith<$Res> implements $Sub2ApiTotpStatusCopyWith<$Res> {
  factory _$Sub2ApiTotpStatusCopyWith(_Sub2ApiTotpStatus value, $Res Function(_Sub2ApiTotpStatus) _then) = __$Sub2ApiTotpStatusCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, bool featureEnabled, DateTime? enabledAt
});




}
/// @nodoc
class __$Sub2ApiTotpStatusCopyWithImpl<$Res>
    implements _$Sub2ApiTotpStatusCopyWith<$Res> {
  __$Sub2ApiTotpStatusCopyWithImpl(this._self, this._then);

  final _Sub2ApiTotpStatus _self;
  final $Res Function(_Sub2ApiTotpStatus) _then;

/// Create a copy of Sub2ApiTotpStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? featureEnabled = null,Object? enabledAt = freezed,}) {
  return _then(_Sub2ApiTotpStatus(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,featureEnabled: null == featureEnabled ? _self.featureEnabled : featureEnabled // ignore: cast_nullable_to_non_nullable
as bool,enabledAt: freezed == enabledAt ? _self.enabledAt : enabledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiTotpStepUpGrant {

 bool get verified; Duration get expiresIn;
/// Create a copy of Sub2ApiTotpStepUpGrant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiTotpStepUpGrantCopyWith<Sub2ApiTotpStepUpGrant> get copyWith => _$Sub2ApiTotpStepUpGrantCopyWithImpl<Sub2ApiTotpStepUpGrant>(this as Sub2ApiTotpStepUpGrant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiTotpStepUpGrant&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}


@override
int get hashCode => Object.hash(runtimeType,verified,expiresIn);

@override
String toString() {
  return 'Sub2ApiTotpStepUpGrant(verified: $verified, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiTotpStepUpGrantCopyWith<$Res>  {
  factory $Sub2ApiTotpStepUpGrantCopyWith(Sub2ApiTotpStepUpGrant value, $Res Function(Sub2ApiTotpStepUpGrant) _then) = _$Sub2ApiTotpStepUpGrantCopyWithImpl;
@useResult
$Res call({
 bool verified, Duration expiresIn
});




}
/// @nodoc
class _$Sub2ApiTotpStepUpGrantCopyWithImpl<$Res>
    implements $Sub2ApiTotpStepUpGrantCopyWith<$Res> {
  _$Sub2ApiTotpStepUpGrantCopyWithImpl(this._self, this._then);

  final Sub2ApiTotpStepUpGrant _self;
  final $Res Function(Sub2ApiTotpStepUpGrant) _then;

/// Create a copy of Sub2ApiTotpStepUpGrant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verified = null,Object? expiresIn = null,}) {
  return _then(_self.copyWith(
verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiTotpStepUpGrant].
extension Sub2ApiTotpStepUpGrantPatterns on Sub2ApiTotpStepUpGrant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiTotpStepUpGrant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiTotpStepUpGrant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiTotpStepUpGrant value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiTotpStepUpGrant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiTotpStepUpGrant value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiTotpStepUpGrant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool verified,  Duration expiresIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiTotpStepUpGrant() when $default != null:
return $default(_that.verified,_that.expiresIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool verified,  Duration expiresIn)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiTotpStepUpGrant():
return $default(_that.verified,_that.expiresIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool verified,  Duration expiresIn)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiTotpStepUpGrant() when $default != null:
return $default(_that.verified,_that.expiresIn);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiTotpStepUpGrant implements Sub2ApiTotpStepUpGrant {
  const _Sub2ApiTotpStepUpGrant({required this.verified, required this.expiresIn});


@override final  bool verified;
@override final  Duration expiresIn;

/// Create a copy of Sub2ApiTotpStepUpGrant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiTotpStepUpGrantCopyWith<_Sub2ApiTotpStepUpGrant> get copyWith => __$Sub2ApiTotpStepUpGrantCopyWithImpl<_Sub2ApiTotpStepUpGrant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiTotpStepUpGrant&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}


@override
int get hashCode => Object.hash(runtimeType,verified,expiresIn);

@override
String toString() {
  return 'Sub2ApiTotpStepUpGrant(verified: $verified, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiTotpStepUpGrantCopyWith<$Res> implements $Sub2ApiTotpStepUpGrantCopyWith<$Res> {
  factory _$Sub2ApiTotpStepUpGrantCopyWith(_Sub2ApiTotpStepUpGrant value, $Res Function(_Sub2ApiTotpStepUpGrant) _then) = __$Sub2ApiTotpStepUpGrantCopyWithImpl;
@override @useResult
$Res call({
 bool verified, Duration expiresIn
});




}
/// @nodoc
class __$Sub2ApiTotpStepUpGrantCopyWithImpl<$Res>
    implements _$Sub2ApiTotpStepUpGrantCopyWith<$Res> {
  __$Sub2ApiTotpStepUpGrantCopyWithImpl(this._self, this._then);

  final _Sub2ApiTotpStepUpGrant _self;
  final $Res Function(_Sub2ApiTotpStepUpGrant) _then;

/// Create a copy of Sub2ApiTotpStepUpGrant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verified = null,Object? expiresIn = null,}) {
  return _then(_Sub2ApiTotpStepUpGrant(
verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
