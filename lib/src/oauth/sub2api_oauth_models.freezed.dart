// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_oauth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sub2ApiOAuthPendingEmailCodeResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiOAuthPendingEmailCodeResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Sub2ApiOAuthPendingEmailCodeResult()';
}


}

/// @nodoc
class $Sub2ApiOAuthPendingEmailCodeResultCopyWith<$Res>  {
$Sub2ApiOAuthPendingEmailCodeResultCopyWith(Sub2ApiOAuthPendingEmailCodeResult _, $Res Function(Sub2ApiOAuthPendingEmailCodeResult) __);
}


/// Adds pattern-matching-related methods to [Sub2ApiOAuthPendingEmailCodeResult].
extension Sub2ApiOAuthPendingEmailCodeResultPatterns on Sub2ApiOAuthPendingEmailCodeResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Sub2ApiOAuthPendingEmailCodeSent value)?  codeSent,TResult Function( Sub2ApiOAuthPendingEmailActionRequired value)?  actionRequired,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Sub2ApiOAuthPendingEmailCodeSent() when codeSent != null:
return codeSent(_that);case Sub2ApiOAuthPendingEmailActionRequired() when actionRequired != null:
return actionRequired(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Sub2ApiOAuthPendingEmailCodeSent value)  codeSent,required TResult Function( Sub2ApiOAuthPendingEmailActionRequired value)  actionRequired,}){
final _that = this;
switch (_that) {
case Sub2ApiOAuthPendingEmailCodeSent():
return codeSent(_that);case Sub2ApiOAuthPendingEmailActionRequired():
return actionRequired(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Sub2ApiOAuthPendingEmailCodeSent value)?  codeSent,TResult? Function( Sub2ApiOAuthPendingEmailActionRequired value)?  actionRequired,}){
final _that = this;
switch (_that) {
case Sub2ApiOAuthPendingEmailCodeSent() when codeSent != null:
return codeSent(_that);case Sub2ApiOAuthPendingEmailActionRequired() when actionRequired != null:
return actionRequired(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  Duration cooldown)?  codeSent,TResult Function( Sub2ApiOAuthPendingAction action)?  actionRequired,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Sub2ApiOAuthPendingEmailCodeSent() when codeSent != null:
return codeSent(_that.message,_that.cooldown);case Sub2ApiOAuthPendingEmailActionRequired() when actionRequired != null:
return actionRequired(_that.action);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  Duration cooldown)  codeSent,required TResult Function( Sub2ApiOAuthPendingAction action)  actionRequired,}) {final _that = this;
switch (_that) {
case Sub2ApiOAuthPendingEmailCodeSent():
return codeSent(_that.message,_that.cooldown);case Sub2ApiOAuthPendingEmailActionRequired():
return actionRequired(_that.action);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  Duration cooldown)?  codeSent,TResult? Function( Sub2ApiOAuthPendingAction action)?  actionRequired,}) {final _that = this;
switch (_that) {
case Sub2ApiOAuthPendingEmailCodeSent() when codeSent != null:
return codeSent(_that.message,_that.cooldown);case Sub2ApiOAuthPendingEmailActionRequired() when actionRequired != null:
return actionRequired(_that.action);case _:
  return null;

}
}

}

/// @nodoc


class Sub2ApiOAuthPendingEmailCodeSent implements Sub2ApiOAuthPendingEmailCodeResult {
  const Sub2ApiOAuthPendingEmailCodeSent({required this.message, required this.cooldown});


 final  String message;
 final  Duration cooldown;

/// Create a copy of Sub2ApiOAuthPendingEmailCodeResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiOAuthPendingEmailCodeSentCopyWith<Sub2ApiOAuthPendingEmailCodeSent> get copyWith => _$Sub2ApiOAuthPendingEmailCodeSentCopyWithImpl<Sub2ApiOAuthPendingEmailCodeSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiOAuthPendingEmailCodeSent&&(identical(other.message, message) || other.message == message)&&(identical(other.cooldown, cooldown) || other.cooldown == cooldown));
}


@override
int get hashCode => Object.hash(runtimeType,message,cooldown);

@override
String toString() {
  return 'Sub2ApiOAuthPendingEmailCodeResult.codeSent(message: $message, cooldown: $cooldown)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiOAuthPendingEmailCodeSentCopyWith<$Res> implements $Sub2ApiOAuthPendingEmailCodeResultCopyWith<$Res> {
  factory $Sub2ApiOAuthPendingEmailCodeSentCopyWith(Sub2ApiOAuthPendingEmailCodeSent value, $Res Function(Sub2ApiOAuthPendingEmailCodeSent) _then) = _$Sub2ApiOAuthPendingEmailCodeSentCopyWithImpl;
@useResult
$Res call({
 String message, Duration cooldown
});




}
/// @nodoc
class _$Sub2ApiOAuthPendingEmailCodeSentCopyWithImpl<$Res>
    implements $Sub2ApiOAuthPendingEmailCodeSentCopyWith<$Res> {
  _$Sub2ApiOAuthPendingEmailCodeSentCopyWithImpl(this._self, this._then);

  final Sub2ApiOAuthPendingEmailCodeSent _self;
  final $Res Function(Sub2ApiOAuthPendingEmailCodeSent) _then;

/// Create a copy of Sub2ApiOAuthPendingEmailCodeResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cooldown = null,}) {
  return _then(Sub2ApiOAuthPendingEmailCodeSent(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cooldown: null == cooldown ? _self.cooldown : cooldown // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class Sub2ApiOAuthPendingEmailActionRequired implements Sub2ApiOAuthPendingEmailCodeResult {
  const Sub2ApiOAuthPendingEmailActionRequired({required this.action});


 final  Sub2ApiOAuthPendingAction action;

/// Create a copy of Sub2ApiOAuthPendingEmailCodeResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiOAuthPendingEmailActionRequiredCopyWith<Sub2ApiOAuthPendingEmailActionRequired> get copyWith => _$Sub2ApiOAuthPendingEmailActionRequiredCopyWithImpl<Sub2ApiOAuthPendingEmailActionRequired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiOAuthPendingEmailActionRequired&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode => Object.hash(runtimeType,action);

@override
String toString() {
  return 'Sub2ApiOAuthPendingEmailCodeResult.actionRequired(action: $action)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiOAuthPendingEmailActionRequiredCopyWith<$Res> implements $Sub2ApiOAuthPendingEmailCodeResultCopyWith<$Res> {
  factory $Sub2ApiOAuthPendingEmailActionRequiredCopyWith(Sub2ApiOAuthPendingEmailActionRequired value, $Res Function(Sub2ApiOAuthPendingEmailActionRequired) _then) = _$Sub2ApiOAuthPendingEmailActionRequiredCopyWithImpl;
@useResult
$Res call({
 Sub2ApiOAuthPendingAction action
});


$Sub2ApiOAuthPendingActionCopyWith<$Res> get action;

}
/// @nodoc
class _$Sub2ApiOAuthPendingEmailActionRequiredCopyWithImpl<$Res>
    implements $Sub2ApiOAuthPendingEmailActionRequiredCopyWith<$Res> {
  _$Sub2ApiOAuthPendingEmailActionRequiredCopyWithImpl(this._self, this._then);

  final Sub2ApiOAuthPendingEmailActionRequired _self;
  final $Res Function(Sub2ApiOAuthPendingEmailActionRequired) _then;

/// Create a copy of Sub2ApiOAuthPendingEmailCodeResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? action = null,}) {
  return _then(Sub2ApiOAuthPendingEmailActionRequired(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as Sub2ApiOAuthPendingAction,
  ));
}

/// Create a copy of Sub2ApiOAuthPendingEmailCodeResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiOAuthPendingActionCopyWith<$Res> get action {

  return $Sub2ApiOAuthPendingActionCopyWith<$Res>(_self.action, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}

/// @nodoc
mixin _$Sub2ApiOAuthAdoptionDecision {

 bool? get adoptDisplayName; bool? get adoptAvatar;
/// Create a copy of Sub2ApiOAuthAdoptionDecision
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiOAuthAdoptionDecisionCopyWith<Sub2ApiOAuthAdoptionDecision> get copyWith => _$Sub2ApiOAuthAdoptionDecisionCopyWithImpl<Sub2ApiOAuthAdoptionDecision>(this as Sub2ApiOAuthAdoptionDecision, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiOAuthAdoptionDecision&&(identical(other.adoptDisplayName, adoptDisplayName) || other.adoptDisplayName == adoptDisplayName)&&(identical(other.adoptAvatar, adoptAvatar) || other.adoptAvatar == adoptAvatar));
}


@override
int get hashCode => Object.hash(runtimeType,adoptDisplayName,adoptAvatar);

@override
String toString() {
  return 'Sub2ApiOAuthAdoptionDecision(adoptDisplayName: $adoptDisplayName, adoptAvatar: $adoptAvatar)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiOAuthAdoptionDecisionCopyWith<$Res>  {
  factory $Sub2ApiOAuthAdoptionDecisionCopyWith(Sub2ApiOAuthAdoptionDecision value, $Res Function(Sub2ApiOAuthAdoptionDecision) _then) = _$Sub2ApiOAuthAdoptionDecisionCopyWithImpl;
@useResult
$Res call({
 bool? adoptDisplayName, bool? adoptAvatar
});




}
/// @nodoc
class _$Sub2ApiOAuthAdoptionDecisionCopyWithImpl<$Res>
    implements $Sub2ApiOAuthAdoptionDecisionCopyWith<$Res> {
  _$Sub2ApiOAuthAdoptionDecisionCopyWithImpl(this._self, this._then);

  final Sub2ApiOAuthAdoptionDecision _self;
  final $Res Function(Sub2ApiOAuthAdoptionDecision) _then;

/// Create a copy of Sub2ApiOAuthAdoptionDecision
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adoptDisplayName = freezed,Object? adoptAvatar = freezed,}) {
  return _then(_self.copyWith(
adoptDisplayName: freezed == adoptDisplayName ? _self.adoptDisplayName : adoptDisplayName // ignore: cast_nullable_to_non_nullable
as bool?,adoptAvatar: freezed == adoptAvatar ? _self.adoptAvatar : adoptAvatar // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiOAuthAdoptionDecision].
extension Sub2ApiOAuthAdoptionDecisionPatterns on Sub2ApiOAuthAdoptionDecision {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiOAuthAdoptionDecision value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiOAuthAdoptionDecision() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiOAuthAdoptionDecision value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiOAuthAdoptionDecision():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiOAuthAdoptionDecision value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiOAuthAdoptionDecision() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? adoptDisplayName,  bool? adoptAvatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiOAuthAdoptionDecision() when $default != null:
return $default(_that.adoptDisplayName,_that.adoptAvatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? adoptDisplayName,  bool? adoptAvatar)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiOAuthAdoptionDecision():
return $default(_that.adoptDisplayName,_that.adoptAvatar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? adoptDisplayName,  bool? adoptAvatar)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiOAuthAdoptionDecision() when $default != null:
return $default(_that.adoptDisplayName,_that.adoptAvatar);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiOAuthAdoptionDecision implements Sub2ApiOAuthAdoptionDecision {
  const _Sub2ApiOAuthAdoptionDecision({this.adoptDisplayName, this.adoptAvatar});


@override final  bool? adoptDisplayName;
@override final  bool? adoptAvatar;

/// Create a copy of Sub2ApiOAuthAdoptionDecision
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiOAuthAdoptionDecisionCopyWith<_Sub2ApiOAuthAdoptionDecision> get copyWith => __$Sub2ApiOAuthAdoptionDecisionCopyWithImpl<_Sub2ApiOAuthAdoptionDecision>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiOAuthAdoptionDecision&&(identical(other.adoptDisplayName, adoptDisplayName) || other.adoptDisplayName == adoptDisplayName)&&(identical(other.adoptAvatar, adoptAvatar) || other.adoptAvatar == adoptAvatar));
}


@override
int get hashCode => Object.hash(runtimeType,adoptDisplayName,adoptAvatar);

@override
String toString() {
  return 'Sub2ApiOAuthAdoptionDecision(adoptDisplayName: $adoptDisplayName, adoptAvatar: $adoptAvatar)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiOAuthAdoptionDecisionCopyWith<$Res> implements $Sub2ApiOAuthAdoptionDecisionCopyWith<$Res> {
  factory _$Sub2ApiOAuthAdoptionDecisionCopyWith(_Sub2ApiOAuthAdoptionDecision value, $Res Function(_Sub2ApiOAuthAdoptionDecision) _then) = __$Sub2ApiOAuthAdoptionDecisionCopyWithImpl;
@override @useResult
$Res call({
 bool? adoptDisplayName, bool? adoptAvatar
});




}
/// @nodoc
class __$Sub2ApiOAuthAdoptionDecisionCopyWithImpl<$Res>
    implements _$Sub2ApiOAuthAdoptionDecisionCopyWith<$Res> {
  __$Sub2ApiOAuthAdoptionDecisionCopyWithImpl(this._self, this._then);

  final _Sub2ApiOAuthAdoptionDecision _self;
  final $Res Function(_Sub2ApiOAuthAdoptionDecision) _then;

/// Create a copy of Sub2ApiOAuthAdoptionDecision
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adoptDisplayName = freezed,Object? adoptAvatar = freezed,}) {
  return _then(_Sub2ApiOAuthAdoptionDecision(
adoptDisplayName: freezed == adoptDisplayName ? _self.adoptDisplayName : adoptDisplayName // ignore: cast_nullable_to_non_nullable
as bool?,adoptAvatar: freezed == adoptAvatar ? _self.adoptAvatar : adoptAvatar // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiOAuthPendingAction {

 String? get step; String? get error; String? get provider; String? get intent; String? get email; String? get resolvedEmail; Uri? get redirectUri; bool? get adoptionRequired; String? get suggestedDisplayName; String? get suggestedAvatarUrl; bool? get createAccountAllowed; bool? get forceEmailOnSignup; bool? get emailBindingRequired; bool? get existingAccountBindable; bool? get requiresEmailCompletion; String? get choiceReason;
/// Create a copy of Sub2ApiOAuthPendingAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiOAuthPendingActionCopyWith<Sub2ApiOAuthPendingAction> get copyWith => _$Sub2ApiOAuthPendingActionCopyWithImpl<Sub2ApiOAuthPendingAction>(this as Sub2ApiOAuthPendingAction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiOAuthPendingAction&&(identical(other.step, step) || other.step == step)&&(identical(other.error, error) || other.error == error)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.intent, intent) || other.intent == intent)&&(identical(other.email, email) || other.email == email)&&(identical(other.resolvedEmail, resolvedEmail) || other.resolvedEmail == resolvedEmail)&&(identical(other.redirectUri, redirectUri) || other.redirectUri == redirectUri)&&(identical(other.adoptionRequired, adoptionRequired) || other.adoptionRequired == adoptionRequired)&&(identical(other.suggestedDisplayName, suggestedDisplayName) || other.suggestedDisplayName == suggestedDisplayName)&&(identical(other.suggestedAvatarUrl, suggestedAvatarUrl) || other.suggestedAvatarUrl == suggestedAvatarUrl)&&(identical(other.createAccountAllowed, createAccountAllowed) || other.createAccountAllowed == createAccountAllowed)&&(identical(other.forceEmailOnSignup, forceEmailOnSignup) || other.forceEmailOnSignup == forceEmailOnSignup)&&(identical(other.emailBindingRequired, emailBindingRequired) || other.emailBindingRequired == emailBindingRequired)&&(identical(other.existingAccountBindable, existingAccountBindable) || other.existingAccountBindable == existingAccountBindable)&&(identical(other.requiresEmailCompletion, requiresEmailCompletion) || other.requiresEmailCompletion == requiresEmailCompletion)&&(identical(other.choiceReason, choiceReason) || other.choiceReason == choiceReason));
}


@override
int get hashCode => Object.hash(runtimeType,step,error,provider,intent,email,resolvedEmail,redirectUri,adoptionRequired,suggestedDisplayName,suggestedAvatarUrl,createAccountAllowed,forceEmailOnSignup,emailBindingRequired,existingAccountBindable,requiresEmailCompletion,choiceReason);

@override
String toString() {
  return 'Sub2ApiOAuthPendingAction(step: $step, error: $error, provider: $provider, intent: $intent, email: $email, resolvedEmail: $resolvedEmail, redirectUri: $redirectUri, adoptionRequired: $adoptionRequired, suggestedDisplayName: $suggestedDisplayName, suggestedAvatarUrl: $suggestedAvatarUrl, createAccountAllowed: $createAccountAllowed, forceEmailOnSignup: $forceEmailOnSignup, emailBindingRequired: $emailBindingRequired, existingAccountBindable: $existingAccountBindable, requiresEmailCompletion: $requiresEmailCompletion, choiceReason: $choiceReason)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiOAuthPendingActionCopyWith<$Res>  {
  factory $Sub2ApiOAuthPendingActionCopyWith(Sub2ApiOAuthPendingAction value, $Res Function(Sub2ApiOAuthPendingAction) _then) = _$Sub2ApiOAuthPendingActionCopyWithImpl;
@useResult
$Res call({
 String? step, String? error, String? provider, String? intent, String? email, String? resolvedEmail, Uri? redirectUri, bool? adoptionRequired, String? suggestedDisplayName, String? suggestedAvatarUrl, bool? createAccountAllowed, bool? forceEmailOnSignup, bool? emailBindingRequired, bool? existingAccountBindable, bool? requiresEmailCompletion, String? choiceReason
});




}
/// @nodoc
class _$Sub2ApiOAuthPendingActionCopyWithImpl<$Res>
    implements $Sub2ApiOAuthPendingActionCopyWith<$Res> {
  _$Sub2ApiOAuthPendingActionCopyWithImpl(this._self, this._then);

  final Sub2ApiOAuthPendingAction _self;
  final $Res Function(Sub2ApiOAuthPendingAction) _then;

/// Create a copy of Sub2ApiOAuthPendingAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = freezed,Object? error = freezed,Object? provider = freezed,Object? intent = freezed,Object? email = freezed,Object? resolvedEmail = freezed,Object? redirectUri = freezed,Object? adoptionRequired = freezed,Object? suggestedDisplayName = freezed,Object? suggestedAvatarUrl = freezed,Object? createAccountAllowed = freezed,Object? forceEmailOnSignup = freezed,Object? emailBindingRequired = freezed,Object? existingAccountBindable = freezed,Object? requiresEmailCompletion = freezed,Object? choiceReason = freezed,}) {
  return _then(_self.copyWith(
step: freezed == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,intent: freezed == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,resolvedEmail: freezed == resolvedEmail ? _self.resolvedEmail : resolvedEmail // ignore: cast_nullable_to_non_nullable
as String?,redirectUri: freezed == redirectUri ? _self.redirectUri : redirectUri // ignore: cast_nullable_to_non_nullable
as Uri?,adoptionRequired: freezed == adoptionRequired ? _self.adoptionRequired : adoptionRequired // ignore: cast_nullable_to_non_nullable
as bool?,suggestedDisplayName: freezed == suggestedDisplayName ? _self.suggestedDisplayName : suggestedDisplayName // ignore: cast_nullable_to_non_nullable
as String?,suggestedAvatarUrl: freezed == suggestedAvatarUrl ? _self.suggestedAvatarUrl : suggestedAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,createAccountAllowed: freezed == createAccountAllowed ? _self.createAccountAllowed : createAccountAllowed // ignore: cast_nullable_to_non_nullable
as bool?,forceEmailOnSignup: freezed == forceEmailOnSignup ? _self.forceEmailOnSignup : forceEmailOnSignup // ignore: cast_nullable_to_non_nullable
as bool?,emailBindingRequired: freezed == emailBindingRequired ? _self.emailBindingRequired : emailBindingRequired // ignore: cast_nullable_to_non_nullable
as bool?,existingAccountBindable: freezed == existingAccountBindable ? _self.existingAccountBindable : existingAccountBindable // ignore: cast_nullable_to_non_nullable
as bool?,requiresEmailCompletion: freezed == requiresEmailCompletion ? _self.requiresEmailCompletion : requiresEmailCompletion // ignore: cast_nullable_to_non_nullable
as bool?,choiceReason: freezed == choiceReason ? _self.choiceReason : choiceReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiOAuthPendingAction].
extension Sub2ApiOAuthPendingActionPatterns on Sub2ApiOAuthPendingAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiOAuthPendingAction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiOAuthPendingAction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiOAuthPendingAction value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiOAuthPendingAction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiOAuthPendingAction value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiOAuthPendingAction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? step,  String? error,  String? provider,  String? intent,  String? email,  String? resolvedEmail,  Uri? redirectUri,  bool? adoptionRequired,  String? suggestedDisplayName,  String? suggestedAvatarUrl,  bool? createAccountAllowed,  bool? forceEmailOnSignup,  bool? emailBindingRequired,  bool? existingAccountBindable,  bool? requiresEmailCompletion,  String? choiceReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiOAuthPendingAction() when $default != null:
return $default(_that.step,_that.error,_that.provider,_that.intent,_that.email,_that.resolvedEmail,_that.redirectUri,_that.adoptionRequired,_that.suggestedDisplayName,_that.suggestedAvatarUrl,_that.createAccountAllowed,_that.forceEmailOnSignup,_that.emailBindingRequired,_that.existingAccountBindable,_that.requiresEmailCompletion,_that.choiceReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? step,  String? error,  String? provider,  String? intent,  String? email,  String? resolvedEmail,  Uri? redirectUri,  bool? adoptionRequired,  String? suggestedDisplayName,  String? suggestedAvatarUrl,  bool? createAccountAllowed,  bool? forceEmailOnSignup,  bool? emailBindingRequired,  bool? existingAccountBindable,  bool? requiresEmailCompletion,  String? choiceReason)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiOAuthPendingAction():
return $default(_that.step,_that.error,_that.provider,_that.intent,_that.email,_that.resolvedEmail,_that.redirectUri,_that.adoptionRequired,_that.suggestedDisplayName,_that.suggestedAvatarUrl,_that.createAccountAllowed,_that.forceEmailOnSignup,_that.emailBindingRequired,_that.existingAccountBindable,_that.requiresEmailCompletion,_that.choiceReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? step,  String? error,  String? provider,  String? intent,  String? email,  String? resolvedEmail,  Uri? redirectUri,  bool? adoptionRequired,  String? suggestedDisplayName,  String? suggestedAvatarUrl,  bool? createAccountAllowed,  bool? forceEmailOnSignup,  bool? emailBindingRequired,  bool? existingAccountBindable,  bool? requiresEmailCompletion,  String? choiceReason)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiOAuthPendingAction() when $default != null:
return $default(_that.step,_that.error,_that.provider,_that.intent,_that.email,_that.resolvedEmail,_that.redirectUri,_that.adoptionRequired,_that.suggestedDisplayName,_that.suggestedAvatarUrl,_that.createAccountAllowed,_that.forceEmailOnSignup,_that.emailBindingRequired,_that.existingAccountBindable,_that.requiresEmailCompletion,_that.choiceReason);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiOAuthPendingAction implements Sub2ApiOAuthPendingAction {
  const _Sub2ApiOAuthPendingAction({this.step, this.error, this.provider, this.intent, this.email, this.resolvedEmail, this.redirectUri, this.adoptionRequired, this.suggestedDisplayName, this.suggestedAvatarUrl, this.createAccountAllowed, this.forceEmailOnSignup, this.emailBindingRequired, this.existingAccountBindable, this.requiresEmailCompletion, this.choiceReason});


@override final  String? step;
@override final  String? error;
@override final  String? provider;
@override final  String? intent;
@override final  String? email;
@override final  String? resolvedEmail;
@override final  Uri? redirectUri;
@override final  bool? adoptionRequired;
@override final  String? suggestedDisplayName;
@override final  String? suggestedAvatarUrl;
@override final  bool? createAccountAllowed;
@override final  bool? forceEmailOnSignup;
@override final  bool? emailBindingRequired;
@override final  bool? existingAccountBindable;
@override final  bool? requiresEmailCompletion;
@override final  String? choiceReason;

/// Create a copy of Sub2ApiOAuthPendingAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiOAuthPendingActionCopyWith<_Sub2ApiOAuthPendingAction> get copyWith => __$Sub2ApiOAuthPendingActionCopyWithImpl<_Sub2ApiOAuthPendingAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiOAuthPendingAction&&(identical(other.step, step) || other.step == step)&&(identical(other.error, error) || other.error == error)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.intent, intent) || other.intent == intent)&&(identical(other.email, email) || other.email == email)&&(identical(other.resolvedEmail, resolvedEmail) || other.resolvedEmail == resolvedEmail)&&(identical(other.redirectUri, redirectUri) || other.redirectUri == redirectUri)&&(identical(other.adoptionRequired, adoptionRequired) || other.adoptionRequired == adoptionRequired)&&(identical(other.suggestedDisplayName, suggestedDisplayName) || other.suggestedDisplayName == suggestedDisplayName)&&(identical(other.suggestedAvatarUrl, suggestedAvatarUrl) || other.suggestedAvatarUrl == suggestedAvatarUrl)&&(identical(other.createAccountAllowed, createAccountAllowed) || other.createAccountAllowed == createAccountAllowed)&&(identical(other.forceEmailOnSignup, forceEmailOnSignup) || other.forceEmailOnSignup == forceEmailOnSignup)&&(identical(other.emailBindingRequired, emailBindingRequired) || other.emailBindingRequired == emailBindingRequired)&&(identical(other.existingAccountBindable, existingAccountBindable) || other.existingAccountBindable == existingAccountBindable)&&(identical(other.requiresEmailCompletion, requiresEmailCompletion) || other.requiresEmailCompletion == requiresEmailCompletion)&&(identical(other.choiceReason, choiceReason) || other.choiceReason == choiceReason));
}


@override
int get hashCode => Object.hash(runtimeType,step,error,provider,intent,email,resolvedEmail,redirectUri,adoptionRequired,suggestedDisplayName,suggestedAvatarUrl,createAccountAllowed,forceEmailOnSignup,emailBindingRequired,existingAccountBindable,requiresEmailCompletion,choiceReason);

@override
String toString() {
  return 'Sub2ApiOAuthPendingAction(step: $step, error: $error, provider: $provider, intent: $intent, email: $email, resolvedEmail: $resolvedEmail, redirectUri: $redirectUri, adoptionRequired: $adoptionRequired, suggestedDisplayName: $suggestedDisplayName, suggestedAvatarUrl: $suggestedAvatarUrl, createAccountAllowed: $createAccountAllowed, forceEmailOnSignup: $forceEmailOnSignup, emailBindingRequired: $emailBindingRequired, existingAccountBindable: $existingAccountBindable, requiresEmailCompletion: $requiresEmailCompletion, choiceReason: $choiceReason)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiOAuthPendingActionCopyWith<$Res> implements $Sub2ApiOAuthPendingActionCopyWith<$Res> {
  factory _$Sub2ApiOAuthPendingActionCopyWith(_Sub2ApiOAuthPendingAction value, $Res Function(_Sub2ApiOAuthPendingAction) _then) = __$Sub2ApiOAuthPendingActionCopyWithImpl;
@override @useResult
$Res call({
 String? step, String? error, String? provider, String? intent, String? email, String? resolvedEmail, Uri? redirectUri, bool? adoptionRequired, String? suggestedDisplayName, String? suggestedAvatarUrl, bool? createAccountAllowed, bool? forceEmailOnSignup, bool? emailBindingRequired, bool? existingAccountBindable, bool? requiresEmailCompletion, String? choiceReason
});




}
/// @nodoc
class __$Sub2ApiOAuthPendingActionCopyWithImpl<$Res>
    implements _$Sub2ApiOAuthPendingActionCopyWith<$Res> {
  __$Sub2ApiOAuthPendingActionCopyWithImpl(this._self, this._then);

  final _Sub2ApiOAuthPendingAction _self;
  final $Res Function(_Sub2ApiOAuthPendingAction) _then;

/// Create a copy of Sub2ApiOAuthPendingAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = freezed,Object? error = freezed,Object? provider = freezed,Object? intent = freezed,Object? email = freezed,Object? resolvedEmail = freezed,Object? redirectUri = freezed,Object? adoptionRequired = freezed,Object? suggestedDisplayName = freezed,Object? suggestedAvatarUrl = freezed,Object? createAccountAllowed = freezed,Object? forceEmailOnSignup = freezed,Object? emailBindingRequired = freezed,Object? existingAccountBindable = freezed,Object? requiresEmailCompletion = freezed,Object? choiceReason = freezed,}) {
  return _then(_Sub2ApiOAuthPendingAction(
step: freezed == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,intent: freezed == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,resolvedEmail: freezed == resolvedEmail ? _self.resolvedEmail : resolvedEmail // ignore: cast_nullable_to_non_nullable
as String?,redirectUri: freezed == redirectUri ? _self.redirectUri : redirectUri // ignore: cast_nullable_to_non_nullable
as Uri?,adoptionRequired: freezed == adoptionRequired ? _self.adoptionRequired : adoptionRequired // ignore: cast_nullable_to_non_nullable
as bool?,suggestedDisplayName: freezed == suggestedDisplayName ? _self.suggestedDisplayName : suggestedDisplayName // ignore: cast_nullable_to_non_nullable
as String?,suggestedAvatarUrl: freezed == suggestedAvatarUrl ? _self.suggestedAvatarUrl : suggestedAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,createAccountAllowed: freezed == createAccountAllowed ? _self.createAccountAllowed : createAccountAllowed // ignore: cast_nullable_to_non_nullable
as bool?,forceEmailOnSignup: freezed == forceEmailOnSignup ? _self.forceEmailOnSignup : forceEmailOnSignup // ignore: cast_nullable_to_non_nullable
as bool?,emailBindingRequired: freezed == emailBindingRequired ? _self.emailBindingRequired : emailBindingRequired // ignore: cast_nullable_to_non_nullable
as bool?,existingAccountBindable: freezed == existingAccountBindable ? _self.existingAccountBindable : existingAccountBindable // ignore: cast_nullable_to_non_nullable
as bool?,requiresEmailCompletion: freezed == requiresEmailCompletion ? _self.requiresEmailCompletion : requiresEmailCompletion // ignore: cast_nullable_to_non_nullable
as bool?,choiceReason: freezed == choiceReason ? _self.choiceReason : choiceReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiOAuthPendingCompletion {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiOAuthPendingCompletion);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Sub2ApiOAuthPendingCompletion()';
}


}

/// @nodoc
class $Sub2ApiOAuthPendingCompletionCopyWith<$Res>  {
$Sub2ApiOAuthPendingCompletionCopyWith(Sub2ApiOAuthPendingCompletion _, $Res Function(Sub2ApiOAuthPendingCompletion) __);
}


/// Adds pattern-matching-related methods to [Sub2ApiOAuthPendingCompletion].
extension Sub2ApiOAuthPendingCompletionPatterns on Sub2ApiOAuthPendingCompletion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Sub2ApiOAuthAuthenticated value)?  authenticated,TResult Function( Sub2ApiOAuthTwoFactorRequired value)?  twoFactorRequired,TResult Function( Sub2ApiOAuthActionRequired value)?  actionRequired,TResult Function( Sub2ApiOAuthBindingCompleted value)?  bindingCompleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Sub2ApiOAuthAuthenticated() when authenticated != null:
return authenticated(_that);case Sub2ApiOAuthTwoFactorRequired() when twoFactorRequired != null:
return twoFactorRequired(_that);case Sub2ApiOAuthActionRequired() when actionRequired != null:
return actionRequired(_that);case Sub2ApiOAuthBindingCompleted() when bindingCompleted != null:
return bindingCompleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Sub2ApiOAuthAuthenticated value)  authenticated,required TResult Function( Sub2ApiOAuthTwoFactorRequired value)  twoFactorRequired,required TResult Function( Sub2ApiOAuthActionRequired value)  actionRequired,required TResult Function( Sub2ApiOAuthBindingCompleted value)  bindingCompleted,}){
final _that = this;
switch (_that) {
case Sub2ApiOAuthAuthenticated():
return authenticated(_that);case Sub2ApiOAuthTwoFactorRequired():
return twoFactorRequired(_that);case Sub2ApiOAuthActionRequired():
return actionRequired(_that);case Sub2ApiOAuthBindingCompleted():
return bindingCompleted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Sub2ApiOAuthAuthenticated value)?  authenticated,TResult? Function( Sub2ApiOAuthTwoFactorRequired value)?  twoFactorRequired,TResult? Function( Sub2ApiOAuthActionRequired value)?  actionRequired,TResult? Function( Sub2ApiOAuthBindingCompleted value)?  bindingCompleted,}){
final _that = this;
switch (_that) {
case Sub2ApiOAuthAuthenticated() when authenticated != null:
return authenticated(_that);case Sub2ApiOAuthTwoFactorRequired() when twoFactorRequired != null:
return twoFactorRequired(_that);case Sub2ApiOAuthActionRequired() when actionRequired != null:
return actionRequired(_that);case Sub2ApiOAuthBindingCompleted() when bindingCompleted != null:
return bindingCompleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Sub2ApiSession session,  Uri? redirectUri,  String? authResult)?  authenticated,TResult Function( Sub2ApiTwoFactorTemporaryToken temporaryToken,  String userEmailMasked,  Uri? redirectUri)?  twoFactorRequired,TResult Function( Sub2ApiOAuthPendingAction action)?  actionRequired,TResult Function( Uri? redirectUri,  String? authResult)?  bindingCompleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Sub2ApiOAuthAuthenticated() when authenticated != null:
return authenticated(_that.session,_that.redirectUri,_that.authResult);case Sub2ApiOAuthTwoFactorRequired() when twoFactorRequired != null:
return twoFactorRequired(_that.temporaryToken,_that.userEmailMasked,_that.redirectUri);case Sub2ApiOAuthActionRequired() when actionRequired != null:
return actionRequired(_that.action);case Sub2ApiOAuthBindingCompleted() when bindingCompleted != null:
return bindingCompleted(_that.redirectUri,_that.authResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Sub2ApiSession session,  Uri? redirectUri,  String? authResult)  authenticated,required TResult Function( Sub2ApiTwoFactorTemporaryToken temporaryToken,  String userEmailMasked,  Uri? redirectUri)  twoFactorRequired,required TResult Function( Sub2ApiOAuthPendingAction action)  actionRequired,required TResult Function( Uri? redirectUri,  String? authResult)  bindingCompleted,}) {final _that = this;
switch (_that) {
case Sub2ApiOAuthAuthenticated():
return authenticated(_that.session,_that.redirectUri,_that.authResult);case Sub2ApiOAuthTwoFactorRequired():
return twoFactorRequired(_that.temporaryToken,_that.userEmailMasked,_that.redirectUri);case Sub2ApiOAuthActionRequired():
return actionRequired(_that.action);case Sub2ApiOAuthBindingCompleted():
return bindingCompleted(_that.redirectUri,_that.authResult);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Sub2ApiSession session,  Uri? redirectUri,  String? authResult)?  authenticated,TResult? Function( Sub2ApiTwoFactorTemporaryToken temporaryToken,  String userEmailMasked,  Uri? redirectUri)?  twoFactorRequired,TResult? Function( Sub2ApiOAuthPendingAction action)?  actionRequired,TResult? Function( Uri? redirectUri,  String? authResult)?  bindingCompleted,}) {final _that = this;
switch (_that) {
case Sub2ApiOAuthAuthenticated() when authenticated != null:
return authenticated(_that.session,_that.redirectUri,_that.authResult);case Sub2ApiOAuthTwoFactorRequired() when twoFactorRequired != null:
return twoFactorRequired(_that.temporaryToken,_that.userEmailMasked,_that.redirectUri);case Sub2ApiOAuthActionRequired() when actionRequired != null:
return actionRequired(_that.action);case Sub2ApiOAuthBindingCompleted() when bindingCompleted != null:
return bindingCompleted(_that.redirectUri,_that.authResult);case _:
  return null;

}
}

}

/// @nodoc


class Sub2ApiOAuthAuthenticated implements Sub2ApiOAuthPendingCompletion {
  const Sub2ApiOAuthAuthenticated({required this.session, this.redirectUri, this.authResult});


 final  Sub2ApiSession session;
 final  Uri? redirectUri;
 final  String? authResult;

/// Create a copy of Sub2ApiOAuthPendingCompletion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiOAuthAuthenticatedCopyWith<Sub2ApiOAuthAuthenticated> get copyWith => _$Sub2ApiOAuthAuthenticatedCopyWithImpl<Sub2ApiOAuthAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiOAuthAuthenticated&&(identical(other.session, session) || other.session == session)&&(identical(other.redirectUri, redirectUri) || other.redirectUri == redirectUri)&&(identical(other.authResult, authResult) || other.authResult == authResult));
}


@override
int get hashCode => Object.hash(runtimeType,session,redirectUri,authResult);

@override
String toString() {
  return 'Sub2ApiOAuthPendingCompletion.authenticated(session: $session, redirectUri: $redirectUri, authResult: $authResult)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiOAuthAuthenticatedCopyWith<$Res> implements $Sub2ApiOAuthPendingCompletionCopyWith<$Res> {
  factory $Sub2ApiOAuthAuthenticatedCopyWith(Sub2ApiOAuthAuthenticated value, $Res Function(Sub2ApiOAuthAuthenticated) _then) = _$Sub2ApiOAuthAuthenticatedCopyWithImpl;
@useResult
$Res call({
 Sub2ApiSession session, Uri? redirectUri, String? authResult
});




}
/// @nodoc
class _$Sub2ApiOAuthAuthenticatedCopyWithImpl<$Res>
    implements $Sub2ApiOAuthAuthenticatedCopyWith<$Res> {
  _$Sub2ApiOAuthAuthenticatedCopyWithImpl(this._self, this._then);

  final Sub2ApiOAuthAuthenticated _self;
  final $Res Function(Sub2ApiOAuthAuthenticated) _then;

/// Create a copy of Sub2ApiOAuthPendingCompletion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,Object? redirectUri = freezed,Object? authResult = freezed,}) {
  return _then(Sub2ApiOAuthAuthenticated(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Sub2ApiSession,redirectUri: freezed == redirectUri ? _self.redirectUri : redirectUri // ignore: cast_nullable_to_non_nullable
as Uri?,authResult: freezed == authResult ? _self.authResult : authResult // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class Sub2ApiOAuthTwoFactorRequired implements Sub2ApiOAuthPendingCompletion {
  const Sub2ApiOAuthTwoFactorRequired({required this.temporaryToken, required this.userEmailMasked, this.redirectUri});


 final  Sub2ApiTwoFactorTemporaryToken temporaryToken;
 final  String userEmailMasked;
 final  Uri? redirectUri;

/// Create a copy of Sub2ApiOAuthPendingCompletion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiOAuthTwoFactorRequiredCopyWith<Sub2ApiOAuthTwoFactorRequired> get copyWith => _$Sub2ApiOAuthTwoFactorRequiredCopyWithImpl<Sub2ApiOAuthTwoFactorRequired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiOAuthTwoFactorRequired&&(identical(other.temporaryToken, temporaryToken) || other.temporaryToken == temporaryToken)&&(identical(other.userEmailMasked, userEmailMasked) || other.userEmailMasked == userEmailMasked)&&(identical(other.redirectUri, redirectUri) || other.redirectUri == redirectUri));
}


@override
int get hashCode => Object.hash(runtimeType,temporaryToken,userEmailMasked,redirectUri);

@override
String toString() {
  return 'Sub2ApiOAuthPendingCompletion.twoFactorRequired(temporaryToken: $temporaryToken, userEmailMasked: $userEmailMasked, redirectUri: $redirectUri)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiOAuthTwoFactorRequiredCopyWith<$Res> implements $Sub2ApiOAuthPendingCompletionCopyWith<$Res> {
  factory $Sub2ApiOAuthTwoFactorRequiredCopyWith(Sub2ApiOAuthTwoFactorRequired value, $Res Function(Sub2ApiOAuthTwoFactorRequired) _then) = _$Sub2ApiOAuthTwoFactorRequiredCopyWithImpl;
@useResult
$Res call({
 Sub2ApiTwoFactorTemporaryToken temporaryToken, String userEmailMasked, Uri? redirectUri
});




}
/// @nodoc
class _$Sub2ApiOAuthTwoFactorRequiredCopyWithImpl<$Res>
    implements $Sub2ApiOAuthTwoFactorRequiredCopyWith<$Res> {
  _$Sub2ApiOAuthTwoFactorRequiredCopyWithImpl(this._self, this._then);

  final Sub2ApiOAuthTwoFactorRequired _self;
  final $Res Function(Sub2ApiOAuthTwoFactorRequired) _then;

/// Create a copy of Sub2ApiOAuthPendingCompletion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? temporaryToken = null,Object? userEmailMasked = null,Object? redirectUri = freezed,}) {
  return _then(Sub2ApiOAuthTwoFactorRequired(
temporaryToken: null == temporaryToken ? _self.temporaryToken : temporaryToken // ignore: cast_nullable_to_non_nullable
as Sub2ApiTwoFactorTemporaryToken,userEmailMasked: null == userEmailMasked ? _self.userEmailMasked : userEmailMasked // ignore: cast_nullable_to_non_nullable
as String,redirectUri: freezed == redirectUri ? _self.redirectUri : redirectUri // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}


}

/// @nodoc


class Sub2ApiOAuthActionRequired implements Sub2ApiOAuthPendingCompletion {
  const Sub2ApiOAuthActionRequired({required this.action});


 final  Sub2ApiOAuthPendingAction action;

/// Create a copy of Sub2ApiOAuthPendingCompletion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiOAuthActionRequiredCopyWith<Sub2ApiOAuthActionRequired> get copyWith => _$Sub2ApiOAuthActionRequiredCopyWithImpl<Sub2ApiOAuthActionRequired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiOAuthActionRequired&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode => Object.hash(runtimeType,action);

@override
String toString() {
  return 'Sub2ApiOAuthPendingCompletion.actionRequired(action: $action)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiOAuthActionRequiredCopyWith<$Res> implements $Sub2ApiOAuthPendingCompletionCopyWith<$Res> {
  factory $Sub2ApiOAuthActionRequiredCopyWith(Sub2ApiOAuthActionRequired value, $Res Function(Sub2ApiOAuthActionRequired) _then) = _$Sub2ApiOAuthActionRequiredCopyWithImpl;
@useResult
$Res call({
 Sub2ApiOAuthPendingAction action
});


$Sub2ApiOAuthPendingActionCopyWith<$Res> get action;

}
/// @nodoc
class _$Sub2ApiOAuthActionRequiredCopyWithImpl<$Res>
    implements $Sub2ApiOAuthActionRequiredCopyWith<$Res> {
  _$Sub2ApiOAuthActionRequiredCopyWithImpl(this._self, this._then);

  final Sub2ApiOAuthActionRequired _self;
  final $Res Function(Sub2ApiOAuthActionRequired) _then;

/// Create a copy of Sub2ApiOAuthPendingCompletion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? action = null,}) {
  return _then(Sub2ApiOAuthActionRequired(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as Sub2ApiOAuthPendingAction,
  ));
}

/// Create a copy of Sub2ApiOAuthPendingCompletion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiOAuthPendingActionCopyWith<$Res> get action {

  return $Sub2ApiOAuthPendingActionCopyWith<$Res>(_self.action, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}

/// @nodoc


class Sub2ApiOAuthBindingCompleted implements Sub2ApiOAuthPendingCompletion {
  const Sub2ApiOAuthBindingCompleted({this.redirectUri, this.authResult});


 final  Uri? redirectUri;
 final  String? authResult;

/// Create a copy of Sub2ApiOAuthPendingCompletion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiOAuthBindingCompletedCopyWith<Sub2ApiOAuthBindingCompleted> get copyWith => _$Sub2ApiOAuthBindingCompletedCopyWithImpl<Sub2ApiOAuthBindingCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiOAuthBindingCompleted&&(identical(other.redirectUri, redirectUri) || other.redirectUri == redirectUri)&&(identical(other.authResult, authResult) || other.authResult == authResult));
}


@override
int get hashCode => Object.hash(runtimeType,redirectUri,authResult);

@override
String toString() {
  return 'Sub2ApiOAuthPendingCompletion.bindingCompleted(redirectUri: $redirectUri, authResult: $authResult)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiOAuthBindingCompletedCopyWith<$Res> implements $Sub2ApiOAuthPendingCompletionCopyWith<$Res> {
  factory $Sub2ApiOAuthBindingCompletedCopyWith(Sub2ApiOAuthBindingCompleted value, $Res Function(Sub2ApiOAuthBindingCompleted) _then) = _$Sub2ApiOAuthBindingCompletedCopyWithImpl;
@useResult
$Res call({
 Uri? redirectUri, String? authResult
});




}
/// @nodoc
class _$Sub2ApiOAuthBindingCompletedCopyWithImpl<$Res>
    implements $Sub2ApiOAuthBindingCompletedCopyWith<$Res> {
  _$Sub2ApiOAuthBindingCompletedCopyWithImpl(this._self, this._then);

  final Sub2ApiOAuthBindingCompleted _self;
  final $Res Function(Sub2ApiOAuthBindingCompleted) _then;

/// Create a copy of Sub2ApiOAuthPendingCompletion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? redirectUri = freezed,Object? authResult = freezed,}) {
  return _then(Sub2ApiOAuthBindingCompleted(
redirectUri: freezed == redirectUri ? _self.redirectUri : redirectUri // ignore: cast_nullable_to_non_nullable
as Uri?,authResult: freezed == authResult ? _self.authResult : authResult // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
