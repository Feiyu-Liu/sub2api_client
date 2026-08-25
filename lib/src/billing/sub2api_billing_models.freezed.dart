// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_billing_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sub2ApiPaymentConfig {

 bool get enabled; Sub2ApiDecimal get minAmount; Sub2ApiDecimal get maxAmount; Sub2ApiDecimal get dailyLimit; int get orderTimeoutMinutes; int get maxPendingOrders; List<String> get enabledPaymentTypes; bool get balanceDisabled; Sub2ApiDecimal get balanceRechargeMultiplier; Sub2ApiDecimal get subscriptionUsdToCnyRate; Sub2ApiDecimal get rechargeFeeRate; String get loadBalanceStrategy; String get productNamePrefix; String get productNameSuffix; String get helpImageUrl; String get helpText; String? get stripePublishableKey; bool get cancelRateLimitEnabled; int get cancelRateLimitMax; int get cancelRateLimitWindow; String get cancelRateLimitUnit; String get cancelRateLimitMode; bool get alipayForceQrCode;
/// Create a copy of Sub2ApiPaymentConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiPaymentConfigCopyWith<Sub2ApiPaymentConfig> get copyWith => _$Sub2ApiPaymentConfigCopyWithImpl<Sub2ApiPaymentConfig>(this as Sub2ApiPaymentConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiPaymentConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.maxAmount, maxAmount) || other.maxAmount == maxAmount)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.orderTimeoutMinutes, orderTimeoutMinutes) || other.orderTimeoutMinutes == orderTimeoutMinutes)&&(identical(other.maxPendingOrders, maxPendingOrders) || other.maxPendingOrders == maxPendingOrders)&&const DeepCollectionEquality().equals(other.enabledPaymentTypes, enabledPaymentTypes)&&(identical(other.balanceDisabled, balanceDisabled) || other.balanceDisabled == balanceDisabled)&&(identical(other.balanceRechargeMultiplier, balanceRechargeMultiplier) || other.balanceRechargeMultiplier == balanceRechargeMultiplier)&&(identical(other.subscriptionUsdToCnyRate, subscriptionUsdToCnyRate) || other.subscriptionUsdToCnyRate == subscriptionUsdToCnyRate)&&(identical(other.rechargeFeeRate, rechargeFeeRate) || other.rechargeFeeRate == rechargeFeeRate)&&(identical(other.loadBalanceStrategy, loadBalanceStrategy) || other.loadBalanceStrategy == loadBalanceStrategy)&&(identical(other.productNamePrefix, productNamePrefix) || other.productNamePrefix == productNamePrefix)&&(identical(other.productNameSuffix, productNameSuffix) || other.productNameSuffix == productNameSuffix)&&(identical(other.helpImageUrl, helpImageUrl) || other.helpImageUrl == helpImageUrl)&&(identical(other.helpText, helpText) || other.helpText == helpText)&&(identical(other.stripePublishableKey, stripePublishableKey) || other.stripePublishableKey == stripePublishableKey)&&(identical(other.cancelRateLimitEnabled, cancelRateLimitEnabled) || other.cancelRateLimitEnabled == cancelRateLimitEnabled)&&(identical(other.cancelRateLimitMax, cancelRateLimitMax) || other.cancelRateLimitMax == cancelRateLimitMax)&&(identical(other.cancelRateLimitWindow, cancelRateLimitWindow) || other.cancelRateLimitWindow == cancelRateLimitWindow)&&(identical(other.cancelRateLimitUnit, cancelRateLimitUnit) || other.cancelRateLimitUnit == cancelRateLimitUnit)&&(identical(other.cancelRateLimitMode, cancelRateLimitMode) || other.cancelRateLimitMode == cancelRateLimitMode)&&(identical(other.alipayForceQrCode, alipayForceQrCode) || other.alipayForceQrCode == alipayForceQrCode));
}


@override
int get hashCode => Object.hashAll([runtimeType,enabled,minAmount,maxAmount,dailyLimit,orderTimeoutMinutes,maxPendingOrders,const DeepCollectionEquality().hash(enabledPaymentTypes),balanceDisabled,balanceRechargeMultiplier,subscriptionUsdToCnyRate,rechargeFeeRate,loadBalanceStrategy,productNamePrefix,productNameSuffix,helpImageUrl,helpText,stripePublishableKey,cancelRateLimitEnabled,cancelRateLimitMax,cancelRateLimitWindow,cancelRateLimitUnit,cancelRateLimitMode,alipayForceQrCode]);

@override
String toString() {
  return 'Sub2ApiPaymentConfig(enabled: $enabled, minAmount: $minAmount, maxAmount: $maxAmount, dailyLimit: $dailyLimit, orderTimeoutMinutes: $orderTimeoutMinutes, maxPendingOrders: $maxPendingOrders, enabledPaymentTypes: $enabledPaymentTypes, balanceDisabled: $balanceDisabled, balanceRechargeMultiplier: $balanceRechargeMultiplier, subscriptionUsdToCnyRate: $subscriptionUsdToCnyRate, rechargeFeeRate: $rechargeFeeRate, loadBalanceStrategy: $loadBalanceStrategy, productNamePrefix: $productNamePrefix, productNameSuffix: $productNameSuffix, helpImageUrl: $helpImageUrl, helpText: $helpText, stripePublishableKey: $stripePublishableKey, cancelRateLimitEnabled: $cancelRateLimitEnabled, cancelRateLimitMax: $cancelRateLimitMax, cancelRateLimitWindow: $cancelRateLimitWindow, cancelRateLimitUnit: $cancelRateLimitUnit, cancelRateLimitMode: $cancelRateLimitMode, alipayForceQrCode: $alipayForceQrCode)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiPaymentConfigCopyWith<$Res>  {
  factory $Sub2ApiPaymentConfigCopyWith(Sub2ApiPaymentConfig value, $Res Function(Sub2ApiPaymentConfig) _then) = _$Sub2ApiPaymentConfigCopyWithImpl;
@useResult
$Res call({
 bool enabled, Sub2ApiDecimal minAmount, Sub2ApiDecimal maxAmount, Sub2ApiDecimal dailyLimit, int orderTimeoutMinutes, int maxPendingOrders, List<String> enabledPaymentTypes, bool balanceDisabled, Sub2ApiDecimal balanceRechargeMultiplier, Sub2ApiDecimal subscriptionUsdToCnyRate, Sub2ApiDecimal rechargeFeeRate, String loadBalanceStrategy, String productNamePrefix, String productNameSuffix, String helpImageUrl, String helpText, String? stripePublishableKey, bool cancelRateLimitEnabled, int cancelRateLimitMax, int cancelRateLimitWindow, String cancelRateLimitUnit, String cancelRateLimitMode, bool alipayForceQrCode
});




}
/// @nodoc
class _$Sub2ApiPaymentConfigCopyWithImpl<$Res>
    implements $Sub2ApiPaymentConfigCopyWith<$Res> {
  _$Sub2ApiPaymentConfigCopyWithImpl(this._self, this._then);

  final Sub2ApiPaymentConfig _self;
  final $Res Function(Sub2ApiPaymentConfig) _then;

/// Create a copy of Sub2ApiPaymentConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? minAmount = null,Object? maxAmount = null,Object? dailyLimit = null,Object? orderTimeoutMinutes = null,Object? maxPendingOrders = null,Object? enabledPaymentTypes = null,Object? balanceDisabled = null,Object? balanceRechargeMultiplier = null,Object? subscriptionUsdToCnyRate = null,Object? rechargeFeeRate = null,Object? loadBalanceStrategy = null,Object? productNamePrefix = null,Object? productNameSuffix = null,Object? helpImageUrl = null,Object? helpText = null,Object? stripePublishableKey = freezed,Object? cancelRateLimitEnabled = null,Object? cancelRateLimitMax = null,Object? cancelRateLimitWindow = null,Object? cancelRateLimitUnit = null,Object? cancelRateLimitMode = null,Object? alipayForceQrCode = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,minAmount: null == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,maxAmount: null == maxAmount ? _self.maxAmount : maxAmount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,orderTimeoutMinutes: null == orderTimeoutMinutes ? _self.orderTimeoutMinutes : orderTimeoutMinutes // ignore: cast_nullable_to_non_nullable
as int,maxPendingOrders: null == maxPendingOrders ? _self.maxPendingOrders : maxPendingOrders // ignore: cast_nullable_to_non_nullable
as int,enabledPaymentTypes: null == enabledPaymentTypes ? _self.enabledPaymentTypes : enabledPaymentTypes // ignore: cast_nullable_to_non_nullable
as List<String>,balanceDisabled: null == balanceDisabled ? _self.balanceDisabled : balanceDisabled // ignore: cast_nullable_to_non_nullable
as bool,balanceRechargeMultiplier: null == balanceRechargeMultiplier ? _self.balanceRechargeMultiplier : balanceRechargeMultiplier // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,subscriptionUsdToCnyRate: null == subscriptionUsdToCnyRate ? _self.subscriptionUsdToCnyRate : subscriptionUsdToCnyRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,rechargeFeeRate: null == rechargeFeeRate ? _self.rechargeFeeRate : rechargeFeeRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,loadBalanceStrategy: null == loadBalanceStrategy ? _self.loadBalanceStrategy : loadBalanceStrategy // ignore: cast_nullable_to_non_nullable
as String,productNamePrefix: null == productNamePrefix ? _self.productNamePrefix : productNamePrefix // ignore: cast_nullable_to_non_nullable
as String,productNameSuffix: null == productNameSuffix ? _self.productNameSuffix : productNameSuffix // ignore: cast_nullable_to_non_nullable
as String,helpImageUrl: null == helpImageUrl ? _self.helpImageUrl : helpImageUrl // ignore: cast_nullable_to_non_nullable
as String,helpText: null == helpText ? _self.helpText : helpText // ignore: cast_nullable_to_non_nullable
as String,stripePublishableKey: freezed == stripePublishableKey ? _self.stripePublishableKey : stripePublishableKey // ignore: cast_nullable_to_non_nullable
as String?,cancelRateLimitEnabled: null == cancelRateLimitEnabled ? _self.cancelRateLimitEnabled : cancelRateLimitEnabled // ignore: cast_nullable_to_non_nullable
as bool,cancelRateLimitMax: null == cancelRateLimitMax ? _self.cancelRateLimitMax : cancelRateLimitMax // ignore: cast_nullable_to_non_nullable
as int,cancelRateLimitWindow: null == cancelRateLimitWindow ? _self.cancelRateLimitWindow : cancelRateLimitWindow // ignore: cast_nullable_to_non_nullable
as int,cancelRateLimitUnit: null == cancelRateLimitUnit ? _self.cancelRateLimitUnit : cancelRateLimitUnit // ignore: cast_nullable_to_non_nullable
as String,cancelRateLimitMode: null == cancelRateLimitMode ? _self.cancelRateLimitMode : cancelRateLimitMode // ignore: cast_nullable_to_non_nullable
as String,alipayForceQrCode: null == alipayForceQrCode ? _self.alipayForceQrCode : alipayForceQrCode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiPaymentConfig].
extension Sub2ApiPaymentConfigPatterns on Sub2ApiPaymentConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiPaymentConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiPaymentConfig value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiPaymentConfig value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  Sub2ApiDecimal minAmount,  Sub2ApiDecimal maxAmount,  Sub2ApiDecimal dailyLimit,  int orderTimeoutMinutes,  int maxPendingOrders,  List<String> enabledPaymentTypes,  bool balanceDisabled,  Sub2ApiDecimal balanceRechargeMultiplier,  Sub2ApiDecimal subscriptionUsdToCnyRate,  Sub2ApiDecimal rechargeFeeRate,  String loadBalanceStrategy,  String productNamePrefix,  String productNameSuffix,  String helpImageUrl,  String helpText,  String? stripePublishableKey,  bool cancelRateLimitEnabled,  int cancelRateLimitMax,  int cancelRateLimitWindow,  String cancelRateLimitUnit,  String cancelRateLimitMode,  bool alipayForceQrCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentConfig() when $default != null:
return $default(_that.enabled,_that.minAmount,_that.maxAmount,_that.dailyLimit,_that.orderTimeoutMinutes,_that.maxPendingOrders,_that.enabledPaymentTypes,_that.balanceDisabled,_that.balanceRechargeMultiplier,_that.subscriptionUsdToCnyRate,_that.rechargeFeeRate,_that.loadBalanceStrategy,_that.productNamePrefix,_that.productNameSuffix,_that.helpImageUrl,_that.helpText,_that.stripePublishableKey,_that.cancelRateLimitEnabled,_that.cancelRateLimitMax,_that.cancelRateLimitWindow,_that.cancelRateLimitUnit,_that.cancelRateLimitMode,_that.alipayForceQrCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  Sub2ApiDecimal minAmount,  Sub2ApiDecimal maxAmount,  Sub2ApiDecimal dailyLimit,  int orderTimeoutMinutes,  int maxPendingOrders,  List<String> enabledPaymentTypes,  bool balanceDisabled,  Sub2ApiDecimal balanceRechargeMultiplier,  Sub2ApiDecimal subscriptionUsdToCnyRate,  Sub2ApiDecimal rechargeFeeRate,  String loadBalanceStrategy,  String productNamePrefix,  String productNameSuffix,  String helpImageUrl,  String helpText,  String? stripePublishableKey,  bool cancelRateLimitEnabled,  int cancelRateLimitMax,  int cancelRateLimitWindow,  String cancelRateLimitUnit,  String cancelRateLimitMode,  bool alipayForceQrCode)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentConfig():
return $default(_that.enabled,_that.minAmount,_that.maxAmount,_that.dailyLimit,_that.orderTimeoutMinutes,_that.maxPendingOrders,_that.enabledPaymentTypes,_that.balanceDisabled,_that.balanceRechargeMultiplier,_that.subscriptionUsdToCnyRate,_that.rechargeFeeRate,_that.loadBalanceStrategy,_that.productNamePrefix,_that.productNameSuffix,_that.helpImageUrl,_that.helpText,_that.stripePublishableKey,_that.cancelRateLimitEnabled,_that.cancelRateLimitMax,_that.cancelRateLimitWindow,_that.cancelRateLimitUnit,_that.cancelRateLimitMode,_that.alipayForceQrCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  Sub2ApiDecimal minAmount,  Sub2ApiDecimal maxAmount,  Sub2ApiDecimal dailyLimit,  int orderTimeoutMinutes,  int maxPendingOrders,  List<String> enabledPaymentTypes,  bool balanceDisabled,  Sub2ApiDecimal balanceRechargeMultiplier,  Sub2ApiDecimal subscriptionUsdToCnyRate,  Sub2ApiDecimal rechargeFeeRate,  String loadBalanceStrategy,  String productNamePrefix,  String productNameSuffix,  String helpImageUrl,  String helpText,  String? stripePublishableKey,  bool cancelRateLimitEnabled,  int cancelRateLimitMax,  int cancelRateLimitWindow,  String cancelRateLimitUnit,  String cancelRateLimitMode,  bool alipayForceQrCode)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentConfig() when $default != null:
return $default(_that.enabled,_that.minAmount,_that.maxAmount,_that.dailyLimit,_that.orderTimeoutMinutes,_that.maxPendingOrders,_that.enabledPaymentTypes,_that.balanceDisabled,_that.balanceRechargeMultiplier,_that.subscriptionUsdToCnyRate,_that.rechargeFeeRate,_that.loadBalanceStrategy,_that.productNamePrefix,_that.productNameSuffix,_that.helpImageUrl,_that.helpText,_that.stripePublishableKey,_that.cancelRateLimitEnabled,_that.cancelRateLimitMax,_that.cancelRateLimitWindow,_that.cancelRateLimitUnit,_that.cancelRateLimitMode,_that.alipayForceQrCode);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiPaymentConfig implements Sub2ApiPaymentConfig {
  const _Sub2ApiPaymentConfig({required this.enabled, required this.minAmount, required this.maxAmount, required this.dailyLimit, required this.orderTimeoutMinutes, required this.maxPendingOrders, required final  List<String> enabledPaymentTypes, required this.balanceDisabled, required this.balanceRechargeMultiplier, required this.subscriptionUsdToCnyRate, required this.rechargeFeeRate, required this.loadBalanceStrategy, required this.productNamePrefix, required this.productNameSuffix, required this.helpImageUrl, required this.helpText, this.stripePublishableKey, required this.cancelRateLimitEnabled, required this.cancelRateLimitMax, required this.cancelRateLimitWindow, required this.cancelRateLimitUnit, required this.cancelRateLimitMode, required this.alipayForceQrCode}): _enabledPaymentTypes = enabledPaymentTypes;
  

@override final  bool enabled;
@override final  Sub2ApiDecimal minAmount;
@override final  Sub2ApiDecimal maxAmount;
@override final  Sub2ApiDecimal dailyLimit;
@override final  int orderTimeoutMinutes;
@override final  int maxPendingOrders;
 final  List<String> _enabledPaymentTypes;
@override List<String> get enabledPaymentTypes {
  if (_enabledPaymentTypes is EqualUnmodifiableListView) return _enabledPaymentTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_enabledPaymentTypes);
}

@override final  bool balanceDisabled;
@override final  Sub2ApiDecimal balanceRechargeMultiplier;
@override final  Sub2ApiDecimal subscriptionUsdToCnyRate;
@override final  Sub2ApiDecimal rechargeFeeRate;
@override final  String loadBalanceStrategy;
@override final  String productNamePrefix;
@override final  String productNameSuffix;
@override final  String helpImageUrl;
@override final  String helpText;
@override final  String? stripePublishableKey;
@override final  bool cancelRateLimitEnabled;
@override final  int cancelRateLimitMax;
@override final  int cancelRateLimitWindow;
@override final  String cancelRateLimitUnit;
@override final  String cancelRateLimitMode;
@override final  bool alipayForceQrCode;

/// Create a copy of Sub2ApiPaymentConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiPaymentConfigCopyWith<_Sub2ApiPaymentConfig> get copyWith => __$Sub2ApiPaymentConfigCopyWithImpl<_Sub2ApiPaymentConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiPaymentConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.maxAmount, maxAmount) || other.maxAmount == maxAmount)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.orderTimeoutMinutes, orderTimeoutMinutes) || other.orderTimeoutMinutes == orderTimeoutMinutes)&&(identical(other.maxPendingOrders, maxPendingOrders) || other.maxPendingOrders == maxPendingOrders)&&const DeepCollectionEquality().equals(other._enabledPaymentTypes, _enabledPaymentTypes)&&(identical(other.balanceDisabled, balanceDisabled) || other.balanceDisabled == balanceDisabled)&&(identical(other.balanceRechargeMultiplier, balanceRechargeMultiplier) || other.balanceRechargeMultiplier == balanceRechargeMultiplier)&&(identical(other.subscriptionUsdToCnyRate, subscriptionUsdToCnyRate) || other.subscriptionUsdToCnyRate == subscriptionUsdToCnyRate)&&(identical(other.rechargeFeeRate, rechargeFeeRate) || other.rechargeFeeRate == rechargeFeeRate)&&(identical(other.loadBalanceStrategy, loadBalanceStrategy) || other.loadBalanceStrategy == loadBalanceStrategy)&&(identical(other.productNamePrefix, productNamePrefix) || other.productNamePrefix == productNamePrefix)&&(identical(other.productNameSuffix, productNameSuffix) || other.productNameSuffix == productNameSuffix)&&(identical(other.helpImageUrl, helpImageUrl) || other.helpImageUrl == helpImageUrl)&&(identical(other.helpText, helpText) || other.helpText == helpText)&&(identical(other.stripePublishableKey, stripePublishableKey) || other.stripePublishableKey == stripePublishableKey)&&(identical(other.cancelRateLimitEnabled, cancelRateLimitEnabled) || other.cancelRateLimitEnabled == cancelRateLimitEnabled)&&(identical(other.cancelRateLimitMax, cancelRateLimitMax) || other.cancelRateLimitMax == cancelRateLimitMax)&&(identical(other.cancelRateLimitWindow, cancelRateLimitWindow) || other.cancelRateLimitWindow == cancelRateLimitWindow)&&(identical(other.cancelRateLimitUnit, cancelRateLimitUnit) || other.cancelRateLimitUnit == cancelRateLimitUnit)&&(identical(other.cancelRateLimitMode, cancelRateLimitMode) || other.cancelRateLimitMode == cancelRateLimitMode)&&(identical(other.alipayForceQrCode, alipayForceQrCode) || other.alipayForceQrCode == alipayForceQrCode));
}


@override
int get hashCode => Object.hashAll([runtimeType,enabled,minAmount,maxAmount,dailyLimit,orderTimeoutMinutes,maxPendingOrders,const DeepCollectionEquality().hash(_enabledPaymentTypes),balanceDisabled,balanceRechargeMultiplier,subscriptionUsdToCnyRate,rechargeFeeRate,loadBalanceStrategy,productNamePrefix,productNameSuffix,helpImageUrl,helpText,stripePublishableKey,cancelRateLimitEnabled,cancelRateLimitMax,cancelRateLimitWindow,cancelRateLimitUnit,cancelRateLimitMode,alipayForceQrCode]);

@override
String toString() {
  return 'Sub2ApiPaymentConfig(enabled: $enabled, minAmount: $minAmount, maxAmount: $maxAmount, dailyLimit: $dailyLimit, orderTimeoutMinutes: $orderTimeoutMinutes, maxPendingOrders: $maxPendingOrders, enabledPaymentTypes: $enabledPaymentTypes, balanceDisabled: $balanceDisabled, balanceRechargeMultiplier: $balanceRechargeMultiplier, subscriptionUsdToCnyRate: $subscriptionUsdToCnyRate, rechargeFeeRate: $rechargeFeeRate, loadBalanceStrategy: $loadBalanceStrategy, productNamePrefix: $productNamePrefix, productNameSuffix: $productNameSuffix, helpImageUrl: $helpImageUrl, helpText: $helpText, stripePublishableKey: $stripePublishableKey, cancelRateLimitEnabled: $cancelRateLimitEnabled, cancelRateLimitMax: $cancelRateLimitMax, cancelRateLimitWindow: $cancelRateLimitWindow, cancelRateLimitUnit: $cancelRateLimitUnit, cancelRateLimitMode: $cancelRateLimitMode, alipayForceQrCode: $alipayForceQrCode)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiPaymentConfigCopyWith<$Res> implements $Sub2ApiPaymentConfigCopyWith<$Res> {
  factory _$Sub2ApiPaymentConfigCopyWith(_Sub2ApiPaymentConfig value, $Res Function(_Sub2ApiPaymentConfig) _then) = __$Sub2ApiPaymentConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, Sub2ApiDecimal minAmount, Sub2ApiDecimal maxAmount, Sub2ApiDecimal dailyLimit, int orderTimeoutMinutes, int maxPendingOrders, List<String> enabledPaymentTypes, bool balanceDisabled, Sub2ApiDecimal balanceRechargeMultiplier, Sub2ApiDecimal subscriptionUsdToCnyRate, Sub2ApiDecimal rechargeFeeRate, String loadBalanceStrategy, String productNamePrefix, String productNameSuffix, String helpImageUrl, String helpText, String? stripePublishableKey, bool cancelRateLimitEnabled, int cancelRateLimitMax, int cancelRateLimitWindow, String cancelRateLimitUnit, String cancelRateLimitMode, bool alipayForceQrCode
});




}
/// @nodoc
class __$Sub2ApiPaymentConfigCopyWithImpl<$Res>
    implements _$Sub2ApiPaymentConfigCopyWith<$Res> {
  __$Sub2ApiPaymentConfigCopyWithImpl(this._self, this._then);

  final _Sub2ApiPaymentConfig _self;
  final $Res Function(_Sub2ApiPaymentConfig) _then;

/// Create a copy of Sub2ApiPaymentConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? minAmount = null,Object? maxAmount = null,Object? dailyLimit = null,Object? orderTimeoutMinutes = null,Object? maxPendingOrders = null,Object? enabledPaymentTypes = null,Object? balanceDisabled = null,Object? balanceRechargeMultiplier = null,Object? subscriptionUsdToCnyRate = null,Object? rechargeFeeRate = null,Object? loadBalanceStrategy = null,Object? productNamePrefix = null,Object? productNameSuffix = null,Object? helpImageUrl = null,Object? helpText = null,Object? stripePublishableKey = freezed,Object? cancelRateLimitEnabled = null,Object? cancelRateLimitMax = null,Object? cancelRateLimitWindow = null,Object? cancelRateLimitUnit = null,Object? cancelRateLimitMode = null,Object? alipayForceQrCode = null,}) {
  return _then(_Sub2ApiPaymentConfig(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,minAmount: null == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,maxAmount: null == maxAmount ? _self.maxAmount : maxAmount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,orderTimeoutMinutes: null == orderTimeoutMinutes ? _self.orderTimeoutMinutes : orderTimeoutMinutes // ignore: cast_nullable_to_non_nullable
as int,maxPendingOrders: null == maxPendingOrders ? _self.maxPendingOrders : maxPendingOrders // ignore: cast_nullable_to_non_nullable
as int,enabledPaymentTypes: null == enabledPaymentTypes ? _self._enabledPaymentTypes : enabledPaymentTypes // ignore: cast_nullable_to_non_nullable
as List<String>,balanceDisabled: null == balanceDisabled ? _self.balanceDisabled : balanceDisabled // ignore: cast_nullable_to_non_nullable
as bool,balanceRechargeMultiplier: null == balanceRechargeMultiplier ? _self.balanceRechargeMultiplier : balanceRechargeMultiplier // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,subscriptionUsdToCnyRate: null == subscriptionUsdToCnyRate ? _self.subscriptionUsdToCnyRate : subscriptionUsdToCnyRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,rechargeFeeRate: null == rechargeFeeRate ? _self.rechargeFeeRate : rechargeFeeRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,loadBalanceStrategy: null == loadBalanceStrategy ? _self.loadBalanceStrategy : loadBalanceStrategy // ignore: cast_nullable_to_non_nullable
as String,productNamePrefix: null == productNamePrefix ? _self.productNamePrefix : productNamePrefix // ignore: cast_nullable_to_non_nullable
as String,productNameSuffix: null == productNameSuffix ? _self.productNameSuffix : productNameSuffix // ignore: cast_nullable_to_non_nullable
as String,helpImageUrl: null == helpImageUrl ? _self.helpImageUrl : helpImageUrl // ignore: cast_nullable_to_non_nullable
as String,helpText: null == helpText ? _self.helpText : helpText // ignore: cast_nullable_to_non_nullable
as String,stripePublishableKey: freezed == stripePublishableKey ? _self.stripePublishableKey : stripePublishableKey // ignore: cast_nullable_to_non_nullable
as String?,cancelRateLimitEnabled: null == cancelRateLimitEnabled ? _self.cancelRateLimitEnabled : cancelRateLimitEnabled // ignore: cast_nullable_to_non_nullable
as bool,cancelRateLimitMax: null == cancelRateLimitMax ? _self.cancelRateLimitMax : cancelRateLimitMax // ignore: cast_nullable_to_non_nullable
as int,cancelRateLimitWindow: null == cancelRateLimitWindow ? _self.cancelRateLimitWindow : cancelRateLimitWindow // ignore: cast_nullable_to_non_nullable
as int,cancelRateLimitUnit: null == cancelRateLimitUnit ? _self.cancelRateLimitUnit : cancelRateLimitUnit // ignore: cast_nullable_to_non_nullable
as String,cancelRateLimitMode: null == cancelRateLimitMode ? _self.cancelRateLimitMode : cancelRateLimitMode // ignore: cast_nullable_to_non_nullable
as String,alipayForceQrCode: null == alipayForceQrCode ? _self.alipayForceQrCode : alipayForceQrCode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiPaymentMethodLimits {

 String get paymentType; String get displayName; String get currency; Sub2ApiDecimal get feeRate; Sub2ApiDecimal get dailyLimit; Sub2ApiDecimal get singleMin; Sub2ApiDecimal get singleMax;
/// Create a copy of Sub2ApiPaymentMethodLimits
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiPaymentMethodLimitsCopyWith<Sub2ApiPaymentMethodLimits> get copyWith => _$Sub2ApiPaymentMethodLimitsCopyWithImpl<Sub2ApiPaymentMethodLimits>(this as Sub2ApiPaymentMethodLimits, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiPaymentMethodLimits&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.feeRate, feeRate) || other.feeRate == feeRate)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.singleMin, singleMin) || other.singleMin == singleMin)&&(identical(other.singleMax, singleMax) || other.singleMax == singleMax));
}


@override
int get hashCode => Object.hash(runtimeType,paymentType,displayName,currency,feeRate,dailyLimit,singleMin,singleMax);

@override
String toString() {
  return 'Sub2ApiPaymentMethodLimits(paymentType: $paymentType, displayName: $displayName, currency: $currency, feeRate: $feeRate, dailyLimit: $dailyLimit, singleMin: $singleMin, singleMax: $singleMax)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiPaymentMethodLimitsCopyWith<$Res>  {
  factory $Sub2ApiPaymentMethodLimitsCopyWith(Sub2ApiPaymentMethodLimits value, $Res Function(Sub2ApiPaymentMethodLimits) _then) = _$Sub2ApiPaymentMethodLimitsCopyWithImpl;
@useResult
$Res call({
 String paymentType, String displayName, String currency, Sub2ApiDecimal feeRate, Sub2ApiDecimal dailyLimit, Sub2ApiDecimal singleMin, Sub2ApiDecimal singleMax
});




}
/// @nodoc
class _$Sub2ApiPaymentMethodLimitsCopyWithImpl<$Res>
    implements $Sub2ApiPaymentMethodLimitsCopyWith<$Res> {
  _$Sub2ApiPaymentMethodLimitsCopyWithImpl(this._self, this._then);

  final Sub2ApiPaymentMethodLimits _self;
  final $Res Function(Sub2ApiPaymentMethodLimits) _then;

/// Create a copy of Sub2ApiPaymentMethodLimits
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentType = null,Object? displayName = null,Object? currency = null,Object? feeRate = null,Object? dailyLimit = null,Object? singleMin = null,Object? singleMax = null,}) {
  return _then(_self.copyWith(
paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,feeRate: null == feeRate ? _self.feeRate : feeRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,singleMin: null == singleMin ? _self.singleMin : singleMin // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,singleMax: null == singleMax ? _self.singleMax : singleMax // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiPaymentMethodLimits].
extension Sub2ApiPaymentMethodLimitsPatterns on Sub2ApiPaymentMethodLimits {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiPaymentMethodLimits value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentMethodLimits() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiPaymentMethodLimits value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentMethodLimits():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiPaymentMethodLimits value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentMethodLimits() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String paymentType,  String displayName,  String currency,  Sub2ApiDecimal feeRate,  Sub2ApiDecimal dailyLimit,  Sub2ApiDecimal singleMin,  Sub2ApiDecimal singleMax)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentMethodLimits() when $default != null:
return $default(_that.paymentType,_that.displayName,_that.currency,_that.feeRate,_that.dailyLimit,_that.singleMin,_that.singleMax);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String paymentType,  String displayName,  String currency,  Sub2ApiDecimal feeRate,  Sub2ApiDecimal dailyLimit,  Sub2ApiDecimal singleMin,  Sub2ApiDecimal singleMax)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentMethodLimits():
return $default(_that.paymentType,_that.displayName,_that.currency,_that.feeRate,_that.dailyLimit,_that.singleMin,_that.singleMax);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String paymentType,  String displayName,  String currency,  Sub2ApiDecimal feeRate,  Sub2ApiDecimal dailyLimit,  Sub2ApiDecimal singleMin,  Sub2ApiDecimal singleMax)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentMethodLimits() when $default != null:
return $default(_that.paymentType,_that.displayName,_that.currency,_that.feeRate,_that.dailyLimit,_that.singleMin,_that.singleMax);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiPaymentMethodLimits implements Sub2ApiPaymentMethodLimits {
  const _Sub2ApiPaymentMethodLimits({required this.paymentType, required this.displayName, required this.currency, required this.feeRate, required this.dailyLimit, required this.singleMin, required this.singleMax});
  

@override final  String paymentType;
@override final  String displayName;
@override final  String currency;
@override final  Sub2ApiDecimal feeRate;
@override final  Sub2ApiDecimal dailyLimit;
@override final  Sub2ApiDecimal singleMin;
@override final  Sub2ApiDecimal singleMax;

/// Create a copy of Sub2ApiPaymentMethodLimits
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiPaymentMethodLimitsCopyWith<_Sub2ApiPaymentMethodLimits> get copyWith => __$Sub2ApiPaymentMethodLimitsCopyWithImpl<_Sub2ApiPaymentMethodLimits>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiPaymentMethodLimits&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.feeRate, feeRate) || other.feeRate == feeRate)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.singleMin, singleMin) || other.singleMin == singleMin)&&(identical(other.singleMax, singleMax) || other.singleMax == singleMax));
}


@override
int get hashCode => Object.hash(runtimeType,paymentType,displayName,currency,feeRate,dailyLimit,singleMin,singleMax);

@override
String toString() {
  return 'Sub2ApiPaymentMethodLimits(paymentType: $paymentType, displayName: $displayName, currency: $currency, feeRate: $feeRate, dailyLimit: $dailyLimit, singleMin: $singleMin, singleMax: $singleMax)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiPaymentMethodLimitsCopyWith<$Res> implements $Sub2ApiPaymentMethodLimitsCopyWith<$Res> {
  factory _$Sub2ApiPaymentMethodLimitsCopyWith(_Sub2ApiPaymentMethodLimits value, $Res Function(_Sub2ApiPaymentMethodLimits) _then) = __$Sub2ApiPaymentMethodLimitsCopyWithImpl;
@override @useResult
$Res call({
 String paymentType, String displayName, String currency, Sub2ApiDecimal feeRate, Sub2ApiDecimal dailyLimit, Sub2ApiDecimal singleMin, Sub2ApiDecimal singleMax
});




}
/// @nodoc
class __$Sub2ApiPaymentMethodLimitsCopyWithImpl<$Res>
    implements _$Sub2ApiPaymentMethodLimitsCopyWith<$Res> {
  __$Sub2ApiPaymentMethodLimitsCopyWithImpl(this._self, this._then);

  final _Sub2ApiPaymentMethodLimits _self;
  final $Res Function(_Sub2ApiPaymentMethodLimits) _then;

/// Create a copy of Sub2ApiPaymentMethodLimits
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentType = null,Object? displayName = null,Object? currency = null,Object? feeRate = null,Object? dailyLimit = null,Object? singleMin = null,Object? singleMax = null,}) {
  return _then(_Sub2ApiPaymentMethodLimits(
paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,feeRate: null == feeRate ? _self.feeRate : feeRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,singleMin: null == singleMin ? _self.singleMin : singleMin // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,singleMax: null == singleMax ? _self.singleMax : singleMax // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiPaymentLimits {

 Map<String, Sub2ApiPaymentMethodLimits> get methods; Sub2ApiDecimal get globalMin; Sub2ApiDecimal get globalMax;
/// Create a copy of Sub2ApiPaymentLimits
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiPaymentLimitsCopyWith<Sub2ApiPaymentLimits> get copyWith => _$Sub2ApiPaymentLimitsCopyWithImpl<Sub2ApiPaymentLimits>(this as Sub2ApiPaymentLimits, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiPaymentLimits&&const DeepCollectionEquality().equals(other.methods, methods)&&(identical(other.globalMin, globalMin) || other.globalMin == globalMin)&&(identical(other.globalMax, globalMax) || other.globalMax == globalMax));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(methods),globalMin,globalMax);

@override
String toString() {
  return 'Sub2ApiPaymentLimits(methods: $methods, globalMin: $globalMin, globalMax: $globalMax)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiPaymentLimitsCopyWith<$Res>  {
  factory $Sub2ApiPaymentLimitsCopyWith(Sub2ApiPaymentLimits value, $Res Function(Sub2ApiPaymentLimits) _then) = _$Sub2ApiPaymentLimitsCopyWithImpl;
@useResult
$Res call({
 Map<String, Sub2ApiPaymentMethodLimits> methods, Sub2ApiDecimal globalMin, Sub2ApiDecimal globalMax
});




}
/// @nodoc
class _$Sub2ApiPaymentLimitsCopyWithImpl<$Res>
    implements $Sub2ApiPaymentLimitsCopyWith<$Res> {
  _$Sub2ApiPaymentLimitsCopyWithImpl(this._self, this._then);

  final Sub2ApiPaymentLimits _self;
  final $Res Function(Sub2ApiPaymentLimits) _then;

/// Create a copy of Sub2ApiPaymentLimits
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? methods = null,Object? globalMin = null,Object? globalMax = null,}) {
  return _then(_self.copyWith(
methods: null == methods ? _self.methods : methods // ignore: cast_nullable_to_non_nullable
as Map<String, Sub2ApiPaymentMethodLimits>,globalMin: null == globalMin ? _self.globalMin : globalMin // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,globalMax: null == globalMax ? _self.globalMax : globalMax // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiPaymentLimits].
extension Sub2ApiPaymentLimitsPatterns on Sub2ApiPaymentLimits {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiPaymentLimits value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentLimits() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiPaymentLimits value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentLimits():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiPaymentLimits value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentLimits() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, Sub2ApiPaymentMethodLimits> methods,  Sub2ApiDecimal globalMin,  Sub2ApiDecimal globalMax)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentLimits() when $default != null:
return $default(_that.methods,_that.globalMin,_that.globalMax);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, Sub2ApiPaymentMethodLimits> methods,  Sub2ApiDecimal globalMin,  Sub2ApiDecimal globalMax)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentLimits():
return $default(_that.methods,_that.globalMin,_that.globalMax);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, Sub2ApiPaymentMethodLimits> methods,  Sub2ApiDecimal globalMin,  Sub2ApiDecimal globalMax)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentLimits() when $default != null:
return $default(_that.methods,_that.globalMin,_that.globalMax);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiPaymentLimits implements Sub2ApiPaymentLimits {
  const _Sub2ApiPaymentLimits({required final  Map<String, Sub2ApiPaymentMethodLimits> methods, required this.globalMin, required this.globalMax}): _methods = methods;
  

 final  Map<String, Sub2ApiPaymentMethodLimits> _methods;
@override Map<String, Sub2ApiPaymentMethodLimits> get methods {
  if (_methods is EqualUnmodifiableMapView) return _methods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_methods);
}

@override final  Sub2ApiDecimal globalMin;
@override final  Sub2ApiDecimal globalMax;

/// Create a copy of Sub2ApiPaymentLimits
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiPaymentLimitsCopyWith<_Sub2ApiPaymentLimits> get copyWith => __$Sub2ApiPaymentLimitsCopyWithImpl<_Sub2ApiPaymentLimits>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiPaymentLimits&&const DeepCollectionEquality().equals(other._methods, _methods)&&(identical(other.globalMin, globalMin) || other.globalMin == globalMin)&&(identical(other.globalMax, globalMax) || other.globalMax == globalMax));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_methods),globalMin,globalMax);

@override
String toString() {
  return 'Sub2ApiPaymentLimits(methods: $methods, globalMin: $globalMin, globalMax: $globalMax)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiPaymentLimitsCopyWith<$Res> implements $Sub2ApiPaymentLimitsCopyWith<$Res> {
  factory _$Sub2ApiPaymentLimitsCopyWith(_Sub2ApiPaymentLimits value, $Res Function(_Sub2ApiPaymentLimits) _then) = __$Sub2ApiPaymentLimitsCopyWithImpl;
@override @useResult
$Res call({
 Map<String, Sub2ApiPaymentMethodLimits> methods, Sub2ApiDecimal globalMin, Sub2ApiDecimal globalMax
});




}
/// @nodoc
class __$Sub2ApiPaymentLimitsCopyWithImpl<$Res>
    implements _$Sub2ApiPaymentLimitsCopyWith<$Res> {
  __$Sub2ApiPaymentLimitsCopyWithImpl(this._self, this._then);

  final _Sub2ApiPaymentLimits _self;
  final $Res Function(_Sub2ApiPaymentLimits) _then;

/// Create a copy of Sub2ApiPaymentLimits
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? methods = null,Object? globalMin = null,Object? globalMax = null,}) {
  return _then(_Sub2ApiPaymentLimits(
methods: null == methods ? _self._methods : methods // ignore: cast_nullable_to_non_nullable
as Map<String, Sub2ApiPaymentMethodLimits>,globalMin: null == globalMin ? _self.globalMin : globalMin // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,globalMax: null == globalMax ? _self.globalMax : globalMax // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiSubscriptionPlan {

 int get id; int get groupId; String get groupPlatform; String get groupName; Sub2ApiDecimal get rateMultiplier; bool get peakRateEnabled; String get peakStart; String get peakEnd; Sub2ApiDecimal get peakRateMultiplier; String get name; String get description; Sub2ApiDecimal get price; Sub2ApiDecimal? get originalPrice; int get validityDays; String get validityUnit; List<String> get features; String get productName; bool? get forSale; int? get sortOrder; Sub2ApiDecimal? get dailyLimitUsd; Sub2ApiDecimal? get weeklyLimitUsd; Sub2ApiDecimal? get monthlyLimitUsd; List<String>? get supportedModelScopes;
/// Create a copy of Sub2ApiSubscriptionPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiSubscriptionPlanCopyWith<Sub2ApiSubscriptionPlan> get copyWith => _$Sub2ApiSubscriptionPlanCopyWithImpl<Sub2ApiSubscriptionPlan>(this as Sub2ApiSubscriptionPlan, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiSubscriptionPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupPlatform, groupPlatform) || other.groupPlatform == groupPlatform)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.rateMultiplier, rateMultiplier) || other.rateMultiplier == rateMultiplier)&&(identical(other.peakRateEnabled, peakRateEnabled) || other.peakRateEnabled == peakRateEnabled)&&(identical(other.peakStart, peakStart) || other.peakStart == peakStart)&&(identical(other.peakEnd, peakEnd) || other.peakEnd == peakEnd)&&(identical(other.peakRateMultiplier, peakRateMultiplier) || other.peakRateMultiplier == peakRateMultiplier)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.validityDays, validityDays) || other.validityDays == validityDays)&&(identical(other.validityUnit, validityUnit) || other.validityUnit == validityUnit)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.forSale, forSale) || other.forSale == forSale)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.dailyLimitUsd, dailyLimitUsd) || other.dailyLimitUsd == dailyLimitUsd)&&(identical(other.weeklyLimitUsd, weeklyLimitUsd) || other.weeklyLimitUsd == weeklyLimitUsd)&&(identical(other.monthlyLimitUsd, monthlyLimitUsd) || other.monthlyLimitUsd == monthlyLimitUsd)&&const DeepCollectionEquality().equals(other.supportedModelScopes, supportedModelScopes));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,groupId,groupPlatform,groupName,rateMultiplier,peakRateEnabled,peakStart,peakEnd,peakRateMultiplier,name,description,price,originalPrice,validityDays,validityUnit,const DeepCollectionEquality().hash(features),productName,forSale,sortOrder,dailyLimitUsd,weeklyLimitUsd,monthlyLimitUsd,const DeepCollectionEquality().hash(supportedModelScopes)]);

@override
String toString() {
  return 'Sub2ApiSubscriptionPlan(id: $id, groupId: $groupId, groupPlatform: $groupPlatform, groupName: $groupName, rateMultiplier: $rateMultiplier, peakRateEnabled: $peakRateEnabled, peakStart: $peakStart, peakEnd: $peakEnd, peakRateMultiplier: $peakRateMultiplier, name: $name, description: $description, price: $price, originalPrice: $originalPrice, validityDays: $validityDays, validityUnit: $validityUnit, features: $features, productName: $productName, forSale: $forSale, sortOrder: $sortOrder, dailyLimitUsd: $dailyLimitUsd, weeklyLimitUsd: $weeklyLimitUsd, monthlyLimitUsd: $monthlyLimitUsd, supportedModelScopes: $supportedModelScopes)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiSubscriptionPlanCopyWith<$Res>  {
  factory $Sub2ApiSubscriptionPlanCopyWith(Sub2ApiSubscriptionPlan value, $Res Function(Sub2ApiSubscriptionPlan) _then) = _$Sub2ApiSubscriptionPlanCopyWithImpl;
@useResult
$Res call({
 int id, int groupId, String groupPlatform, String groupName, Sub2ApiDecimal rateMultiplier, bool peakRateEnabled, String peakStart, String peakEnd, Sub2ApiDecimal peakRateMultiplier, String name, String description, Sub2ApiDecimal price, Sub2ApiDecimal? originalPrice, int validityDays, String validityUnit, List<String> features, String productName, bool? forSale, int? sortOrder, Sub2ApiDecimal? dailyLimitUsd, Sub2ApiDecimal? weeklyLimitUsd, Sub2ApiDecimal? monthlyLimitUsd, List<String>? supportedModelScopes
});




}
/// @nodoc
class _$Sub2ApiSubscriptionPlanCopyWithImpl<$Res>
    implements $Sub2ApiSubscriptionPlanCopyWith<$Res> {
  _$Sub2ApiSubscriptionPlanCopyWithImpl(this._self, this._then);

  final Sub2ApiSubscriptionPlan _self;
  final $Res Function(Sub2ApiSubscriptionPlan) _then;

/// Create a copy of Sub2ApiSubscriptionPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? groupId = null,Object? groupPlatform = null,Object? groupName = null,Object? rateMultiplier = null,Object? peakRateEnabled = null,Object? peakStart = null,Object? peakEnd = null,Object? peakRateMultiplier = null,Object? name = null,Object? description = null,Object? price = null,Object? originalPrice = freezed,Object? validityDays = null,Object? validityUnit = null,Object? features = null,Object? productName = null,Object? forSale = freezed,Object? sortOrder = freezed,Object? dailyLimitUsd = freezed,Object? weeklyLimitUsd = freezed,Object? monthlyLimitUsd = freezed,Object? supportedModelScopes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupPlatform: null == groupPlatform ? _self.groupPlatform : groupPlatform // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,rateMultiplier: null == rateMultiplier ? _self.rateMultiplier : rateMultiplier // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,peakRateEnabled: null == peakRateEnabled ? _self.peakRateEnabled : peakRateEnabled // ignore: cast_nullable_to_non_nullable
as bool,peakStart: null == peakStart ? _self.peakStart : peakStart // ignore: cast_nullable_to_non_nullable
as String,peakEnd: null == peakEnd ? _self.peakEnd : peakEnd // ignore: cast_nullable_to_non_nullable
as String,peakRateMultiplier: null == peakRateMultiplier ? _self.peakRateMultiplier : peakRateMultiplier // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,validityDays: null == validityDays ? _self.validityDays : validityDays // ignore: cast_nullable_to_non_nullable
as int,validityUnit: null == validityUnit ? _self.validityUnit : validityUnit // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,forSale: freezed == forSale ? _self.forSale : forSale // ignore: cast_nullable_to_non_nullable
as bool?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,dailyLimitUsd: freezed == dailyLimitUsd ? _self.dailyLimitUsd : dailyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,weeklyLimitUsd: freezed == weeklyLimitUsd ? _self.weeklyLimitUsd : weeklyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,monthlyLimitUsd: freezed == monthlyLimitUsd ? _self.monthlyLimitUsd : monthlyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,supportedModelScopes: freezed == supportedModelScopes ? _self.supportedModelScopes : supportedModelScopes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiSubscriptionPlan].
extension Sub2ApiSubscriptionPlanPatterns on Sub2ApiSubscriptionPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiSubscriptionPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiSubscriptionPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiSubscriptionPlan value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiSubscriptionPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiSubscriptionPlan value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiSubscriptionPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int groupId,  String groupPlatform,  String groupName,  Sub2ApiDecimal rateMultiplier,  bool peakRateEnabled,  String peakStart,  String peakEnd,  Sub2ApiDecimal peakRateMultiplier,  String name,  String description,  Sub2ApiDecimal price,  Sub2ApiDecimal? originalPrice,  int validityDays,  String validityUnit,  List<String> features,  String productName,  bool? forSale,  int? sortOrder,  Sub2ApiDecimal? dailyLimitUsd,  Sub2ApiDecimal? weeklyLimitUsd,  Sub2ApiDecimal? monthlyLimitUsd,  List<String>? supportedModelScopes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiSubscriptionPlan() when $default != null:
return $default(_that.id,_that.groupId,_that.groupPlatform,_that.groupName,_that.rateMultiplier,_that.peakRateEnabled,_that.peakStart,_that.peakEnd,_that.peakRateMultiplier,_that.name,_that.description,_that.price,_that.originalPrice,_that.validityDays,_that.validityUnit,_that.features,_that.productName,_that.forSale,_that.sortOrder,_that.dailyLimitUsd,_that.weeklyLimitUsd,_that.monthlyLimitUsd,_that.supportedModelScopes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int groupId,  String groupPlatform,  String groupName,  Sub2ApiDecimal rateMultiplier,  bool peakRateEnabled,  String peakStart,  String peakEnd,  Sub2ApiDecimal peakRateMultiplier,  String name,  String description,  Sub2ApiDecimal price,  Sub2ApiDecimal? originalPrice,  int validityDays,  String validityUnit,  List<String> features,  String productName,  bool? forSale,  int? sortOrder,  Sub2ApiDecimal? dailyLimitUsd,  Sub2ApiDecimal? weeklyLimitUsd,  Sub2ApiDecimal? monthlyLimitUsd,  List<String>? supportedModelScopes)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiSubscriptionPlan():
return $default(_that.id,_that.groupId,_that.groupPlatform,_that.groupName,_that.rateMultiplier,_that.peakRateEnabled,_that.peakStart,_that.peakEnd,_that.peakRateMultiplier,_that.name,_that.description,_that.price,_that.originalPrice,_that.validityDays,_that.validityUnit,_that.features,_that.productName,_that.forSale,_that.sortOrder,_that.dailyLimitUsd,_that.weeklyLimitUsd,_that.monthlyLimitUsd,_that.supportedModelScopes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int groupId,  String groupPlatform,  String groupName,  Sub2ApiDecimal rateMultiplier,  bool peakRateEnabled,  String peakStart,  String peakEnd,  Sub2ApiDecimal peakRateMultiplier,  String name,  String description,  Sub2ApiDecimal price,  Sub2ApiDecimal? originalPrice,  int validityDays,  String validityUnit,  List<String> features,  String productName,  bool? forSale,  int? sortOrder,  Sub2ApiDecimal? dailyLimitUsd,  Sub2ApiDecimal? weeklyLimitUsd,  Sub2ApiDecimal? monthlyLimitUsd,  List<String>? supportedModelScopes)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiSubscriptionPlan() when $default != null:
return $default(_that.id,_that.groupId,_that.groupPlatform,_that.groupName,_that.rateMultiplier,_that.peakRateEnabled,_that.peakStart,_that.peakEnd,_that.peakRateMultiplier,_that.name,_that.description,_that.price,_that.originalPrice,_that.validityDays,_that.validityUnit,_that.features,_that.productName,_that.forSale,_that.sortOrder,_that.dailyLimitUsd,_that.weeklyLimitUsd,_that.monthlyLimitUsd,_that.supportedModelScopes);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiSubscriptionPlan implements Sub2ApiSubscriptionPlan {
  const _Sub2ApiSubscriptionPlan({required this.id, required this.groupId, required this.groupPlatform, required this.groupName, required this.rateMultiplier, required this.peakRateEnabled, required this.peakStart, required this.peakEnd, required this.peakRateMultiplier, required this.name, required this.description, required this.price, this.originalPrice, required this.validityDays, required this.validityUnit, required final  List<String> features, required this.productName, this.forSale, this.sortOrder, this.dailyLimitUsd, this.weeklyLimitUsd, this.monthlyLimitUsd, final  List<String>? supportedModelScopes}): _features = features,_supportedModelScopes = supportedModelScopes;
  

@override final  int id;
@override final  int groupId;
@override final  String groupPlatform;
@override final  String groupName;
@override final  Sub2ApiDecimal rateMultiplier;
@override final  bool peakRateEnabled;
@override final  String peakStart;
@override final  String peakEnd;
@override final  Sub2ApiDecimal peakRateMultiplier;
@override final  String name;
@override final  String description;
@override final  Sub2ApiDecimal price;
@override final  Sub2ApiDecimal? originalPrice;
@override final  int validityDays;
@override final  String validityUnit;
 final  List<String> _features;
@override List<String> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

@override final  String productName;
@override final  bool? forSale;
@override final  int? sortOrder;
@override final  Sub2ApiDecimal? dailyLimitUsd;
@override final  Sub2ApiDecimal? weeklyLimitUsd;
@override final  Sub2ApiDecimal? monthlyLimitUsd;
 final  List<String>? _supportedModelScopes;
@override List<String>? get supportedModelScopes {
  final value = _supportedModelScopes;
  if (value == null) return null;
  if (_supportedModelScopes is EqualUnmodifiableListView) return _supportedModelScopes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Sub2ApiSubscriptionPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiSubscriptionPlanCopyWith<_Sub2ApiSubscriptionPlan> get copyWith => __$Sub2ApiSubscriptionPlanCopyWithImpl<_Sub2ApiSubscriptionPlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiSubscriptionPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupPlatform, groupPlatform) || other.groupPlatform == groupPlatform)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.rateMultiplier, rateMultiplier) || other.rateMultiplier == rateMultiplier)&&(identical(other.peakRateEnabled, peakRateEnabled) || other.peakRateEnabled == peakRateEnabled)&&(identical(other.peakStart, peakStart) || other.peakStart == peakStart)&&(identical(other.peakEnd, peakEnd) || other.peakEnd == peakEnd)&&(identical(other.peakRateMultiplier, peakRateMultiplier) || other.peakRateMultiplier == peakRateMultiplier)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.validityDays, validityDays) || other.validityDays == validityDays)&&(identical(other.validityUnit, validityUnit) || other.validityUnit == validityUnit)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.forSale, forSale) || other.forSale == forSale)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.dailyLimitUsd, dailyLimitUsd) || other.dailyLimitUsd == dailyLimitUsd)&&(identical(other.weeklyLimitUsd, weeklyLimitUsd) || other.weeklyLimitUsd == weeklyLimitUsd)&&(identical(other.monthlyLimitUsd, monthlyLimitUsd) || other.monthlyLimitUsd == monthlyLimitUsd)&&const DeepCollectionEquality().equals(other._supportedModelScopes, _supportedModelScopes));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,groupId,groupPlatform,groupName,rateMultiplier,peakRateEnabled,peakStart,peakEnd,peakRateMultiplier,name,description,price,originalPrice,validityDays,validityUnit,const DeepCollectionEquality().hash(_features),productName,forSale,sortOrder,dailyLimitUsd,weeklyLimitUsd,monthlyLimitUsd,const DeepCollectionEquality().hash(_supportedModelScopes)]);

@override
String toString() {
  return 'Sub2ApiSubscriptionPlan(id: $id, groupId: $groupId, groupPlatform: $groupPlatform, groupName: $groupName, rateMultiplier: $rateMultiplier, peakRateEnabled: $peakRateEnabled, peakStart: $peakStart, peakEnd: $peakEnd, peakRateMultiplier: $peakRateMultiplier, name: $name, description: $description, price: $price, originalPrice: $originalPrice, validityDays: $validityDays, validityUnit: $validityUnit, features: $features, productName: $productName, forSale: $forSale, sortOrder: $sortOrder, dailyLimitUsd: $dailyLimitUsd, weeklyLimitUsd: $weeklyLimitUsd, monthlyLimitUsd: $monthlyLimitUsd, supportedModelScopes: $supportedModelScopes)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiSubscriptionPlanCopyWith<$Res> implements $Sub2ApiSubscriptionPlanCopyWith<$Res> {
  factory _$Sub2ApiSubscriptionPlanCopyWith(_Sub2ApiSubscriptionPlan value, $Res Function(_Sub2ApiSubscriptionPlan) _then) = __$Sub2ApiSubscriptionPlanCopyWithImpl;
@override @useResult
$Res call({
 int id, int groupId, String groupPlatform, String groupName, Sub2ApiDecimal rateMultiplier, bool peakRateEnabled, String peakStart, String peakEnd, Sub2ApiDecimal peakRateMultiplier, String name, String description, Sub2ApiDecimal price, Sub2ApiDecimal? originalPrice, int validityDays, String validityUnit, List<String> features, String productName, bool? forSale, int? sortOrder, Sub2ApiDecimal? dailyLimitUsd, Sub2ApiDecimal? weeklyLimitUsd, Sub2ApiDecimal? monthlyLimitUsd, List<String>? supportedModelScopes
});




}
/// @nodoc
class __$Sub2ApiSubscriptionPlanCopyWithImpl<$Res>
    implements _$Sub2ApiSubscriptionPlanCopyWith<$Res> {
  __$Sub2ApiSubscriptionPlanCopyWithImpl(this._self, this._then);

  final _Sub2ApiSubscriptionPlan _self;
  final $Res Function(_Sub2ApiSubscriptionPlan) _then;

/// Create a copy of Sub2ApiSubscriptionPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? groupId = null,Object? groupPlatform = null,Object? groupName = null,Object? rateMultiplier = null,Object? peakRateEnabled = null,Object? peakStart = null,Object? peakEnd = null,Object? peakRateMultiplier = null,Object? name = null,Object? description = null,Object? price = null,Object? originalPrice = freezed,Object? validityDays = null,Object? validityUnit = null,Object? features = null,Object? productName = null,Object? forSale = freezed,Object? sortOrder = freezed,Object? dailyLimitUsd = freezed,Object? weeklyLimitUsd = freezed,Object? monthlyLimitUsd = freezed,Object? supportedModelScopes = freezed,}) {
  return _then(_Sub2ApiSubscriptionPlan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupPlatform: null == groupPlatform ? _self.groupPlatform : groupPlatform // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,rateMultiplier: null == rateMultiplier ? _self.rateMultiplier : rateMultiplier // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,peakRateEnabled: null == peakRateEnabled ? _self.peakRateEnabled : peakRateEnabled // ignore: cast_nullable_to_non_nullable
as bool,peakStart: null == peakStart ? _self.peakStart : peakStart // ignore: cast_nullable_to_non_nullable
as String,peakEnd: null == peakEnd ? _self.peakEnd : peakEnd // ignore: cast_nullable_to_non_nullable
as String,peakRateMultiplier: null == peakRateMultiplier ? _self.peakRateMultiplier : peakRateMultiplier // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,validityDays: null == validityDays ? _self.validityDays : validityDays // ignore: cast_nullable_to_non_nullable
as int,validityUnit: null == validityUnit ? _self.validityUnit : validityUnit // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,forSale: freezed == forSale ? _self.forSale : forSale // ignore: cast_nullable_to_non_nullable
as bool?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,dailyLimitUsd: freezed == dailyLimitUsd ? _self.dailyLimitUsd : dailyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,weeklyLimitUsd: freezed == weeklyLimitUsd ? _self.weeklyLimitUsd : weeklyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,monthlyLimitUsd: freezed == monthlyLimitUsd ? _self.monthlyLimitUsd : monthlyLimitUsd // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal?,supportedModelScopes: freezed == supportedModelScopes ? _self._supportedModelScopes : supportedModelScopes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiCheckoutInfo {

 Sub2ApiPaymentLimits get limits; List<Sub2ApiSubscriptionPlan> get plans; bool get balanceDisabled; Sub2ApiDecimal get balanceRechargeMultiplier; Sub2ApiDecimal get subscriptionUsdToCnyRate; Sub2ApiDecimal get rechargeFeeRate; String get helpText; String get helpImageUrl; String? get stripePublishableKey; bool get alipayForceQrCode;
/// Create a copy of Sub2ApiCheckoutInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiCheckoutInfoCopyWith<Sub2ApiCheckoutInfo> get copyWith => _$Sub2ApiCheckoutInfoCopyWithImpl<Sub2ApiCheckoutInfo>(this as Sub2ApiCheckoutInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiCheckoutInfo&&(identical(other.limits, limits) || other.limits == limits)&&const DeepCollectionEquality().equals(other.plans, plans)&&(identical(other.balanceDisabled, balanceDisabled) || other.balanceDisabled == balanceDisabled)&&(identical(other.balanceRechargeMultiplier, balanceRechargeMultiplier) || other.balanceRechargeMultiplier == balanceRechargeMultiplier)&&(identical(other.subscriptionUsdToCnyRate, subscriptionUsdToCnyRate) || other.subscriptionUsdToCnyRate == subscriptionUsdToCnyRate)&&(identical(other.rechargeFeeRate, rechargeFeeRate) || other.rechargeFeeRate == rechargeFeeRate)&&(identical(other.helpText, helpText) || other.helpText == helpText)&&(identical(other.helpImageUrl, helpImageUrl) || other.helpImageUrl == helpImageUrl)&&(identical(other.stripePublishableKey, stripePublishableKey) || other.stripePublishableKey == stripePublishableKey)&&(identical(other.alipayForceQrCode, alipayForceQrCode) || other.alipayForceQrCode == alipayForceQrCode));
}


@override
int get hashCode => Object.hash(runtimeType,limits,const DeepCollectionEquality().hash(plans),balanceDisabled,balanceRechargeMultiplier,subscriptionUsdToCnyRate,rechargeFeeRate,helpText,helpImageUrl,stripePublishableKey,alipayForceQrCode);

@override
String toString() {
  return 'Sub2ApiCheckoutInfo(limits: $limits, plans: $plans, balanceDisabled: $balanceDisabled, balanceRechargeMultiplier: $balanceRechargeMultiplier, subscriptionUsdToCnyRate: $subscriptionUsdToCnyRate, rechargeFeeRate: $rechargeFeeRate, helpText: $helpText, helpImageUrl: $helpImageUrl, stripePublishableKey: $stripePublishableKey, alipayForceQrCode: $alipayForceQrCode)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiCheckoutInfoCopyWith<$Res>  {
  factory $Sub2ApiCheckoutInfoCopyWith(Sub2ApiCheckoutInfo value, $Res Function(Sub2ApiCheckoutInfo) _then) = _$Sub2ApiCheckoutInfoCopyWithImpl;
@useResult
$Res call({
 Sub2ApiPaymentLimits limits, List<Sub2ApiSubscriptionPlan> plans, bool balanceDisabled, Sub2ApiDecimal balanceRechargeMultiplier, Sub2ApiDecimal subscriptionUsdToCnyRate, Sub2ApiDecimal rechargeFeeRate, String helpText, String helpImageUrl, String? stripePublishableKey, bool alipayForceQrCode
});


$Sub2ApiPaymentLimitsCopyWith<$Res> get limits;

}
/// @nodoc
class _$Sub2ApiCheckoutInfoCopyWithImpl<$Res>
    implements $Sub2ApiCheckoutInfoCopyWith<$Res> {
  _$Sub2ApiCheckoutInfoCopyWithImpl(this._self, this._then);

  final Sub2ApiCheckoutInfo _self;
  final $Res Function(Sub2ApiCheckoutInfo) _then;

/// Create a copy of Sub2ApiCheckoutInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limits = null,Object? plans = null,Object? balanceDisabled = null,Object? balanceRechargeMultiplier = null,Object? subscriptionUsdToCnyRate = null,Object? rechargeFeeRate = null,Object? helpText = null,Object? helpImageUrl = null,Object? stripePublishableKey = freezed,Object? alipayForceQrCode = null,}) {
  return _then(_self.copyWith(
limits: null == limits ? _self.limits : limits // ignore: cast_nullable_to_non_nullable
as Sub2ApiPaymentLimits,plans: null == plans ? _self.plans : plans // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiSubscriptionPlan>,balanceDisabled: null == balanceDisabled ? _self.balanceDisabled : balanceDisabled // ignore: cast_nullable_to_non_nullable
as bool,balanceRechargeMultiplier: null == balanceRechargeMultiplier ? _self.balanceRechargeMultiplier : balanceRechargeMultiplier // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,subscriptionUsdToCnyRate: null == subscriptionUsdToCnyRate ? _self.subscriptionUsdToCnyRate : subscriptionUsdToCnyRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,rechargeFeeRate: null == rechargeFeeRate ? _self.rechargeFeeRate : rechargeFeeRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,helpText: null == helpText ? _self.helpText : helpText // ignore: cast_nullable_to_non_nullable
as String,helpImageUrl: null == helpImageUrl ? _self.helpImageUrl : helpImageUrl // ignore: cast_nullable_to_non_nullable
as String,stripePublishableKey: freezed == stripePublishableKey ? _self.stripePublishableKey : stripePublishableKey // ignore: cast_nullable_to_non_nullable
as String?,alipayForceQrCode: null == alipayForceQrCode ? _self.alipayForceQrCode : alipayForceQrCode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Sub2ApiCheckoutInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiPaymentLimitsCopyWith<$Res> get limits {
  
  return $Sub2ApiPaymentLimitsCopyWith<$Res>(_self.limits, (value) {
    return _then(_self.copyWith(limits: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sub2ApiCheckoutInfo].
extension Sub2ApiCheckoutInfoPatterns on Sub2ApiCheckoutInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiCheckoutInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiCheckoutInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiCheckoutInfo value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiCheckoutInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiCheckoutInfo value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiCheckoutInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiPaymentLimits limits,  List<Sub2ApiSubscriptionPlan> plans,  bool balanceDisabled,  Sub2ApiDecimal balanceRechargeMultiplier,  Sub2ApiDecimal subscriptionUsdToCnyRate,  Sub2ApiDecimal rechargeFeeRate,  String helpText,  String helpImageUrl,  String? stripePublishableKey,  bool alipayForceQrCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiCheckoutInfo() when $default != null:
return $default(_that.limits,_that.plans,_that.balanceDisabled,_that.balanceRechargeMultiplier,_that.subscriptionUsdToCnyRate,_that.rechargeFeeRate,_that.helpText,_that.helpImageUrl,_that.stripePublishableKey,_that.alipayForceQrCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiPaymentLimits limits,  List<Sub2ApiSubscriptionPlan> plans,  bool balanceDisabled,  Sub2ApiDecimal balanceRechargeMultiplier,  Sub2ApiDecimal subscriptionUsdToCnyRate,  Sub2ApiDecimal rechargeFeeRate,  String helpText,  String helpImageUrl,  String? stripePublishableKey,  bool alipayForceQrCode)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiCheckoutInfo():
return $default(_that.limits,_that.plans,_that.balanceDisabled,_that.balanceRechargeMultiplier,_that.subscriptionUsdToCnyRate,_that.rechargeFeeRate,_that.helpText,_that.helpImageUrl,_that.stripePublishableKey,_that.alipayForceQrCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiPaymentLimits limits,  List<Sub2ApiSubscriptionPlan> plans,  bool balanceDisabled,  Sub2ApiDecimal balanceRechargeMultiplier,  Sub2ApiDecimal subscriptionUsdToCnyRate,  Sub2ApiDecimal rechargeFeeRate,  String helpText,  String helpImageUrl,  String? stripePublishableKey,  bool alipayForceQrCode)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiCheckoutInfo() when $default != null:
return $default(_that.limits,_that.plans,_that.balanceDisabled,_that.balanceRechargeMultiplier,_that.subscriptionUsdToCnyRate,_that.rechargeFeeRate,_that.helpText,_that.helpImageUrl,_that.stripePublishableKey,_that.alipayForceQrCode);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiCheckoutInfo implements Sub2ApiCheckoutInfo {
  const _Sub2ApiCheckoutInfo({required this.limits, required final  List<Sub2ApiSubscriptionPlan> plans, required this.balanceDisabled, required this.balanceRechargeMultiplier, required this.subscriptionUsdToCnyRate, required this.rechargeFeeRate, required this.helpText, required this.helpImageUrl, this.stripePublishableKey, required this.alipayForceQrCode}): _plans = plans;
  

@override final  Sub2ApiPaymentLimits limits;
 final  List<Sub2ApiSubscriptionPlan> _plans;
@override List<Sub2ApiSubscriptionPlan> get plans {
  if (_plans is EqualUnmodifiableListView) return _plans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plans);
}

@override final  bool balanceDisabled;
@override final  Sub2ApiDecimal balanceRechargeMultiplier;
@override final  Sub2ApiDecimal subscriptionUsdToCnyRate;
@override final  Sub2ApiDecimal rechargeFeeRate;
@override final  String helpText;
@override final  String helpImageUrl;
@override final  String? stripePublishableKey;
@override final  bool alipayForceQrCode;

/// Create a copy of Sub2ApiCheckoutInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiCheckoutInfoCopyWith<_Sub2ApiCheckoutInfo> get copyWith => __$Sub2ApiCheckoutInfoCopyWithImpl<_Sub2ApiCheckoutInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiCheckoutInfo&&(identical(other.limits, limits) || other.limits == limits)&&const DeepCollectionEquality().equals(other._plans, _plans)&&(identical(other.balanceDisabled, balanceDisabled) || other.balanceDisabled == balanceDisabled)&&(identical(other.balanceRechargeMultiplier, balanceRechargeMultiplier) || other.balanceRechargeMultiplier == balanceRechargeMultiplier)&&(identical(other.subscriptionUsdToCnyRate, subscriptionUsdToCnyRate) || other.subscriptionUsdToCnyRate == subscriptionUsdToCnyRate)&&(identical(other.rechargeFeeRate, rechargeFeeRate) || other.rechargeFeeRate == rechargeFeeRate)&&(identical(other.helpText, helpText) || other.helpText == helpText)&&(identical(other.helpImageUrl, helpImageUrl) || other.helpImageUrl == helpImageUrl)&&(identical(other.stripePublishableKey, stripePublishableKey) || other.stripePublishableKey == stripePublishableKey)&&(identical(other.alipayForceQrCode, alipayForceQrCode) || other.alipayForceQrCode == alipayForceQrCode));
}


@override
int get hashCode => Object.hash(runtimeType,limits,const DeepCollectionEquality().hash(_plans),balanceDisabled,balanceRechargeMultiplier,subscriptionUsdToCnyRate,rechargeFeeRate,helpText,helpImageUrl,stripePublishableKey,alipayForceQrCode);

@override
String toString() {
  return 'Sub2ApiCheckoutInfo(limits: $limits, plans: $plans, balanceDisabled: $balanceDisabled, balanceRechargeMultiplier: $balanceRechargeMultiplier, subscriptionUsdToCnyRate: $subscriptionUsdToCnyRate, rechargeFeeRate: $rechargeFeeRate, helpText: $helpText, helpImageUrl: $helpImageUrl, stripePublishableKey: $stripePublishableKey, alipayForceQrCode: $alipayForceQrCode)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiCheckoutInfoCopyWith<$Res> implements $Sub2ApiCheckoutInfoCopyWith<$Res> {
  factory _$Sub2ApiCheckoutInfoCopyWith(_Sub2ApiCheckoutInfo value, $Res Function(_Sub2ApiCheckoutInfo) _then) = __$Sub2ApiCheckoutInfoCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiPaymentLimits limits, List<Sub2ApiSubscriptionPlan> plans, bool balanceDisabled, Sub2ApiDecimal balanceRechargeMultiplier, Sub2ApiDecimal subscriptionUsdToCnyRate, Sub2ApiDecimal rechargeFeeRate, String helpText, String helpImageUrl, String? stripePublishableKey, bool alipayForceQrCode
});


@override $Sub2ApiPaymentLimitsCopyWith<$Res> get limits;

}
/// @nodoc
class __$Sub2ApiCheckoutInfoCopyWithImpl<$Res>
    implements _$Sub2ApiCheckoutInfoCopyWith<$Res> {
  __$Sub2ApiCheckoutInfoCopyWithImpl(this._self, this._then);

  final _Sub2ApiCheckoutInfo _self;
  final $Res Function(_Sub2ApiCheckoutInfo) _then;

/// Create a copy of Sub2ApiCheckoutInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limits = null,Object? plans = null,Object? balanceDisabled = null,Object? balanceRechargeMultiplier = null,Object? subscriptionUsdToCnyRate = null,Object? rechargeFeeRate = null,Object? helpText = null,Object? helpImageUrl = null,Object? stripePublishableKey = freezed,Object? alipayForceQrCode = null,}) {
  return _then(_Sub2ApiCheckoutInfo(
limits: null == limits ? _self.limits : limits // ignore: cast_nullable_to_non_nullable
as Sub2ApiPaymentLimits,plans: null == plans ? _self._plans : plans // ignore: cast_nullable_to_non_nullable
as List<Sub2ApiSubscriptionPlan>,balanceDisabled: null == balanceDisabled ? _self.balanceDisabled : balanceDisabled // ignore: cast_nullable_to_non_nullable
as bool,balanceRechargeMultiplier: null == balanceRechargeMultiplier ? _self.balanceRechargeMultiplier : balanceRechargeMultiplier // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,subscriptionUsdToCnyRate: null == subscriptionUsdToCnyRate ? _self.subscriptionUsdToCnyRate : subscriptionUsdToCnyRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,rechargeFeeRate: null == rechargeFeeRate ? _self.rechargeFeeRate : rechargeFeeRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,helpText: null == helpText ? _self.helpText : helpText // ignore: cast_nullable_to_non_nullable
as String,helpImageUrl: null == helpImageUrl ? _self.helpImageUrl : helpImageUrl // ignore: cast_nullable_to_non_nullable
as String,stripePublishableKey: freezed == stripePublishableKey ? _self.stripePublishableKey : stripePublishableKey // ignore: cast_nullable_to_non_nullable
as String?,alipayForceQrCode: null == alipayForceQrCode ? _self.alipayForceQrCode : alipayForceQrCode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Sub2ApiCheckoutInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiPaymentLimitsCopyWith<$Res> get limits {
  
  return $Sub2ApiPaymentLimitsCopyWith<$Res>(_self.limits, (value) {
    return _then(_self.copyWith(limits: value));
  });
}
}

/// @nodoc
mixin _$Sub2ApiPaymentOrder {

 int get id; int get userId; Sub2ApiDecimal get amount; Sub2ApiDecimal get payAmount; Sub2ApiDecimal get feeRate; String get currency; String get paymentType; String get outTradeNo; String get status; String get orderType; DateTime get createdAt; DateTime get expiresAt; DateTime? get paidAt; DateTime? get completedAt; Sub2ApiDecimal get refundAmount; String? get refundReason; DateTime? get refundRequestedAt; String? get refundRequestedBy; String? get refundRequestReason; int? get planId; String? get providerInstanceId;
/// Create a copy of Sub2ApiPaymentOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiPaymentOrderCopyWith<Sub2ApiPaymentOrder> get copyWith => _$Sub2ApiPaymentOrderCopyWithImpl<Sub2ApiPaymentOrder>(this as Sub2ApiPaymentOrder, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiPaymentOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.payAmount, payAmount) || other.payAmount == payAmount)&&(identical(other.feeRate, feeRate) || other.feeRate == feeRate)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.outTradeNo, outTradeNo) || other.outTradeNo == outTradeNo)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderType, orderType) || other.orderType == orderType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount)&&(identical(other.refundReason, refundReason) || other.refundReason == refundReason)&&(identical(other.refundRequestedAt, refundRequestedAt) || other.refundRequestedAt == refundRequestedAt)&&(identical(other.refundRequestedBy, refundRequestedBy) || other.refundRequestedBy == refundRequestedBy)&&(identical(other.refundRequestReason, refundRequestReason) || other.refundRequestReason == refundRequestReason)&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.providerInstanceId, providerInstanceId) || other.providerInstanceId == providerInstanceId));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,userId,amount,payAmount,feeRate,currency,paymentType,outTradeNo,status,orderType,createdAt,expiresAt,paidAt,completedAt,refundAmount,refundReason,refundRequestedAt,refundRequestedBy,refundRequestReason,planId,providerInstanceId]);

@override
String toString() {
  return 'Sub2ApiPaymentOrder(id: $id, userId: $userId, amount: $amount, payAmount: $payAmount, feeRate: $feeRate, currency: $currency, paymentType: $paymentType, outTradeNo: $outTradeNo, status: $status, orderType: $orderType, createdAt: $createdAt, expiresAt: $expiresAt, paidAt: $paidAt, completedAt: $completedAt, refundAmount: $refundAmount, refundReason: $refundReason, refundRequestedAt: $refundRequestedAt, refundRequestedBy: $refundRequestedBy, refundRequestReason: $refundRequestReason, planId: $planId, providerInstanceId: $providerInstanceId)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiPaymentOrderCopyWith<$Res>  {
  factory $Sub2ApiPaymentOrderCopyWith(Sub2ApiPaymentOrder value, $Res Function(Sub2ApiPaymentOrder) _then) = _$Sub2ApiPaymentOrderCopyWithImpl;
@useResult
$Res call({
 int id, int userId, Sub2ApiDecimal amount, Sub2ApiDecimal payAmount, Sub2ApiDecimal feeRate, String currency, String paymentType, String outTradeNo, String status, String orderType, DateTime createdAt, DateTime expiresAt, DateTime? paidAt, DateTime? completedAt, Sub2ApiDecimal refundAmount, String? refundReason, DateTime? refundRequestedAt, String? refundRequestedBy, String? refundRequestReason, int? planId, String? providerInstanceId
});




}
/// @nodoc
class _$Sub2ApiPaymentOrderCopyWithImpl<$Res>
    implements $Sub2ApiPaymentOrderCopyWith<$Res> {
  _$Sub2ApiPaymentOrderCopyWithImpl(this._self, this._then);

  final Sub2ApiPaymentOrder _self;
  final $Res Function(Sub2ApiPaymentOrder) _then;

/// Create a copy of Sub2ApiPaymentOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? amount = null,Object? payAmount = null,Object? feeRate = null,Object? currency = null,Object? paymentType = null,Object? outTradeNo = null,Object? status = null,Object? orderType = null,Object? createdAt = null,Object? expiresAt = null,Object? paidAt = freezed,Object? completedAt = freezed,Object? refundAmount = null,Object? refundReason = freezed,Object? refundRequestedAt = freezed,Object? refundRequestedBy = freezed,Object? refundRequestReason = freezed,Object? planId = freezed,Object? providerInstanceId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,payAmount: null == payAmount ? _self.payAmount : payAmount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,feeRate: null == feeRate ? _self.feeRate : feeRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,outTradeNo: null == outTradeNo ? _self.outTradeNo : outTradeNo // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,orderType: null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,refundAmount: null == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,refundReason: freezed == refundReason ? _self.refundReason : refundReason // ignore: cast_nullable_to_non_nullable
as String?,refundRequestedAt: freezed == refundRequestedAt ? _self.refundRequestedAt : refundRequestedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,refundRequestedBy: freezed == refundRequestedBy ? _self.refundRequestedBy : refundRequestedBy // ignore: cast_nullable_to_non_nullable
as String?,refundRequestReason: freezed == refundRequestReason ? _self.refundRequestReason : refundRequestReason // ignore: cast_nullable_to_non_nullable
as String?,planId: freezed == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int?,providerInstanceId: freezed == providerInstanceId ? _self.providerInstanceId : providerInstanceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiPaymentOrder].
extension Sub2ApiPaymentOrderPatterns on Sub2ApiPaymentOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiPaymentOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentOrder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiPaymentOrder value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentOrder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiPaymentOrder value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentOrder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userId,  Sub2ApiDecimal amount,  Sub2ApiDecimal payAmount,  Sub2ApiDecimal feeRate,  String currency,  String paymentType,  String outTradeNo,  String status,  String orderType,  DateTime createdAt,  DateTime expiresAt,  DateTime? paidAt,  DateTime? completedAt,  Sub2ApiDecimal refundAmount,  String? refundReason,  DateTime? refundRequestedAt,  String? refundRequestedBy,  String? refundRequestReason,  int? planId,  String? providerInstanceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentOrder() when $default != null:
return $default(_that.id,_that.userId,_that.amount,_that.payAmount,_that.feeRate,_that.currency,_that.paymentType,_that.outTradeNo,_that.status,_that.orderType,_that.createdAt,_that.expiresAt,_that.paidAt,_that.completedAt,_that.refundAmount,_that.refundReason,_that.refundRequestedAt,_that.refundRequestedBy,_that.refundRequestReason,_that.planId,_that.providerInstanceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userId,  Sub2ApiDecimal amount,  Sub2ApiDecimal payAmount,  Sub2ApiDecimal feeRate,  String currency,  String paymentType,  String outTradeNo,  String status,  String orderType,  DateTime createdAt,  DateTime expiresAt,  DateTime? paidAt,  DateTime? completedAt,  Sub2ApiDecimal refundAmount,  String? refundReason,  DateTime? refundRequestedAt,  String? refundRequestedBy,  String? refundRequestReason,  int? planId,  String? providerInstanceId)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentOrder():
return $default(_that.id,_that.userId,_that.amount,_that.payAmount,_that.feeRate,_that.currency,_that.paymentType,_that.outTradeNo,_that.status,_that.orderType,_that.createdAt,_that.expiresAt,_that.paidAt,_that.completedAt,_that.refundAmount,_that.refundReason,_that.refundRequestedAt,_that.refundRequestedBy,_that.refundRequestReason,_that.planId,_that.providerInstanceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userId,  Sub2ApiDecimal amount,  Sub2ApiDecimal payAmount,  Sub2ApiDecimal feeRate,  String currency,  String paymentType,  String outTradeNo,  String status,  String orderType,  DateTime createdAt,  DateTime expiresAt,  DateTime? paidAt,  DateTime? completedAt,  Sub2ApiDecimal refundAmount,  String? refundReason,  DateTime? refundRequestedAt,  String? refundRequestedBy,  String? refundRequestReason,  int? planId,  String? providerInstanceId)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentOrder() when $default != null:
return $default(_that.id,_that.userId,_that.amount,_that.payAmount,_that.feeRate,_that.currency,_that.paymentType,_that.outTradeNo,_that.status,_that.orderType,_that.createdAt,_that.expiresAt,_that.paidAt,_that.completedAt,_that.refundAmount,_that.refundReason,_that.refundRequestedAt,_that.refundRequestedBy,_that.refundRequestReason,_that.planId,_that.providerInstanceId);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiPaymentOrder implements Sub2ApiPaymentOrder {
  const _Sub2ApiPaymentOrder({required this.id, required this.userId, required this.amount, required this.payAmount, required this.feeRate, required this.currency, required this.paymentType, required this.outTradeNo, required this.status, required this.orderType, required this.createdAt, required this.expiresAt, this.paidAt, this.completedAt, required this.refundAmount, this.refundReason, this.refundRequestedAt, this.refundRequestedBy, this.refundRequestReason, this.planId, this.providerInstanceId});
  

@override final  int id;
@override final  int userId;
@override final  Sub2ApiDecimal amount;
@override final  Sub2ApiDecimal payAmount;
@override final  Sub2ApiDecimal feeRate;
@override final  String currency;
@override final  String paymentType;
@override final  String outTradeNo;
@override final  String status;
@override final  String orderType;
@override final  DateTime createdAt;
@override final  DateTime expiresAt;
@override final  DateTime? paidAt;
@override final  DateTime? completedAt;
@override final  Sub2ApiDecimal refundAmount;
@override final  String? refundReason;
@override final  DateTime? refundRequestedAt;
@override final  String? refundRequestedBy;
@override final  String? refundRequestReason;
@override final  int? planId;
@override final  String? providerInstanceId;

/// Create a copy of Sub2ApiPaymentOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiPaymentOrderCopyWith<_Sub2ApiPaymentOrder> get copyWith => __$Sub2ApiPaymentOrderCopyWithImpl<_Sub2ApiPaymentOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiPaymentOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.payAmount, payAmount) || other.payAmount == payAmount)&&(identical(other.feeRate, feeRate) || other.feeRate == feeRate)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.outTradeNo, outTradeNo) || other.outTradeNo == outTradeNo)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderType, orderType) || other.orderType == orderType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount)&&(identical(other.refundReason, refundReason) || other.refundReason == refundReason)&&(identical(other.refundRequestedAt, refundRequestedAt) || other.refundRequestedAt == refundRequestedAt)&&(identical(other.refundRequestedBy, refundRequestedBy) || other.refundRequestedBy == refundRequestedBy)&&(identical(other.refundRequestReason, refundRequestReason) || other.refundRequestReason == refundRequestReason)&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.providerInstanceId, providerInstanceId) || other.providerInstanceId == providerInstanceId));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,userId,amount,payAmount,feeRate,currency,paymentType,outTradeNo,status,orderType,createdAt,expiresAt,paidAt,completedAt,refundAmount,refundReason,refundRequestedAt,refundRequestedBy,refundRequestReason,planId,providerInstanceId]);

@override
String toString() {
  return 'Sub2ApiPaymentOrder(id: $id, userId: $userId, amount: $amount, payAmount: $payAmount, feeRate: $feeRate, currency: $currency, paymentType: $paymentType, outTradeNo: $outTradeNo, status: $status, orderType: $orderType, createdAt: $createdAt, expiresAt: $expiresAt, paidAt: $paidAt, completedAt: $completedAt, refundAmount: $refundAmount, refundReason: $refundReason, refundRequestedAt: $refundRequestedAt, refundRequestedBy: $refundRequestedBy, refundRequestReason: $refundRequestReason, planId: $planId, providerInstanceId: $providerInstanceId)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiPaymentOrderCopyWith<$Res> implements $Sub2ApiPaymentOrderCopyWith<$Res> {
  factory _$Sub2ApiPaymentOrderCopyWith(_Sub2ApiPaymentOrder value, $Res Function(_Sub2ApiPaymentOrder) _then) = __$Sub2ApiPaymentOrderCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, Sub2ApiDecimal amount, Sub2ApiDecimal payAmount, Sub2ApiDecimal feeRate, String currency, String paymentType, String outTradeNo, String status, String orderType, DateTime createdAt, DateTime expiresAt, DateTime? paidAt, DateTime? completedAt, Sub2ApiDecimal refundAmount, String? refundReason, DateTime? refundRequestedAt, String? refundRequestedBy, String? refundRequestReason, int? planId, String? providerInstanceId
});




}
/// @nodoc
class __$Sub2ApiPaymentOrderCopyWithImpl<$Res>
    implements _$Sub2ApiPaymentOrderCopyWith<$Res> {
  __$Sub2ApiPaymentOrderCopyWithImpl(this._self, this._then);

  final _Sub2ApiPaymentOrder _self;
  final $Res Function(_Sub2ApiPaymentOrder) _then;

/// Create a copy of Sub2ApiPaymentOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? amount = null,Object? payAmount = null,Object? feeRate = null,Object? currency = null,Object? paymentType = null,Object? outTradeNo = null,Object? status = null,Object? orderType = null,Object? createdAt = null,Object? expiresAt = null,Object? paidAt = freezed,Object? completedAt = freezed,Object? refundAmount = null,Object? refundReason = freezed,Object? refundRequestedAt = freezed,Object? refundRequestedBy = freezed,Object? refundRequestReason = freezed,Object? planId = freezed,Object? providerInstanceId = freezed,}) {
  return _then(_Sub2ApiPaymentOrder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,payAmount: null == payAmount ? _self.payAmount : payAmount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,feeRate: null == feeRate ? _self.feeRate : feeRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,outTradeNo: null == outTradeNo ? _self.outTradeNo : outTradeNo // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,orderType: null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,refundAmount: null == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,refundReason: freezed == refundReason ? _self.refundReason : refundReason // ignore: cast_nullable_to_non_nullable
as String?,refundRequestedAt: freezed == refundRequestedAt ? _self.refundRequestedAt : refundRequestedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,refundRequestedBy: freezed == refundRequestedBy ? _self.refundRequestedBy : refundRequestedBy // ignore: cast_nullable_to_non_nullable
as String?,refundRequestReason: freezed == refundRequestReason ? _self.refundRequestReason : refundRequestReason // ignore: cast_nullable_to_non_nullable
as String?,planId: freezed == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int?,providerInstanceId: freezed == providerInstanceId ? _self.providerInstanceId : providerInstanceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiPaymentOrderQuery {

 int get page; int get pageSize; String? get status; String? get orderType; String? get paymentType;
/// Create a copy of Sub2ApiPaymentOrderQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiPaymentOrderQueryCopyWith<Sub2ApiPaymentOrderQuery> get copyWith => _$Sub2ApiPaymentOrderQueryCopyWithImpl<Sub2ApiPaymentOrderQuery>(this as Sub2ApiPaymentOrderQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiPaymentOrderQuery&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderType, orderType) || other.orderType == orderType)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType));
}


@override
int get hashCode => Object.hash(runtimeType,page,pageSize,status,orderType,paymentType);

@override
String toString() {
  return 'Sub2ApiPaymentOrderQuery(page: $page, pageSize: $pageSize, status: $status, orderType: $orderType, paymentType: $paymentType)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiPaymentOrderQueryCopyWith<$Res>  {
  factory $Sub2ApiPaymentOrderQueryCopyWith(Sub2ApiPaymentOrderQuery value, $Res Function(Sub2ApiPaymentOrderQuery) _then) = _$Sub2ApiPaymentOrderQueryCopyWithImpl;
@useResult
$Res call({
 int page, int pageSize, String? status, String? orderType, String? paymentType
});




}
/// @nodoc
class _$Sub2ApiPaymentOrderQueryCopyWithImpl<$Res>
    implements $Sub2ApiPaymentOrderQueryCopyWith<$Res> {
  _$Sub2ApiPaymentOrderQueryCopyWithImpl(this._self, this._then);

  final Sub2ApiPaymentOrderQuery _self;
  final $Res Function(Sub2ApiPaymentOrderQuery) _then;

/// Create a copy of Sub2ApiPaymentOrderQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? pageSize = null,Object? status = freezed,Object? orderType = freezed,Object? paymentType = freezed,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,orderType: freezed == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as String?,paymentType: freezed == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiPaymentOrderQuery].
extension Sub2ApiPaymentOrderQueryPatterns on Sub2ApiPaymentOrderQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiPaymentOrderQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentOrderQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiPaymentOrderQuery value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentOrderQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiPaymentOrderQuery value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiPaymentOrderQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int pageSize,  String? status,  String? orderType,  String? paymentType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentOrderQuery() when $default != null:
return $default(_that.page,_that.pageSize,_that.status,_that.orderType,_that.paymentType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int pageSize,  String? status,  String? orderType,  String? paymentType)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentOrderQuery():
return $default(_that.page,_that.pageSize,_that.status,_that.orderType,_that.paymentType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int pageSize,  String? status,  String? orderType,  String? paymentType)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiPaymentOrderQuery() when $default != null:
return $default(_that.page,_that.pageSize,_that.status,_that.orderType,_that.paymentType);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiPaymentOrderQuery implements Sub2ApiPaymentOrderQuery {
  const _Sub2ApiPaymentOrderQuery({this.page = 1, this.pageSize = 20, this.status, this.orderType, this.paymentType});
  

@override@JsonKey() final  int page;
@override@JsonKey() final  int pageSize;
@override final  String? status;
@override final  String? orderType;
@override final  String? paymentType;

/// Create a copy of Sub2ApiPaymentOrderQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiPaymentOrderQueryCopyWith<_Sub2ApiPaymentOrderQuery> get copyWith => __$Sub2ApiPaymentOrderQueryCopyWithImpl<_Sub2ApiPaymentOrderQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiPaymentOrderQuery&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderType, orderType) || other.orderType == orderType)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType));
}


@override
int get hashCode => Object.hash(runtimeType,page,pageSize,status,orderType,paymentType);

@override
String toString() {
  return 'Sub2ApiPaymentOrderQuery(page: $page, pageSize: $pageSize, status: $status, orderType: $orderType, paymentType: $paymentType)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiPaymentOrderQueryCopyWith<$Res> implements $Sub2ApiPaymentOrderQueryCopyWith<$Res> {
  factory _$Sub2ApiPaymentOrderQueryCopyWith(_Sub2ApiPaymentOrderQuery value, $Res Function(_Sub2ApiPaymentOrderQuery) _then) = __$Sub2ApiPaymentOrderQueryCopyWithImpl;
@override @useResult
$Res call({
 int page, int pageSize, String? status, String? orderType, String? paymentType
});




}
/// @nodoc
class __$Sub2ApiPaymentOrderQueryCopyWithImpl<$Res>
    implements _$Sub2ApiPaymentOrderQueryCopyWith<$Res> {
  __$Sub2ApiPaymentOrderQueryCopyWithImpl(this._self, this._then);

  final _Sub2ApiPaymentOrderQuery _self;
  final $Res Function(_Sub2ApiPaymentOrderQuery) _then;

/// Create a copy of Sub2ApiPaymentOrderQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? pageSize = null,Object? status = freezed,Object? orderType = freezed,Object? paymentType = freezed,}) {
  return _then(_Sub2ApiPaymentOrderQuery(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,orderType: freezed == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as String?,paymentType: freezed == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiCreateBalanceOrderRequest {

 Sub2ApiDecimal get amount; String get paymentType; String? get openId; Sub2ApiCheckoutSecret? get wechatResumeToken; String? get returnUrl; String? get paymentSource; bool? get isMobile;
/// Create a copy of Sub2ApiCreateBalanceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiCreateBalanceOrderRequestCopyWith<Sub2ApiCreateBalanceOrderRequest> get copyWith => _$Sub2ApiCreateBalanceOrderRequestCopyWithImpl<Sub2ApiCreateBalanceOrderRequest>(this as Sub2ApiCreateBalanceOrderRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiCreateBalanceOrderRequest&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.openId, openId) || other.openId == openId)&&(identical(other.wechatResumeToken, wechatResumeToken) || other.wechatResumeToken == wechatResumeToken)&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl)&&(identical(other.paymentSource, paymentSource) || other.paymentSource == paymentSource)&&(identical(other.isMobile, isMobile) || other.isMobile == isMobile));
}


@override
int get hashCode => Object.hash(runtimeType,amount,paymentType,openId,wechatResumeToken,returnUrl,paymentSource,isMobile);

@override
String toString() {
  return 'Sub2ApiCreateBalanceOrderRequest(amount: $amount, paymentType: $paymentType, openId: $openId, wechatResumeToken: $wechatResumeToken, returnUrl: $returnUrl, paymentSource: $paymentSource, isMobile: $isMobile)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiCreateBalanceOrderRequestCopyWith<$Res>  {
  factory $Sub2ApiCreateBalanceOrderRequestCopyWith(Sub2ApiCreateBalanceOrderRequest value, $Res Function(Sub2ApiCreateBalanceOrderRequest) _then) = _$Sub2ApiCreateBalanceOrderRequestCopyWithImpl;
@useResult
$Res call({
 Sub2ApiDecimal amount, String paymentType, String? openId, Sub2ApiCheckoutSecret? wechatResumeToken, String? returnUrl, String? paymentSource, bool? isMobile
});




}
/// @nodoc
class _$Sub2ApiCreateBalanceOrderRequestCopyWithImpl<$Res>
    implements $Sub2ApiCreateBalanceOrderRequestCopyWith<$Res> {
  _$Sub2ApiCreateBalanceOrderRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiCreateBalanceOrderRequest _self;
  final $Res Function(Sub2ApiCreateBalanceOrderRequest) _then;

/// Create a copy of Sub2ApiCreateBalanceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? paymentType = null,Object? openId = freezed,Object? wechatResumeToken = freezed,Object? returnUrl = freezed,Object? paymentSource = freezed,Object? isMobile = freezed,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,openId: freezed == openId ? _self.openId : openId // ignore: cast_nullable_to_non_nullable
as String?,wechatResumeToken: freezed == wechatResumeToken ? _self.wechatResumeToken : wechatResumeToken // ignore: cast_nullable_to_non_nullable
as Sub2ApiCheckoutSecret?,returnUrl: freezed == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String?,paymentSource: freezed == paymentSource ? _self.paymentSource : paymentSource // ignore: cast_nullable_to_non_nullable
as String?,isMobile: freezed == isMobile ? _self.isMobile : isMobile // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiCreateBalanceOrderRequest].
extension Sub2ApiCreateBalanceOrderRequestPatterns on Sub2ApiCreateBalanceOrderRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiCreateBalanceOrderRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiCreateBalanceOrderRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiCreateBalanceOrderRequest value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiCreateBalanceOrderRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiCreateBalanceOrderRequest value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiCreateBalanceOrderRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sub2ApiDecimal amount,  String paymentType,  String? openId,  Sub2ApiCheckoutSecret? wechatResumeToken,  String? returnUrl,  String? paymentSource,  bool? isMobile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiCreateBalanceOrderRequest() when $default != null:
return $default(_that.amount,_that.paymentType,_that.openId,_that.wechatResumeToken,_that.returnUrl,_that.paymentSource,_that.isMobile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sub2ApiDecimal amount,  String paymentType,  String? openId,  Sub2ApiCheckoutSecret? wechatResumeToken,  String? returnUrl,  String? paymentSource,  bool? isMobile)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiCreateBalanceOrderRequest():
return $default(_that.amount,_that.paymentType,_that.openId,_that.wechatResumeToken,_that.returnUrl,_that.paymentSource,_that.isMobile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sub2ApiDecimal amount,  String paymentType,  String? openId,  Sub2ApiCheckoutSecret? wechatResumeToken,  String? returnUrl,  String? paymentSource,  bool? isMobile)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiCreateBalanceOrderRequest() when $default != null:
return $default(_that.amount,_that.paymentType,_that.openId,_that.wechatResumeToken,_that.returnUrl,_that.paymentSource,_that.isMobile);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiCreateBalanceOrderRequest implements Sub2ApiCreateBalanceOrderRequest {
  const _Sub2ApiCreateBalanceOrderRequest({required this.amount, required this.paymentType, this.openId, this.wechatResumeToken, this.returnUrl, this.paymentSource, this.isMobile});
  

@override final  Sub2ApiDecimal amount;
@override final  String paymentType;
@override final  String? openId;
@override final  Sub2ApiCheckoutSecret? wechatResumeToken;
@override final  String? returnUrl;
@override final  String? paymentSource;
@override final  bool? isMobile;

/// Create a copy of Sub2ApiCreateBalanceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiCreateBalanceOrderRequestCopyWith<_Sub2ApiCreateBalanceOrderRequest> get copyWith => __$Sub2ApiCreateBalanceOrderRequestCopyWithImpl<_Sub2ApiCreateBalanceOrderRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiCreateBalanceOrderRequest&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.openId, openId) || other.openId == openId)&&(identical(other.wechatResumeToken, wechatResumeToken) || other.wechatResumeToken == wechatResumeToken)&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl)&&(identical(other.paymentSource, paymentSource) || other.paymentSource == paymentSource)&&(identical(other.isMobile, isMobile) || other.isMobile == isMobile));
}


@override
int get hashCode => Object.hash(runtimeType,amount,paymentType,openId,wechatResumeToken,returnUrl,paymentSource,isMobile);

@override
String toString() {
  return 'Sub2ApiCreateBalanceOrderRequest(amount: $amount, paymentType: $paymentType, openId: $openId, wechatResumeToken: $wechatResumeToken, returnUrl: $returnUrl, paymentSource: $paymentSource, isMobile: $isMobile)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiCreateBalanceOrderRequestCopyWith<$Res> implements $Sub2ApiCreateBalanceOrderRequestCopyWith<$Res> {
  factory _$Sub2ApiCreateBalanceOrderRequestCopyWith(_Sub2ApiCreateBalanceOrderRequest value, $Res Function(_Sub2ApiCreateBalanceOrderRequest) _then) = __$Sub2ApiCreateBalanceOrderRequestCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiDecimal amount, String paymentType, String? openId, Sub2ApiCheckoutSecret? wechatResumeToken, String? returnUrl, String? paymentSource, bool? isMobile
});




}
/// @nodoc
class __$Sub2ApiCreateBalanceOrderRequestCopyWithImpl<$Res>
    implements _$Sub2ApiCreateBalanceOrderRequestCopyWith<$Res> {
  __$Sub2ApiCreateBalanceOrderRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiCreateBalanceOrderRequest _self;
  final $Res Function(_Sub2ApiCreateBalanceOrderRequest) _then;

/// Create a copy of Sub2ApiCreateBalanceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? paymentType = null,Object? openId = freezed,Object? wechatResumeToken = freezed,Object? returnUrl = freezed,Object? paymentSource = freezed,Object? isMobile = freezed,}) {
  return _then(_Sub2ApiCreateBalanceOrderRequest(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,openId: freezed == openId ? _self.openId : openId // ignore: cast_nullable_to_non_nullable
as String?,wechatResumeToken: freezed == wechatResumeToken ? _self.wechatResumeToken : wechatResumeToken // ignore: cast_nullable_to_non_nullable
as Sub2ApiCheckoutSecret?,returnUrl: freezed == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String?,paymentSource: freezed == paymentSource ? _self.paymentSource : paymentSource // ignore: cast_nullable_to_non_nullable
as String?,isMobile: freezed == isMobile ? _self.isMobile : isMobile // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiCreateSubscriptionOrderRequest {

 int get planId; String get paymentType; String? get openId; Sub2ApiCheckoutSecret? get wechatResumeToken; String? get returnUrl; String? get paymentSource; bool? get isMobile;
/// Create a copy of Sub2ApiCreateSubscriptionOrderRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiCreateSubscriptionOrderRequestCopyWith<Sub2ApiCreateSubscriptionOrderRequest> get copyWith => _$Sub2ApiCreateSubscriptionOrderRequestCopyWithImpl<Sub2ApiCreateSubscriptionOrderRequest>(this as Sub2ApiCreateSubscriptionOrderRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiCreateSubscriptionOrderRequest&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.openId, openId) || other.openId == openId)&&(identical(other.wechatResumeToken, wechatResumeToken) || other.wechatResumeToken == wechatResumeToken)&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl)&&(identical(other.paymentSource, paymentSource) || other.paymentSource == paymentSource)&&(identical(other.isMobile, isMobile) || other.isMobile == isMobile));
}


@override
int get hashCode => Object.hash(runtimeType,planId,paymentType,openId,wechatResumeToken,returnUrl,paymentSource,isMobile);

@override
String toString() {
  return 'Sub2ApiCreateSubscriptionOrderRequest(planId: $planId, paymentType: $paymentType, openId: $openId, wechatResumeToken: $wechatResumeToken, returnUrl: $returnUrl, paymentSource: $paymentSource, isMobile: $isMobile)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiCreateSubscriptionOrderRequestCopyWith<$Res>  {
  factory $Sub2ApiCreateSubscriptionOrderRequestCopyWith(Sub2ApiCreateSubscriptionOrderRequest value, $Res Function(Sub2ApiCreateSubscriptionOrderRequest) _then) = _$Sub2ApiCreateSubscriptionOrderRequestCopyWithImpl;
@useResult
$Res call({
 int planId, String paymentType, String? openId, Sub2ApiCheckoutSecret? wechatResumeToken, String? returnUrl, String? paymentSource, bool? isMobile
});




}
/// @nodoc
class _$Sub2ApiCreateSubscriptionOrderRequestCopyWithImpl<$Res>
    implements $Sub2ApiCreateSubscriptionOrderRequestCopyWith<$Res> {
  _$Sub2ApiCreateSubscriptionOrderRequestCopyWithImpl(this._self, this._then);

  final Sub2ApiCreateSubscriptionOrderRequest _self;
  final $Res Function(Sub2ApiCreateSubscriptionOrderRequest) _then;

/// Create a copy of Sub2ApiCreateSubscriptionOrderRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? planId = null,Object? paymentType = null,Object? openId = freezed,Object? wechatResumeToken = freezed,Object? returnUrl = freezed,Object? paymentSource = freezed,Object? isMobile = freezed,}) {
  return _then(_self.copyWith(
planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,openId: freezed == openId ? _self.openId : openId // ignore: cast_nullable_to_non_nullable
as String?,wechatResumeToken: freezed == wechatResumeToken ? _self.wechatResumeToken : wechatResumeToken // ignore: cast_nullable_to_non_nullable
as Sub2ApiCheckoutSecret?,returnUrl: freezed == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String?,paymentSource: freezed == paymentSource ? _self.paymentSource : paymentSource // ignore: cast_nullable_to_non_nullable
as String?,isMobile: freezed == isMobile ? _self.isMobile : isMobile // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiCreateSubscriptionOrderRequest].
extension Sub2ApiCreateSubscriptionOrderRequestPatterns on Sub2ApiCreateSubscriptionOrderRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiCreateSubscriptionOrderRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiCreateSubscriptionOrderRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiCreateSubscriptionOrderRequest value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiCreateSubscriptionOrderRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiCreateSubscriptionOrderRequest value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiCreateSubscriptionOrderRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int planId,  String paymentType,  String? openId,  Sub2ApiCheckoutSecret? wechatResumeToken,  String? returnUrl,  String? paymentSource,  bool? isMobile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiCreateSubscriptionOrderRequest() when $default != null:
return $default(_that.planId,_that.paymentType,_that.openId,_that.wechatResumeToken,_that.returnUrl,_that.paymentSource,_that.isMobile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int planId,  String paymentType,  String? openId,  Sub2ApiCheckoutSecret? wechatResumeToken,  String? returnUrl,  String? paymentSource,  bool? isMobile)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiCreateSubscriptionOrderRequest():
return $default(_that.planId,_that.paymentType,_that.openId,_that.wechatResumeToken,_that.returnUrl,_that.paymentSource,_that.isMobile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int planId,  String paymentType,  String? openId,  Sub2ApiCheckoutSecret? wechatResumeToken,  String? returnUrl,  String? paymentSource,  bool? isMobile)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiCreateSubscriptionOrderRequest() when $default != null:
return $default(_that.planId,_that.paymentType,_that.openId,_that.wechatResumeToken,_that.returnUrl,_that.paymentSource,_that.isMobile);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiCreateSubscriptionOrderRequest implements Sub2ApiCreateSubscriptionOrderRequest {
  const _Sub2ApiCreateSubscriptionOrderRequest({required this.planId, required this.paymentType, this.openId, this.wechatResumeToken, this.returnUrl, this.paymentSource, this.isMobile});
  

@override final  int planId;
@override final  String paymentType;
@override final  String? openId;
@override final  Sub2ApiCheckoutSecret? wechatResumeToken;
@override final  String? returnUrl;
@override final  String? paymentSource;
@override final  bool? isMobile;

/// Create a copy of Sub2ApiCreateSubscriptionOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiCreateSubscriptionOrderRequestCopyWith<_Sub2ApiCreateSubscriptionOrderRequest> get copyWith => __$Sub2ApiCreateSubscriptionOrderRequestCopyWithImpl<_Sub2ApiCreateSubscriptionOrderRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiCreateSubscriptionOrderRequest&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.openId, openId) || other.openId == openId)&&(identical(other.wechatResumeToken, wechatResumeToken) || other.wechatResumeToken == wechatResumeToken)&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl)&&(identical(other.paymentSource, paymentSource) || other.paymentSource == paymentSource)&&(identical(other.isMobile, isMobile) || other.isMobile == isMobile));
}


@override
int get hashCode => Object.hash(runtimeType,planId,paymentType,openId,wechatResumeToken,returnUrl,paymentSource,isMobile);

@override
String toString() {
  return 'Sub2ApiCreateSubscriptionOrderRequest(planId: $planId, paymentType: $paymentType, openId: $openId, wechatResumeToken: $wechatResumeToken, returnUrl: $returnUrl, paymentSource: $paymentSource, isMobile: $isMobile)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiCreateSubscriptionOrderRequestCopyWith<$Res> implements $Sub2ApiCreateSubscriptionOrderRequestCopyWith<$Res> {
  factory _$Sub2ApiCreateSubscriptionOrderRequestCopyWith(_Sub2ApiCreateSubscriptionOrderRequest value, $Res Function(_Sub2ApiCreateSubscriptionOrderRequest) _then) = __$Sub2ApiCreateSubscriptionOrderRequestCopyWithImpl;
@override @useResult
$Res call({
 int planId, String paymentType, String? openId, Sub2ApiCheckoutSecret? wechatResumeToken, String? returnUrl, String? paymentSource, bool? isMobile
});




}
/// @nodoc
class __$Sub2ApiCreateSubscriptionOrderRequestCopyWithImpl<$Res>
    implements _$Sub2ApiCreateSubscriptionOrderRequestCopyWith<$Res> {
  __$Sub2ApiCreateSubscriptionOrderRequestCopyWithImpl(this._self, this._then);

  final _Sub2ApiCreateSubscriptionOrderRequest _self;
  final $Res Function(_Sub2ApiCreateSubscriptionOrderRequest) _then;

/// Create a copy of Sub2ApiCreateSubscriptionOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planId = null,Object? paymentType = null,Object? openId = freezed,Object? wechatResumeToken = freezed,Object? returnUrl = freezed,Object? paymentSource = freezed,Object? isMobile = freezed,}) {
  return _then(_Sub2ApiCreateSubscriptionOrderRequest(
planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,openId: freezed == openId ? _self.openId : openId // ignore: cast_nullable_to_non_nullable
as String?,wechatResumeToken: freezed == wechatResumeToken ? _self.wechatResumeToken : wechatResumeToken // ignore: cast_nullable_to_non_nullable
as Sub2ApiCheckoutSecret?,returnUrl: freezed == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String?,paymentSource: freezed == paymentSource ? _self.paymentSource : paymentSource // ignore: cast_nullable_to_non_nullable
as String?,isMobile: freezed == isMobile ? _self.isMobile : isMobile // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiWechatOAuthInstructions {

 String get authorizeUrl; String get appId; String get scope; String get redirectUrl;
/// Create a copy of Sub2ApiWechatOAuthInstructions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiWechatOAuthInstructionsCopyWith<Sub2ApiWechatOAuthInstructions> get copyWith => _$Sub2ApiWechatOAuthInstructionsCopyWithImpl<Sub2ApiWechatOAuthInstructions>(this as Sub2ApiWechatOAuthInstructions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiWechatOAuthInstructions&&(identical(other.authorizeUrl, authorizeUrl) || other.authorizeUrl == authorizeUrl)&&(identical(other.appId, appId) || other.appId == appId)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.redirectUrl, redirectUrl) || other.redirectUrl == redirectUrl));
}


@override
int get hashCode => Object.hash(runtimeType,authorizeUrl,appId,scope,redirectUrl);

@override
String toString() {
  return 'Sub2ApiWechatOAuthInstructions(authorizeUrl: $authorizeUrl, appId: $appId, scope: $scope, redirectUrl: $redirectUrl)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiWechatOAuthInstructionsCopyWith<$Res>  {
  factory $Sub2ApiWechatOAuthInstructionsCopyWith(Sub2ApiWechatOAuthInstructions value, $Res Function(Sub2ApiWechatOAuthInstructions) _then) = _$Sub2ApiWechatOAuthInstructionsCopyWithImpl;
@useResult
$Res call({
 String authorizeUrl, String appId, String scope, String redirectUrl
});




}
/// @nodoc
class _$Sub2ApiWechatOAuthInstructionsCopyWithImpl<$Res>
    implements $Sub2ApiWechatOAuthInstructionsCopyWith<$Res> {
  _$Sub2ApiWechatOAuthInstructionsCopyWithImpl(this._self, this._then);

  final Sub2ApiWechatOAuthInstructions _self;
  final $Res Function(Sub2ApiWechatOAuthInstructions) _then;

/// Create a copy of Sub2ApiWechatOAuthInstructions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authorizeUrl = null,Object? appId = null,Object? scope = null,Object? redirectUrl = null,}) {
  return _then(_self.copyWith(
authorizeUrl: null == authorizeUrl ? _self.authorizeUrl : authorizeUrl // ignore: cast_nullable_to_non_nullable
as String,appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,redirectUrl: null == redirectUrl ? _self.redirectUrl : redirectUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiWechatOAuthInstructions].
extension Sub2ApiWechatOAuthInstructionsPatterns on Sub2ApiWechatOAuthInstructions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiWechatOAuthInstructions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiWechatOAuthInstructions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiWechatOAuthInstructions value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWechatOAuthInstructions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiWechatOAuthInstructions value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWechatOAuthInstructions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String authorizeUrl,  String appId,  String scope,  String redirectUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiWechatOAuthInstructions() when $default != null:
return $default(_that.authorizeUrl,_that.appId,_that.scope,_that.redirectUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String authorizeUrl,  String appId,  String scope,  String redirectUrl)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWechatOAuthInstructions():
return $default(_that.authorizeUrl,_that.appId,_that.scope,_that.redirectUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String authorizeUrl,  String appId,  String scope,  String redirectUrl)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWechatOAuthInstructions() when $default != null:
return $default(_that.authorizeUrl,_that.appId,_that.scope,_that.redirectUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiWechatOAuthInstructions implements Sub2ApiWechatOAuthInstructions {
  const _Sub2ApiWechatOAuthInstructions({required this.authorizeUrl, required this.appId, required this.scope, required this.redirectUrl});
  

@override final  String authorizeUrl;
@override final  String appId;
@override final  String scope;
@override final  String redirectUrl;

/// Create a copy of Sub2ApiWechatOAuthInstructions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiWechatOAuthInstructionsCopyWith<_Sub2ApiWechatOAuthInstructions> get copyWith => __$Sub2ApiWechatOAuthInstructionsCopyWithImpl<_Sub2ApiWechatOAuthInstructions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiWechatOAuthInstructions&&(identical(other.authorizeUrl, authorizeUrl) || other.authorizeUrl == authorizeUrl)&&(identical(other.appId, appId) || other.appId == appId)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.redirectUrl, redirectUrl) || other.redirectUrl == redirectUrl));
}


@override
int get hashCode => Object.hash(runtimeType,authorizeUrl,appId,scope,redirectUrl);

@override
String toString() {
  return 'Sub2ApiWechatOAuthInstructions(authorizeUrl: $authorizeUrl, appId: $appId, scope: $scope, redirectUrl: $redirectUrl)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiWechatOAuthInstructionsCopyWith<$Res> implements $Sub2ApiWechatOAuthInstructionsCopyWith<$Res> {
  factory _$Sub2ApiWechatOAuthInstructionsCopyWith(_Sub2ApiWechatOAuthInstructions value, $Res Function(_Sub2ApiWechatOAuthInstructions) _then) = __$Sub2ApiWechatOAuthInstructionsCopyWithImpl;
@override @useResult
$Res call({
 String authorizeUrl, String appId, String scope, String redirectUrl
});




}
/// @nodoc
class __$Sub2ApiWechatOAuthInstructionsCopyWithImpl<$Res>
    implements _$Sub2ApiWechatOAuthInstructionsCopyWith<$Res> {
  __$Sub2ApiWechatOAuthInstructionsCopyWithImpl(this._self, this._then);

  final _Sub2ApiWechatOAuthInstructions _self;
  final $Res Function(_Sub2ApiWechatOAuthInstructions) _then;

/// Create a copy of Sub2ApiWechatOAuthInstructions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authorizeUrl = null,Object? appId = null,Object? scope = null,Object? redirectUrl = null,}) {
  return _then(_Sub2ApiWechatOAuthInstructions(
authorizeUrl: null == authorizeUrl ? _self.authorizeUrl : authorizeUrl // ignore: cast_nullable_to_non_nullable
as String,appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,redirectUrl: null == redirectUrl ? _self.redirectUrl : redirectUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiWechatJsApiInstructions {

 String get appId; String get timeStamp; String get nonceStr; Sub2ApiCheckoutSecret get packageValue; String get signType; Sub2ApiCheckoutSecret get paySign;
/// Create a copy of Sub2ApiWechatJsApiInstructions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiWechatJsApiInstructionsCopyWith<Sub2ApiWechatJsApiInstructions> get copyWith => _$Sub2ApiWechatJsApiInstructionsCopyWithImpl<Sub2ApiWechatJsApiInstructions>(this as Sub2ApiWechatJsApiInstructions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiWechatJsApiInstructions&&(identical(other.appId, appId) || other.appId == appId)&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp)&&(identical(other.nonceStr, nonceStr) || other.nonceStr == nonceStr)&&(identical(other.packageValue, packageValue) || other.packageValue == packageValue)&&(identical(other.signType, signType) || other.signType == signType)&&(identical(other.paySign, paySign) || other.paySign == paySign));
}


@override
int get hashCode => Object.hash(runtimeType,appId,timeStamp,nonceStr,packageValue,signType,paySign);

@override
String toString() {
  return 'Sub2ApiWechatJsApiInstructions(appId: $appId, timeStamp: $timeStamp, nonceStr: $nonceStr, packageValue: $packageValue, signType: $signType, paySign: $paySign)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiWechatJsApiInstructionsCopyWith<$Res>  {
  factory $Sub2ApiWechatJsApiInstructionsCopyWith(Sub2ApiWechatJsApiInstructions value, $Res Function(Sub2ApiWechatJsApiInstructions) _then) = _$Sub2ApiWechatJsApiInstructionsCopyWithImpl;
@useResult
$Res call({
 String appId, String timeStamp, String nonceStr, Sub2ApiCheckoutSecret packageValue, String signType, Sub2ApiCheckoutSecret paySign
});




}
/// @nodoc
class _$Sub2ApiWechatJsApiInstructionsCopyWithImpl<$Res>
    implements $Sub2ApiWechatJsApiInstructionsCopyWith<$Res> {
  _$Sub2ApiWechatJsApiInstructionsCopyWithImpl(this._self, this._then);

  final Sub2ApiWechatJsApiInstructions _self;
  final $Res Function(Sub2ApiWechatJsApiInstructions) _then;

/// Create a copy of Sub2ApiWechatJsApiInstructions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appId = null,Object? timeStamp = null,Object? nonceStr = null,Object? packageValue = null,Object? signType = null,Object? paySign = null,}) {
  return _then(_self.copyWith(
appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as String,timeStamp: null == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as String,nonceStr: null == nonceStr ? _self.nonceStr : nonceStr // ignore: cast_nullable_to_non_nullable
as String,packageValue: null == packageValue ? _self.packageValue : packageValue // ignore: cast_nullable_to_non_nullable
as Sub2ApiCheckoutSecret,signType: null == signType ? _self.signType : signType // ignore: cast_nullable_to_non_nullable
as String,paySign: null == paySign ? _self.paySign : paySign // ignore: cast_nullable_to_non_nullable
as Sub2ApiCheckoutSecret,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiWechatJsApiInstructions].
extension Sub2ApiWechatJsApiInstructionsPatterns on Sub2ApiWechatJsApiInstructions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiWechatJsApiInstructions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiWechatJsApiInstructions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiWechatJsApiInstructions value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWechatJsApiInstructions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiWechatJsApiInstructions value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiWechatJsApiInstructions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String appId,  String timeStamp,  String nonceStr,  Sub2ApiCheckoutSecret packageValue,  String signType,  Sub2ApiCheckoutSecret paySign)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiWechatJsApiInstructions() when $default != null:
return $default(_that.appId,_that.timeStamp,_that.nonceStr,_that.packageValue,_that.signType,_that.paySign);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String appId,  String timeStamp,  String nonceStr,  Sub2ApiCheckoutSecret packageValue,  String signType,  Sub2ApiCheckoutSecret paySign)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWechatJsApiInstructions():
return $default(_that.appId,_that.timeStamp,_that.nonceStr,_that.packageValue,_that.signType,_that.paySign);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String appId,  String timeStamp,  String nonceStr,  Sub2ApiCheckoutSecret packageValue,  String signType,  Sub2ApiCheckoutSecret paySign)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiWechatJsApiInstructions() when $default != null:
return $default(_that.appId,_that.timeStamp,_that.nonceStr,_that.packageValue,_that.signType,_that.paySign);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiWechatJsApiInstructions implements Sub2ApiWechatJsApiInstructions {
  const _Sub2ApiWechatJsApiInstructions({required this.appId, required this.timeStamp, required this.nonceStr, required this.packageValue, required this.signType, required this.paySign});
  

@override final  String appId;
@override final  String timeStamp;
@override final  String nonceStr;
@override final  Sub2ApiCheckoutSecret packageValue;
@override final  String signType;
@override final  Sub2ApiCheckoutSecret paySign;

/// Create a copy of Sub2ApiWechatJsApiInstructions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiWechatJsApiInstructionsCopyWith<_Sub2ApiWechatJsApiInstructions> get copyWith => __$Sub2ApiWechatJsApiInstructionsCopyWithImpl<_Sub2ApiWechatJsApiInstructions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiWechatJsApiInstructions&&(identical(other.appId, appId) || other.appId == appId)&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp)&&(identical(other.nonceStr, nonceStr) || other.nonceStr == nonceStr)&&(identical(other.packageValue, packageValue) || other.packageValue == packageValue)&&(identical(other.signType, signType) || other.signType == signType)&&(identical(other.paySign, paySign) || other.paySign == paySign));
}


@override
int get hashCode => Object.hash(runtimeType,appId,timeStamp,nonceStr,packageValue,signType,paySign);

@override
String toString() {
  return 'Sub2ApiWechatJsApiInstructions(appId: $appId, timeStamp: $timeStamp, nonceStr: $nonceStr, packageValue: $packageValue, signType: $signType, paySign: $paySign)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiWechatJsApiInstructionsCopyWith<$Res> implements $Sub2ApiWechatJsApiInstructionsCopyWith<$Res> {
  factory _$Sub2ApiWechatJsApiInstructionsCopyWith(_Sub2ApiWechatJsApiInstructions value, $Res Function(_Sub2ApiWechatJsApiInstructions) _then) = __$Sub2ApiWechatJsApiInstructionsCopyWithImpl;
@override @useResult
$Res call({
 String appId, String timeStamp, String nonceStr, Sub2ApiCheckoutSecret packageValue, String signType, Sub2ApiCheckoutSecret paySign
});




}
/// @nodoc
class __$Sub2ApiWechatJsApiInstructionsCopyWithImpl<$Res>
    implements _$Sub2ApiWechatJsApiInstructionsCopyWith<$Res> {
  __$Sub2ApiWechatJsApiInstructionsCopyWithImpl(this._self, this._then);

  final _Sub2ApiWechatJsApiInstructions _self;
  final $Res Function(_Sub2ApiWechatJsApiInstructions) _then;

/// Create a copy of Sub2ApiWechatJsApiInstructions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appId = null,Object? timeStamp = null,Object? nonceStr = null,Object? packageValue = null,Object? signType = null,Object? paySign = null,}) {
  return _then(_Sub2ApiWechatJsApiInstructions(
appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as String,timeStamp: null == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as String,nonceStr: null == nonceStr ? _self.nonceStr : nonceStr // ignore: cast_nullable_to_non_nullable
as String,packageValue: null == packageValue ? _self.packageValue : packageValue // ignore: cast_nullable_to_non_nullable
as Sub2ApiCheckoutSecret,signType: null == signType ? _self.signType : signType // ignore: cast_nullable_to_non_nullable
as String,paySign: null == paySign ? _self.paySign : paySign // ignore: cast_nullable_to_non_nullable
as Sub2ApiCheckoutSecret,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiCreateOrderResult {

 Sub2ApiDecimal get amount; Sub2ApiDecimal get payAmount; Sub2ApiDecimal get feeRate; String get paymentType;
/// Create a copy of Sub2ApiCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiCreateOrderResultCopyWith<Sub2ApiCreateOrderResult> get copyWith => _$Sub2ApiCreateOrderResultCopyWithImpl<Sub2ApiCreateOrderResult>(this as Sub2ApiCreateOrderResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiCreateOrderResult&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.payAmount, payAmount) || other.payAmount == payAmount)&&(identical(other.feeRate, feeRate) || other.feeRate == feeRate)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType));
}


@override
int get hashCode => Object.hash(runtimeType,amount,payAmount,feeRate,paymentType);

@override
String toString() {
  return 'Sub2ApiCreateOrderResult(amount: $amount, payAmount: $payAmount, feeRate: $feeRate, paymentType: $paymentType)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiCreateOrderResultCopyWith<$Res>  {
  factory $Sub2ApiCreateOrderResultCopyWith(Sub2ApiCreateOrderResult value, $Res Function(Sub2ApiCreateOrderResult) _then) = _$Sub2ApiCreateOrderResultCopyWithImpl;
@useResult
$Res call({
 Sub2ApiDecimal amount, Sub2ApiDecimal payAmount, Sub2ApiDecimal feeRate, String paymentType
});




}
/// @nodoc
class _$Sub2ApiCreateOrderResultCopyWithImpl<$Res>
    implements $Sub2ApiCreateOrderResultCopyWith<$Res> {
  _$Sub2ApiCreateOrderResultCopyWithImpl(this._self, this._then);

  final Sub2ApiCreateOrderResult _self;
  final $Res Function(Sub2ApiCreateOrderResult) _then;

/// Create a copy of Sub2ApiCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? payAmount = null,Object? feeRate = null,Object? paymentType = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,payAmount: null == payAmount ? _self.payAmount : payAmount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,feeRate: null == feeRate ? _self.feeRate : feeRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Sub2ApiCreateOrderResult].
extension Sub2ApiCreateOrderResultPatterns on Sub2ApiCreateOrderResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Sub2ApiOrderCreated value)?  orderCreated,TResult Function( Sub2ApiOrderOAuthRequired value)?  oauthRequired,TResult Function( Sub2ApiOrderJsapiReady value)?  jsapiReady,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Sub2ApiOrderCreated() when orderCreated != null:
return orderCreated(_that);case Sub2ApiOrderOAuthRequired() when oauthRequired != null:
return oauthRequired(_that);case Sub2ApiOrderJsapiReady() when jsapiReady != null:
return jsapiReady(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Sub2ApiOrderCreated value)  orderCreated,required TResult Function( Sub2ApiOrderOAuthRequired value)  oauthRequired,required TResult Function( Sub2ApiOrderJsapiReady value)  jsapiReady,}){
final _that = this;
switch (_that) {
case Sub2ApiOrderCreated():
return orderCreated(_that);case Sub2ApiOrderOAuthRequired():
return oauthRequired(_that);case Sub2ApiOrderJsapiReady():
return jsapiReady(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Sub2ApiOrderCreated value)?  orderCreated,TResult? Function( Sub2ApiOrderOAuthRequired value)?  oauthRequired,TResult? Function( Sub2ApiOrderJsapiReady value)?  jsapiReady,}){
final _that = this;
switch (_that) {
case Sub2ApiOrderCreated() when orderCreated != null:
return orderCreated(_that);case Sub2ApiOrderOAuthRequired() when oauthRequired != null:
return oauthRequired(_that);case Sub2ApiOrderJsapiReady() when jsapiReady != null:
return jsapiReady(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int orderId,  Sub2ApiDecimal amount,  Sub2ApiDecimal payAmount,  Sub2ApiDecimal feeRate,  String status,  String paymentType,  String outTradeNo,  String currency,  DateTime expiresAt,  Sub2ApiCheckoutSecret? payUrl,  Sub2ApiCheckoutSecret? qrCode,  Sub2ApiCheckoutSecret? clientSecret,  String? intentId,  String? countryCode,  String? paymentEnvironment,  String? paymentMode,  Sub2ApiCheckoutSecret? resumeToken)?  orderCreated,TResult Function( Sub2ApiDecimal amount,  Sub2ApiDecimal payAmount,  Sub2ApiDecimal feeRate,  String paymentType,  Sub2ApiWechatOAuthInstructions oauth)?  oauthRequired,TResult Function( int orderId,  Sub2ApiDecimal amount,  Sub2ApiDecimal payAmount,  Sub2ApiDecimal feeRate,  String status,  String paymentType,  String outTradeNo,  String currency,  DateTime expiresAt,  Sub2ApiWechatJsApiInstructions jsapi,  Sub2ApiCheckoutSecret? resumeToken)?  jsapiReady,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Sub2ApiOrderCreated() when orderCreated != null:
return orderCreated(_that.orderId,_that.amount,_that.payAmount,_that.feeRate,_that.status,_that.paymentType,_that.outTradeNo,_that.currency,_that.expiresAt,_that.payUrl,_that.qrCode,_that.clientSecret,_that.intentId,_that.countryCode,_that.paymentEnvironment,_that.paymentMode,_that.resumeToken);case Sub2ApiOrderOAuthRequired() when oauthRequired != null:
return oauthRequired(_that.amount,_that.payAmount,_that.feeRate,_that.paymentType,_that.oauth);case Sub2ApiOrderJsapiReady() when jsapiReady != null:
return jsapiReady(_that.orderId,_that.amount,_that.payAmount,_that.feeRate,_that.status,_that.paymentType,_that.outTradeNo,_that.currency,_that.expiresAt,_that.jsapi,_that.resumeToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int orderId,  Sub2ApiDecimal amount,  Sub2ApiDecimal payAmount,  Sub2ApiDecimal feeRate,  String status,  String paymentType,  String outTradeNo,  String currency,  DateTime expiresAt,  Sub2ApiCheckoutSecret? payUrl,  Sub2ApiCheckoutSecret? qrCode,  Sub2ApiCheckoutSecret? clientSecret,  String? intentId,  String? countryCode,  String? paymentEnvironment,  String? paymentMode,  Sub2ApiCheckoutSecret? resumeToken)  orderCreated,required TResult Function( Sub2ApiDecimal amount,  Sub2ApiDecimal payAmount,  Sub2ApiDecimal feeRate,  String paymentType,  Sub2ApiWechatOAuthInstructions oauth)  oauthRequired,required TResult Function( int orderId,  Sub2ApiDecimal amount,  Sub2ApiDecimal payAmount,  Sub2ApiDecimal feeRate,  String status,  String paymentType,  String outTradeNo,  String currency,  DateTime expiresAt,  Sub2ApiWechatJsApiInstructions jsapi,  Sub2ApiCheckoutSecret? resumeToken)  jsapiReady,}) {final _that = this;
switch (_that) {
case Sub2ApiOrderCreated():
return orderCreated(_that.orderId,_that.amount,_that.payAmount,_that.feeRate,_that.status,_that.paymentType,_that.outTradeNo,_that.currency,_that.expiresAt,_that.payUrl,_that.qrCode,_that.clientSecret,_that.intentId,_that.countryCode,_that.paymentEnvironment,_that.paymentMode,_that.resumeToken);case Sub2ApiOrderOAuthRequired():
return oauthRequired(_that.amount,_that.payAmount,_that.feeRate,_that.paymentType,_that.oauth);case Sub2ApiOrderJsapiReady():
return jsapiReady(_that.orderId,_that.amount,_that.payAmount,_that.feeRate,_that.status,_that.paymentType,_that.outTradeNo,_that.currency,_that.expiresAt,_that.jsapi,_that.resumeToken);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int orderId,  Sub2ApiDecimal amount,  Sub2ApiDecimal payAmount,  Sub2ApiDecimal feeRate,  String status,  String paymentType,  String outTradeNo,  String currency,  DateTime expiresAt,  Sub2ApiCheckoutSecret? payUrl,  Sub2ApiCheckoutSecret? qrCode,  Sub2ApiCheckoutSecret? clientSecret,  String? intentId,  String? countryCode,  String? paymentEnvironment,  String? paymentMode,  Sub2ApiCheckoutSecret? resumeToken)?  orderCreated,TResult? Function( Sub2ApiDecimal amount,  Sub2ApiDecimal payAmount,  Sub2ApiDecimal feeRate,  String paymentType,  Sub2ApiWechatOAuthInstructions oauth)?  oauthRequired,TResult? Function( int orderId,  Sub2ApiDecimal amount,  Sub2ApiDecimal payAmount,  Sub2ApiDecimal feeRate,  String status,  String paymentType,  String outTradeNo,  String currency,  DateTime expiresAt,  Sub2ApiWechatJsApiInstructions jsapi,  Sub2ApiCheckoutSecret? resumeToken)?  jsapiReady,}) {final _that = this;
switch (_that) {
case Sub2ApiOrderCreated() when orderCreated != null:
return orderCreated(_that.orderId,_that.amount,_that.payAmount,_that.feeRate,_that.status,_that.paymentType,_that.outTradeNo,_that.currency,_that.expiresAt,_that.payUrl,_that.qrCode,_that.clientSecret,_that.intentId,_that.countryCode,_that.paymentEnvironment,_that.paymentMode,_that.resumeToken);case Sub2ApiOrderOAuthRequired() when oauthRequired != null:
return oauthRequired(_that.amount,_that.payAmount,_that.feeRate,_that.paymentType,_that.oauth);case Sub2ApiOrderJsapiReady() when jsapiReady != null:
return jsapiReady(_that.orderId,_that.amount,_that.payAmount,_that.feeRate,_that.status,_that.paymentType,_that.outTradeNo,_that.currency,_that.expiresAt,_that.jsapi,_that.resumeToken);case _:
  return null;

}
}

}

/// @nodoc


class Sub2ApiOrderCreated implements Sub2ApiCreateOrderResult {
  const Sub2ApiOrderCreated({required this.orderId, required this.amount, required this.payAmount, required this.feeRate, required this.status, required this.paymentType, required this.outTradeNo, required this.currency, required this.expiresAt, this.payUrl, this.qrCode, this.clientSecret, this.intentId, this.countryCode, this.paymentEnvironment, this.paymentMode, this.resumeToken});
  

 final  int orderId;
@override final  Sub2ApiDecimal amount;
@override final  Sub2ApiDecimal payAmount;
@override final  Sub2ApiDecimal feeRate;
 final  String status;
@override final  String paymentType;
 final  String outTradeNo;
 final  String currency;
 final  DateTime expiresAt;
 final  Sub2ApiCheckoutSecret? payUrl;
 final  Sub2ApiCheckoutSecret? qrCode;
 final  Sub2ApiCheckoutSecret? clientSecret;
 final  String? intentId;
 final  String? countryCode;
 final  String? paymentEnvironment;
 final  String? paymentMode;
 final  Sub2ApiCheckoutSecret? resumeToken;

/// Create a copy of Sub2ApiCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiOrderCreatedCopyWith<Sub2ApiOrderCreated> get copyWith => _$Sub2ApiOrderCreatedCopyWithImpl<Sub2ApiOrderCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiOrderCreated&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.payAmount, payAmount) || other.payAmount == payAmount)&&(identical(other.feeRate, feeRate) || other.feeRate == feeRate)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.outTradeNo, outTradeNo) || other.outTradeNo == outTradeNo)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.payUrl, payUrl) || other.payUrl == payUrl)&&(identical(other.qrCode, qrCode) || other.qrCode == qrCode)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret)&&(identical(other.intentId, intentId) || other.intentId == intentId)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.paymentEnvironment, paymentEnvironment) || other.paymentEnvironment == paymentEnvironment)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode)&&(identical(other.resumeToken, resumeToken) || other.resumeToken == resumeToken));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,amount,payAmount,feeRate,status,paymentType,outTradeNo,currency,expiresAt,payUrl,qrCode,clientSecret,intentId,countryCode,paymentEnvironment,paymentMode,resumeToken);

@override
String toString() {
  return 'Sub2ApiCreateOrderResult.orderCreated(orderId: $orderId, amount: $amount, payAmount: $payAmount, feeRate: $feeRate, status: $status, paymentType: $paymentType, outTradeNo: $outTradeNo, currency: $currency, expiresAt: $expiresAt, payUrl: $payUrl, qrCode: $qrCode, clientSecret: $clientSecret, intentId: $intentId, countryCode: $countryCode, paymentEnvironment: $paymentEnvironment, paymentMode: $paymentMode, resumeToken: $resumeToken)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiOrderCreatedCopyWith<$Res> implements $Sub2ApiCreateOrderResultCopyWith<$Res> {
  factory $Sub2ApiOrderCreatedCopyWith(Sub2ApiOrderCreated value, $Res Function(Sub2ApiOrderCreated) _then) = _$Sub2ApiOrderCreatedCopyWithImpl;
@override @useResult
$Res call({
 int orderId, Sub2ApiDecimal amount, Sub2ApiDecimal payAmount, Sub2ApiDecimal feeRate, String status, String paymentType, String outTradeNo, String currency, DateTime expiresAt, Sub2ApiCheckoutSecret? payUrl, Sub2ApiCheckoutSecret? qrCode, Sub2ApiCheckoutSecret? clientSecret, String? intentId, String? countryCode, String? paymentEnvironment, String? paymentMode, Sub2ApiCheckoutSecret? resumeToken
});




}
/// @nodoc
class _$Sub2ApiOrderCreatedCopyWithImpl<$Res>
    implements $Sub2ApiOrderCreatedCopyWith<$Res> {
  _$Sub2ApiOrderCreatedCopyWithImpl(this._self, this._then);

  final Sub2ApiOrderCreated _self;
  final $Res Function(Sub2ApiOrderCreated) _then;

/// Create a copy of Sub2ApiCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? amount = null,Object? payAmount = null,Object? feeRate = null,Object? status = null,Object? paymentType = null,Object? outTradeNo = null,Object? currency = null,Object? expiresAt = null,Object? payUrl = freezed,Object? qrCode = freezed,Object? clientSecret = freezed,Object? intentId = freezed,Object? countryCode = freezed,Object? paymentEnvironment = freezed,Object? paymentMode = freezed,Object? resumeToken = freezed,}) {
  return _then(Sub2ApiOrderCreated(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,payAmount: null == payAmount ? _self.payAmount : payAmount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,feeRate: null == feeRate ? _self.feeRate : feeRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,outTradeNo: null == outTradeNo ? _self.outTradeNo : outTradeNo // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,payUrl: freezed == payUrl ? _self.payUrl : payUrl // ignore: cast_nullable_to_non_nullable
as Sub2ApiCheckoutSecret?,qrCode: freezed == qrCode ? _self.qrCode : qrCode // ignore: cast_nullable_to_non_nullable
as Sub2ApiCheckoutSecret?,clientSecret: freezed == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as Sub2ApiCheckoutSecret?,intentId: freezed == intentId ? _self.intentId : intentId // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,paymentEnvironment: freezed == paymentEnvironment ? _self.paymentEnvironment : paymentEnvironment // ignore: cast_nullable_to_non_nullable
as String?,paymentMode: freezed == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String?,resumeToken: freezed == resumeToken ? _self.resumeToken : resumeToken // ignore: cast_nullable_to_non_nullable
as Sub2ApiCheckoutSecret?,
  ));
}


}

/// @nodoc


class Sub2ApiOrderOAuthRequired implements Sub2ApiCreateOrderResult {
  const Sub2ApiOrderOAuthRequired({required this.amount, required this.payAmount, required this.feeRate, required this.paymentType, required this.oauth});
  

@override final  Sub2ApiDecimal amount;
@override final  Sub2ApiDecimal payAmount;
@override final  Sub2ApiDecimal feeRate;
@override final  String paymentType;
 final  Sub2ApiWechatOAuthInstructions oauth;

/// Create a copy of Sub2ApiCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiOrderOAuthRequiredCopyWith<Sub2ApiOrderOAuthRequired> get copyWith => _$Sub2ApiOrderOAuthRequiredCopyWithImpl<Sub2ApiOrderOAuthRequired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiOrderOAuthRequired&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.payAmount, payAmount) || other.payAmount == payAmount)&&(identical(other.feeRate, feeRate) || other.feeRate == feeRate)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.oauth, oauth) || other.oauth == oauth));
}


@override
int get hashCode => Object.hash(runtimeType,amount,payAmount,feeRate,paymentType,oauth);

@override
String toString() {
  return 'Sub2ApiCreateOrderResult.oauthRequired(amount: $amount, payAmount: $payAmount, feeRate: $feeRate, paymentType: $paymentType, oauth: $oauth)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiOrderOAuthRequiredCopyWith<$Res> implements $Sub2ApiCreateOrderResultCopyWith<$Res> {
  factory $Sub2ApiOrderOAuthRequiredCopyWith(Sub2ApiOrderOAuthRequired value, $Res Function(Sub2ApiOrderOAuthRequired) _then) = _$Sub2ApiOrderOAuthRequiredCopyWithImpl;
@override @useResult
$Res call({
 Sub2ApiDecimal amount, Sub2ApiDecimal payAmount, Sub2ApiDecimal feeRate, String paymentType, Sub2ApiWechatOAuthInstructions oauth
});


$Sub2ApiWechatOAuthInstructionsCopyWith<$Res> get oauth;

}
/// @nodoc
class _$Sub2ApiOrderOAuthRequiredCopyWithImpl<$Res>
    implements $Sub2ApiOrderOAuthRequiredCopyWith<$Res> {
  _$Sub2ApiOrderOAuthRequiredCopyWithImpl(this._self, this._then);

  final Sub2ApiOrderOAuthRequired _self;
  final $Res Function(Sub2ApiOrderOAuthRequired) _then;

/// Create a copy of Sub2ApiCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? payAmount = null,Object? feeRate = null,Object? paymentType = null,Object? oauth = null,}) {
  return _then(Sub2ApiOrderOAuthRequired(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,payAmount: null == payAmount ? _self.payAmount : payAmount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,feeRate: null == feeRate ? _self.feeRate : feeRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,oauth: null == oauth ? _self.oauth : oauth // ignore: cast_nullable_to_non_nullable
as Sub2ApiWechatOAuthInstructions,
  ));
}

/// Create a copy of Sub2ApiCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiWechatOAuthInstructionsCopyWith<$Res> get oauth {
  
  return $Sub2ApiWechatOAuthInstructionsCopyWith<$Res>(_self.oauth, (value) {
    return _then(_self.copyWith(oauth: value));
  });
}
}

/// @nodoc


class Sub2ApiOrderJsapiReady implements Sub2ApiCreateOrderResult {
  const Sub2ApiOrderJsapiReady({required this.orderId, required this.amount, required this.payAmount, required this.feeRate, required this.status, required this.paymentType, required this.outTradeNo, required this.currency, required this.expiresAt, required this.jsapi, this.resumeToken});
  

 final  int orderId;
@override final  Sub2ApiDecimal amount;
@override final  Sub2ApiDecimal payAmount;
@override final  Sub2ApiDecimal feeRate;
 final  String status;
@override final  String paymentType;
 final  String outTradeNo;
 final  String currency;
 final  DateTime expiresAt;
 final  Sub2ApiWechatJsApiInstructions jsapi;
 final  Sub2ApiCheckoutSecret? resumeToken;

/// Create a copy of Sub2ApiCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiOrderJsapiReadyCopyWith<Sub2ApiOrderJsapiReady> get copyWith => _$Sub2ApiOrderJsapiReadyCopyWithImpl<Sub2ApiOrderJsapiReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiOrderJsapiReady&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.payAmount, payAmount) || other.payAmount == payAmount)&&(identical(other.feeRate, feeRate) || other.feeRate == feeRate)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.outTradeNo, outTradeNo) || other.outTradeNo == outTradeNo)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.jsapi, jsapi) || other.jsapi == jsapi)&&(identical(other.resumeToken, resumeToken) || other.resumeToken == resumeToken));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,amount,payAmount,feeRate,status,paymentType,outTradeNo,currency,expiresAt,jsapi,resumeToken);

@override
String toString() {
  return 'Sub2ApiCreateOrderResult.jsapiReady(orderId: $orderId, amount: $amount, payAmount: $payAmount, feeRate: $feeRate, status: $status, paymentType: $paymentType, outTradeNo: $outTradeNo, currency: $currency, expiresAt: $expiresAt, jsapi: $jsapi, resumeToken: $resumeToken)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiOrderJsapiReadyCopyWith<$Res> implements $Sub2ApiCreateOrderResultCopyWith<$Res> {
  factory $Sub2ApiOrderJsapiReadyCopyWith(Sub2ApiOrderJsapiReady value, $Res Function(Sub2ApiOrderJsapiReady) _then) = _$Sub2ApiOrderJsapiReadyCopyWithImpl;
@override @useResult
$Res call({
 int orderId, Sub2ApiDecimal amount, Sub2ApiDecimal payAmount, Sub2ApiDecimal feeRate, String status, String paymentType, String outTradeNo, String currency, DateTime expiresAt, Sub2ApiWechatJsApiInstructions jsapi, Sub2ApiCheckoutSecret? resumeToken
});


$Sub2ApiWechatJsApiInstructionsCopyWith<$Res> get jsapi;

}
/// @nodoc
class _$Sub2ApiOrderJsapiReadyCopyWithImpl<$Res>
    implements $Sub2ApiOrderJsapiReadyCopyWith<$Res> {
  _$Sub2ApiOrderJsapiReadyCopyWithImpl(this._self, this._then);

  final Sub2ApiOrderJsapiReady _self;
  final $Res Function(Sub2ApiOrderJsapiReady) _then;

/// Create a copy of Sub2ApiCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? amount = null,Object? payAmount = null,Object? feeRate = null,Object? status = null,Object? paymentType = null,Object? outTradeNo = null,Object? currency = null,Object? expiresAt = null,Object? jsapi = null,Object? resumeToken = freezed,}) {
  return _then(Sub2ApiOrderJsapiReady(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,payAmount: null == payAmount ? _self.payAmount : payAmount // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,feeRate: null == feeRate ? _self.feeRate : feeRate // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,outTradeNo: null == outTradeNo ? _self.outTradeNo : outTradeNo // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,jsapi: null == jsapi ? _self.jsapi : jsapi // ignore: cast_nullable_to_non_nullable
as Sub2ApiWechatJsApiInstructions,resumeToken: freezed == resumeToken ? _self.resumeToken : resumeToken // ignore: cast_nullable_to_non_nullable
as Sub2ApiCheckoutSecret?,
  ));
}

/// Create a copy of Sub2ApiCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Sub2ApiWechatJsApiInstructionsCopyWith<$Res> get jsapi {
  
  return $Sub2ApiWechatJsApiInstructionsCopyWith<$Res>(_self.jsapi, (value) {
    return _then(_self.copyWith(jsapi: value));
  });
}
}

// dart format on
