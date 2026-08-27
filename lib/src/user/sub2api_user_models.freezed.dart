// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_user_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sub2ApiUserProfile {

 int get id; String get email; String get username; String get role; Sub2ApiDecimal get balance; Sub2ApiDecimal get frozenBalance; int get concurrency; String get status; List<int> get allowedGroups; bool get balanceNotifyEnabled; String get balanceNotifyThresholdType; Sub2ApiDecimal? get balanceNotifyThreshold; Sub2ApiDecimal get totalRecharged; int get rpmLimit; DateTime get createdAt; DateTime get updatedAt; DateTime? get lastActiveAt; String? get avatarUrl;
/// Create a copy of Sub2ApiUserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiUserProfileCopyWith<Sub2ApiUserProfile> get copyWith => _$Sub2ApiUserProfileCopyWithImpl<Sub2ApiUserProfile>(this as Sub2ApiUserProfile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiUserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.role, role) || other.role == role)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.frozenBalance, frozenBalance) || other.frozenBalance == frozenBalance)&&(identical(other.concurrency, concurrency) || other.concurrency == concurrency)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.allowedGroups, allowedGroups)&&(identical(other.balanceNotifyEnabled, balanceNotifyEnabled) || other.balanceNotifyEnabled == balanceNotifyEnabled)&&(identical(other.balanceNotifyThresholdType, balanceNotifyThresholdType) || other.balanceNotifyThresholdType == balanceNotifyThresholdType)&&(identical(other.balanceNotifyThreshold, balanceNotifyThreshold) || other.balanceNotifyThreshold == balanceNotifyThreshold)&&(identical(other.totalRecharged, totalRecharged) || other.totalRecharged == totalRecharged)&&(identical(other.rpmLimit, rpmLimit) || other.rpmLimit == rpmLimit)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastActiveAt, lastActiveAt) || other.lastActiveAt == lastActiveAt)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,email,username,role,balance,frozenBalance,concurrency,status,const DeepCollectionEquality().hash(allowedGroups),balanceNotifyEnabled,balanceNotifyThresholdType,balanceNotifyThreshold,totalRecharged,rpmLimit,createdAt,updatedAt,lastActiveAt,avatarUrl);

@override
String toString() {
  return 'Sub2ApiUserProfile(id: $id, email: $email, username: $username, role: $role, balance: $balance, frozenBalance: $frozenBalance, concurrency: $concurrency, status: $status, allowedGroups: $allowedGroups, balanceNotifyEnabled: $balanceNotifyEnabled, balanceNotifyThresholdType: $balanceNotifyThresholdType, balanceNotifyThreshold: $balanceNotifyThreshold, totalRecharged: $totalRecharged, rpmLimit: $rpmLimit, createdAt: $createdAt, updatedAt: $updatedAt, lastActiveAt: $lastActiveAt, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiUserProfileCopyWith<$Res>  {
  factory $Sub2ApiUserProfileCopyWith(Sub2ApiUserProfile value, $Res Function(Sub2ApiUserProfile) _then) = _$Sub2ApiUserProfileCopyWithImpl;
@useResult
$Res call({
 int id, String email, String username, String role, Sub2ApiDecimal balance, Sub2ApiDecimal frozenBalance, int concurrency, String status, List<int> allowedGroups, bool balanceNotifyEnabled, String balanceNotifyThresholdType, Sub2ApiDecimal? balanceNotifyThreshold, Sub2ApiDecimal totalRecharged, int rpmLimit, DateTime createdAt, DateTime updatedAt, DateTime? lastActiveAt, String? avatarUrl
});




}
/// @nodoc
class _$Sub2ApiUserProfileCopyWithImpl<$Res>
    implements $Sub2ApiUserProfileCopyWith<$Res> {
  _$Sub2ApiUserProfileCopyWithImpl(this._self, this._then);

  final Sub2ApiUserProfile _self;
  final $Res Function(Sub2ApiUserProfile) _then;

/// Create a copy of Sub2ApiUserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? username = null,Object? role = null,Object? balance = null,Object? frozenBalance = null,Object? concurrency = null,Object? status = null,Object? allowedGroups = null,Object? balanceNotifyEnabled = null,Object? balanceNotifyThresholdType = null,Object? balanceNotifyThreshold = freezed,Object? totalRecharged = null,Object? rpmLimit = null,Object? createdAt = null,Object? updatedAt = null,Object? lastActiveAt = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,frozenBalance: null == frozenBalance ? _self.frozenBalance : frozenBalance // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,concurrency: null == concurrency ? _self.concurrency : concurrency // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,allowedGroups: null == allowedGroups ? _self.allowedGroups : allowedGroups // ignore: cast_nullable_to_non_nullable
as List<int>,balanceNotifyEnabled: null == balanceNotifyEnabled ? _self.balanceNotifyEnabled : balanceNotifyEnabled // ignore: cast_nullable_to_non_nullable
as bool,balanceNotifyThresholdType: null == balanceNotifyThresholdType ? _self.balanceNotifyThresholdType : balanceNotifyThresholdType // ignore: cast_nullable_to_non_nullable
as String,balanceNotifyThreshold: freezed == balanceNotifyThreshold ? _self.balanceNotifyThreshold : balanceNotifyThreshold // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,totalRecharged: null == totalRecharged ? _self.totalRecharged : totalRecharged // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,rpmLimit: null == rpmLimit ? _self.rpmLimit : rpmLimit // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastActiveAt: freezed == lastActiveAt ? _self.lastActiveAt : lastActiveAt // ignore: cast_nullable_to_non_nullable
as DateTime?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiUserProfile].
extension Sub2ApiUserProfilePatterns on Sub2ApiUserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiUserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiUserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiUserProfile value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiUserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiUserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiUserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String email,  String username,  String role,  Sub2ApiDecimal balance,  Sub2ApiDecimal frozenBalance,  int concurrency,  String status,  List<int> allowedGroups,  bool balanceNotifyEnabled,  String balanceNotifyThresholdType,  Sub2ApiDecimal? balanceNotifyThreshold,  Sub2ApiDecimal totalRecharged,  int rpmLimit,  DateTime createdAt,  DateTime updatedAt,  DateTime? lastActiveAt,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiUserProfile() when $default != null:
return $default(_that.id,_that.email,_that.username,_that.role,_that.balance,_that.frozenBalance,_that.concurrency,_that.status,_that.allowedGroups,_that.balanceNotifyEnabled,_that.balanceNotifyThresholdType,_that.balanceNotifyThreshold,_that.totalRecharged,_that.rpmLimit,_that.createdAt,_that.updatedAt,_that.lastActiveAt,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String email,  String username,  String role,  Sub2ApiDecimal balance,  Sub2ApiDecimal frozenBalance,  int concurrency,  String status,  List<int> allowedGroups,  bool balanceNotifyEnabled,  String balanceNotifyThresholdType,  Sub2ApiDecimal? balanceNotifyThreshold,  Sub2ApiDecimal totalRecharged,  int rpmLimit,  DateTime createdAt,  DateTime updatedAt,  DateTime? lastActiveAt,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiUserProfile():
return $default(_that.id,_that.email,_that.username,_that.role,_that.balance,_that.frozenBalance,_that.concurrency,_that.status,_that.allowedGroups,_that.balanceNotifyEnabled,_that.balanceNotifyThresholdType,_that.balanceNotifyThreshold,_that.totalRecharged,_that.rpmLimit,_that.createdAt,_that.updatedAt,_that.lastActiveAt,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String email,  String username,  String role,  Sub2ApiDecimal balance,  Sub2ApiDecimal frozenBalance,  int concurrency,  String status,  List<int> allowedGroups,  bool balanceNotifyEnabled,  String balanceNotifyThresholdType,  Sub2ApiDecimal? balanceNotifyThreshold,  Sub2ApiDecimal totalRecharged,  int rpmLimit,  DateTime createdAt,  DateTime updatedAt,  DateTime? lastActiveAt,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiUserProfile() when $default != null:
return $default(_that.id,_that.email,_that.username,_that.role,_that.balance,_that.frozenBalance,_that.concurrency,_that.status,_that.allowedGroups,_that.balanceNotifyEnabled,_that.balanceNotifyThresholdType,_that.balanceNotifyThreshold,_that.totalRecharged,_that.rpmLimit,_that.createdAt,_that.updatedAt,_that.lastActiveAt,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiUserProfile implements Sub2ApiUserProfile {
  const _Sub2ApiUserProfile({required this.id, required this.email, required this.username, required this.role, required this.balance, required this.frozenBalance, required this.concurrency, required this.status, required final  List<int> allowedGroups, required this.balanceNotifyEnabled, required this.balanceNotifyThresholdType, required this.balanceNotifyThreshold, required this.totalRecharged, required this.rpmLimit, required this.createdAt, required this.updatedAt, this.lastActiveAt, this.avatarUrl}): _allowedGroups = allowedGroups;


@override final  int id;
@override final  String email;
@override final  String username;
@override final  String role;
@override final  Sub2ApiDecimal balance;
@override final  Sub2ApiDecimal frozenBalance;
@override final  int concurrency;
@override final  String status;
 final  List<int> _allowedGroups;
@override List<int> get allowedGroups {
  if (_allowedGroups is EqualUnmodifiableListView) return _allowedGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowedGroups);
}

@override final  bool balanceNotifyEnabled;
@override final  String balanceNotifyThresholdType;
@override final  Sub2ApiDecimal? balanceNotifyThreshold;
@override final  Sub2ApiDecimal totalRecharged;
@override final  int rpmLimit;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? lastActiveAt;
@override final  String? avatarUrl;

/// Create a copy of Sub2ApiUserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiUserProfileCopyWith<_Sub2ApiUserProfile> get copyWith => __$Sub2ApiUserProfileCopyWithImpl<_Sub2ApiUserProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiUserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.role, role) || other.role == role)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.frozenBalance, frozenBalance) || other.frozenBalance == frozenBalance)&&(identical(other.concurrency, concurrency) || other.concurrency == concurrency)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._allowedGroups, _allowedGroups)&&(identical(other.balanceNotifyEnabled, balanceNotifyEnabled) || other.balanceNotifyEnabled == balanceNotifyEnabled)&&(identical(other.balanceNotifyThresholdType, balanceNotifyThresholdType) || other.balanceNotifyThresholdType == balanceNotifyThresholdType)&&(identical(other.balanceNotifyThreshold, balanceNotifyThreshold) || other.balanceNotifyThreshold == balanceNotifyThreshold)&&(identical(other.totalRecharged, totalRecharged) || other.totalRecharged == totalRecharged)&&(identical(other.rpmLimit, rpmLimit) || other.rpmLimit == rpmLimit)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastActiveAt, lastActiveAt) || other.lastActiveAt == lastActiveAt)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,email,username,role,balance,frozenBalance,concurrency,status,const DeepCollectionEquality().hash(_allowedGroups),balanceNotifyEnabled,balanceNotifyThresholdType,balanceNotifyThreshold,totalRecharged,rpmLimit,createdAt,updatedAt,lastActiveAt,avatarUrl);

@override
String toString() {
  return 'Sub2ApiUserProfile(id: $id, email: $email, username: $username, role: $role, balance: $balance, frozenBalance: $frozenBalance, concurrency: $concurrency, status: $status, allowedGroups: $allowedGroups, balanceNotifyEnabled: $balanceNotifyEnabled, balanceNotifyThresholdType: $balanceNotifyThresholdType, balanceNotifyThreshold: $balanceNotifyThreshold, totalRecharged: $totalRecharged, rpmLimit: $rpmLimit, createdAt: $createdAt, updatedAt: $updatedAt, lastActiveAt: $lastActiveAt, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiUserProfileCopyWith<$Res> implements $Sub2ApiUserProfileCopyWith<$Res> {
  factory _$Sub2ApiUserProfileCopyWith(_Sub2ApiUserProfile value, $Res Function(_Sub2ApiUserProfile) _then) = __$Sub2ApiUserProfileCopyWithImpl;
@override @useResult
$Res call({
 int id, String email, String username, String role, Sub2ApiDecimal balance, Sub2ApiDecimal frozenBalance, int concurrency, String status, List<int> allowedGroups, bool balanceNotifyEnabled, String balanceNotifyThresholdType, Sub2ApiDecimal? balanceNotifyThreshold, Sub2ApiDecimal totalRecharged, int rpmLimit, DateTime createdAt, DateTime updatedAt, DateTime? lastActiveAt, String? avatarUrl
});




}
/// @nodoc
class __$Sub2ApiUserProfileCopyWithImpl<$Res>
    implements _$Sub2ApiUserProfileCopyWith<$Res> {
  __$Sub2ApiUserProfileCopyWithImpl(this._self, this._then);

  final _Sub2ApiUserProfile _self;
  final $Res Function(_Sub2ApiUserProfile) _then;

/// Create a copy of Sub2ApiUserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? username = null,Object? role = null,Object? balance = null,Object? frozenBalance = null,Object? concurrency = null,Object? status = null,Object? allowedGroups = null,Object? balanceNotifyEnabled = null,Object? balanceNotifyThresholdType = null,Object? balanceNotifyThreshold = freezed,Object? totalRecharged = null,Object? rpmLimit = null,Object? createdAt = null,Object? updatedAt = null,Object? lastActiveAt = freezed,Object? avatarUrl = freezed,}) {
  return _then(_Sub2ApiUserProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,frozenBalance: null == frozenBalance ? _self.frozenBalance : frozenBalance // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,concurrency: null == concurrency ? _self.concurrency : concurrency // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,allowedGroups: null == allowedGroups ? _self._allowedGroups : allowedGroups // ignore: cast_nullable_to_non_nullable
as List<int>,balanceNotifyEnabled: null == balanceNotifyEnabled ? _self.balanceNotifyEnabled : balanceNotifyEnabled // ignore: cast_nullable_to_non_nullable
as bool,balanceNotifyThresholdType: null == balanceNotifyThresholdType ? _self.balanceNotifyThresholdType : balanceNotifyThresholdType // ignore: cast_nullable_to_non_nullable
as String,balanceNotifyThreshold: freezed == balanceNotifyThreshold ? _self.balanceNotifyThreshold : balanceNotifyThreshold // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,totalRecharged: null == totalRecharged ? _self.totalRecharged : totalRecharged // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,rpmLimit: null == rpmLimit ? _self.rpmLimit : rpmLimit // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastActiveAt: freezed == lastActiveAt ? _self.lastActiveAt : lastActiveAt // ignore: cast_nullable_to_non_nullable
as DateTime?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiUpdateUserProfileRequest {

 String? get username; String? get avatarUrl; bool? get balanceNotifyEnabled; Sub2ApiDecimal? get balanceNotifyThreshold;
/// Create a copy of Sub2ApiUpdateUserProfileRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiUpdateUserProfileRequestCopyWith<Sub2ApiUpdateUserProfileRequest> get copyWith => _$Sub2ApiUpdateUserProfileRequestCopyWithImpl<Sub2ApiUpdateUserProfileRequest>(this as Sub2ApiUpdateUserProfileRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiUpdateUserProfileRequest&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.balanceNotifyEnabled, balanceNotifyEnabled) || other.balanceNotifyEnabled == balanceNotifyEnabled)&&(identical(other.balanceNotifyThreshold, balanceNotifyThreshold) || other.balanceNotifyThreshold == balanceNotifyThreshold));
}


@override
int get hashCode => Object.hash(runtimeType,username,avatarUrl,balanceNotifyEnabled,balanceNotifyThreshold);

@override
String toString() {
  return 'Sub2ApiUpdateUserProfileRequest(username: $username, avatarUrl: $avatarUrl, balanceNotifyEnabled: $balanceNotifyEnabled, balanceNotifyThreshold: $balanceNotifyThreshold)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiUpdateUserProfileRequestCopyWith<$Res>  {
  factory $Sub2ApiUpdateUserProfileRequestCopyWith(Sub2ApiUpdateUserProfileRequest value, $Res Function(Sub2ApiUpdateUserProfileRequest) _then) = _$Sub2ApiUpdateUserProfileRequestCopyWithImpl;
@useResult
$Res call({
 String? username, String? avatarUrl, bool? balanceNotifyEnabled, Sub2ApiDecimal? balanceNotifyThreshold
});




}
/// @nodoc
class _$Sub2ApiUpdateUserProfileRequestCopyWithImpl<$Res>
    implements $Sub2ApiUpdateUserProfileRequestCopyWith<$Res> {
  _$Sub2ApiUpdateUserProfileRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiUpdateUserProfileRequest _self;
  final $Res Function(Sub2ApiUpdateUserProfileRequest) _then;

/// Create a copy of Sub2ApiUpdateUserProfileRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = freezed,Object? avatarUrl = freezed,Object? balanceNotifyEnabled = freezed,Object? balanceNotifyThreshold = freezed,}) {
  return _then(_self.copyWith(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,balanceNotifyEnabled: freezed == balanceNotifyEnabled ? _self.balanceNotifyEnabled : balanceNotifyEnabled // ignore: cast_nullable_to_non_nullable
as bool?,balanceNotifyThreshold: freezed == balanceNotifyThreshold ? _self.balanceNotifyThreshold : balanceNotifyThreshold // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiUpdateUserProfileRequest].
extension Sub2ApiUpdateUserProfileRequestPatterns on Sub2ApiUpdateUserProfileRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiUpdateUserProfileRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiUpdateUserProfileRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiUpdateUserProfileRequest value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiUpdateUserProfileRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiUpdateUserProfileRequest value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiUpdateUserProfileRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? username,  String? avatarUrl,  bool? balanceNotifyEnabled,  Sub2ApiDecimal? balanceNotifyThreshold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiUpdateUserProfileRequest() when $default != null:
return $default(_that.username,_that.avatarUrl,_that.balanceNotifyEnabled,_that.balanceNotifyThreshold);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? username,  String? avatarUrl,  bool? balanceNotifyEnabled,  Sub2ApiDecimal? balanceNotifyThreshold)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiUpdateUserProfileRequest():
return $default(_that.username,_that.avatarUrl,_that.balanceNotifyEnabled,_that.balanceNotifyThreshold);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? username,  String? avatarUrl,  bool? balanceNotifyEnabled,  Sub2ApiDecimal? balanceNotifyThreshold)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiUpdateUserProfileRequest() when $default != null:
return $default(_that.username,_that.avatarUrl,_that.balanceNotifyEnabled,_that.balanceNotifyThreshold);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiUpdateUserProfileRequest implements Sub2ApiUpdateUserProfileRequest {
  const _Sub2ApiUpdateUserProfileRequest({this.username, this.avatarUrl, this.balanceNotifyEnabled, this.balanceNotifyThreshold});


@override final  String? username;
@override final  String? avatarUrl;
@override final  bool? balanceNotifyEnabled;
@override final  Sub2ApiDecimal? balanceNotifyThreshold;

/// Create a copy of Sub2ApiUpdateUserProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiUpdateUserProfileRequestCopyWith<_Sub2ApiUpdateUserProfileRequest> get copyWith => __$Sub2ApiUpdateUserProfileRequestCopyWithImpl<_Sub2ApiUpdateUserProfileRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiUpdateUserProfileRequest&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.balanceNotifyEnabled, balanceNotifyEnabled) || other.balanceNotifyEnabled == balanceNotifyEnabled)&&(identical(other.balanceNotifyThreshold, balanceNotifyThreshold) || other.balanceNotifyThreshold == balanceNotifyThreshold));
}


@override
int get hashCode => Object.hash(runtimeType,username,avatarUrl,balanceNotifyEnabled,balanceNotifyThreshold);

@override
String toString() {
  return 'Sub2ApiUpdateUserProfileRequest(username: $username, avatarUrl: $avatarUrl, balanceNotifyEnabled: $balanceNotifyEnabled, balanceNotifyThreshold: $balanceNotifyThreshold)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiUpdateUserProfileRequestCopyWith<$Res> implements $Sub2ApiUpdateUserProfileRequestCopyWith<$Res> {
  factory _$Sub2ApiUpdateUserProfileRequestCopyWith(_Sub2ApiUpdateUserProfileRequest value, $Res Function(_Sub2ApiUpdateUserProfileRequest) _then) = __$Sub2ApiUpdateUserProfileRequestCopyWithImpl;
@override @useResult
$Res call({
 String? username, String? avatarUrl, bool? balanceNotifyEnabled, Sub2ApiDecimal? balanceNotifyThreshold
});




}
/// @nodoc
class __$Sub2ApiUpdateUserProfileRequestCopyWithImpl<$Res>
    implements _$Sub2ApiUpdateUserProfileRequestCopyWith<$Res> {
  __$Sub2ApiUpdateUserProfileRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiUpdateUserProfileRequest _self;
  final $Res Function(_Sub2ApiUpdateUserProfileRequest) _then;

/// Create a copy of Sub2ApiUpdateUserProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = freezed,Object? avatarUrl = freezed,Object? balanceNotifyEnabled = freezed,Object? balanceNotifyThreshold = freezed,}) {
  return _then(_Sub2ApiUpdateUserProfileRequest(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,balanceNotifyEnabled: freezed == balanceNotifyEnabled ? _self.balanceNotifyEnabled : balanceNotifyEnabled // ignore: cast_nullable_to_non_nullable
as bool?,balanceNotifyThreshold: freezed == balanceNotifyThreshold ? _self.balanceNotifyThreshold : balanceNotifyThreshold // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAffiliateInvitee {

 int get userId; String get email; String get username; DateTime? get createdAt; Sub2ApiDecimal get totalRebate;
/// Create a copy of Sub2ApiAffiliateInvitee
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAffiliateInviteeCopyWith<Sub2ApiAffiliateInvitee> get copyWith => _$Sub2ApiAffiliateInviteeCopyWithImpl<Sub2ApiAffiliateInvitee>(this as Sub2ApiAffiliateInvitee, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAffiliateInvitee&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.totalRebate, totalRebate) || other.totalRebate == totalRebate));
}


@override
int get hashCode => Object.hash(runtimeType,userId,email,username,createdAt,totalRebate);

@override
String toString() {
  return 'Sub2ApiAffiliateInvitee(userId: $userId, email: $email, username: $username, createdAt: $createdAt, totalRebate: $totalRebate)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAffiliateInviteeCopyWith<$Res>  {
  factory $Sub2ApiAffiliateInviteeCopyWith(Sub2ApiAffiliateInvitee value, $Res Function(Sub2ApiAffiliateInvitee) _then) = _$Sub2ApiAffiliateInviteeCopyWithImpl;
@useResult
$Res call({
 int userId, String email, String username, DateTime? createdAt, Sub2ApiDecimal totalRebate
});




}
/// @nodoc
class _$Sub2ApiAffiliateInviteeCopyWithImpl<$Res>
    implements $Sub2ApiAffiliateInviteeCopyWith<$Res> {
  _$Sub2ApiAffiliateInviteeCopyWithImpl(this._self, this._then);

  final Sub2ApiAffiliateInvitee _self;
  final $Res Function(Sub2ApiAffiliateInvitee) _then;

/// Create a copy of Sub2ApiAffiliateInvitee
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? email = null,Object? username = null,Object? createdAt = freezed,Object? totalRebate = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalRebate: null == totalRebate ? _self.totalRebate : totalRebate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAffiliateInvitee].
extension Sub2ApiAffiliateInviteePatterns on Sub2ApiAffiliateInvitee {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAffiliateInvitee value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAffiliateInvitee() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAffiliateInvitee value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAffiliateInvitee():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAffiliateInvitee value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAffiliateInvitee() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  String email,  String username,  DateTime? createdAt,  Sub2ApiDecimal totalRebate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAffiliateInvitee() when $default != null:
return $default(_that.userId,_that.email,_that.username,_that.createdAt,_that.totalRebate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  String email,  String username,  DateTime? createdAt,  Sub2ApiDecimal totalRebate)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAffiliateInvitee():
return $default(_that.userId,_that.email,_that.username,_that.createdAt,_that.totalRebate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  String email,  String username,  DateTime? createdAt,  Sub2ApiDecimal totalRebate)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAffiliateInvitee() when $default != null:
return $default(_that.userId,_that.email,_that.username,_that.createdAt,_that.totalRebate);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAffiliateInvitee implements Sub2ApiAffiliateInvitee {
  const _Sub2ApiAffiliateInvitee({required this.userId, required this.email, required this.username, this.createdAt, required this.totalRebate});


@override final  int userId;
@override final  String email;
@override final  String username;
@override final  DateTime? createdAt;
@override final  Sub2ApiDecimal totalRebate;

/// Create a copy of Sub2ApiAffiliateInvitee
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAffiliateInviteeCopyWith<_Sub2ApiAffiliateInvitee> get copyWith => __$Sub2ApiAffiliateInviteeCopyWithImpl<_Sub2ApiAffiliateInvitee>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAffiliateInvitee&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.totalRebate, totalRebate) || other.totalRebate == totalRebate));
}


@override
int get hashCode => Object.hash(runtimeType,userId,email,username,createdAt,totalRebate);

@override
String toString() {
  return 'Sub2ApiAffiliateInvitee(userId: $userId, email: $email, username: $username, createdAt: $createdAt, totalRebate: $totalRebate)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAffiliateInviteeCopyWith<$Res> implements $Sub2ApiAffiliateInviteeCopyWith<$Res> {
  factory _$Sub2ApiAffiliateInviteeCopyWith(_Sub2ApiAffiliateInvitee value, $Res Function(_Sub2ApiAffiliateInvitee) _then) = __$Sub2ApiAffiliateInviteeCopyWithImpl;
@override @useResult
$Res call({
 int userId, String email, String username, DateTime? createdAt, Sub2ApiDecimal totalRebate
});




}
/// @nodoc
class __$Sub2ApiAffiliateInviteeCopyWithImpl<$Res>
    implements _$Sub2ApiAffiliateInviteeCopyWith<$Res> {
  __$Sub2ApiAffiliateInviteeCopyWithImpl(this._self, this._then);

  final _Sub2ApiAffiliateInvitee _self;
  final $Res Function(_Sub2ApiAffiliateInvitee) _then;

/// Create a copy of Sub2ApiAffiliateInvitee
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? email = null,Object? username = null,Object? createdAt = freezed,Object? totalRebate = null,}) {
  return _then(_Sub2ApiAffiliateInvitee(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalRebate: null == totalRebate ? _self.totalRebate : totalRebate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAffiliateDetail {

 int get userId; String get affiliateCode; int? get inviterId; int get affiliateCount; Sub2ApiDecimal get availableQuota; Sub2ApiDecimal get frozenQuota; Sub2ApiDecimal get historicalQuota; Sub2ApiDecimal get effectiveRebateRatePercent; List<Sub2ApiAffiliateInvitee> get invitees;
/// Create a copy of Sub2ApiAffiliateDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAffiliateDetailCopyWith<Sub2ApiAffiliateDetail> get copyWith => _$Sub2ApiAffiliateDetailCopyWithImpl<Sub2ApiAffiliateDetail>(this as Sub2ApiAffiliateDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAffiliateDetail&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.affiliateCode, affiliateCode) || other.affiliateCode == affiliateCode)&&(identical(other.inviterId, inviterId) || other.inviterId == inviterId)&&(identical(other.affiliateCount, affiliateCount) || other.affiliateCount == affiliateCount)&&(identical(other.availableQuota, availableQuota) || other.availableQuota == availableQuota)&&(identical(other.frozenQuota, frozenQuota) || other.frozenQuota == frozenQuota)&&(identical(other.historicalQuota, historicalQuota) || other.historicalQuota == historicalQuota)&&(identical(other.effectiveRebateRatePercent, effectiveRebateRatePercent) || other.effectiveRebateRatePercent == effectiveRebateRatePercent)&&const DeepCollectionEquality().equals(other.invitees, invitees));
}


@override
int get hashCode => Object.hash(runtimeType,userId,affiliateCode,inviterId,affiliateCount,availableQuota,frozenQuota,historicalQuota,effectiveRebateRatePercent,const DeepCollectionEquality().hash(invitees));

@override
String toString() {
  return 'Sub2ApiAffiliateDetail(userId: $userId, affiliateCode: $affiliateCode, inviterId: $inviterId, affiliateCount: $affiliateCount, availableQuota: $availableQuota, frozenQuota: $frozenQuota, historicalQuota: $historicalQuota, effectiveRebateRatePercent: $effectiveRebateRatePercent, invitees: $invitees)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAffiliateDetailCopyWith<$Res>  {
  factory $Sub2ApiAffiliateDetailCopyWith(Sub2ApiAffiliateDetail value, $Res Function(Sub2ApiAffiliateDetail) _then) = _$Sub2ApiAffiliateDetailCopyWithImpl;
@useResult
$Res call({
 int userId, String affiliateCode, int? inviterId, int affiliateCount, Sub2ApiDecimal availableQuota, Sub2ApiDecimal frozenQuota, Sub2ApiDecimal historicalQuota, Sub2ApiDecimal effectiveRebateRatePercent, List<Sub2ApiAffiliateInvitee> invitees
});




}
/// @nodoc
class _$Sub2ApiAffiliateDetailCopyWithImpl<$Res>
    implements $Sub2ApiAffiliateDetailCopyWith<$Res> {
  _$Sub2ApiAffiliateDetailCopyWithImpl(this._self, this._then);

  final Sub2ApiAffiliateDetail _self;
  final $Res Function(Sub2ApiAffiliateDetail) _then;

/// Create a copy of Sub2ApiAffiliateDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? affiliateCode = null,Object? inviterId = freezed,Object? affiliateCount = null,Object? availableQuota = null,Object? frozenQuota = null,Object? historicalQuota = null,Object? effectiveRebateRatePercent = null,Object? invitees = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,affiliateCode: null == affiliateCode ? _self.affiliateCode : affiliateCode // ignore: cast_nullable_to_non_nullable
as String,inviterId: freezed == inviterId ? _self.inviterId : inviterId // ignore: cast_nullable_to_non_nullable
as int?,affiliateCount: null == affiliateCount ? _self.affiliateCount : affiliateCount // ignore: cast_nullable_to_non_nullable
as int,availableQuota: null == availableQuota ? _self.availableQuota : availableQuota // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,frozenQuota: null == frozenQuota ? _self.frozenQuota : frozenQuota // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,historicalQuota: null == historicalQuota ? _self.historicalQuota : historicalQuota // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,effectiveRebateRatePercent: null == effectiveRebateRatePercent ? _self.effectiveRebateRatePercent : effectiveRebateRatePercent // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,invitees: null == invitees ? _self.invitees : invitees // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAffiliateInvitee>,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAffiliateDetail].
extension Sub2ApiAffiliateDetailPatterns on Sub2ApiAffiliateDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAffiliateDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAffiliateDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAffiliateDetail value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAffiliateDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAffiliateDetail value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAffiliateDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  String affiliateCode,  int? inviterId,  int affiliateCount,  Sub2ApiDecimal availableQuota,  Sub2ApiDecimal frozenQuota,  Sub2ApiDecimal historicalQuota,  Sub2ApiDecimal effectiveRebateRatePercent,  List<Sub2ApiAffiliateInvitee> invitees)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAffiliateDetail() when $default != null:
return $default(_that.userId,_that.affiliateCode,_that.inviterId,_that.affiliateCount,_that.availableQuota,_that.frozenQuota,_that.historicalQuota,_that.effectiveRebateRatePercent,_that.invitees);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  String affiliateCode,  int? inviterId,  int affiliateCount,  Sub2ApiDecimal availableQuota,  Sub2ApiDecimal frozenQuota,  Sub2ApiDecimal historicalQuota,  Sub2ApiDecimal effectiveRebateRatePercent,  List<Sub2ApiAffiliateInvitee> invitees)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAffiliateDetail():
return $default(_that.userId,_that.affiliateCode,_that.inviterId,_that.affiliateCount,_that.availableQuota,_that.frozenQuota,_that.historicalQuota,_that.effectiveRebateRatePercent,_that.invitees);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  String affiliateCode,  int? inviterId,  int affiliateCount,  Sub2ApiDecimal availableQuota,  Sub2ApiDecimal frozenQuota,  Sub2ApiDecimal historicalQuota,  Sub2ApiDecimal effectiveRebateRatePercent,  List<Sub2ApiAffiliateInvitee> invitees)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAffiliateDetail() when $default != null:
return $default(_that.userId,_that.affiliateCode,_that.inviterId,_that.affiliateCount,_that.availableQuota,_that.frozenQuota,_that.historicalQuota,_that.effectiveRebateRatePercent,_that.invitees);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAffiliateDetail implements Sub2ApiAffiliateDetail {
  const _Sub2ApiAffiliateDetail({required this.userId, required this.affiliateCode, this.inviterId, required this.affiliateCount, required this.availableQuota, required this.frozenQuota, required this.historicalQuota, required this.effectiveRebateRatePercent, required final  List<Sub2ApiAffiliateInvitee> invitees}): _invitees = invitees;


@override final  int userId;
@override final  String affiliateCode;
@override final  int? inviterId;
@override final  int affiliateCount;
@override final  Sub2ApiDecimal availableQuota;
@override final  Sub2ApiDecimal frozenQuota;
@override final  Sub2ApiDecimal historicalQuota;
@override final  Sub2ApiDecimal effectiveRebateRatePercent;
 final  List<Sub2ApiAffiliateInvitee> _invitees;
@override List<Sub2ApiAffiliateInvitee> get invitees {
  if (_invitees is EqualUnmodifiableListView) return _invitees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invitees);
}


/// Create a copy of Sub2ApiAffiliateDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAffiliateDetailCopyWith<_Sub2ApiAffiliateDetail> get copyWith => __$Sub2ApiAffiliateDetailCopyWithImpl<_Sub2ApiAffiliateDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAffiliateDetail&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.affiliateCode, affiliateCode) || other.affiliateCode == affiliateCode)&&(identical(other.inviterId, inviterId) || other.inviterId == inviterId)&&(identical(other.affiliateCount, affiliateCount) || other.affiliateCount == affiliateCount)&&(identical(other.availableQuota, availableQuota) || other.availableQuota == availableQuota)&&(identical(other.frozenQuota, frozenQuota) || other.frozenQuota == frozenQuota)&&(identical(other.historicalQuota, historicalQuota) || other.historicalQuota == historicalQuota)&&(identical(other.effectiveRebateRatePercent, effectiveRebateRatePercent) || other.effectiveRebateRatePercent == effectiveRebateRatePercent)&&const DeepCollectionEquality().equals(other._invitees, _invitees));
}


@override
int get hashCode => Object.hash(runtimeType,userId,affiliateCode,inviterId,affiliateCount,availableQuota,frozenQuota,historicalQuota,effectiveRebateRatePercent,const DeepCollectionEquality().hash(_invitees));

@override
String toString() {
  return 'Sub2ApiAffiliateDetail(userId: $userId, affiliateCode: $affiliateCode, inviterId: $inviterId, affiliateCount: $affiliateCount, availableQuota: $availableQuota, frozenQuota: $frozenQuota, historicalQuota: $historicalQuota, effectiveRebateRatePercent: $effectiveRebateRatePercent, invitees: $invitees)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAffiliateDetailCopyWith<$Res> implements $Sub2ApiAffiliateDetailCopyWith<$Res> {
  factory _$Sub2ApiAffiliateDetailCopyWith(_Sub2ApiAffiliateDetail value, $Res Function(_Sub2ApiAffiliateDetail) _then) = __$Sub2ApiAffiliateDetailCopyWithImpl;
@override @useResult
$Res call({
 int userId, String affiliateCode, int? inviterId, int affiliateCount, Sub2ApiDecimal availableQuota, Sub2ApiDecimal frozenQuota, Sub2ApiDecimal historicalQuota, Sub2ApiDecimal effectiveRebateRatePercent, List<Sub2ApiAffiliateInvitee> invitees
});




}
/// @nodoc
class __$Sub2ApiAffiliateDetailCopyWithImpl<$Res>
    implements _$Sub2ApiAffiliateDetailCopyWith<$Res> {
  __$Sub2ApiAffiliateDetailCopyWithImpl(this._self, this._then);

  final _Sub2ApiAffiliateDetail _self;
  final $Res Function(_Sub2ApiAffiliateDetail) _then;

/// Create a copy of Sub2ApiAffiliateDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? affiliateCode = null,Object? inviterId = freezed,Object? affiliateCount = null,Object? availableQuota = null,Object? frozenQuota = null,Object? historicalQuota = null,Object? effectiveRebateRatePercent = null,Object? invitees = null,}) {
  return _then(_Sub2ApiAffiliateDetail(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,affiliateCode: null == affiliateCode ? _self.affiliateCode : affiliateCode // ignore: cast_nullable_to_non_nullable
as String,inviterId: freezed == inviterId ? _self.inviterId : inviterId // ignore: cast_nullable_to_non_nullable
as int?,affiliateCount: null == affiliateCount ? _self.affiliateCount : affiliateCount // ignore: cast_nullable_to_non_nullable
as int,availableQuota: null == availableQuota ? _self.availableQuota : availableQuota // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,frozenQuota: null == frozenQuota ? _self.frozenQuota : frozenQuota // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,historicalQuota: null == historicalQuota ? _self.historicalQuota : historicalQuota // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,effectiveRebateRatePercent: null == effectiveRebateRatePercent ? _self.effectiveRebateRatePercent : effectiveRebateRatePercent // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,invitees: null == invitees ? _self._invitees : invitees // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiAffiliateInvitee>,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiAffiliateTransfer {

 Sub2ApiDecimal get transferredQuota; Sub2ApiDecimal get balance;
/// Create a copy of Sub2ApiAffiliateTransfer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiAffiliateTransferCopyWith<Sub2ApiAffiliateTransfer> get copyWith => _$Sub2ApiAffiliateTransferCopyWithImpl<Sub2ApiAffiliateTransfer>(this as Sub2ApiAffiliateTransfer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiAffiliateTransfer&&(identical(other.transferredQuota, transferredQuota) || other.transferredQuota == transferredQuota)&&(identical(other.balance, balance) || other.balance == balance));
}


@override
int get hashCode => Object.hash(runtimeType,transferredQuota,balance);

@override
String toString() {
  return 'Sub2ApiAffiliateTransfer(transferredQuota: $transferredQuota, balance: $balance)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiAffiliateTransferCopyWith<$Res>  {
  factory $Sub2ApiAffiliateTransferCopyWith(Sub2ApiAffiliateTransfer value, $Res Function(Sub2ApiAffiliateTransfer) _then) = _$Sub2ApiAffiliateTransferCopyWithImpl;
@useResult
$Res call({
 Sub2ApiDecimal transferredQuota, Sub2ApiDecimal balance
});




}
/// @nodoc
class _$Sub2ApiAffiliateTransferCopyWithImpl<$Res>
    implements $Sub2ApiAffiliateTransferCopyWith<$Res> {
  _$Sub2ApiAffiliateTransferCopyWithImpl(this._self, this._then);

  final Sub2ApiAffiliateTransfer _self;
  final $Res Function(Sub2ApiAffiliateTransfer) _then;

/// Create a copy of Sub2ApiAffiliateTransfer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transferredQuota = null,Object? balance = null,}) {
  return _then(_self.copyWith(
transferredQuota: null == transferredQuota ? _self.transferredQuota : transferredQuota // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiAffiliateTransfer].
extension Sub2ApiAffiliateTransferPatterns on Sub2ApiAffiliateTransfer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiAffiliateTransfer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiAffiliateTransfer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiAffiliateTransfer value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAffiliateTransfer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiAffiliateTransfer value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiAffiliateTransfer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiDecimal transferredQuota,  Sub2ApiDecimal balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiAffiliateTransfer() when $default != null:
return $default(_that.transferredQuota,_that.balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiDecimal transferredQuota,  Sub2ApiDecimal balance)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAffiliateTransfer():
return $default(_that.transferredQuota,_that.balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiDecimal transferredQuota,  Sub2ApiDecimal balance)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiAffiliateTransfer() when $default != null:
return $default(_that.transferredQuota,_that.balance);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiAffiliateTransfer implements Sub2ApiAffiliateTransfer {
  const _Sub2ApiAffiliateTransfer({required this.transferredQuota, required this.balance});


@override final  Sub2ApiDecimal transferredQuota;
@override final  Sub2ApiDecimal balance;

/// Create a copy of Sub2ApiAffiliateTransfer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiAffiliateTransferCopyWith<_Sub2ApiAffiliateTransfer> get copyWith => __$Sub2ApiAffiliateTransferCopyWithImpl<_Sub2ApiAffiliateTransfer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiAffiliateTransfer&&(identical(other.transferredQuota, transferredQuota) || other.transferredQuota == transferredQuota)&&(identical(other.balance, balance) || other.balance == balance));
}


@override
int get hashCode => Object.hash(runtimeType,transferredQuota,balance);

@override
String toString() {
  return 'Sub2ApiAffiliateTransfer(transferredQuota: $transferredQuota, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiAffiliateTransferCopyWith<$Res> implements $Sub2ApiAffiliateTransferCopyWith<$Res> {
  factory _$Sub2ApiAffiliateTransferCopyWith(_Sub2ApiAffiliateTransfer value, $Res Function(_Sub2ApiAffiliateTransfer) _then) = __$Sub2ApiAffiliateTransferCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiDecimal transferredQuota, Sub2ApiDecimal balance
});




}
/// @nodoc
class __$Sub2ApiAffiliateTransferCopyWithImpl<$Res>
    implements _$Sub2ApiAffiliateTransferCopyWith<$Res> {
  __$Sub2ApiAffiliateTransferCopyWithImpl(this._self, this._then);

  final _Sub2ApiAffiliateTransfer _self;
  final $Res Function(_Sub2ApiAffiliateTransfer) _then;

/// Create a copy of Sub2ApiAffiliateTransfer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transferredQuota = null,Object? balance = null,}) {
  return _then(_Sub2ApiAffiliateTransfer(
transferredQuota: null == transferredQuota ? _self.transferredQuota : transferredQuota // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}


}

// dart format on
