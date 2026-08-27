// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sub2ApiAuthenticatedUser {

 int get id; String get email; String get role; String get username;
/// Create a copy of Sub2ApiAuthenticatedUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAuthenticatedUserCopyWith<Sub2ApiAuthenticatedUser> get copyWith => _$Sub2ApiAuthenticatedUserCopyWithImpl<Sub2ApiAuthenticatedUser>(this as Sub2ApiAuthenticatedUser, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAuthenticatedUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.username, username) || other.username == username));
}


@override
int get hashCode => Object.hash(runtimeType,id,email,role,username);

@override
String toString() {
  return 'Sub2ApiAuthenticatedUser(id: $id, email: $email, role: $role, username: $username)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAuthenticatedUserCopyWith<$Res>  {
  factory $Sub2ApiAuthenticatedUserCopyWith(Sub2ApiAuthenticatedUser value, $Res Function(Sub2ApiAuthenticatedUser) _then) = _$Sub2ApiAuthenticatedUserCopyWithImpl;
@useResult
$Res call({
 int id, String email, String role, String username
});




}
/// @nodoc
class _$Sub2ApiAuthenticatedUserCopyWithImpl<$Res>
    implements $Sub2ApiAuthenticatedUserCopyWith<$Res> {
  _$Sub2ApiAuthenticatedUserCopyWithImpl(this._self, this._then);

  final Sub2ApiAuthenticatedUser _self;
  final $Res Function(Sub2ApiAuthenticatedUser) _then;

/// Create a copy of Sub2ApiAuthenticatedUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? role = null,Object? username = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAuthenticatedUser].
extension Sub2ApiAuthenticatedUserPatterns on Sub2ApiAuthenticatedUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAuthenticatedUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAuthenticatedUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAuthenticatedUser value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAuthenticatedUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAuthenticatedUser value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAuthenticatedUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String email,  String role,  String username)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAuthenticatedUser() when $default != null:
return $default(_that.id,_that.email,_that.role,_that.username);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String email,  String role,  String username)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAuthenticatedUser():
return $default(_that.id,_that.email,_that.role,_that.username);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String email,  String role,  String username)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAuthenticatedUser() when $default != null:
return $default(_that.id,_that.email,_that.role,_that.username);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAuthenticatedUser implements Sub2ApiAuthenticatedUser {
  const _Sub2ApiAuthenticatedUser({required this.id, required this.email, required this.role, required this.username});


@override final  int id;
@override final  String email;
@override final  String role;
@override final  String username;

/// Create a copy of Sub2ApiAuthenticatedUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAuthenticatedUserCopyWith<_Sub2ApiAuthenticatedUser> get copyWith => __$Sub2ApiAuthenticatedUserCopyWithImpl<_Sub2ApiAuthenticatedUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAuthenticatedUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.username, username) || other.username == username));
}


@override
int get hashCode => Object.hash(runtimeType,id,email,role,username);

@override
String toString() {
  return 'Sub2ApiAuthenticatedUser(id: $id, email: $email, role: $role, username: $username)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAuthenticatedUserCopyWith<$Res> implements $Sub2ApiAuthenticatedUserCopyWith<$Res> {
  factory _$Sub2ApiAuthenticatedUserCopyWith(_Sub2ApiAuthenticatedUser value, $Res Function(_Sub2ApiAuthenticatedUser) _then) = __$Sub2ApiAuthenticatedUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String email, String role, String username
});




}
/// @nodoc
class __$Sub2ApiAuthenticatedUserCopyWithImpl<$Res>
    implements _$Sub2ApiAuthenticatedUserCopyWith<$Res> {
  __$Sub2ApiAuthenticatedUserCopyWithImpl(this._self, this._then);

  final _Sub2ApiAuthenticatedUser _self;
  final $Res Function(_Sub2ApiAuthenticatedUser) _then;

/// Create a copy of Sub2ApiAuthenticatedUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? role = null,Object? username = null,}) {
  return _then(_Sub2ApiAuthenticatedUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiCurrentUser {

 Sub2ApiUserAccountSnapshot get account; String get runMode;
/// Create a copy of Sub2ApiCurrentUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiCurrentUserCopyWith<Sub2ApiCurrentUser> get copyWith => _$Sub2ApiCurrentUserCopyWithImpl<Sub2ApiCurrentUser>(this as Sub2ApiCurrentUser, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiCurrentUser&&(identical(other.account, account) || other.account == account)&&(identical(other.runMode, runMode) || other.runMode == runMode));
}


@override
int get hashCode => Object.hash(runtimeType,account,runMode);

@override
String toString() {
  return 'Sub2ApiCurrentUser(account: $account, runMode: $runMode)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiCurrentUserCopyWith<$Res>  {
  factory $Sub2ApiCurrentUserCopyWith(Sub2ApiCurrentUser value, $Res Function(Sub2ApiCurrentUser) _then) = _$Sub2ApiCurrentUserCopyWithImpl;
@useResult
$Res call({
 Sub2ApiUserAccountSnapshot account, String runMode
});


$Sub2ApiUserAccountSnapshotCopyWith<$Res> get account;

}
/// @nodoc
class _$Sub2ApiCurrentUserCopyWithImpl<$Res>
    implements $Sub2ApiCurrentUserCopyWith<$Res> {
  _$Sub2ApiCurrentUserCopyWithImpl(this._self, this._then);

  final Sub2ApiCurrentUser _self;
  final $Res Function(Sub2ApiCurrentUser) _then;

/// Create a copy of Sub2ApiCurrentUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? account = null,Object? runMode = null,}) {
  return _then(_self.copyWith(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Sub2ApiUserAccountSnapshot,runMode: null == runMode ? _self.runMode : runMode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Sub2ApiCurrentUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiUserAccountSnapshotCopyWith<$Res> get account {

  return $Sub2ApiUserAccountSnapshotCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sub2ApiCurrentUser].
extension Sub2ApiCurrentUserPatterns on Sub2ApiCurrentUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiCurrentUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiCurrentUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiCurrentUser value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiCurrentUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiCurrentUser value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiCurrentUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiUserAccountSnapshot account,  String runMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiCurrentUser() when $default != null:
return $default(_that.account,_that.runMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiUserAccountSnapshot account,  String runMode)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiCurrentUser():
return $default(_that.account,_that.runMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiUserAccountSnapshot account,  String runMode)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiCurrentUser() when $default != null:
return $default(_that.account,_that.runMode);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiCurrentUser extends Sub2ApiCurrentUser {
  const _Sub2ApiCurrentUser({required this.account, required this.runMode}): super._();


@override final  Sub2ApiUserAccountSnapshot account;
@override final  String runMode;

/// Create a copy of Sub2ApiCurrentUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiCurrentUserCopyWith<_Sub2ApiCurrentUser> get copyWith => __$Sub2ApiCurrentUserCopyWithImpl<_Sub2ApiCurrentUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiCurrentUser&&(identical(other.account, account) || other.account == account)&&(identical(other.runMode, runMode) || other.runMode == runMode));
}


@override
int get hashCode => Object.hash(runtimeType,account,runMode);

@override
String toString() {
  return 'Sub2ApiCurrentUser(account: $account, runMode: $runMode)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiCurrentUserCopyWith<$Res> implements $Sub2ApiCurrentUserCopyWith<$Res> {
  factory _$Sub2ApiCurrentUserCopyWith(_Sub2ApiCurrentUser value, $Res Function(_Sub2ApiCurrentUser) _then) = __$Sub2ApiCurrentUserCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiUserAccountSnapshot account, String runMode
});


@override $Sub2ApiUserAccountSnapshotCopyWith<$Res> get account;

}
/// @nodoc
class __$Sub2ApiCurrentUserCopyWithImpl<$Res>
    implements _$Sub2ApiCurrentUserCopyWith<$Res> {
  __$Sub2ApiCurrentUserCopyWithImpl(this._self, this._then);

  final _Sub2ApiCurrentUser _self;
  final $Res Function(_Sub2ApiCurrentUser) _then;

/// Create a copy of Sub2ApiCurrentUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? account = null,Object? runMode = null,}) {
  return _then(_Sub2ApiCurrentUser(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Sub2ApiUserAccountSnapshot,runMode: null == runMode ? _self.runMode : runMode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Sub2ApiCurrentUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiUserAccountSnapshotCopyWith<$Res> get account {

  return $Sub2ApiUserAccountSnapshotCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}

/// @nodoc
mixin _$Sub2ApiLoginResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiLoginResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Sub2ApiLoginResult()';
}


}

/// @nodoc
class $Sub2ApiLoginResultCopyWith<$Res>  {
$Sub2ApiLoginResultCopyWith(Sub2ApiLoginResult _, $Res Function(Sub2ApiLoginResult) __);
}


/// Adds pattern-matching-related methods to [Sub2ApiLoginResult].
extension Sub2ApiLoginResultPatterns on Sub2ApiLoginResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Sub2ApiAuthenticated value)?  authenticated,TResult Function( Sub2ApiTwoFactorRequired value)?  twoFactorRequired,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Sub2ApiAuthenticated() when authenticated != null:
return authenticated(_that);case Sub2ApiTwoFactorRequired() when twoFactorRequired != null:
return twoFactorRequired(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Sub2ApiAuthenticated value)  authenticated,required TResult Function( Sub2ApiTwoFactorRequired value)  twoFactorRequired,}){
final _that = this;
switch (_that) {
case Sub2ApiAuthenticated():
return authenticated(_that);case Sub2ApiTwoFactorRequired():
return twoFactorRequired(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Sub2ApiAuthenticated value)?  authenticated,TResult? Function( Sub2ApiTwoFactorRequired value)?  twoFactorRequired,}){
final _that = this;
switch (_that) {
case Sub2ApiAuthenticated() when authenticated != null:
return authenticated(_that);case Sub2ApiTwoFactorRequired() when twoFactorRequired != null:
return twoFactorRequired(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Sub2ApiAuthenticatedUser user,  Sub2ApiSession session)?  authenticated,TResult Function( Sub2ApiTwoFactorTemporaryToken temporaryToken,  String userEmailMasked)?  twoFactorRequired,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Sub2ApiAuthenticated() when authenticated != null:
return authenticated(_that.user,_that.session);case Sub2ApiTwoFactorRequired() when twoFactorRequired != null:
return twoFactorRequired(_that.temporaryToken,_that.userEmailMasked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Sub2ApiAuthenticatedUser user,  Sub2ApiSession session)  authenticated,required TResult Function( Sub2ApiTwoFactorTemporaryToken temporaryToken,  String userEmailMasked)  twoFactorRequired,}) {final _that = this;
switch (_that) {
case Sub2ApiAuthenticated():
return authenticated(_that.user,_that.session);case Sub2ApiTwoFactorRequired():
return twoFactorRequired(_that.temporaryToken,_that.userEmailMasked);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Sub2ApiAuthenticatedUser user,  Sub2ApiSession session)?  authenticated,TResult? Function( Sub2ApiTwoFactorTemporaryToken temporaryToken,  String userEmailMasked)?  twoFactorRequired,}) {final _that = this;
switch (_that) {
case Sub2ApiAuthenticated() when authenticated != null:
return authenticated(_that.user,_that.session);case Sub2ApiTwoFactorRequired() when twoFactorRequired != null:
return twoFactorRequired(_that.temporaryToken,_that.userEmailMasked);case _:
  return null;

}
}

}

/// @nodoc


class Sub2ApiAuthenticated implements Sub2ApiLoginResult {
  const Sub2ApiAuthenticated({required this.user, required this.session});


 final  Sub2ApiAuthenticatedUser user;
 final  Sub2ApiSession session;

/// Create a copy of Sub2ApiLoginResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAuthenticatedCopyWith<Sub2ApiAuthenticated> get copyWith => _$Sub2ApiAuthenticatedCopyWithImpl<Sub2ApiAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAuthenticated&&(identical(other.user, user) || other.user == user)&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,user,session);

@override
String toString() {
  return 'Sub2ApiLoginResult.authenticated(user: $user, session: $session)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAuthenticatedCopyWith<$Res> implements $Sub2ApiLoginResultCopyWith<$Res> {
  factory $Sub2ApiAuthenticatedCopyWith(Sub2ApiAuthenticated value, $Res Function(Sub2ApiAuthenticated) _then) = _$Sub2ApiAuthenticatedCopyWithImpl;
@useResult
$Res call({
 Sub2ApiAuthenticatedUser user, Sub2ApiSession session
});


$Sub2ApiAuthenticatedUserCopyWith<$Res> get user;

}
/// @nodoc
class _$Sub2ApiAuthenticatedCopyWithImpl<$Res>
    implements $Sub2ApiAuthenticatedCopyWith<$Res> {
  _$Sub2ApiAuthenticatedCopyWithImpl(this._self, this._then);

  final Sub2ApiAuthenticated _self;
  final $Res Function(Sub2ApiAuthenticated) _then;

/// Create a copy of Sub2ApiLoginResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? session = null,}) {
  return _then(Sub2ApiAuthenticated(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Sub2ApiAuthenticatedUser,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Sub2ApiSession,
  ));
}

/// Create a copy of Sub2ApiLoginResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiAuthenticatedUserCopyWith<$Res> get user {

  return $Sub2ApiAuthenticatedUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class Sub2ApiTwoFactorRequired implements Sub2ApiLoginResult {
  const Sub2ApiTwoFactorRequired({required this.temporaryToken, required this.userEmailMasked});


 final  Sub2ApiTwoFactorTemporaryToken temporaryToken;
 final  String userEmailMasked;

/// Create a copy of Sub2ApiLoginResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiTwoFactorRequiredCopyWith<Sub2ApiTwoFactorRequired> get copyWith => _$Sub2ApiTwoFactorRequiredCopyWithImpl<Sub2ApiTwoFactorRequired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiTwoFactorRequired&&(identical(other.temporaryToken, temporaryToken) || other.temporaryToken == temporaryToken)&&(identical(other.userEmailMasked, userEmailMasked) || other.userEmailMasked == userEmailMasked));
}


@override
int get hashCode => Object.hash(runtimeType,temporaryToken,userEmailMasked);

@override
String toString() {
  return 'Sub2ApiLoginResult.twoFactorRequired(temporaryToken: $temporaryToken, userEmailMasked: $userEmailMasked)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiTwoFactorRequiredCopyWith<$Res> implements $Sub2ApiLoginResultCopyWith<$Res> {
  factory $Sub2ApiTwoFactorRequiredCopyWith(Sub2ApiTwoFactorRequired value, $Res Function(Sub2ApiTwoFactorRequired) _then) = _$Sub2ApiTwoFactorRequiredCopyWithImpl;
@useResult
$Res call({
 Sub2ApiTwoFactorTemporaryToken temporaryToken, String userEmailMasked
});




}
/// @nodoc
class _$Sub2ApiTwoFactorRequiredCopyWithImpl<$Res>
    implements $Sub2ApiTwoFactorRequiredCopyWith<$Res> {
  _$Sub2ApiTwoFactorRequiredCopyWithImpl(this._self, this._then);

  final Sub2ApiTwoFactorRequired _self;
  final $Res Function(Sub2ApiTwoFactorRequired) _then;

/// Create a copy of Sub2ApiLoginResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? temporaryToken = null,Object? userEmailMasked = null,}) {
  return _then(Sub2ApiTwoFactorRequired(
temporaryToken: null == temporaryToken ? _self.temporaryToken : temporaryToken // ignore: cast_nullable_to_non_nullable
as Sub2ApiTwoFactorTemporaryToken,userEmailMasked: null == userEmailMasked ? _self.userEmailMasked : userEmailMasked // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
