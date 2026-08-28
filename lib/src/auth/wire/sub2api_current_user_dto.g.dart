// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub2api_current_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sub2ApiNotifyEmailEntryDto _$Sub2ApiNotifyEmailEntryDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('Sub2ApiNotifyEmailEntryDto', json, ($checkedConvert) {
  final val = Sub2ApiNotifyEmailEntryDto(
    disabled: $checkedConvert('disabled', (v) => v as bool),
    email: $checkedConvert('email', (v) => v as String),
    verified: $checkedConvert('verified', (v) => v as bool),
  );
  return val;
});

Sub2ApiProfileSourceContextDto _$Sub2ApiProfileSourceContextDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('Sub2ApiProfileSourceContextDto', json, ($checkedConvert) {
  final val = Sub2ApiProfileSourceContextDto(
    provider: $checkedConvert('provider', (v) => v as String?),
    source: $checkedConvert('source', (v) => v as String?),
  );
  return val;
});

Sub2ApiIdentityBindingDto _$Sub2ApiIdentityBindingDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'Sub2ApiIdentityBindingDto',
  json,
  ($checkedConvert) {
    final val = Sub2ApiIdentityBindingDto(
      bound: $checkedConvert('bound', (v) => v as bool),
      boundCount: $checkedConvert('bound_count', (v) => (v as num).toInt()),
      canBind: $checkedConvert('can_bind', (v) => v as bool),
      canUnbind: $checkedConvert('can_unbind', (v) => v as bool),
      provider: $checkedConvert('provider', (v) => v as String),
      bindStartPath: $checkedConvert('bind_start_path', (v) => v as String?),
      displayName: $checkedConvert('display_name', (v) => v as String?),
      note: $checkedConvert('note', (v) => v as String?),
      noteKey: $checkedConvert('note_key', (v) => v as String?),
      providerKey: $checkedConvert('provider_key', (v) => v as String?),
      subjectHint: $checkedConvert('subject_hint', (v) => v as String?),
      verifiedAt: $checkedConvert(
        'verified_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'boundCount': 'bound_count',
    'canBind': 'can_bind',
    'canUnbind': 'can_unbind',
    'bindStartPath': 'bind_start_path',
    'displayName': 'display_name',
    'noteKey': 'note_key',
    'providerKey': 'provider_key',
    'subjectHint': 'subject_hint',
    'verifiedAt': 'verified_at',
  },
);

Sub2ApiUserIdentitySetDto _$Sub2ApiUserIdentitySetDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'Sub2ApiUserIdentitySetDto',
  json,
  ($checkedConvert) {
    final val = Sub2ApiUserIdentitySetDto(
      dingTalk: $checkedConvert(
        'dingtalk',
        (v) => Sub2ApiIdentityBindingDto.fromJson(v as Map<String, dynamic>),
      ),
      email: $checkedConvert(
        'email',
        (v) => Sub2ApiIdentityBindingDto.fromJson(v as Map<String, dynamic>),
      ),
      linuxDo: $checkedConvert(
        'linuxdo',
        (v) => Sub2ApiIdentityBindingDto.fromJson(v as Map<String, dynamic>),
      ),
      oidc: $checkedConvert(
        'oidc',
        (v) => Sub2ApiIdentityBindingDto.fromJson(v as Map<String, dynamic>),
      ),
      weChat: $checkedConvert(
        'wechat',
        (v) => Sub2ApiIdentityBindingDto.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'dingTalk': 'dingtalk',
    'linuxDo': 'linuxdo',
    'weChat': 'wechat',
  },
);

Sub2ApiCurrentUserDto _$Sub2ApiCurrentUserDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'Sub2ApiCurrentUserDto',
  json,
  ($checkedConvert) {
    final val = Sub2ApiCurrentUserDto(
      allowedGroups: $checkedConvert(
        'allowed_groups',
        (v) =>
            (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
            [],
      ),
      authBindings: $checkedConvert(
        'auth_bindings',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) => MapEntry(
            k,
            Sub2ApiIdentityBindingDto.fromJson(e as Map<String, dynamic>),
          ),
        ),
      ),
      balance: $checkedConvert('balance', (v) => v as num),
      balanceNotifyEnabled: $checkedConvert(
        'balance_notify_enabled',
        (v) => v as bool,
      ),
      balanceNotifyExtraEmails: $checkedConvert(
        'balance_notify_extra_emails',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => Sub2ApiNotifyEmailEntryDto.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      balanceNotifyThreshold: $checkedConvert(
        'balance_notify_threshold',
        (v) => v as num?,
      ),
      balanceNotifyThresholdType: $checkedConvert(
        'balance_notify_threshold_type',
        (v) => v as String,
      ),
      concurrency: $checkedConvert('concurrency', (v) => (v as num).toInt()),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      dingTalkBound: $checkedConvert('dingtalk_bound', (v) => v as bool),
      email: $checkedConvert('email', (v) => v as String),
      emailBound: $checkedConvert('email_bound', (v) => v as bool),
      frozenBalance: $checkedConvert('frozen_balance', (v) => v as num),
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      identities: $checkedConvert(
        'identities',
        (v) => Sub2ApiUserIdentitySetDto.fromJson(v as Map<String, dynamic>),
      ),
      identityBindings: $checkedConvert(
        'identity_bindings',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) => MapEntry(
            k,
            Sub2ApiIdentityBindingDto.fromJson(e as Map<String, dynamic>),
          ),
        ),
      ),
      linuxDoBound: $checkedConvert('linuxdo_bound', (v) => v as bool),
      oidcBound: $checkedConvert('oidc_bound', (v) => v as bool),
      role: $checkedConvert('role', (v) => v as String),
      rpmLimit: $checkedConvert('rpm_limit', (v) => (v as num).toInt()),
      runMode: $checkedConvert('run_mode', (v) => v as String),
      status: $checkedConvert('status', (v) => v as String),
      totalRecharged: $checkedConvert('total_recharged', (v) => v as num),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      username: $checkedConvert('username', (v) => v as String),
      weChatBound: $checkedConvert('wechat_bound', (v) => v as bool),
      avatarSource: $checkedConvert(
        'avatar_source',
        (v) => v == null
            ? null
            : Sub2ApiProfileSourceContextDto.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      avatarUrl: $checkedConvert('avatar_url', (v) => v as String?),
      deletedAt: $checkedConvert(
        'deleted_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      displayNameSource: $checkedConvert(
        'display_name_source',
        (v) => v == null
            ? null
            : Sub2ApiProfileSourceContextDto.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      lastActiveAt: $checkedConvert(
        'last_active_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      nicknameSource: $checkedConvert(
        'nickname_source',
        (v) => v == null
            ? null
            : Sub2ApiProfileSourceContextDto.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      profileSources: $checkedConvert(
        'profile_sources',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
            k,
            Sub2ApiProfileSourceContextDto.fromJson(e as Map<String, dynamic>),
          ),
        ),
      ),
      usernameSource: $checkedConvert(
        'username_source',
        (v) => v == null
            ? null
            : Sub2ApiProfileSourceContextDto.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'allowedGroups': 'allowed_groups',
    'authBindings': 'auth_bindings',
    'balanceNotifyEnabled': 'balance_notify_enabled',
    'balanceNotifyExtraEmails': 'balance_notify_extra_emails',
    'balanceNotifyThreshold': 'balance_notify_threshold',
    'balanceNotifyThresholdType': 'balance_notify_threshold_type',
    'createdAt': 'created_at',
    'dingTalkBound': 'dingtalk_bound',
    'emailBound': 'email_bound',
    'frozenBalance': 'frozen_balance',
    'identityBindings': 'identity_bindings',
    'linuxDoBound': 'linuxdo_bound',
    'oidcBound': 'oidc_bound',
    'rpmLimit': 'rpm_limit',
    'runMode': 'run_mode',
    'totalRecharged': 'total_recharged',
    'updatedAt': 'updated_at',
    'weChatBound': 'wechat_bound',
    'avatarSource': 'avatar_source',
    'avatarUrl': 'avatar_url',
    'deletedAt': 'deleted_at',
    'displayNameSource': 'display_name_source',
    'lastActiveAt': 'last_active_at',
    'nicknameSource': 'nickname_source',
    'profileSources': 'profile_sources',
    'usernameSource': 'username_source',
  },
);

Sub2ApiRevokeAllSessionsDto _$Sub2ApiRevokeAllSessionsDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('Sub2ApiRevokeAllSessionsDto', json, ($checkedConvert) {
  final val = Sub2ApiRevokeAllSessionsDto(
    message: $checkedConvert('message', (v) => v as String),
  );
  return val;
});
