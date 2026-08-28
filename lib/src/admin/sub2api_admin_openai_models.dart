import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import 'sub2api_admin_account_models.dart';
import 'sub2api_admin_user_models.dart';

final class Sub2ApiAdminOpenAIAuthUrlRequest {
  const Sub2ApiAdminOpenAIAuthUrlRequest({this.proxyId, this.redirectUri});
  final int? proxyId;
  final Uri? redirectUri;
}

final class Sub2ApiAdminOpenAIAuthUrl {
  const Sub2ApiAdminOpenAIAuthUrl({
    required this.authorizationUrl,
    required this.sessionId,
  });
  final Uri authorizationUrl;
  final Sub2ApiAdminOAuthSessionId sessionId;
}

final class Sub2ApiAdminOpenAIExchangeCodeRequest {
  const Sub2ApiAdminOpenAIExchangeCodeRequest({
    required this.sessionId,
    required this.code,
    required this.state,
    this.redirectUri,
    this.proxyId,
  });
  final Sub2ApiAdminOAuthSessionId sessionId;
  final Sub2ApiOAuthAuthorizationCode code;
  final Sub2ApiAdminOAuthState state;
  final Uri? redirectUri;
  final int? proxyId;
}

final class Sub2ApiAdminOpenAIRefreshTokenRequest {
  const Sub2ApiAdminOpenAIRefreshTokenRequest({
    required this.refreshToken,
    this.clientId,
    this.proxyId,
  });
  final Sub2ApiRefreshToken refreshToken;
  final String? clientId;
  final int? proxyId;
}

final class Sub2ApiAdminOpenAITokenInfo {
  const Sub2ApiAdminOpenAITokenInfo({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.expiresAt,
    required this.clientId,
    required this.authMode,
    required this.email,
    required this.chatGptAccountId,
    required this.chatGptUserId,
    required this.chatGptAccountFedRamp,
    required this.organizationId,
    required this.planType,
    required this.subscriptionExpiresAt,
    required this.privacyMode,
    this.idToken,
  });
  final Sub2ApiAccessToken accessToken;
  final Sub2ApiRefreshToken refreshToken;
  final Sub2ApiOpenAIIdToken? idToken;
  final Duration expiresIn;
  final DateTime expiresAt;
  final String clientId;
  final String authMode;
  final String email;
  final String chatGptAccountId;
  final String chatGptUserId;
  final bool chatGptAccountFedRamp;
  final String organizationId;
  final String planType;
  final DateTime? subscriptionExpiresAt;
  final String privacyMode;
}

final class Sub2ApiAdminCreateOpenAIFromOAuthRequest {
  Sub2ApiAdminCreateOpenAIFromOAuthRequest({
    required this.exchange,
    this.name = '',
    this.concurrency = 0,
    this.priority = 0,
    List<int> groupIds = const [],
  }) : groupIds = List.unmodifiable(groupIds);
  final Sub2ApiAdminOpenAIExchangeCodeRequest exchange;
  final String name;
  final int concurrency;
  final int priority;
  final List<int> groupIds;
}

final class Sub2ApiAdminCreateOpenAIFromCodexPatRequest {
  Sub2ApiAdminCreateOpenAIFromCodexPatRequest({
    required this.accessToken,
    this.name = '',
    this.notes,
    List<int> groupIds = const [],
    this.proxyId,
    this.concurrency,
    this.priority,
    this.rateMultiplier,
    this.loadFactor,
    this.expiresAt,
    this.autoPauseOnExpired,
    this.credentialExtras,
    this.extra,
    this.skipDefaultGroupBind,
    this.confirmMixedChannelRisk,
  }) : groupIds = List.unmodifiable(groupIds);
  final Sub2ApiOpenAICodexPersonalAccessToken accessToken;
  final String name;
  final String? notes;
  final List<int> groupIds;
  final int? proxyId;
  final int? concurrency;
  final int? priority;
  final Sub2ApiDecimal? rateMultiplier;
  final int? loadFactor;
  final DateTime? expiresAt;
  final bool? autoPauseOnExpired;
  final Sub2ApiAdminJsonObject? credentialExtras;
  final Sub2ApiAdminJsonObject? extra;
  final bool? skipDefaultGroupBind;
  final bool? confirmMixedChannelRisk;
}

final class Sub2ApiAdminOpenAIRateLimitWindow {
  const Sub2ApiAdminOpenAIRateLimitWindow({
    required this.usedPercent,
    required this.limitWindow,
    required this.resetAfter,
    required this.resetAt,
  });
  final Sub2ApiDecimal usedPercent;
  final Duration limitWindow;
  final Duration resetAfter;
  final DateTime resetAt;
}

final class Sub2ApiAdminOpenAIRateLimit {
  const Sub2ApiAdminOpenAIRateLimit({
    required this.allowed,
    required this.limitReached,
    this.primaryWindow,
    this.secondaryWindow,
  });
  final bool allowed;
  final bool limitReached;
  final Sub2ApiAdminOpenAIRateLimitWindow? primaryWindow;
  final Sub2ApiAdminOpenAIRateLimitWindow? secondaryWindow;
}

final class Sub2ApiAdminOpenAIAdditionalRateLimit {
  const Sub2ApiAdminOpenAIAdditionalRateLimit({
    required this.limitName,
    required this.meteredFeature,
    this.rateLimit,
  });
  final String limitName;
  final String meteredFeature;
  final Sub2ApiAdminOpenAIRateLimit? rateLimit;
}

final class Sub2ApiAdminOpenAIResetCreditDetail {
  const Sub2ApiAdminOpenAIResetCreditDetail({this.expiresAt});
  final DateTime? expiresAt;
}

final class Sub2ApiAdminOpenAIResetCredits {
  Sub2ApiAdminOpenAIResetCredits({
    required this.availableCount,
    required List<Sub2ApiAdminOpenAIResetCreditDetail> credits,
  }) : credits = List.unmodifiable(credits);
  final int availableCount;
  final List<Sub2ApiAdminOpenAIResetCreditDetail> credits;
}

final class Sub2ApiAdminOpenAIQuotaUsage {
  Sub2ApiAdminOpenAIQuotaUsage({
    required this.userId,
    required this.accountId,
    required this.email,
    required this.planType,
    required List<Sub2ApiAdminOpenAIAdditionalRateLimit> additionalRateLimits,
    required this.fetchedAt,
    this.rateLimit,
    this.resetCredits,
    this.cachePersisted,
  }) : additionalRateLimits = List.unmodifiable(additionalRateLimits);
  final String userId;
  final String accountId;
  final String email;
  final String planType;
  final Sub2ApiAdminOpenAIRateLimit? rateLimit;
  final List<Sub2ApiAdminOpenAIAdditionalRateLimit> additionalRateLimits;
  final Sub2ApiAdminOpenAIResetCredits? resetCredits;
  final DateTime fetchedAt;
  final bool? cachePersisted;
}

final class Sub2ApiAdminOpenAIConsumedResetCredit {
  const Sub2ApiAdminOpenAIConsumedResetCredit({
    required this.id,
    required this.resetType,
    required this.status,
    this.grantedAt,
    this.expiresAt,
    this.redeemStartedAt,
    this.redeemedAt,
  });
  final String id;
  final String resetType;
  final String status;
  final DateTime? grantedAt;
  final DateTime? expiresAt;
  final DateTime? redeemStartedAt;
  final DateTime? redeemedAt;
}

final class Sub2ApiAdminOpenAIQuotaResetResult {
  const Sub2ApiAdminOpenAIQuotaResetResult({
    required this.code,
    required this.windowsReset,
    required this.cacheRefreshed,
    required this.accountStateRecovered,
    required this.warningCode,
    this.credit,
    this.quota,
    this.account,
  });
  final String code;
  final Sub2ApiAdminOpenAIConsumedResetCredit? credit;
  final int windowsReset;
  final Sub2ApiAdminOpenAIQuotaUsage? quota;
  final Sub2ApiAdminAccount? account;
  final bool cacheRefreshed;
  final bool accountStateRecovered;
  final String warningCode;
}
