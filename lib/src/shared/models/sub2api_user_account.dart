import 'package:freezed_annotation/freezed_annotation.dart';

import 'sub2api_decimal.dart';

part 'sub2api_user_account.freezed.dart';

/// A notification-email destination attached to a user account.
@freezed
abstract class Sub2ApiNotifyEmailEntry with _$Sub2ApiNotifyEmailEntry {
  const factory Sub2ApiNotifyEmailEntry({
    required String email,
    required bool disabled,
    required bool verified,
  }) = _Sub2ApiNotifyEmailEntry;
}

/// Describes which identity provider supplied a profile field.
@freezed
abstract class Sub2ApiProfileSourceContext with _$Sub2ApiProfileSourceContext {
  const factory Sub2ApiProfileSourceContext({
    String? provider,
    String? source,
  }) = _Sub2ApiProfileSourceContext;
}

/// Current binding state for one authentication identity provider.
@freezed
abstract class Sub2ApiIdentityBinding with _$Sub2ApiIdentityBinding {
  const factory Sub2ApiIdentityBinding({
    required String provider,
    required bool bound,
    required int boundCount,
    required bool canBind,
    required bool canUnbind,
    String? displayName,
    String? subjectHint,
    String? providerKey,
    DateTime? verifiedAt,
    String? bindStartPath,
    String? noteKey,
    String? note,
  }) = _Sub2ApiIdentityBinding;
}

/// Fixed identity-provider set returned by Sub2API v0.1.183.
@freezed
abstract class Sub2ApiUserIdentitySet with _$Sub2ApiUserIdentitySet {
  const factory Sub2ApiUserIdentitySet({
    required Sub2ApiIdentityBinding email,
    required Sub2ApiIdentityBinding linuxDo,
    required Sub2ApiIdentityBinding oidc,
    required Sub2ApiIdentityBinding weChat,
    required Sub2ApiIdentityBinding dingTalk,
  }) = _Sub2ApiUserIdentitySet;
}

/// Complete account and identity snapshot shared by user-security operations.
@freezed
abstract class Sub2ApiUserAccountSnapshot with _$Sub2ApiUserAccountSnapshot {
  const factory Sub2ApiUserAccountSnapshot({
    required int id,
    required String email,
    required String username,
    required String role,
    required Sub2ApiDecimal balance,
    required Sub2ApiDecimal frozenBalance,
    required int concurrency,
    required String status,
    required List<int> allowedGroups,
    required bool balanceNotifyEnabled,
    required String balanceNotifyThresholdType,
    required Sub2ApiDecimal? balanceNotifyThreshold,
    required List<Sub2ApiNotifyEmailEntry> balanceNotifyExtraEmails,
    required Sub2ApiDecimal totalRecharged,
    required int rpmLimit,
    required DateTime createdAt,
    required DateTime updatedAt,
    required Sub2ApiUserIdentitySet identities,
    required Map<String, Sub2ApiIdentityBinding> authBindings,
    required Map<String, Sub2ApiIdentityBinding> identityBindings,
    required bool emailBound,
    required bool linuxDoBound,
    required bool oidcBound,
    required bool weChatBound,
    required bool dingTalkBound,
    DateTime? lastActiveAt,
    DateTime? deletedAt,
    String? avatarUrl,
    Sub2ApiProfileSourceContext? avatarSource,
    Sub2ApiProfileSourceContext? usernameSource,
    Sub2ApiProfileSourceContext? displayNameSource,
    Sub2ApiProfileSourceContext? nicknameSource,
    Map<String, Sub2ApiProfileSourceContext>? profileSources,
  }) = _Sub2ApiUserAccountSnapshot;
}
