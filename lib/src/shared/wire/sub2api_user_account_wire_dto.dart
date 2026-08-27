import 'package:json_annotation/json_annotation.dart';

import '../errors/sub2api_exception.dart';
import '../models/sub2api_decimal.dart';
import '../models/sub2api_user_account.dart';

part 'sub2api_user_account_wire_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
final class UserAccountNotifyEmailWireDto {
  const UserAccountNotifyEmailWireDto({
    required this.disabled,
    required this.email,
    required this.verified,
  });

  factory UserAccountNotifyEmailWireDto.fromJson(Map<String, Object?> json) =>
      _$UserAccountNotifyEmailWireDtoFromJson(json);

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
final class UserAccountProfileSourceWireDto {
  const UserAccountProfileSourceWireDto({this.provider, this.source});

  factory UserAccountProfileSourceWireDto.fromJson(Map<String, Object?> json) =>
      _$UserAccountProfileSourceWireDtoFromJson(json);

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
final class UserAccountIdentityBindingWireDto {
  const UserAccountIdentityBindingWireDto({
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

  factory UserAccountIdentityBindingWireDto.fromJson(
    Map<String, Object?> json,
  ) => _$UserAccountIdentityBindingWireDtoFromJson(json);

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
    if (provider.isEmpty || boundCount < 0) throw invalidUserAccountSnapshot;
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
final class UserAccountIdentitySetWireDto {
  const UserAccountIdentitySetWireDto({
    required this.dingTalk,
    required this.email,
    required this.linuxDo,
    required this.oidc,
    required this.weChat,
  });

  factory UserAccountIdentitySetWireDto.fromJson(Map<String, Object?> json) =>
      _$UserAccountIdentitySetWireDtoFromJson(json);

  @JsonKey(name: 'dingtalk')
  final UserAccountIdentityBindingWireDto dingTalk;
  final UserAccountIdentityBindingWireDto email;
  @JsonKey(name: 'linuxdo')
  final UserAccountIdentityBindingWireDto linuxDo;
  final UserAccountIdentityBindingWireDto oidc;
  @JsonKey(name: 'wechat')
  final UserAccountIdentityBindingWireDto weChat;

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
final class Sub2ApiUserAccountWireDto {
  const Sub2ApiUserAccountWireDto({
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

  factory Sub2ApiUserAccountWireDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiUserAccountWireDtoFromJson(json);

  @JsonKey(defaultValue: <int>[])
  final List<int> allowedGroups;
  final Map<String, UserAccountIdentityBindingWireDto> authBindings;
  final num balance;
  final bool balanceNotifyEnabled;
  final List<UserAccountNotifyEmailWireDto> balanceNotifyExtraEmails;
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
  final UserAccountIdentitySetWireDto identities;
  final Map<String, UserAccountIdentityBindingWireDto> identityBindings;
  @JsonKey(name: 'linuxdo_bound')
  final bool linuxDoBound;
  final bool oidcBound;
  final String role;
  final int rpmLimit;
  final String status;
  final num totalRecharged;
  final DateTime updatedAt;
  final String username;
  @JsonKey(name: 'wechat_bound')
  final bool weChatBound;
  final UserAccountProfileSourceWireDto? avatarSource;
  final String? avatarUrl;
  final DateTime? deletedAt;
  final UserAccountProfileSourceWireDto? displayNameSource;
  final DateTime? lastActiveAt;
  final UserAccountProfileSourceWireDto? nicknameSource;
  final Map<String, UserAccountProfileSourceWireDto>? profileSources;
  final UserAccountProfileSourceWireDto? usernameSource;

  Sub2ApiUserAccountSnapshot toPublicModel() {
    if (id <= 0 ||
        email.isEmpty ||
        username.isEmpty ||
        role.isEmpty ||
        status.isEmpty ||
        balanceNotifyThresholdType.isEmpty ||
        concurrency < 0 ||
        rpmLimit < 0) {
      throw invalidUserAccountSnapshot;
    }
    return Sub2ApiUserAccountSnapshot(
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
    );
  }
}

Map<String, Sub2ApiIdentityBinding> _identityMap(
  Map<String, UserAccountIdentityBindingWireDto> wire,
) => Map<String, Sub2ApiIdentityBinding>.unmodifiable(
  wire.map((key, value) => MapEntry(key, value.toPublicModel())),
);

const invalidUserAccountSnapshot = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_user_account_snapshot',
  retryable: false,
);
