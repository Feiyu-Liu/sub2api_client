import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../sub2api_admin_account_models.dart';
import '../sub2api_admin_openai_models.dart';
import 'admin_account_wire_mapper.dart';

Sub2ApiAdminAccount mapAdminOpenAIAccount(Object? data) =>
    _guard(() => mapAdminAccount(data));

Sub2ApiAdminOpenAIAuthUrl mapAdminOpenAIAuthUrl(Object? data) => _guard(() {
  final source = _object(data);
  final url = Uri.parse(_requiredText(source['auth_url']));
  if (!url.hasAuthority || url.scheme != 'https') throw const FormatException();
  return Sub2ApiAdminOpenAIAuthUrl(
    authorizationUrl: url,
    sessionId: Sub2ApiAdminOAuthSessionId(_requiredText(source['session_id'])),
  );
});

Sub2ApiAdminOpenAITokenInfo mapAdminOpenAITokenInfo(Object? data) => _guard(() {
  final source = _object(data);
  final expiresIn = _nonNegativeInt(source['expires_in']);
  final expiresAt = _positiveInt(source['expires_at']);
  final idToken = _text(source['id_token']);
  final subscriptionExpiresAt = _text(source['subscription_expires_at']);
  return Sub2ApiAdminOpenAITokenInfo(
    accessToken: Sub2ApiAccessToken(_requiredText(source['access_token'])),
    refreshToken: Sub2ApiRefreshToken(_requiredText(source['refresh_token'])),
    idToken: idToken.isEmpty ? null : Sub2ApiOpenAIIdToken(idToken),
    expiresIn: Duration(seconds: expiresIn),
    expiresAt: DateTime.fromMillisecondsSinceEpoch(
      expiresAt * 1000,
      isUtc: true,
    ),
    clientId: _text(source['client_id']),
    authMode: _text(source['auth_mode']),
    email: _text(source['email']),
    chatGptAccountId: _text(source['chatgpt_account_id']),
    chatGptUserId: _text(source['chatgpt_user_id']),
    chatGptAccountFedRamp: _boolOrFalse(source['chatgpt_account_is_fedramp']),
    organizationId: _text(source['organization_id']),
    planType: _text(source['plan_type']),
    subscriptionExpiresAt: subscriptionExpiresAt.isEmpty
        ? null
        : DateTime.parse(subscriptionExpiresAt).toUtc(),
    privacyMode: _text(source['privacy_mode']),
  );
});

Sub2ApiAdminOpenAIQuotaUsage mapAdminOpenAIQuota(Object? data) =>
    _guard(() => _quota(_object(data)));

Sub2ApiAdminOpenAIQuotaResetResult mapAdminOpenAIQuotaReset(Object? data) =>
    _guard(() {
      final source = _object(data);
      final credit = source['credit'];
      return Sub2ApiAdminOpenAIQuotaResetResult(
        code: _requiredText(source['code']),
        credit: credit == null ? null : _credit(_object(credit)),
        windowsReset: _nonNegativeInt(source['windows_reset']),
        quota: source['quota'] == null
            ? null
            : _quota(_object(source['quota'])),
        account: source['account'] == null
            ? null
            : mapAdminAccount(source['account']),
        cacheRefreshed: _boolOrFalse(source['cache_refreshed']),
        accountStateRecovered: _boolOrFalse(source['account_state_recovered']),
        warningCode: _text(source['warning_code']),
      );
    });

Sub2ApiAdminOpenAIQuotaUsage _quota(Map<String, Object?> source) =>
    Sub2ApiAdminOpenAIQuotaUsage(
      userId: _text(source['user_id']),
      accountId: _text(source['account_id']),
      email: _text(source['email']),
      planType: _text(source['plan_type']),
      rateLimit: source['rate_limit'] == null
          ? null
          : _rateLimit(_object(source['rate_limit'])),
      additionalRateLimits: _optionalList(source['additional_rate_limits'])
          .map(_object)
          .map(
            (item) => Sub2ApiAdminOpenAIAdditionalRateLimit(
              limitName: _text(item['limit_name']),
              meteredFeature: _text(item['metered_feature']),
              rateLimit: item['rate_limit'] == null
                  ? null
                  : _rateLimit(_object(item['rate_limit'])),
            ),
          )
          .toList(),
      resetCredits: source['rate_limit_reset_credits'] == null
          ? null
          : _resetCredits(_object(source['rate_limit_reset_credits'])),
      fetchedAt: DateTime.fromMillisecondsSinceEpoch(
        _positiveInt(source['fetched_at']) * 1000,
        isUtc: true,
      ),
      cachePersisted: source.containsKey('cache_persisted')
          ? _bool(source['cache_persisted'])
          : null,
    );

Sub2ApiAdminOpenAIRateLimit _rateLimit(Map<String, Object?> source) =>
    Sub2ApiAdminOpenAIRateLimit(
      allowed: _bool(source['allowed']),
      limitReached: _bool(source['limit_reached']),
      primaryWindow: source['primary_window'] == null
          ? null
          : _window(_object(source['primary_window'])),
      secondaryWindow: source['secondary_window'] == null
          ? null
          : _window(_object(source['secondary_window'])),
    );

Sub2ApiAdminOpenAIRateLimitWindow _window(Map<String, Object?> source) =>
    Sub2ApiAdminOpenAIRateLimitWindow(
      usedPercent: Sub2ApiDecimal.fromJson(source['used_percent']),
      limitWindow: Duration(
        seconds: _nonNegativeInt(source['limit_window_seconds']),
      ),
      resetAfter: Duration(
        seconds: _nonNegativeInt(source['reset_after_seconds']),
      ),
      resetAt: DateTime.fromMillisecondsSinceEpoch(
        _positiveInt(source['reset_at']) * 1000,
        isUtc: true,
      ),
    );

Sub2ApiAdminOpenAIResetCredits _resetCredits(Map<String, Object?> source) =>
    Sub2ApiAdminOpenAIResetCredits(
      availableCount: _nonNegativeInt(source['available_count']),
      credits: _optionalList(source['credits']).map(_object).map((item) {
        final expiresAt = _text(item['expires_at']);
        return Sub2ApiAdminOpenAIResetCreditDetail(
          expiresAt: expiresAt.isEmpty
              ? null
              : DateTime.parse(expiresAt).toUtc(),
        );
      }).toList(),
    );

Sub2ApiAdminOpenAIConsumedResetCredit _credit(Map<String, Object?> source) =>
    Sub2ApiAdminOpenAIConsumedResetCredit(
      id: _text(source['id']),
      resetType: _text(source['reset_type']),
      status: _text(source['status']),
      grantedAt: _optionalDateText(source['granted_at']),
      expiresAt: _optionalDateText(source['expires_at']),
      redeemStartedAt: _optionalDateText(source['redeem_started_at']),
      redeemedAt: _optionalDateText(source['redeemed_at']),
    );

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

List<Object?> _optionalList(Object? value) {
  if (value == null) return const [];
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

String _text(Object? value) {
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

String _requiredText(Object? value) {
  final text = _text(value);
  if (text.trim().isEmpty) throw const FormatException();
  return text;
}

bool _bool(Object? value) {
  if (value is! bool) throw const FormatException();
  return value;
}

bool _boolOrFalse(Object? value) => value == null ? false : _bool(value);

int _positiveInt(Object? value) {
  if (value is! int || value <= 0) throw const FormatException();
  return value;
}

int _nonNegativeInt(Object? value) {
  if (value is! int || value < 0) throw const FormatException();
  return value;
}

DateTime? _optionalDateText(Object? value) {
  final text = _text(value);
  return text.isEmpty ? null : DateTime.parse(text).toUtc();
}

T _guard<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_openai_response',
  retryable: false,
);
