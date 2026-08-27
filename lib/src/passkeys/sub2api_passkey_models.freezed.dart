// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_passkey_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sub2ApiWebAuthnCredentialDescriptor {

 String get type; Uint8List get id; List<String> get transports;
/// Create a copy of Sub2ApiWebAuthnCredentialDescriptor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnCredentialDescriptorCopyWith<Sub2ApiWebAuthnCredentialDescriptor> get copyWith => _$Sub2ApiWebAuthnCredentialDescriptorCopyWithImpl<Sub2ApiWebAuthnCredentialDescriptor>(this as Sub2ApiWebAuthnCredentialDescriptor, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiWebAuthnCredentialDescriptor&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.id, id)&&const DeepCollectionEquality().equals(other.transports, transports));
}


@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(id),const DeepCollectionEquality().hash(transports));

@override
String toString() {
  return 'Sub2ApiWebAuthnCredentialDescriptor(type: $type, id: $id, transports: $transports)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiWebAuthnCredentialDescriptorCopyWith<$Res>  {
  factory $Sub2ApiWebAuthnCredentialDescriptorCopyWith(Sub2ApiWebAuthnCredentialDescriptor value, $Res Function(Sub2ApiWebAuthnCredentialDescriptor) _then) = _$Sub2ApiWebAuthnCredentialDescriptorCopyWithImpl;
@useResult
$Res call({
 String type, Uint8List id, List<String> transports
});




}
/// @nodoc
class _$Sub2ApiWebAuthnCredentialDescriptorCopyWithImpl<$Res>
    implements $Sub2ApiWebAuthnCredentialDescriptorCopyWith<$Res> {
  _$Sub2ApiWebAuthnCredentialDescriptorCopyWithImpl(this._self, this._then);

  final Sub2ApiWebAuthnCredentialDescriptor _self;
  final $Res Function(Sub2ApiWebAuthnCredentialDescriptor) _then;

/// Create a copy of Sub2ApiWebAuthnCredentialDescriptor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? transports = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uint8List,transports: null == transports ? _self.transports : transports // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiWebAuthnCredentialDescriptor].
extension Sub2ApiWebAuthnCredentialDescriptorPatterns on Sub2ApiWebAuthnCredentialDescriptor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnCredentialDescriptor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCredentialDescriptor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnCredentialDescriptor value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCredentialDescriptor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiWebAuthnCredentialDescriptor value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCredentialDescriptor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  Uint8List id,  List<String> transports)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCredentialDescriptor() when $default != null:
return $default(_that.type,_that.id,_that.transports);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  Uint8List id,  List<String> transports)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCredentialDescriptor():
return $default(_that.type,_that.id,_that.transports);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  Uint8List id,  List<String> transports)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCredentialDescriptor() when $default != null:
return $default(_that.type,_that.id,_that.transports);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiWebAuthnCredentialDescriptor implements Sub2ApiWebAuthnCredentialDescriptor {
  const _Sub2ApiWebAuthnCredentialDescriptor({required this.type, required this.id, required final  List<String> transports}): _transports = transports;


@override final  String type;
@override final  Uint8List id;
 final  List<String> _transports;
@override List<String> get transports {
  if (_transports is EqualUnmodifiableListView) return _transports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transports);
}


/// Create a copy of Sub2ApiWebAuthnCredentialDescriptor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiWebAuthnCredentialDescriptorCopyWith<_Sub2ApiWebAuthnCredentialDescriptor> get copyWith => __$Sub2ApiWebAuthnCredentialDescriptorCopyWithImpl<_Sub2ApiWebAuthnCredentialDescriptor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiWebAuthnCredentialDescriptor&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.id, id)&&const DeepCollectionEquality().equals(other._transports, _transports));
}


@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(id),const DeepCollectionEquality().hash(_transports));

@override
String toString() {
  return 'Sub2ApiWebAuthnCredentialDescriptor(type: $type, id: $id, transports: $transports)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiWebAuthnCredentialDescriptorCopyWith<$Res> implements $Sub2ApiWebAuthnCredentialDescriptorCopyWith<$Res> {
  factory _$Sub2ApiWebAuthnCredentialDescriptorCopyWith(_Sub2ApiWebAuthnCredentialDescriptor value, $Res Function(_Sub2ApiWebAuthnCredentialDescriptor) _then) = __$Sub2ApiWebAuthnCredentialDescriptorCopyWithImpl;
@override @useResult
$Res call({
 String type, Uint8List id, List<String> transports
});




}
/// @nodoc
class __$Sub2ApiWebAuthnCredentialDescriptorCopyWithImpl<$Res>
    implements _$Sub2ApiWebAuthnCredentialDescriptorCopyWith<$Res> {
  __$Sub2ApiWebAuthnCredentialDescriptorCopyWithImpl(this._self, this._then);

  final _Sub2ApiWebAuthnCredentialDescriptor _self;
  final $Res Function(_Sub2ApiWebAuthnCredentialDescriptor) _then;

/// Create a copy of Sub2ApiWebAuthnCredentialDescriptor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? transports = null,}) {
  return _then(_Sub2ApiWebAuthnCredentialDescriptor(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uint8List,transports: null == transports ? _self._transports : transports // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiWebAuthnRequestOptions {

 Uint8List get challenge; List<Sub2ApiWebAuthnCredentialDescriptor> get allowedCredentials; List<String> get hints; Duration? get timeout; String? get relyingPartyId; String? get userVerification;
/// Create a copy of Sub2ApiWebAuthnRequestOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnRequestOptionsCopyWith<Sub2ApiWebAuthnRequestOptions> get copyWith => _$Sub2ApiWebAuthnRequestOptionsCopyWithImpl<Sub2ApiWebAuthnRequestOptions>(this as Sub2ApiWebAuthnRequestOptions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiWebAuthnRequestOptions&&const DeepCollectionEquality().equals(other.challenge, challenge)&&const DeepCollectionEquality().equals(other.allowedCredentials, allowedCredentials)&&const DeepCollectionEquality().equals(other.hints, hints)&&(identical(other.timeout, timeout) || other.timeout == timeout)&&(identical(other.relyingPartyId, relyingPartyId) || other.relyingPartyId == relyingPartyId)&&(identical(other.userVerification, userVerification) || other.userVerification == userVerification));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(challenge),const DeepCollectionEquality().hash(allowedCredentials),const DeepCollectionEquality().hash(hints),timeout,relyingPartyId,userVerification);

@override
String toString() {
  return 'Sub2ApiWebAuthnRequestOptions(challenge: $challenge, allowedCredentials: $allowedCredentials, hints: $hints, timeout: $timeout, relyingPartyId: $relyingPartyId, userVerification: $userVerification)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiWebAuthnRequestOptionsCopyWith<$Res>  {
  factory $Sub2ApiWebAuthnRequestOptionsCopyWith(Sub2ApiWebAuthnRequestOptions value, $Res Function(Sub2ApiWebAuthnRequestOptions) _then) = _$Sub2ApiWebAuthnRequestOptionsCopyWithImpl;
@useResult
$Res call({
 Uint8List challenge, List<Sub2ApiWebAuthnCredentialDescriptor> allowedCredentials, List<String> hints, Duration? timeout, String? relyingPartyId, String? userVerification
});




}
/// @nodoc
class _$Sub2ApiWebAuthnRequestOptionsCopyWithImpl<$Res>
    implements $Sub2ApiWebAuthnRequestOptionsCopyWith<$Res> {
  _$Sub2ApiWebAuthnRequestOptionsCopyWithImpl(this._self, this._then);

  final Sub2ApiWebAuthnRequestOptions _self;
  final $Res Function(Sub2ApiWebAuthnRequestOptions) _then;

/// Create a copy of Sub2ApiWebAuthnRequestOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? challenge = null,Object? allowedCredentials = null,Object? hints = null,Object? timeout = freezed,Object? relyingPartyId = freezed,Object? userVerification = freezed,}) {
  return _then(_self.copyWith(
challenge: null == challenge ? _self.challenge : challenge // ignore: cast_nullable_to_non_nullable
as Uint8List,allowedCredentials: null == allowedCredentials ? _self.allowedCredentials : allowedCredentials // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiWebAuthnCredentialDescriptor>,hints: null == hints ? _self.hints : hints // ignore: cast_nullable_to_non_nullable
as List<String>,timeout: freezed == timeout ? _self.timeout : timeout // ignore: cast_nullable_to_non_nullable
as Duration?,relyingPartyId: freezed == relyingPartyId ? _self.relyingPartyId : relyingPartyId // ignore: cast_nullable_to_non_nullable
as String?,userVerification: freezed == userVerification ? _self.userVerification : userVerification // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiWebAuthnRequestOptions].
extension Sub2ApiWebAuthnRequestOptionsPatterns on Sub2ApiWebAuthnRequestOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnRequestOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnRequestOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnRequestOptions value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnRequestOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiWebAuthnRequestOptions value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnRequestOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uint8List challenge,  List<Sub2ApiWebAuthnCredentialDescriptor> allowedCredentials,  List<String> hints,  Duration? timeout,  String? relyingPartyId,  String? userVerification)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnRequestOptions() when $default != null:
return $default(_that.challenge,_that.allowedCredentials,_that.hints,_that.timeout,_that.relyingPartyId,_that.userVerification);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uint8List challenge,  List<Sub2ApiWebAuthnCredentialDescriptor> allowedCredentials,  List<String> hints,  Duration? timeout,  String? relyingPartyId,  String? userVerification)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnRequestOptions():
return $default(_that.challenge,_that.allowedCredentials,_that.hints,_that.timeout,_that.relyingPartyId,_that.userVerification);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uint8List challenge,  List<Sub2ApiWebAuthnCredentialDescriptor> allowedCredentials,  List<String> hints,  Duration? timeout,  String? relyingPartyId,  String? userVerification)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnRequestOptions() when $default != null:
return $default(_that.challenge,_that.allowedCredentials,_that.hints,_that.timeout,_that.relyingPartyId,_that.userVerification);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiWebAuthnRequestOptions implements Sub2ApiWebAuthnRequestOptions {
  const _Sub2ApiWebAuthnRequestOptions({required this.challenge, required final  List<Sub2ApiWebAuthnCredentialDescriptor> allowedCredentials, required final  List<String> hints, this.timeout, this.relyingPartyId, this.userVerification}): _allowedCredentials = allowedCredentials,_hints = hints;


@override final  Uint8List challenge;
 final  List<Sub2ApiWebAuthnCredentialDescriptor> _allowedCredentials;
@override List<Sub2ApiWebAuthnCredentialDescriptor> get allowedCredentials {
  if (_allowedCredentials is EqualUnmodifiableListView) return _allowedCredentials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowedCredentials);
}

 final  List<String> _hints;
@override List<String> get hints {
  if (_hints is EqualUnmodifiableListView) return _hints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hints);
}

@override final  Duration? timeout;
@override final  String? relyingPartyId;
@override final  String? userVerification;

/// Create a copy of Sub2ApiWebAuthnRequestOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiWebAuthnRequestOptionsCopyWith<_Sub2ApiWebAuthnRequestOptions> get copyWith => __$Sub2ApiWebAuthnRequestOptionsCopyWithImpl<_Sub2ApiWebAuthnRequestOptions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiWebAuthnRequestOptions&&const DeepCollectionEquality().equals(other.challenge, challenge)&&const DeepCollectionEquality().equals(other._allowedCredentials, _allowedCredentials)&&const DeepCollectionEquality().equals(other._hints, _hints)&&(identical(other.timeout, timeout) || other.timeout == timeout)&&(identical(other.relyingPartyId, relyingPartyId) || other.relyingPartyId == relyingPartyId)&&(identical(other.userVerification, userVerification) || other.userVerification == userVerification));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(challenge),const DeepCollectionEquality().hash(_allowedCredentials),const DeepCollectionEquality().hash(_hints),timeout,relyingPartyId,userVerification);

@override
String toString() {
  return 'Sub2ApiWebAuthnRequestOptions(challenge: $challenge, allowedCredentials: $allowedCredentials, hints: $hints, timeout: $timeout, relyingPartyId: $relyingPartyId, userVerification: $userVerification)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiWebAuthnRequestOptionsCopyWith<$Res> implements $Sub2ApiWebAuthnRequestOptionsCopyWith<$Res> {
  factory _$Sub2ApiWebAuthnRequestOptionsCopyWith(_Sub2ApiWebAuthnRequestOptions value, $Res Function(_Sub2ApiWebAuthnRequestOptions) _then) = __$Sub2ApiWebAuthnRequestOptionsCopyWithImpl;
@override @useResult
$Res call({
 Uint8List challenge, List<Sub2ApiWebAuthnCredentialDescriptor> allowedCredentials, List<String> hints, Duration? timeout, String? relyingPartyId, String? userVerification
});




}
/// @nodoc
class __$Sub2ApiWebAuthnRequestOptionsCopyWithImpl<$Res>
    implements _$Sub2ApiWebAuthnRequestOptionsCopyWith<$Res> {
  __$Sub2ApiWebAuthnRequestOptionsCopyWithImpl(this._self, this._then);

  final _Sub2ApiWebAuthnRequestOptions _self;
  final $Res Function(_Sub2ApiWebAuthnRequestOptions) _then;

/// Create a copy of Sub2ApiWebAuthnRequestOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? challenge = null,Object? allowedCredentials = null,Object? hints = null,Object? timeout = freezed,Object? relyingPartyId = freezed,Object? userVerification = freezed,}) {
  return _then(_Sub2ApiWebAuthnRequestOptions(
challenge: null == challenge ? _self.challenge : challenge // ignore: cast_nullable_to_non_nullable
as Uint8List,allowedCredentials: null == allowedCredentials ? _self._allowedCredentials : allowedCredentials // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiWebAuthnCredentialDescriptor>,hints: null == hints ? _self._hints : hints // ignore: cast_nullable_to_non_nullable
as List<String>,timeout: freezed == timeout ? _self.timeout : timeout // ignore: cast_nullable_to_non_nullable
as Duration?,relyingPartyId: freezed == relyingPartyId ? _self.relyingPartyId : relyingPartyId // ignore: cast_nullable_to_non_nullable
as String?,userVerification: freezed == userVerification ? _self.userVerification : userVerification // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiPasskeyLoginChallenge {

 Sub2ApiPasskeySessionToken get sessionToken; Sub2ApiWebAuthnRequestOptions get options; String? get mediation;
/// Create a copy of Sub2ApiPasskeyLoginChallenge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiPasskeyLoginChallengeCopyWith<Sub2ApiPasskeyLoginChallenge> get copyWith => _$Sub2ApiPasskeyLoginChallengeCopyWithImpl<Sub2ApiPasskeyLoginChallenge>(this as Sub2ApiPasskeyLoginChallenge, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiPasskeyLoginChallenge&&(identical(other.sessionToken, sessionToken) || other.sessionToken == sessionToken)&&(identical(other.options, options) || other.options == options)&&(identical(other.mediation, mediation) || other.mediation == mediation));
}


@override
int get hashCode => Object.hash(runtimeType,sessionToken,options,mediation);

@override
String toString() {
  return 'Sub2ApiPasskeyLoginChallenge(sessionToken: $sessionToken, options: $options, mediation: $mediation)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiPasskeyLoginChallengeCopyWith<$Res>  {
  factory $Sub2ApiPasskeyLoginChallengeCopyWith(Sub2ApiPasskeyLoginChallenge value, $Res Function(Sub2ApiPasskeyLoginChallenge) _then) = _$Sub2ApiPasskeyLoginChallengeCopyWithImpl;
@useResult
$Res call({
 Sub2ApiPasskeySessionToken sessionToken, Sub2ApiWebAuthnRequestOptions options, String? mediation
});


$Sub2ApiWebAuthnRequestOptionsCopyWith<$Res> get options;

}
/// @nodoc
class _$Sub2ApiPasskeyLoginChallengeCopyWithImpl<$Res>
    implements $Sub2ApiPasskeyLoginChallengeCopyWith<$Res> {
  _$Sub2ApiPasskeyLoginChallengeCopyWithImpl(this._self, this._then);

  final Sub2ApiPasskeyLoginChallenge _self;
  final $Res Function(Sub2ApiPasskeyLoginChallenge) _then;

/// Create a copy of Sub2ApiPasskeyLoginChallenge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionToken = null,Object? options = null,Object? mediation = freezed,}) {
  return _then(_self.copyWith(
sessionToken: null == sessionToken ? _self.sessionToken : sessionToken // ignore: cast_nullable_to_non_nullable
as Sub2ApiPasskeySessionToken,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Sub2ApiWebAuthnRequestOptions,mediation: freezed == mediation ? _self.mediation : mediation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Sub2ApiPasskeyLoginChallenge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnRequestOptionsCopyWith<$Res> get options {

  return $Sub2ApiWebAuthnRequestOptionsCopyWith<$Res>(_self.options, (value) {
    return _then(_self.copyWith(options: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sub2ApiPasskeyLoginChallenge].
extension Sub2ApiPasskeyLoginChallengePatterns on Sub2ApiPasskeyLoginChallenge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiPasskeyLoginChallenge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiPasskeyLoginChallenge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiPasskeyLoginChallenge value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPasskeyLoginChallenge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiPasskeyLoginChallenge value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPasskeyLoginChallenge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiPasskeySessionToken sessionToken,  Sub2ApiWebAuthnRequestOptions options,  String? mediation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiPasskeyLoginChallenge() when $default != null:
return $default(_that.sessionToken,_that.options,_that.mediation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiPasskeySessionToken sessionToken,  Sub2ApiWebAuthnRequestOptions options,  String? mediation)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPasskeyLoginChallenge():
return $default(_that.sessionToken,_that.options,_that.mediation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiPasskeySessionToken sessionToken,  Sub2ApiWebAuthnRequestOptions options,  String? mediation)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPasskeyLoginChallenge() when $default != null:
return $default(_that.sessionToken,_that.options,_that.mediation);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiPasskeyLoginChallenge implements Sub2ApiPasskeyLoginChallenge {
  const _Sub2ApiPasskeyLoginChallenge({required this.sessionToken, required this.options, this.mediation});


@override final  Sub2ApiPasskeySessionToken sessionToken;
@override final  Sub2ApiWebAuthnRequestOptions options;
@override final  String? mediation;

/// Create a copy of Sub2ApiPasskeyLoginChallenge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiPasskeyLoginChallengeCopyWith<_Sub2ApiPasskeyLoginChallenge> get copyWith => __$Sub2ApiPasskeyLoginChallengeCopyWithImpl<_Sub2ApiPasskeyLoginChallenge>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiPasskeyLoginChallenge&&(identical(other.sessionToken, sessionToken) || other.sessionToken == sessionToken)&&(identical(other.options, options) || other.options == options)&&(identical(other.mediation, mediation) || other.mediation == mediation));
}


@override
int get hashCode => Object.hash(runtimeType,sessionToken,options,mediation);

@override
String toString() {
  return 'Sub2ApiPasskeyLoginChallenge(sessionToken: $sessionToken, options: $options, mediation: $mediation)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiPasskeyLoginChallengeCopyWith<$Res> implements $Sub2ApiPasskeyLoginChallengeCopyWith<$Res> {
  factory _$Sub2ApiPasskeyLoginChallengeCopyWith(_Sub2ApiPasskeyLoginChallenge value, $Res Function(_Sub2ApiPasskeyLoginChallenge) _then) = __$Sub2ApiPasskeyLoginChallengeCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiPasskeySessionToken sessionToken, Sub2ApiWebAuthnRequestOptions options, String? mediation
});


@override $Sub2ApiWebAuthnRequestOptionsCopyWith<$Res> get options;

}
/// @nodoc
class __$Sub2ApiPasskeyLoginChallengeCopyWithImpl<$Res>
    implements _$Sub2ApiPasskeyLoginChallengeCopyWith<$Res> {
  __$Sub2ApiPasskeyLoginChallengeCopyWithImpl(this._self, this._then);

  final _Sub2ApiPasskeyLoginChallenge _self;
  final $Res Function(_Sub2ApiPasskeyLoginChallenge) _then;

/// Create a copy of Sub2ApiPasskeyLoginChallenge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionToken = null,Object? options = null,Object? mediation = freezed,}) {
  return _then(_Sub2ApiPasskeyLoginChallenge(
sessionToken: null == sessionToken ? _self.sessionToken : sessionToken // ignore: cast_nullable_to_non_nullable
as Sub2ApiPasskeySessionToken,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Sub2ApiWebAuthnRequestOptions,mediation: freezed == mediation ? _self.mediation : mediation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Sub2ApiPasskeyLoginChallenge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnRequestOptionsCopyWith<$Res> get options {

  return $Sub2ApiWebAuthnRequestOptionsCopyWith<$Res>(_self.options, (value) {
    return _then(_self.copyWith(options: value));
  });
}
}

/// @nodoc
mixin _$Sub2ApiWebAuthnRelyingParty {

 String get id; String get name;
/// Create a copy of Sub2ApiWebAuthnRelyingParty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnRelyingPartyCopyWith<Sub2ApiWebAuthnRelyingParty> get copyWith => _$Sub2ApiWebAuthnRelyingPartyCopyWithImpl<Sub2ApiWebAuthnRelyingParty>(this as Sub2ApiWebAuthnRelyingParty, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiWebAuthnRelyingParty&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'Sub2ApiWebAuthnRelyingParty(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiWebAuthnRelyingPartyCopyWith<$Res>  {
  factory $Sub2ApiWebAuthnRelyingPartyCopyWith(Sub2ApiWebAuthnRelyingParty value, $Res Function(Sub2ApiWebAuthnRelyingParty) _then) = _$Sub2ApiWebAuthnRelyingPartyCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$Sub2ApiWebAuthnRelyingPartyCopyWithImpl<$Res>
    implements $Sub2ApiWebAuthnRelyingPartyCopyWith<$Res> {
  _$Sub2ApiWebAuthnRelyingPartyCopyWithImpl(this._self, this._then);

  final Sub2ApiWebAuthnRelyingParty _self;
  final $Res Function(Sub2ApiWebAuthnRelyingParty) _then;

/// Create a copy of Sub2ApiWebAuthnRelyingParty
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiWebAuthnRelyingParty].
extension Sub2ApiWebAuthnRelyingPartyPatterns on Sub2ApiWebAuthnRelyingParty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnRelyingParty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnRelyingParty() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnRelyingParty value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnRelyingParty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiWebAuthnRelyingParty value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnRelyingParty() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnRelyingParty() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnRelyingParty():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnRelyingParty() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiWebAuthnRelyingParty implements Sub2ApiWebAuthnRelyingParty {
  const _Sub2ApiWebAuthnRelyingParty({required this.id, required this.name});


@override final  String id;
@override final  String name;

/// Create a copy of Sub2ApiWebAuthnRelyingParty
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiWebAuthnRelyingPartyCopyWith<_Sub2ApiWebAuthnRelyingParty> get copyWith => __$Sub2ApiWebAuthnRelyingPartyCopyWithImpl<_Sub2ApiWebAuthnRelyingParty>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiWebAuthnRelyingParty&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'Sub2ApiWebAuthnRelyingParty(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiWebAuthnRelyingPartyCopyWith<$Res> implements $Sub2ApiWebAuthnRelyingPartyCopyWith<$Res> {
  factory _$Sub2ApiWebAuthnRelyingPartyCopyWith(_Sub2ApiWebAuthnRelyingParty value, $Res Function(_Sub2ApiWebAuthnRelyingParty) _then) = __$Sub2ApiWebAuthnRelyingPartyCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$Sub2ApiWebAuthnRelyingPartyCopyWithImpl<$Res>
    implements _$Sub2ApiWebAuthnRelyingPartyCopyWith<$Res> {
  __$Sub2ApiWebAuthnRelyingPartyCopyWithImpl(this._self, this._then);

  final _Sub2ApiWebAuthnRelyingParty _self;
  final $Res Function(_Sub2ApiWebAuthnRelyingParty) _then;

/// Create a copy of Sub2ApiWebAuthnRelyingParty
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_Sub2ApiWebAuthnRelyingParty(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiWebAuthnUser {

 Uint8List get id; String get name; String get displayName;
/// Create a copy of Sub2ApiWebAuthnUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnUserCopyWith<Sub2ApiWebAuthnUser> get copyWith => _$Sub2ApiWebAuthnUserCopyWithImpl<Sub2ApiWebAuthnUser>(this as Sub2ApiWebAuthnUser, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiWebAuthnUser&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name,displayName);

@override
String toString() {
  return 'Sub2ApiWebAuthnUser(id: $id, name: $name, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiWebAuthnUserCopyWith<$Res>  {
  factory $Sub2ApiWebAuthnUserCopyWith(Sub2ApiWebAuthnUser value, $Res Function(Sub2ApiWebAuthnUser) _then) = _$Sub2ApiWebAuthnUserCopyWithImpl;
@useResult
$Res call({
 Uint8List id, String name, String displayName
});




}
/// @nodoc
class _$Sub2ApiWebAuthnUserCopyWithImpl<$Res>
    implements $Sub2ApiWebAuthnUserCopyWith<$Res> {
  _$Sub2ApiWebAuthnUserCopyWithImpl(this._self, this._then);

  final Sub2ApiWebAuthnUser _self;
  final $Res Function(Sub2ApiWebAuthnUser) _then;

/// Create a copy of Sub2ApiWebAuthnUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? displayName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uint8List,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiWebAuthnUser].
extension Sub2ApiWebAuthnUserPatterns on Sub2ApiWebAuthnUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnUser value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiWebAuthnUser value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uint8List id,  String name,  String displayName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnUser() when $default != null:
return $default(_that.id,_that.name,_that.displayName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uint8List id,  String name,  String displayName)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnUser():
return $default(_that.id,_that.name,_that.displayName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uint8List id,  String name,  String displayName)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnUser() when $default != null:
return $default(_that.id,_that.name,_that.displayName);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiWebAuthnUser implements Sub2ApiWebAuthnUser {
  const _Sub2ApiWebAuthnUser({required this.id, required this.name, required this.displayName});


@override final  Uint8List id;
@override final  String name;
@override final  String displayName;

/// Create a copy of Sub2ApiWebAuthnUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiWebAuthnUserCopyWith<_Sub2ApiWebAuthnUser> get copyWith => __$Sub2ApiWebAuthnUserCopyWithImpl<_Sub2ApiWebAuthnUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiWebAuthnUser&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name,displayName);

@override
String toString() {
  return 'Sub2ApiWebAuthnUser(id: $id, name: $name, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiWebAuthnUserCopyWith<$Res> implements $Sub2ApiWebAuthnUserCopyWith<$Res> {
  factory _$Sub2ApiWebAuthnUserCopyWith(_Sub2ApiWebAuthnUser value, $Res Function(_Sub2ApiWebAuthnUser) _then) = __$Sub2ApiWebAuthnUserCopyWithImpl;
@override @useResult
$Res call({
 Uint8List id, String name, String displayName
});




}
/// @nodoc
class __$Sub2ApiWebAuthnUserCopyWithImpl<$Res>
    implements _$Sub2ApiWebAuthnUserCopyWith<$Res> {
  __$Sub2ApiWebAuthnUserCopyWithImpl(this._self, this._then);

  final _Sub2ApiWebAuthnUser _self;
  final $Res Function(_Sub2ApiWebAuthnUser) _then;

/// Create a copy of Sub2ApiWebAuthnUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? displayName = null,}) {
  return _then(_Sub2ApiWebAuthnUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uint8List,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiWebAuthnCredentialParameter {

 String get type; int get algorithm;
/// Create a copy of Sub2ApiWebAuthnCredentialParameter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnCredentialParameterCopyWith<Sub2ApiWebAuthnCredentialParameter> get copyWith => _$Sub2ApiWebAuthnCredentialParameterCopyWithImpl<Sub2ApiWebAuthnCredentialParameter>(this as Sub2ApiWebAuthnCredentialParameter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiWebAuthnCredentialParameter&&(identical(other.type, type) || other.type == type)&&(identical(other.algorithm, algorithm) || other.algorithm == algorithm));
}


@override
int get hashCode => Object.hash(runtimeType,type,algorithm);

@override
String toString() {
  return 'Sub2ApiWebAuthnCredentialParameter(type: $type, algorithm: $algorithm)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiWebAuthnCredentialParameterCopyWith<$Res>  {
  factory $Sub2ApiWebAuthnCredentialParameterCopyWith(Sub2ApiWebAuthnCredentialParameter value, $Res Function(Sub2ApiWebAuthnCredentialParameter) _then) = _$Sub2ApiWebAuthnCredentialParameterCopyWithImpl;
@useResult
$Res call({
 String type, int algorithm
});




}
/// @nodoc
class _$Sub2ApiWebAuthnCredentialParameterCopyWithImpl<$Res>
    implements $Sub2ApiWebAuthnCredentialParameterCopyWith<$Res> {
  _$Sub2ApiWebAuthnCredentialParameterCopyWithImpl(this._self, this._then);

  final Sub2ApiWebAuthnCredentialParameter _self;
  final $Res Function(Sub2ApiWebAuthnCredentialParameter) _then;

/// Create a copy of Sub2ApiWebAuthnCredentialParameter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? algorithm = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,algorithm: null == algorithm ? _self.algorithm : algorithm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiWebAuthnCredentialParameter].
extension Sub2ApiWebAuthnCredentialParameterPatterns on Sub2ApiWebAuthnCredentialParameter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnCredentialParameter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCredentialParameter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnCredentialParameter value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCredentialParameter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiWebAuthnCredentialParameter value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCredentialParameter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  int algorithm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCredentialParameter() when $default != null:
return $default(_that.type,_that.algorithm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  int algorithm)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCredentialParameter():
return $default(_that.type,_that.algorithm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  int algorithm)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCredentialParameter() when $default != null:
return $default(_that.type,_that.algorithm);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiWebAuthnCredentialParameter implements Sub2ApiWebAuthnCredentialParameter {
  const _Sub2ApiWebAuthnCredentialParameter({required this.type, required this.algorithm});


@override final  String type;
@override final  int algorithm;

/// Create a copy of Sub2ApiWebAuthnCredentialParameter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiWebAuthnCredentialParameterCopyWith<_Sub2ApiWebAuthnCredentialParameter> get copyWith => __$Sub2ApiWebAuthnCredentialParameterCopyWithImpl<_Sub2ApiWebAuthnCredentialParameter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiWebAuthnCredentialParameter&&(identical(other.type, type) || other.type == type)&&(identical(other.algorithm, algorithm) || other.algorithm == algorithm));
}


@override
int get hashCode => Object.hash(runtimeType,type,algorithm);

@override
String toString() {
  return 'Sub2ApiWebAuthnCredentialParameter(type: $type, algorithm: $algorithm)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiWebAuthnCredentialParameterCopyWith<$Res> implements $Sub2ApiWebAuthnCredentialParameterCopyWith<$Res> {
  factory _$Sub2ApiWebAuthnCredentialParameterCopyWith(_Sub2ApiWebAuthnCredentialParameter value, $Res Function(_Sub2ApiWebAuthnCredentialParameter) _then) = __$Sub2ApiWebAuthnCredentialParameterCopyWithImpl;
@override @useResult
$Res call({
 String type, int algorithm
});




}
/// @nodoc
class __$Sub2ApiWebAuthnCredentialParameterCopyWithImpl<$Res>
    implements _$Sub2ApiWebAuthnCredentialParameterCopyWith<$Res> {
  __$Sub2ApiWebAuthnCredentialParameterCopyWithImpl(this._self, this._then);

  final _Sub2ApiWebAuthnCredentialParameter _self;
  final $Res Function(_Sub2ApiWebAuthnCredentialParameter) _then;

/// Create a copy of Sub2ApiWebAuthnCredentialParameter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? algorithm = null,}) {
  return _then(_Sub2ApiWebAuthnCredentialParameter(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,algorithm: null == algorithm ? _self.algorithm : algorithm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiWebAuthnAuthenticatorSelection {

 String? get authenticatorAttachment; bool? get requireResidentKey; String? get residentKey; String? get userVerification;
/// Create a copy of Sub2ApiWebAuthnAuthenticatorSelection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnAuthenticatorSelectionCopyWith<Sub2ApiWebAuthnAuthenticatorSelection> get copyWith => _$Sub2ApiWebAuthnAuthenticatorSelectionCopyWithImpl<Sub2ApiWebAuthnAuthenticatorSelection>(this as Sub2ApiWebAuthnAuthenticatorSelection, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiWebAuthnAuthenticatorSelection&&(identical(other.authenticatorAttachment, authenticatorAttachment) || other.authenticatorAttachment == authenticatorAttachment)&&(identical(other.requireResidentKey, requireResidentKey) || other.requireResidentKey == requireResidentKey)&&(identical(other.residentKey, residentKey) || other.residentKey == residentKey)&&(identical(other.userVerification, userVerification) || other.userVerification == userVerification));
}


@override
int get hashCode => Object.hash(runtimeType,authenticatorAttachment,requireResidentKey,residentKey,userVerification);

@override
String toString() {
  return 'Sub2ApiWebAuthnAuthenticatorSelection(authenticatorAttachment: $authenticatorAttachment, requireResidentKey: $requireResidentKey, residentKey: $residentKey, userVerification: $userVerification)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiWebAuthnAuthenticatorSelectionCopyWith<$Res>  {
  factory $Sub2ApiWebAuthnAuthenticatorSelectionCopyWith(Sub2ApiWebAuthnAuthenticatorSelection value, $Res Function(Sub2ApiWebAuthnAuthenticatorSelection) _then) = _$Sub2ApiWebAuthnAuthenticatorSelectionCopyWithImpl;
@useResult
$Res call({
 String? authenticatorAttachment, bool? requireResidentKey, String? residentKey, String? userVerification
});




}
/// @nodoc
class _$Sub2ApiWebAuthnAuthenticatorSelectionCopyWithImpl<$Res>
    implements $Sub2ApiWebAuthnAuthenticatorSelectionCopyWith<$Res> {
  _$Sub2ApiWebAuthnAuthenticatorSelectionCopyWithImpl(this._self, this._then);

  final Sub2ApiWebAuthnAuthenticatorSelection _self;
  final $Res Function(Sub2ApiWebAuthnAuthenticatorSelection) _then;

/// Create a copy of Sub2ApiWebAuthnAuthenticatorSelection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authenticatorAttachment = freezed,Object? requireResidentKey = freezed,Object? residentKey = freezed,Object? userVerification = freezed,}) {
  return _then(_self.copyWith(
authenticatorAttachment: freezed == authenticatorAttachment ? _self.authenticatorAttachment : authenticatorAttachment // ignore: cast_nullable_to_non_nullable
as String?,requireResidentKey: freezed == requireResidentKey ? _self.requireResidentKey : requireResidentKey // ignore: cast_nullable_to_non_nullable
as bool?,residentKey: freezed == residentKey ? _self.residentKey : residentKey // ignore: cast_nullable_to_non_nullable
as String?,userVerification: freezed == userVerification ? _self.userVerification : userVerification // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiWebAuthnAuthenticatorSelection].
extension Sub2ApiWebAuthnAuthenticatorSelectionPatterns on Sub2ApiWebAuthnAuthenticatorSelection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnAuthenticatorSelection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnAuthenticatorSelection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnAuthenticatorSelection value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnAuthenticatorSelection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiWebAuthnAuthenticatorSelection value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnAuthenticatorSelection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? authenticatorAttachment,  bool? requireResidentKey,  String? residentKey,  String? userVerification)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnAuthenticatorSelection() when $default != null:
return $default(_that.authenticatorAttachment,_that.requireResidentKey,_that.residentKey,_that.userVerification);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? authenticatorAttachment,  bool? requireResidentKey,  String? residentKey,  String? userVerification)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnAuthenticatorSelection():
return $default(_that.authenticatorAttachment,_that.requireResidentKey,_that.residentKey,_that.userVerification);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? authenticatorAttachment,  bool? requireResidentKey,  String? residentKey,  String? userVerification)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnAuthenticatorSelection() when $default != null:
return $default(_that.authenticatorAttachment,_that.requireResidentKey,_that.residentKey,_that.userVerification);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiWebAuthnAuthenticatorSelection implements Sub2ApiWebAuthnAuthenticatorSelection {
  const _Sub2ApiWebAuthnAuthenticatorSelection({this.authenticatorAttachment, this.requireResidentKey, this.residentKey, this.userVerification});


@override final  String? authenticatorAttachment;
@override final  bool? requireResidentKey;
@override final  String? residentKey;
@override final  String? userVerification;

/// Create a copy of Sub2ApiWebAuthnAuthenticatorSelection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiWebAuthnAuthenticatorSelectionCopyWith<_Sub2ApiWebAuthnAuthenticatorSelection> get copyWith => __$Sub2ApiWebAuthnAuthenticatorSelectionCopyWithImpl<_Sub2ApiWebAuthnAuthenticatorSelection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiWebAuthnAuthenticatorSelection&&(identical(other.authenticatorAttachment, authenticatorAttachment) || other.authenticatorAttachment == authenticatorAttachment)&&(identical(other.requireResidentKey, requireResidentKey) || other.requireResidentKey == requireResidentKey)&&(identical(other.residentKey, residentKey) || other.residentKey == residentKey)&&(identical(other.userVerification, userVerification) || other.userVerification == userVerification));
}


@override
int get hashCode => Object.hash(runtimeType,authenticatorAttachment,requireResidentKey,residentKey,userVerification);

@override
String toString() {
  return 'Sub2ApiWebAuthnAuthenticatorSelection(authenticatorAttachment: $authenticatorAttachment, requireResidentKey: $requireResidentKey, residentKey: $residentKey, userVerification: $userVerification)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiWebAuthnAuthenticatorSelectionCopyWith<$Res> implements $Sub2ApiWebAuthnAuthenticatorSelectionCopyWith<$Res> {
  factory _$Sub2ApiWebAuthnAuthenticatorSelectionCopyWith(_Sub2ApiWebAuthnAuthenticatorSelection value, $Res Function(_Sub2ApiWebAuthnAuthenticatorSelection) _then) = __$Sub2ApiWebAuthnAuthenticatorSelectionCopyWithImpl;
@override @useResult
$Res call({
 String? authenticatorAttachment, bool? requireResidentKey, String? residentKey, String? userVerification
});




}
/// @nodoc
class __$Sub2ApiWebAuthnAuthenticatorSelectionCopyWithImpl<$Res>
    implements _$Sub2ApiWebAuthnAuthenticatorSelectionCopyWith<$Res> {
  __$Sub2ApiWebAuthnAuthenticatorSelectionCopyWithImpl(this._self, this._then);

  final _Sub2ApiWebAuthnAuthenticatorSelection _self;
  final $Res Function(_Sub2ApiWebAuthnAuthenticatorSelection) _then;

/// Create a copy of Sub2ApiWebAuthnAuthenticatorSelection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authenticatorAttachment = freezed,Object? requireResidentKey = freezed,Object? residentKey = freezed,Object? userVerification = freezed,}) {
  return _then(_Sub2ApiWebAuthnAuthenticatorSelection(
authenticatorAttachment: freezed == authenticatorAttachment ? _self.authenticatorAttachment : authenticatorAttachment // ignore: cast_nullable_to_non_nullable
as String?,requireResidentKey: freezed == requireResidentKey ? _self.requireResidentKey : requireResidentKey // ignore: cast_nullable_to_non_nullable
as bool?,residentKey: freezed == residentKey ? _self.residentKey : residentKey // ignore: cast_nullable_to_non_nullable
as String?,userVerification: freezed == userVerification ? _self.userVerification : userVerification // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiWebAuthnExtensionsInput {

 bool get credentialProperties;
/// Create a copy of Sub2ApiWebAuthnExtensionsInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnExtensionsInputCopyWith<Sub2ApiWebAuthnExtensionsInput> get copyWith => _$Sub2ApiWebAuthnExtensionsInputCopyWithImpl<Sub2ApiWebAuthnExtensionsInput>(this as Sub2ApiWebAuthnExtensionsInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiWebAuthnExtensionsInput&&(identical(other.credentialProperties, credentialProperties) || other.credentialProperties == credentialProperties));
}


@override
int get hashCode => Object.hash(runtimeType,credentialProperties);

@override
String toString() {
  return 'Sub2ApiWebAuthnExtensionsInput(credentialProperties: $credentialProperties)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiWebAuthnExtensionsInputCopyWith<$Res>  {
  factory $Sub2ApiWebAuthnExtensionsInputCopyWith(Sub2ApiWebAuthnExtensionsInput value, $Res Function(Sub2ApiWebAuthnExtensionsInput) _then) = _$Sub2ApiWebAuthnExtensionsInputCopyWithImpl;
@useResult
$Res call({
 bool credentialProperties
});




}
/// @nodoc
class _$Sub2ApiWebAuthnExtensionsInputCopyWithImpl<$Res>
    implements $Sub2ApiWebAuthnExtensionsInputCopyWith<$Res> {
  _$Sub2ApiWebAuthnExtensionsInputCopyWithImpl(this._self, this._then);

  final Sub2ApiWebAuthnExtensionsInput _self;
  final $Res Function(Sub2ApiWebAuthnExtensionsInput) _then;

/// Create a copy of Sub2ApiWebAuthnExtensionsInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? credentialProperties = null,}) {
  return _then(_self.copyWith(
credentialProperties: null == credentialProperties ? _self.credentialProperties : credentialProperties // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiWebAuthnExtensionsInput].
extension Sub2ApiWebAuthnExtensionsInputPatterns on Sub2ApiWebAuthnExtensionsInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnExtensionsInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnExtensionsInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnExtensionsInput value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnExtensionsInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiWebAuthnExtensionsInput value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnExtensionsInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool credentialProperties)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnExtensionsInput() when $default != null:
return $default(_that.credentialProperties);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool credentialProperties)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnExtensionsInput():
return $default(_that.credentialProperties);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool credentialProperties)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnExtensionsInput() when $default != null:
return $default(_that.credentialProperties);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiWebAuthnExtensionsInput implements Sub2ApiWebAuthnExtensionsInput {
  const _Sub2ApiWebAuthnExtensionsInput({required this.credentialProperties});


@override final  bool credentialProperties;

/// Create a copy of Sub2ApiWebAuthnExtensionsInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiWebAuthnExtensionsInputCopyWith<_Sub2ApiWebAuthnExtensionsInput> get copyWith => __$Sub2ApiWebAuthnExtensionsInputCopyWithImpl<_Sub2ApiWebAuthnExtensionsInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiWebAuthnExtensionsInput&&(identical(other.credentialProperties, credentialProperties) || other.credentialProperties == credentialProperties));
}


@override
int get hashCode => Object.hash(runtimeType,credentialProperties);

@override
String toString() {
  return 'Sub2ApiWebAuthnExtensionsInput(credentialProperties: $credentialProperties)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiWebAuthnExtensionsInputCopyWith<$Res> implements $Sub2ApiWebAuthnExtensionsInputCopyWith<$Res> {
  factory _$Sub2ApiWebAuthnExtensionsInputCopyWith(_Sub2ApiWebAuthnExtensionsInput value, $Res Function(_Sub2ApiWebAuthnExtensionsInput) _then) = __$Sub2ApiWebAuthnExtensionsInputCopyWithImpl;
@override @useResult
$Res call({
 bool credentialProperties
});




}
/// @nodoc
class __$Sub2ApiWebAuthnExtensionsInputCopyWithImpl<$Res>
    implements _$Sub2ApiWebAuthnExtensionsInputCopyWith<$Res> {
  __$Sub2ApiWebAuthnExtensionsInputCopyWithImpl(this._self, this._then);

  final _Sub2ApiWebAuthnExtensionsInput _self;
  final $Res Function(_Sub2ApiWebAuthnExtensionsInput) _then;

/// Create a copy of Sub2ApiWebAuthnExtensionsInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? credentialProperties = null,}) {
  return _then(_Sub2ApiWebAuthnExtensionsInput(
credentialProperties: null == credentialProperties ? _self.credentialProperties : credentialProperties // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiWebAuthnCreationOptions {

 Sub2ApiWebAuthnRelyingParty get relyingParty; Sub2ApiWebAuthnUser get user; Uint8List get challenge; List<Sub2ApiWebAuthnCredentialParameter> get parameters; List<Sub2ApiWebAuthnCredentialDescriptor> get excludeCredentials; List<String> get hints; List<String> get attestationFormats; Sub2ApiWebAuthnExtensionsInput get extensions; Duration? get timeout; Sub2ApiWebAuthnAuthenticatorSelection? get authenticatorSelection; String? get attestation;
/// Create a copy of Sub2ApiWebAuthnCreationOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnCreationOptionsCopyWith<Sub2ApiWebAuthnCreationOptions> get copyWith => _$Sub2ApiWebAuthnCreationOptionsCopyWithImpl<Sub2ApiWebAuthnCreationOptions>(this as Sub2ApiWebAuthnCreationOptions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiWebAuthnCreationOptions&&(identical(other.relyingParty, relyingParty) || other.relyingParty == relyingParty)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.challenge, challenge)&&const DeepCollectionEquality().equals(other.parameters, parameters)&&const DeepCollectionEquality().equals(other.excludeCredentials, excludeCredentials)&&const DeepCollectionEquality().equals(other.hints, hints)&&const DeepCollectionEquality().equals(other.attestationFormats, attestationFormats)&&(identical(other.extensions, extensions) || other.extensions == extensions)&&(identical(other.timeout, timeout) || other.timeout == timeout)&&(identical(other.authenticatorSelection, authenticatorSelection) || other.authenticatorSelection == authenticatorSelection)&&(identical(other.attestation, attestation) || other.attestation == attestation));
}


@override
int get hashCode => Object.hash(runtimeType,relyingParty,user,const DeepCollectionEquality().hash(challenge),const DeepCollectionEquality().hash(parameters),const DeepCollectionEquality().hash(excludeCredentials),const DeepCollectionEquality().hash(hints),const DeepCollectionEquality().hash(attestationFormats),extensions,timeout,authenticatorSelection,attestation);

@override
String toString() {
  return 'Sub2ApiWebAuthnCreationOptions(relyingParty: $relyingParty, user: $user, challenge: $challenge, parameters: $parameters, excludeCredentials: $excludeCredentials, hints: $hints, attestationFormats: $attestationFormats, extensions: $extensions, timeout: $timeout, authenticatorSelection: $authenticatorSelection, attestation: $attestation)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiWebAuthnCreationOptionsCopyWith<$Res>  {
  factory $Sub2ApiWebAuthnCreationOptionsCopyWith(Sub2ApiWebAuthnCreationOptions value, $Res Function(Sub2ApiWebAuthnCreationOptions) _then) = _$Sub2ApiWebAuthnCreationOptionsCopyWithImpl;
@useResult
$Res call({
 Sub2ApiWebAuthnRelyingParty relyingParty, Sub2ApiWebAuthnUser user, Uint8List challenge, List<Sub2ApiWebAuthnCredentialParameter> parameters, List<Sub2ApiWebAuthnCredentialDescriptor> excludeCredentials, List<String> hints, List<String> attestationFormats, Sub2ApiWebAuthnExtensionsInput extensions, Duration? timeout, Sub2ApiWebAuthnAuthenticatorSelection? authenticatorSelection, String? attestation
});


$Sub2ApiWebAuthnRelyingPartyCopyWith<$Res> get relyingParty;$Sub2ApiWebAuthnUserCopyWith<$Res> get user;$Sub2ApiWebAuthnExtensionsInputCopyWith<$Res> get extensions;$Sub2ApiWebAuthnAuthenticatorSelectionCopyWith<$Res>? get authenticatorSelection;

}
/// @nodoc
class _$Sub2ApiWebAuthnCreationOptionsCopyWithImpl<$Res>
    implements $Sub2ApiWebAuthnCreationOptionsCopyWith<$Res> {
  _$Sub2ApiWebAuthnCreationOptionsCopyWithImpl(this._self, this._then);

  final Sub2ApiWebAuthnCreationOptions _self;
  final $Res Function(Sub2ApiWebAuthnCreationOptions) _then;

/// Create a copy of Sub2ApiWebAuthnCreationOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? relyingParty = null,Object? user = null,Object? challenge = null,Object? parameters = null,Object? excludeCredentials = null,Object? hints = null,Object? attestationFormats = null,Object? extensions = null,Object? timeout = freezed,Object? authenticatorSelection = freezed,Object? attestation = freezed,}) {
  return _then(_self.copyWith(
relyingParty: null == relyingParty ? _self.relyingParty : relyingParty // ignore: cast_nullable_to_non_nullable
as Sub2ApiWebAuthnRelyingParty,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Sub2ApiWebAuthnUser,challenge: null == challenge ? _self.challenge : challenge // ignore: cast_nullable_to_non_nullable
as Uint8List,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiWebAuthnCredentialParameter>,excludeCredentials: null == excludeCredentials ? _self.excludeCredentials : excludeCredentials // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiWebAuthnCredentialDescriptor>,hints: null == hints ? _self.hints : hints // ignore: cast_nullable_to_non_nullable
as List<String>,attestationFormats: null == attestationFormats ? _self.attestationFormats : attestationFormats // ignore: cast_nullable_to_non_nullable
as List<String>,extensions: null == extensions ? _self.extensions : extensions // ignore: cast_nullable_to_non_nullable
as Sub2ApiWebAuthnExtensionsInput,timeout: freezed == timeout ? _self.timeout : timeout // ignore: cast_nullable_to_non_nullable
as Duration?,authenticatorSelection: freezed == authenticatorSelection ? _self.authenticatorSelection : authenticatorSelection // ignore: cast_nullable_to_non_nullable
as Sub2ApiWebAuthnAuthenticatorSelection?,attestation: freezed == attestation ? _self.attestation : attestation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Sub2ApiWebAuthnCreationOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnRelyingPartyCopyWith<$Res> get relyingParty {

  return $Sub2ApiWebAuthnRelyingPartyCopyWith<$Res>(_self.relyingParty, (value) {
    return _then(_self.copyWith(relyingParty: value));
  });
}/// Create a copy of Sub2ApiWebAuthnCreationOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnUserCopyWith<$Res> get user {

  return $Sub2ApiWebAuthnUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of Sub2ApiWebAuthnCreationOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnExtensionsInputCopyWith<$Res> get extensions {

  return $Sub2ApiWebAuthnExtensionsInputCopyWith<$Res>(_self.extensions, (value) {
    return _then(_self.copyWith(extensions: value));
  });
}/// Create a copy of Sub2ApiWebAuthnCreationOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnAuthenticatorSelectionCopyWith<$Res>? get authenticatorSelection {
    if (_self.authenticatorSelection == null) {
    return null;
  }

  return $Sub2ApiWebAuthnAuthenticatorSelectionCopyWith<$Res>(_self.authenticatorSelection!, (value) {
    return _then(_self.copyWith(authenticatorSelection: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sub2ApiWebAuthnCreationOptions].
extension Sub2ApiWebAuthnCreationOptionsPatterns on Sub2ApiWebAuthnCreationOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnCreationOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCreationOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiWebAuthnCreationOptions value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCreationOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiWebAuthnCreationOptions value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCreationOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiWebAuthnRelyingParty relyingParty,  Sub2ApiWebAuthnUser user,  Uint8List challenge,  List<Sub2ApiWebAuthnCredentialParameter> parameters,  List<Sub2ApiWebAuthnCredentialDescriptor> excludeCredentials,  List<String> hints,  List<String> attestationFormats,  Sub2ApiWebAuthnExtensionsInput extensions,  Duration? timeout,  Sub2ApiWebAuthnAuthenticatorSelection? authenticatorSelection,  String? attestation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCreationOptions() when $default != null:
return $default(_that.relyingParty,_that.user,_that.challenge,_that.parameters,_that.excludeCredentials,_that.hints,_that.attestationFormats,_that.extensions,_that.timeout,_that.authenticatorSelection,_that.attestation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiWebAuthnRelyingParty relyingParty,  Sub2ApiWebAuthnUser user,  Uint8List challenge,  List<Sub2ApiWebAuthnCredentialParameter> parameters,  List<Sub2ApiWebAuthnCredentialDescriptor> excludeCredentials,  List<String> hints,  List<String> attestationFormats,  Sub2ApiWebAuthnExtensionsInput extensions,  Duration? timeout,  Sub2ApiWebAuthnAuthenticatorSelection? authenticatorSelection,  String? attestation)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCreationOptions():
return $default(_that.relyingParty,_that.user,_that.challenge,_that.parameters,_that.excludeCredentials,_that.hints,_that.attestationFormats,_that.extensions,_that.timeout,_that.authenticatorSelection,_that.attestation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiWebAuthnRelyingParty relyingParty,  Sub2ApiWebAuthnUser user,  Uint8List challenge,  List<Sub2ApiWebAuthnCredentialParameter> parameters,  List<Sub2ApiWebAuthnCredentialDescriptor> excludeCredentials,  List<String> hints,  List<String> attestationFormats,  Sub2ApiWebAuthnExtensionsInput extensions,  Duration? timeout,  Sub2ApiWebAuthnAuthenticatorSelection? authenticatorSelection,  String? attestation)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWebAuthnCreationOptions() when $default != null:
return $default(_that.relyingParty,_that.user,_that.challenge,_that.parameters,_that.excludeCredentials,_that.hints,_that.attestationFormats,_that.extensions,_that.timeout,_that.authenticatorSelection,_that.attestation);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiWebAuthnCreationOptions implements Sub2ApiWebAuthnCreationOptions {
  const _Sub2ApiWebAuthnCreationOptions({required this.relyingParty, required this.user, required this.challenge, required final  List<Sub2ApiWebAuthnCredentialParameter> parameters, required final  List<Sub2ApiWebAuthnCredentialDescriptor> excludeCredentials, required final  List<String> hints, required final  List<String> attestationFormats, required this.extensions, this.timeout, this.authenticatorSelection, this.attestation}): _parameters = parameters,_excludeCredentials = excludeCredentials,_hints = hints,_attestationFormats = attestationFormats;


@override final  Sub2ApiWebAuthnRelyingParty relyingParty;
@override final  Sub2ApiWebAuthnUser user;
@override final  Uint8List challenge;
 final  List<Sub2ApiWebAuthnCredentialParameter> _parameters;
@override List<Sub2ApiWebAuthnCredentialParameter> get parameters {
  if (_parameters is EqualUnmodifiableListView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parameters);
}

 final  List<Sub2ApiWebAuthnCredentialDescriptor> _excludeCredentials;
@override List<Sub2ApiWebAuthnCredentialDescriptor> get excludeCredentials {
  if (_excludeCredentials is EqualUnmodifiableListView) return _excludeCredentials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_excludeCredentials);
}

 final  List<String> _hints;
@override List<String> get hints {
  if (_hints is EqualUnmodifiableListView) return _hints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hints);
}

 final  List<String> _attestationFormats;
@override List<String> get attestationFormats {
  if (_attestationFormats is EqualUnmodifiableListView) return _attestationFormats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attestationFormats);
}

@override final  Sub2ApiWebAuthnExtensionsInput extensions;
@override final  Duration? timeout;
@override final  Sub2ApiWebAuthnAuthenticatorSelection? authenticatorSelection;
@override final  String? attestation;

/// Create a copy of Sub2ApiWebAuthnCreationOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiWebAuthnCreationOptionsCopyWith<_Sub2ApiWebAuthnCreationOptions> get copyWith => __$Sub2ApiWebAuthnCreationOptionsCopyWithImpl<_Sub2ApiWebAuthnCreationOptions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiWebAuthnCreationOptions&&(identical(other.relyingParty, relyingParty) || other.relyingParty == relyingParty)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.challenge, challenge)&&const DeepCollectionEquality().equals(other._parameters, _parameters)&&const DeepCollectionEquality().equals(other._excludeCredentials, _excludeCredentials)&&const DeepCollectionEquality().equals(other._hints, _hints)&&const DeepCollectionEquality().equals(other._attestationFormats, _attestationFormats)&&(identical(other.extensions, extensions) || other.extensions == extensions)&&(identical(other.timeout, timeout) || other.timeout == timeout)&&(identical(other.authenticatorSelection, authenticatorSelection) || other.authenticatorSelection == authenticatorSelection)&&(identical(other.attestation, attestation) || other.attestation == attestation));
}


@override
int get hashCode => Object.hash(runtimeType,relyingParty,user,const DeepCollectionEquality().hash(challenge),const DeepCollectionEquality().hash(_parameters),const DeepCollectionEquality().hash(_excludeCredentials),const DeepCollectionEquality().hash(_hints),const DeepCollectionEquality().hash(_attestationFormats),extensions,timeout,authenticatorSelection,attestation);

@override
String toString() {
  return 'Sub2ApiWebAuthnCreationOptions(relyingParty: $relyingParty, user: $user, challenge: $challenge, parameters: $parameters, excludeCredentials: $excludeCredentials, hints: $hints, attestationFormats: $attestationFormats, extensions: $extensions, timeout: $timeout, authenticatorSelection: $authenticatorSelection, attestation: $attestation)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiWebAuthnCreationOptionsCopyWith<$Res> implements $Sub2ApiWebAuthnCreationOptionsCopyWith<$Res> {
  factory _$Sub2ApiWebAuthnCreationOptionsCopyWith(_Sub2ApiWebAuthnCreationOptions value, $Res Function(_Sub2ApiWebAuthnCreationOptions) _then) = __$Sub2ApiWebAuthnCreationOptionsCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiWebAuthnRelyingParty relyingParty, Sub2ApiWebAuthnUser user, Uint8List challenge, List<Sub2ApiWebAuthnCredentialParameter> parameters, List<Sub2ApiWebAuthnCredentialDescriptor> excludeCredentials, List<String> hints, List<String> attestationFormats, Sub2ApiWebAuthnExtensionsInput extensions, Duration? timeout, Sub2ApiWebAuthnAuthenticatorSelection? authenticatorSelection, String? attestation
});


@override $Sub2ApiWebAuthnRelyingPartyCopyWith<$Res> get relyingParty;@override $Sub2ApiWebAuthnUserCopyWith<$Res> get user;@override $Sub2ApiWebAuthnExtensionsInputCopyWith<$Res> get extensions;@override $Sub2ApiWebAuthnAuthenticatorSelectionCopyWith<$Res>? get authenticatorSelection;

}
/// @nodoc
class __$Sub2ApiWebAuthnCreationOptionsCopyWithImpl<$Res>
    implements _$Sub2ApiWebAuthnCreationOptionsCopyWith<$Res> {
  __$Sub2ApiWebAuthnCreationOptionsCopyWithImpl(this._self, this._then);

  final _Sub2ApiWebAuthnCreationOptions _self;
  final $Res Function(_Sub2ApiWebAuthnCreationOptions) _then;

/// Create a copy of Sub2ApiWebAuthnCreationOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? relyingParty = null,Object? user = null,Object? challenge = null,Object? parameters = null,Object? excludeCredentials = null,Object? hints = null,Object? attestationFormats = null,Object? extensions = null,Object? timeout = freezed,Object? authenticatorSelection = freezed,Object? attestation = freezed,}) {
  return _then(_Sub2ApiWebAuthnCreationOptions(
relyingParty: null == relyingParty ? _self.relyingParty : relyingParty // ignore: cast_nullable_to_non_nullable
as Sub2ApiWebAuthnRelyingParty,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Sub2ApiWebAuthnUser,challenge: null == challenge ? _self.challenge : challenge // ignore: cast_nullable_to_non_nullable
as Uint8List,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiWebAuthnCredentialParameter>,excludeCredentials: null == excludeCredentials ? _self._excludeCredentials : excludeCredentials // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiWebAuthnCredentialDescriptor>,hints: null == hints ? _self._hints : hints // ignore: cast_nullable_to_non_nullable
as List<String>,attestationFormats: null == attestationFormats ? _self._attestationFormats : attestationFormats // ignore: cast_nullable_to_non_nullable
as List<String>,extensions: null == extensions ? _self.extensions : extensions // ignore: cast_nullable_to_non_nullable
as Sub2ApiWebAuthnExtensionsInput,timeout: freezed == timeout ? _self.timeout : timeout // ignore: cast_nullable_to_non_nullable
as Duration?,authenticatorSelection: freezed == authenticatorSelection ? _self.authenticatorSelection : authenticatorSelection // ignore: cast_nullable_to_non_nullable
as Sub2ApiWebAuthnAuthenticatorSelection?,attestation: freezed == attestation ? _self.attestation : attestation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Sub2ApiWebAuthnCreationOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnRelyingPartyCopyWith<$Res> get relyingParty {

  return $Sub2ApiWebAuthnRelyingPartyCopyWith<$Res>(_self.relyingParty, (value) {
    return _then(_self.copyWith(relyingParty: value));
  });
}/// Create a copy of Sub2ApiWebAuthnCreationOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnUserCopyWith<$Res> get user {

  return $Sub2ApiWebAuthnUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of Sub2ApiWebAuthnCreationOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnExtensionsInputCopyWith<$Res> get extensions {

  return $Sub2ApiWebAuthnExtensionsInputCopyWith<$Res>(_self.extensions, (value) {
    return _then(_self.copyWith(extensions: value));
  });
}/// Create a copy of Sub2ApiWebAuthnCreationOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnAuthenticatorSelectionCopyWith<$Res>? get authenticatorSelection {
    if (_self.authenticatorSelection == null) {
    return null;
  }

  return $Sub2ApiWebAuthnAuthenticatorSelectionCopyWith<$Res>(_self.authenticatorSelection!, (value) {
    return _then(_self.copyWith(authenticatorSelection: value));
  });
}
}

/// @nodoc
mixin _$Sub2ApiPasskeyRegistrationChallenge {

 Sub2ApiPasskeySessionToken get sessionToken; Sub2ApiWebAuthnCreationOptions get options; String? get mediation;
/// Create a copy of Sub2ApiPasskeyRegistrationChallenge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiPasskeyRegistrationChallengeCopyWith<Sub2ApiPasskeyRegistrationChallenge> get copyWith => _$Sub2ApiPasskeyRegistrationChallengeCopyWithImpl<Sub2ApiPasskeyRegistrationChallenge>(this as Sub2ApiPasskeyRegistrationChallenge, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiPasskeyRegistrationChallenge&&(identical(other.sessionToken, sessionToken) || other.sessionToken == sessionToken)&&(identical(other.options, options) || other.options == options)&&(identical(other.mediation, mediation) || other.mediation == mediation));
}


@override
int get hashCode => Object.hash(runtimeType,sessionToken,options,mediation);

@override
String toString() {
  return 'Sub2ApiPasskeyRegistrationChallenge(sessionToken: $sessionToken, options: $options, mediation: $mediation)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiPasskeyRegistrationChallengeCopyWith<$Res>  {
  factory $Sub2ApiPasskeyRegistrationChallengeCopyWith(Sub2ApiPasskeyRegistrationChallenge value, $Res Function(Sub2ApiPasskeyRegistrationChallenge) _then) = _$Sub2ApiPasskeyRegistrationChallengeCopyWithImpl;
@useResult
$Res call({
 Sub2ApiPasskeySessionToken sessionToken, Sub2ApiWebAuthnCreationOptions options, String? mediation
});


$Sub2ApiWebAuthnCreationOptionsCopyWith<$Res> get options;

}
/// @nodoc
class _$Sub2ApiPasskeyRegistrationChallengeCopyWithImpl<$Res>
    implements $Sub2ApiPasskeyRegistrationChallengeCopyWith<$Res> {
  _$Sub2ApiPasskeyRegistrationChallengeCopyWithImpl(this._self, this._then);

  final Sub2ApiPasskeyRegistrationChallenge _self;
  final $Res Function(Sub2ApiPasskeyRegistrationChallenge) _then;

/// Create a copy of Sub2ApiPasskeyRegistrationChallenge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionToken = null,Object? options = null,Object? mediation = freezed,}) {
  return _then(_self.copyWith(
sessionToken: null == sessionToken ? _self.sessionToken : sessionToken // ignore: cast_nullable_to_non_nullable
as Sub2ApiPasskeySessionToken,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Sub2ApiWebAuthnCreationOptions,mediation: freezed == mediation ? _self.mediation : mediation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Sub2ApiPasskeyRegistrationChallenge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnCreationOptionsCopyWith<$Res> get options {

  return $Sub2ApiWebAuthnCreationOptionsCopyWith<$Res>(_self.options, (value) {
    return _then(_self.copyWith(options: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sub2ApiPasskeyRegistrationChallenge].
extension Sub2ApiPasskeyRegistrationChallengePatterns on Sub2ApiPasskeyRegistrationChallenge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiPasskeyRegistrationChallenge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiPasskeyRegistrationChallenge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiPasskeyRegistrationChallenge value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPasskeyRegistrationChallenge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiPasskeyRegistrationChallenge value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPasskeyRegistrationChallenge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiPasskeySessionToken sessionToken,  Sub2ApiWebAuthnCreationOptions options,  String? mediation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiPasskeyRegistrationChallenge() when $default != null:
return $default(_that.sessionToken,_that.options,_that.mediation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiPasskeySessionToken sessionToken,  Sub2ApiWebAuthnCreationOptions options,  String? mediation)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPasskeyRegistrationChallenge():
return $default(_that.sessionToken,_that.options,_that.mediation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiPasskeySessionToken sessionToken,  Sub2ApiWebAuthnCreationOptions options,  String? mediation)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPasskeyRegistrationChallenge() when $default != null:
return $default(_that.sessionToken,_that.options,_that.mediation);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiPasskeyRegistrationChallenge implements Sub2ApiPasskeyRegistrationChallenge {
  const _Sub2ApiPasskeyRegistrationChallenge({required this.sessionToken, required this.options, this.mediation});


@override final  Sub2ApiPasskeySessionToken sessionToken;
@override final  Sub2ApiWebAuthnCreationOptions options;
@override final  String? mediation;

/// Create a copy of Sub2ApiPasskeyRegistrationChallenge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiPasskeyRegistrationChallengeCopyWith<_Sub2ApiPasskeyRegistrationChallenge> get copyWith => __$Sub2ApiPasskeyRegistrationChallengeCopyWithImpl<_Sub2ApiPasskeyRegistrationChallenge>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiPasskeyRegistrationChallenge&&(identical(other.sessionToken, sessionToken) || other.sessionToken == sessionToken)&&(identical(other.options, options) || other.options == options)&&(identical(other.mediation, mediation) || other.mediation == mediation));
}


@override
int get hashCode => Object.hash(runtimeType,sessionToken,options,mediation);

@override
String toString() {
  return 'Sub2ApiPasskeyRegistrationChallenge(sessionToken: $sessionToken, options: $options, mediation: $mediation)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiPasskeyRegistrationChallengeCopyWith<$Res> implements $Sub2ApiPasskeyRegistrationChallengeCopyWith<$Res> {
  factory _$Sub2ApiPasskeyRegistrationChallengeCopyWith(_Sub2ApiPasskeyRegistrationChallenge value, $Res Function(_Sub2ApiPasskeyRegistrationChallenge) _then) = __$Sub2ApiPasskeyRegistrationChallengeCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiPasskeySessionToken sessionToken, Sub2ApiWebAuthnCreationOptions options, String? mediation
});


@override $Sub2ApiWebAuthnCreationOptionsCopyWith<$Res> get options;

}
/// @nodoc
class __$Sub2ApiPasskeyRegistrationChallengeCopyWithImpl<$Res>
    implements _$Sub2ApiPasskeyRegistrationChallengeCopyWith<$Res> {
  __$Sub2ApiPasskeyRegistrationChallengeCopyWithImpl(this._self, this._then);

  final _Sub2ApiPasskeyRegistrationChallenge _self;
  final $Res Function(_Sub2ApiPasskeyRegistrationChallenge) _then;

/// Create a copy of Sub2ApiPasskeyRegistrationChallenge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionToken = null,Object? options = null,Object? mediation = freezed,}) {
  return _then(_Sub2ApiPasskeyRegistrationChallenge(
sessionToken: null == sessionToken ? _self.sessionToken : sessionToken // ignore: cast_nullable_to_non_nullable
as Sub2ApiPasskeySessionToken,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Sub2ApiWebAuthnCreationOptions,mediation: freezed == mediation ? _self.mediation : mediation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Sub2ApiPasskeyRegistrationChallenge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiWebAuthnCreationOptionsCopyWith<$Res> get options {

  return $Sub2ApiWebAuthnCreationOptionsCopyWith<$Res>(_self.options, (value) {
    return _then(_self.copyWith(options: value));
  });
}
}

/// @nodoc
mixin _$Sub2ApiPasskeyCredentialSummary {

 int get id; String get name; DateTime get createdAt; bool get backup; DateTime? get lastUsedAt;
/// Create a copy of Sub2ApiPasskeyCredentialSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiPasskeyCredentialSummaryCopyWith<Sub2ApiPasskeyCredentialSummary> get copyWith => _$Sub2ApiPasskeyCredentialSummaryCopyWithImpl<Sub2ApiPasskeyCredentialSummary>(this as Sub2ApiPasskeyCredentialSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiPasskeyCredentialSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.backup, backup) || other.backup == backup)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,backup,lastUsedAt);

@override
String toString() {
  return 'Sub2ApiPasskeyCredentialSummary(id: $id, name: $name, createdAt: $createdAt, backup: $backup, lastUsedAt: $lastUsedAt)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiPasskeyCredentialSummaryCopyWith<$Res>  {
  factory $Sub2ApiPasskeyCredentialSummaryCopyWith(Sub2ApiPasskeyCredentialSummary value, $Res Function(Sub2ApiPasskeyCredentialSummary) _then) = _$Sub2ApiPasskeyCredentialSummaryCopyWithImpl;
@useResult
$Res call({
 int id, String name, DateTime createdAt, bool backup, DateTime? lastUsedAt
});




}
/// @nodoc
class _$Sub2ApiPasskeyCredentialSummaryCopyWithImpl<$Res>
    implements $Sub2ApiPasskeyCredentialSummaryCopyWith<$Res> {
  _$Sub2ApiPasskeyCredentialSummaryCopyWithImpl(this._self, this._then);

  final Sub2ApiPasskeyCredentialSummary _self;
  final $Res Function(Sub2ApiPasskeyCredentialSummary) _then;

/// Create a copy of Sub2ApiPasskeyCredentialSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? createdAt = null,Object? backup = null,Object? lastUsedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,backup: null == backup ? _self.backup : backup // ignore: cast_nullable_to_non_nullable
as bool,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiPasskeyCredentialSummary].
extension Sub2ApiPasskeyCredentialSummaryPatterns on Sub2ApiPasskeyCredentialSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiPasskeyCredentialSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiPasskeyCredentialSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiPasskeyCredentialSummary value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPasskeyCredentialSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiPasskeyCredentialSummary value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPasskeyCredentialSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  DateTime createdAt,  bool backup,  DateTime? lastUsedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiPasskeyCredentialSummary() when $default != null:
return $default(_that.id,_that.name,_that.createdAt,_that.backup,_that.lastUsedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  DateTime createdAt,  bool backup,  DateTime? lastUsedAt)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPasskeyCredentialSummary():
return $default(_that.id,_that.name,_that.createdAt,_that.backup,_that.lastUsedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  DateTime createdAt,  bool backup,  DateTime? lastUsedAt)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPasskeyCredentialSummary() when $default != null:
return $default(_that.id,_that.name,_that.createdAt,_that.backup,_that.lastUsedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiPasskeyCredentialSummary implements Sub2ApiPasskeyCredentialSummary {
  const _Sub2ApiPasskeyCredentialSummary({required this.id, required this.name, required this.createdAt, required this.backup, this.lastUsedAt});


@override final  int id;
@override final  String name;
@override final  DateTime createdAt;
@override final  bool backup;
@override final  DateTime? lastUsedAt;

/// Create a copy of Sub2ApiPasskeyCredentialSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiPasskeyCredentialSummaryCopyWith<_Sub2ApiPasskeyCredentialSummary> get copyWith => __$Sub2ApiPasskeyCredentialSummaryCopyWithImpl<_Sub2ApiPasskeyCredentialSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiPasskeyCredentialSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.backup, backup) || other.backup == backup)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,backup,lastUsedAt);

@override
String toString() {
  return 'Sub2ApiPasskeyCredentialSummary(id: $id, name: $name, createdAt: $createdAt, backup: $backup, lastUsedAt: $lastUsedAt)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiPasskeyCredentialSummaryCopyWith<$Res> implements $Sub2ApiPasskeyCredentialSummaryCopyWith<$Res> {
  factory _$Sub2ApiPasskeyCredentialSummaryCopyWith(_Sub2ApiPasskeyCredentialSummary value, $Res Function(_Sub2ApiPasskeyCredentialSummary) _then) = __$Sub2ApiPasskeyCredentialSummaryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, DateTime createdAt, bool backup, DateTime? lastUsedAt
});




}
/// @nodoc
class __$Sub2ApiPasskeyCredentialSummaryCopyWithImpl<$Res>
    implements _$Sub2ApiPasskeyCredentialSummaryCopyWith<$Res> {
  __$Sub2ApiPasskeyCredentialSummaryCopyWithImpl(this._self, this._then);

  final _Sub2ApiPasskeyCredentialSummary _self;
  final $Res Function(_Sub2ApiPasskeyCredentialSummary) _then;

/// Create a copy of Sub2ApiPasskeyCredentialSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? createdAt = null,Object? backup = null,Object? lastUsedAt = freezed,}) {
  return _then(_Sub2ApiPasskeyCredentialSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,backup: null == backup ? _self.backup : backup // ignore: cast_nullable_to_non_nullable
as bool,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
