// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub2api_capabilities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sub2ApiOAuthCapabilities {
  bool get dingtalk;
  bool get github;
  bool get google;
  bool get linuxDo;
  bool get oidc;
  bool get wechat;

  /// Create a copy of Sub2ApiOAuthCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiOAuthCapabilitiesCopyWith<Sub2ApiOAuthCapabilities> get copyWith =>
      _$Sub2ApiOAuthCapabilitiesCopyWithImpl<Sub2ApiOAuthCapabilities>(
        this as Sub2ApiOAuthCapabilities,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiOAuthCapabilities &&
            (identical(other.dingtalk, dingtalk) ||
                other.dingtalk == dingtalk) &&
            (identical(other.github, github) || other.github == github) &&
            (identical(other.google, google) || other.google == google) &&
            (identical(other.linuxDo, linuxDo) || other.linuxDo == linuxDo) &&
            (identical(other.oidc, oidc) || other.oidc == oidc) &&
            (identical(other.wechat, wechat) || other.wechat == wechat));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, dingtalk, github, google, linuxDo, oidc, wechat);

  @override
  String toString() {
    return 'Sub2ApiOAuthCapabilities(dingtalk: $dingtalk, github: $github, google: $google, linuxDo: $linuxDo, oidc: $oidc, wechat: $wechat)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiOAuthCapabilitiesCopyWith<$Res> {
  factory $Sub2ApiOAuthCapabilitiesCopyWith(
    Sub2ApiOAuthCapabilities value,
    $Res Function(Sub2ApiOAuthCapabilities) _then,
  ) = _$Sub2ApiOAuthCapabilitiesCopyWithImpl;
  @useResult
  $Res call({
    bool dingtalk,
    bool github,
    bool google,
    bool linuxDo,
    bool oidc,
    bool wechat,
  });
}

/// @nodoc
class _$Sub2ApiOAuthCapabilitiesCopyWithImpl<$Res>
    implements $Sub2ApiOAuthCapabilitiesCopyWith<$Res> {
  _$Sub2ApiOAuthCapabilitiesCopyWithImpl(this._self, this._then);

  final Sub2ApiOAuthCapabilities _self;
  final $Res Function(Sub2ApiOAuthCapabilities) _then;

  /// Create a copy of Sub2ApiOAuthCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dingtalk = null,
    Object? github = null,
    Object? google = null,
    Object? linuxDo = null,
    Object? oidc = null,
    Object? wechat = null,
  }) {
    return _then(
      _self.copyWith(
        dingtalk: null == dingtalk
            ? _self.dingtalk
            : dingtalk // ignore: cast_nullable_to_non_nullable
                  as bool,
        github: null == github
            ? _self.github
            : github // ignore: cast_nullable_to_non_nullable
                  as bool,
        google: null == google
            ? _self.google
            : google // ignore: cast_nullable_to_non_nullable
                  as bool,
        linuxDo: null == linuxDo
            ? _self.linuxDo
            : linuxDo // ignore: cast_nullable_to_non_nullable
                  as bool,
        oidc: null == oidc
            ? _self.oidc
            : oidc // ignore: cast_nullable_to_non_nullable
                  as bool,
        wechat: null == wechat
            ? _self.wechat
            : wechat // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiOAuthCapabilities].
extension Sub2ApiOAuthCapabilitiesPatterns on Sub2ApiOAuthCapabilities {
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
    TResult Function(_Sub2ApiOAuthCapabilities value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiOAuthCapabilities() when $default != null:
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
    TResult Function(_Sub2ApiOAuthCapabilities value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiOAuthCapabilities():
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
    TResult? Function(_Sub2ApiOAuthCapabilities value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiOAuthCapabilities() when $default != null:
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
      bool dingtalk,
      bool github,
      bool google,
      bool linuxDo,
      bool oidc,
      bool wechat,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiOAuthCapabilities() when $default != null:
        return $default(
          _that.dingtalk,
          _that.github,
          _that.google,
          _that.linuxDo,
          _that.oidc,
          _that.wechat,
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
      bool dingtalk,
      bool github,
      bool google,
      bool linuxDo,
      bool oidc,
      bool wechat,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiOAuthCapabilities():
        return $default(
          _that.dingtalk,
          _that.github,
          _that.google,
          _that.linuxDo,
          _that.oidc,
          _that.wechat,
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
      bool dingtalk,
      bool github,
      bool google,
      bool linuxDo,
      bool oidc,
      bool wechat,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiOAuthCapabilities() when $default != null:
        return $default(
          _that.dingtalk,
          _that.github,
          _that.google,
          _that.linuxDo,
          _that.oidc,
          _that.wechat,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiOAuthCapabilities implements Sub2ApiOAuthCapabilities {
  const _Sub2ApiOAuthCapabilities({
    required this.dingtalk,
    required this.github,
    required this.google,
    required this.linuxDo,
    required this.oidc,
    required this.wechat,
  });

  @override
  final bool dingtalk;
  @override
  final bool github;
  @override
  final bool google;
  @override
  final bool linuxDo;
  @override
  final bool oidc;
  @override
  final bool wechat;

  /// Create a copy of Sub2ApiOAuthCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiOAuthCapabilitiesCopyWith<_Sub2ApiOAuthCapabilities> get copyWith =>
      __$Sub2ApiOAuthCapabilitiesCopyWithImpl<_Sub2ApiOAuthCapabilities>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiOAuthCapabilities &&
            (identical(other.dingtalk, dingtalk) ||
                other.dingtalk == dingtalk) &&
            (identical(other.github, github) || other.github == github) &&
            (identical(other.google, google) || other.google == google) &&
            (identical(other.linuxDo, linuxDo) || other.linuxDo == linuxDo) &&
            (identical(other.oidc, oidc) || other.oidc == oidc) &&
            (identical(other.wechat, wechat) || other.wechat == wechat));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, dingtalk, github, google, linuxDo, oidc, wechat);

  @override
  String toString() {
    return 'Sub2ApiOAuthCapabilities(dingtalk: $dingtalk, github: $github, google: $google, linuxDo: $linuxDo, oidc: $oidc, wechat: $wechat)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiOAuthCapabilitiesCopyWith<$Res>
    implements $Sub2ApiOAuthCapabilitiesCopyWith<$Res> {
  factory _$Sub2ApiOAuthCapabilitiesCopyWith(
    _Sub2ApiOAuthCapabilities value,
    $Res Function(_Sub2ApiOAuthCapabilities) _then,
  ) = __$Sub2ApiOAuthCapabilitiesCopyWithImpl;
  @override
  @useResult
  $Res call({
    bool dingtalk,
    bool github,
    bool google,
    bool linuxDo,
    bool oidc,
    bool wechat,
  });
}

/// @nodoc
class __$Sub2ApiOAuthCapabilitiesCopyWithImpl<$Res>
    implements _$Sub2ApiOAuthCapabilitiesCopyWith<$Res> {
  __$Sub2ApiOAuthCapabilitiesCopyWithImpl(this._self, this._then);

  final _Sub2ApiOAuthCapabilities _self;
  final $Res Function(_Sub2ApiOAuthCapabilities) _then;

  /// Create a copy of Sub2ApiOAuthCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dingtalk = null,
    Object? github = null,
    Object? google = null,
    Object? linuxDo = null,
    Object? oidc = null,
    Object? wechat = null,
  }) {
    return _then(
      _Sub2ApiOAuthCapabilities(
        dingtalk: null == dingtalk
            ? _self.dingtalk
            : dingtalk // ignore: cast_nullable_to_non_nullable
                  as bool,
        github: null == github
            ? _self.github
            : github // ignore: cast_nullable_to_non_nullable
                  as bool,
        google: null == google
            ? _self.google
            : google // ignore: cast_nullable_to_non_nullable
                  as bool,
        linuxDo: null == linuxDo
            ? _self.linuxDo
            : linuxDo // ignore: cast_nullable_to_non_nullable
                  as bool,
        oidc: null == oidc
            ? _self.oidc
            : oidc // ignore: cast_nullable_to_non_nullable
                  as bool,
        wechat: null == wechat
            ? _self.wechat
            : wechat // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
mixin _$Sub2ApiCapabilities {
  bool get aliyunCaptchaEnabled;
  String get aliyunCaptchaPrefix;
  String get aliyunCaptchaRegion;
  String get aliyunCaptchaSceneId;
  bool get backendModeEnabled;
  bool get emailVerificationEnabled;
  bool get forceEmailOnThirdPartySignup;
  bool get invitationCodeEnabled;
  Sub2ApiOAuthCapabilities get oauth;
  bool get passkeyEnabled;
  bool get passwordResetEnabled;
  bool get paymentEnabled;
  bool get promoCodeEnabled;
  bool get registrationEmailDomainQuotaEnabled;
  bool get registrationEnabled;
  String get serverTimezone;
  String get serverUtcOffset;
  bool get tencentCaptchaEnabled;
  String get tencentCaptchaAppId;
  String get tencentCaptchaRegion;
  bool get totpEnabled;
  bool get turnstileEnabled;
  String get turnstileSiteKey;
  String get version;

  /// Create a copy of Sub2ApiCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Sub2ApiCapabilitiesCopyWith<Sub2ApiCapabilities> get copyWith =>
      _$Sub2ApiCapabilitiesCopyWithImpl<Sub2ApiCapabilities>(
        this as Sub2ApiCapabilities,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sub2ApiCapabilities &&
            (identical(other.aliyunCaptchaEnabled, aliyunCaptchaEnabled) ||
                other.aliyunCaptchaEnabled == aliyunCaptchaEnabled) &&
            (identical(other.aliyunCaptchaPrefix, aliyunCaptchaPrefix) ||
                other.aliyunCaptchaPrefix == aliyunCaptchaPrefix) &&
            (identical(other.aliyunCaptchaRegion, aliyunCaptchaRegion) ||
                other.aliyunCaptchaRegion == aliyunCaptchaRegion) &&
            (identical(other.aliyunCaptchaSceneId, aliyunCaptchaSceneId) ||
                other.aliyunCaptchaSceneId == aliyunCaptchaSceneId) &&
            (identical(other.backendModeEnabled, backendModeEnabled) ||
                other.backendModeEnabled == backendModeEnabled) &&
            (identical(
                  other.emailVerificationEnabled,
                  emailVerificationEnabled,
                ) ||
                other.emailVerificationEnabled == emailVerificationEnabled) &&
            (identical(
                  other.forceEmailOnThirdPartySignup,
                  forceEmailOnThirdPartySignup,
                ) ||
                other.forceEmailOnThirdPartySignup ==
                    forceEmailOnThirdPartySignup) &&
            (identical(other.invitationCodeEnabled, invitationCodeEnabled) ||
                other.invitationCodeEnabled == invitationCodeEnabled) &&
            (identical(other.oauth, oauth) || other.oauth == oauth) &&
            (identical(other.passkeyEnabled, passkeyEnabled) ||
                other.passkeyEnabled == passkeyEnabled) &&
            (identical(other.passwordResetEnabled, passwordResetEnabled) ||
                other.passwordResetEnabled == passwordResetEnabled) &&
            (identical(other.paymentEnabled, paymentEnabled) ||
                other.paymentEnabled == paymentEnabled) &&
            (identical(other.promoCodeEnabled, promoCodeEnabled) ||
                other.promoCodeEnabled == promoCodeEnabled) &&
            (identical(
                  other.registrationEmailDomainQuotaEnabled,
                  registrationEmailDomainQuotaEnabled,
                ) ||
                other.registrationEmailDomainQuotaEnabled ==
                    registrationEmailDomainQuotaEnabled) &&
            (identical(other.registrationEnabled, registrationEnabled) ||
                other.registrationEnabled == registrationEnabled) &&
            (identical(other.serverTimezone, serverTimezone) ||
                other.serverTimezone == serverTimezone) &&
            (identical(other.serverUtcOffset, serverUtcOffset) ||
                other.serverUtcOffset == serverUtcOffset) &&
            (identical(other.tencentCaptchaEnabled, tencentCaptchaEnabled) ||
                other.tencentCaptchaEnabled == tencentCaptchaEnabled) &&
            (identical(other.tencentCaptchaAppId, tencentCaptchaAppId) ||
                other.tencentCaptchaAppId == tencentCaptchaAppId) &&
            (identical(other.tencentCaptchaRegion, tencentCaptchaRegion) ||
                other.tencentCaptchaRegion == tencentCaptchaRegion) &&
            (identical(other.totpEnabled, totpEnabled) ||
                other.totpEnabled == totpEnabled) &&
            (identical(other.turnstileEnabled, turnstileEnabled) ||
                other.turnstileEnabled == turnstileEnabled) &&
            (identical(other.turnstileSiteKey, turnstileSiteKey) ||
                other.turnstileSiteKey == turnstileSiteKey) &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    aliyunCaptchaEnabled,
    aliyunCaptchaPrefix,
    aliyunCaptchaRegion,
    aliyunCaptchaSceneId,
    backendModeEnabled,
    emailVerificationEnabled,
    forceEmailOnThirdPartySignup,
    invitationCodeEnabled,
    oauth,
    passkeyEnabled,
    passwordResetEnabled,
    paymentEnabled,
    promoCodeEnabled,
    registrationEmailDomainQuotaEnabled,
    registrationEnabled,
    serverTimezone,
    serverUtcOffset,
    tencentCaptchaEnabled,
    tencentCaptchaAppId,
    tencentCaptchaRegion,
    totpEnabled,
    turnstileEnabled,
    turnstileSiteKey,
    version,
  ]);

  @override
  String toString() {
    return 'Sub2ApiCapabilities(aliyunCaptchaEnabled: $aliyunCaptchaEnabled, aliyunCaptchaPrefix: $aliyunCaptchaPrefix, aliyunCaptchaRegion: $aliyunCaptchaRegion, aliyunCaptchaSceneId: $aliyunCaptchaSceneId, backendModeEnabled: $backendModeEnabled, emailVerificationEnabled: $emailVerificationEnabled, forceEmailOnThirdPartySignup: $forceEmailOnThirdPartySignup, invitationCodeEnabled: $invitationCodeEnabled, oauth: $oauth, passkeyEnabled: $passkeyEnabled, passwordResetEnabled: $passwordResetEnabled, paymentEnabled: $paymentEnabled, promoCodeEnabled: $promoCodeEnabled, registrationEmailDomainQuotaEnabled: $registrationEmailDomainQuotaEnabled, registrationEnabled: $registrationEnabled, serverTimezone: $serverTimezone, serverUtcOffset: $serverUtcOffset, tencentCaptchaEnabled: $tencentCaptchaEnabled, tencentCaptchaAppId: $tencentCaptchaAppId, tencentCaptchaRegion: $tencentCaptchaRegion, totpEnabled: $totpEnabled, turnstileEnabled: $turnstileEnabled, turnstileSiteKey: $turnstileSiteKey, version: $version)';
  }
}

/// @nodoc
abstract mixin class $Sub2ApiCapabilitiesCopyWith<$Res> {
  factory $Sub2ApiCapabilitiesCopyWith(
    Sub2ApiCapabilities value,
    $Res Function(Sub2ApiCapabilities) _then,
  ) = _$Sub2ApiCapabilitiesCopyWithImpl;
  @useResult
  $Res call({
    bool aliyunCaptchaEnabled,
    String aliyunCaptchaPrefix,
    String aliyunCaptchaRegion,
    String aliyunCaptchaSceneId,
    bool backendModeEnabled,
    bool emailVerificationEnabled,
    bool forceEmailOnThirdPartySignup,
    bool invitationCodeEnabled,
    Sub2ApiOAuthCapabilities oauth,
    bool passkeyEnabled,
    bool passwordResetEnabled,
    bool paymentEnabled,
    bool promoCodeEnabled,
    bool registrationEmailDomainQuotaEnabled,
    bool registrationEnabled,
    String serverTimezone,
    String serverUtcOffset,
    bool tencentCaptchaEnabled,
    String tencentCaptchaAppId,
    String tencentCaptchaRegion,
    bool totpEnabled,
    bool turnstileEnabled,
    String turnstileSiteKey,
    String version,
  });

  $Sub2ApiOAuthCapabilitiesCopyWith<$Res> get oauth;
}

/// @nodoc
class _$Sub2ApiCapabilitiesCopyWithImpl<$Res>
    implements $Sub2ApiCapabilitiesCopyWith<$Res> {
  _$Sub2ApiCapabilitiesCopyWithImpl(this._self, this._then);

  final Sub2ApiCapabilities _self;
  final $Res Function(Sub2ApiCapabilities) _then;

  /// Create a copy of Sub2ApiCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aliyunCaptchaEnabled = null,
    Object? aliyunCaptchaPrefix = null,
    Object? aliyunCaptchaRegion = null,
    Object? aliyunCaptchaSceneId = null,
    Object? backendModeEnabled = null,
    Object? emailVerificationEnabled = null,
    Object? forceEmailOnThirdPartySignup = null,
    Object? invitationCodeEnabled = null,
    Object? oauth = null,
    Object? passkeyEnabled = null,
    Object? passwordResetEnabled = null,
    Object? paymentEnabled = null,
    Object? promoCodeEnabled = null,
    Object? registrationEmailDomainQuotaEnabled = null,
    Object? registrationEnabled = null,
    Object? serverTimezone = null,
    Object? serverUtcOffset = null,
    Object? tencentCaptchaEnabled = null,
    Object? tencentCaptchaAppId = null,
    Object? tencentCaptchaRegion = null,
    Object? totpEnabled = null,
    Object? turnstileEnabled = null,
    Object? turnstileSiteKey = null,
    Object? version = null,
  }) {
    return _then(
      _self.copyWith(
        aliyunCaptchaEnabled: null == aliyunCaptchaEnabled
            ? _self.aliyunCaptchaEnabled
            : aliyunCaptchaEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        aliyunCaptchaPrefix: null == aliyunCaptchaPrefix
            ? _self.aliyunCaptchaPrefix
            : aliyunCaptchaPrefix // ignore: cast_nullable_to_non_nullable
                  as String,
        aliyunCaptchaRegion: null == aliyunCaptchaRegion
            ? _self.aliyunCaptchaRegion
            : aliyunCaptchaRegion // ignore: cast_nullable_to_non_nullable
                  as String,
        aliyunCaptchaSceneId: null == aliyunCaptchaSceneId
            ? _self.aliyunCaptchaSceneId
            : aliyunCaptchaSceneId // ignore: cast_nullable_to_non_nullable
                  as String,
        backendModeEnabled: null == backendModeEnabled
            ? _self.backendModeEnabled
            : backendModeEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        emailVerificationEnabled: null == emailVerificationEnabled
            ? _self.emailVerificationEnabled
            : emailVerificationEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        forceEmailOnThirdPartySignup: null == forceEmailOnThirdPartySignup
            ? _self.forceEmailOnThirdPartySignup
            : forceEmailOnThirdPartySignup // ignore: cast_nullable_to_non_nullable
                  as bool,
        invitationCodeEnabled: null == invitationCodeEnabled
            ? _self.invitationCodeEnabled
            : invitationCodeEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        oauth: null == oauth
            ? _self.oauth
            : oauth // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiOAuthCapabilities,
        passkeyEnabled: null == passkeyEnabled
            ? _self.passkeyEnabled
            : passkeyEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        passwordResetEnabled: null == passwordResetEnabled
            ? _self.passwordResetEnabled
            : passwordResetEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        paymentEnabled: null == paymentEnabled
            ? _self.paymentEnabled
            : paymentEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        promoCodeEnabled: null == promoCodeEnabled
            ? _self.promoCodeEnabled
            : promoCodeEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        registrationEmailDomainQuotaEnabled:
            null == registrationEmailDomainQuotaEnabled
            ? _self.registrationEmailDomainQuotaEnabled
            : registrationEmailDomainQuotaEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        registrationEnabled: null == registrationEnabled
            ? _self.registrationEnabled
            : registrationEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        serverTimezone: null == serverTimezone
            ? _self.serverTimezone
            : serverTimezone // ignore: cast_nullable_to_non_nullable
                  as String,
        serverUtcOffset: null == serverUtcOffset
            ? _self.serverUtcOffset
            : serverUtcOffset // ignore: cast_nullable_to_non_nullable
                  as String,
        tencentCaptchaEnabled: null == tencentCaptchaEnabled
            ? _self.tencentCaptchaEnabled
            : tencentCaptchaEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        tencentCaptchaAppId: null == tencentCaptchaAppId
            ? _self.tencentCaptchaAppId
            : tencentCaptchaAppId // ignore: cast_nullable_to_non_nullable
                  as String,
        tencentCaptchaRegion: null == tencentCaptchaRegion
            ? _self.tencentCaptchaRegion
            : tencentCaptchaRegion // ignore: cast_nullable_to_non_nullable
                  as String,
        totpEnabled: null == totpEnabled
            ? _self.totpEnabled
            : totpEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        turnstileEnabled: null == turnstileEnabled
            ? _self.turnstileEnabled
            : turnstileEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        turnstileSiteKey: null == turnstileSiteKey
            ? _self.turnstileSiteKey
            : turnstileSiteKey // ignore: cast_nullable_to_non_nullable
                  as String,
        version: null == version
            ? _self.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }

  /// Create a copy of Sub2ApiCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiOAuthCapabilitiesCopyWith<$Res> get oauth {
    return $Sub2ApiOAuthCapabilitiesCopyWith<$Res>(_self.oauth, (value) {
      return _then(_self.copyWith(oauth: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Sub2ApiCapabilities].
extension Sub2ApiCapabilitiesPatterns on Sub2ApiCapabilities {
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
    TResult Function(_Sub2ApiCapabilities value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiCapabilities() when $default != null:
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
    TResult Function(_Sub2ApiCapabilities value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiCapabilities():
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
    TResult? Function(_Sub2ApiCapabilities value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiCapabilities() when $default != null:
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
      bool aliyunCaptchaEnabled,
      String aliyunCaptchaPrefix,
      String aliyunCaptchaRegion,
      String aliyunCaptchaSceneId,
      bool backendModeEnabled,
      bool emailVerificationEnabled,
      bool forceEmailOnThirdPartySignup,
      bool invitationCodeEnabled,
      Sub2ApiOAuthCapabilities oauth,
      bool passkeyEnabled,
      bool passwordResetEnabled,
      bool paymentEnabled,
      bool promoCodeEnabled,
      bool registrationEmailDomainQuotaEnabled,
      bool registrationEnabled,
      String serverTimezone,
      String serverUtcOffset,
      bool tencentCaptchaEnabled,
      String tencentCaptchaAppId,
      String tencentCaptchaRegion,
      bool totpEnabled,
      bool turnstileEnabled,
      String turnstileSiteKey,
      String version,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiCapabilities() when $default != null:
        return $default(
          _that.aliyunCaptchaEnabled,
          _that.aliyunCaptchaPrefix,
          _that.aliyunCaptchaRegion,
          _that.aliyunCaptchaSceneId,
          _that.backendModeEnabled,
          _that.emailVerificationEnabled,
          _that.forceEmailOnThirdPartySignup,
          _that.invitationCodeEnabled,
          _that.oauth,
          _that.passkeyEnabled,
          _that.passwordResetEnabled,
          _that.paymentEnabled,
          _that.promoCodeEnabled,
          _that.registrationEmailDomainQuotaEnabled,
          _that.registrationEnabled,
          _that.serverTimezone,
          _that.serverUtcOffset,
          _that.tencentCaptchaEnabled,
          _that.tencentCaptchaAppId,
          _that.tencentCaptchaRegion,
          _that.totpEnabled,
          _that.turnstileEnabled,
          _that.turnstileSiteKey,
          _that.version,
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
      bool aliyunCaptchaEnabled,
      String aliyunCaptchaPrefix,
      String aliyunCaptchaRegion,
      String aliyunCaptchaSceneId,
      bool backendModeEnabled,
      bool emailVerificationEnabled,
      bool forceEmailOnThirdPartySignup,
      bool invitationCodeEnabled,
      Sub2ApiOAuthCapabilities oauth,
      bool passkeyEnabled,
      bool passwordResetEnabled,
      bool paymentEnabled,
      bool promoCodeEnabled,
      bool registrationEmailDomainQuotaEnabled,
      bool registrationEnabled,
      String serverTimezone,
      String serverUtcOffset,
      bool tencentCaptchaEnabled,
      String tencentCaptchaAppId,
      String tencentCaptchaRegion,
      bool totpEnabled,
      bool turnstileEnabled,
      String turnstileSiteKey,
      String version,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiCapabilities():
        return $default(
          _that.aliyunCaptchaEnabled,
          _that.aliyunCaptchaPrefix,
          _that.aliyunCaptchaRegion,
          _that.aliyunCaptchaSceneId,
          _that.backendModeEnabled,
          _that.emailVerificationEnabled,
          _that.forceEmailOnThirdPartySignup,
          _that.invitationCodeEnabled,
          _that.oauth,
          _that.passkeyEnabled,
          _that.passwordResetEnabled,
          _that.paymentEnabled,
          _that.promoCodeEnabled,
          _that.registrationEmailDomainQuotaEnabled,
          _that.registrationEnabled,
          _that.serverTimezone,
          _that.serverUtcOffset,
          _that.tencentCaptchaEnabled,
          _that.tencentCaptchaAppId,
          _that.tencentCaptchaRegion,
          _that.totpEnabled,
          _that.turnstileEnabled,
          _that.turnstileSiteKey,
          _that.version,
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
      bool aliyunCaptchaEnabled,
      String aliyunCaptchaPrefix,
      String aliyunCaptchaRegion,
      String aliyunCaptchaSceneId,
      bool backendModeEnabled,
      bool emailVerificationEnabled,
      bool forceEmailOnThirdPartySignup,
      bool invitationCodeEnabled,
      Sub2ApiOAuthCapabilities oauth,
      bool passkeyEnabled,
      bool passwordResetEnabled,
      bool paymentEnabled,
      bool promoCodeEnabled,
      bool registrationEmailDomainQuotaEnabled,
      bool registrationEnabled,
      String serverTimezone,
      String serverUtcOffset,
      bool tencentCaptchaEnabled,
      String tencentCaptchaAppId,
      String tencentCaptchaRegion,
      bool totpEnabled,
      bool turnstileEnabled,
      String turnstileSiteKey,
      String version,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sub2ApiCapabilities() when $default != null:
        return $default(
          _that.aliyunCaptchaEnabled,
          _that.aliyunCaptchaPrefix,
          _that.aliyunCaptchaRegion,
          _that.aliyunCaptchaSceneId,
          _that.backendModeEnabled,
          _that.emailVerificationEnabled,
          _that.forceEmailOnThirdPartySignup,
          _that.invitationCodeEnabled,
          _that.oauth,
          _that.passkeyEnabled,
          _that.passwordResetEnabled,
          _that.paymentEnabled,
          _that.promoCodeEnabled,
          _that.registrationEmailDomainQuotaEnabled,
          _that.registrationEnabled,
          _that.serverTimezone,
          _that.serverUtcOffset,
          _that.tencentCaptchaEnabled,
          _that.tencentCaptchaAppId,
          _that.tencentCaptchaRegion,
          _that.totpEnabled,
          _that.turnstileEnabled,
          _that.turnstileSiteKey,
          _that.version,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Sub2ApiCapabilities implements Sub2ApiCapabilities {
  const _Sub2ApiCapabilities({
    required this.aliyunCaptchaEnabled,
    required this.aliyunCaptchaPrefix,
    required this.aliyunCaptchaRegion,
    required this.aliyunCaptchaSceneId,
    required this.backendModeEnabled,
    required this.emailVerificationEnabled,
    required this.forceEmailOnThirdPartySignup,
    required this.invitationCodeEnabled,
    required this.oauth,
    required this.passkeyEnabled,
    required this.passwordResetEnabled,
    required this.paymentEnabled,
    required this.promoCodeEnabled,
    required this.registrationEmailDomainQuotaEnabled,
    required this.registrationEnabled,
    required this.serverTimezone,
    required this.serverUtcOffset,
    required this.tencentCaptchaEnabled,
    required this.tencentCaptchaAppId,
    required this.tencentCaptchaRegion,
    required this.totpEnabled,
    required this.turnstileEnabled,
    required this.turnstileSiteKey,
    required this.version,
  });

  @override
  final bool aliyunCaptchaEnabled;
  @override
  final String aliyunCaptchaPrefix;
  @override
  final String aliyunCaptchaRegion;
  @override
  final String aliyunCaptchaSceneId;
  @override
  final bool backendModeEnabled;
  @override
  final bool emailVerificationEnabled;
  @override
  final bool forceEmailOnThirdPartySignup;
  @override
  final bool invitationCodeEnabled;
  @override
  final Sub2ApiOAuthCapabilities oauth;
  @override
  final bool passkeyEnabled;
  @override
  final bool passwordResetEnabled;
  @override
  final bool paymentEnabled;
  @override
  final bool promoCodeEnabled;
  @override
  final bool registrationEmailDomainQuotaEnabled;
  @override
  final bool registrationEnabled;
  @override
  final String serverTimezone;
  @override
  final String serverUtcOffset;
  @override
  final bool tencentCaptchaEnabled;
  @override
  final String tencentCaptchaAppId;
  @override
  final String tencentCaptchaRegion;
  @override
  final bool totpEnabled;
  @override
  final bool turnstileEnabled;
  @override
  final String turnstileSiteKey;
  @override
  final String version;

  /// Create a copy of Sub2ApiCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Sub2ApiCapabilitiesCopyWith<_Sub2ApiCapabilities> get copyWith =>
      __$Sub2ApiCapabilitiesCopyWithImpl<_Sub2ApiCapabilities>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sub2ApiCapabilities &&
            (identical(other.aliyunCaptchaEnabled, aliyunCaptchaEnabled) ||
                other.aliyunCaptchaEnabled == aliyunCaptchaEnabled) &&
            (identical(other.aliyunCaptchaPrefix, aliyunCaptchaPrefix) ||
                other.aliyunCaptchaPrefix == aliyunCaptchaPrefix) &&
            (identical(other.aliyunCaptchaRegion, aliyunCaptchaRegion) ||
                other.aliyunCaptchaRegion == aliyunCaptchaRegion) &&
            (identical(other.aliyunCaptchaSceneId, aliyunCaptchaSceneId) ||
                other.aliyunCaptchaSceneId == aliyunCaptchaSceneId) &&
            (identical(other.backendModeEnabled, backendModeEnabled) ||
                other.backendModeEnabled == backendModeEnabled) &&
            (identical(
                  other.emailVerificationEnabled,
                  emailVerificationEnabled,
                ) ||
                other.emailVerificationEnabled == emailVerificationEnabled) &&
            (identical(
                  other.forceEmailOnThirdPartySignup,
                  forceEmailOnThirdPartySignup,
                ) ||
                other.forceEmailOnThirdPartySignup ==
                    forceEmailOnThirdPartySignup) &&
            (identical(other.invitationCodeEnabled, invitationCodeEnabled) ||
                other.invitationCodeEnabled == invitationCodeEnabled) &&
            (identical(other.oauth, oauth) || other.oauth == oauth) &&
            (identical(other.passkeyEnabled, passkeyEnabled) ||
                other.passkeyEnabled == passkeyEnabled) &&
            (identical(other.passwordResetEnabled, passwordResetEnabled) ||
                other.passwordResetEnabled == passwordResetEnabled) &&
            (identical(other.paymentEnabled, paymentEnabled) ||
                other.paymentEnabled == paymentEnabled) &&
            (identical(other.promoCodeEnabled, promoCodeEnabled) ||
                other.promoCodeEnabled == promoCodeEnabled) &&
            (identical(
                  other.registrationEmailDomainQuotaEnabled,
                  registrationEmailDomainQuotaEnabled,
                ) ||
                other.registrationEmailDomainQuotaEnabled ==
                    registrationEmailDomainQuotaEnabled) &&
            (identical(other.registrationEnabled, registrationEnabled) ||
                other.registrationEnabled == registrationEnabled) &&
            (identical(other.serverTimezone, serverTimezone) ||
                other.serverTimezone == serverTimezone) &&
            (identical(other.serverUtcOffset, serverUtcOffset) ||
                other.serverUtcOffset == serverUtcOffset) &&
            (identical(other.tencentCaptchaEnabled, tencentCaptchaEnabled) ||
                other.tencentCaptchaEnabled == tencentCaptchaEnabled) &&
            (identical(other.tencentCaptchaAppId, tencentCaptchaAppId) ||
                other.tencentCaptchaAppId == tencentCaptchaAppId) &&
            (identical(other.tencentCaptchaRegion, tencentCaptchaRegion) ||
                other.tencentCaptchaRegion == tencentCaptchaRegion) &&
            (identical(other.totpEnabled, totpEnabled) ||
                other.totpEnabled == totpEnabled) &&
            (identical(other.turnstileEnabled, turnstileEnabled) ||
                other.turnstileEnabled == turnstileEnabled) &&
            (identical(other.turnstileSiteKey, turnstileSiteKey) ||
                other.turnstileSiteKey == turnstileSiteKey) &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    aliyunCaptchaEnabled,
    aliyunCaptchaPrefix,
    aliyunCaptchaRegion,
    aliyunCaptchaSceneId,
    backendModeEnabled,
    emailVerificationEnabled,
    forceEmailOnThirdPartySignup,
    invitationCodeEnabled,
    oauth,
    passkeyEnabled,
    passwordResetEnabled,
    paymentEnabled,
    promoCodeEnabled,
    registrationEmailDomainQuotaEnabled,
    registrationEnabled,
    serverTimezone,
    serverUtcOffset,
    tencentCaptchaEnabled,
    tencentCaptchaAppId,
    tencentCaptchaRegion,
    totpEnabled,
    turnstileEnabled,
    turnstileSiteKey,
    version,
  ]);

  @override
  String toString() {
    return 'Sub2ApiCapabilities(aliyunCaptchaEnabled: $aliyunCaptchaEnabled, aliyunCaptchaPrefix: $aliyunCaptchaPrefix, aliyunCaptchaRegion: $aliyunCaptchaRegion, aliyunCaptchaSceneId: $aliyunCaptchaSceneId, backendModeEnabled: $backendModeEnabled, emailVerificationEnabled: $emailVerificationEnabled, forceEmailOnThirdPartySignup: $forceEmailOnThirdPartySignup, invitationCodeEnabled: $invitationCodeEnabled, oauth: $oauth, passkeyEnabled: $passkeyEnabled, passwordResetEnabled: $passwordResetEnabled, paymentEnabled: $paymentEnabled, promoCodeEnabled: $promoCodeEnabled, registrationEmailDomainQuotaEnabled: $registrationEmailDomainQuotaEnabled, registrationEnabled: $registrationEnabled, serverTimezone: $serverTimezone, serverUtcOffset: $serverUtcOffset, tencentCaptchaEnabled: $tencentCaptchaEnabled, tencentCaptchaAppId: $tencentCaptchaAppId, tencentCaptchaRegion: $tencentCaptchaRegion, totpEnabled: $totpEnabled, turnstileEnabled: $turnstileEnabled, turnstileSiteKey: $turnstileSiteKey, version: $version)';
  }
}

/// @nodoc
abstract mixin class _$Sub2ApiCapabilitiesCopyWith<$Res>
    implements $Sub2ApiCapabilitiesCopyWith<$Res> {
  factory _$Sub2ApiCapabilitiesCopyWith(
    _Sub2ApiCapabilities value,
    $Res Function(_Sub2ApiCapabilities) _then,
  ) = __$Sub2ApiCapabilitiesCopyWithImpl;
  @override
  @useResult
  $Res call({
    bool aliyunCaptchaEnabled,
    String aliyunCaptchaPrefix,
    String aliyunCaptchaRegion,
    String aliyunCaptchaSceneId,
    bool backendModeEnabled,
    bool emailVerificationEnabled,
    bool forceEmailOnThirdPartySignup,
    bool invitationCodeEnabled,
    Sub2ApiOAuthCapabilities oauth,
    bool passkeyEnabled,
    bool passwordResetEnabled,
    bool paymentEnabled,
    bool promoCodeEnabled,
    bool registrationEmailDomainQuotaEnabled,
    bool registrationEnabled,
    String serverTimezone,
    String serverUtcOffset,
    bool tencentCaptchaEnabled,
    String tencentCaptchaAppId,
    String tencentCaptchaRegion,
    bool totpEnabled,
    bool turnstileEnabled,
    String turnstileSiteKey,
    String version,
  });

  @override
  $Sub2ApiOAuthCapabilitiesCopyWith<$Res> get oauth;
}

/// @nodoc
class __$Sub2ApiCapabilitiesCopyWithImpl<$Res>
    implements _$Sub2ApiCapabilitiesCopyWith<$Res> {
  __$Sub2ApiCapabilitiesCopyWithImpl(this._self, this._then);

  final _Sub2ApiCapabilities _self;
  final $Res Function(_Sub2ApiCapabilities) _then;

  /// Create a copy of Sub2ApiCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? aliyunCaptchaEnabled = null,
    Object? aliyunCaptchaPrefix = null,
    Object? aliyunCaptchaRegion = null,
    Object? aliyunCaptchaSceneId = null,
    Object? backendModeEnabled = null,
    Object? emailVerificationEnabled = null,
    Object? forceEmailOnThirdPartySignup = null,
    Object? invitationCodeEnabled = null,
    Object? oauth = null,
    Object? passkeyEnabled = null,
    Object? passwordResetEnabled = null,
    Object? paymentEnabled = null,
    Object? promoCodeEnabled = null,
    Object? registrationEmailDomainQuotaEnabled = null,
    Object? registrationEnabled = null,
    Object? serverTimezone = null,
    Object? serverUtcOffset = null,
    Object? tencentCaptchaEnabled = null,
    Object? tencentCaptchaAppId = null,
    Object? tencentCaptchaRegion = null,
    Object? totpEnabled = null,
    Object? turnstileEnabled = null,
    Object? turnstileSiteKey = null,
    Object? version = null,
  }) {
    return _then(
      _Sub2ApiCapabilities(
        aliyunCaptchaEnabled: null == aliyunCaptchaEnabled
            ? _self.aliyunCaptchaEnabled
            : aliyunCaptchaEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        aliyunCaptchaPrefix: null == aliyunCaptchaPrefix
            ? _self.aliyunCaptchaPrefix
            : aliyunCaptchaPrefix // ignore: cast_nullable_to_non_nullable
                  as String,
        aliyunCaptchaRegion: null == aliyunCaptchaRegion
            ? _self.aliyunCaptchaRegion
            : aliyunCaptchaRegion // ignore: cast_nullable_to_non_nullable
                  as String,
        aliyunCaptchaSceneId: null == aliyunCaptchaSceneId
            ? _self.aliyunCaptchaSceneId
            : aliyunCaptchaSceneId // ignore: cast_nullable_to_non_nullable
                  as String,
        backendModeEnabled: null == backendModeEnabled
            ? _self.backendModeEnabled
            : backendModeEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        emailVerificationEnabled: null == emailVerificationEnabled
            ? _self.emailVerificationEnabled
            : emailVerificationEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        forceEmailOnThirdPartySignup: null == forceEmailOnThirdPartySignup
            ? _self.forceEmailOnThirdPartySignup
            : forceEmailOnThirdPartySignup // ignore: cast_nullable_to_non_nullable
                  as bool,
        invitationCodeEnabled: null == invitationCodeEnabled
            ? _self.invitationCodeEnabled
            : invitationCodeEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        oauth: null == oauth
            ? _self.oauth
            : oauth // ignore: cast_nullable_to_non_nullable
                  as Sub2ApiOAuthCapabilities,
        passkeyEnabled: null == passkeyEnabled
            ? _self.passkeyEnabled
            : passkeyEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        passwordResetEnabled: null == passwordResetEnabled
            ? _self.passwordResetEnabled
            : passwordResetEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        paymentEnabled: null == paymentEnabled
            ? _self.paymentEnabled
            : paymentEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        promoCodeEnabled: null == promoCodeEnabled
            ? _self.promoCodeEnabled
            : promoCodeEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        registrationEmailDomainQuotaEnabled:
            null == registrationEmailDomainQuotaEnabled
            ? _self.registrationEmailDomainQuotaEnabled
            : registrationEmailDomainQuotaEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        registrationEnabled: null == registrationEnabled
            ? _self.registrationEnabled
            : registrationEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        serverTimezone: null == serverTimezone
            ? _self.serverTimezone
            : serverTimezone // ignore: cast_nullable_to_non_nullable
                  as String,
        serverUtcOffset: null == serverUtcOffset
            ? _self.serverUtcOffset
            : serverUtcOffset // ignore: cast_nullable_to_non_nullable
                  as String,
        tencentCaptchaEnabled: null == tencentCaptchaEnabled
            ? _self.tencentCaptchaEnabled
            : tencentCaptchaEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        tencentCaptchaAppId: null == tencentCaptchaAppId
            ? _self.tencentCaptchaAppId
            : tencentCaptchaAppId // ignore: cast_nullable_to_non_nullable
                  as String,
        tencentCaptchaRegion: null == tencentCaptchaRegion
            ? _self.tencentCaptchaRegion
            : tencentCaptchaRegion // ignore: cast_nullable_to_non_nullable
                  as String,
        totpEnabled: null == totpEnabled
            ? _self.totpEnabled
            : totpEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        turnstileEnabled: null == turnstileEnabled
            ? _self.turnstileEnabled
            : turnstileEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        turnstileSiteKey: null == turnstileSiteKey
            ? _self.turnstileSiteKey
            : turnstileSiteKey // ignore: cast_nullable_to_non_nullable
                  as String,
        version: null == version
            ? _self.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }

  /// Create a copy of Sub2ApiCapabilities
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Sub2ApiOAuthCapabilitiesCopyWith<$Res> get oauth {
    return $Sub2ApiOAuthCapabilitiesCopyWith<$Res>(_self.oauth, (value) {
      return _then(_self.copyWith(oauth: value));
    });
  }
}
