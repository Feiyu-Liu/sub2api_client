import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import 'sub2api_admin_account_models.dart';
import 'sub2api_admin_user_models.dart';

final class Sub2ApiAdminGrokOAuthCapabilities {
  const Sub2ApiAdminGrokOAuthCapabilities({required this.passwordAuthEnabled});
  final bool passwordAuthEnabled;
}

final class Sub2ApiAdminGrokGenerateAuthUrlRequest {
  const Sub2ApiAdminGrokGenerateAuthUrlRequest({
    this.proxyId,
    this.redirectUri,
  });
  final int? proxyId;
  final Uri? redirectUri;
}

final class Sub2ApiAdminGrokAuthUrlResult {
  const Sub2ApiAdminGrokAuthUrlResult({
    required this.authorizationUrl,
    required this.sessionId,
    required this.state,
  });
  final Sub2ApiGrokOAuthAuthorizationUrl authorizationUrl;
  final Sub2ApiGrokOAuthSessionId sessionId;
  final Sub2ApiGrokOAuthState state;
}

final class Sub2ApiAdminGrokExchangeCodeRequest {
  const Sub2ApiAdminGrokExchangeCodeRequest({
    required this.sessionId,
    required this.code,
    required this.state,
    this.redirectUri,
    this.proxyId,
  });
  final Sub2ApiGrokOAuthSessionId sessionId;
  final Sub2ApiOAuthAuthorizationCode code;
  final Sub2ApiGrokOAuthState state;
  final Uri? redirectUri;
  final int? proxyId;
}

final class Sub2ApiAdminGrokRefreshTokenRequest {
  const Sub2ApiAdminGrokRefreshTokenRequest({
    required this.refreshToken,
    this.clientId = '',
    this.proxyId,
  });
  final Sub2ApiRefreshToken refreshToken;
  final String clientId;
  final int? proxyId;
}

final class Sub2ApiAdminGrokSsoTokenRequest {
  const Sub2ApiAdminGrokSsoTokenRequest({required this.ssoToken, this.proxyId});
  final Sub2ApiGrokSsoToken ssoToken;
  final int? proxyId;
}

final class Sub2ApiAdminGrokPasswordRequest {
  const Sub2ApiAdminGrokPasswordRequest({
    required this.email,
    required this.password,
    this.proxyId,
  });
  final String email;
  final Sub2ApiPassword password;
  final int? proxyId;
}

final class Sub2ApiAdminGrokTokenInfo {
  const Sub2ApiAdminGrokTokenInfo({
    required this.accessToken,
    required this.expiresIn,
    required this.expiresAt,
    required this.tokenType,
    required this.clientId,
    required this.scope,
    required this.email,
    required this.subject,
    required this.teamId,
    required this.subscriptionTier,
    required this.entitlementStatus,
    this.refreshToken,
    this.idToken,
  });
  final Sub2ApiAccessToken accessToken;
  final Sub2ApiRefreshToken? refreshToken;
  final Sub2ApiGrokIdToken? idToken;
  final String tokenType;
  final int expiresIn;
  final DateTime expiresAt;
  final String clientId;
  final String scope;
  final String email;
  final String subject;
  final String teamId;
  final String subscriptionTier;
  final String entitlementStatus;
}

final class Sub2ApiAdminGrokCreateAccountFromOAuthRequest {
  Sub2ApiAdminGrokCreateAccountFromOAuthRequest({
    required this.sessionId,
    required this.code,
    required this.state,
    this.redirectUri,
    this.proxyId,
    this.name = '',
    this.concurrency = 0,
    this.priority = 0,
    List<int> groupIds = const <int>[],
  }) : groupIds = List.unmodifiable(groupIds);
  final Sub2ApiGrokOAuthSessionId sessionId;
  final Sub2ApiOAuthAuthorizationCode code;
  final Sub2ApiGrokOAuthState state;
  final Uri? redirectUri;
  final int? proxyId;
  final String name;
  final int concurrency;
  final int priority;
  final List<int> groupIds;
}

final class Sub2ApiAdminGrokImportCredentials {
  const Sub2ApiAdminGrokImportCredentials({
    this.baseUrl,
    this.modelMapping = const Sub2ApiAdminJsonObject({}),
    this.headerOverride = const Sub2ApiAdminJsonObject({}),
    this.headerOverrides = const Sub2ApiAdminJsonObject({}),
    this.headerOverrideEnabled,
    this.customHeaders = const Sub2ApiAdminJsonObject({}),
  });
  final Uri? baseUrl;
  final Sub2ApiAdminJsonObject modelMapping;
  final Sub2ApiAdminJsonObject headerOverride;
  final Sub2ApiAdminJsonObject headerOverrides;
  final bool? headerOverrideEnabled;
  final Sub2ApiAdminJsonObject customHeaders;
}

final class Sub2ApiAdminGrokSsoImportRequest {
  Sub2ApiAdminGrokSsoImportRequest({
    required List<Sub2ApiGrokSsoToken> ssoTokens,
    this.name = '',
    this.notes,
    this.proxyId,
    List<int> groupIds = const <int>[],
    this.credentials = const Sub2ApiAdminGrokImportCredentials(),
    this.extra = const Sub2ApiAdminJsonObject({}),
    this.concurrency = 0,
    this.loadFactor,
    this.priority = 0,
    this.rateMultiplier,
    this.expiresAt,
    this.autoPauseOnExpired,
  }) : ssoTokens = List.unmodifiable(ssoTokens),
       groupIds = List.unmodifiable(groupIds);
  final List<Sub2ApiGrokSsoToken> ssoTokens;
  final String name;
  final String? notes;
  final int? proxyId;
  final List<int> groupIds;
  final Sub2ApiAdminGrokImportCredentials credentials;
  final Sub2ApiAdminJsonObject extra;
  final int concurrency;
  final int? loadFactor;
  final int priority;
  final Sub2ApiDecimal? rateMultiplier;
  final DateTime? expiresAt;
  final bool? autoPauseOnExpired;
}

final class Sub2ApiAdminGrokSsoImportItem {
  const Sub2ApiAdminGrokSsoImportItem({
    required this.index,
    required this.name,
    required this.email,
    required this.error,
    this.account,
  });
  final int index;
  final String name;
  final String email;
  final String error;
  final Sub2ApiAdminAccount? account;
}

final class Sub2ApiAdminGrokSsoImportResult {
  Sub2ApiAdminGrokSsoImportResult({
    required List<Sub2ApiAdminGrokSsoImportItem> created,
    required List<Sub2ApiAdminGrokSsoImportItem> failed,
  }) : created = List.unmodifiable(created),
       failed = List.unmodifiable(failed);
  final List<Sub2ApiAdminGrokSsoImportItem> created;
  final List<Sub2ApiAdminGrokSsoImportItem> failed;
}

final class Sub2ApiAdminGrokReconcileRequest {
  const Sub2ApiAdminGrokReconcileRequest({
    this.apply = false,
    this.afterId = 0,
    this.limit = 50,
    this.refreshWindow = const Duration(minutes: 5),
  });
  final bool apply;
  final int afterId;
  final int limit;
  final Duration refreshWindow;
}

final class Sub2ApiAdminGrokReconcileItem {
  const Sub2ApiAdminGrokReconcileItem({
    required this.accountId,
    required this.reason,
    required this.action,
    required this.outcome,
  });
  final int accountId;
  final String reason;
  final String action;
  final String outcome;
}

final class Sub2ApiAdminGrokReconcileResult {
  Sub2ApiAdminGrokReconcileResult({
    required this.dryRun,
    required this.scanned,
    required this.actionable,
    required this.wouldBlock,
    required this.wouldRefresh,
    required this.blocked,
    required this.refreshed,
    required this.skipped,
    required this.failed,
    required this.partial,
    required List<Sub2ApiAdminGrokReconcileItem> items,
    required this.nextAfterId,
    required this.hasMore,
  }) : items = List.unmodifiable(items);
  final bool dryRun;
  final int scanned;
  final int actionable;
  final int wouldBlock;
  final int wouldRefresh;
  final int blocked;
  final int refreshed;
  final int skipped;
  final int failed;
  final int partial;
  final List<Sub2ApiAdminGrokReconcileItem> items;
  final int nextAfterId;
  final bool hasMore;
}

final class Sub2ApiAdminGrokUsageWindow {
  const Sub2ApiAdminGrokUsageWindow({
    required this.requests,
    required this.tokens,
    required this.cost,
    required this.standardCost,
    required this.userCost,
  });
  final int requests;
  final int tokens;
  final Sub2ApiDecimal cost;
  final Sub2ApiDecimal standardCost;
  final Sub2ApiDecimal userCost;
}

final class Sub2ApiAdminGrokQuotaWindow {
  const Sub2ApiAdminGrokQuotaWindow({this.limit, this.remaining, this.resetAt});
  final int? limit;
  final int? remaining;
  final DateTime? resetAt;
}

final class Sub2ApiAdminGrokQuotaSnapshot {
  Sub2ApiAdminGrokQuotaSnapshot({
    this.requests,
    this.tokens,
    this.retryAfterSeconds,
    required this.subscriptionTier,
    required this.entitlementStatus,
    required this.statusCode,
    required Map<String, String> headers,
    required this.headersObserved,
    required this.observationSource,
    this.lastProbeAt,
    this.lastHeadersSeenAt,
    required this.updatedAt,
    required this.model,
    required this.planFrom45Responses,
    this.planFrom45ResponsesAt,
  }) : headers = Map.unmodifiable(headers);
  final Sub2ApiAdminGrokQuotaWindow? requests;
  final Sub2ApiAdminGrokQuotaWindow? tokens;
  final int? retryAfterSeconds;
  final String subscriptionTier;
  final String entitlementStatus;
  final int statusCode;
  final Map<String, String> headers;
  final bool headersObserved;
  final String observationSource;
  final DateTime? lastProbeAt;
  final DateTime? lastHeadersSeenAt;
  final DateTime updatedAt;
  final String model;
  final String planFrom45Responses;
  final DateTime? planFrom45ResponsesAt;
}

final class Sub2ApiAdminGrokBillingProduct {
  const Sub2ApiAdminGrokBillingProduct({
    required this.product,
    this.usagePercent,
  });
  final String product;
  final Sub2ApiDecimal? usagePercent;
}

final class Sub2ApiAdminGrokBillingSummary {
  Sub2ApiAdminGrokBillingSummary({
    required this.periodType,
    this.usagePercent,
    required this.periodStart,
    required this.periodEnd,
    required List<Sub2ApiAdminGrokBillingProduct> productUsage,
    this.monthlyLimitCents,
    this.usedCents,
    this.includedUsedCents,
    required this.billingPeriodStart,
    required this.billingPeriodEnd,
    this.usedPercent,
    this.prepaidBalance,
    this.monthlyLimit,
    this.monthlyUsed,
    this.onDemandCap,
    this.onDemandUsed,
    required this.topUpMethod,
    required this.isUnifiedBillingUser,
    required this.plan,
    required this.statusCode,
    required this.weeklyStatusCode,
    required this.monthlyStatusCode,
    required this.source,
    this.fetchedAt,
    this.updatedAt,
    this.weeklyUpdatedAt,
    this.monthlyUpdatedAt,
    required this.partial,
    required List<String> failedWindows,
  }) : productUsage = List.unmodifiable(productUsage),
       failedWindows = List.unmodifiable(failedWindows);
  final String periodType;
  final Sub2ApiDecimal? usagePercent;
  final String periodStart;
  final String periodEnd;
  final List<Sub2ApiAdminGrokBillingProduct> productUsage;
  final Sub2ApiDecimal? monthlyLimitCents;
  final Sub2ApiDecimal? usedCents;
  final Sub2ApiDecimal? includedUsedCents;
  final String billingPeriodStart;
  final String billingPeriodEnd;
  final Sub2ApiDecimal? usedPercent;
  final Sub2ApiDecimal? prepaidBalance;
  final Sub2ApiDecimal? monthlyLimit;
  final Sub2ApiDecimal? monthlyUsed;
  final Sub2ApiDecimal? onDemandCap;
  final Sub2ApiDecimal? onDemandUsed;
  final String topUpMethod;
  final bool isUnifiedBillingUser;
  final String plan;
  final int statusCode;
  final int weeklyStatusCode;
  final int monthlyStatusCode;
  final String source;
  final DateTime? fetchedAt;
  final DateTime? updatedAt;
  final DateTime? weeklyUpdatedAt;
  final DateTime? monthlyUpdatedAt;
  final bool partial;
  final List<String> failedWindows;
}

final class Sub2ApiAdminGrokQuotaResult {
  const Sub2ApiAdminGrokQuotaResult({
    required this.source,
    required this.model,
    this.billing,
    this.snapshot,
    this.localUsage24h,
    this.localUsage7d,
    this.localUsageMonthly,
    required this.statusCode,
    required this.headersObserved,
    required this.resetSupported,
    required this.fetchedAt,
    required this.persisted,
    required this.probeError,
  });
  final String source;
  final String model;
  final Sub2ApiAdminGrokBillingSummary? billing;
  final Sub2ApiAdminGrokQuotaSnapshot? snapshot;
  final Sub2ApiAdminGrokUsageWindow? localUsage24h;
  final Sub2ApiAdminGrokUsageWindow? localUsage7d;
  final Sub2ApiAdminGrokUsageWindow? localUsageMonthly;
  final int statusCode;
  final bool headersObserved;
  final bool resetSupported;
  final DateTime fetchedAt;
  final bool persisted;
  final String probeError;
}

final class Sub2ApiAdminGrokQuotaResetResult {
  const Sub2ApiAdminGrokQuotaResetResult({
    required this.supported,
    required this.code,
    required this.message,
  });
  final bool supported;
  final String code;
  final String message;
}

final class Sub2ApiAdminGrokRuntimeCheck {
  const Sub2ApiAdminGrokRuntimeCheck({
    required this.value,
    required this.valid,
    required this.error,
    required this.isDefault,
  });
  final String value;
  final bool valid;
  final String error;
  final bool isDefault;
}

final class Sub2ApiAdminGrokRuntimeSanity {
  const Sub2ApiAdminGrokRuntimeSanity({
    required this.baseUrl,
    required this.oauthAuthorizeUrl,
    required this.oauthTokenUrl,
    required this.oauthRedirectUri,
    required this.unsafeUrlOverrides,
    required this.unsafeHighConcurrency,
    required this.publicGatewayScope,
    required this.proxyPolicy,
  });
  final Sub2ApiAdminGrokRuntimeCheck baseUrl;
  final Sub2ApiAdminGrokRuntimeCheck oauthAuthorizeUrl;
  final Sub2ApiAdminGrokRuntimeCheck oauthTokenUrl;
  final Sub2ApiAdminGrokRuntimeCheck oauthRedirectUri;
  final bool unsafeUrlOverrides;
  final bool unsafeHighConcurrency;
  final String publicGatewayScope;
  final String proxyPolicy;
}
