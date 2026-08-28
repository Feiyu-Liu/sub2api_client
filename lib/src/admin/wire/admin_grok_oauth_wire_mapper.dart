import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../sub2api_admin_grok_oauth_models.dart';
import 'admin_account_wire_mapper.dart';

Sub2ApiAdminGrokOAuthCapabilities mapAdminGrokCapabilities(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminGrokOAuthCapabilities(
        passwordAuthEnabled: _bool(source['password_auth_enabled']),
      );
    });

Sub2ApiAdminGrokAuthUrlResult mapAdminGrokAuthUrl(Object? data) => _guard(() {
  final source = _object(data);
  final authUrl = _required(source['auth_url']);
  final uri = Uri.parse(authUrl);
  if (!uri.hasScheme || uri.host.isEmpty) throw const FormatException();
  return Sub2ApiAdminGrokAuthUrlResult(
    authorizationUrl: Sub2ApiGrokOAuthAuthorizationUrl(authUrl),
    sessionId: Sub2ApiGrokOAuthSessionId(_required(source['session_id'])),
    state: Sub2ApiGrokOAuthState(_required(source['state'])),
  );
});

Sub2ApiAdminGrokTokenInfo mapAdminGrokTokenInfo(Object? data) => _guard(() {
  final source = _object(data);
  final expiresAt = _positive(source['expires_at']);
  return Sub2ApiAdminGrokTokenInfo(
    accessToken: Sub2ApiAccessToken(_required(source['access_token'])),
    refreshToken: _secret(source['refresh_token'], Sub2ApiRefreshToken.new),
    idToken: _secret(source['id_token'], Sub2ApiGrokIdToken.new),
    tokenType: _text(source['token_type']),
    expiresIn: _nonNegative(source['expires_in']),
    expiresAt: DateTime.fromMillisecondsSinceEpoch(
      expiresAt * 1000,
      isUtc: true,
    ),
    clientId: _text(source['client_id']),
    scope: _text(source['scope']),
    email: _text(source['email']),
    subject: _text(source['sub']),
    teamId: _text(source['team_id']),
    subscriptionTier: _text(source['subscription_tier']),
    entitlementStatus: _text(source['entitlement_status']),
  );
});

Sub2ApiAdminGrokSsoImportResult mapAdminGrokSsoImport(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminGrokSsoImportResult(
        created: _list(source['created']).map(_object).map(_ssoItem).toList(),
        failed: _list(source['failed']).map(_object).map(_ssoItem).toList(),
      );
    });

Sub2ApiAdminGrokReconcileResult mapAdminGrokReconcile(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminGrokReconcileResult(
        dryRun: _bool(source['dry_run']),
        scanned: _nonNegative(source['scanned']),
        actionable: _nonNegative(source['actionable']),
        wouldBlock: _nonNegative(source['would_block']),
        wouldRefresh: _nonNegative(source['would_refresh']),
        blocked: _nonNegative(source['blocked']),
        refreshed: _nonNegative(source['refreshed']),
        skipped: _nonNegative(source['skipped']),
        failed: _nonNegative(source['failed']),
        partial: _nonNegative(source['partial']),
        items: _list(source['items']).map(_object).map((item) {
          return Sub2ApiAdminGrokReconcileItem(
            accountId: _positive(item['account_id']),
            reason: _required(item['reason']),
            action: _required(item['action']),
            outcome: _required(item['outcome']),
          );
        }).toList(),
        nextAfterId: _nonNegative(source['next_after_id']),
        hasMore: _bool(source['has_more']),
      );
    });

Sub2ApiAdminGrokQuotaResult mapAdminGrokQuota(Object? data) => _guard(() {
  final source = _object(data);
  return Sub2ApiAdminGrokQuotaResult(
    source: _required(source['source']),
    model: _text(source['model']),
    billing: source['billing'] == null
        ? null
        : _billing(_object(source['billing'])),
    snapshot: source['snapshot'] == null
        ? null
        : _snapshot(_object(source['snapshot'])),
    localUsage24h: _usage(source['local_usage_24h']),
    localUsage7d: _usage(source['local_usage_7d']),
    localUsageMonthly: _usage(source['local_usage_monthly']),
    statusCode: _optionalNonNegative(source['status_code']),
    headersObserved: _bool(source['headers_observed']),
    resetSupported: _bool(source['reset_supported']),
    fetchedAt: _unixRequired(source['fetched_at']),
    persisted: _bool(source['persisted']),
    probeError: _text(source['probe_error']),
  );
});

Sub2ApiAdminGrokQuotaResetResult mapAdminGrokQuotaReset(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminGrokQuotaResetResult(
        supported: _bool(source['supported']),
        code: _required(source['code']),
        message: _required(source['message']),
      );
    });

Sub2ApiAdminGrokRuntimeSanity mapAdminGrokRuntimeSanity(Object? data) => _guard(
  () {
    final source = _object(data);
    return Sub2ApiAdminGrokRuntimeSanity(
      baseUrl: _runtimeCheck(_object(source['base_url'])),
      oauthAuthorizeUrl: _runtimeCheck(_object(source['oauth_authorize_url'])),
      oauthTokenUrl: _runtimeCheck(_object(source['oauth_token_url'])),
      oauthRedirectUri: _runtimeCheck(_object(source['oauth_redirect_uri'])),
      unsafeUrlOverrides: _bool(source['unsafe_url_overrides']),
      unsafeHighConcurrency: _bool(source['unsafe_high_concurrency']),
      publicGatewayScope: _required(source['public_gateway_scope']),
      proxyPolicy: _required(source['proxy_policy']),
    );
  },
);

Sub2ApiAdminGrokSsoImportItem _ssoItem(Map<String, Object?> source) =>
    Sub2ApiAdminGrokSsoImportItem(
      index: _positive(source['index']),
      name: _text(source['name']),
      email: _text(source['email']),
      error: _text(source['error']),
      account: source['account'] == null
          ? null
          : mapAdminAccount(source['account']),
    );

Sub2ApiAdminGrokUsageWindow? _usage(Object? value) {
  if (value == null) return null;
  final source = _object(value);
  return Sub2ApiAdminGrokUsageWindow(
    requests: _nonNegative(source['requests']),
    tokens: _nonNegative(source['tokens']),
    cost: Sub2ApiDecimal.fromJson(source['cost']),
    standardCost: Sub2ApiDecimal.fromJson(source['standard_cost']),
    userCost: Sub2ApiDecimal.fromJson(source['user_cost']),
  );
}

Sub2ApiAdminGrokQuotaSnapshot _snapshot(Map<String, Object?> source) =>
    Sub2ApiAdminGrokQuotaSnapshot(
      requests: _quotaWindow(source['requests']),
      tokens: _quotaWindow(source['tokens']),
      retryAfterSeconds: _nullableNonNegative(source['retry_after_seconds']),
      subscriptionTier: _text(source['subscription_tier']),
      entitlementStatus: _text(source['entitlement_status']),
      statusCode: _optionalNonNegative(source['status_code']),
      headers: _stringMap(source['headers']),
      headersObserved: _bool(source['headers_observed']),
      observationSource: _text(source['observation_source']),
      lastProbeAt: _optionalDate(source['last_probe_at']),
      lastHeadersSeenAt: _optionalDate(source['last_headers_seen_at']),
      updatedAt: _date(source['updated_at']),
      model: _text(source['model']),
      planFrom45Responses: _text(source['plan_from_45_responses']),
      planFrom45ResponsesAt: _optionalDate(source['plan_from_45_responses_at']),
    );

Sub2ApiAdminGrokQuotaWindow? _quotaWindow(Object? value) {
  if (value == null) return null;
  final source = _object(value);
  final resetUnix = _nullablePositive(source['reset_unix']);
  return Sub2ApiAdminGrokQuotaWindow(
    limit: _nullableNonNegative(source['limit']),
    remaining: _nullableNonNegative(source['remaining']),
    resetAt: resetUnix == null
        ? _optionalDate(source['reset_at'])
        : DateTime.fromMillisecondsSinceEpoch(resetUnix * 1000, isUtc: true),
  );
}

Sub2ApiAdminGrokBillingSummary _billing(Map<String, Object?> source) =>
    Sub2ApiAdminGrokBillingSummary(
      periodType: _text(source['period_type']),
      usagePercent: _decimal(source['usage_percent']),
      periodStart: _text(source['period_start']),
      periodEnd: _text(source['period_end']),
      productUsage: _optionalList(source['product_usage'])
          .map(_object)
          .map(
            (item) => Sub2ApiAdminGrokBillingProduct(
              product: _required(item['product']),
              usagePercent: _decimal(item['usage_percent']),
            ),
          )
          .toList(),
      monthlyLimitCents: _decimal(source['monthly_limit_cents']),
      usedCents: _decimal(source['used_cents']),
      includedUsedCents: _decimal(source['included_used_cents']),
      billingPeriodStart: _text(source['billing_period_start']),
      billingPeriodEnd: _text(source['billing_period_end']),
      usedPercent: _decimal(source['used_percent']),
      prepaidBalance: _decimal(source['prepaid_balance']),
      monthlyLimit: _decimal(source['monthly_limit']),
      monthlyUsed: _decimal(source['monthly_used']),
      onDemandCap: _decimal(source['on_demand_cap']),
      onDemandUsed: _decimal(source['on_demand_used']),
      topUpMethod: _text(source['top_up_method']),
      isUnifiedBillingUser: _optionalBool(source['is_unified_billing_user']),
      plan: _text(source['plan']),
      statusCode: _optionalNonNegative(source['status_code']),
      weeklyStatusCode: _optionalNonNegative(source['weekly_status_code']),
      monthlyStatusCode: _optionalNonNegative(source['monthly_status_code']),
      source: _text(source['source']),
      fetchedAt: _optionalDate(source['fetched_at']),
      updatedAt: _optionalDate(source['updated_at']),
      weeklyUpdatedAt: _optionalDate(source['weekly_updated_at']),
      monthlyUpdatedAt: _optionalDate(source['monthly_updated_at']),
      partial: _optionalBool(source['partial']),
      failedWindows: _optionalList(
        source['failed_windows'],
      ).map(_required).toList(),
    );

Sub2ApiAdminGrokRuntimeCheck _runtimeCheck(Map<String, Object?> source) =>
    Sub2ApiAdminGrokRuntimeCheck(
      value: _text(source['value']),
      valid: _bool(source['valid']),
      error: _text(source['error']),
      isDefault: _optionalBool(source['is_default']),
    );

T? _secret<T>(Object? value, T Function(String) create) {
  final text = _text(value);
  return text.isEmpty ? null : create(text);
}

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

List<Object?> _list(Object? value) {
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

List<Object?> _optionalList(Object? value) =>
    value == null ? const <Object?>[] : _list(value);

String _text(Object? value) {
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

String _required(Object? value) {
  final text = _text(value);
  if (text.trim().isEmpty) throw const FormatException();
  return text;
}

bool _bool(Object? value) {
  if (value is! bool) throw const FormatException();
  return value;
}

bool _optionalBool(Object? value) => value == null ? false : _bool(value);

int _integer(Object? value) {
  if (value is! int) throw const FormatException();
  return value;
}

int _positive(Object? value) {
  final number = _integer(value);
  if (number <= 0) throw const FormatException();
  return number;
}

int _nonNegative(Object? value) {
  final number = _integer(value);
  if (number < 0) throw const FormatException();
  return number;
}

int _optionalNonNegative(Object? value) =>
    value == null ? 0 : _nonNegative(value);
int? _nullableNonNegative(Object? value) =>
    value == null ? null : _nonNegative(value);
int? _nullablePositive(Object? value) =>
    value == null ? null : _positive(value);
Sub2ApiDecimal? _decimal(Object? value) =>
    value == null ? null : Sub2ApiDecimal.fromJson(value);
Map<String, String> _stringMap(Object? value) {
  if (value == null) return <String, String>{};
  return _object(value).map((key, item) {
    if (item is! String) throw const FormatException();
    return MapEntry(key, item);
  });
}

DateTime _date(Object? value) => DateTime.parse(_required(value)).toUtc();
DateTime? _optionalDate(Object? value) {
  final text = _text(value);
  return text.isEmpty ? null : DateTime.parse(text).toUtc();
}

DateTime _unixRequired(Object? value) =>
    DateTime.fromMillisecondsSinceEpoch(_positive(value) * 1000, isUtc: true);

T _guard<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_grok_oauth_response',
  retryable: false,
);
