// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_commerce_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sub2ApiAnnouncement {
  int get id;
  String get title;
  String get content;
  String get notifyMode;
  DateTime? get startsAt;
  DateTime? get endsAt;
  DateTime? get readAt;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of Sub2ApiAnnouncement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiAnnouncementCopyWith<Sub2ApiAnnouncement> get copyWith =>
      _$Sub2ApiAnnouncementCopyWithImpl<Sub2ApiAnnouncement>(
        this as Sub2ApiAnnouncement,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiAnnouncement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.notifyMode, notifyMode) ||
                other.notifyMode == notifyMode) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    content,
    notifyMode,
    startsAt,
    endsAt,
    readAt,
    createdAt,
    updatedAt,
  );

  @override
  String toString() {
    return 'Sub2ApiAnnouncement(id: $id, title: $title, content: $content, notifyMode: $notifyMode, startsAt: $startsAt, endsAt: $endsAt, readAt: $readAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiAnnouncementCopyWith<$Res> {
  factory $Sub2ApiAnnouncementCopyWith(
    Sub2ApiAnnouncement value,
    $Res Function(Sub2ApiAnnouncement) _then,
  ) = _$Sub2ApiAnnouncementCopyWithImpl;
  @useResult
  $Res call({
    int id,
    String title,
    String content,
    String notifyMode,
    DateTime? startsAt,
    DateTime? endsAt,
    DateTime? readAt,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$Sub2ApiAnnouncementCopyWithImpl<$Res>
    implements $Sub2ApiAnnouncementCopyWith<$Res> {
  _$Sub2ApiAnnouncementCopyWithImpl(this._self, this._then);

  final Sub2ApiAnnouncement _self;
  final $Res Function(Sub2ApiAnnouncement) _then;

  /// Create a copy of Sub2ApiAnnouncement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? notifyMode = null,
    Object? startsAt = freezed,
    Object? endsAt = freezed,
    Object? readAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _self.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        notifyMode: null == notifyMode
            ? _self.notifyMode
            : notifyMode // ignore: cast_nullable_to_non_nullable
                  as String,
        startsAt: freezed == startsAt
            ? _self.startsAt
            : startsAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endsAt: freezed == endsAt
            ? _self.endsAt
            : endsAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        readAt: freezed == readAt
            ? _self.readAt
            : readAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _self.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiAnnouncement].
extension Sub2ApiAnnouncementPatterns on Sub2ApiAnnouncement {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiAnnouncement value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAnnouncement() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiAnnouncement value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAnnouncement():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiAnnouncement value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAnnouncement() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int id,
      String title,
      String content,
      String notifyMode,
      DateTime? startsAt,
      DateTime? endsAt,
      DateTime? readAt,
      DateTime createdAt,
      DateTime updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAnnouncement() when $default != null:
        return $default(
          _that.id,
          _that.title,
          _that.content,
          _that.notifyMode,
          _that.startsAt,
          _that.endsAt,
          _that.readAt,
          _that.createdAt,
          _that.updatedAt,
        );
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int id,
      String title,
      String content,
      String notifyMode,
      DateTime? startsAt,
      DateTime? endsAt,
      DateTime? readAt,
      DateTime createdAt,
      DateTime updatedAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAnnouncement():
        return $default(
          _that.id,
          _that.title,
          _that.content,
          _that.notifyMode,
          _that.startsAt,
          _that.endsAt,
          _that.readAt,
          _that.createdAt,
          _that.updatedAt,
        );
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int id,
      String title,
      String content,
      String notifyMode,
      DateTime? startsAt,
      DateTime? endsAt,
      DateTime? readAt,
      DateTime createdAt,
      DateTime updatedAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiAnnouncement() when $default != null:
        return $default(
          _that.id,
          _that.title,
          _that.content,
          _that.notifyMode,
          _that.startsAt,
          _that.endsAt,
          _that.readAt,
          _that.createdAt,
          _that.updatedAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiAnnouncement implements Sub2ApiAnnouncement {
  const _Sub2ApiAnnouncement({
    required this.id,
    required this.title,
    required this.content,
    required this.notifyMode,
    this.startsAt,
    this.endsAt,
    this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String notifyMode;
  @override
  final DateTime? startsAt;
  @override
  final DateTime? endsAt;
  @override
  final DateTime? readAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of Sub2ApiAnnouncement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiAnnouncementCopyWith<_Sub2ApiAnnouncement> get copyWith =>
      __$Sub2ApiAnnouncementCopyWithImpl<_Sub2ApiAnnouncement>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiAnnouncement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.notifyMode, notifyMode) ||
                other.notifyMode == notifyMode) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    content,
    notifyMode,
    startsAt,
    endsAt,
    readAt,
    createdAt,
    updatedAt,
  );

  @override
  String toString() {
    return 'Sub2ApiAnnouncement(id: $id, title: $title, content: $content, notifyMode: $notifyMode, startsAt: $startsAt, endsAt: $endsAt, readAt: $readAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiAnnouncementCopyWith<$Res>
    implements $Sub2ApiAnnouncementCopyWith<$Res> {
  factory _$Sub2ApiAnnouncementCopyWith(
    _Sub2ApiAnnouncement value,
    $Res Function(_Sub2ApiAnnouncement) _then,
  ) = __$Sub2ApiAnnouncementCopyWithImpl;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String content,
    String notifyMode,
    DateTime? startsAt,
    DateTime? endsAt,
    DateTime? readAt,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$Sub2ApiAnnouncementCopyWithImpl<$Res>
    implements _$Sub2ApiAnnouncementCopyWith<$Res> {
  __$Sub2ApiAnnouncementCopyWithImpl(this._self, this._then);

  final _Sub2ApiAnnouncement _self;
  final $Res Function(_Sub2ApiAnnouncement) _then;

  /// Create a copy of Sub2ApiAnnouncement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? notifyMode = null,
    Object? startsAt = freezed,
    Object? endsAt = freezed,
    Object? readAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _Sub2ApiAnnouncement(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _self.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        notifyMode: null == notifyMode
            ? _self.notifyMode
            : notifyMode // ignore: cast_nullable_to_non_nullable
                  as String,
        startsAt: freezed == startsAt
            ? _self.startsAt
            : startsAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endsAt: freezed == endsAt
            ? _self.endsAt
            : endsAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        readAt: freezed == readAt
            ? _self.readAt
            : readAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _self.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiCommerceGroupSummary {
  int get id;
  String get name;
  String get platform;
  String get subscriptionType;

  /// Create a copy of Sub2ApiCommerceGroupSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiCommerceGroupSummaryCopyWith<Sub2ApiCommerceGroupSummary>
  get copyWith =>
      _$Sub2ApiCommerceGroupSummaryCopyWithImpl<Sub2ApiCommerceGroupSummary>(
        this as Sub2ApiCommerceGroupSummary,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiCommerceGroupSummary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.subscriptionType, subscriptionType) ||
                other.subscriptionType == subscriptionType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, platform, subscriptionType);

  @override
  String toString() {
    return 'Sub2ApiCommerceGroupSummary(id: $id, name: $name, platform: $platform, subscriptionType: $subscriptionType)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiCommerceGroupSummaryCopyWith<$Res> {
  factory $Sub2ApiCommerceGroupSummaryCopyWith(
    Sub2ApiCommerceGroupSummary value,
    $Res Function(Sub2ApiCommerceGroupSummary) _then,
  ) = _$Sub2ApiCommerceGroupSummaryCopyWithImpl;
  @useResult
  $Res call({int id, String name, String platform, String subscriptionType});
}

/// @nodoc
class _$Sub2ApiCommerceGroupSummaryCopyWithImpl<$Res>
    implements $Sub2ApiCommerceGroupSummaryCopyWith<$Res> {
  _$Sub2ApiCommerceGroupSummaryCopyWithImpl(this._self, this._then);

  final Sub2ApiCommerceGroupSummary _self;
  final $Res Function(Sub2ApiCommerceGroupSummary) _then;

  /// Create a copy of Sub2ApiCommerceGroupSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? platform = null,
    Object? subscriptionType = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        subscriptionType: null == subscriptionType
            ? _self.subscriptionType
            : subscriptionType // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiCommerceGroupSummary].
extension Sub2ApiCommerceGroupSummaryPatterns on Sub2ApiCommerceGroupSummary {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiCommerceGroupSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiCommerceGroupSummary() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiCommerceGroupSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiCommerceGroupSummary():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiCommerceGroupSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiCommerceGroupSummary() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int id,
      String name,
      String platform,
      String subscriptionType,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiCommerceGroupSummary() when $default != null:
        return $default(
          _that.id,
          _that.name,
          _that.platform,
          _that.subscriptionType,
        );
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int id,
      String name,
      String platform,
      String subscriptionType,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiCommerceGroupSummary():
        return $default(
          _that.id,
          _that.name,
          _that.platform,
          _that.subscriptionType,
        );
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int id,
      String name,
      String platform,
      String subscriptionType,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiCommerceGroupSummary() when $default != null:
        return $default(
          _that.id,
          _that.name,
          _that.platform,
          _that.subscriptionType,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiCommerceGroupSummary implements Sub2ApiCommerceGroupSummary {
  const _Sub2ApiCommerceGroupSummary({
    required this.id,
    required this.name,
    required this.platform,
    required this.subscriptionType,
  });

  @override
  final int id;
  @override
  final String name;
  @override
  final String platform;
  @override
  final String subscriptionType;

  /// Create a copy of Sub2ApiCommerceGroupSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiCommerceGroupSummaryCopyWith<_Sub2ApiCommerceGroupSummary>
  get copyWith =>
      __$Sub2ApiCommerceGroupSummaryCopyWithImpl<_Sub2ApiCommerceGroupSummary>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiCommerceGroupSummary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.subscriptionType, subscriptionType) ||
                other.subscriptionType == subscriptionType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, platform, subscriptionType);

  @override
  String toString() {
    return 'Sub2ApiCommerceGroupSummary(id: $id, name: $name, platform: $platform, subscriptionType: $subscriptionType)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiCommerceGroupSummaryCopyWith<$Res>
    implements $Sub2ApiCommerceGroupSummaryCopyWith<$Res> {
  factory _$Sub2ApiCommerceGroupSummaryCopyWith(
    _Sub2ApiCommerceGroupSummary value,
    $Res Function(_Sub2ApiCommerceGroupSummary) _then,
  ) = __$Sub2ApiCommerceGroupSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, String platform, String subscriptionType});
}

/// @nodoc
class __$Sub2ApiCommerceGroupSummaryCopyWithImpl<$Res>
    implements _$Sub2ApiCommerceGroupSummaryCopyWith<$Res> {
  __$Sub2ApiCommerceGroupSummaryCopyWithImpl(this._self, this._then);

  final _Sub2ApiCommerceGroupSummary _self;
  final $Res Function(_Sub2ApiCommerceGroupSummary) _then;

  /// Create a copy of Sub2ApiCommerceGroupSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? platform = null,
    Object? subscriptionType = null,
  }) {
    return _then(
      _Sub2ApiCommerceGroupSummary(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        subscriptionType: null == subscriptionType
            ? _self.subscriptionType
            : subscriptionType // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiRedeemRecord {
  int get id;
  String get code;
  String get type;
  Sub2ApiDecimal get value;
  String get status;
  int? get usedBy;
  DateTime? get usedAt;
  DateTime get createdAt;
  DateTime? get expiresAt;
  int? get groupId;
  int get validityDays;
  String? get notes;
  Sub2ApiCommerceGroupSummary? get group;

  /// Create a copy of Sub2ApiRedeemRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiRedeemRecordCopyWith<Sub2ApiRedeemRecord> get copyWith =>
      _$Sub2ApiRedeemRecordCopyWithImpl<Sub2ApiRedeemRecord>(
        this as Sub2ApiRedeemRecord,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiRedeemRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.usedBy, usedBy) || other.usedBy == usedBy) &&
            (identical(other.usedAt, usedAt) || other.usedAt == usedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.validityDays, validityDays) ||
                other.validityDays == validityDays) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    type,
    value,
    status,
    usedBy,
    usedAt,
    createdAt,
    expiresAt,
    groupId,
    validityDays,
    notes,
    group,
  );

  @override
  String toString() {
    return 'Sub2ApiRedeemRecord(id: $id, code: $code, type: $type, value: $value, status: $status, usedBy: $usedBy, usedAt: $usedAt, createdAt: $createdAt, expiresAt: $expiresAt, groupId: $groupId, validityDays: $validityDays, notes: $notes, group: $group)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiRedeemRecordCopyWith<$Res> {
  factory $Sub2ApiRedeemRecordCopyWith(
    Sub2ApiRedeemRecord value,
    $Res Function(Sub2ApiRedeemRecord) _then,
  ) = _$Sub2ApiRedeemRecordCopyWithImpl;
  @useResult
  $Res call({
    int id,
    String code,
    String type,
    Sub2ApiDecimal value,
    String status,
    int? usedBy,
    DateTime? usedAt,
    DateTime createdAt,
    DateTime? expiresAt,
    int? groupId,
    int validityDays,
    String? notes,
    Sub2ApiCommerceGroupSummary? group,
  });

  $Sub2ApiCommerceGroupSummaryCopyWith<$Res>? get group;
}

/// @nodoc
class _$Sub2ApiRedeemRecordCopyWithImpl<$Res>
    implements $Sub2ApiRedeemRecordCopyWith<$Res> {
  _$Sub2ApiRedeemRecordCopyWithImpl(this._self, this._then);

  final Sub2ApiRedeemRecord _self;
  final $Res Function(Sub2ApiRedeemRecord) _then;

  /// Create a copy of Sub2ApiRedeemRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? type = null,
    Object? value = null,
    Object? status = null,
    Object? usedBy = freezed,
    Object? usedAt = freezed,
    Object? createdAt = null,
    Object? expiresAt = freezed,
    Object? groupId = freezed,
    Object? validityDays = null,
    Object? notes = freezed,
    Object? group = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _self.value
            : value // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        usedBy: freezed == usedBy
            ? _self.usedBy
            : usedBy // ignore: cast_nullable_to_non_nullable
                  as int?,
        usedAt: freezed == usedAt
            ? _self.usedAt
            : usedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expiresAt: freezed == expiresAt
            ? _self.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        groupId: freezed == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int?,
        validityDays: null == validityDays
            ? _self.validityDays
            : validityDays // ignore: cast_nullable_to_non_nullable
                  as int,
        notes: freezed == notes
            ? _self.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        group: freezed == group
            ? _self.group
            : group // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiCommerceGroupSummary?,
      ),
    );
  }

  /// Create a copy of Sub2ApiRedeemRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiCommerceGroupSummaryCopyWith<$Res>? get group {
    if (_self.group == null) {
      return null;
    }

    return $Sub2ApiCommerceGroupSummaryCopyWith<$Res>(_self.group!, (value) {
      return _then(_self.copyWith(group: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiRedeemRecord].
extension Sub2ApiRedeemRecordPatterns on Sub2ApiRedeemRecord {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiRedeemRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiRedeemRecord() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiRedeemRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiRedeemRecord():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiRedeemRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiRedeemRecord() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int id,
      String code,
      String type,
      Sub2ApiDecimal value,
      String status,
      int? usedBy,
      DateTime? usedAt,
      DateTime createdAt,
      DateTime? expiresAt,
      int? groupId,
      int validityDays,
      String? notes,
      Sub2ApiCommerceGroupSummary? group,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiRedeemRecord() when $default != null:
        return $default(
          _that.id,
          _that.code,
          _that.type,
          _that.value,
          _that.status,
          _that.usedBy,
          _that.usedAt,
          _that.createdAt,
          _that.expiresAt,
          _that.groupId,
          _that.validityDays,
          _that.notes,
          _that.group,
        );
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int id,
      String code,
      String type,
      Sub2ApiDecimal value,
      String status,
      int? usedBy,
      DateTime? usedAt,
      DateTime createdAt,
      DateTime? expiresAt,
      int? groupId,
      int validityDays,
      String? notes,
      Sub2ApiCommerceGroupSummary? group,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiRedeemRecord():
        return $default(
          _that.id,
          _that.code,
          _that.type,
          _that.value,
          _that.status,
          _that.usedBy,
          _that.usedAt,
          _that.createdAt,
          _that.expiresAt,
          _that.groupId,
          _that.validityDays,
          _that.notes,
          _that.group,
        );
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int id,
      String code,
      String type,
      Sub2ApiDecimal value,
      String status,
      int? usedBy,
      DateTime? usedAt,
      DateTime createdAt,
      DateTime? expiresAt,
      int? groupId,
      int validityDays,
      String? notes,
      Sub2ApiCommerceGroupSummary? group,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiRedeemRecord() when $default != null:
        return $default(
          _that.id,
          _that.code,
          _that.type,
          _that.value,
          _that.status,
          _that.usedBy,
          _that.usedAt,
          _that.createdAt,
          _that.expiresAt,
          _that.groupId,
          _that.validityDays,
          _that.notes,
          _that.group,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiRedeemRecord implements Sub2ApiRedeemRecord {
  const _Sub2ApiRedeemRecord({
    required this.id,
    required this.code,
    required this.type,
    required this.value,
    required this.status,
    this.usedBy,
    this.usedAt,
    required this.createdAt,
    this.expiresAt,
    this.groupId,
    required this.validityDays,
    this.notes,
    this.group,
  });

  @override
  final int id;
  @override
  final String code;
  @override
  final String type;
  @override
  final Sub2ApiDecimal value;
  @override
  final String status;
  @override
  final int? usedBy;
  @override
  final DateTime? usedAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime? expiresAt;
  @override
  final int? groupId;
  @override
  final int validityDays;
  @override
  final String? notes;
  @override
  final Sub2ApiCommerceGroupSummary? group;

  /// Create a copy of Sub2ApiRedeemRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiRedeemRecordCopyWith<_Sub2ApiRedeemRecord> get copyWith =>
      __$Sub2ApiRedeemRecordCopyWithImpl<_Sub2ApiRedeemRecord>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiRedeemRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.usedBy, usedBy) || other.usedBy == usedBy) &&
            (identical(other.usedAt, usedAt) || other.usedAt == usedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.validityDays, validityDays) ||
                other.validityDays == validityDays) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    type,
    value,
    status,
    usedBy,
    usedAt,
    createdAt,
    expiresAt,
    groupId,
    validityDays,
    notes,
    group,
  );

  @override
  String toString() {
    return 'Sub2ApiRedeemRecord(id: $id, code: $code, type: $type, value: $value, status: $status, usedBy: $usedBy, usedAt: $usedAt, createdAt: $createdAt, expiresAt: $expiresAt, groupId: $groupId, validityDays: $validityDays, notes: $notes, group: $group)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiRedeemRecordCopyWith<$Res>
    implements $Sub2ApiRedeemRecordCopyWith<$Res> {
  factory _$Sub2ApiRedeemRecordCopyWith(
    _Sub2ApiRedeemRecord value,
    $Res Function(_Sub2ApiRedeemRecord) _then,
  ) = __$Sub2ApiRedeemRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    int id,
    String code,
    String type,
    Sub2ApiDecimal value,
    String status,
    int? usedBy,
    DateTime? usedAt,
    DateTime createdAt,
    DateTime? expiresAt,
    int? groupId,
    int validityDays,
    String? notes,
    Sub2ApiCommerceGroupSummary? group,
  });

  @override
  $Sub2ApiCommerceGroupSummaryCopyWith<$Res>? get group;
}

/// @nodoc
class __$Sub2ApiRedeemRecordCopyWithImpl<$Res>
    implements _$Sub2ApiRedeemRecordCopyWith<$Res> {
  __$Sub2ApiRedeemRecordCopyWithImpl(this._self, this._then);

  final _Sub2ApiRedeemRecord _self;
  final $Res Function(_Sub2ApiRedeemRecord) _then;

  /// Create a copy of Sub2ApiRedeemRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? type = null,
    Object? value = null,
    Object? status = null,
    Object? usedBy = freezed,
    Object? usedAt = freezed,
    Object? createdAt = null,
    Object? expiresAt = freezed,
    Object? groupId = freezed,
    Object? validityDays = null,
    Object? notes = freezed,
    Object? group = freezed,
  }) {
    return _then(
      _Sub2ApiRedeemRecord(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _self.value
            : value // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        usedBy: freezed == usedBy
            ? _self.usedBy
            : usedBy // ignore: cast_nullable_to_non_nullable
                  as int?,
        usedAt: freezed == usedAt
            ? _self.usedAt
            : usedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expiresAt: freezed == expiresAt
            ? _self.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        groupId: freezed == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int?,
        validityDays: null == validityDays
            ? _self.validityDays
            : validityDays // ignore: cast_nullable_to_non_nullable
                  as int,
        notes: freezed == notes
            ? _self.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        group: freezed == group
            ? _self.group
            : group // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiCommerceGroupSummary?,
      ),
    );
  }

  /// Create a copy of Sub2ApiRedeemRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiCommerceGroupSummaryCopyWith<$Res>? get group {
    if (_self.group == null) {
      return null;
    }

    return $Sub2ApiCommerceGroupSummaryCopyWith<$Res>(_self.group!, (value) {
      return _then(_self.copyWith(group: value));
    });
  }
}

/// @nodoc
mixin _$Sub2ApiUserSubscription {
  int get id;
  int get userId;
  int get groupId;
  DateTime get startsAt;
  DateTime get expiresAt;
  String get status;
  DateTime? get dailyWindowStart;
  DateTime? get weeklyWindowStart;
  DateTime? get monthlyWindowStart;
  Sub2ApiDecimal get dailyUsageUsd;
  Sub2ApiDecimal get weeklyUsageUsd;
  Sub2ApiDecimal get monthlyUsageUsd;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get revokedAt;
  Sub2ApiCommerceGroupSummary? get group;

  /// Create a copy of Sub2ApiUserSubscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUserSubscriptionCopyWith<Sub2ApiUserSubscription> get copyWith =>
      _$Sub2ApiUserSubscriptionCopyWithImpl<Sub2ApiUserSubscription>(
        this as Sub2ApiUserSubscription,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUserSubscription &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dailyWindowStart, dailyWindowStart) ||
                other.dailyWindowStart == dailyWindowStart) &&
            (identical(other.weeklyWindowStart, weeklyWindowStart) ||
                other.weeklyWindowStart == weeklyWindowStart) &&
            (identical(other.monthlyWindowStart, monthlyWindowStart) ||
                other.monthlyWindowStart == monthlyWindowStart) &&
            (identical(other.dailyUsageUsd, dailyUsageUsd) ||
                other.dailyUsageUsd == dailyUsageUsd) &&
            (identical(other.weeklyUsageUsd, weeklyUsageUsd) ||
                other.weeklyUsageUsd == weeklyUsageUsd) &&
            (identical(other.monthlyUsageUsd, monthlyUsageUsd) ||
                other.monthlyUsageUsd == monthlyUsageUsd) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.revokedAt, revokedAt) ||
                other.revokedAt == revokedAt) &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    groupId,
    startsAt,
    expiresAt,
    status,
    dailyWindowStart,
    weeklyWindowStart,
    monthlyWindowStart,
    dailyUsageUsd,
    weeklyUsageUsd,
    monthlyUsageUsd,
    createdAt,
    updatedAt,
    revokedAt,
    group,
  );

  @override
  String toString() {
    return 'Sub2ApiUserSubscription(id: $id, userId: $userId, groupId: $groupId, startsAt: $startsAt, expiresAt: $expiresAt, status: $status, dailyWindowStart: $dailyWindowStart, weeklyWindowStart: $weeklyWindowStart, monthlyWindowStart: $monthlyWindowStart, dailyUsageUsd: $dailyUsageUsd, weeklyUsageUsd: $weeklyUsageUsd, monthlyUsageUsd: $monthlyUsageUsd, createdAt: $createdAt, updatedAt: $updatedAt, revokedAt: $revokedAt, group: $group)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUserSubscriptionCopyWith<$Res> {
  factory $Sub2ApiUserSubscriptionCopyWith(
    Sub2ApiUserSubscription value,
    $Res Function(Sub2ApiUserSubscription) _then,
  ) = _$Sub2ApiUserSubscriptionCopyWithImpl;
  @useResult
  $Res call({
    int id,
    int userId,
    int groupId,
    DateTime startsAt,
    DateTime expiresAt,
    String status,
    DateTime? dailyWindowStart,
    DateTime? weeklyWindowStart,
    DateTime? monthlyWindowStart,
    Sub2ApiDecimal dailyUsageUsd,
    Sub2ApiDecimal weeklyUsageUsd,
    Sub2ApiDecimal monthlyUsageUsd,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? revokedAt,
    Sub2ApiCommerceGroupSummary? group,
  });

  $Sub2ApiCommerceGroupSummaryCopyWith<$Res>? get group;
}

/// @nodoc
class _$Sub2ApiUserSubscriptionCopyWithImpl<$Res>
    implements $Sub2ApiUserSubscriptionCopyWith<$Res> {
  _$Sub2ApiUserSubscriptionCopyWithImpl(this._self, this._then);

  final Sub2ApiUserSubscription _self;
  final $Res Function(Sub2ApiUserSubscription) _then;

  /// Create a copy of Sub2ApiUserSubscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? groupId = null,
    Object? startsAt = null,
    Object? expiresAt = null,
    Object? status = null,
    Object? dailyWindowStart = freezed,
    Object? weeklyWindowStart = freezed,
    Object? monthlyWindowStart = freezed,
    Object? dailyUsageUsd = null,
    Object? weeklyUsageUsd = null,
    Object? monthlyUsageUsd = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? revokedAt = freezed,
    Object? group = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _self.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int,
        startsAt: null == startsAt
            ? _self.startsAt
            : startsAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expiresAt: null == expiresAt
            ? _self.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        dailyWindowStart: freezed == dailyWindowStart
            ? _self.dailyWindowStart
            : dailyWindowStart // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        weeklyWindowStart: freezed == weeklyWindowStart
            ? _self.weeklyWindowStart
            : weeklyWindowStart // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        monthlyWindowStart: freezed == monthlyWindowStart
            ? _self.monthlyWindowStart
            : monthlyWindowStart // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        dailyUsageUsd: null == dailyUsageUsd
            ? _self.dailyUsageUsd
            : dailyUsageUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        weeklyUsageUsd: null == weeklyUsageUsd
            ? _self.weeklyUsageUsd
            : weeklyUsageUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        monthlyUsageUsd: null == monthlyUsageUsd
            ? _self.monthlyUsageUsd
            : monthlyUsageUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _self.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        revokedAt: freezed == revokedAt
            ? _self.revokedAt
            : revokedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        group: freezed == group
            ? _self.group
            : group // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiCommerceGroupSummary?,
      ),
    );
  }

  /// Create a copy of Sub2ApiUserSubscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiCommerceGroupSummaryCopyWith<$Res>? get group {
    if (_self.group == null) {
      return null;
    }

    return $Sub2ApiCommerceGroupSummaryCopyWith<$Res>(_self.group!, (value) {
      return _then(_self.copyWith(group: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUserSubscription].
extension Sub2ApiUserSubscriptionPatterns on Sub2ApiUserSubscription {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiUserSubscription value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserSubscription() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiUserSubscription value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserSubscription():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiUserSubscription value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserSubscription() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int id,
      int userId,
      int groupId,
      DateTime startsAt,
      DateTime expiresAt,
      String status,
      DateTime? dailyWindowStart,
      DateTime? weeklyWindowStart,
      DateTime? monthlyWindowStart,
      Sub2ApiDecimal dailyUsageUsd,
      Sub2ApiDecimal weeklyUsageUsd,
      Sub2ApiDecimal monthlyUsageUsd,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? revokedAt,
      Sub2ApiCommerceGroupSummary? group,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserSubscription() when $default != null:
        return $default(
          _that.id,
          _that.userId,
          _that.groupId,
          _that.startsAt,
          _that.expiresAt,
          _that.status,
          _that.dailyWindowStart,
          _that.weeklyWindowStart,
          _that.monthlyWindowStart,
          _that.dailyUsageUsd,
          _that.weeklyUsageUsd,
          _that.monthlyUsageUsd,
          _that.createdAt,
          _that.updatedAt,
          _that.revokedAt,
          _that.group,
        );
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int id,
      int userId,
      int groupId,
      DateTime startsAt,
      DateTime expiresAt,
      String status,
      DateTime? dailyWindowStart,
      DateTime? weeklyWindowStart,
      DateTime? monthlyWindowStart,
      Sub2ApiDecimal dailyUsageUsd,
      Sub2ApiDecimal weeklyUsageUsd,
      Sub2ApiDecimal monthlyUsageUsd,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? revokedAt,
      Sub2ApiCommerceGroupSummary? group,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserSubscription():
        return $default(
          _that.id,
          _that.userId,
          _that.groupId,
          _that.startsAt,
          _that.expiresAt,
          _that.status,
          _that.dailyWindowStart,
          _that.weeklyWindowStart,
          _that.monthlyWindowStart,
          _that.dailyUsageUsd,
          _that.weeklyUsageUsd,
          _that.monthlyUsageUsd,
          _that.createdAt,
          _that.updatedAt,
          _that.revokedAt,
          _that.group,
        );
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int id,
      int userId,
      int groupId,
      DateTime startsAt,
      DateTime expiresAt,
      String status,
      DateTime? dailyWindowStart,
      DateTime? weeklyWindowStart,
      DateTime? monthlyWindowStart,
      Sub2ApiDecimal dailyUsageUsd,
      Sub2ApiDecimal weeklyUsageUsd,
      Sub2ApiDecimal monthlyUsageUsd,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? revokedAt,
      Sub2ApiCommerceGroupSummary? group,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserSubscription() when $default != null:
        return $default(
          _that.id,
          _that.userId,
          _that.groupId,
          _that.startsAt,
          _that.expiresAt,
          _that.status,
          _that.dailyWindowStart,
          _that.weeklyWindowStart,
          _that.monthlyWindowStart,
          _that.dailyUsageUsd,
          _that.weeklyUsageUsd,
          _that.monthlyUsageUsd,
          _that.createdAt,
          _that.updatedAt,
          _that.revokedAt,
          _that.group,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUserSubscription implements Sub2ApiUserSubscription {
  const _Sub2ApiUserSubscription({
    required this.id,
    required this.userId,
    required this.groupId,
    required this.startsAt,
    required this.expiresAt,
    required this.status,
    this.dailyWindowStart,
    this.weeklyWindowStart,
    this.monthlyWindowStart,
    required this.dailyUsageUsd,
    required this.weeklyUsageUsd,
    required this.monthlyUsageUsd,
    required this.createdAt,
    required this.updatedAt,
    this.revokedAt,
    this.group,
  });

  @override
  final int id;
  @override
  final int userId;
  @override
  final int groupId;
  @override
  final DateTime startsAt;
  @override
  final DateTime expiresAt;
  @override
  final String status;
  @override
  final DateTime? dailyWindowStart;
  @override
  final DateTime? weeklyWindowStart;
  @override
  final DateTime? monthlyWindowStart;
  @override
  final Sub2ApiDecimal dailyUsageUsd;
  @override
  final Sub2ApiDecimal weeklyUsageUsd;
  @override
  final Sub2ApiDecimal monthlyUsageUsd;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? revokedAt;
  @override
  final Sub2ApiCommerceGroupSummary? group;

  /// Create a copy of Sub2ApiUserSubscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUserSubscriptionCopyWith<_Sub2ApiUserSubscription> get copyWith =>
      __$Sub2ApiUserSubscriptionCopyWithImpl<_Sub2ApiUserSubscription>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUserSubscription &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dailyWindowStart, dailyWindowStart) ||
                other.dailyWindowStart == dailyWindowStart) &&
            (identical(other.weeklyWindowStart, weeklyWindowStart) ||
                other.weeklyWindowStart == weeklyWindowStart) &&
            (identical(other.monthlyWindowStart, monthlyWindowStart) ||
                other.monthlyWindowStart == monthlyWindowStart) &&
            (identical(other.dailyUsageUsd, dailyUsageUsd) ||
                other.dailyUsageUsd == dailyUsageUsd) &&
            (identical(other.weeklyUsageUsd, weeklyUsageUsd) ||
                other.weeklyUsageUsd == weeklyUsageUsd) &&
            (identical(other.monthlyUsageUsd, monthlyUsageUsd) ||
                other.monthlyUsageUsd == monthlyUsageUsd) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.revokedAt, revokedAt) ||
                other.revokedAt == revokedAt) &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    groupId,
    startsAt,
    expiresAt,
    status,
    dailyWindowStart,
    weeklyWindowStart,
    monthlyWindowStart,
    dailyUsageUsd,
    weeklyUsageUsd,
    monthlyUsageUsd,
    createdAt,
    updatedAt,
    revokedAt,
    group,
  );

  @override
  String toString() {
    return 'Sub2ApiUserSubscription(id: $id, userId: $userId, groupId: $groupId, startsAt: $startsAt, expiresAt: $expiresAt, status: $status, dailyWindowStart: $dailyWindowStart, weeklyWindowStart: $weeklyWindowStart, monthlyWindowStart: $monthlyWindowStart, dailyUsageUsd: $dailyUsageUsd, weeklyUsageUsd: $weeklyUsageUsd, monthlyUsageUsd: $monthlyUsageUsd, createdAt: $createdAt, updatedAt: $updatedAt, revokedAt: $revokedAt, group: $group)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUserSubscriptionCopyWith<$Res>
    implements $Sub2ApiUserSubscriptionCopyWith<$Res> {
  factory _$Sub2ApiUserSubscriptionCopyWith(
    _Sub2ApiUserSubscription value,
    $Res Function(_Sub2ApiUserSubscription) _then,
  ) = __$Sub2ApiUserSubscriptionCopyWithImpl;
  @override
  @useResult
  $Res call({
    int id,
    int userId,
    int groupId,
    DateTime startsAt,
    DateTime expiresAt,
    String status,
    DateTime? dailyWindowStart,
    DateTime? weeklyWindowStart,
    DateTime? monthlyWindowStart,
    Sub2ApiDecimal dailyUsageUsd,
    Sub2ApiDecimal weeklyUsageUsd,
    Sub2ApiDecimal monthlyUsageUsd,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? revokedAt,
    Sub2ApiCommerceGroupSummary? group,
  });

  @override
  $Sub2ApiCommerceGroupSummaryCopyWith<$Res>? get group;
}

/// @nodoc
class __$Sub2ApiUserSubscriptionCopyWithImpl<$Res>
    implements _$Sub2ApiUserSubscriptionCopyWith<$Res> {
  __$Sub2ApiUserSubscriptionCopyWithImpl(this._self, this._then);

  final _Sub2ApiUserSubscription _self;
  final $Res Function(_Sub2ApiUserSubscription) _then;

  /// Create a copy of Sub2ApiUserSubscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? groupId = null,
    Object? startsAt = null,
    Object? expiresAt = null,
    Object? status = null,
    Object? dailyWindowStart = freezed,
    Object? weeklyWindowStart = freezed,
    Object? monthlyWindowStart = freezed,
    Object? dailyUsageUsd = null,
    Object? weeklyUsageUsd = null,
    Object? monthlyUsageUsd = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? revokedAt = freezed,
    Object? group = freezed,
  }) {
    return _then(
      _Sub2ApiUserSubscription(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _self.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int,
        startsAt: null == startsAt
            ? _self.startsAt
            : startsAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expiresAt: null == expiresAt
            ? _self.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        dailyWindowStart: freezed == dailyWindowStart
            ? _self.dailyWindowStart
            : dailyWindowStart // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        weeklyWindowStart: freezed == weeklyWindowStart
            ? _self.weeklyWindowStart
            : weeklyWindowStart // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        monthlyWindowStart: freezed == monthlyWindowStart
            ? _self.monthlyWindowStart
            : monthlyWindowStart // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        dailyUsageUsd: null == dailyUsageUsd
            ? _self.dailyUsageUsd
            : dailyUsageUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        weeklyUsageUsd: null == weeklyUsageUsd
            ? _self.weeklyUsageUsd
            : weeklyUsageUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        monthlyUsageUsd: null == monthlyUsageUsd
            ? _self.monthlyUsageUsd
            : monthlyUsageUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _self.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        revokedAt: freezed == revokedAt
            ? _self.revokedAt
            : revokedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        group: freezed == group
            ? _self.group
            : group // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiCommerceGroupSummary?,
      ),
    );
  }

  /// Create a copy of Sub2ApiUserSubscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiCommerceGroupSummaryCopyWith<$Res>? get group {
    if (_self.group == null) {
      return null;
    }

    return $Sub2ApiCommerceGroupSummaryCopyWith<$Res>(_self.group!, (value) {
      return _then(_self.copyWith(group: value));
    });
  }
}

/// @nodoc
mixin _$Sub2ApiSubscriptionUsageWindow {
  Sub2ApiDecimal get limitUsd;
  Sub2ApiDecimal get usedUsd;
  Sub2ApiDecimal get remainingUsd;
  Sub2ApiDecimal get percentage;
  DateTime get windowStart;
  DateTime get resetsAt;
  int get resetsInSeconds;

  /// Create a copy of Sub2ApiSubscriptionUsageWindow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiSubscriptionUsageWindowCopyWith<Sub2ApiSubscriptionUsageWindow>
  get copyWith =>
      _$Sub2ApiSubscriptionUsageWindowCopyWithImpl<
        Sub2ApiSubscriptionUsageWindow
      >(this as Sub2ApiSubscriptionUsageWindow, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiSubscriptionUsageWindow &&
            (identical(other.limitUsd, limitUsd) ||
                other.limitUsd == limitUsd) &&
            (identical(other.usedUsd, usedUsd) || other.usedUsd == usedUsd) &&
            (identical(other.remainingUsd, remainingUsd) ||
                other.remainingUsd == remainingUsd) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.windowStart, windowStart) ||
                other.windowStart == windowStart) &&
            (identical(other.resetsAt, resetsAt) ||
                other.resetsAt == resetsAt) &&
            (identical(other.resetsInSeconds, resetsInSeconds) ||
                other.resetsInSeconds == resetsInSeconds));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    limitUsd,
    usedUsd,
    remainingUsd,
    percentage,
    windowStart,
    resetsAt,
    resetsInSeconds,
  );

  @override
  String toString() {
    return 'Sub2ApiSubscriptionUsageWindow(limitUsd: $limitUsd, usedUsd: $usedUsd, remainingUsd: $remainingUsd, percentage: $percentage, windowStart: $windowStart, resetsAt: $resetsAt, resetsInSeconds: $resetsInSeconds)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiSubscriptionUsageWindowCopyWith<$Res> {
  factory $Sub2ApiSubscriptionUsageWindowCopyWith(
    Sub2ApiSubscriptionUsageWindow value,
    $Res Function(Sub2ApiSubscriptionUsageWindow) _then,
  ) = _$Sub2ApiSubscriptionUsageWindowCopyWithImpl;
  @useResult
  $Res call({
    Sub2ApiDecimal limitUsd,
    Sub2ApiDecimal usedUsd,
    Sub2ApiDecimal remainingUsd,
    Sub2ApiDecimal percentage,
    DateTime windowStart,
    DateTime resetsAt,
    int resetsInSeconds,
  });
}

/// @nodoc
class _$Sub2ApiSubscriptionUsageWindowCopyWithImpl<$Res>
    implements $Sub2ApiSubscriptionUsageWindowCopyWith<$Res> {
  _$Sub2ApiSubscriptionUsageWindowCopyWithImpl(this._self, this._then);

  final Sub2ApiSubscriptionUsageWindow _self;
  final $Res Function(Sub2ApiSubscriptionUsageWindow) _then;

  /// Create a copy of Sub2ApiSubscriptionUsageWindow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limitUsd = null,
    Object? usedUsd = null,
    Object? remainingUsd = null,
    Object? percentage = null,
    Object? windowStart = null,
    Object? resetsAt = null,
    Object? resetsInSeconds = null,
  }) {
    return _then(
      _self.copyWith(
        limitUsd: null == limitUsd
            ? _self.limitUsd
            : limitUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        usedUsd: null == usedUsd
            ? _self.usedUsd
            : usedUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        remainingUsd: null == remainingUsd
            ? _self.remainingUsd
            : remainingUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        percentage: null == percentage
            ? _self.percentage
            : percentage // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        windowStart: null == windowStart
            ? _self.windowStart
            : windowStart // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        resetsAt: null == resetsAt
            ? _self.resetsAt
            : resetsAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        resetsInSeconds: null == resetsInSeconds
            ? _self.resetsInSeconds
            : resetsInSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiSubscriptionUsageWindow].
extension Sub2ApiSubscriptionUsageWindowPatterns
    on Sub2ApiSubscriptionUsageWindow {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiSubscriptionUsageWindow value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionUsageWindow() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiSubscriptionUsageWindow value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionUsageWindow():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiSubscriptionUsageWindow value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionUsageWindow() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      Sub2ApiDecimal limitUsd,
      Sub2ApiDecimal usedUsd,
      Sub2ApiDecimal remainingUsd,
      Sub2ApiDecimal percentage,
      DateTime windowStart,
      DateTime resetsAt,
      int resetsInSeconds,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionUsageWindow() when $default != null:
        return $default(
          _that.limitUsd,
          _that.usedUsd,
          _that.remainingUsd,
          _that.percentage,
          _that.windowStart,
          _that.resetsAt,
          _that.resetsInSeconds,
        );
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      Sub2ApiDecimal limitUsd,
      Sub2ApiDecimal usedUsd,
      Sub2ApiDecimal remainingUsd,
      Sub2ApiDecimal percentage,
      DateTime windowStart,
      DateTime resetsAt,
      int resetsInSeconds,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionUsageWindow():
        return $default(
          _that.limitUsd,
          _that.usedUsd,
          _that.remainingUsd,
          _that.percentage,
          _that.windowStart,
          _that.resetsAt,
          _that.resetsInSeconds,
        );
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      Sub2ApiDecimal limitUsd,
      Sub2ApiDecimal usedUsd,
      Sub2ApiDecimal remainingUsd,
      Sub2ApiDecimal percentage,
      DateTime windowStart,
      DateTime resetsAt,
      int resetsInSeconds,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionUsageWindow() when $default != null:
        return $default(
          _that.limitUsd,
          _that.usedUsd,
          _that.remainingUsd,
          _that.percentage,
          _that.windowStart,
          _that.resetsAt,
          _that.resetsInSeconds,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiSubscriptionUsageWindow
    implements Sub2ApiSubscriptionUsageWindow {
  const _Sub2ApiSubscriptionUsageWindow({
    required this.limitUsd,
    required this.usedUsd,
    required this.remainingUsd,
    required this.percentage,
    required this.windowStart,
    required this.resetsAt,
    required this.resetsInSeconds,
  });

  @override
  final Sub2ApiDecimal limitUsd;
  @override
  final Sub2ApiDecimal usedUsd;
  @override
  final Sub2ApiDecimal remainingUsd;
  @override
  final Sub2ApiDecimal percentage;
  @override
  final DateTime windowStart;
  @override
  final DateTime resetsAt;
  @override
  final int resetsInSeconds;

  /// Create a copy of Sub2ApiSubscriptionUsageWindow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiSubscriptionUsageWindowCopyWith<_Sub2ApiSubscriptionUsageWindow>
  get copyWith =>
      __$Sub2ApiSubscriptionUsageWindowCopyWithImpl<
        _Sub2ApiSubscriptionUsageWindow
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiSubscriptionUsageWindow &&
            (identical(other.limitUsd, limitUsd) ||
                other.limitUsd == limitUsd) &&
            (identical(other.usedUsd, usedUsd) || other.usedUsd == usedUsd) &&
            (identical(other.remainingUsd, remainingUsd) ||
                other.remainingUsd == remainingUsd) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.windowStart, windowStart) ||
                other.windowStart == windowStart) &&
            (identical(other.resetsAt, resetsAt) ||
                other.resetsAt == resetsAt) &&
            (identical(other.resetsInSeconds, resetsInSeconds) ||
                other.resetsInSeconds == resetsInSeconds));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    limitUsd,
    usedUsd,
    remainingUsd,
    percentage,
    windowStart,
    resetsAt,
    resetsInSeconds,
  );

  @override
  String toString() {
    return 'Sub2ApiSubscriptionUsageWindow(limitUsd: $limitUsd, usedUsd: $usedUsd, remainingUsd: $remainingUsd, percentage: $percentage, windowStart: $windowStart, resetsAt: $resetsAt, resetsInSeconds: $resetsInSeconds)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiSubscriptionUsageWindowCopyWith<$Res>
    implements $Sub2ApiSubscriptionUsageWindowCopyWith<$Res> {
  factory _$Sub2ApiSubscriptionUsageWindowCopyWith(
    _Sub2ApiSubscriptionUsageWindow value,
    $Res Function(_Sub2ApiSubscriptionUsageWindow) _then,
  ) = __$Sub2ApiSubscriptionUsageWindowCopyWithImpl;
  @override
  @useResult
  $Res call({
    Sub2ApiDecimal limitUsd,
    Sub2ApiDecimal usedUsd,
    Sub2ApiDecimal remainingUsd,
    Sub2ApiDecimal percentage,
    DateTime windowStart,
    DateTime resetsAt,
    int resetsInSeconds,
  });
}

/// @nodoc
class __$Sub2ApiSubscriptionUsageWindowCopyWithImpl<$Res>
    implements _$Sub2ApiSubscriptionUsageWindowCopyWith<$Res> {
  __$Sub2ApiSubscriptionUsageWindowCopyWithImpl(this._self, this._then);

  final _Sub2ApiSubscriptionUsageWindow _self;
  final $Res Function(_Sub2ApiSubscriptionUsageWindow) _then;

  /// Create a copy of Sub2ApiSubscriptionUsageWindow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? limitUsd = null,
    Object? usedUsd = null,
    Object? remainingUsd = null,
    Object? percentage = null,
    Object? windowStart = null,
    Object? resetsAt = null,
    Object? resetsInSeconds = null,
  }) {
    return _then(
      _Sub2ApiSubscriptionUsageWindow(
        limitUsd: null == limitUsd
            ? _self.limitUsd
            : limitUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        usedUsd: null == usedUsd
            ? _self.usedUsd
            : usedUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        remainingUsd: null == remainingUsd
            ? _self.remainingUsd
            : remainingUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        percentage: null == percentage
            ? _self.percentage
            : percentage // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        windowStart: null == windowStart
            ? _self.windowStart
            : windowStart // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        resetsAt: null == resetsAt
            ? _self.resetsAt
            : resetsAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        resetsInSeconds: null == resetsInSeconds
            ? _self.resetsInSeconds
            : resetsInSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiSubscriptionProgress {
  int get id;
  String get groupName;
  DateTime get expiresAt;
  int get expiresInDays;
  Sub2ApiSubscriptionUsageWindow? get daily;
  Sub2ApiSubscriptionUsageWindow? get weekly;
  Sub2ApiSubscriptionUsageWindow? get monthly;

  /// Create a copy of Sub2ApiSubscriptionProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiSubscriptionProgressCopyWith<Sub2ApiSubscriptionProgress>
  get copyWith =>
      _$Sub2ApiSubscriptionProgressCopyWithImpl<Sub2ApiSubscriptionProgress>(
        this as Sub2ApiSubscriptionProgress,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiSubscriptionProgress &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.expiresInDays, expiresInDays) ||
                other.expiresInDays == expiresInDays) &&
            (identical(other.daily, daily) || other.daily == daily) &&
            (identical(other.weekly, weekly) || other.weekly == weekly) &&
            (identical(other.monthly, monthly) || other.monthly == monthly));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    groupName,
    expiresAt,
    expiresInDays,
    daily,
    weekly,
    monthly,
  );

  @override
  String toString() {
    return 'Sub2ApiSubscriptionProgress(id: $id, groupName: $groupName, expiresAt: $expiresAt, expiresInDays: $expiresInDays, daily: $daily, weekly: $weekly, monthly: $monthly)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiSubscriptionProgressCopyWith<$Res> {
  factory $Sub2ApiSubscriptionProgressCopyWith(
    Sub2ApiSubscriptionProgress value,
    $Res Function(Sub2ApiSubscriptionProgress) _then,
  ) = _$Sub2ApiSubscriptionProgressCopyWithImpl;
  @useResult
  $Res call({
    int id,
    String groupName,
    DateTime expiresAt,
    int expiresInDays,
    Sub2ApiSubscriptionUsageWindow? daily,
    Sub2ApiSubscriptionUsageWindow? weekly,
    Sub2ApiSubscriptionUsageWindow? monthly,
  });

  $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>? get daily;
  $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>? get weekly;
  $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>? get monthly;
}

/// @nodoc
class _$Sub2ApiSubscriptionProgressCopyWithImpl<$Res>
    implements $Sub2ApiSubscriptionProgressCopyWith<$Res> {
  _$Sub2ApiSubscriptionProgressCopyWithImpl(this._self, this._then);

  final Sub2ApiSubscriptionProgress _self;
  final $Res Function(Sub2ApiSubscriptionProgress) _then;

  /// Create a copy of Sub2ApiSubscriptionProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? expiresAt = null,
    Object? expiresInDays = null,
    Object? daily = freezed,
    Object? weekly = freezed,
    Object? monthly = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        groupName: null == groupName
            ? _self.groupName
            : groupName // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresAt: null == expiresAt
            ? _self.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expiresInDays: null == expiresInDays
            ? _self.expiresInDays
            : expiresInDays // ignore: cast_nullable_to_non_nullable
                  as int,
        daily: freezed == daily
            ? _self.daily
            : daily // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiSubscriptionUsageWindow?,
        weekly: freezed == weekly
            ? _self.weekly
            : weekly // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiSubscriptionUsageWindow?,
        monthly: freezed == monthly
            ? _self.monthly
            : monthly // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiSubscriptionUsageWindow?,
      ),
    );
  }

  /// Create a copy of Sub2ApiSubscriptionProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>? get daily {
    if (_self.daily == null) {
      return null;
    }

    return $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>(_self.daily!, (value) {
      return _then(_self.copyWith(daily: value));
    });
  }

  /// Create a copy of Sub2ApiSubscriptionProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>? get weekly {
    if (_self.weekly == null) {
      return null;
    }

    return $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>(_self.weekly!, (
      value,
    ) {
      return _then(_self.copyWith(weekly: value));
    });
  }

  /// Create a copy of Sub2ApiSubscriptionProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>? get monthly {
    if (_self.monthly == null) {
      return null;
    }

    return $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>(_self.monthly!, (
      value,
    ) {
      return _then(_self.copyWith(monthly: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiSubscriptionProgress].
extension Sub2ApiSubscriptionProgressPatterns on Sub2ApiSubscriptionProgress {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiSubscriptionProgress value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionProgress() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiSubscriptionProgress value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionProgress():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiSubscriptionProgress value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionProgress() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int id,
      String groupName,
      DateTime expiresAt,
      int expiresInDays,
      Sub2ApiSubscriptionUsageWindow? daily,
      Sub2ApiSubscriptionUsageWindow? weekly,
      Sub2ApiSubscriptionUsageWindow? monthly,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionProgress() when $default != null:
        return $default(
          _that.id,
          _that.groupName,
          _that.expiresAt,
          _that.expiresInDays,
          _that.daily,
          _that.weekly,
          _that.monthly,
        );
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int id,
      String groupName,
      DateTime expiresAt,
      int expiresInDays,
      Sub2ApiSubscriptionUsageWindow? daily,
      Sub2ApiSubscriptionUsageWindow? weekly,
      Sub2ApiSubscriptionUsageWindow? monthly,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionProgress():
        return $default(
          _that.id,
          _that.groupName,
          _that.expiresAt,
          _that.expiresInDays,
          _that.daily,
          _that.weekly,
          _that.monthly,
        );
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int id,
      String groupName,
      DateTime expiresAt,
      int expiresInDays,
      Sub2ApiSubscriptionUsageWindow? daily,
      Sub2ApiSubscriptionUsageWindow? weekly,
      Sub2ApiSubscriptionUsageWindow? monthly,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionProgress() when $default != null:
        return $default(
          _that.id,
          _that.groupName,
          _that.expiresAt,
          _that.expiresInDays,
          _that.daily,
          _that.weekly,
          _that.monthly,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiSubscriptionProgress implements Sub2ApiSubscriptionProgress {
  const _Sub2ApiSubscriptionProgress({
    required this.id,
    required this.groupName,
    required this.expiresAt,
    required this.expiresInDays,
    this.daily,
    this.weekly,
    this.monthly,
  });

  @override
  final int id;
  @override
  final String groupName;
  @override
  final DateTime expiresAt;
  @override
  final int expiresInDays;
  @override
  final Sub2ApiSubscriptionUsageWindow? daily;
  @override
  final Sub2ApiSubscriptionUsageWindow? weekly;
  @override
  final Sub2ApiSubscriptionUsageWindow? monthly;

  /// Create a copy of Sub2ApiSubscriptionProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiSubscriptionProgressCopyWith<_Sub2ApiSubscriptionProgress>
  get copyWith =>
      __$Sub2ApiSubscriptionProgressCopyWithImpl<_Sub2ApiSubscriptionProgress>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiSubscriptionProgress &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.expiresInDays, expiresInDays) ||
                other.expiresInDays == expiresInDays) &&
            (identical(other.daily, daily) || other.daily == daily) &&
            (identical(other.weekly, weekly) || other.weekly == weekly) &&
            (identical(other.monthly, monthly) || other.monthly == monthly));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    groupName,
    expiresAt,
    expiresInDays,
    daily,
    weekly,
    monthly,
  );

  @override
  String toString() {
    return 'Sub2ApiSubscriptionProgress(id: $id, groupName: $groupName, expiresAt: $expiresAt, expiresInDays: $expiresInDays, daily: $daily, weekly: $weekly, monthly: $monthly)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiSubscriptionProgressCopyWith<$Res>
    implements $Sub2ApiSubscriptionProgressCopyWith<$Res> {
  factory _$Sub2ApiSubscriptionProgressCopyWith(
    _Sub2ApiSubscriptionProgress value,
    $Res Function(_Sub2ApiSubscriptionProgress) _then,
  ) = __$Sub2ApiSubscriptionProgressCopyWithImpl;
  @override
  @useResult
  $Res call({
    int id,
    String groupName,
    DateTime expiresAt,
    int expiresInDays,
    Sub2ApiSubscriptionUsageWindow? daily,
    Sub2ApiSubscriptionUsageWindow? weekly,
    Sub2ApiSubscriptionUsageWindow? monthly,
  });

  @override
  $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>? get daily;
  @override
  $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>? get weekly;
  @override
  $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>? get monthly;
}

/// @nodoc
class __$Sub2ApiSubscriptionProgressCopyWithImpl<$Res>
    implements _$Sub2ApiSubscriptionProgressCopyWith<$Res> {
  __$Sub2ApiSubscriptionProgressCopyWithImpl(this._self, this._then);

  final _Sub2ApiSubscriptionProgress _self;
  final $Res Function(_Sub2ApiSubscriptionProgress) _then;

  /// Create a copy of Sub2ApiSubscriptionProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? expiresAt = null,
    Object? expiresInDays = null,
    Object? daily = freezed,
    Object? weekly = freezed,
    Object? monthly = freezed,
  }) {
    return _then(
      _Sub2ApiSubscriptionProgress(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        groupName: null == groupName
            ? _self.groupName
            : groupName // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresAt: null == expiresAt
            ? _self.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expiresInDays: null == expiresInDays
            ? _self.expiresInDays
            : expiresInDays // ignore: cast_nullable_to_non_nullable
                  as int,
        daily: freezed == daily
            ? _self.daily
            : daily // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiSubscriptionUsageWindow?,
        weekly: freezed == weekly
            ? _self.weekly
            : weekly // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiSubscriptionUsageWindow?,
        monthly: freezed == monthly
            ? _self.monthly
            : monthly // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiSubscriptionUsageWindow?,
      ),
    );
  }

  /// Create a copy of Sub2ApiSubscriptionProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>? get daily {
    if (_self.daily == null) {
      return null;
    }

    return $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>(_self.daily!, (value) {
      return _then(_self.copyWith(daily: value));
    });
  }

  /// Create a copy of Sub2ApiSubscriptionProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>? get weekly {
    if (_self.weekly == null) {
      return null;
    }

    return $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>(_self.weekly!, (
      value,
    ) {
      return _then(_self.copyWith(weekly: value));
    });
  }

  /// Create a copy of Sub2ApiSubscriptionProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>? get monthly {
    if (_self.monthly == null) {
      return null;
    }

    return $Sub2ApiSubscriptionUsageWindowCopyWith<$Res>(_self.monthly!, (
      value,
    ) {
      return _then(_self.copyWith(monthly: value));
    });
  }
}

/// @nodoc
mixin _$Sub2ApiSubscriptionProgressInfo {
  Sub2ApiUserSubscription get subscription;
  Sub2ApiSubscriptionProgress get progress;

  /// Create a copy of Sub2ApiSubscriptionProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiSubscriptionProgressInfoCopyWith<Sub2ApiSubscriptionProgressInfo>
  get copyWith =>
      _$Sub2ApiSubscriptionProgressInfoCopyWithImpl<
        Sub2ApiSubscriptionProgressInfo
      >(this as Sub2ApiSubscriptionProgressInfo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiSubscriptionProgressInfo &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subscription, progress);

  @override
  String toString() {
    return 'Sub2ApiSubscriptionProgressInfo(subscription: $subscription, progress: $progress)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiSubscriptionProgressInfoCopyWith<$Res> {
  factory $Sub2ApiSubscriptionProgressInfoCopyWith(
    Sub2ApiSubscriptionProgressInfo value,
    $Res Function(Sub2ApiSubscriptionProgressInfo) _then,
  ) = _$Sub2ApiSubscriptionProgressInfoCopyWithImpl;
  @useResult
  $Res call({
    Sub2ApiUserSubscription subscription,
    Sub2ApiSubscriptionProgress progress,
  });

  $Sub2ApiUserSubscriptionCopyWith<$Res> get subscription;
  $Sub2ApiSubscriptionProgressCopyWith<$Res> get progress;
}

/// @nodoc
class _$Sub2ApiSubscriptionProgressInfoCopyWithImpl<$Res>
    implements $Sub2ApiSubscriptionProgressInfoCopyWith<$Res> {
  _$Sub2ApiSubscriptionProgressInfoCopyWithImpl(this._self, this._then);

  final Sub2ApiSubscriptionProgressInfo _self;
  final $Res Function(Sub2ApiSubscriptionProgressInfo) _then;

  /// Create a copy of Sub2ApiSubscriptionProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? subscription = null, Object? progress = null}) {
    return _then(
      _self.copyWith(
        subscription: null == subscription
            ? _self.subscription
            : subscription // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiUserSubscription,
        progress: null == progress
            ? _self.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiSubscriptionProgress,
      ),
    );
  }

  /// Create a copy of Sub2ApiSubscriptionProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiUserSubscriptionCopyWith<$Res> get subscription {
    return $Sub2ApiUserSubscriptionCopyWith<$Res>(_self.subscription, (value) {
      return _then(_self.copyWith(subscription: value));
    });
  }

  /// Create a copy of Sub2ApiSubscriptionProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiSubscriptionProgressCopyWith<$Res> get progress {
    return $Sub2ApiSubscriptionProgressCopyWith<$Res>(_self.progress, (value) {
      return _then(_self.copyWith(progress: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiSubscriptionProgressInfo].
extension Sub2ApiSubscriptionProgressInfoPatterns
    on Sub2ApiSubscriptionProgressInfo {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiSubscriptionProgressInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionProgressInfo() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiSubscriptionProgressInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionProgressInfo():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiSubscriptionProgressInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionProgressInfo() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      Sub2ApiUserSubscription subscription,
      Sub2ApiSubscriptionProgress progress,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionProgressInfo() when $default != null:
        return $default(_that.subscription, _that.progress);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      Sub2ApiUserSubscription subscription,
      Sub2ApiSubscriptionProgress progress,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionProgressInfo():
        return $default(_that.subscription, _that.progress);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      Sub2ApiUserSubscription subscription,
      Sub2ApiSubscriptionProgress progress,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionProgressInfo() when $default != null:
        return $default(_that.subscription, _that.progress);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiSubscriptionProgressInfo
    implements Sub2ApiSubscriptionProgressInfo {
  const _Sub2ApiSubscriptionProgressInfo({
    required this.subscription,
    required this.progress,
  });

  @override
  final Sub2ApiUserSubscription subscription;
  @override
  final Sub2ApiSubscriptionProgress progress;

  /// Create a copy of Sub2ApiSubscriptionProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiSubscriptionProgressInfoCopyWith<_Sub2ApiSubscriptionProgressInfo>
  get copyWith =>
      __$Sub2ApiSubscriptionProgressInfoCopyWithImpl<
        _Sub2ApiSubscriptionProgressInfo
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiSubscriptionProgressInfo &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subscription, progress);

  @override
  String toString() {
    return 'Sub2ApiSubscriptionProgressInfo(subscription: $subscription, progress: $progress)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiSubscriptionProgressInfoCopyWith<$Res>
    implements $Sub2ApiSubscriptionProgressInfoCopyWith<$Res> {
  factory _$Sub2ApiSubscriptionProgressInfoCopyWith(
    _Sub2ApiSubscriptionProgressInfo value,
    $Res Function(_Sub2ApiSubscriptionProgressInfo) _then,
  ) = __$Sub2ApiSubscriptionProgressInfoCopyWithImpl;
  @override
  @useResult
  $Res call({
    Sub2ApiUserSubscription subscription,
    Sub2ApiSubscriptionProgress progress,
  });

  @override
  $Sub2ApiUserSubscriptionCopyWith<$Res> get subscription;
  @override
  $Sub2ApiSubscriptionProgressCopyWith<$Res> get progress;
}

/// @nodoc
class __$Sub2ApiSubscriptionProgressInfoCopyWithImpl<$Res>
    implements _$Sub2ApiSubscriptionProgressInfoCopyWith<$Res> {
  __$Sub2ApiSubscriptionProgressInfoCopyWithImpl(this._self, this._then);

  final _Sub2ApiSubscriptionProgressInfo _self;
  final $Res Function(_Sub2ApiSubscriptionProgressInfo) _then;

  /// Create a copy of Sub2ApiSubscriptionProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? subscription = null, Object? progress = null}) {
    return _then(
      _Sub2ApiSubscriptionProgressInfo(
        subscription: null == subscription
            ? _self.subscription
            : subscription // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiUserSubscription,
        progress: null == progress
            ? _self.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiSubscriptionProgress,
      ),
    );
  }

  /// Create a copy of Sub2ApiSubscriptionProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiUserSubscriptionCopyWith<$Res> get subscription {
    return $Sub2ApiUserSubscriptionCopyWith<$Res>(_self.subscription, (value) {
      return _then(_self.copyWith(subscription: value));
    });
  }

  /// Create a copy of Sub2ApiSubscriptionProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiSubscriptionProgressCopyWith<$Res> get progress {
    return $Sub2ApiSubscriptionProgressCopyWith<$Res>(_self.progress, (value) {
      return _then(_self.copyWith(progress: value));
    });
  }
}

/// @nodoc
mixin _$Sub2ApiSubscriptionSummaryItem {
  int get id;
  int get groupId;
  String get groupName;
  String get status;
  Sub2ApiDecimal get dailyUsedUsd;
  Sub2ApiDecimal get dailyLimitUsd;
  Sub2ApiDecimal get weeklyUsedUsd;
  Sub2ApiDecimal get weeklyLimitUsd;
  Sub2ApiDecimal get monthlyUsedUsd;
  Sub2ApiDecimal get monthlyLimitUsd;
  DateTime? get expiresAt;

  /// Create a copy of Sub2ApiSubscriptionSummaryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiSubscriptionSummaryItemCopyWith<Sub2ApiSubscriptionSummaryItem>
  get copyWith =>
      _$Sub2ApiSubscriptionSummaryItemCopyWithImpl<
        Sub2ApiSubscriptionSummaryItem
      >(this as Sub2ApiSubscriptionSummaryItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiSubscriptionSummaryItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dailyUsedUsd, dailyUsedUsd) ||
                other.dailyUsedUsd == dailyUsedUsd) &&
            (identical(other.dailyLimitUsd, dailyLimitUsd) ||
                other.dailyLimitUsd == dailyLimitUsd) &&
            (identical(other.weeklyUsedUsd, weeklyUsedUsd) ||
                other.weeklyUsedUsd == weeklyUsedUsd) &&
            (identical(other.weeklyLimitUsd, weeklyLimitUsd) ||
                other.weeklyLimitUsd == weeklyLimitUsd) &&
            (identical(other.monthlyUsedUsd, monthlyUsedUsd) ||
                other.monthlyUsedUsd == monthlyUsedUsd) &&
            (identical(other.monthlyLimitUsd, monthlyLimitUsd) ||
                other.monthlyLimitUsd == monthlyLimitUsd) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    groupId,
    groupName,
    status,
    dailyUsedUsd,
    dailyLimitUsd,
    weeklyUsedUsd,
    weeklyLimitUsd,
    monthlyUsedUsd,
    monthlyLimitUsd,
    expiresAt,
  );

  @override
  String toString() {
    return 'Sub2ApiSubscriptionSummaryItem(id: $id, groupId: $groupId, groupName: $groupName, status: $status, dailyUsedUsd: $dailyUsedUsd, dailyLimitUsd: $dailyLimitUsd, weeklyUsedUsd: $weeklyUsedUsd, weeklyLimitUsd: $weeklyLimitUsd, monthlyUsedUsd: $monthlyUsedUsd, monthlyLimitUsd: $monthlyLimitUsd, expiresAt: $expiresAt)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiSubscriptionSummaryItemCopyWith<$Res> {
  factory $Sub2ApiSubscriptionSummaryItemCopyWith(
    Sub2ApiSubscriptionSummaryItem value,
    $Res Function(Sub2ApiSubscriptionSummaryItem) _then,
  ) = _$Sub2ApiSubscriptionSummaryItemCopyWithImpl;
  @useResult
  $Res call({
    int id,
    int groupId,
    String groupName,
    String status,
    Sub2ApiDecimal dailyUsedUsd,
    Sub2ApiDecimal dailyLimitUsd,
    Sub2ApiDecimal weeklyUsedUsd,
    Sub2ApiDecimal weeklyLimitUsd,
    Sub2ApiDecimal monthlyUsedUsd,
    Sub2ApiDecimal monthlyLimitUsd,
    DateTime? expiresAt,
  });
}

/// @nodoc
class _$Sub2ApiSubscriptionSummaryItemCopyWithImpl<$Res>
    implements $Sub2ApiSubscriptionSummaryItemCopyWith<$Res> {
  _$Sub2ApiSubscriptionSummaryItemCopyWithImpl(this._self, this._then);

  final Sub2ApiSubscriptionSummaryItem _self;
  final $Res Function(Sub2ApiSubscriptionSummaryItem) _then;

  /// Create a copy of Sub2ApiSubscriptionSummaryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? groupName = null,
    Object? status = null,
    Object? dailyUsedUsd = null,
    Object? dailyLimitUsd = null,
    Object? weeklyUsedUsd = null,
    Object? weeklyLimitUsd = null,
    Object? monthlyUsedUsd = null,
    Object? monthlyLimitUsd = null,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int,
        groupName: null == groupName
            ? _self.groupName
            : groupName // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        dailyUsedUsd: null == dailyUsedUsd
            ? _self.dailyUsedUsd
            : dailyUsedUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        dailyLimitUsd: null == dailyLimitUsd
            ? _self.dailyLimitUsd
            : dailyLimitUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        weeklyUsedUsd: null == weeklyUsedUsd
            ? _self.weeklyUsedUsd
            : weeklyUsedUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        weeklyLimitUsd: null == weeklyLimitUsd
            ? _self.weeklyLimitUsd
            : weeklyLimitUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        monthlyUsedUsd: null == monthlyUsedUsd
            ? _self.monthlyUsedUsd
            : monthlyUsedUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        monthlyLimitUsd: null == monthlyLimitUsd
            ? _self.monthlyLimitUsd
            : monthlyLimitUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        expiresAt: freezed == expiresAt
            ? _self.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiSubscriptionSummaryItem].
extension Sub2ApiSubscriptionSummaryItemPatterns
    on Sub2ApiSubscriptionSummaryItem {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiSubscriptionSummaryItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionSummaryItem() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiSubscriptionSummaryItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionSummaryItem():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiSubscriptionSummaryItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionSummaryItem() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int id,
      int groupId,
      String groupName,
      String status,
      Sub2ApiDecimal dailyUsedUsd,
      Sub2ApiDecimal dailyLimitUsd,
      Sub2ApiDecimal weeklyUsedUsd,
      Sub2ApiDecimal weeklyLimitUsd,
      Sub2ApiDecimal monthlyUsedUsd,
      Sub2ApiDecimal monthlyLimitUsd,
      DateTime? expiresAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionSummaryItem() when $default != null:
        return $default(
          _that.id,
          _that.groupId,
          _that.groupName,
          _that.status,
          _that.dailyUsedUsd,
          _that.dailyLimitUsd,
          _that.weeklyUsedUsd,
          _that.weeklyLimitUsd,
          _that.monthlyUsedUsd,
          _that.monthlyLimitUsd,
          _that.expiresAt,
        );
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int id,
      int groupId,
      String groupName,
      String status,
      Sub2ApiDecimal dailyUsedUsd,
      Sub2ApiDecimal dailyLimitUsd,
      Sub2ApiDecimal weeklyUsedUsd,
      Sub2ApiDecimal weeklyLimitUsd,
      Sub2ApiDecimal monthlyUsedUsd,
      Sub2ApiDecimal monthlyLimitUsd,
      DateTime? expiresAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionSummaryItem():
        return $default(
          _that.id,
          _that.groupId,
          _that.groupName,
          _that.status,
          _that.dailyUsedUsd,
          _that.dailyLimitUsd,
          _that.weeklyUsedUsd,
          _that.weeklyLimitUsd,
          _that.monthlyUsedUsd,
          _that.monthlyLimitUsd,
          _that.expiresAt,
        );
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int id,
      int groupId,
      String groupName,
      String status,
      Sub2ApiDecimal dailyUsedUsd,
      Sub2ApiDecimal dailyLimitUsd,
      Sub2ApiDecimal weeklyUsedUsd,
      Sub2ApiDecimal weeklyLimitUsd,
      Sub2ApiDecimal monthlyUsedUsd,
      Sub2ApiDecimal monthlyLimitUsd,
      DateTime? expiresAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionSummaryItem() when $default != null:
        return $default(
          _that.id,
          _that.groupId,
          _that.groupName,
          _that.status,
          _that.dailyUsedUsd,
          _that.dailyLimitUsd,
          _that.weeklyUsedUsd,
          _that.weeklyLimitUsd,
          _that.monthlyUsedUsd,
          _that.monthlyLimitUsd,
          _that.expiresAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiSubscriptionSummaryItem
    implements Sub2ApiSubscriptionSummaryItem {
  const _Sub2ApiSubscriptionSummaryItem({
    required this.id,
    required this.groupId,
    required this.groupName,
    required this.status,
    required this.dailyUsedUsd,
    required this.dailyLimitUsd,
    required this.weeklyUsedUsd,
    required this.weeklyLimitUsd,
    required this.monthlyUsedUsd,
    required this.monthlyLimitUsd,
    this.expiresAt,
  });

  @override
  final int id;
  @override
  final int groupId;
  @override
  final String groupName;
  @override
  final String status;
  @override
  final Sub2ApiDecimal dailyUsedUsd;
  @override
  final Sub2ApiDecimal dailyLimitUsd;
  @override
  final Sub2ApiDecimal weeklyUsedUsd;
  @override
  final Sub2ApiDecimal weeklyLimitUsd;
  @override
  final Sub2ApiDecimal monthlyUsedUsd;
  @override
  final Sub2ApiDecimal monthlyLimitUsd;
  @override
  final DateTime? expiresAt;

  /// Create a copy of Sub2ApiSubscriptionSummaryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiSubscriptionSummaryItemCopyWith<_Sub2ApiSubscriptionSummaryItem>
  get copyWith =>
      __$Sub2ApiSubscriptionSummaryItemCopyWithImpl<
        _Sub2ApiSubscriptionSummaryItem
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiSubscriptionSummaryItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dailyUsedUsd, dailyUsedUsd) ||
                other.dailyUsedUsd == dailyUsedUsd) &&
            (identical(other.dailyLimitUsd, dailyLimitUsd) ||
                other.dailyLimitUsd == dailyLimitUsd) &&
            (identical(other.weeklyUsedUsd, weeklyUsedUsd) ||
                other.weeklyUsedUsd == weeklyUsedUsd) &&
            (identical(other.weeklyLimitUsd, weeklyLimitUsd) ||
                other.weeklyLimitUsd == weeklyLimitUsd) &&
            (identical(other.monthlyUsedUsd, monthlyUsedUsd) ||
                other.monthlyUsedUsd == monthlyUsedUsd) &&
            (identical(other.monthlyLimitUsd, monthlyLimitUsd) ||
                other.monthlyLimitUsd == monthlyLimitUsd) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    groupId,
    groupName,
    status,
    dailyUsedUsd,
    dailyLimitUsd,
    weeklyUsedUsd,
    weeklyLimitUsd,
    monthlyUsedUsd,
    monthlyLimitUsd,
    expiresAt,
  );

  @override
  String toString() {
    return 'Sub2ApiSubscriptionSummaryItem(id: $id, groupId: $groupId, groupName: $groupName, status: $status, dailyUsedUsd: $dailyUsedUsd, dailyLimitUsd: $dailyLimitUsd, weeklyUsedUsd: $weeklyUsedUsd, weeklyLimitUsd: $weeklyLimitUsd, monthlyUsedUsd: $monthlyUsedUsd, monthlyLimitUsd: $monthlyLimitUsd, expiresAt: $expiresAt)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiSubscriptionSummaryItemCopyWith<$Res>
    implements $Sub2ApiSubscriptionSummaryItemCopyWith<$Res> {
  factory _$Sub2ApiSubscriptionSummaryItemCopyWith(
    _Sub2ApiSubscriptionSummaryItem value,
    $Res Function(_Sub2ApiSubscriptionSummaryItem) _then,
  ) = __$Sub2ApiSubscriptionSummaryItemCopyWithImpl;
  @override
  @useResult
  $Res call({
    int id,
    int groupId,
    String groupName,
    String status,
    Sub2ApiDecimal dailyUsedUsd,
    Sub2ApiDecimal dailyLimitUsd,
    Sub2ApiDecimal weeklyUsedUsd,
    Sub2ApiDecimal weeklyLimitUsd,
    Sub2ApiDecimal monthlyUsedUsd,
    Sub2ApiDecimal monthlyLimitUsd,
    DateTime? expiresAt,
  });
}

/// @nodoc
class __$Sub2ApiSubscriptionSummaryItemCopyWithImpl<$Res>
    implements _$Sub2ApiSubscriptionSummaryItemCopyWith<$Res> {
  __$Sub2ApiSubscriptionSummaryItemCopyWithImpl(this._self, this._then);

  final _Sub2ApiSubscriptionSummaryItem _self;
  final $Res Function(_Sub2ApiSubscriptionSummaryItem) _then;

  /// Create a copy of Sub2ApiSubscriptionSummaryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? groupName = null,
    Object? status = null,
    Object? dailyUsedUsd = null,
    Object? dailyLimitUsd = null,
    Object? weeklyUsedUsd = null,
    Object? weeklyLimitUsd = null,
    Object? monthlyUsedUsd = null,
    Object? monthlyLimitUsd = null,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _Sub2ApiSubscriptionSummaryItem(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int,
        groupName: null == groupName
            ? _self.groupName
            : groupName // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        dailyUsedUsd: null == dailyUsedUsd
            ? _self.dailyUsedUsd
            : dailyUsedUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        dailyLimitUsd: null == dailyLimitUsd
            ? _self.dailyLimitUsd
            : dailyLimitUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        weeklyUsedUsd: null == weeklyUsedUsd
            ? _self.weeklyUsedUsd
            : weeklyUsedUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        weeklyLimitUsd: null == weeklyLimitUsd
            ? _self.weeklyLimitUsd
            : weeklyLimitUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        monthlyUsedUsd: null == monthlyUsedUsd
            ? _self.monthlyUsedUsd
            : monthlyUsedUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        monthlyLimitUsd: null == monthlyLimitUsd
            ? _self.monthlyLimitUsd
            : monthlyLimitUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        expiresAt: freezed == expiresAt
            ? _self.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiSubscriptionSummary {
  int get activeCount;
  Sub2ApiDecimal get totalUsedUsd;
  List<Sub2ApiSubscriptionSummaryItem> get subscriptions;

  /// Create a copy of Sub2ApiSubscriptionSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiSubscriptionSummaryCopyWith<Sub2ApiSubscriptionSummary>
  get copyWith =>
      _$Sub2ApiSubscriptionSummaryCopyWithImpl<Sub2ApiSubscriptionSummary>(
        this as Sub2ApiSubscriptionSummary,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiSubscriptionSummary &&
            (identical(other.activeCount, activeCount) ||
                other.activeCount == activeCount) &&
            (identical(other.totalUsedUsd, totalUsedUsd) ||
                other.totalUsedUsd == totalUsedUsd) &&
            const DeepCollectionEquality().equals(
              other.subscriptions,
              subscriptions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activeCount,
    totalUsedUsd,
    const DeepCollectionEquality().hash(subscriptions),
  );

  @override
  String toString() {
    return 'Sub2ApiSubscriptionSummary(activeCount: $activeCount, totalUsedUsd: $totalUsedUsd, subscriptions: $subscriptions)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiSubscriptionSummaryCopyWith<$Res> {
  factory $Sub2ApiSubscriptionSummaryCopyWith(
    Sub2ApiSubscriptionSummary value,
    $Res Function(Sub2ApiSubscriptionSummary) _then,
  ) = _$Sub2ApiSubscriptionSummaryCopyWithImpl;
  @useResult
  $Res call({
    int activeCount,
    Sub2ApiDecimal totalUsedUsd,
    List<Sub2ApiSubscriptionSummaryItem> subscriptions,
  });
}

/// @nodoc
class _$Sub2ApiSubscriptionSummaryCopyWithImpl<$Res>
    implements $Sub2ApiSubscriptionSummaryCopyWith<$Res> {
  _$Sub2ApiSubscriptionSummaryCopyWithImpl(this._self, this._then);

  final Sub2ApiSubscriptionSummary _self;
  final $Res Function(Sub2ApiSubscriptionSummary) _then;

  /// Create a copy of Sub2ApiSubscriptionSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeCount = null,
    Object? totalUsedUsd = null,
    Object? subscriptions = null,
  }) {
    return _then(
      _self.copyWith(
        activeCount: null == activeCount
            ? _self.activeCount
            : activeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalUsedUsd: null == totalUsedUsd
            ? _self.totalUsedUsd
            : totalUsedUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        subscriptions: null == subscriptions
            ? _self.subscriptions
            : subscriptions // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiSubscriptionSummaryItem>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiSubscriptionSummary].
extension Sub2ApiSubscriptionSummaryPatterns on Sub2ApiSubscriptionSummary {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiSubscriptionSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionSummary() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiSubscriptionSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionSummary():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiSubscriptionSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionSummary() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int activeCount,
      Sub2ApiDecimal totalUsedUsd,
      List<Sub2ApiSubscriptionSummaryItem> subscriptions,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionSummary() when $default != null:
        return $default(
          _that.activeCount,
          _that.totalUsedUsd,
          _that.subscriptions,
        );
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int activeCount,
      Sub2ApiDecimal totalUsedUsd,
      List<Sub2ApiSubscriptionSummaryItem> subscriptions,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionSummary():
        return $default(
          _that.activeCount,
          _that.totalUsedUsd,
          _that.subscriptions,
        );
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int activeCount,
      Sub2ApiDecimal totalUsedUsd,
      List<Sub2ApiSubscriptionSummaryItem> subscriptions,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiSubscriptionSummary() when $default != null:
        return $default(
          _that.activeCount,
          _that.totalUsedUsd,
          _that.subscriptions,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiSubscriptionSummary implements Sub2ApiSubscriptionSummary {
  const _Sub2ApiSubscriptionSummary({
    required this.activeCount,
    required this.totalUsedUsd,
    required final List<Sub2ApiSubscriptionSummaryItem> subscriptions,
  }) : _subscriptions = subscriptions;

  @override
  final int activeCount;
  @override
  final Sub2ApiDecimal totalUsedUsd;
  final List<Sub2ApiSubscriptionSummaryItem> _subscriptions;
  @override
  List<Sub2ApiSubscriptionSummaryItem> get subscriptions {
    if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscriptions);
  }

  /// Create a copy of Sub2ApiSubscriptionSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiSubscriptionSummaryCopyWith<_Sub2ApiSubscriptionSummary>
  get copyWith =>
      __$Sub2ApiSubscriptionSummaryCopyWithImpl<_Sub2ApiSubscriptionSummary>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiSubscriptionSummary &&
            (identical(other.activeCount, activeCount) ||
                other.activeCount == activeCount) &&
            (identical(other.totalUsedUsd, totalUsedUsd) ||
                other.totalUsedUsd == totalUsedUsd) &&
            const DeepCollectionEquality().equals(
              other._subscriptions,
              _subscriptions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activeCount,
    totalUsedUsd,
    const DeepCollectionEquality().hash(_subscriptions),
  );

  @override
  String toString() {
    return 'Sub2ApiSubscriptionSummary(activeCount: $activeCount, totalUsedUsd: $totalUsedUsd, subscriptions: $subscriptions)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiSubscriptionSummaryCopyWith<$Res>
    implements $Sub2ApiSubscriptionSummaryCopyWith<$Res> {
  factory _$Sub2ApiSubscriptionSummaryCopyWith(
    _Sub2ApiSubscriptionSummary value,
    $Res Function(_Sub2ApiSubscriptionSummary) _then,
  ) = __$Sub2ApiSubscriptionSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({
    int activeCount,
    Sub2ApiDecimal totalUsedUsd,
    List<Sub2ApiSubscriptionSummaryItem> subscriptions,
  });
}

/// @nodoc
class __$Sub2ApiSubscriptionSummaryCopyWithImpl<$Res>
    implements _$Sub2ApiSubscriptionSummaryCopyWith<$Res> {
  __$Sub2ApiSubscriptionSummaryCopyWithImpl(this._self, this._then);

  final _Sub2ApiSubscriptionSummary _self;
  final $Res Function(_Sub2ApiSubscriptionSummary) _then;

  /// Create a copy of Sub2ApiSubscriptionSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activeCount = null,
    Object? totalUsedUsd = null,
    Object? subscriptions = null,
  }) {
    return _then(
      _Sub2ApiSubscriptionSummary(
        activeCount: null == activeCount
            ? _self.activeCount
            : activeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalUsedUsd: null == totalUsedUsd
            ? _self.totalUsedUsd
            : totalUsedUsd // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        subscriptions: null == subscriptions
            ? _self._subscriptions
            : subscriptions // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiSubscriptionSummaryItem>,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiModelPlazaOfficialPricing {
  Sub2ApiDecimal? get inputPrice;
  Sub2ApiDecimal? get outputPrice;
  Sub2ApiDecimal? get cacheWritePrice;
  Sub2ApiDecimal? get cacheWrite1hPrice;
  Sub2ApiDecimal? get cacheReadPrice;
  List<Sub2ApiPricingInterval> get intervals;

  /// Create a copy of Sub2ApiModelPlazaOfficialPricing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiModelPlazaOfficialPricingCopyWith<Sub2ApiModelPlazaOfficialPricing>
  get copyWith =>
      _$Sub2ApiModelPlazaOfficialPricingCopyWithImpl<
        Sub2ApiModelPlazaOfficialPricing
      >(this as Sub2ApiModelPlazaOfficialPricing, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiModelPlazaOfficialPricing &&
            (identical(other.inputPrice, inputPrice) ||
                other.inputPrice == inputPrice) &&
            (identical(other.outputPrice, outputPrice) ||
                other.outputPrice == outputPrice) &&
            (identical(other.cacheWritePrice, cacheWritePrice) ||
                other.cacheWritePrice == cacheWritePrice) &&
            (identical(other.cacheWrite1hPrice, cacheWrite1hPrice) ||
                other.cacheWrite1hPrice == cacheWrite1hPrice) &&
            (identical(other.cacheReadPrice, cacheReadPrice) ||
                other.cacheReadPrice == cacheReadPrice) &&
            const DeepCollectionEquality().equals(other.intervals, intervals));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    inputPrice,
    outputPrice,
    cacheWritePrice,
    cacheWrite1hPrice,
    cacheReadPrice,
    const DeepCollectionEquality().hash(intervals),
  );

  @override
  String toString() {
    return 'Sub2ApiModelPlazaOfficialPricing(inputPrice: $inputPrice, outputPrice: $outputPrice, cacheWritePrice: $cacheWritePrice, cacheWrite1hPrice: $cacheWrite1hPrice, cacheReadPrice: $cacheReadPrice, intervals: $intervals)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiModelPlazaOfficialPricingCopyWith<$Res> {
  factory $Sub2ApiModelPlazaOfficialPricingCopyWith(
    Sub2ApiModelPlazaOfficialPricing value,
    $Res Function(Sub2ApiModelPlazaOfficialPricing) _then,
  ) = _$Sub2ApiModelPlazaOfficialPricingCopyWithImpl;
  @useResult
  $Res call({
    Sub2ApiDecimal? inputPrice,
    Sub2ApiDecimal? outputPrice,
    Sub2ApiDecimal? cacheWritePrice,
    Sub2ApiDecimal? cacheWrite1hPrice,
    Sub2ApiDecimal? cacheReadPrice,
    List<Sub2ApiPricingInterval> intervals,
  });
}

/// @nodoc
class _$Sub2ApiModelPlazaOfficialPricingCopyWithImpl<$Res>
    implements $Sub2ApiModelPlazaOfficialPricingCopyWith<$Res> {
  _$Sub2ApiModelPlazaOfficialPricingCopyWithImpl(this._self, this._then);

  final Sub2ApiModelPlazaOfficialPricing _self;
  final $Res Function(Sub2ApiModelPlazaOfficialPricing) _then;

  /// Create a copy of Sub2ApiModelPlazaOfficialPricing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputPrice = freezed,
    Object? outputPrice = freezed,
    Object? cacheWritePrice = freezed,
    Object? cacheWrite1hPrice = freezed,
    Object? cacheReadPrice = freezed,
    Object? intervals = null,
  }) {
    return _then(
      _self.copyWith(
        inputPrice: freezed == inputPrice
            ? _self.inputPrice
            : inputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        outputPrice: freezed == outputPrice
            ? _self.outputPrice
            : outputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        cacheWritePrice: freezed == cacheWritePrice
            ? _self.cacheWritePrice
            : cacheWritePrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        cacheWrite1hPrice: freezed == cacheWrite1hPrice
            ? _self.cacheWrite1hPrice
            : cacheWrite1hPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        cacheReadPrice: freezed == cacheReadPrice
            ? _self.cacheReadPrice
            : cacheReadPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        intervals: null == intervals
            ? _self.intervals
            : intervals // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiPricingInterval>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiModelPlazaOfficialPricing].
extension Sub2ApiModelPlazaOfficialPricingPatterns
    on Sub2ApiModelPlazaOfficialPricing {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiModelPlazaOfficialPricing value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaOfficialPricing() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiModelPlazaOfficialPricing value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaOfficialPricing():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiModelPlazaOfficialPricing value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaOfficialPricing() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      Sub2ApiDecimal? inputPrice,
      Sub2ApiDecimal? outputPrice,
      Sub2ApiDecimal? cacheWritePrice,
      Sub2ApiDecimal? cacheWrite1hPrice,
      Sub2ApiDecimal? cacheReadPrice,
      List<Sub2ApiPricingInterval> intervals,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaOfficialPricing() when $default != null:
        return $default(
          _that.inputPrice,
          _that.outputPrice,
          _that.cacheWritePrice,
          _that.cacheWrite1hPrice,
          _that.cacheReadPrice,
          _that.intervals,
        );
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      Sub2ApiDecimal? inputPrice,
      Sub2ApiDecimal? outputPrice,
      Sub2ApiDecimal? cacheWritePrice,
      Sub2ApiDecimal? cacheWrite1hPrice,
      Sub2ApiDecimal? cacheReadPrice,
      List<Sub2ApiPricingInterval> intervals,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaOfficialPricing():
        return $default(
          _that.inputPrice,
          _that.outputPrice,
          _that.cacheWritePrice,
          _that.cacheWrite1hPrice,
          _that.cacheReadPrice,
          _that.intervals,
        );
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      Sub2ApiDecimal? inputPrice,
      Sub2ApiDecimal? outputPrice,
      Sub2ApiDecimal? cacheWritePrice,
      Sub2ApiDecimal? cacheWrite1hPrice,
      Sub2ApiDecimal? cacheReadPrice,
      List<Sub2ApiPricingInterval> intervals,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaOfficialPricing() when $default != null:
        return $default(
          _that.inputPrice,
          _that.outputPrice,
          _that.cacheWritePrice,
          _that.cacheWrite1hPrice,
          _that.cacheReadPrice,
          _that.intervals,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiModelPlazaOfficialPricing
    implements Sub2ApiModelPlazaOfficialPricing {
  const _Sub2ApiModelPlazaOfficialPricing({
    this.inputPrice,
    this.outputPrice,
    this.cacheWritePrice,
    this.cacheWrite1hPrice,
    this.cacheReadPrice,
    required final List<Sub2ApiPricingInterval> intervals,
  }) : _intervals = intervals;

  @override
  final Sub2ApiDecimal? inputPrice;
  @override
  final Sub2ApiDecimal? outputPrice;
  @override
  final Sub2ApiDecimal? cacheWritePrice;
  @override
  final Sub2ApiDecimal? cacheWrite1hPrice;
  @override
  final Sub2ApiDecimal? cacheReadPrice;
  final List<Sub2ApiPricingInterval> _intervals;
  @override
  List<Sub2ApiPricingInterval> get intervals {
    if (_intervals is EqualUnmodifiableListView) return _intervals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_intervals);
  }

  /// Create a copy of Sub2ApiModelPlazaOfficialPricing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiModelPlazaOfficialPricingCopyWith<_Sub2ApiModelPlazaOfficialPricing>
  get copyWith =>
      __$Sub2ApiModelPlazaOfficialPricingCopyWithImpl<
        _Sub2ApiModelPlazaOfficialPricing
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiModelPlazaOfficialPricing &&
            (identical(other.inputPrice, inputPrice) ||
                other.inputPrice == inputPrice) &&
            (identical(other.outputPrice, outputPrice) ||
                other.outputPrice == outputPrice) &&
            (identical(other.cacheWritePrice, cacheWritePrice) ||
                other.cacheWritePrice == cacheWritePrice) &&
            (identical(other.cacheWrite1hPrice, cacheWrite1hPrice) ||
                other.cacheWrite1hPrice == cacheWrite1hPrice) &&
            (identical(other.cacheReadPrice, cacheReadPrice) ||
                other.cacheReadPrice == cacheReadPrice) &&
            const DeepCollectionEquality().equals(
              other._intervals,
              _intervals,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    inputPrice,
    outputPrice,
    cacheWritePrice,
    cacheWrite1hPrice,
    cacheReadPrice,
    const DeepCollectionEquality().hash(_intervals),
  );

  @override
  String toString() {
    return 'Sub2ApiModelPlazaOfficialPricing(inputPrice: $inputPrice, outputPrice: $outputPrice, cacheWritePrice: $cacheWritePrice, cacheWrite1hPrice: $cacheWrite1hPrice, cacheReadPrice: $cacheReadPrice, intervals: $intervals)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiModelPlazaOfficialPricingCopyWith<$Res>
    implements $Sub2ApiModelPlazaOfficialPricingCopyWith<$Res> {
  factory _$Sub2ApiModelPlazaOfficialPricingCopyWith(
    _Sub2ApiModelPlazaOfficialPricing value,
    $Res Function(_Sub2ApiModelPlazaOfficialPricing) _then,
  ) = __$Sub2ApiModelPlazaOfficialPricingCopyWithImpl;
  @override
  @useResult
  $Res call({
    Sub2ApiDecimal? inputPrice,
    Sub2ApiDecimal? outputPrice,
    Sub2ApiDecimal? cacheWritePrice,
    Sub2ApiDecimal? cacheWrite1hPrice,
    Sub2ApiDecimal? cacheReadPrice,
    List<Sub2ApiPricingInterval> intervals,
  });
}

/// @nodoc
class __$Sub2ApiModelPlazaOfficialPricingCopyWithImpl<$Res>
    implements _$Sub2ApiModelPlazaOfficialPricingCopyWith<$Res> {
  __$Sub2ApiModelPlazaOfficialPricingCopyWithImpl(this._self, this._then);

  final _Sub2ApiModelPlazaOfficialPricing _self;
  final $Res Function(_Sub2ApiModelPlazaOfficialPricing) _then;

  /// Create a copy of Sub2ApiModelPlazaOfficialPricing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? inputPrice = freezed,
    Object? outputPrice = freezed,
    Object? cacheWritePrice = freezed,
    Object? cacheWrite1hPrice = freezed,
    Object? cacheReadPrice = freezed,
    Object? intervals = null,
  }) {
    return _then(
      _Sub2ApiModelPlazaOfficialPricing(
        inputPrice: freezed == inputPrice
            ? _self.inputPrice
            : inputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        outputPrice: freezed == outputPrice
            ? _self.outputPrice
            : outputPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        cacheWritePrice: freezed == cacheWritePrice
            ? _self.cacheWritePrice
            : cacheWritePrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        cacheWrite1hPrice: freezed == cacheWrite1hPrice
            ? _self.cacheWrite1hPrice
            : cacheWrite1hPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        cacheReadPrice: freezed == cacheReadPrice
            ? _self.cacheReadPrice
            : cacheReadPrice // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        intervals: null == intervals
            ? _self._intervals
            : intervals // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiPricingInterval>,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiModelPlazaTimePeriod {
  String get startTime;
  String get endTime;
  Sub2ApiDecimal get multiplier;

  /// Create a copy of Sub2ApiModelPlazaTimePeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiModelPlazaTimePeriodCopyWith<Sub2ApiModelPlazaTimePeriod>
  get copyWith =>
      _$Sub2ApiModelPlazaTimePeriodCopyWithImpl<Sub2ApiModelPlazaTimePeriod>(
        this as Sub2ApiModelPlazaTimePeriod,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiModelPlazaTimePeriod &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.multiplier, multiplier) ||
                other.multiplier == multiplier));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime, multiplier);

  @override
  String toString() {
    return 'Sub2ApiModelPlazaTimePeriod(startTime: $startTime, endTime: $endTime, multiplier: $multiplier)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiModelPlazaTimePeriodCopyWith<$Res> {
  factory $Sub2ApiModelPlazaTimePeriodCopyWith(
    Sub2ApiModelPlazaTimePeriod value,
    $Res Function(Sub2ApiModelPlazaTimePeriod) _then,
  ) = _$Sub2ApiModelPlazaTimePeriodCopyWithImpl;
  @useResult
  $Res call({String startTime, String endTime, Sub2ApiDecimal multiplier});
}

/// @nodoc
class _$Sub2ApiModelPlazaTimePeriodCopyWithImpl<$Res>
    implements $Sub2ApiModelPlazaTimePeriodCopyWith<$Res> {
  _$Sub2ApiModelPlazaTimePeriodCopyWithImpl(this._self, this._then);

  final Sub2ApiModelPlazaTimePeriod _self;
  final $Res Function(Sub2ApiModelPlazaTimePeriod) _then;

  /// Create a copy of Sub2ApiModelPlazaTimePeriod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? multiplier = null,
  }) {
    return _then(
      _self.copyWith(
        startTime: null == startTime
            ? _self.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        endTime: null == endTime
            ? _self.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String,
        multiplier: null == multiplier
            ? _self.multiplier
            : multiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiModelPlazaTimePeriod].
extension Sub2ApiModelPlazaTimePeriodPatterns on Sub2ApiModelPlazaTimePeriod {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiModelPlazaTimePeriod value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaTimePeriod() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiModelPlazaTimePeriod value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaTimePeriod():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiModelPlazaTimePeriod value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaTimePeriod() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String startTime,
      String endTime,
      Sub2ApiDecimal multiplier,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaTimePeriod() when $default != null:
        return $default(_that.startTime, _that.endTime, _that.multiplier);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String startTime,
      String endTime,
      Sub2ApiDecimal multiplier,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaTimePeriod():
        return $default(_that.startTime, _that.endTime, _that.multiplier);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String startTime,
      String endTime,
      Sub2ApiDecimal multiplier,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaTimePeriod() when $default != null:
        return $default(_that.startTime, _that.endTime, _that.multiplier);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiModelPlazaTimePeriod implements Sub2ApiModelPlazaTimePeriod {
  const _Sub2ApiModelPlazaTimePeriod({
    required this.startTime,
    required this.endTime,
    required this.multiplier,
  });

  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final Sub2ApiDecimal multiplier;

  /// Create a copy of Sub2ApiModelPlazaTimePeriod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiModelPlazaTimePeriodCopyWith<_Sub2ApiModelPlazaTimePeriod>
  get copyWith =>
      __$Sub2ApiModelPlazaTimePeriodCopyWithImpl<_Sub2ApiModelPlazaTimePeriod>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiModelPlazaTimePeriod &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.multiplier, multiplier) ||
                other.multiplier == multiplier));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime, multiplier);

  @override
  String toString() {
    return 'Sub2ApiModelPlazaTimePeriod(startTime: $startTime, endTime: $endTime, multiplier: $multiplier)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiModelPlazaTimePeriodCopyWith<$Res>
    implements $Sub2ApiModelPlazaTimePeriodCopyWith<$Res> {
  factory _$Sub2ApiModelPlazaTimePeriodCopyWith(
    _Sub2ApiModelPlazaTimePeriod value,
    $Res Function(_Sub2ApiModelPlazaTimePeriod) _then,
  ) = __$Sub2ApiModelPlazaTimePeriodCopyWithImpl;
  @override
  @useResult
  $Res call({String startTime, String endTime, Sub2ApiDecimal multiplier});
}

/// @nodoc
class __$Sub2ApiModelPlazaTimePeriodCopyWithImpl<$Res>
    implements _$Sub2ApiModelPlazaTimePeriodCopyWith<$Res> {
  __$Sub2ApiModelPlazaTimePeriodCopyWithImpl(this._self, this._then);

  final _Sub2ApiModelPlazaTimePeriod _self;
  final $Res Function(_Sub2ApiModelPlazaTimePeriod) _then;

  /// Create a copy of Sub2ApiModelPlazaTimePeriod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? multiplier = null,
  }) {
    return _then(
      _Sub2ApiModelPlazaTimePeriod(
        startTime: null == startTime
            ? _self.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        endTime: null == endTime
            ? _self.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String,
        multiplier: null == multiplier
            ? _self.multiplier
            : multiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiModelPlazaTimePricing {
  String get timezone;
  bool get weekdaysOnly;
  List<Sub2ApiModelPlazaTimePeriod> get periods;

  /// Create a copy of Sub2ApiModelPlazaTimePricing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiModelPlazaTimePricingCopyWith<Sub2ApiModelPlazaTimePricing>
  get copyWith =>
      _$Sub2ApiModelPlazaTimePricingCopyWithImpl<Sub2ApiModelPlazaTimePricing>(
        this as Sub2ApiModelPlazaTimePricing,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiModelPlazaTimePricing &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.weekdaysOnly, weekdaysOnly) ||
                other.weekdaysOnly == weekdaysOnly) &&
            const DeepCollectionEquality().equals(other.periods, periods));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    timezone,
    weekdaysOnly,
    const DeepCollectionEquality().hash(periods),
  );

  @override
  String toString() {
    return 'Sub2ApiModelPlazaTimePricing(timezone: $timezone, weekdaysOnly: $weekdaysOnly, periods: $periods)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiModelPlazaTimePricingCopyWith<$Res> {
  factory $Sub2ApiModelPlazaTimePricingCopyWith(
    Sub2ApiModelPlazaTimePricing value,
    $Res Function(Sub2ApiModelPlazaTimePricing) _then,
  ) = _$Sub2ApiModelPlazaTimePricingCopyWithImpl;
  @useResult
  $Res call({
    String timezone,
    bool weekdaysOnly,
    List<Sub2ApiModelPlazaTimePeriod> periods,
  });
}

/// @nodoc
class _$Sub2ApiModelPlazaTimePricingCopyWithImpl<$Res>
    implements $Sub2ApiModelPlazaTimePricingCopyWith<$Res> {
  _$Sub2ApiModelPlazaTimePricingCopyWithImpl(this._self, this._then);

  final Sub2ApiModelPlazaTimePricing _self;
  final $Res Function(Sub2ApiModelPlazaTimePricing) _then;

  /// Create a copy of Sub2ApiModelPlazaTimePricing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timezone = null,
    Object? weekdaysOnly = null,
    Object? periods = null,
  }) {
    return _then(
      _self.copyWith(
        timezone: null == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
        weekdaysOnly: null == weekdaysOnly
            ? _self.weekdaysOnly
            : weekdaysOnly // ignore: cast_nullable_to_non_nullable
                  as bool,
        periods: null == periods
            ? _self.periods
            : periods // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiModelPlazaTimePeriod>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiModelPlazaTimePricing].
extension Sub2ApiModelPlazaTimePricingPatterns on Sub2ApiModelPlazaTimePricing {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiModelPlazaTimePricing value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaTimePricing() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiModelPlazaTimePricing value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaTimePricing():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiModelPlazaTimePricing value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaTimePricing() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String timezone,
      bool weekdaysOnly,
      List<Sub2ApiModelPlazaTimePeriod> periods,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaTimePricing() when $default != null:
        return $default(_that.timezone, _that.weekdaysOnly, _that.periods);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String timezone,
      bool weekdaysOnly,
      List<Sub2ApiModelPlazaTimePeriod> periods,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaTimePricing():
        return $default(_that.timezone, _that.weekdaysOnly, _that.periods);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String timezone,
      bool weekdaysOnly,
      List<Sub2ApiModelPlazaTimePeriod> periods,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaTimePricing() when $default != null:
        return $default(_that.timezone, _that.weekdaysOnly, _that.periods);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiModelPlazaTimePricing implements Sub2ApiModelPlazaTimePricing {
  const _Sub2ApiModelPlazaTimePricing({
    required this.timezone,
    required this.weekdaysOnly,
    required final List<Sub2ApiModelPlazaTimePeriod> periods,
  }) : _periods = periods;

  @override
  final String timezone;
  @override
  final bool weekdaysOnly;
  final List<Sub2ApiModelPlazaTimePeriod> _periods;
  @override
  List<Sub2ApiModelPlazaTimePeriod> get periods {
    if (_periods is EqualUnmodifiableListView) return _periods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periods);
  }

  /// Create a copy of Sub2ApiModelPlazaTimePricing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiModelPlazaTimePricingCopyWith<_Sub2ApiModelPlazaTimePricing>
  get copyWith =>
      __$Sub2ApiModelPlazaTimePricingCopyWithImpl<
        _Sub2ApiModelPlazaTimePricing
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiModelPlazaTimePricing &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.weekdaysOnly, weekdaysOnly) ||
                other.weekdaysOnly == weekdaysOnly) &&
            const DeepCollectionEquality().equals(other._periods, _periods));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    timezone,
    weekdaysOnly,
    const DeepCollectionEquality().hash(_periods),
  );

  @override
  String toString() {
    return 'Sub2ApiModelPlazaTimePricing(timezone: $timezone, weekdaysOnly: $weekdaysOnly, periods: $periods)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiModelPlazaTimePricingCopyWith<$Res>
    implements $Sub2ApiModelPlazaTimePricingCopyWith<$Res> {
  factory _$Sub2ApiModelPlazaTimePricingCopyWith(
    _Sub2ApiModelPlazaTimePricing value,
    $Res Function(_Sub2ApiModelPlazaTimePricing) _then,
  ) = __$Sub2ApiModelPlazaTimePricingCopyWithImpl;
  @override
  @useResult
  $Res call({
    String timezone,
    bool weekdaysOnly,
    List<Sub2ApiModelPlazaTimePeriod> periods,
  });
}

/// @nodoc
class __$Sub2ApiModelPlazaTimePricingCopyWithImpl<$Res>
    implements _$Sub2ApiModelPlazaTimePricingCopyWith<$Res> {
  __$Sub2ApiModelPlazaTimePricingCopyWithImpl(this._self, this._then);

  final _Sub2ApiModelPlazaTimePricing _self;
  final $Res Function(_Sub2ApiModelPlazaTimePricing) _then;

  /// Create a copy of Sub2ApiModelPlazaTimePricing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? timezone = null,
    Object? weekdaysOnly = null,
    Object? periods = null,
  }) {
    return _then(
      _Sub2ApiModelPlazaTimePricing(
        timezone: null == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
        weekdaysOnly: null == weekdaysOnly
            ? _self.weekdaysOnly
            : weekdaysOnly // ignore: cast_nullable_to_non_nullable
                  as bool,
        periods: null == periods
            ? _self._periods
            : periods // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiModelPlazaTimePeriod>,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiModelPlazaModel {
  String get name;
  String get platform;
  Sub2ApiSupportedModelPricing? get pricing;
  Sub2ApiModelPlazaOfficialPricing? get officialPricing;
  String? get longContextBasis;
  Sub2ApiModelPlazaTimePricing? get timePricing;

  /// Create a copy of Sub2ApiModelPlazaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiModelPlazaModelCopyWith<Sub2ApiModelPlazaModel> get copyWith =>
      _$Sub2ApiModelPlazaModelCopyWithImpl<Sub2ApiModelPlazaModel>(
        this as Sub2ApiModelPlazaModel,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiModelPlazaModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.pricing, pricing) || other.pricing == pricing) &&
            (identical(other.officialPricing, officialPricing) ||
                other.officialPricing == officialPricing) &&
            (identical(other.longContextBasis, longContextBasis) ||
                other.longContextBasis == longContextBasis) &&
            (identical(other.timePricing, timePricing) ||
                other.timePricing == timePricing));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    platform,
    pricing,
    officialPricing,
    longContextBasis,
    timePricing,
  );

  @override
  String toString() {
    return 'Sub2ApiModelPlazaModel(name: $name, platform: $platform, pricing: $pricing, officialPricing: $officialPricing, longContextBasis: $longContextBasis, timePricing: $timePricing)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiModelPlazaModelCopyWith<$Res> {
  factory $Sub2ApiModelPlazaModelCopyWith(
    Sub2ApiModelPlazaModel value,
    $Res Function(Sub2ApiModelPlazaModel) _then,
  ) = _$Sub2ApiModelPlazaModelCopyWithImpl;
  @useResult
  $Res call({
    String name,
    String platform,
    Sub2ApiSupportedModelPricing? pricing,
    Sub2ApiModelPlazaOfficialPricing? officialPricing,
    String? longContextBasis,
    Sub2ApiModelPlazaTimePricing? timePricing,
  });

  $Sub2ApiSupportedModelPricingCopyWith<$Res>? get pricing;
  $Sub2ApiModelPlazaOfficialPricingCopyWith<$Res>? get officialPricing;
  $Sub2ApiModelPlazaTimePricingCopyWith<$Res>? get timePricing;
}

/// @nodoc
class _$Sub2ApiModelPlazaModelCopyWithImpl<$Res>
    implements $Sub2ApiModelPlazaModelCopyWith<$Res> {
  _$Sub2ApiModelPlazaModelCopyWithImpl(this._self, this._then);

  final Sub2ApiModelPlazaModel _self;
  final $Res Function(Sub2ApiModelPlazaModel) _then;

  /// Create a copy of Sub2ApiModelPlazaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? platform = null,
    Object? pricing = freezed,
    Object? officialPricing = freezed,
    Object? longContextBasis = freezed,
    Object? timePricing = freezed,
  }) {
    return _then(
      _self.copyWith(
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        pricing: freezed == pricing
            ? _self.pricing
            : pricing // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiSupportedModelPricing?,
        officialPricing: freezed == officialPricing
            ? _self.officialPricing
            : officialPricing // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiModelPlazaOfficialPricing?,
        longContextBasis: freezed == longContextBasis
            ? _self.longContextBasis
            : longContextBasis // ignore: cast_nullable_to_non_nullable
                  as String?,
        timePricing: freezed == timePricing
            ? _self.timePricing
            : timePricing // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiModelPlazaTimePricing?,
      ),
    );
  }

  /// Create a copy of Sub2ApiModelPlazaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiSupportedModelPricingCopyWith<$Res>? get pricing {
    if (_self.pricing == null) {
      return null;
    }

    return $Sub2ApiSupportedModelPricingCopyWith<$Res>(_self.pricing!, (value) {
      return _then(_self.copyWith(pricing: value));
    });
  }

  /// Create a copy of Sub2ApiModelPlazaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiModelPlazaOfficialPricingCopyWith<$Res>? get officialPricing {
    if (_self.officialPricing == null) {
      return null;
    }

    return $Sub2ApiModelPlazaOfficialPricingCopyWith<$Res>(
      _self.officialPricing!,
      (value) {
        return _then(_self.copyWith(officialPricing: value));
      },
    );
  }

  /// Create a copy of Sub2ApiModelPlazaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiModelPlazaTimePricingCopyWith<$Res>? get timePricing {
    if (_self.timePricing == null) {
      return null;
    }

    return $Sub2ApiModelPlazaTimePricingCopyWith<$Res>(_self.timePricing!, (
      value,
    ) {
      return _then(_self.copyWith(timePricing: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiModelPlazaModel].
extension Sub2ApiModelPlazaModelPatterns on Sub2ApiModelPlazaModel {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiModelPlazaModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaModel() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiModelPlazaModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaModel():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiModelPlazaModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaModel() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String name,
      String platform,
      Sub2ApiSupportedModelPricing? pricing,
      Sub2ApiModelPlazaOfficialPricing? officialPricing,
      String? longContextBasis,
      Sub2ApiModelPlazaTimePricing? timePricing,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaModel() when $default != null:
        return $default(
          _that.name,
          _that.platform,
          _that.pricing,
          _that.officialPricing,
          _that.longContextBasis,
          _that.timePricing,
        );
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String name,
      String platform,
      Sub2ApiSupportedModelPricing? pricing,
      Sub2ApiModelPlazaOfficialPricing? officialPricing,
      String? longContextBasis,
      Sub2ApiModelPlazaTimePricing? timePricing,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaModel():
        return $default(
          _that.name,
          _that.platform,
          _that.pricing,
          _that.officialPricing,
          _that.longContextBasis,
          _that.timePricing,
        );
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String name,
      String platform,
      Sub2ApiSupportedModelPricing? pricing,
      Sub2ApiModelPlazaOfficialPricing? officialPricing,
      String? longContextBasis,
      Sub2ApiModelPlazaTimePricing? timePricing,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaModel() when $default != null:
        return $default(
          _that.name,
          _that.platform,
          _that.pricing,
          _that.officialPricing,
          _that.longContextBasis,
          _that.timePricing,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiModelPlazaModel implements Sub2ApiModelPlazaModel {
  const _Sub2ApiModelPlazaModel({
    required this.name,
    required this.platform,
    this.pricing,
    this.officialPricing,
    this.longContextBasis,
    this.timePricing,
  });

  @override
  final String name;
  @override
  final String platform;
  @override
  final Sub2ApiSupportedModelPricing? pricing;
  @override
  final Sub2ApiModelPlazaOfficialPricing? officialPricing;
  @override
  final String? longContextBasis;
  @override
  final Sub2ApiModelPlazaTimePricing? timePricing;

  /// Create a copy of Sub2ApiModelPlazaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiModelPlazaModelCopyWith<_Sub2ApiModelPlazaModel> get copyWith =>
      __$Sub2ApiModelPlazaModelCopyWithImpl<_Sub2ApiModelPlazaModel>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiModelPlazaModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.pricing, pricing) || other.pricing == pricing) &&
            (identical(other.officialPricing, officialPricing) ||
                other.officialPricing == officialPricing) &&
            (identical(other.longContextBasis, longContextBasis) ||
                other.longContextBasis == longContextBasis) &&
            (identical(other.timePricing, timePricing) ||
                other.timePricing == timePricing));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    platform,
    pricing,
    officialPricing,
    longContextBasis,
    timePricing,
  );

  @override
  String toString() {
    return 'Sub2ApiModelPlazaModel(name: $name, platform: $platform, pricing: $pricing, officialPricing: $officialPricing, longContextBasis: $longContextBasis, timePricing: $timePricing)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiModelPlazaModelCopyWith<$Res>
    implements $Sub2ApiModelPlazaModelCopyWith<$Res> {
  factory _$Sub2ApiModelPlazaModelCopyWith(
    _Sub2ApiModelPlazaModel value,
    $Res Function(_Sub2ApiModelPlazaModel) _then,
  ) = __$Sub2ApiModelPlazaModelCopyWithImpl;
  @override
  @useResult
  $Res call({
    String name,
    String platform,
    Sub2ApiSupportedModelPricing? pricing,
    Sub2ApiModelPlazaOfficialPricing? officialPricing,
    String? longContextBasis,
    Sub2ApiModelPlazaTimePricing? timePricing,
  });

  @override
  $Sub2ApiSupportedModelPricingCopyWith<$Res>? get pricing;
  @override
  $Sub2ApiModelPlazaOfficialPricingCopyWith<$Res>? get officialPricing;
  @override
  $Sub2ApiModelPlazaTimePricingCopyWith<$Res>? get timePricing;
}

/// @nodoc
class __$Sub2ApiModelPlazaModelCopyWithImpl<$Res>
    implements _$Sub2ApiModelPlazaModelCopyWith<$Res> {
  __$Sub2ApiModelPlazaModelCopyWithImpl(this._self, this._then);

  final _Sub2ApiModelPlazaModel _self;
  final $Res Function(_Sub2ApiModelPlazaModel) _then;

  /// Create a copy of Sub2ApiModelPlazaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? platform = null,
    Object? pricing = freezed,
    Object? officialPricing = freezed,
    Object? longContextBasis = freezed,
    Object? timePricing = freezed,
  }) {
    return _then(
      _Sub2ApiModelPlazaModel(
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        pricing: freezed == pricing
            ? _self.pricing
            : pricing // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiSupportedModelPricing?,
        officialPricing: freezed == officialPricing
            ? _self.officialPricing
            : officialPricing // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiModelPlazaOfficialPricing?,
        longContextBasis: freezed == longContextBasis
            ? _self.longContextBasis
            : longContextBasis // ignore: cast_nullable_to_non_nullable
                  as String?,
        timePricing: freezed == timePricing
            ? _self.timePricing
            : timePricing // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiModelPlazaTimePricing?,
      ),
    );
  }

  /// Create a copy of Sub2ApiModelPlazaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiSupportedModelPricingCopyWith<$Res>? get pricing {
    if (_self.pricing == null) {
      return null;
    }

    return $Sub2ApiSupportedModelPricingCopyWith<$Res>(_self.pricing!, (value) {
      return _then(_self.copyWith(pricing: value));
    });
  }

  /// Create a copy of Sub2ApiModelPlazaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiModelPlazaOfficialPricingCopyWith<$Res>? get officialPricing {
    if (_self.officialPricing == null) {
      return null;
    }

    return $Sub2ApiModelPlazaOfficialPricingCopyWith<$Res>(
      _self.officialPricing!,
      (value) {
        return _then(_self.copyWith(officialPricing: value));
      },
    );
  }

  /// Create a copy of Sub2ApiModelPlazaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiModelPlazaTimePricingCopyWith<$Res>? get timePricing {
    if (_self.timePricing == null) {
      return null;
    }

    return $Sub2ApiModelPlazaTimePricingCopyWith<$Res>(_self.timePricing!, (
      value,
    ) {
      return _then(_self.copyWith(timePricing: value));
    });
  }
}

/// @nodoc
mixin _$Sub2ApiModelPlazaGroup {
  int get id;
  String get name;
  String get description;
  String get platform;
  String get subscriptionType;
  Sub2ApiDecimal get rateMultiplier;
  Sub2ApiDecimal? get userRateMultiplier;
  bool get peakRateEnabled;
  String get peakStart;
  String get peakEnd;
  Sub2ApiDecimal get peakRateMultiplier;
  bool get isExclusive;
  bool get imageRateIndependent;
  Sub2ApiDecimal get imageRateMultiplier;
  bool get longContextPricingEnabled;
  List<Sub2ApiModelPlazaModel> get models;

  /// Create a copy of Sub2ApiModelPlazaGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiModelPlazaGroupCopyWith<Sub2ApiModelPlazaGroup> get copyWith =>
      _$Sub2ApiModelPlazaGroupCopyWithImpl<Sub2ApiModelPlazaGroup>(
        this as Sub2ApiModelPlazaGroup,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiModelPlazaGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.subscriptionType, subscriptionType) ||
                other.subscriptionType == subscriptionType) &&
            (identical(other.rateMultiplier, rateMultiplier) ||
                other.rateMultiplier == rateMultiplier) &&
            (identical(other.userRateMultiplier, userRateMultiplier) ||
                other.userRateMultiplier == userRateMultiplier) &&
            (identical(other.peakRateEnabled, peakRateEnabled) ||
                other.peakRateEnabled == peakRateEnabled) &&
            (identical(other.peakStart, peakStart) ||
                other.peakStart == peakStart) &&
            (identical(other.peakEnd, peakEnd) || other.peakEnd == peakEnd) &&
            (identical(other.peakRateMultiplier, peakRateMultiplier) ||
                other.peakRateMultiplier == peakRateMultiplier) &&
            (identical(other.isExclusive, isExclusive) ||
                other.isExclusive == isExclusive) &&
            (identical(other.imageRateIndependent, imageRateIndependent) ||
                other.imageRateIndependent == imageRateIndependent) &&
            (identical(other.imageRateMultiplier, imageRateMultiplier) ||
                other.imageRateMultiplier == imageRateMultiplier) &&
            (identical(
                  other.longContextPricingEnabled,
                  longContextPricingEnabled,
                ) ||
                other.longContextPricingEnabled == longContextPricingEnabled) &&
            const DeepCollectionEquality().equals(other.models, models));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    platform,
    subscriptionType,
    rateMultiplier,
    userRateMultiplier,
    peakRateEnabled,
    peakStart,
    peakEnd,
    peakRateMultiplier,
    isExclusive,
    imageRateIndependent,
    imageRateMultiplier,
    longContextPricingEnabled,
    const DeepCollectionEquality().hash(models),
  );

  @override
  String toString() {
    return 'Sub2ApiModelPlazaGroup(id: $id, name: $name, description: $description, platform: $platform, subscriptionType: $subscriptionType, rateMultiplier: $rateMultiplier, userRateMultiplier: $userRateMultiplier, peakRateEnabled: $peakRateEnabled, peakStart: $peakStart, peakEnd: $peakEnd, peakRateMultiplier: $peakRateMultiplier, isExclusive: $isExclusive, imageRateIndependent: $imageRateIndependent, imageRateMultiplier: $imageRateMultiplier, longContextPricingEnabled: $longContextPricingEnabled, models: $models)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiModelPlazaGroupCopyWith<$Res> {
  factory $Sub2ApiModelPlazaGroupCopyWith(
    Sub2ApiModelPlazaGroup value,
    $Res Function(Sub2ApiModelPlazaGroup) _then,
  ) = _$Sub2ApiModelPlazaGroupCopyWithImpl;
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    String platform,
    String subscriptionType,
    Sub2ApiDecimal rateMultiplier,
    Sub2ApiDecimal? userRateMultiplier,
    bool peakRateEnabled,
    String peakStart,
    String peakEnd,
    Sub2ApiDecimal peakRateMultiplier,
    bool isExclusive,
    bool imageRateIndependent,
    Sub2ApiDecimal imageRateMultiplier,
    bool longContextPricingEnabled,
    List<Sub2ApiModelPlazaModel> models,
  });
}

/// @nodoc
class _$Sub2ApiModelPlazaGroupCopyWithImpl<$Res>
    implements $Sub2ApiModelPlazaGroupCopyWith<$Res> {
  _$Sub2ApiModelPlazaGroupCopyWithImpl(this._self, this._then);

  final Sub2ApiModelPlazaGroup _self;
  final $Res Function(Sub2ApiModelPlazaGroup) _then;

  /// Create a copy of Sub2ApiModelPlazaGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? platform = null,
    Object? subscriptionType = null,
    Object? rateMultiplier = null,
    Object? userRateMultiplier = freezed,
    Object? peakRateEnabled = null,
    Object? peakStart = null,
    Object? peakEnd = null,
    Object? peakRateMultiplier = null,
    Object? isExclusive = null,
    Object? imageRateIndependent = null,
    Object? imageRateMultiplier = null,
    Object? longContextPricingEnabled = null,
    Object? models = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        subscriptionType: null == subscriptionType
            ? _self.subscriptionType
            : subscriptionType // ignore: cast_nullable_to_non_nullable
                  as String,
        rateMultiplier: null == rateMultiplier
            ? _self.rateMultiplier
            : rateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        userRateMultiplier: freezed == userRateMultiplier
            ? _self.userRateMultiplier
            : userRateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        peakRateEnabled: null == peakRateEnabled
            ? _self.peakRateEnabled
            : peakRateEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        peakStart: null == peakStart
            ? _self.peakStart
            : peakStart // ignore: cast_nullable_to_non_nullable
                  as String,
        peakEnd: null == peakEnd
            ? _self.peakEnd
            : peakEnd // ignore: cast_nullable_to_non_nullable
                  as String,
        peakRateMultiplier: null == peakRateMultiplier
            ? _self.peakRateMultiplier
            : peakRateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        isExclusive: null == isExclusive
            ? _self.isExclusive
            : isExclusive // ignore: cast_nullable_to_non_nullable
                  as bool,
        imageRateIndependent: null == imageRateIndependent
            ? _self.imageRateIndependent
            : imageRateIndependent // ignore: cast_nullable_to_non_nullable
                  as bool,
        imageRateMultiplier: null == imageRateMultiplier
            ? _self.imageRateMultiplier
            : imageRateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        longContextPricingEnabled: null == longContextPricingEnabled
            ? _self.longContextPricingEnabled
            : longContextPricingEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        models: null == models
            ? _self.models
            : models // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiModelPlazaModel>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiModelPlazaGroup].
extension Sub2ApiModelPlazaGroupPatterns on Sub2ApiModelPlazaGroup {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiModelPlazaGroup value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaGroup() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiModelPlazaGroup value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaGroup():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiModelPlazaGroup value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaGroup() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int id,
      String name,
      String description,
      String platform,
      String subscriptionType,
      Sub2ApiDecimal rateMultiplier,
      Sub2ApiDecimal? userRateMultiplier,
      bool peakRateEnabled,
      String peakStart,
      String peakEnd,
      Sub2ApiDecimal peakRateMultiplier,
      bool isExclusive,
      bool imageRateIndependent,
      Sub2ApiDecimal imageRateMultiplier,
      bool longContextPricingEnabled,
      List<Sub2ApiModelPlazaModel> models,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaGroup() when $default != null:
        return $default(
          _that.id,
          _that.name,
          _that.description,
          _that.platform,
          _that.subscriptionType,
          _that.rateMultiplier,
          _that.userRateMultiplier,
          _that.peakRateEnabled,
          _that.peakStart,
          _that.peakEnd,
          _that.peakRateMultiplier,
          _that.isExclusive,
          _that.imageRateIndependent,
          _that.imageRateMultiplier,
          _that.longContextPricingEnabled,
          _that.models,
        );
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int id,
      String name,
      String description,
      String platform,
      String subscriptionType,
      Sub2ApiDecimal rateMultiplier,
      Sub2ApiDecimal? userRateMultiplier,
      bool peakRateEnabled,
      String peakStart,
      String peakEnd,
      Sub2ApiDecimal peakRateMultiplier,
      bool isExclusive,
      bool imageRateIndependent,
      Sub2ApiDecimal imageRateMultiplier,
      bool longContextPricingEnabled,
      List<Sub2ApiModelPlazaModel> models,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaGroup():
        return $default(
          _that.id,
          _that.name,
          _that.description,
          _that.platform,
          _that.subscriptionType,
          _that.rateMultiplier,
          _that.userRateMultiplier,
          _that.peakRateEnabled,
          _that.peakStart,
          _that.peakEnd,
          _that.peakRateMultiplier,
          _that.isExclusive,
          _that.imageRateIndependent,
          _that.imageRateMultiplier,
          _that.longContextPricingEnabled,
          _that.models,
        );
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int id,
      String name,
      String description,
      String platform,
      String subscriptionType,
      Sub2ApiDecimal rateMultiplier,
      Sub2ApiDecimal? userRateMultiplier,
      bool peakRateEnabled,
      String peakStart,
      String peakEnd,
      Sub2ApiDecimal peakRateMultiplier,
      bool isExclusive,
      bool imageRateIndependent,
      Sub2ApiDecimal imageRateMultiplier,
      bool longContextPricingEnabled,
      List<Sub2ApiModelPlazaModel> models,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlazaGroup() when $default != null:
        return $default(
          _that.id,
          _that.name,
          _that.description,
          _that.platform,
          _that.subscriptionType,
          _that.rateMultiplier,
          _that.userRateMultiplier,
          _that.peakRateEnabled,
          _that.peakStart,
          _that.peakEnd,
          _that.peakRateMultiplier,
          _that.isExclusive,
          _that.imageRateIndependent,
          _that.imageRateMultiplier,
          _that.longContextPricingEnabled,
          _that.models,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiModelPlazaGroup implements Sub2ApiModelPlazaGroup {
  const _Sub2ApiModelPlazaGroup({
    required this.id,
    required this.name,
    required this.description,
    required this.platform,
    required this.subscriptionType,
    required this.rateMultiplier,
    this.userRateMultiplier,
    required this.peakRateEnabled,
    required this.peakStart,
    required this.peakEnd,
    required this.peakRateMultiplier,
    required this.isExclusive,
    required this.imageRateIndependent,
    required this.imageRateMultiplier,
    required this.longContextPricingEnabled,
    required final List<Sub2ApiModelPlazaModel> models,
  }) : _models = models;

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String platform;
  @override
  final String subscriptionType;
  @override
  final Sub2ApiDecimal rateMultiplier;
  @override
  final Sub2ApiDecimal? userRateMultiplier;
  @override
  final bool peakRateEnabled;
  @override
  final String peakStart;
  @override
  final String peakEnd;
  @override
  final Sub2ApiDecimal peakRateMultiplier;
  @override
  final bool isExclusive;
  @override
  final bool imageRateIndependent;
  @override
  final Sub2ApiDecimal imageRateMultiplier;
  @override
  final bool longContextPricingEnabled;
  final List<Sub2ApiModelPlazaModel> _models;
  @override
  List<Sub2ApiModelPlazaModel> get models {
    if (_models is EqualUnmodifiableListView) return _models;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_models);
  }

  /// Create a copy of Sub2ApiModelPlazaGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiModelPlazaGroupCopyWith<_Sub2ApiModelPlazaGroup> get copyWith =>
      __$Sub2ApiModelPlazaGroupCopyWithImpl<_Sub2ApiModelPlazaGroup>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiModelPlazaGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.subscriptionType, subscriptionType) ||
                other.subscriptionType == subscriptionType) &&
            (identical(other.rateMultiplier, rateMultiplier) ||
                other.rateMultiplier == rateMultiplier) &&
            (identical(other.userRateMultiplier, userRateMultiplier) ||
                other.userRateMultiplier == userRateMultiplier) &&
            (identical(other.peakRateEnabled, peakRateEnabled) ||
                other.peakRateEnabled == peakRateEnabled) &&
            (identical(other.peakStart, peakStart) ||
                other.peakStart == peakStart) &&
            (identical(other.peakEnd, peakEnd) || other.peakEnd == peakEnd) &&
            (identical(other.peakRateMultiplier, peakRateMultiplier) ||
                other.peakRateMultiplier == peakRateMultiplier) &&
            (identical(other.isExclusive, isExclusive) ||
                other.isExclusive == isExclusive) &&
            (identical(other.imageRateIndependent, imageRateIndependent) ||
                other.imageRateIndependent == imageRateIndependent) &&
            (identical(other.imageRateMultiplier, imageRateMultiplier) ||
                other.imageRateMultiplier == imageRateMultiplier) &&
            (identical(
                  other.longContextPricingEnabled,
                  longContextPricingEnabled,
                ) ||
                other.longContextPricingEnabled == longContextPricingEnabled) &&
            const DeepCollectionEquality().equals(other._models, _models));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    platform,
    subscriptionType,
    rateMultiplier,
    userRateMultiplier,
    peakRateEnabled,
    peakStart,
    peakEnd,
    peakRateMultiplier,
    isExclusive,
    imageRateIndependent,
    imageRateMultiplier,
    longContextPricingEnabled,
    const DeepCollectionEquality().hash(_models),
  );

  @override
  String toString() {
    return 'Sub2ApiModelPlazaGroup(id: $id, name: $name, description: $description, platform: $platform, subscriptionType: $subscriptionType, rateMultiplier: $rateMultiplier, userRateMultiplier: $userRateMultiplier, peakRateEnabled: $peakRateEnabled, peakStart: $peakStart, peakEnd: $peakEnd, peakRateMultiplier: $peakRateMultiplier, isExclusive: $isExclusive, imageRateIndependent: $imageRateIndependent, imageRateMultiplier: $imageRateMultiplier, longContextPricingEnabled: $longContextPricingEnabled, models: $models)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiModelPlazaGroupCopyWith<$Res>
    implements $Sub2ApiModelPlazaGroupCopyWith<$Res> {
  factory _$Sub2ApiModelPlazaGroupCopyWith(
    _Sub2ApiModelPlazaGroup value,
    $Res Function(_Sub2ApiModelPlazaGroup) _then,
  ) = __$Sub2ApiModelPlazaGroupCopyWithImpl;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    String platform,
    String subscriptionType,
    Sub2ApiDecimal rateMultiplier,
    Sub2ApiDecimal? userRateMultiplier,
    bool peakRateEnabled,
    String peakStart,
    String peakEnd,
    Sub2ApiDecimal peakRateMultiplier,
    bool isExclusive,
    bool imageRateIndependent,
    Sub2ApiDecimal imageRateMultiplier,
    bool longContextPricingEnabled,
    List<Sub2ApiModelPlazaModel> models,
  });
}

/// @nodoc
class __$Sub2ApiModelPlazaGroupCopyWithImpl<$Res>
    implements _$Sub2ApiModelPlazaGroupCopyWith<$Res> {
  __$Sub2ApiModelPlazaGroupCopyWithImpl(this._self, this._then);

  final _Sub2ApiModelPlazaGroup _self;
  final $Res Function(_Sub2ApiModelPlazaGroup) _then;

  /// Create a copy of Sub2ApiModelPlazaGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? platform = null,
    Object? subscriptionType = null,
    Object? rateMultiplier = null,
    Object? userRateMultiplier = freezed,
    Object? peakRateEnabled = null,
    Object? peakStart = null,
    Object? peakEnd = null,
    Object? peakRateMultiplier = null,
    Object? isExclusive = null,
    Object? imageRateIndependent = null,
    Object? imageRateMultiplier = null,
    Object? longContextPricingEnabled = null,
    Object? models = null,
  }) {
    return _then(
      _Sub2ApiModelPlazaGroup(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _self.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        subscriptionType: null == subscriptionType
            ? _self.subscriptionType
            : subscriptionType // ignore: cast_nullable_to_non_nullable
                  as String,
        rateMultiplier: null == rateMultiplier
            ? _self.rateMultiplier
            : rateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        userRateMultiplier: freezed == userRateMultiplier
            ? _self.userRateMultiplier
            : userRateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        peakRateEnabled: null == peakRateEnabled
            ? _self.peakRateEnabled
            : peakRateEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        peakStart: null == peakStart
            ? _self.peakStart
            : peakStart // ignore: cast_nullable_to_non_nullable
                  as String,
        peakEnd: null == peakEnd
            ? _self.peakEnd
            : peakEnd // ignore: cast_nullable_to_non_nullable
                  as String,
        peakRateMultiplier: null == peakRateMultiplier
            ? _self.peakRateMultiplier
            : peakRateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        isExclusive: null == isExclusive
            ? _self.isExclusive
            : isExclusive // ignore: cast_nullable_to_non_nullable
                  as bool,
        imageRateIndependent: null == imageRateIndependent
            ? _self.imageRateIndependent
            : imageRateIndependent // ignore: cast_nullable_to_non_nullable
                  as bool,
        imageRateMultiplier: null == imageRateMultiplier
            ? _self.imageRateMultiplier
            : imageRateMultiplier // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        longContextPricingEnabled: null == longContextPricingEnabled
            ? _self.longContextPricingEnabled
            : longContextPricingEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        models: null == models
            ? _self._models
            : models // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiModelPlazaModel>,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiModelPlaza {
  String get description;
  List<Sub2ApiModelPlazaGroup> get groups;

  /// Create a copy of Sub2ApiModelPlaza
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiModelPlazaCopyWith<Sub2ApiModelPlaza> get copyWith =>
      _$Sub2ApiModelPlazaCopyWithImpl<Sub2ApiModelPlaza>(
        this as Sub2ApiModelPlaza,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiModelPlaza &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.groups, groups));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    description,
    const DeepCollectionEquality().hash(groups),
  );

  @override
  String toString() {
    return 'Sub2ApiModelPlaza(description: $description, groups: $groups)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiModelPlazaCopyWith<$Res> {
  factory $Sub2ApiModelPlazaCopyWith(
    Sub2ApiModelPlaza value,
    $Res Function(Sub2ApiModelPlaza) _then,
  ) = _$Sub2ApiModelPlazaCopyWithImpl;
  @useResult
  $Res call({String description, List<Sub2ApiModelPlazaGroup> groups});
}

/// @nodoc
class _$Sub2ApiModelPlazaCopyWithImpl<$Res>
    implements $Sub2ApiModelPlazaCopyWith<$Res> {
  _$Sub2ApiModelPlazaCopyWithImpl(this._self, this._then);

  final Sub2ApiModelPlaza _self;
  final $Res Function(Sub2ApiModelPlaza) _then;

  /// Create a copy of Sub2ApiModelPlaza
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? description = null, Object? groups = null}) {
    return _then(
      _self.copyWith(
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        groups: null == groups
            ? _self.groups
            : groups // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiModelPlazaGroup>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiModelPlaza].
extension Sub2ApiModelPlazaPatterns on Sub2ApiModelPlaza {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sub2ApiModelPlaza value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlaza() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sub2ApiModelPlaza value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlaza():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sub2ApiModelPlaza value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlaza() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String description, List<Sub2ApiModelPlazaGroup> groups)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlaza() when $default != null:
        return $default(_that.description, _that.groups);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String description, List<Sub2ApiModelPlazaGroup> groups)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlaza():
        return $default(_that.description, _that.groups);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String description, List<Sub2ApiModelPlazaGroup> groups)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiModelPlaza() when $default != null:
        return $default(_that.description, _that.groups);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiModelPlaza implements Sub2ApiModelPlaza {
  const _Sub2ApiModelPlaza({
    required this.description,
    required final List<Sub2ApiModelPlazaGroup> groups,
  }) : _groups = groups;

  @override
  final String description;
  final List<Sub2ApiModelPlazaGroup> _groups;
  @override
  List<Sub2ApiModelPlazaGroup> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  /// Create a copy of Sub2ApiModelPlaza
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiModelPlazaCopyWith<_Sub2ApiModelPlaza> get copyWith =>
      __$Sub2ApiModelPlazaCopyWithImpl<_Sub2ApiModelPlaza>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiModelPlaza &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    description,
    const DeepCollectionEquality().hash(_groups),
  );

  @override
  String toString() {
    return 'Sub2ApiModelPlaza(description: $description, groups: $groups)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiModelPlazaCopyWith<$Res>
    implements $Sub2ApiModelPlazaCopyWith<$Res> {
  factory _$Sub2ApiModelPlazaCopyWith(
    _Sub2ApiModelPlaza value,
    $Res Function(_Sub2ApiModelPlaza) _then,
  ) = __$Sub2ApiModelPlazaCopyWithImpl;
  @override
  @useResult
  $Res call({String description, List<Sub2ApiModelPlazaGroup> groups});
}

/// @nodoc
class __$Sub2ApiModelPlazaCopyWithImpl<$Res>
    implements _$Sub2ApiModelPlazaCopyWith<$Res> {
  __$Sub2ApiModelPlazaCopyWithImpl(this._self, this._then);

  final _Sub2ApiModelPlaza _self;
  final $Res Function(_Sub2ApiModelPlaza) _then;

  /// Create a copy of Sub2ApiModelPlaza
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? description = null, Object? groups = null}) {
    return _then(
      _Sub2ApiModelPlaza(
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        groups: null == groups
            ? _self._groups
            : groups // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiModelPlazaGroup>,
      ),
    );
  }
}
