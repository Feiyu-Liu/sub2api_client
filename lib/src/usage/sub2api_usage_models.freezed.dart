// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_usage_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sub2ApiUsageQuery {

 int get page; int get pageSize; int? get apiKeyId; int? get groupId; String? get model; String? get requestType; bool? get stream; int? get billingType; String? get billingMode; DateTime? get startDate; DateTime? get endDate; String? get timezone; String get sortBy; String get sortOrder;
/// Create a copy of Sub2ApiUsageQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiUsageQueryCopyWith<Sub2ApiUsageQuery> get copyWith => _$Sub2ApiUsageQueryCopyWithImpl<Sub2ApiUsageQuery>(this as Sub2ApiUsageQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiUsageQuery&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.apiKeyId, apiKeyId) || other.apiKeyId == apiKeyId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.model, model) || other.model == model)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.billingMode, billingMode) || other.billingMode == billingMode)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,page,pageSize,apiKeyId,groupId,model,requestType,stream,billingType,billingMode,startDate,endDate,timezone,sortBy,sortOrder);

@override
String toString() {
  return 'Sub2ApiUsageQuery(page: $page, pageSize: $pageSize, apiKeyId: $apiKeyId, groupId: $groupId, model: $model, requestType: $requestType, stream: $stream, billingType: $billingType, billingMode: $billingMode, startDate: $startDate, endDate: $endDate, timezone: $timezone, sortBy: $sortBy, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiUsageQueryCopyWith<$Res>  {
  factory $Sub2ApiUsageQueryCopyWith(Sub2ApiUsageQuery value, $Res Function(Sub2ApiUsageQuery) _then) = _$Sub2ApiUsageQueryCopyWithImpl;
@useResult
$Res call({
 int page, int pageSize, int? apiKeyId, int? groupId, String? model, String? requestType, bool? stream, int? billingType, String? billingMode, DateTime? startDate, DateTime? endDate, String? timezone, String sortBy, String sortOrder
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
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? pageSize = null,Object? apiKeyId = freezed,Object? groupId = freezed,Object? model = freezed,Object? requestType = freezed,Object? stream = freezed,Object? billingType = freezed,Object? billingMode = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? timezone = freezed,Object? sortBy = null,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,apiKeyId: freezed == apiKeyId ? _self.apiKeyId : apiKeyId // ignore: cast_nullable_to_non_nullable
as int?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,requestType: freezed == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as String?,stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool?,billingType: freezed == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as int?,billingMode: freezed == billingMode ? _self.billingMode : billingMode // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiUsageQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiUsageQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiUsageQuery value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiUsageQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiUsageQuery value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiUsageQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int pageSize,  int? apiKeyId,  int? groupId,  String? model,  String? requestType,  bool? stream,  int? billingType,  String? billingMode,  DateTime? startDate,  DateTime? endDate,  String? timezone,  String sortBy,  String sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiUsageQuery() when $default != null:
return $default(_that.page,_that.pageSize,_that.apiKeyId,_that.groupId,_that.model,_that.requestType,_that.stream,_that.billingType,_that.billingMode,_that.startDate,_that.endDate,_that.timezone,_that.sortBy,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int pageSize,  int? apiKeyId,  int? groupId,  String? model,  String? requestType,  bool? stream,  int? billingType,  String? billingMode,  DateTime? startDate,  DateTime? endDate,  String? timezone,  String sortBy,  String sortOrder)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiUsageQuery():
return $default(_that.page,_that.pageSize,_that.apiKeyId,_that.groupId,_that.model,_that.requestType,_that.stream,_that.billingType,_that.billingMode,_that.startDate,_that.endDate,_that.timezone,_that.sortBy,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int pageSize,  int? apiKeyId,  int? groupId,  String? model,  String? requestType,  bool? stream,  int? billingType,  String? billingMode,  DateTime? startDate,  DateTime? endDate,  String? timezone,  String sortBy,  String sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiUsageQuery() when $default != null:
return $default(_that.page,_that.pageSize,_that.apiKeyId,_that.groupId,_that.model,_that.requestType,_that.stream,_that.billingType,_that.billingMode,_that.startDate,_that.endDate,_that.timezone,_that.sortBy,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiUsageQuery implements Sub2ApiUsageQuery {
  const _Sub2ApiUsageQuery({this.page = 1, this.pageSize = 20, this.apiKeyId, this.groupId, this.model, this.requestType, this.stream, this.billingType, this.billingMode, this.startDate, this.endDate, this.timezone, this.sortBy = 'created_at', this.sortOrder = 'desc'});
  

@override@JsonKey() final  int page;
@override@JsonKey() final  int pageSize;
@override final  int? apiKeyId;
@override final  int? groupId;
@override final  String? model;
@override final  String? requestType;
@override final  bool? stream;
@override final  int? billingType;
@override final  String? billingMode;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  String? timezone;
@override@JsonKey() final  String sortBy;
@override@JsonKey() final  String sortOrder;

/// Create a copy of Sub2ApiUsageQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiUsageQueryCopyWith<_Sub2ApiUsageQuery> get copyWith => __$Sub2ApiUsageQueryCopyWithImpl<_Sub2ApiUsageQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiUsageQuery&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.apiKeyId, apiKeyId) || other.apiKeyId == apiKeyId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.model, model) || other.model == model)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.billingMode, billingMode) || other.billingMode == billingMode)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,page,pageSize,apiKeyId,groupId,model,requestType,stream,billingType,billingMode,startDate,endDate,timezone,sortBy,sortOrder);

@override
String toString() {
  return 'Sub2ApiUsageQuery(page: $page, pageSize: $pageSize, apiKeyId: $apiKeyId, groupId: $groupId, model: $model, requestType: $requestType, stream: $stream, billingType: $billingType, billingMode: $billingMode, startDate: $startDate, endDate: $endDate, timezone: $timezone, sortBy: $sortBy, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiUsageQueryCopyWith<$Res> implements $Sub2ApiUsageQueryCopyWith<$Res> {
  factory _$Sub2ApiUsageQueryCopyWith(_Sub2ApiUsageQuery value, $Res Function(_Sub2ApiUsageQuery) _then) = __$Sub2ApiUsageQueryCopyWithImpl;
@override @useResult
$Res call({
 int page, int pageSize, int? apiKeyId, int? groupId, String? model, String? requestType, bool? stream, int? billingType, String? billingMode, DateTime? startDate, DateTime? endDate, String? timezone, String sortBy, String sortOrder
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
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? pageSize = null,Object? apiKeyId = freezed,Object? groupId = freezed,Object? model = freezed,Object? requestType = freezed,Object? stream = freezed,Object? billingType = freezed,Object? billingMode = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? timezone = freezed,Object? sortBy = null,Object? sortOrder = null,}) {
  return _then(_Sub2ApiUsageQuery(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,apiKeyId: freezed == apiKeyId ? _self.apiKeyId : apiKeyId // ignore: cast_nullable_to_non_nullable
as int?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,requestType: freezed == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as String?,stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool?,billingType: freezed == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as int?,billingMode: freezed == billingMode ? _self.billingMode : billingMode // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiUsageRecord {

 int get id; int get userId; int get apiKeyId; int get accountId; String get requestId; String get model; String? get serviceTier; String? get reasoningEffort; String? get inboundEndpoint; String? get upstreamEndpoint; int? get groupId; int? get subscriptionId; int get inputTokens; int get outputTokens; int get cacheCreationTokens; int get cacheReadTokens; int get cacheCreation5mTokens; int get cacheCreation1hTokens; Sub2ApiDecimal get inputCost; Sub2ApiDecimal get outputCost; Sub2ApiDecimal get cacheCreationCost; Sub2ApiDecimal get cacheReadCost; Sub2ApiDecimal get totalCost; Sub2ApiDecimal get actualCost; Sub2ApiDecimal get rateMultiplier; bool get longContextBillingApplied; int get billingType; String get requestType; bool get stream; bool get openAiWsMode; int? get durationMs; int? get firstTokenMs; int get imageCount; String? get imageSize; String? get imageInputSize; String? get imageOutputSize; int get imageOutputTokens; Sub2ApiDecimal get imageOutputCost; String? get imageSizeSource; Map<String, int>? get imageSizeBreakdown; String? get mediaType; String? get userAgent; String? get ipAddress; bool get cacheTtlOverridden; String? get billingMode; DateTime get createdAt;
/// Create a copy of Sub2ApiUsageRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiUsageRecordCopyWith<Sub2ApiUsageRecord> get copyWith => _$Sub2ApiUsageRecordCopyWithImpl<Sub2ApiUsageRecord>(this as Sub2ApiUsageRecord, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiUsageRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.apiKeyId, apiKeyId) || other.apiKeyId == apiKeyId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.model, model) || other.model == model)&&(identical(other.serviceTier, serviceTier) || other.serviceTier == serviceTier)&&(identical(other.reasoningEffort, reasoningEffort) || other.reasoningEffort == reasoningEffort)&&(identical(other.inboundEndpoint, inboundEndpoint) || other.inboundEndpoint == inboundEndpoint)&&(identical(other.upstreamEndpoint, upstreamEndpoint) || other.upstreamEndpoint == upstreamEndpoint)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.inputTokens, inputTokens) || other.inputTokens == inputTokens)&&(identical(other.outputTokens, outputTokens) || other.outputTokens == outputTokens)&&(identical(other.cacheCreationTokens, cacheCreationTokens) || other.cacheCreationTokens == cacheCreationTokens)&&(identical(other.cacheReadTokens, cacheReadTokens) || other.cacheReadTokens == cacheReadTokens)&&(identical(other.cacheCreation5mTokens, cacheCreation5mTokens) || other.cacheCreation5mTokens == cacheCreation5mTokens)&&(identical(other.cacheCreation1hTokens, cacheCreation1hTokens) || other.cacheCreation1hTokens == cacheCreation1hTokens)&&(identical(other.inputCost, inputCost) || other.inputCost == inputCost)&&(identical(other.outputCost, outputCost) || other.outputCost == outputCost)&&(identical(other.cacheCreationCost, cacheCreationCost) || other.cacheCreationCost == cacheCreationCost)&&(identical(other.cacheReadCost, cacheReadCost) || other.cacheReadCost == cacheReadCost)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost)&&(identical(other.rateMultiplier, rateMultiplier) || other.rateMultiplier == rateMultiplier)&&(identical(other.longContextBillingApplied, longContextBillingApplied) || other.longContextBillingApplied == longContextBillingApplied)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.openAiWsMode, openAiWsMode) || other.openAiWsMode == openAiWsMode)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.firstTokenMs, firstTokenMs) || other.firstTokenMs == firstTokenMs)&&(identical(other.imageCount, imageCount) || other.imageCount == imageCount)&&(identical(other.imageSize, imageSize) || other.imageSize == imageSize)&&(identical(other.imageInputSize, imageInputSize) || other.imageInputSize == imageInputSize)&&(identical(other.imageOutputSize, imageOutputSize) || other.imageOutputSize == imageOutputSize)&&(identical(other.imageOutputTokens, imageOutputTokens) || other.imageOutputTokens == imageOutputTokens)&&(identical(other.imageOutputCost, imageOutputCost) || other.imageOutputCost == imageOutputCost)&&(identical(other.imageSizeSource, imageSizeSource) || other.imageSizeSource == imageSizeSource)&&const DeepCollectionEquality().equals(other.imageSizeBreakdown, imageSizeBreakdown)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.cacheTtlOverridden, cacheTtlOverridden) || other.cacheTtlOverridden == cacheTtlOverridden)&&(identical(other.billingMode, billingMode) || other.billingMode == billingMode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,userId,apiKeyId,accountId,requestId,model,serviceTier,reasoningEffort,inboundEndpoint,upstreamEndpoint,groupId,subscriptionId,inputTokens,outputTokens,cacheCreationTokens,cacheReadTokens,cacheCreation5mTokens,cacheCreation1hTokens,inputCost,outputCost,cacheCreationCost,cacheReadCost,totalCost,actualCost,rateMultiplier,longContextBillingApplied,billingType,requestType,stream,openAiWsMode,durationMs,firstTokenMs,imageCount,imageSize,imageInputSize,imageOutputSize,imageOutputTokens,imageOutputCost,imageSizeSource,const DeepCollectionEquality().hash(imageSizeBreakdown),mediaType,userAgent,ipAddress,cacheTtlOverridden,billingMode,createdAt]);

@override
String toString() {
  return 'Sub2ApiUsageRecord(id: $id, userId: $userId, apiKeyId: $apiKeyId, accountId: $accountId, requestId: $requestId, model: $model, serviceTier: $serviceTier, reasoningEffort: $reasoningEffort, inboundEndpoint: $inboundEndpoint, upstreamEndpoint: $upstreamEndpoint, groupId: $groupId, subscriptionId: $subscriptionId, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheCreationTokens: $cacheCreationTokens, cacheReadTokens: $cacheReadTokens, cacheCreation5mTokens: $cacheCreation5mTokens, cacheCreation1hTokens: $cacheCreation1hTokens, inputCost: $inputCost, outputCost: $outputCost, cacheCreationCost: $cacheCreationCost, cacheReadCost: $cacheReadCost, totalCost: $totalCost, actualCost: $actualCost, rateMultiplier: $rateMultiplier, longContextBillingApplied: $longContextBillingApplied, billingType: $billingType, requestType: $requestType, stream: $stream, openAiWsMode: $openAiWsMode, durationMs: $durationMs, firstTokenMs: $firstTokenMs, imageCount: $imageCount, imageSize: $imageSize, imageInputSize: $imageInputSize, imageOutputSize: $imageOutputSize, imageOutputTokens: $imageOutputTokens, imageOutputCost: $imageOutputCost, imageSizeSource: $imageSizeSource, imageSizeBreakdown: $imageSizeBreakdown, mediaType: $mediaType, userAgent: $userAgent, ipAddress: $ipAddress, cacheTtlOverridden: $cacheTtlOverridden, billingMode: $billingMode, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiUsageRecordCopyWith<$Res>  {
  factory $Sub2ApiUsageRecordCopyWith(Sub2ApiUsageRecord value, $Res Function(Sub2ApiUsageRecord) _then) = _$Sub2ApiUsageRecordCopyWithImpl;
@useResult
$Res call({
 int id, int userId, int apiKeyId, int accountId, String requestId, String model, String? serviceTier, String? reasoningEffort, String? inboundEndpoint, String? upstreamEndpoint, int? groupId, int? subscriptionId, int inputTokens, int outputTokens, int cacheCreationTokens, int cacheReadTokens, int cacheCreation5mTokens, int cacheCreation1hTokens, Sub2ApiDecimal inputCost, Sub2ApiDecimal outputCost, Sub2ApiDecimal cacheCreationCost, Sub2ApiDecimal cacheReadCost, Sub2ApiDecimal totalCost, Sub2ApiDecimal actualCost, Sub2ApiDecimal rateMultiplier, bool longContextBillingApplied, int billingType, String requestType, bool stream, bool openAiWsMode, int? durationMs, int? firstTokenMs, int imageCount, String? imageSize, String? imageInputSize, String? imageOutputSize, int imageOutputTokens, Sub2ApiDecimal imageOutputCost, String? imageSizeSource, Map<String, int>? imageSizeBreakdown, String? mediaType, String? userAgent, String? ipAddress, bool cacheTtlOverridden, String? billingMode, DateTime createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? apiKeyId = null,Object? accountId = null,Object? requestId = null,Object? model = null,Object? serviceTier = freezed,Object? reasoningEffort = freezed,Object? inboundEndpoint = freezed,Object? upstreamEndpoint = freezed,Object? groupId = freezed,Object? subscriptionId = freezed,Object? inputTokens = null,Object? outputTokens = null,Object? cacheCreationTokens = null,Object? cacheReadTokens = null,Object? cacheCreation5mTokens = null,Object? cacheCreation1hTokens = null,Object? inputCost = null,Object? outputCost = null,Object? cacheCreationCost = null,Object? cacheReadCost = null,Object? totalCost = null,Object? actualCost = null,Object? rateMultiplier = null,Object? longContextBillingApplied = null,Object? billingType = null,Object? requestType = null,Object? stream = null,Object? openAiWsMode = null,Object? durationMs = freezed,Object? firstTokenMs = freezed,Object? imageCount = null,Object? imageSize = freezed,Object? imageInputSize = freezed,Object? imageOutputSize = freezed,Object? imageOutputTokens = null,Object? imageOutputCost = null,Object? imageSizeSource = freezed,Object? imageSizeBreakdown = freezed,Object? mediaType = freezed,Object? userAgent = freezed,Object? ipAddress = freezed,Object? cacheTtlOverridden = null,Object? billingMode = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,apiKeyId: null == apiKeyId ? _self.apiKeyId : apiKeyId // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,serviceTier: freezed == serviceTier ? _self.serviceTier : serviceTier // ignore: cast_nullable_to_non_nullable
as String?,reasoningEffort: freezed == reasoningEffort ? _self.reasoningEffort : reasoningEffort // ignore: cast_nullable_to_non_nullable
as String?,inboundEndpoint: freezed == inboundEndpoint ? _self.inboundEndpoint : inboundEndpoint // ignore: cast_nullable_to_non_nullable
as String?,upstreamEndpoint: freezed == upstreamEndpoint ? _self.upstreamEndpoint : upstreamEndpoint // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,subscriptionId: freezed == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as int?,inputTokens: null == inputTokens ? _self.inputTokens : inputTokens // ignore: cast_nullable_to_non_nullable
as int,outputTokens: null == outputTokens ? _self.outputTokens : outputTokens // ignore: cast_nullable_to_non_nullable
as int,cacheCreationTokens: null == cacheCreationTokens ? _self.cacheCreationTokens : cacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,cacheReadTokens: null == cacheReadTokens ? _self.cacheReadTokens : cacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,cacheCreation5mTokens: null == cacheCreation5mTokens ? _self.cacheCreation5mTokens : cacheCreation5mTokens // ignore: cast_nullable_to_non_nullable
as int,cacheCreation1hTokens: null == cacheCreation1hTokens ? _self.cacheCreation1hTokens : cacheCreation1hTokens // ignore: cast_nullable_to_non_nullable
as int,inputCost: null == inputCost ? _self.inputCost : inputCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,outputCost: null == outputCost ? _self.outputCost : outputCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,cacheCreationCost: null == cacheCreationCost ? _self.cacheCreationCost : cacheCreationCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,cacheReadCost: null == cacheReadCost ? _self.cacheReadCost : cacheReadCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalCost: null == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,actualCost: null == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,rateMultiplier: null == rateMultiplier ? _self.rateMultiplier : rateMultiplier // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,longContextBillingApplied: null == longContextBillingApplied ? _self.longContextBillingApplied : longContextBillingApplied // ignore: cast_nullable_to_non_nullable
as bool,billingType: null == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as int,requestType: null == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as String,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,openAiWsMode: null == openAiWsMode ? _self.openAiWsMode : openAiWsMode // ignore: cast_nullable_to_non_nullable
as bool,durationMs: freezed == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int?,firstTokenMs: freezed == firstTokenMs ? _self.firstTokenMs : firstTokenMs // ignore: cast_nullable_to_non_nullable
as int?,imageCount: null == imageCount ? _self.imageCount : imageCount // ignore: cast_nullable_to_non_nullable
as int,imageSize: freezed == imageSize ? _self.imageSize : imageSize // ignore: cast_nullable_to_non_nullable
as String?,imageInputSize: freezed == imageInputSize ? _self.imageInputSize : imageInputSize // ignore: cast_nullable_to_non_nullable
as String?,imageOutputSize: freezed == imageOutputSize ? _self.imageOutputSize : imageOutputSize // ignore: cast_nullable_to_non_nullable
as String?,imageOutputTokens: null == imageOutputTokens ? _self.imageOutputTokens : imageOutputTokens // ignore: cast_nullable_to_non_nullable
as int,imageOutputCost: null == imageOutputCost ? _self.imageOutputCost : imageOutputCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,imageSizeSource: freezed == imageSizeSource ? _self.imageSizeSource : imageSizeSource // ignore: cast_nullable_to_non_nullable
as String?,imageSizeBreakdown: freezed == imageSizeBreakdown ? _self.imageSizeBreakdown : imageSizeBreakdown // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String?,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,cacheTtlOverridden: null == cacheTtlOverridden ? _self.cacheTtlOverridden : cacheTtlOverridden // ignore: cast_nullable_to_non_nullable
as bool,billingMode: freezed == billingMode ? _self.billingMode : billingMode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiUsageRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiUsageRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiUsageRecord value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiUsageRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiUsageRecord value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiUsageRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userId,  int apiKeyId,  int accountId,  String requestId,  String model,  String? serviceTier,  String? reasoningEffort,  String? inboundEndpoint,  String? upstreamEndpoint,  int? groupId,  int? subscriptionId,  int inputTokens,  int outputTokens,  int cacheCreationTokens,  int cacheReadTokens,  int cacheCreation5mTokens,  int cacheCreation1hTokens,  Sub2ApiDecimal inputCost,  Sub2ApiDecimal outputCost,  Sub2ApiDecimal cacheCreationCost,  Sub2ApiDecimal cacheReadCost,  Sub2ApiDecimal totalCost,  Sub2ApiDecimal actualCost,  Sub2ApiDecimal rateMultiplier,  bool longContextBillingApplied,  int billingType,  String requestType,  bool stream,  bool openAiWsMode,  int? durationMs,  int? firstTokenMs,  int imageCount,  String? imageSize,  String? imageInputSize,  String? imageOutputSize,  int imageOutputTokens,  Sub2ApiDecimal imageOutputCost,  String? imageSizeSource,  Map<String, int>? imageSizeBreakdown,  String? mediaType,  String? userAgent,  String? ipAddress,  bool cacheTtlOverridden,  String? billingMode,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiUsageRecord() when $default != null:
return $default(_that.id,_that.userId,_that.apiKeyId,_that.accountId,_that.requestId,_that.model,_that.serviceTier,_that.reasoningEffort,_that.inboundEndpoint,_that.upstreamEndpoint,_that.groupId,_that.subscriptionId,_that.inputTokens,_that.outputTokens,_that.cacheCreationTokens,_that.cacheReadTokens,_that.cacheCreation5mTokens,_that.cacheCreation1hTokens,_that.inputCost,_that.outputCost,_that.cacheCreationCost,_that.cacheReadCost,_that.totalCost,_that.actualCost,_that.rateMultiplier,_that.longContextBillingApplied,_that.billingType,_that.requestType,_that.stream,_that.openAiWsMode,_that.durationMs,_that.firstTokenMs,_that.imageCount,_that.imageSize,_that.imageInputSize,_that.imageOutputSize,_that.imageOutputTokens,_that.imageOutputCost,_that.imageSizeSource,_that.imageSizeBreakdown,_that.mediaType,_that.userAgent,_that.ipAddress,_that.cacheTtlOverridden,_that.billingMode,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userId,  int apiKeyId,  int accountId,  String requestId,  String model,  String? serviceTier,  String? reasoningEffort,  String? inboundEndpoint,  String? upstreamEndpoint,  int? groupId,  int? subscriptionId,  int inputTokens,  int outputTokens,  int cacheCreationTokens,  int cacheReadTokens,  int cacheCreation5mTokens,  int cacheCreation1hTokens,  Sub2ApiDecimal inputCost,  Sub2ApiDecimal outputCost,  Sub2ApiDecimal cacheCreationCost,  Sub2ApiDecimal cacheReadCost,  Sub2ApiDecimal totalCost,  Sub2ApiDecimal actualCost,  Sub2ApiDecimal rateMultiplier,  bool longContextBillingApplied,  int billingType,  String requestType,  bool stream,  bool openAiWsMode,  int? durationMs,  int? firstTokenMs,  int imageCount,  String? imageSize,  String? imageInputSize,  String? imageOutputSize,  int imageOutputTokens,  Sub2ApiDecimal imageOutputCost,  String? imageSizeSource,  Map<String, int>? imageSizeBreakdown,  String? mediaType,  String? userAgent,  String? ipAddress,  bool cacheTtlOverridden,  String? billingMode,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiUsageRecord():
return $default(_that.id,_that.userId,_that.apiKeyId,_that.accountId,_that.requestId,_that.model,_that.serviceTier,_that.reasoningEffort,_that.inboundEndpoint,_that.upstreamEndpoint,_that.groupId,_that.subscriptionId,_that.inputTokens,_that.outputTokens,_that.cacheCreationTokens,_that.cacheReadTokens,_that.cacheCreation5mTokens,_that.cacheCreation1hTokens,_that.inputCost,_that.outputCost,_that.cacheCreationCost,_that.cacheReadCost,_that.totalCost,_that.actualCost,_that.rateMultiplier,_that.longContextBillingApplied,_that.billingType,_that.requestType,_that.stream,_that.openAiWsMode,_that.durationMs,_that.firstTokenMs,_that.imageCount,_that.imageSize,_that.imageInputSize,_that.imageOutputSize,_that.imageOutputTokens,_that.imageOutputCost,_that.imageSizeSource,_that.imageSizeBreakdown,_that.mediaType,_that.userAgent,_that.ipAddress,_that.cacheTtlOverridden,_that.billingMode,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userId,  int apiKeyId,  int accountId,  String requestId,  String model,  String? serviceTier,  String? reasoningEffort,  String? inboundEndpoint,  String? upstreamEndpoint,  int? groupId,  int? subscriptionId,  int inputTokens,  int outputTokens,  int cacheCreationTokens,  int cacheReadTokens,  int cacheCreation5mTokens,  int cacheCreation1hTokens,  Sub2ApiDecimal inputCost,  Sub2ApiDecimal outputCost,  Sub2ApiDecimal cacheCreationCost,  Sub2ApiDecimal cacheReadCost,  Sub2ApiDecimal totalCost,  Sub2ApiDecimal actualCost,  Sub2ApiDecimal rateMultiplier,  bool longContextBillingApplied,  int billingType,  String requestType,  bool stream,  bool openAiWsMode,  int? durationMs,  int? firstTokenMs,  int imageCount,  String? imageSize,  String? imageInputSize,  String? imageOutputSize,  int imageOutputTokens,  Sub2ApiDecimal imageOutputCost,  String? imageSizeSource,  Map<String, int>? imageSizeBreakdown,  String? mediaType,  String? userAgent,  String? ipAddress,  bool cacheTtlOverridden,  String? billingMode,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiUsageRecord() when $default != null:
return $default(_that.id,_that.userId,_that.apiKeyId,_that.accountId,_that.requestId,_that.model,_that.serviceTier,_that.reasoningEffort,_that.inboundEndpoint,_that.upstreamEndpoint,_that.groupId,_that.subscriptionId,_that.inputTokens,_that.outputTokens,_that.cacheCreationTokens,_that.cacheReadTokens,_that.cacheCreation5mTokens,_that.cacheCreation1hTokens,_that.inputCost,_that.outputCost,_that.cacheCreationCost,_that.cacheReadCost,_that.totalCost,_that.actualCost,_that.rateMultiplier,_that.longContextBillingApplied,_that.billingType,_that.requestType,_that.stream,_that.openAiWsMode,_that.durationMs,_that.firstTokenMs,_that.imageCount,_that.imageSize,_that.imageInputSize,_that.imageOutputSize,_that.imageOutputTokens,_that.imageOutputCost,_that.imageSizeSource,_that.imageSizeBreakdown,_that.mediaType,_that.userAgent,_that.ipAddress,_that.cacheTtlOverridden,_that.billingMode,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiUsageRecord implements Sub2ApiUsageRecord {
  const _Sub2ApiUsageRecord({required this.id, required this.userId, required this.apiKeyId, required this.accountId, required this.requestId, required this.model, this.serviceTier, this.reasoningEffort, this.inboundEndpoint, this.upstreamEndpoint, this.groupId, this.subscriptionId, required this.inputTokens, required this.outputTokens, required this.cacheCreationTokens, required this.cacheReadTokens, required this.cacheCreation5mTokens, required this.cacheCreation1hTokens, required this.inputCost, required this.outputCost, required this.cacheCreationCost, required this.cacheReadCost, required this.totalCost, required this.actualCost, required this.rateMultiplier, required this.longContextBillingApplied, required this.billingType, required this.requestType, required this.stream, required this.openAiWsMode, this.durationMs, this.firstTokenMs, required this.imageCount, this.imageSize, this.imageInputSize, this.imageOutputSize, required this.imageOutputTokens, required this.imageOutputCost, this.imageSizeSource, final  Map<String, int>? imageSizeBreakdown, this.mediaType, this.userAgent, this.ipAddress, required this.cacheTtlOverridden, this.billingMode, required this.createdAt}): _imageSizeBreakdown = imageSizeBreakdown;
  

@override final  int id;
@override final  int userId;
@override final  int apiKeyId;
@override final  int accountId;
@override final  String requestId;
@override final  String model;
@override final  String? serviceTier;
@override final  String? reasoningEffort;
@override final  String? inboundEndpoint;
@override final  String? upstreamEndpoint;
@override final  int? groupId;
@override final  int? subscriptionId;
@override final  int inputTokens;
@override final  int outputTokens;
@override final  int cacheCreationTokens;
@override final  int cacheReadTokens;
@override final  int cacheCreation5mTokens;
@override final  int cacheCreation1hTokens;
@override final  Sub2ApiDecimal inputCost;
@override final  Sub2ApiDecimal outputCost;
@override final  Sub2ApiDecimal cacheCreationCost;
@override final  Sub2ApiDecimal cacheReadCost;
@override final  Sub2ApiDecimal totalCost;
@override final  Sub2ApiDecimal actualCost;
@override final  Sub2ApiDecimal rateMultiplier;
@override final  bool longContextBillingApplied;
@override final  int billingType;
@override final  String requestType;
@override final  bool stream;
@override final  bool openAiWsMode;
@override final  int? durationMs;
@override final  int? firstTokenMs;
@override final  int imageCount;
@override final  String? imageSize;
@override final  String? imageInputSize;
@override final  String? imageOutputSize;
@override final  int imageOutputTokens;
@override final  Sub2ApiDecimal imageOutputCost;
@override final  String? imageSizeSource;
 final  Map<String, int>? _imageSizeBreakdown;
@override Map<String, int>? get imageSizeBreakdown {
  final value = _imageSizeBreakdown;
  if (value == null) return null;
  if (_imageSizeBreakdown is EqualUnmodifiableMapView) return _imageSizeBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? mediaType;
@override final  String? userAgent;
@override final  String? ipAddress;
@override final  bool cacheTtlOverridden;
@override final  String? billingMode;
@override final  DateTime createdAt;

/// Create a copy of Sub2ApiUsageRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiUsageRecordCopyWith<_Sub2ApiUsageRecord> get copyWith => __$Sub2ApiUsageRecordCopyWithImpl<_Sub2ApiUsageRecord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiUsageRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.apiKeyId, apiKeyId) || other.apiKeyId == apiKeyId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.model, model) || other.model == model)&&(identical(other.serviceTier, serviceTier) || other.serviceTier == serviceTier)&&(identical(other.reasoningEffort, reasoningEffort) || other.reasoningEffort == reasoningEffort)&&(identical(other.inboundEndpoint, inboundEndpoint) || other.inboundEndpoint == inboundEndpoint)&&(identical(other.upstreamEndpoint, upstreamEndpoint) || other.upstreamEndpoint == upstreamEndpoint)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.inputTokens, inputTokens) || other.inputTokens == inputTokens)&&(identical(other.outputTokens, outputTokens) || other.outputTokens == outputTokens)&&(identical(other.cacheCreationTokens, cacheCreationTokens) || other.cacheCreationTokens == cacheCreationTokens)&&(identical(other.cacheReadTokens, cacheReadTokens) || other.cacheReadTokens == cacheReadTokens)&&(identical(other.cacheCreation5mTokens, cacheCreation5mTokens) || other.cacheCreation5mTokens == cacheCreation5mTokens)&&(identical(other.cacheCreation1hTokens, cacheCreation1hTokens) || other.cacheCreation1hTokens == cacheCreation1hTokens)&&(identical(other.inputCost, inputCost) || other.inputCost == inputCost)&&(identical(other.outputCost, outputCost) || other.outputCost == outputCost)&&(identical(other.cacheCreationCost, cacheCreationCost) || other.cacheCreationCost == cacheCreationCost)&&(identical(other.cacheReadCost, cacheReadCost) || other.cacheReadCost == cacheReadCost)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost)&&(identical(other.rateMultiplier, rateMultiplier) || other.rateMultiplier == rateMultiplier)&&(identical(other.longContextBillingApplied, longContextBillingApplied) || other.longContextBillingApplied == longContextBillingApplied)&&(identical(other.billingType, billingType) || other.billingType == billingType)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.openAiWsMode, openAiWsMode) || other.openAiWsMode == openAiWsMode)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.firstTokenMs, firstTokenMs) || other.firstTokenMs == firstTokenMs)&&(identical(other.imageCount, imageCount) || other.imageCount == imageCount)&&(identical(other.imageSize, imageSize) || other.imageSize == imageSize)&&(identical(other.imageInputSize, imageInputSize) || other.imageInputSize == imageInputSize)&&(identical(other.imageOutputSize, imageOutputSize) || other.imageOutputSize == imageOutputSize)&&(identical(other.imageOutputTokens, imageOutputTokens) || other.imageOutputTokens == imageOutputTokens)&&(identical(other.imageOutputCost, imageOutputCost) || other.imageOutputCost == imageOutputCost)&&(identical(other.imageSizeSource, imageSizeSource) || other.imageSizeSource == imageSizeSource)&&const DeepCollectionEquality().equals(other._imageSizeBreakdown, _imageSizeBreakdown)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.cacheTtlOverridden, cacheTtlOverridden) || other.cacheTtlOverridden == cacheTtlOverridden)&&(identical(other.billingMode, billingMode) || other.billingMode == billingMode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,userId,apiKeyId,accountId,requestId,model,serviceTier,reasoningEffort,inboundEndpoint,upstreamEndpoint,groupId,subscriptionId,inputTokens,outputTokens,cacheCreationTokens,cacheReadTokens,cacheCreation5mTokens,cacheCreation1hTokens,inputCost,outputCost,cacheCreationCost,cacheReadCost,totalCost,actualCost,rateMultiplier,longContextBillingApplied,billingType,requestType,stream,openAiWsMode,durationMs,firstTokenMs,imageCount,imageSize,imageInputSize,imageOutputSize,imageOutputTokens,imageOutputCost,imageSizeSource,const DeepCollectionEquality().hash(_imageSizeBreakdown),mediaType,userAgent,ipAddress,cacheTtlOverridden,billingMode,createdAt]);

@override
String toString() {
  return 'Sub2ApiUsageRecord(id: $id, userId: $userId, apiKeyId: $apiKeyId, accountId: $accountId, requestId: $requestId, model: $model, serviceTier: $serviceTier, reasoningEffort: $reasoningEffort, inboundEndpoint: $inboundEndpoint, upstreamEndpoint: $upstreamEndpoint, groupId: $groupId, subscriptionId: $subscriptionId, inputTokens: $inputTokens, outputTokens: $outputTokens, cacheCreationTokens: $cacheCreationTokens, cacheReadTokens: $cacheReadTokens, cacheCreation5mTokens: $cacheCreation5mTokens, cacheCreation1hTokens: $cacheCreation1hTokens, inputCost: $inputCost, outputCost: $outputCost, cacheCreationCost: $cacheCreationCost, cacheReadCost: $cacheReadCost, totalCost: $totalCost, actualCost: $actualCost, rateMultiplier: $rateMultiplier, longContextBillingApplied: $longContextBillingApplied, billingType: $billingType, requestType: $requestType, stream: $stream, openAiWsMode: $openAiWsMode, durationMs: $durationMs, firstTokenMs: $firstTokenMs, imageCount: $imageCount, imageSize: $imageSize, imageInputSize: $imageInputSize, imageOutputSize: $imageOutputSize, imageOutputTokens: $imageOutputTokens, imageOutputCost: $imageOutputCost, imageSizeSource: $imageSizeSource, imageSizeBreakdown: $imageSizeBreakdown, mediaType: $mediaType, userAgent: $userAgent, ipAddress: $ipAddress, cacheTtlOverridden: $cacheTtlOverridden, billingMode: $billingMode, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiUsageRecordCopyWith<$Res> implements $Sub2ApiUsageRecordCopyWith<$Res> {
  factory _$Sub2ApiUsageRecordCopyWith(_Sub2ApiUsageRecord value, $Res Function(_Sub2ApiUsageRecord) _then) = __$Sub2ApiUsageRecordCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, int apiKeyId, int accountId, String requestId, String model, String? serviceTier, String? reasoningEffort, String? inboundEndpoint, String? upstreamEndpoint, int? groupId, int? subscriptionId, int inputTokens, int outputTokens, int cacheCreationTokens, int cacheReadTokens, int cacheCreation5mTokens, int cacheCreation1hTokens, Sub2ApiDecimal inputCost, Sub2ApiDecimal outputCost, Sub2ApiDecimal cacheCreationCost, Sub2ApiDecimal cacheReadCost, Sub2ApiDecimal totalCost, Sub2ApiDecimal actualCost, Sub2ApiDecimal rateMultiplier, bool longContextBillingApplied, int billingType, String requestType, bool stream, bool openAiWsMode, int? durationMs, int? firstTokenMs, int imageCount, String? imageSize, String? imageInputSize, String? imageOutputSize, int imageOutputTokens, Sub2ApiDecimal imageOutputCost, String? imageSizeSource, Map<String, int>? imageSizeBreakdown, String? mediaType, String? userAgent, String? ipAddress, bool cacheTtlOverridden, String? billingMode, DateTime createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? apiKeyId = null,Object? accountId = null,Object? requestId = null,Object? model = null,Object? serviceTier = freezed,Object? reasoningEffort = freezed,Object? inboundEndpoint = freezed,Object? upstreamEndpoint = freezed,Object? groupId = freezed,Object? subscriptionId = freezed,Object? inputTokens = null,Object? outputTokens = null,Object? cacheCreationTokens = null,Object? cacheReadTokens = null,Object? cacheCreation5mTokens = null,Object? cacheCreation1hTokens = null,Object? inputCost = null,Object? outputCost = null,Object? cacheCreationCost = null,Object? cacheReadCost = null,Object? totalCost = null,Object? actualCost = null,Object? rateMultiplier = null,Object? longContextBillingApplied = null,Object? billingType = null,Object? requestType = null,Object? stream = null,Object? openAiWsMode = null,Object? durationMs = freezed,Object? firstTokenMs = freezed,Object? imageCount = null,Object? imageSize = freezed,Object? imageInputSize = freezed,Object? imageOutputSize = freezed,Object? imageOutputTokens = null,Object? imageOutputCost = null,Object? imageSizeSource = freezed,Object? imageSizeBreakdown = freezed,Object? mediaType = freezed,Object? userAgent = freezed,Object? ipAddress = freezed,Object? cacheTtlOverridden = null,Object? billingMode = freezed,Object? createdAt = null,}) {
  return _then(_Sub2ApiUsageRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,apiKeyId: null == apiKeyId ? _self.apiKeyId : apiKeyId // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,serviceTier: freezed == serviceTier ? _self.serviceTier : serviceTier // ignore: cast_nullable_to_non_nullable
as String?,reasoningEffort: freezed == reasoningEffort ? _self.reasoningEffort : reasoningEffort // ignore: cast_nullable_to_non_nullable
as String?,inboundEndpoint: freezed == inboundEndpoint ? _self.inboundEndpoint : inboundEndpoint // ignore: cast_nullable_to_non_nullable
as String?,upstreamEndpoint: freezed == upstreamEndpoint ? _self.upstreamEndpoint : upstreamEndpoint // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,subscriptionId: freezed == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as int?,inputTokens: null == inputTokens ? _self.inputTokens : inputTokens // ignore: cast_nullable_to_non_nullable
as int,outputTokens: null == outputTokens ? _self.outputTokens : outputTokens // ignore: cast_nullable_to_non_nullable
as int,cacheCreationTokens: null == cacheCreationTokens ? _self.cacheCreationTokens : cacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,cacheReadTokens: null == cacheReadTokens ? _self.cacheReadTokens : cacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,cacheCreation5mTokens: null == cacheCreation5mTokens ? _self.cacheCreation5mTokens : cacheCreation5mTokens // ignore: cast_nullable_to_non_nullable
as int,cacheCreation1hTokens: null == cacheCreation1hTokens ? _self.cacheCreation1hTokens : cacheCreation1hTokens // ignore: cast_nullable_to_non_nullable
as int,inputCost: null == inputCost ? _self.inputCost : inputCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,outputCost: null == outputCost ? _self.outputCost : outputCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,cacheCreationCost: null == cacheCreationCost ? _self.cacheCreationCost : cacheCreationCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,cacheReadCost: null == cacheReadCost ? _self.cacheReadCost : cacheReadCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalCost: null == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,actualCost: null == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,rateMultiplier: null == rateMultiplier ? _self.rateMultiplier : rateMultiplier // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,longContextBillingApplied: null == longContextBillingApplied ? _self.longContextBillingApplied : longContextBillingApplied // ignore: cast_nullable_to_non_nullable
as bool,billingType: null == billingType ? _self.billingType : billingType // ignore: cast_nullable_to_non_nullable
as int,requestType: null == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as String,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,openAiWsMode: null == openAiWsMode ? _self.openAiWsMode : openAiWsMode // ignore: cast_nullable_to_non_nullable
as bool,durationMs: freezed == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int?,firstTokenMs: freezed == firstTokenMs ? _self.firstTokenMs : firstTokenMs // ignore: cast_nullable_to_non_nullable
as int?,imageCount: null == imageCount ? _self.imageCount : imageCount // ignore: cast_nullable_to_non_nullable
as int,imageSize: freezed == imageSize ? _self.imageSize : imageSize // ignore: cast_nullable_to_non_nullable
as String?,imageInputSize: freezed == imageInputSize ? _self.imageInputSize : imageInputSize // ignore: cast_nullable_to_non_nullable
as String?,imageOutputSize: freezed == imageOutputSize ? _self.imageOutputSize : imageOutputSize // ignore: cast_nullable_to_non_nullable
as String?,imageOutputTokens: null == imageOutputTokens ? _self.imageOutputTokens : imageOutputTokens // ignore: cast_nullable_to_non_nullable
as int,imageOutputCost: null == imageOutputCost ? _self.imageOutputCost : imageOutputCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,imageSizeSource: freezed == imageSizeSource ? _self.imageSizeSource : imageSizeSource // ignore: cast_nullable_to_non_nullable
as String?,imageSizeBreakdown: freezed == imageSizeBreakdown ? _self._imageSizeBreakdown : imageSizeBreakdown // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String?,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,cacheTtlOverridden: null == cacheTtlOverridden ? _self.cacheTtlOverridden : cacheTtlOverridden // ignore: cast_nullable_to_non_nullable
as bool,billingMode: freezed == billingMode ? _self.billingMode : billingMode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$Sub2ApiUsageStats {

 int get totalRequests; int get totalInputTokens; int get totalOutputTokens; int get totalCacheTokens; int get totalCacheCreationTokens; int get totalCacheReadTokens; int get totalTokens; Sub2ApiDecimal get totalCost; Sub2ApiDecimal get totalActualCost; Sub2ApiDecimal get averageDurationMs;
/// Create a copy of Sub2ApiUsageStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Sub2ApiUsageStatsCopyWith<Sub2ApiUsageStats> get copyWith => _$Sub2ApiUsageStatsCopyWithImpl<Sub2ApiUsageStats>(this as Sub2ApiUsageStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sub2ApiUsageStats&&(identical(other.totalRequests, totalRequests) || other.totalRequests == totalRequests)&&(identical(other.totalInputTokens, totalInputTokens) || other.totalInputTokens == totalInputTokens)&&(identical(other.totalOutputTokens, totalOutputTokens) || other.totalOutputTokens == totalOutputTokens)&&(identical(other.totalCacheTokens, totalCacheTokens) || other.totalCacheTokens == totalCacheTokens)&&(identical(other.totalCacheCreationTokens, totalCacheCreationTokens) || other.totalCacheCreationTokens == totalCacheCreationTokens)&&(identical(other.totalCacheReadTokens, totalCacheReadTokens) || other.totalCacheReadTokens == totalCacheReadTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.totalActualCost, totalActualCost) || other.totalActualCost == totalActualCost)&&(identical(other.averageDurationMs, averageDurationMs) || other.averageDurationMs == averageDurationMs));
}


@override
int get hashCode => Object.hash(runtimeType,totalRequests,totalInputTokens,totalOutputTokens,totalCacheTokens,totalCacheCreationTokens,totalCacheReadTokens,totalTokens,totalCost,totalActualCost,averageDurationMs);

@override
String toString() {
  return 'Sub2ApiUsageStats(totalRequests: $totalRequests, totalInputTokens: $totalInputTokens, totalOutputTokens: $totalOutputTokens, totalCacheTokens: $totalCacheTokens, totalCacheCreationTokens: $totalCacheCreationTokens, totalCacheReadTokens: $totalCacheReadTokens, totalTokens: $totalTokens, totalCost: $totalCost, totalActualCost: $totalActualCost, averageDurationMs: $averageDurationMs)';
}


}

/// @nodoc
abstract mixin class $Sub2ApiUsageStatsCopyWith<$Res>  {
  factory $Sub2ApiUsageStatsCopyWith(Sub2ApiUsageStats value, $Res Function(Sub2ApiUsageStats) _then) = _$Sub2ApiUsageStatsCopyWithImpl;
@useResult
$Res call({
 int totalRequests, int totalInputTokens, int totalOutputTokens, int totalCacheTokens, int totalCacheCreationTokens, int totalCacheReadTokens, int totalTokens, Sub2ApiDecimal totalCost, Sub2ApiDecimal totalActualCost, Sub2ApiDecimal averageDurationMs
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
@pragma('vm:prefer-inline') @override $Res call({Object? totalRequests = null,Object? totalInputTokens = null,Object? totalOutputTokens = null,Object? totalCacheTokens = null,Object? totalCacheCreationTokens = null,Object? totalCacheReadTokens = null,Object? totalTokens = null,Object? totalCost = null,Object? totalActualCost = null,Object? averageDurationMs = null,}) {
  return _then(_self.copyWith(
totalRequests: null == totalRequests ? _self.totalRequests : totalRequests // ignore: cast_nullable_to_non_nullable
as int,totalInputTokens: null == totalInputTokens ? _self.totalInputTokens : totalInputTokens // ignore: cast_nullable_to_non_nullable
as int,totalOutputTokens: null == totalOutputTokens ? _self.totalOutputTokens : totalOutputTokens // ignore: cast_nullable_to_non_nullable
as int,totalCacheTokens: null == totalCacheTokens ? _self.totalCacheTokens : totalCacheTokens // ignore: cast_nullable_to_non_nullable
as int,totalCacheCreationTokens: null == totalCacheCreationTokens ? _self.totalCacheCreationTokens : totalCacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,totalCacheReadTokens: null == totalCacheReadTokens ? _self.totalCacheReadTokens : totalCacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,totalCost: null == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalActualCost: null == totalActualCost ? _self.totalActualCost : totalActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,averageDurationMs: null == averageDurationMs ? _self.averageDurationMs : averageDurationMs // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sub2ApiUsageStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sub2ApiUsageStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sub2ApiUsageStats value)  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiUsageStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sub2ApiUsageStats value)?  $default,){
final _that = this;
switch (_that) {
case _Sub2ApiUsageStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalRequests,  int totalInputTokens,  int totalOutputTokens,  int totalCacheTokens,  int totalCacheCreationTokens,  int totalCacheReadTokens,  int totalTokens,  Sub2ApiDecimal totalCost,  Sub2ApiDecimal totalActualCost,  Sub2ApiDecimal averageDurationMs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sub2ApiUsageStats() when $default != null:
return $default(_that.totalRequests,_that.totalInputTokens,_that.totalOutputTokens,_that.totalCacheTokens,_that.totalCacheCreationTokens,_that.totalCacheReadTokens,_that.totalTokens,_that.totalCost,_that.totalActualCost,_that.averageDurationMs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalRequests,  int totalInputTokens,  int totalOutputTokens,  int totalCacheTokens,  int totalCacheCreationTokens,  int totalCacheReadTokens,  int totalTokens,  Sub2ApiDecimal totalCost,  Sub2ApiDecimal totalActualCost,  Sub2ApiDecimal averageDurationMs)  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiUsageStats():
return $default(_that.totalRequests,_that.totalInputTokens,_that.totalOutputTokens,_that.totalCacheTokens,_that.totalCacheCreationTokens,_that.totalCacheReadTokens,_that.totalTokens,_that.totalCost,_that.totalActualCost,_that.averageDurationMs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalRequests,  int totalInputTokens,  int totalOutputTokens,  int totalCacheTokens,  int totalCacheCreationTokens,  int totalCacheReadTokens,  int totalTokens,  Sub2ApiDecimal totalCost,  Sub2ApiDecimal totalActualCost,  Sub2ApiDecimal averageDurationMs)?  $default,) {final _that = this;
switch (_that) {
case _Sub2ApiUsageStats() when $default != null:
return $default(_that.totalRequests,_that.totalInputTokens,_that.totalOutputTokens,_that.totalCacheTokens,_that.totalCacheCreationTokens,_that.totalCacheReadTokens,_that.totalTokens,_that.totalCost,_that.totalActualCost,_that.averageDurationMs);case _:
  return null;

}
}

}

/// @nodoc


class _Sub2ApiUsageStats implements Sub2ApiUsageStats {
  const _Sub2ApiUsageStats({required this.totalRequests, required this.totalInputTokens, required this.totalOutputTokens, required this.totalCacheTokens, required this.totalCacheCreationTokens, required this.totalCacheReadTokens, required this.totalTokens, required this.totalCost, required this.totalActualCost, required this.averageDurationMs});
  

@override final  int totalRequests;
@override final  int totalInputTokens;
@override final  int totalOutputTokens;
@override final  int totalCacheTokens;
@override final  int totalCacheCreationTokens;
@override final  int totalCacheReadTokens;
@override final  int totalTokens;
@override final  Sub2ApiDecimal totalCost;
@override final  Sub2ApiDecimal totalActualCost;
@override final  Sub2ApiDecimal averageDurationMs;

/// Create a copy of Sub2ApiUsageStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Sub2ApiUsageStatsCopyWith<_Sub2ApiUsageStats> get copyWith => __$Sub2ApiUsageStatsCopyWithImpl<_Sub2ApiUsageStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sub2ApiUsageStats&&(identical(other.totalRequests, totalRequests) || other.totalRequests == totalRequests)&&(identical(other.totalInputTokens, totalInputTokens) || other.totalInputTokens == totalInputTokens)&&(identical(other.totalOutputTokens, totalOutputTokens) || other.totalOutputTokens == totalOutputTokens)&&(identical(other.totalCacheTokens, totalCacheTokens) || other.totalCacheTokens == totalCacheTokens)&&(identical(other.totalCacheCreationTokens, totalCacheCreationTokens) || other.totalCacheCreationTokens == totalCacheCreationTokens)&&(identical(other.totalCacheReadTokens, totalCacheReadTokens) || other.totalCacheReadTokens == totalCacheReadTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.totalActualCost, totalActualCost) || other.totalActualCost == totalActualCost)&&(identical(other.averageDurationMs, averageDurationMs) || other.averageDurationMs == averageDurationMs));
}


@override
int get hashCode => Object.hash(runtimeType,totalRequests,totalInputTokens,totalOutputTokens,totalCacheTokens,totalCacheCreationTokens,totalCacheReadTokens,totalTokens,totalCost,totalActualCost,averageDurationMs);

@override
String toString() {
  return 'Sub2ApiUsageStats(totalRequests: $totalRequests, totalInputTokens: $totalInputTokens, totalOutputTokens: $totalOutputTokens, totalCacheTokens: $totalCacheTokens, totalCacheCreationTokens: $totalCacheCreationTokens, totalCacheReadTokens: $totalCacheReadTokens, totalTokens: $totalTokens, totalCost: $totalCost, totalActualCost: $totalActualCost, averageDurationMs: $averageDurationMs)';
}


}

/// @nodoc
abstract mixin class _$Sub2ApiUsageStatsCopyWith<$Res> implements $Sub2ApiUsageStatsCopyWith<$Res> {
  factory _$Sub2ApiUsageStatsCopyWith(_Sub2ApiUsageStats value, $Res Function(_Sub2ApiUsageStats) _then) = __$Sub2ApiUsageStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalRequests, int totalInputTokens, int totalOutputTokens, int totalCacheTokens, int totalCacheCreationTokens, int totalCacheReadTokens, int totalTokens, Sub2ApiDecimal totalCost, Sub2ApiDecimal totalActualCost, Sub2ApiDecimal averageDurationMs
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
@override @pragma('vm:prefer-inline') $Res call({Object? totalRequests = null,Object? totalInputTokens = null,Object? totalOutputTokens = null,Object? totalCacheTokens = null,Object? totalCacheCreationTokens = null,Object? totalCacheReadTokens = null,Object? totalTokens = null,Object? totalCost = null,Object? totalActualCost = null,Object? averageDurationMs = null,}) {
  return _then(_Sub2ApiUsageStats(
totalRequests: null == totalRequests ? _self.totalRequests : totalRequests // ignore: cast_nullable_to_non_nullable
as int,totalInputTokens: null == totalInputTokens ? _self.totalInputTokens : totalInputTokens // ignore: cast_nullable_to_non_nullable
as int,totalOutputTokens: null == totalOutputTokens ? _self.totalOutputTokens : totalOutputTokens // ignore: cast_nullable_to_non_nullable
as int,totalCacheTokens: null == totalCacheTokens ? _self.totalCacheTokens : totalCacheTokens // ignore: cast_nullable_to_non_nullable
as int,totalCacheCreationTokens: null == totalCacheCreationTokens ? _self.totalCacheCreationTokens : totalCacheCreationTokens // ignore: cast_nullable_to_non_nullable
as int,totalCacheReadTokens: null == totalCacheReadTokens ? _self.totalCacheReadTokens : totalCacheReadTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,totalCost: null == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,totalActualCost: null == totalActualCost ? _self.totalActualCost : totalActualCost // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,averageDurationMs: null == averageDurationMs ? _self.averageDurationMs : averageDurationMs // ignore: cast_nullable_to_non_nullable
as Sub2ApiDecimal,
  ));
}


}

// dart format on
