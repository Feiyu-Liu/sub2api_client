// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_user_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sub2ApiNotifyEmailEntry {
  String get email;
  bool get disabled;
  bool get verified;

  /// Create a copy of Sub2ApiNotifyEmailEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiNotifyEmailEntryCopyWith<Sub2ApiNotifyEmailEntry> get copyWith =>
      _$Sub2ApiNotifyEmailEntryCopyWithImpl<Sub2ApiNotifyEmailEntry>(
        this as Sub2ApiNotifyEmailEntry,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiNotifyEmailEntry &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.verified, verified) ||
                other.verified == verified));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, disabled, verified);

  @override
  String toString() {
    return 'Sub2ApiNotifyEmailEntry(email: $email, disabled: $disabled, verified: $verified)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiNotifyEmailEntryCopyWith<$Res> {
  factory $Sub2ApiNotifyEmailEntryCopyWith(
    Sub2ApiNotifyEmailEntry value,
    $Res Function(Sub2ApiNotifyEmailEntry) _then,
  ) = _$Sub2ApiNotifyEmailEntryCopyWithImpl;
  @useResult
  $Res call({String email, bool disabled, bool verified});
}

/// @nodoc
class _$Sub2ApiNotifyEmailEntryCopyWithImpl<$Res>
    implements $Sub2ApiNotifyEmailEntryCopyWith<$Res> {
  _$Sub2ApiNotifyEmailEntryCopyWithImpl(this._self, this._then);

  final Sub2ApiNotifyEmailEntry _self;
  final $Res Function(Sub2ApiNotifyEmailEntry) _then;

  /// Create a copy of Sub2ApiNotifyEmailEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? disabled = null,
    Object? verified = null,
  }) {
    return _then(
      _self.copyWith(
        email: null == email
            ? _self.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        disabled: null == disabled
            ? _self.disabled
            : disabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        verified: null == verified
            ? _self.verified
            : verified // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiNotifyEmailEntry].
extension Sub2ApiNotifyEmailEntryPatterns on Sub2ApiNotifyEmailEntry {
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
    TResult Function(_Sub2ApiNotifyEmailEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiNotifyEmailEntry() when $default != null:
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
    TResult Function(_Sub2ApiNotifyEmailEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiNotifyEmailEntry():
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
    TResult? Function(_Sub2ApiNotifyEmailEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiNotifyEmailEntry() when $default != null:
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
    TResult Function(String email, bool disabled, bool verified)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiNotifyEmailEntry() when $default != null:
        return $default(_that.email, _that.disabled, _that.verified);
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
    TResult Function(String email, bool disabled, bool verified) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiNotifyEmailEntry():
        return $default(_that.email, _that.disabled, _that.verified);
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
    TResult? Function(String email, bool disabled, bool verified)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiNotifyEmailEntry() when $default != null:
        return $default(_that.email, _that.disabled, _that.verified);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiNotifyEmailEntry implements Sub2ApiNotifyEmailEntry {
  const _Sub2ApiNotifyEmailEntry({
    required this.email,
    required this.disabled,
    required this.verified,
  });

  @override
  final String email;
  @override
  final bool disabled;
  @override
  final bool verified;

  /// Create a copy of Sub2ApiNotifyEmailEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiNotifyEmailEntryCopyWith<_Sub2ApiNotifyEmailEntry> get copyWith =>
      __$Sub2ApiNotifyEmailEntryCopyWithImpl<_Sub2ApiNotifyEmailEntry>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiNotifyEmailEntry &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.verified, verified) ||
                other.verified == verified));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, disabled, verified);

  @override
  String toString() {
    return 'Sub2ApiNotifyEmailEntry(email: $email, disabled: $disabled, verified: $verified)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiNotifyEmailEntryCopyWith<$Res>
    implements $Sub2ApiNotifyEmailEntryCopyWith<$Res> {
  factory _$Sub2ApiNotifyEmailEntryCopyWith(
    _Sub2ApiNotifyEmailEntry value,
    $Res Function(_Sub2ApiNotifyEmailEntry) _then,
  ) = __$Sub2ApiNotifyEmailEntryCopyWithImpl;
  @override
  @useResult
  $Res call({String email, bool disabled, bool verified});
}

/// @nodoc
class __$Sub2ApiNotifyEmailEntryCopyWithImpl<$Res>
    implements _$Sub2ApiNotifyEmailEntryCopyWith<$Res> {
  __$Sub2ApiNotifyEmailEntryCopyWithImpl(this._self, this._then);

  final _Sub2ApiNotifyEmailEntry _self;
  final $Res Function(_Sub2ApiNotifyEmailEntry) _then;

  /// Create a copy of Sub2ApiNotifyEmailEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? disabled = null,
    Object? verified = null,
  }) {
    return _then(
      _Sub2ApiNotifyEmailEntry(
        email: null == email
            ? _self.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        disabled: null == disabled
            ? _self.disabled
            : disabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        verified: null == verified
            ? _self.verified
            : verified // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiProfileSourceContext {
  String? get provider;
  String? get source;

  /// Create a copy of Sub2ApiProfileSourceContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiProfileSourceContextCopyWith<Sub2ApiProfileSourceContext>
  get copyWith =>
      _$Sub2ApiProfileSourceContextCopyWithImpl<Sub2ApiProfileSourceContext>(
        this as Sub2ApiProfileSourceContext,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiProfileSourceContext &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, provider, source);

  @override
  String toString() {
    return 'Sub2ApiProfileSourceContext(provider: $provider, source: $source)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiProfileSourceContextCopyWith<$Res> {
  factory $Sub2ApiProfileSourceContextCopyWith(
    Sub2ApiProfileSourceContext value,
    $Res Function(Sub2ApiProfileSourceContext) _then,
  ) = _$Sub2ApiProfileSourceContextCopyWithImpl;
  @useResult
  $Res call({String? provider, String? source});
}

/// @nodoc
class _$Sub2ApiProfileSourceContextCopyWithImpl<$Res>
    implements $Sub2ApiProfileSourceContextCopyWith<$Res> {
  _$Sub2ApiProfileSourceContextCopyWithImpl(this._self, this._then);

  final Sub2ApiProfileSourceContext _self;
  final $Res Function(Sub2ApiProfileSourceContext) _then;

  /// Create a copy of Sub2ApiProfileSourceContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? provider = freezed, Object? source = freezed}) {
    return _then(
      _self.copyWith(
        provider: freezed == provider
            ? _self.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as String?,
        source: freezed == source
            ? _self.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiProfileSourceContext].
extension Sub2ApiProfileSourceContextPatterns on Sub2ApiProfileSourceContext {
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
    TResult Function(_Sub2ApiProfileSourceContext value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiProfileSourceContext() when $default != null:
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
    TResult Function(_Sub2ApiProfileSourceContext value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiProfileSourceContext():
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
    TResult? Function(_Sub2ApiProfileSourceContext value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiProfileSourceContext() when $default != null:
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
    TResult Function(String? provider, String? source)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiProfileSourceContext() when $default != null:
        return $default(_that.provider, _that.source);
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
    TResult Function(String? provider, String? source) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiProfileSourceContext():
        return $default(_that.provider, _that.source);
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
    TResult? Function(String? provider, String? source)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiProfileSourceContext() when $default != null:
        return $default(_that.provider, _that.source);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiProfileSourceContext implements Sub2ApiProfileSourceContext {
  const _Sub2ApiProfileSourceContext({this.provider, this.source});

  @override
  final String? provider;
  @override
  final String? source;

  /// Create a copy of Sub2ApiProfileSourceContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiProfileSourceContextCopyWith<_Sub2ApiProfileSourceContext>
  get copyWith =>
      __$Sub2ApiProfileSourceContextCopyWithImpl<_Sub2ApiProfileSourceContext>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiProfileSourceContext &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, provider, source);

  @override
  String toString() {
    return 'Sub2ApiProfileSourceContext(provider: $provider, source: $source)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiProfileSourceContextCopyWith<$Res>
    implements $Sub2ApiProfileSourceContextCopyWith<$Res> {
  factory _$Sub2ApiProfileSourceContextCopyWith(
    _Sub2ApiProfileSourceContext value,
    $Res Function(_Sub2ApiProfileSourceContext) _then,
  ) = __$Sub2ApiProfileSourceContextCopyWithImpl;
  @override
  @useResult
  $Res call({String? provider, String? source});
}

/// @nodoc
class __$Sub2ApiProfileSourceContextCopyWithImpl<$Res>
    implements _$Sub2ApiProfileSourceContextCopyWith<$Res> {
  __$Sub2ApiProfileSourceContextCopyWithImpl(this._self, this._then);

  final _Sub2ApiProfileSourceContext _self;
  final $Res Function(_Sub2ApiProfileSourceContext) _then;

  /// Create a copy of Sub2ApiProfileSourceContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? provider = freezed, Object? source = freezed}) {
    return _then(
      _Sub2ApiProfileSourceContext(
        provider: freezed == provider
            ? _self.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as String?,
        source: freezed == source
            ? _self.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiIdentityBinding {
  String get provider;
  bool get bound;
  int get boundCount;
  bool get canBind;
  bool get canUnbind;
  String? get displayName;
  String? get subjectHint;
  String? get providerKey;
  DateTime? get verifiedAt;
  String? get bindStartPath;
  String? get noteKey;
  String? get note;

  /// Create a copy of Sub2ApiIdentityBinding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiIdentityBindingCopyWith<Sub2ApiIdentityBinding> get copyWith =>
      _$Sub2ApiIdentityBindingCopyWithImpl<Sub2ApiIdentityBinding>(
        this as Sub2ApiIdentityBinding,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiIdentityBinding &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.bound, bound) || other.bound == bound) &&
            (identical(other.boundCount, boundCount) ||
                other.boundCount == boundCount) &&
            (identical(other.canBind, canBind) || other.canBind == canBind) &&
            (identical(other.canUnbind, canUnbind) ||
                other.canUnbind == canUnbind) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.subjectHint, subjectHint) ||
                other.subjectHint == subjectHint) &&
            (identical(other.providerKey, providerKey) ||
                other.providerKey == providerKey) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.bindStartPath, bindStartPath) ||
                other.bindStartPath == bindStartPath) &&
            (identical(other.noteKey, noteKey) || other.noteKey == noteKey) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    provider,
    bound,
    boundCount,
    canBind,
    canUnbind,
    displayName,
    subjectHint,
    providerKey,
    verifiedAt,
    bindStartPath,
    noteKey,
    note,
  );

  @override
  String toString() {
    return 'Sub2ApiIdentityBinding(provider: $provider, bound: $bound, boundCount: $boundCount, canBind: $canBind, canUnbind: $canUnbind, displayName: $displayName, subjectHint: $subjectHint, providerKey: $providerKey, verifiedAt: $verifiedAt, bindStartPath: $bindStartPath, noteKey: $noteKey, note: $note)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiIdentityBindingCopyWith<$Res> {
  factory $Sub2ApiIdentityBindingCopyWith(
    Sub2ApiIdentityBinding value,
    $Res Function(Sub2ApiIdentityBinding) _then,
  ) = _$Sub2ApiIdentityBindingCopyWithImpl;
  @useResult
  $Res call({
    String provider,
    bool bound,
    int boundCount,
    bool canBind,
    bool canUnbind,
    String? displayName,
    String? subjectHint,
    String? providerKey,
    DateTime? verifiedAt,
    String? bindStartPath,
    String? noteKey,
    String? note,
  });
}

/// @nodoc
class _$Sub2ApiIdentityBindingCopyWithImpl<$Res>
    implements $Sub2ApiIdentityBindingCopyWith<$Res> {
  _$Sub2ApiIdentityBindingCopyWithImpl(this._self, this._then);

  final Sub2ApiIdentityBinding _self;
  final $Res Function(Sub2ApiIdentityBinding) _then;

  /// Create a copy of Sub2ApiIdentityBinding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? bound = null,
    Object? boundCount = null,
    Object? canBind = null,
    Object? canUnbind = null,
    Object? displayName = freezed,
    Object? subjectHint = freezed,
    Object? providerKey = freezed,
    Object? verifiedAt = freezed,
    Object? bindStartPath = freezed,
    Object? noteKey = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _self.copyWith(
        provider: null == provider
            ? _self.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as String,
        bound: null == bound
            ? _self.bound
            : bound // ignore: cast_nullable_to_non_nullable
                  as bool,
        boundCount: null == boundCount
            ? _self.boundCount
            : boundCount // ignore: cast_nullable_to_non_nullable
                  as int,
        canBind: null == canBind
            ? _self.canBind
            : canBind // ignore: cast_nullable_to_non_nullable
                  as bool,
        canUnbind: null == canUnbind
            ? _self.canUnbind
            : canUnbind // ignore: cast_nullable_to_non_nullable
                  as bool,
        displayName: freezed == displayName
            ? _self.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        subjectHint: freezed == subjectHint
            ? _self.subjectHint
            : subjectHint // ignore: cast_nullable_to_non_nullable
                  as String?,
        providerKey: freezed == providerKey
            ? _self.providerKey
            : providerKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        verifiedAt: freezed == verifiedAt
            ? _self.verifiedAt
            : verifiedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        bindStartPath: freezed == bindStartPath
            ? _self.bindStartPath
            : bindStartPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        noteKey: freezed == noteKey
            ? _self.noteKey
            : noteKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _self.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiIdentityBinding].
extension Sub2ApiIdentityBindingPatterns on Sub2ApiIdentityBinding {
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
    TResult Function(_Sub2ApiIdentityBinding value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiIdentityBinding() when $default != null:
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
    TResult Function(_Sub2ApiIdentityBinding value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiIdentityBinding():
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
    TResult? Function(_Sub2ApiIdentityBinding value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiIdentityBinding() when $default != null:
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
      String provider,
      bool bound,
      int boundCount,
      bool canBind,
      bool canUnbind,
      String? displayName,
      String? subjectHint,
      String? providerKey,
      DateTime? verifiedAt,
      String? bindStartPath,
      String? noteKey,
      String? note,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiIdentityBinding() when $default != null:
        return $default(
          _that.provider,
          _that.bound,
          _that.boundCount,
          _that.canBind,
          _that.canUnbind,
          _that.displayName,
          _that.subjectHint,
          _that.providerKey,
          _that.verifiedAt,
          _that.bindStartPath,
          _that.noteKey,
          _that.note,
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
      String provider,
      bool bound,
      int boundCount,
      bool canBind,
      bool canUnbind,
      String? displayName,
      String? subjectHint,
      String? providerKey,
      DateTime? verifiedAt,
      String? bindStartPath,
      String? noteKey,
      String? note,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiIdentityBinding():
        return $default(
          _that.provider,
          _that.bound,
          _that.boundCount,
          _that.canBind,
          _that.canUnbind,
          _that.displayName,
          _that.subjectHint,
          _that.providerKey,
          _that.verifiedAt,
          _that.bindStartPath,
          _that.noteKey,
          _that.note,
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
      String provider,
      bool bound,
      int boundCount,
      bool canBind,
      bool canUnbind,
      String? displayName,
      String? subjectHint,
      String? providerKey,
      DateTime? verifiedAt,
      String? bindStartPath,
      String? noteKey,
      String? note,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiIdentityBinding() when $default != null:
        return $default(
          _that.provider,
          _that.bound,
          _that.boundCount,
          _that.canBind,
          _that.canUnbind,
          _that.displayName,
          _that.subjectHint,
          _that.providerKey,
          _that.verifiedAt,
          _that.bindStartPath,
          _that.noteKey,
          _that.note,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiIdentityBinding implements Sub2ApiIdentityBinding {
  const _Sub2ApiIdentityBinding({
    required this.provider,
    required this.bound,
    required this.boundCount,
    required this.canBind,
    required this.canUnbind,
    this.displayName,
    this.subjectHint,
    this.providerKey,
    this.verifiedAt,
    this.bindStartPath,
    this.noteKey,
    this.note,
  });

  @override
  final String provider;
  @override
  final bool bound;
  @override
  final int boundCount;
  @override
  final bool canBind;
  @override
  final bool canUnbind;
  @override
  final String? displayName;
  @override
  final String? subjectHint;
  @override
  final String? providerKey;
  @override
  final DateTime? verifiedAt;
  @override
  final String? bindStartPath;
  @override
  final String? noteKey;
  @override
  final String? note;

  /// Create a copy of Sub2ApiIdentityBinding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiIdentityBindingCopyWith<_Sub2ApiIdentityBinding> get copyWith =>
      __$Sub2ApiIdentityBindingCopyWithImpl<_Sub2ApiIdentityBinding>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiIdentityBinding &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.bound, bound) || other.bound == bound) &&
            (identical(other.boundCount, boundCount) ||
                other.boundCount == boundCount) &&
            (identical(other.canBind, canBind) || other.canBind == canBind) &&
            (identical(other.canUnbind, canUnbind) ||
                other.canUnbind == canUnbind) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.subjectHint, subjectHint) ||
                other.subjectHint == subjectHint) &&
            (identical(other.providerKey, providerKey) ||
                other.providerKey == providerKey) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.bindStartPath, bindStartPath) ||
                other.bindStartPath == bindStartPath) &&
            (identical(other.noteKey, noteKey) || other.noteKey == noteKey) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    provider,
    bound,
    boundCount,
    canBind,
    canUnbind,
    displayName,
    subjectHint,
    providerKey,
    verifiedAt,
    bindStartPath,
    noteKey,
    note,
  );

  @override
  String toString() {
    return 'Sub2ApiIdentityBinding(provider: $provider, bound: $bound, boundCount: $boundCount, canBind: $canBind, canUnbind: $canUnbind, displayName: $displayName, subjectHint: $subjectHint, providerKey: $providerKey, verifiedAt: $verifiedAt, bindStartPath: $bindStartPath, noteKey: $noteKey, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiIdentityBindingCopyWith<$Res>
    implements $Sub2ApiIdentityBindingCopyWith<$Res> {
  factory _$Sub2ApiIdentityBindingCopyWith(
    _Sub2ApiIdentityBinding value,
    $Res Function(_Sub2ApiIdentityBinding) _then,
  ) = __$Sub2ApiIdentityBindingCopyWithImpl;
  @override
  @useResult
  $Res call({
    String provider,
    bool bound,
    int boundCount,
    bool canBind,
    bool canUnbind,
    String? displayName,
    String? subjectHint,
    String? providerKey,
    DateTime? verifiedAt,
    String? bindStartPath,
    String? noteKey,
    String? note,
  });
}

/// @nodoc
class __$Sub2ApiIdentityBindingCopyWithImpl<$Res>
    implements _$Sub2ApiIdentityBindingCopyWith<$Res> {
  __$Sub2ApiIdentityBindingCopyWithImpl(this._self, this._then);

  final _Sub2ApiIdentityBinding _self;
  final $Res Function(_Sub2ApiIdentityBinding) _then;

  /// Create a copy of Sub2ApiIdentityBinding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? provider = null,
    Object? bound = null,
    Object? boundCount = null,
    Object? canBind = null,
    Object? canUnbind = null,
    Object? displayName = freezed,
    Object? subjectHint = freezed,
    Object? providerKey = freezed,
    Object? verifiedAt = freezed,
    Object? bindStartPath = freezed,
    Object? noteKey = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _Sub2ApiIdentityBinding(
        provider: null == provider
            ? _self.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as String,
        bound: null == bound
            ? _self.bound
            : bound // ignore: cast_nullable_to_non_nullable
                  as bool,
        boundCount: null == boundCount
            ? _self.boundCount
            : boundCount // ignore: cast_nullable_to_non_nullable
                  as int,
        canBind: null == canBind
            ? _self.canBind
            : canBind // ignore: cast_nullable_to_non_nullable
                  as bool,
        canUnbind: null == canUnbind
            ? _self.canUnbind
            : canUnbind // ignore: cast_nullable_to_non_nullable
                  as bool,
        displayName: freezed == displayName
            ? _self.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        subjectHint: freezed == subjectHint
            ? _self.subjectHint
            : subjectHint // ignore: cast_nullable_to_non_nullable
                  as String?,
        providerKey: freezed == providerKey
            ? _self.providerKey
            : providerKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        verifiedAt: freezed == verifiedAt
            ? _self.verifiedAt
            : verifiedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        bindStartPath: freezed == bindStartPath
            ? _self.bindStartPath
            : bindStartPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        noteKey: freezed == noteKey
            ? _self.noteKey
            : noteKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _self.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiUserIdentitySet {
  Sub2ApiIdentityBinding get email;
  Sub2ApiIdentityBinding get linuxDo;
  Sub2ApiIdentityBinding get oidc;
  Sub2ApiIdentityBinding get weChat;
  Sub2ApiIdentityBinding get dingTalk;

  /// Create a copy of Sub2ApiUserIdentitySet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUserIdentitySetCopyWith<Sub2ApiUserIdentitySet> get copyWith =>
      _$Sub2ApiUserIdentitySetCopyWithImpl<Sub2ApiUserIdentitySet>(
        this as Sub2ApiUserIdentitySet,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUserIdentitySet &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.linuxDo, linuxDo) || other.linuxDo == linuxDo) &&
            (identical(other.oidc, oidc) || other.oidc == oidc) &&
            (identical(other.weChat, weChat) || other.weChat == weChat) &&
            (identical(other.dingTalk, dingTalk) ||
                other.dingTalk == dingTalk));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, linuxDo, oidc, weChat, dingTalk);

  @override
  String toString() {
    return 'Sub2ApiUserIdentitySet(email: $email, linuxDo: $linuxDo, oidc: $oidc, weChat: $weChat, dingTalk: $dingTalk)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUserIdentitySetCopyWith<$Res> {
  factory $Sub2ApiUserIdentitySetCopyWith(
    Sub2ApiUserIdentitySet value,
    $Res Function(Sub2ApiUserIdentitySet) _then,
  ) = _$Sub2ApiUserIdentitySetCopyWithImpl;
  @useResult
  $Res call({
    Sub2ApiIdentityBinding email,
    Sub2ApiIdentityBinding linuxDo,
    Sub2ApiIdentityBinding oidc,
    Sub2ApiIdentityBinding weChat,
    Sub2ApiIdentityBinding dingTalk,
  });

  $Sub2ApiIdentityBindingCopyWith<$Res> get email;
  $Sub2ApiIdentityBindingCopyWith<$Res> get linuxDo;
  $Sub2ApiIdentityBindingCopyWith<$Res> get oidc;
  $Sub2ApiIdentityBindingCopyWith<$Res> get weChat;
  $Sub2ApiIdentityBindingCopyWith<$Res> get dingTalk;
}

/// @nodoc
class _$Sub2ApiUserIdentitySetCopyWithImpl<$Res>
    implements $Sub2ApiUserIdentitySetCopyWith<$Res> {
  _$Sub2ApiUserIdentitySetCopyWithImpl(this._self, this._then);

  final Sub2ApiUserIdentitySet _self;
  final $Res Function(Sub2ApiUserIdentitySet) _then;

  /// Create a copy of Sub2ApiUserIdentitySet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? linuxDo = null,
    Object? oidc = null,
    Object? weChat = null,
    Object? dingTalk = null,
  }) {
    return _then(
      _self.copyWith(
        email: null == email
            ? _self.email
            : email // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiIdentityBinding,
        linuxDo: null == linuxDo
            ? _self.linuxDo
            : linuxDo // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiIdentityBinding,
        oidc: null == oidc
            ? _self.oidc
            : oidc // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiIdentityBinding,
        weChat: null == weChat
            ? _self.weChat
            : weChat // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiIdentityBinding,
        dingTalk: null == dingTalk
            ? _self.dingTalk
            : dingTalk // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiIdentityBinding,
      ),
    );
  }

  /// Create a copy of Sub2ApiUserIdentitySet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiIdentityBindingCopyWith<$Res> get email {
    return $Sub2ApiIdentityBindingCopyWith<$Res>(_self.email, (value) {
      return _then(_self.copyWith(email: value));
    });
  }

  /// Create a copy of Sub2ApiUserIdentitySet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiIdentityBindingCopyWith<$Res> get linuxDo {
    return $Sub2ApiIdentityBindingCopyWith<$Res>(_self.linuxDo, (value) {
      return _then(_self.copyWith(linuxDo: value));
    });
  }

  /// Create a copy of Sub2ApiUserIdentitySet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiIdentityBindingCopyWith<$Res> get oidc {
    return $Sub2ApiIdentityBindingCopyWith<$Res>(_self.oidc, (value) {
      return _then(_self.copyWith(oidc: value));
    });
  }

  /// Create a copy of Sub2ApiUserIdentitySet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiIdentityBindingCopyWith<$Res> get weChat {
    return $Sub2ApiIdentityBindingCopyWith<$Res>(_self.weChat, (value) {
      return _then(_self.copyWith(weChat: value));
    });
  }

  /// Create a copy of Sub2ApiUserIdentitySet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiIdentityBindingCopyWith<$Res> get dingTalk {
    return $Sub2ApiIdentityBindingCopyWith<$Res>(_self.dingTalk, (value) {
      return _then(_self.copyWith(dingTalk: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUserIdentitySet].
extension Sub2ApiUserIdentitySetPatterns on Sub2ApiUserIdentitySet {
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
    TResult Function(_Sub2ApiUserIdentitySet value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserIdentitySet() when $default != null:
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
    TResult Function(_Sub2ApiUserIdentitySet value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserIdentitySet():
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
    TResult? Function(_Sub2ApiUserIdentitySet value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserIdentitySet() when $default != null:
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
      Sub2ApiIdentityBinding email,
      Sub2ApiIdentityBinding linuxDo,
      Sub2ApiIdentityBinding oidc,
      Sub2ApiIdentityBinding weChat,
      Sub2ApiIdentityBinding dingTalk,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserIdentitySet() when $default != null:
        return $default(
          _that.email,
          _that.linuxDo,
          _that.oidc,
          _that.weChat,
          _that.dingTalk,
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
      Sub2ApiIdentityBinding email,
      Sub2ApiIdentityBinding linuxDo,
      Sub2ApiIdentityBinding oidc,
      Sub2ApiIdentityBinding weChat,
      Sub2ApiIdentityBinding dingTalk,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserIdentitySet():
        return $default(
          _that.email,
          _that.linuxDo,
          _that.oidc,
          _that.weChat,
          _that.dingTalk,
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
      Sub2ApiIdentityBinding email,
      Sub2ApiIdentityBinding linuxDo,
      Sub2ApiIdentityBinding oidc,
      Sub2ApiIdentityBinding weChat,
      Sub2ApiIdentityBinding dingTalk,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserIdentitySet() when $default != null:
        return $default(
          _that.email,
          _that.linuxDo,
          _that.oidc,
          _that.weChat,
          _that.dingTalk,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUserIdentitySet implements Sub2ApiUserIdentitySet {
  const _Sub2ApiUserIdentitySet({
    required this.email,
    required this.linuxDo,
    required this.oidc,
    required this.weChat,
    required this.dingTalk,
  });

  @override
  final Sub2ApiIdentityBinding email;
  @override
  final Sub2ApiIdentityBinding linuxDo;
  @override
  final Sub2ApiIdentityBinding oidc;
  @override
  final Sub2ApiIdentityBinding weChat;
  @override
  final Sub2ApiIdentityBinding dingTalk;

  /// Create a copy of Sub2ApiUserIdentitySet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUserIdentitySetCopyWith<_Sub2ApiUserIdentitySet> get copyWith =>
      __$Sub2ApiUserIdentitySetCopyWithImpl<_Sub2ApiUserIdentitySet>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUserIdentitySet &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.linuxDo, linuxDo) || other.linuxDo == linuxDo) &&
            (identical(other.oidc, oidc) || other.oidc == oidc) &&
            (identical(other.weChat, weChat) || other.weChat == weChat) &&
            (identical(other.dingTalk, dingTalk) ||
                other.dingTalk == dingTalk));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, linuxDo, oidc, weChat, dingTalk);

  @override
  String toString() {
    return 'Sub2ApiUserIdentitySet(email: $email, linuxDo: $linuxDo, oidc: $oidc, weChat: $weChat, dingTalk: $dingTalk)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUserIdentitySetCopyWith<$Res>
    implements $Sub2ApiUserIdentitySetCopyWith<$Res> {
  factory _$Sub2ApiUserIdentitySetCopyWith(
    _Sub2ApiUserIdentitySet value,
    $Res Function(_Sub2ApiUserIdentitySet) _then,
  ) = __$Sub2ApiUserIdentitySetCopyWithImpl;
  @override
  @useResult
  $Res call({
    Sub2ApiIdentityBinding email,
    Sub2ApiIdentityBinding linuxDo,
    Sub2ApiIdentityBinding oidc,
    Sub2ApiIdentityBinding weChat,
    Sub2ApiIdentityBinding dingTalk,
  });

  @override
  $Sub2ApiIdentityBindingCopyWith<$Res> get email;
  @override
  $Sub2ApiIdentityBindingCopyWith<$Res> get linuxDo;
  @override
  $Sub2ApiIdentityBindingCopyWith<$Res> get oidc;
  @override
  $Sub2ApiIdentityBindingCopyWith<$Res> get weChat;
  @override
  $Sub2ApiIdentityBindingCopyWith<$Res> get dingTalk;
}

/// @nodoc
class __$Sub2ApiUserIdentitySetCopyWithImpl<$Res>
    implements _$Sub2ApiUserIdentitySetCopyWith<$Res> {
  __$Sub2ApiUserIdentitySetCopyWithImpl(this._self, this._then);

  final _Sub2ApiUserIdentitySet _self;
  final $Res Function(_Sub2ApiUserIdentitySet) _then;

  /// Create a copy of Sub2ApiUserIdentitySet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? linuxDo = null,
    Object? oidc = null,
    Object? weChat = null,
    Object? dingTalk = null,
  }) {
    return _then(
      _Sub2ApiUserIdentitySet(
        email: null == email
            ? _self.email
            : email // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiIdentityBinding,
        linuxDo: null == linuxDo
            ? _self.linuxDo
            : linuxDo // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiIdentityBinding,
        oidc: null == oidc
            ? _self.oidc
            : oidc // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiIdentityBinding,
        weChat: null == weChat
            ? _self.weChat
            : weChat // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiIdentityBinding,
        dingTalk: null == dingTalk
            ? _self.dingTalk
            : dingTalk // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiIdentityBinding,
      ),
    );
  }

  /// Create a copy of Sub2ApiUserIdentitySet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiIdentityBindingCopyWith<$Res> get email {
    return $Sub2ApiIdentityBindingCopyWith<$Res>(_self.email, (value) {
      return _then(_self.copyWith(email: value));
    });
  }

  /// Create a copy of Sub2ApiUserIdentitySet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiIdentityBindingCopyWith<$Res> get linuxDo {
    return $Sub2ApiIdentityBindingCopyWith<$Res>(_self.linuxDo, (value) {
      return _then(_self.copyWith(linuxDo: value));
    });
  }

  /// Create a copy of Sub2ApiUserIdentitySet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiIdentityBindingCopyWith<$Res> get oidc {
    return $Sub2ApiIdentityBindingCopyWith<$Res>(_self.oidc, (value) {
      return _then(_self.copyWith(oidc: value));
    });
  }

  /// Create a copy of Sub2ApiUserIdentitySet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiIdentityBindingCopyWith<$Res> get weChat {
    return $Sub2ApiIdentityBindingCopyWith<$Res>(_self.weChat, (value) {
      return _then(_self.copyWith(weChat: value));
    });
  }

  /// Create a copy of Sub2ApiUserIdentitySet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiIdentityBindingCopyWith<$Res> get dingTalk {
    return $Sub2ApiIdentityBindingCopyWith<$Res>(_self.dingTalk, (value) {
      return _then(_self.copyWith(dingTalk: value));
    });
  }
}

/// @nodoc
mixin _$Sub2ApiUserAccountSnapshot {
  int get id;
  String get email;
  String get username;
  String get role;
  Sub2ApiDecimal get balance;
  Sub2ApiDecimal get frozenBalance;
  int get concurrency;
  String get status;
  List<int> get allowedGroups;
  bool get balanceNotifyEnabled;
  String get balanceNotifyThresholdType;
  Sub2ApiDecimal? get balanceNotifyThreshold;
  List<Sub2ApiNotifyEmailEntry> get balanceNotifyExtraEmails;
  Sub2ApiDecimal get totalRecharged;
  int get rpmLimit;
  DateTime get createdAt;
  DateTime get updatedAt;
  Sub2ApiUserIdentitySet get identities;
  Map<String, Sub2ApiIdentityBinding> get authBindings;
  Map<String, Sub2ApiIdentityBinding> get identityBindings;
  bool get emailBound;
  bool get linuxDoBound;
  bool get oidcBound;
  bool get weChatBound;
  bool get dingTalkBound;
  DateTime? get lastActiveAt;
  DateTime? get deletedAt;
  String? get avatarUrl;
  Sub2ApiProfileSourceContext? get avatarSource;
  Sub2ApiProfileSourceContext? get usernameSource;
  Sub2ApiProfileSourceContext? get displayNameSource;
  Sub2ApiProfileSourceContext? get nicknameSource;
  Map<String, Sub2ApiProfileSourceContext>? get profileSources;

  /// Create a copy of Sub2ApiUserAccountSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiUserAccountSnapshotCopyWith<Sub2ApiUserAccountSnapshot>
  get copyWith =>
      _$Sub2ApiUserAccountSnapshotCopyWithImpl<Sub2ApiUserAccountSnapshot>(
        this as Sub2ApiUserAccountSnapshot,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiUserAccountSnapshot &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.frozenBalance, frozenBalance) ||
                other.frozenBalance == frozenBalance) &&
            (identical(other.concurrency, concurrency) ||
                other.concurrency == concurrency) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other.allowedGroups,
              allowedGroups,
            ) &&
            (identical(other.balanceNotifyEnabled, balanceNotifyEnabled) ||
                other.balanceNotifyEnabled == balanceNotifyEnabled) &&
            (identical(
                  other.balanceNotifyThresholdType,
                  balanceNotifyThresholdType,
                ) ||
                other.balanceNotifyThresholdType ==
                    balanceNotifyThresholdType) &&
            (identical(other.balanceNotifyThreshold, balanceNotifyThreshold) ||
                other.balanceNotifyThreshold == balanceNotifyThreshold) &&
            const DeepCollectionEquality().equals(
              other.balanceNotifyExtraEmails,
              balanceNotifyExtraEmails,
            ) &&
            (identical(other.totalRecharged, totalRecharged) ||
                other.totalRecharged == totalRecharged) &&
            (identical(other.rpmLimit, rpmLimit) ||
                other.rpmLimit == rpmLimit) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.identities, identities) ||
                other.identities == identities) &&
            const DeepCollectionEquality().equals(
              other.authBindings,
              authBindings,
            ) &&
            const DeepCollectionEquality().equals(
              other.identityBindings,
              identityBindings,
            ) &&
            (identical(other.emailBound, emailBound) ||
                other.emailBound == emailBound) &&
            (identical(other.linuxDoBound, linuxDoBound) ||
                other.linuxDoBound == linuxDoBound) &&
            (identical(other.oidcBound, oidcBound) ||
                other.oidcBound == oidcBound) &&
            (identical(other.weChatBound, weChatBound) ||
                other.weChatBound == weChatBound) &&
            (identical(other.dingTalkBound, dingTalkBound) ||
                other.dingTalkBound == dingTalkBound) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.avatarSource, avatarSource) ||
                other.avatarSource == avatarSource) &&
            (identical(other.usernameSource, usernameSource) ||
                other.usernameSource == usernameSource) &&
            (identical(other.displayNameSource, displayNameSource) ||
                other.displayNameSource == displayNameSource) &&
            (identical(other.nicknameSource, nicknameSource) ||
                other.nicknameSource == nicknameSource) &&
            const DeepCollectionEquality().equals(
              other.profileSources,
              profileSources,
            ));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    email,
    username,
    role,
    balance,
    frozenBalance,
    concurrency,
    status,
    const DeepCollectionEquality().hash(allowedGroups),
    balanceNotifyEnabled,
    balanceNotifyThresholdType,
    balanceNotifyThreshold,
    const DeepCollectionEquality().hash(balanceNotifyExtraEmails),
    totalRecharged,
    rpmLimit,
    createdAt,
    updatedAt,
    identities,
    const DeepCollectionEquality().hash(authBindings),
    const DeepCollectionEquality().hash(identityBindings),
    emailBound,
    linuxDoBound,
    oidcBound,
    weChatBound,
    dingTalkBound,
    lastActiveAt,
    deletedAt,
    avatarUrl,
    avatarSource,
    usernameSource,
    displayNameSource,
    nicknameSource,
    const DeepCollectionEquality().hash(profileSources),
  ]);

  @override
  String toString() {
    return 'Sub2ApiUserAccountSnapshot(id: $id, email: $email, username: $username, role: $role, balance: $balance, frozenBalance: $frozenBalance, concurrency: $concurrency, status: $status, allowedGroups: $allowedGroups, balanceNotifyEnabled: $balanceNotifyEnabled, balanceNotifyThresholdType: $balanceNotifyThresholdType, balanceNotifyThreshold: $balanceNotifyThreshold, balanceNotifyExtraEmails: $balanceNotifyExtraEmails, totalRecharged: $totalRecharged, rpmLimit: $rpmLimit, createdAt: $createdAt, updatedAt: $updatedAt, identities: $identities, authBindings: $authBindings, identityBindings: $identityBindings, emailBound: $emailBound, linuxDoBound: $linuxDoBound, oidcBound: $oidcBound, weChatBound: $weChatBound, dingTalkBound: $dingTalkBound, lastActiveAt: $lastActiveAt, deletedAt: $deletedAt, avatarUrl: $avatarUrl, avatarSource: $avatarSource, usernameSource: $usernameSource, displayNameSource: $displayNameSource, nicknameSource: $nicknameSource, profileSources: $profileSources)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiUserAccountSnapshotCopyWith<$Res> {
  factory $Sub2ApiUserAccountSnapshotCopyWith(
    Sub2ApiUserAccountSnapshot value,
    $Res Function(Sub2ApiUserAccountSnapshot) _then,
  ) = _$Sub2ApiUserAccountSnapshotCopyWithImpl;
  @useResult
  $Res call({
    int id,
    String email,
    String username,
    String role,
    Sub2ApiDecimal balance,
    Sub2ApiDecimal frozenBalance,
    int concurrency,
    String status,
    List<int> allowedGroups,
    bool balanceNotifyEnabled,
    String balanceNotifyThresholdType,
    Sub2ApiDecimal? balanceNotifyThreshold,
    List<Sub2ApiNotifyEmailEntry> balanceNotifyExtraEmails,
    Sub2ApiDecimal totalRecharged,
    int rpmLimit,
    DateTime createdAt,
    DateTime updatedAt,
    Sub2ApiUserIdentitySet identities,
    Map<String, Sub2ApiIdentityBinding> authBindings,
    Map<String, Sub2ApiIdentityBinding> identityBindings,
    bool emailBound,
    bool linuxDoBound,
    bool oidcBound,
    bool weChatBound,
    bool dingTalkBound,
    DateTime? lastActiveAt,
    DateTime? deletedAt,
    String? avatarUrl,
    Sub2ApiProfileSourceContext? avatarSource,
    Sub2ApiProfileSourceContext? usernameSource,
    Sub2ApiProfileSourceContext? displayNameSource,
    Sub2ApiProfileSourceContext? nicknameSource,
    Map<String, Sub2ApiProfileSourceContext>? profileSources,
  });

  $Sub2ApiUserIdentitySetCopyWith<$Res> get identities;
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get avatarSource;
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get usernameSource;
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get displayNameSource;
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get nicknameSource;
}

/// @nodoc
class _$Sub2ApiUserAccountSnapshotCopyWithImpl<$Res>
    implements $Sub2ApiUserAccountSnapshotCopyWith<$Res> {
  _$Sub2ApiUserAccountSnapshotCopyWithImpl(this._self, this._then);

  final Sub2ApiUserAccountSnapshot _self;
  final $Res Function(Sub2ApiUserAccountSnapshot) _then;

  /// Create a copy of Sub2ApiUserAccountSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? role = null,
    Object? balance = null,
    Object? frozenBalance = null,
    Object? concurrency = null,
    Object? status = null,
    Object? allowedGroups = null,
    Object? balanceNotifyEnabled = null,
    Object? balanceNotifyThresholdType = null,
    Object? balanceNotifyThreshold = freezed,
    Object? balanceNotifyExtraEmails = null,
    Object? totalRecharged = null,
    Object? rpmLimit = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? identities = null,
    Object? authBindings = null,
    Object? identityBindings = null,
    Object? emailBound = null,
    Object? linuxDoBound = null,
    Object? oidcBound = null,
    Object? weChatBound = null,
    Object? dingTalkBound = null,
    Object? lastActiveAt = freezed,
    Object? deletedAt = freezed,
    Object? avatarUrl = freezed,
    Object? avatarSource = freezed,
    Object? usernameSource = freezed,
    Object? displayNameSource = freezed,
    Object? nicknameSource = freezed,
    Object? profileSources = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        email: null == email
            ? _self.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _self.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        balance: null == balance
            ? _self.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        frozenBalance: null == frozenBalance
            ? _self.frozenBalance
            : frozenBalance // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        concurrency: null == concurrency
            ? _self.concurrency
            : concurrency // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        allowedGroups: null == allowedGroups
            ? _self.allowedGroups
            : allowedGroups // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        balanceNotifyEnabled: null == balanceNotifyEnabled
            ? _self.balanceNotifyEnabled
            : balanceNotifyEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        balanceNotifyThresholdType: null == balanceNotifyThresholdType
            ? _self.balanceNotifyThresholdType
            : balanceNotifyThresholdType // ignore: cast_nullable_to_non_nullable
                  as String,
        balanceNotifyThreshold: freezed == balanceNotifyThreshold
            ? _self.balanceNotifyThreshold
            : balanceNotifyThreshold // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        balanceNotifyExtraEmails: null == balanceNotifyExtraEmails
            ? _self.balanceNotifyExtraEmails
            : balanceNotifyExtraEmails // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiNotifyEmailEntry>,
        totalRecharged: null == totalRecharged
            ? _self.totalRecharged
            : totalRecharged // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        rpmLimit: null == rpmLimit
            ? _self.rpmLimit
            : rpmLimit // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _self.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        identities: null == identities
            ? _self.identities
            : identities // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiUserIdentitySet,
        authBindings: null == authBindings
            ? _self.authBindings
            : authBindings // ignore: cast_nullable_to_non_nullable
                  as Map<String, Sub2ApiIdentityBinding>,
        identityBindings: null == identityBindings
            ? _self.identityBindings
            : identityBindings // ignore: cast_nullable_to_non_nullable
                  as Map<String, Sub2ApiIdentityBinding>,
        emailBound: null == emailBound
            ? _self.emailBound
            : emailBound // ignore: cast_nullable_to_non_nullable
                  as bool,
        linuxDoBound: null == linuxDoBound
            ? _self.linuxDoBound
            : linuxDoBound // ignore: cast_nullable_to_non_nullable
                  as bool,
        oidcBound: null == oidcBound
            ? _self.oidcBound
            : oidcBound // ignore: cast_nullable_to_non_nullable
                  as bool,
        weChatBound: null == weChatBound
            ? _self.weChatBound
            : weChatBound // ignore: cast_nullable_to_non_nullable
                  as bool,
        dingTalkBound: null == dingTalkBound
            ? _self.dingTalkBound
            : dingTalkBound // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastActiveAt: freezed == lastActiveAt
            ? _self.lastActiveAt
            : lastActiveAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        deletedAt: freezed == deletedAt
            ? _self.deletedAt
            : deletedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        avatarUrl: freezed == avatarUrl
            ? _self.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarSource: freezed == avatarSource
            ? _self.avatarSource
            : avatarSource // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiProfileSourceContext?,
        usernameSource: freezed == usernameSource
            ? _self.usernameSource
            : usernameSource // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiProfileSourceContext?,
        displayNameSource: freezed == displayNameSource
            ? _self.displayNameSource
            : displayNameSource // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiProfileSourceContext?,
        nicknameSource: freezed == nicknameSource
            ? _self.nicknameSource
            : nicknameSource // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiProfileSourceContext?,
        profileSources: freezed == profileSources
            ? _self.profileSources
            : profileSources // ignore: cast_nullable_to_non_nullable
                  as Map<String, Sub2ApiProfileSourceContext>?,
      ),
    );
  }

  /// Create a copy of Sub2ApiUserAccountSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiUserIdentitySetCopyWith<$Res> get identities {
    return $Sub2ApiUserIdentitySetCopyWith<$Res>(_self.identities, (value) {
      return _then(_self.copyWith(identities: value));
    });
  }

  /// Create a copy of Sub2ApiUserAccountSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get avatarSource {
    if (_self.avatarSource == null) {
      return null;
    }

    return $Sub2ApiProfileSourceContextCopyWith<$Res>(_self.avatarSource!, (
      value,
    ) {
      return _then(_self.copyWith(avatarSource: value));
    });
  }

  /// Create a copy of Sub2ApiUserAccountSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get usernameSource {
    if (_self.usernameSource == null) {
      return null;
    }

    return $Sub2ApiProfileSourceContextCopyWith<$Res>(_self.usernameSource!, (
      value,
    ) {
      return _then(_self.copyWith(usernameSource: value));
    });
  }

  /// Create a copy of Sub2ApiUserAccountSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get displayNameSource {
    if (_self.displayNameSource == null) {
      return null;
    }

    return $Sub2ApiProfileSourceContextCopyWith<$Res>(
      _self.displayNameSource!,
      (value) {
        return _then(_self.copyWith(displayNameSource: value));
      },
    );
  }

  /// Create a copy of Sub2ApiUserAccountSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get nicknameSource {
    if (_self.nicknameSource == null) {
      return null;
    }

    return $Sub2ApiProfileSourceContextCopyWith<$Res>(_self.nicknameSource!, (
      value,
    ) {
      return _then(_self.copyWith(nicknameSource: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiUserAccountSnapshot].
extension Sub2ApiUserAccountSnapshotPatterns on Sub2ApiUserAccountSnapshot {
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
    TResult Function(_Sub2ApiUserAccountSnapshot value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserAccountSnapshot() when $default != null:
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
    TResult Function(_Sub2ApiUserAccountSnapshot value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserAccountSnapshot():
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
    TResult? Function(_Sub2ApiUserAccountSnapshot value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserAccountSnapshot() when $default != null:
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
      String email,
      String username,
      String role,
      Sub2ApiDecimal balance,
      Sub2ApiDecimal frozenBalance,
      int concurrency,
      String status,
      List<int> allowedGroups,
      bool balanceNotifyEnabled,
      String balanceNotifyThresholdType,
      Sub2ApiDecimal? balanceNotifyThreshold,
      List<Sub2ApiNotifyEmailEntry> balanceNotifyExtraEmails,
      Sub2ApiDecimal totalRecharged,
      int rpmLimit,
      DateTime createdAt,
      DateTime updatedAt,
      Sub2ApiUserIdentitySet identities,
      Map<String, Sub2ApiIdentityBinding> authBindings,
      Map<String, Sub2ApiIdentityBinding> identityBindings,
      bool emailBound,
      bool linuxDoBound,
      bool oidcBound,
      bool weChatBound,
      bool dingTalkBound,
      DateTime? lastActiveAt,
      DateTime? deletedAt,
      String? avatarUrl,
      Sub2ApiProfileSourceContext? avatarSource,
      Sub2ApiProfileSourceContext? usernameSource,
      Sub2ApiProfileSourceContext? displayNameSource,
      Sub2ApiProfileSourceContext? nicknameSource,
      Map<String, Sub2ApiProfileSourceContext>? profileSources,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserAccountSnapshot() when $default != null:
        return $default(
          _that.id,
          _that.email,
          _that.username,
          _that.role,
          _that.balance,
          _that.frozenBalance,
          _that.concurrency,
          _that.status,
          _that.allowedGroups,
          _that.balanceNotifyEnabled,
          _that.balanceNotifyThresholdType,
          _that.balanceNotifyThreshold,
          _that.balanceNotifyExtraEmails,
          _that.totalRecharged,
          _that.rpmLimit,
          _that.createdAt,
          _that.updatedAt,
          _that.identities,
          _that.authBindings,
          _that.identityBindings,
          _that.emailBound,
          _that.linuxDoBound,
          _that.oidcBound,
          _that.weChatBound,
          _that.dingTalkBound,
          _that.lastActiveAt,
          _that.deletedAt,
          _that.avatarUrl,
          _that.avatarSource,
          _that.usernameSource,
          _that.displayNameSource,
          _that.nicknameSource,
          _that.profileSources,
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
      String email,
      String username,
      String role,
      Sub2ApiDecimal balance,
      Sub2ApiDecimal frozenBalance,
      int concurrency,
      String status,
      List<int> allowedGroups,
      bool balanceNotifyEnabled,
      String balanceNotifyThresholdType,
      Sub2ApiDecimal? balanceNotifyThreshold,
      List<Sub2ApiNotifyEmailEntry> balanceNotifyExtraEmails,
      Sub2ApiDecimal totalRecharged,
      int rpmLimit,
      DateTime createdAt,
      DateTime updatedAt,
      Sub2ApiUserIdentitySet identities,
      Map<String, Sub2ApiIdentityBinding> authBindings,
      Map<String, Sub2ApiIdentityBinding> identityBindings,
      bool emailBound,
      bool linuxDoBound,
      bool oidcBound,
      bool weChatBound,
      bool dingTalkBound,
      DateTime? lastActiveAt,
      DateTime? deletedAt,
      String? avatarUrl,
      Sub2ApiProfileSourceContext? avatarSource,
      Sub2ApiProfileSourceContext? usernameSource,
      Sub2ApiProfileSourceContext? displayNameSource,
      Sub2ApiProfileSourceContext? nicknameSource,
      Map<String, Sub2ApiProfileSourceContext>? profileSources,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserAccountSnapshot():
        return $default(
          _that.id,
          _that.email,
          _that.username,
          _that.role,
          _that.balance,
          _that.frozenBalance,
          _that.concurrency,
          _that.status,
          _that.allowedGroups,
          _that.balanceNotifyEnabled,
          _that.balanceNotifyThresholdType,
          _that.balanceNotifyThreshold,
          _that.balanceNotifyExtraEmails,
          _that.totalRecharged,
          _that.rpmLimit,
          _that.createdAt,
          _that.updatedAt,
          _that.identities,
          _that.authBindings,
          _that.identityBindings,
          _that.emailBound,
          _that.linuxDoBound,
          _that.oidcBound,
          _that.weChatBound,
          _that.dingTalkBound,
          _that.lastActiveAt,
          _that.deletedAt,
          _that.avatarUrl,
          _that.avatarSource,
          _that.usernameSource,
          _that.displayNameSource,
          _that.nicknameSource,
          _that.profileSources,
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
      String email,
      String username,
      String role,
      Sub2ApiDecimal balance,
      Sub2ApiDecimal frozenBalance,
      int concurrency,
      String status,
      List<int> allowedGroups,
      bool balanceNotifyEnabled,
      String balanceNotifyThresholdType,
      Sub2ApiDecimal? balanceNotifyThreshold,
      List<Sub2ApiNotifyEmailEntry> balanceNotifyExtraEmails,
      Sub2ApiDecimal totalRecharged,
      int rpmLimit,
      DateTime createdAt,
      DateTime updatedAt,
      Sub2ApiUserIdentitySet identities,
      Map<String, Sub2ApiIdentityBinding> authBindings,
      Map<String, Sub2ApiIdentityBinding> identityBindings,
      bool emailBound,
      bool linuxDoBound,
      bool oidcBound,
      bool weChatBound,
      bool dingTalkBound,
      DateTime? lastActiveAt,
      DateTime? deletedAt,
      String? avatarUrl,
      Sub2ApiProfileSourceContext? avatarSource,
      Sub2ApiProfileSourceContext? usernameSource,
      Sub2ApiProfileSourceContext? displayNameSource,
      Sub2ApiProfileSourceContext? nicknameSource,
      Map<String, Sub2ApiProfileSourceContext>? profileSources,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiUserAccountSnapshot() when $default != null:
        return $default(
          _that.id,
          _that.email,
          _that.username,
          _that.role,
          _that.balance,
          _that.frozenBalance,
          _that.concurrency,
          _that.status,
          _that.allowedGroups,
          _that.balanceNotifyEnabled,
          _that.balanceNotifyThresholdType,
          _that.balanceNotifyThreshold,
          _that.balanceNotifyExtraEmails,
          _that.totalRecharged,
          _that.rpmLimit,
          _that.createdAt,
          _that.updatedAt,
          _that.identities,
          _that.authBindings,
          _that.identityBindings,
          _that.emailBound,
          _that.linuxDoBound,
          _that.oidcBound,
          _that.weChatBound,
          _that.dingTalkBound,
          _that.lastActiveAt,
          _that.deletedAt,
          _that.avatarUrl,
          _that.avatarSource,
          _that.usernameSource,
          _that.displayNameSource,
          _that.nicknameSource,
          _that.profileSources,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiUserAccountSnapshot implements Sub2ApiUserAccountSnapshot {
  const _Sub2ApiUserAccountSnapshot({
    required this.id,
    required this.email,
    required this.username,
    required this.role,
    required this.balance,
    required this.frozenBalance,
    required this.concurrency,
    required this.status,
    required final List<int> allowedGroups,
    required this.balanceNotifyEnabled,
    required this.balanceNotifyThresholdType,
    required this.balanceNotifyThreshold,
    required final List<Sub2ApiNotifyEmailEntry> balanceNotifyExtraEmails,
    required this.totalRecharged,
    required this.rpmLimit,
    required this.createdAt,
    required this.updatedAt,
    required this.identities,
    required final Map<String, Sub2ApiIdentityBinding> authBindings,
    required final Map<String, Sub2ApiIdentityBinding> identityBindings,
    required this.emailBound,
    required this.linuxDoBound,
    required this.oidcBound,
    required this.weChatBound,
    required this.dingTalkBound,
    this.lastActiveAt,
    this.deletedAt,
    this.avatarUrl,
    this.avatarSource,
    this.usernameSource,
    this.displayNameSource,
    this.nicknameSource,
    final Map<String, Sub2ApiProfileSourceContext>? profileSources,
  }) : _allowedGroups = allowedGroups,
       _balanceNotifyExtraEmails = balanceNotifyExtraEmails,
       _authBindings = authBindings,
       _identityBindings = identityBindings,
       _profileSources = profileSources;

  @override
  final int id;
  @override
  final String email;
  @override
  final String username;
  @override
  final String role;
  @override
  final Sub2ApiDecimal balance;
  @override
  final Sub2ApiDecimal frozenBalance;
  @override
  final int concurrency;
  @override
  final String status;
  final List<int> _allowedGroups;
  @override
  List<int> get allowedGroups {
    if (_allowedGroups is EqualUnmodifiableListView) return _allowedGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedGroups);
  }

  @override
  final bool balanceNotifyEnabled;
  @override
  final String balanceNotifyThresholdType;
  @override
  final Sub2ApiDecimal? balanceNotifyThreshold;
  final List<Sub2ApiNotifyEmailEntry> _balanceNotifyExtraEmails;
  @override
  List<Sub2ApiNotifyEmailEntry> get balanceNotifyExtraEmails {
    if (_balanceNotifyExtraEmails is EqualUnmodifiableListView)
      return _balanceNotifyExtraEmails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_balanceNotifyExtraEmails);
  }

  @override
  final Sub2ApiDecimal totalRecharged;
  @override
  final int rpmLimit;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final Sub2ApiUserIdentitySet identities;
  final Map<String, Sub2ApiIdentityBinding> _authBindings;
  @override
  Map<String, Sub2ApiIdentityBinding> get authBindings {
    if (_authBindings is EqualUnmodifiableMapView) return _authBindings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_authBindings);
  }

  final Map<String, Sub2ApiIdentityBinding> _identityBindings;
  @override
  Map<String, Sub2ApiIdentityBinding> get identityBindings {
    if (_identityBindings is EqualUnmodifiableMapView) return _identityBindings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_identityBindings);
  }

  @override
  final bool emailBound;
  @override
  final bool linuxDoBound;
  @override
  final bool oidcBound;
  @override
  final bool weChatBound;
  @override
  final bool dingTalkBound;
  @override
  final DateTime? lastActiveAt;
  @override
  final DateTime? deletedAt;
  @override
  final String? avatarUrl;
  @override
  final Sub2ApiProfileSourceContext? avatarSource;
  @override
  final Sub2ApiProfileSourceContext? usernameSource;
  @override
  final Sub2ApiProfileSourceContext? displayNameSource;
  @override
  final Sub2ApiProfileSourceContext? nicknameSource;
  final Map<String, Sub2ApiProfileSourceContext>? _profileSources;
  @override
  Map<String, Sub2ApiProfileSourceContext>? get profileSources {
    final value = _profileSources;
    if (value == null) return null;
    if (_profileSources is EqualUnmodifiableMapView) return _profileSources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of Sub2ApiUserAccountSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiUserAccountSnapshotCopyWith<_Sub2ApiUserAccountSnapshot>
  get copyWith =>
      __$Sub2ApiUserAccountSnapshotCopyWithImpl<_Sub2ApiUserAccountSnapshot>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiUserAccountSnapshot &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.frozenBalance, frozenBalance) ||
                other.frozenBalance == frozenBalance) &&
            (identical(other.concurrency, concurrency) ||
                other.concurrency == concurrency) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._allowedGroups,
              _allowedGroups,
            ) &&
            (identical(other.balanceNotifyEnabled, balanceNotifyEnabled) ||
                other.balanceNotifyEnabled == balanceNotifyEnabled) &&
            (identical(
                  other.balanceNotifyThresholdType,
                  balanceNotifyThresholdType,
                ) ||
                other.balanceNotifyThresholdType ==
                    balanceNotifyThresholdType) &&
            (identical(other.balanceNotifyThreshold, balanceNotifyThreshold) ||
                other.balanceNotifyThreshold == balanceNotifyThreshold) &&
            const DeepCollectionEquality().equals(
              other._balanceNotifyExtraEmails,
              _balanceNotifyExtraEmails,
            ) &&
            (identical(other.totalRecharged, totalRecharged) ||
                other.totalRecharged == totalRecharged) &&
            (identical(other.rpmLimit, rpmLimit) ||
                other.rpmLimit == rpmLimit) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.identities, identities) ||
                other.identities == identities) &&
            const DeepCollectionEquality().equals(
              other._authBindings,
              _authBindings,
            ) &&
            const DeepCollectionEquality().equals(
              other._identityBindings,
              _identityBindings,
            ) &&
            (identical(other.emailBound, emailBound) ||
                other.emailBound == emailBound) &&
            (identical(other.linuxDoBound, linuxDoBound) ||
                other.linuxDoBound == linuxDoBound) &&
            (identical(other.oidcBound, oidcBound) ||
                other.oidcBound == oidcBound) &&
            (identical(other.weChatBound, weChatBound) ||
                other.weChatBound == weChatBound) &&
            (identical(other.dingTalkBound, dingTalkBound) ||
                other.dingTalkBound == dingTalkBound) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.avatarSource, avatarSource) ||
                other.avatarSource == avatarSource) &&
            (identical(other.usernameSource, usernameSource) ||
                other.usernameSource == usernameSource) &&
            (identical(other.displayNameSource, displayNameSource) ||
                other.displayNameSource == displayNameSource) &&
            (identical(other.nicknameSource, nicknameSource) ||
                other.nicknameSource == nicknameSource) &&
            const DeepCollectionEquality().equals(
              other._profileSources,
              _profileSources,
            ));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    email,
    username,
    role,
    balance,
    frozenBalance,
    concurrency,
    status,
    const DeepCollectionEquality().hash(_allowedGroups),
    balanceNotifyEnabled,
    balanceNotifyThresholdType,
    balanceNotifyThreshold,
    const DeepCollectionEquality().hash(_balanceNotifyExtraEmails),
    totalRecharged,
    rpmLimit,
    createdAt,
    updatedAt,
    identities,
    const DeepCollectionEquality().hash(_authBindings),
    const DeepCollectionEquality().hash(_identityBindings),
    emailBound,
    linuxDoBound,
    oidcBound,
    weChatBound,
    dingTalkBound,
    lastActiveAt,
    deletedAt,
    avatarUrl,
    avatarSource,
    usernameSource,
    displayNameSource,
    nicknameSource,
    const DeepCollectionEquality().hash(_profileSources),
  ]);

  @override
  String toString() {
    return 'Sub2ApiUserAccountSnapshot(id: $id, email: $email, username: $username, role: $role, balance: $balance, frozenBalance: $frozenBalance, concurrency: $concurrency, status: $status, allowedGroups: $allowedGroups, balanceNotifyEnabled: $balanceNotifyEnabled, balanceNotifyThresholdType: $balanceNotifyThresholdType, balanceNotifyThreshold: $balanceNotifyThreshold, balanceNotifyExtraEmails: $balanceNotifyExtraEmails, totalRecharged: $totalRecharged, rpmLimit: $rpmLimit, createdAt: $createdAt, updatedAt: $updatedAt, identities: $identities, authBindings: $authBindings, identityBindings: $identityBindings, emailBound: $emailBound, linuxDoBound: $linuxDoBound, oidcBound: $oidcBound, weChatBound: $weChatBound, dingTalkBound: $dingTalkBound, lastActiveAt: $lastActiveAt, deletedAt: $deletedAt, avatarUrl: $avatarUrl, avatarSource: $avatarSource, usernameSource: $usernameSource, displayNameSource: $displayNameSource, nicknameSource: $nicknameSource, profileSources: $profileSources)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiUserAccountSnapshotCopyWith<$Res>
    implements $Sub2ApiUserAccountSnapshotCopyWith<$Res> {
  factory _$Sub2ApiUserAccountSnapshotCopyWith(
    _Sub2ApiUserAccountSnapshot value,
    $Res Function(_Sub2ApiUserAccountSnapshot) _then,
  ) = __$Sub2ApiUserAccountSnapshotCopyWithImpl;
  @override
  @useResult
  $Res call({
    int id,
    String email,
    String username,
    String role,
    Sub2ApiDecimal balance,
    Sub2ApiDecimal frozenBalance,
    int concurrency,
    String status,
    List<int> allowedGroups,
    bool balanceNotifyEnabled,
    String balanceNotifyThresholdType,
    Sub2ApiDecimal? balanceNotifyThreshold,
    List<Sub2ApiNotifyEmailEntry> balanceNotifyExtraEmails,
    Sub2ApiDecimal totalRecharged,
    int rpmLimit,
    DateTime createdAt,
    DateTime updatedAt,
    Sub2ApiUserIdentitySet identities,
    Map<String, Sub2ApiIdentityBinding> authBindings,
    Map<String, Sub2ApiIdentityBinding> identityBindings,
    bool emailBound,
    bool linuxDoBound,
    bool oidcBound,
    bool weChatBound,
    bool dingTalkBound,
    DateTime? lastActiveAt,
    DateTime? deletedAt,
    String? avatarUrl,
    Sub2ApiProfileSourceContext? avatarSource,
    Sub2ApiProfileSourceContext? usernameSource,
    Sub2ApiProfileSourceContext? displayNameSource,
    Sub2ApiProfileSourceContext? nicknameSource,
    Map<String, Sub2ApiProfileSourceContext>? profileSources,
  });

  @override
  $Sub2ApiUserIdentitySetCopyWith<$Res> get identities;
  @override
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get avatarSource;
  @override
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get usernameSource;
  @override
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get displayNameSource;
  @override
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get nicknameSource;
}

/// @nodoc
class __$Sub2ApiUserAccountSnapshotCopyWithImpl<$Res>
    implements _$Sub2ApiUserAccountSnapshotCopyWith<$Res> {
  __$Sub2ApiUserAccountSnapshotCopyWithImpl(this._self, this._then);

  final _Sub2ApiUserAccountSnapshot _self;
  final $Res Function(_Sub2ApiUserAccountSnapshot) _then;

  /// Create a copy of Sub2ApiUserAccountSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? role = null,
    Object? balance = null,
    Object? frozenBalance = null,
    Object? concurrency = null,
    Object? status = null,
    Object? allowedGroups = null,
    Object? balanceNotifyEnabled = null,
    Object? balanceNotifyThresholdType = null,
    Object? balanceNotifyThreshold = freezed,
    Object? balanceNotifyExtraEmails = null,
    Object? totalRecharged = null,
    Object? rpmLimit = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? identities = null,
    Object? authBindings = null,
    Object? identityBindings = null,
    Object? emailBound = null,
    Object? linuxDoBound = null,
    Object? oidcBound = null,
    Object? weChatBound = null,
    Object? dingTalkBound = null,
    Object? lastActiveAt = freezed,
    Object? deletedAt = freezed,
    Object? avatarUrl = freezed,
    Object? avatarSource = freezed,
    Object? usernameSource = freezed,
    Object? displayNameSource = freezed,
    Object? nicknameSource = freezed,
    Object? profileSources = freezed,
  }) {
    return _then(
      _Sub2ApiUserAccountSnapshot(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        email: null == email
            ? _self.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _self.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        balance: null == balance
            ? _self.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        frozenBalance: null == frozenBalance
            ? _self.frozenBalance
            : frozenBalance // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        concurrency: null == concurrency
            ? _self.concurrency
            : concurrency // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        allowedGroups: null == allowedGroups
            ? _self._allowedGroups
            : allowedGroups // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        balanceNotifyEnabled: null == balanceNotifyEnabled
            ? _self.balanceNotifyEnabled
            : balanceNotifyEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        balanceNotifyThresholdType: null == balanceNotifyThresholdType
            ? _self.balanceNotifyThresholdType
            : balanceNotifyThresholdType // ignore: cast_nullable_to_non_nullable
                  as String,
        balanceNotifyThreshold: freezed == balanceNotifyThreshold
            ? _self.balanceNotifyThreshold
            : balanceNotifyThreshold // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal?,
        balanceNotifyExtraEmails: null == balanceNotifyExtraEmails
            ? _self._balanceNotifyExtraEmails
            : balanceNotifyExtraEmails // ignore: cast_nullable_to_non_nullable
                  as List<Sub2ApiNotifyEmailEntry>,
        totalRecharged: null == totalRecharged
            ? _self.totalRecharged
            : totalRecharged // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiDecimal,
        rpmLimit: null == rpmLimit
            ? _self.rpmLimit
            : rpmLimit // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _self.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        identities: null == identities
            ? _self.identities
            : identities // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiUserIdentitySet,
        authBindings: null == authBindings
            ? _self._authBindings
            : authBindings // ignore: cast_nullable_to_non_nullable
                  as Map<String, Sub2ApiIdentityBinding>,
        identityBindings: null == identityBindings
            ? _self._identityBindings
            : identityBindings // ignore: cast_nullable_to_non_nullable
                  as Map<String, Sub2ApiIdentityBinding>,
        emailBound: null == emailBound
            ? _self.emailBound
            : emailBound // ignore: cast_nullable_to_non_nullable
                  as bool,
        linuxDoBound: null == linuxDoBound
            ? _self.linuxDoBound
            : linuxDoBound // ignore: cast_nullable_to_non_nullable
                  as bool,
        oidcBound: null == oidcBound
            ? _self.oidcBound
            : oidcBound // ignore: cast_nullable_to_non_nullable
                  as bool,
        weChatBound: null == weChatBound
            ? _self.weChatBound
            : weChatBound // ignore: cast_nullable_to_non_nullable
                  as bool,
        dingTalkBound: null == dingTalkBound
            ? _self.dingTalkBound
            : dingTalkBound // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastActiveAt: freezed == lastActiveAt
            ? _self.lastActiveAt
            : lastActiveAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        deletedAt: freezed == deletedAt
            ? _self.deletedAt
            : deletedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        avatarUrl: freezed == avatarUrl
            ? _self.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarSource: freezed == avatarSource
            ? _self.avatarSource
            : avatarSource // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiProfileSourceContext?,
        usernameSource: freezed == usernameSource
            ? _self.usernameSource
            : usernameSource // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiProfileSourceContext?,
        displayNameSource: freezed == displayNameSource
            ? _self.displayNameSource
            : displayNameSource // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiProfileSourceContext?,
        nicknameSource: freezed == nicknameSource
            ? _self.nicknameSource
            : nicknameSource // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiProfileSourceContext?,
        profileSources: freezed == profileSources
            ? _self._profileSources
            : profileSources // ignore: cast_nullable_to_non_nullable
                  as Map<String, Sub2ApiProfileSourceContext>?,
      ),
    );
  }

  /// Create a copy of Sub2ApiUserAccountSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiUserIdentitySetCopyWith<$Res> get identities {
    return $Sub2ApiUserIdentitySetCopyWith<$Res>(_self.identities, (value) {
      return _then(_self.copyWith(identities: value));
    });
  }

  /// Create a copy of Sub2ApiUserAccountSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get avatarSource {
    if (_self.avatarSource == null) {
      return null;
    }

    return $Sub2ApiProfileSourceContextCopyWith<$Res>(_self.avatarSource!, (
      value,
    ) {
      return _then(_self.copyWith(avatarSource: value));
    });
  }

  /// Create a copy of Sub2ApiUserAccountSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get usernameSource {
    if (_self.usernameSource == null) {
      return null;
    }

    return $Sub2ApiProfileSourceContextCopyWith<$Res>(_self.usernameSource!, (
      value,
    ) {
      return _then(_self.copyWith(usernameSource: value));
    });
  }

  /// Create a copy of Sub2ApiUserAccountSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get displayNameSource {
    if (_self.displayNameSource == null) {
      return null;
    }

    return $Sub2ApiProfileSourceContextCopyWith<$Res>(
      _self.displayNameSource!,
      (value) {
        return _then(_self.copyWith(displayNameSource: value));
      },
    );
  }

  /// Create a copy of Sub2ApiUserAccountSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiProfileSourceContextCopyWith<$Res>? get nicknameSource {
    if (_self.nicknameSource == null) {
      return null;
    }

    return $Sub2ApiProfileSourceContextCopyWith<$Res>(_self.nicknameSource!, (
      value,
    ) {
      return _then(_self.copyWith(nicknameSource: value));
    });
  }
}
