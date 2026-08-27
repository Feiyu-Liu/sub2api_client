import 'package:json_annotation/json_annotation.dart';

import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../models/sub2api_auth_models.dart';

part 'sub2api_current_user_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
final class Sub2ApiNotifyEmailEntryDto {
  const Sub2ApiNotifyEmailEntryDto({
    required this.disabled,
    required this.email,
    required this.verified,
  });

  factory Sub2ApiNotifyEmailEntryDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiNotifyEmailEntryDtoFromJson(json);

  final bool disabled;
  final String email;
  final bool verified;

  Sub2ApiNotifyEmailEntry toPublicModel() => Sub2ApiNotifyEmailEntry(
    disabled: disabled,
    email: email,
    verified: verified,
  );
}

@JsonSerializable(createToJson: false, checked: true)
final class Sub2ApiProfileSourceContextDto {
  const Sub2ApiProfileSourceContextDto({this.provider, this.source});

  factory Sub2ApiProfileSourceContextDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiProfileSourceContextDtoFromJson(json);

  final String? provider;
  final String? source;

  Sub2ApiProfileSourceContext toPublicModel() =>
      Sub2ApiProfileSourceContext(provider: provider, source: source);
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class Sub2ApiIdentityBindingDto {
  const Sub2ApiIdentityBindingDto({
    required this.bound,
    required this.boundCount,
    required this.canBind,
    required this.canUnbind,
    required this.provider,
    this.bindStartPath,
    this.displayName,
    this.note,
    this.noteKey,
    this.providerKey,
    this.subjectHint,
    this.verifiedAt,
  });

  factory Sub2ApiIdentityBindingDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiIdentityBindingDtoFromJson(json);

  final bool bound;
  final int boundCount;
  final bool canBind;
  final bool canUnbind;
  final String? bindStartPath;
  final String? displayName;
  final String? note;
  final String? noteKey;
  final String provider;
  final String? providerKey;
  final String? subjectHint;
  final DateTime? verifiedAt;

  Sub2ApiIdentityBinding toPublicModel() {
    if (provider.isEmpty || boundCount < 0) {
      throw invalidCurrentUserResponse;
    }
    return Sub2ApiIdentityBinding(
      bindStartPath: bindStartPath,
      bound: bound,
      boundCount: boundCount,
      canBind: canBind,
      canUnbind: canUnbind,
      displayName: displayName,
      note: note,
      noteKey: noteKey,
      provider: provider,
      providerKey: providerKey,
      subjectHint: subjectHint,
      verifiedAt: verifiedAt,
    );
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class Sub2ApiUserIdentitySetDto {
  const Sub2ApiUserIdentitySetDto({
    required this.dingTalk,
    required this.email,
    required this.linuxDo,
    required this.oidc,
    required this.weChat,
  });

  factory Sub2ApiUserIdentitySetDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiUserIdentitySetDtoFromJson(json);

  @JsonKey(name: 'dingtalk')
  final Sub2ApiIdentityBindingDto dingTalk;
  final Sub2ApiIdentityBindingDto email;
  @JsonKey(name: 'linuxdo')
  final Sub2ApiIdentityBindingDto linuxDo;
  final Sub2ApiIdentityBindingDto oidc;
  @JsonKey(name: 'wechat')
  final Sub2ApiIdentityBindingDto weChat;

  Sub2ApiUserIdentitySet toPublicModel() => Sub2ApiUserIdentitySet(
    dingTalk: dingTalk.toPublicModel(),
    email: email.toPublicModel(),
    linuxDo: linuxDo.toPublicModel(),
    oidc: oidc.toPublicModel(),
    weChat: weChat.toPublicModel(),
  );
}

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class Sub2ApiCurrentUserDto {
  const Sub2ApiCurrentUserDto({
    required this.allowedGroups,
    required this.authBindings,
    required this.balance,
    required this.balanceNotifyEnabled,
    required this.balanceNotifyExtraEmails,
    required this.balanceNotifyThreshold,
    required this.balanceNotifyThresholdType,
    required this.concurrency,
    required this.createdAt,
    required this.dingTalkBound,
    required this.email,
    required this.emailBound,
    required this.frozenBalance,
    required this.id,
    required this.identities,
    required this.identityBindings,
    required this.linuxDoBound,
    required this.oidcBound,
    required this.role,
    required this.rpmLimit,
    required this.runMode,
    required this.status,
    required this.totalRecharged,
    required this.updatedAt,
    required this.username,
    required this.weChatBound,
    this.avatarSource,
    this.avatarUrl,
    this.deletedAt,
    this.displayNameSource,
    this.lastActiveAt,
    this.nicknameSource,
    this.profileSources,
    this.usernameSource,
  });

  factory Sub2ApiCurrentUserDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiCurrentUserDtoFromJson(json);

  @JsonKey(defaultValue: <int>[])
  final List<int> allowedGroups;
  final Map<String, Sub2ApiIdentityBindingDto> authBindings;
  final num balance;
  final bool balanceNotifyEnabled;
  final List<Sub2ApiNotifyEmailEntryDto> balanceNotifyExtraEmails;
  final num? balanceNotifyThreshold;
  final String balanceNotifyThresholdType;
  final int concurrency;
  final DateTime createdAt;
  @JsonKey(name: 'dingtalk_bound')
  final bool dingTalkBound;
  final String email;
  final bool emailBound;
  final num frozenBalance;
  final int id;
  final Sub2ApiUserIdentitySetDto identities;
  final Map<String, Sub2ApiIdentityBindingDto> identityBindings;
  @JsonKey(name: 'linuxdo_bound')
  final bool linuxDoBound;
  final bool oidcBound;
  final String role;
  final int rpmLimit;
  final String runMode;
  final String status;
  final num totalRecharged;
  final DateTime updatedAt;
  final String username;
  @JsonKey(name: 'wechat_bound')
  final bool weChatBound;
  final Sub2ApiProfileSourceContextDto? avatarSource;
  final String? avatarUrl;
  final DateTime? deletedAt;
  final Sub2ApiProfileSourceContextDto? displayNameSource;
  final DateTime? lastActiveAt;
  final Sub2ApiProfileSourceContextDto? nicknameSource;
  final Map<String, Sub2ApiProfileSourceContextDto>? profileSources;
  final Sub2ApiProfileSourceContextDto? usernameSource;

  Sub2ApiCurrentUser toPublicModel() {
    if (id <= 0 ||
        email.isEmpty ||
        username.isEmpty ||
        role.isEmpty ||
        status.isEmpty ||
        balanceNotifyThresholdType.isEmpty ||
        concurrency < 0 ||
        rpmLimit < 0 ||
        runMode.isEmpty) {
      throw invalidCurrentUserResponse;
    }
    return Sub2ApiCurrentUser(
      account: Sub2ApiUserAccountSnapshot(
        allowedGroups: List<int>.unmodifiable(allowedGroups),
        authBindings: _identityMap(authBindings),
        avatarSource: avatarSource?.toPublicModel(),
        avatarUrl: avatarUrl,
        balance: Sub2ApiDecimal.fromJson(balance),
        balanceNotifyEnabled: balanceNotifyEnabled,
        balanceNotifyExtraEmails: List<Sub2ApiNotifyEmailEntry>.unmodifiable(
          balanceNotifyExtraEmails.map((entry) => entry.toPublicModel()),
        ),
        balanceNotifyThreshold: balanceNotifyThreshold == null
            ? null
            : Sub2ApiDecimal.fromJson(balanceNotifyThreshold),
        balanceNotifyThresholdType: balanceNotifyThresholdType,
        concurrency: concurrency,
        createdAt: createdAt,
        deletedAt: deletedAt,
        dingTalkBound: dingTalkBound,
        displayNameSource: displayNameSource?.toPublicModel(),
        email: email,
        emailBound: emailBound,
        frozenBalance: Sub2ApiDecimal.fromJson(frozenBalance),
        id: id,
        identities: identities.toPublicModel(),
        identityBindings: _identityMap(identityBindings),
        lastActiveAt: lastActiveAt,
        linuxDoBound: linuxDoBound,
        nicknameSource: nicknameSource?.toPublicModel(),
        oidcBound: oidcBound,
        profileSources: profileSources == null
            ? null
            : Map<String, Sub2ApiProfileSourceContext>.unmodifiable(
                profileSources!.map(
                  (key, value) => MapEntry(key, value.toPublicModel()),
                ),
              ),
        role: role,
        rpmLimit: rpmLimit,
        status: status,
        totalRecharged: Sub2ApiDecimal.fromJson(totalRecharged),
        updatedAt: updatedAt,
        username: username,
        usernameSource: usernameSource?.toPublicModel(),
        weChatBound: weChatBound,
      ),
      runMode: runMode,
    );
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class Sub2ApiRevokeAllSessionsDto {
  const Sub2ApiRevokeAllSessionsDto({required this.message});

  factory Sub2ApiRevokeAllSessionsDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiRevokeAllSessionsDtoFromJson(json);

  final String message;

  Sub2ApiRevokeAllSessionsResult toPublicModel() {
    if (message.isEmpty) {
      throw invalidRevokeAllSessionsResponse;
    }
    return Sub2ApiRevokeAllSessionsResult(message: message);
  }
}

Map<String, Sub2ApiIdentityBinding> _identityMap(
  Map<String, Sub2ApiIdentityBindingDto> wire,
) => Map<String, Sub2ApiIdentityBinding>.unmodifiable(
  wire.map((key, value) => MapEntry(key, value.toPublicModel())),
);

const invalidCurrentUserResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_current_user_response',
  retryable: false,
);

const invalidRevokeAllSessionsResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_revoke_all_sessions_response',
  retryable: false,
);
