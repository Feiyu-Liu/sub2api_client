import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_account_models.dart';
import '../sub2api_admin_proxy_models.dart';

Sub2ApiAdminProxyPage mapAdminProxyPage(Object? data) => _map(() {
  final source = _object(data);
  return Sub2ApiPage<Sub2ApiAdminProxy>(
    items: _list(source, 'items').map(_object).map(_proxy).toList(),
    total: _nonNegativeInteger(source, 'total'),
    page: _positiveInteger(source, 'page'),
    pageSize: _positiveInteger(source, 'page_size'),
    pages: _nonNegativeInteger(source, 'pages'),
  );
});

Sub2ApiAdminProxy mapAdminProxy(Object? data) =>
    _map(() => _proxy(_object(data)));

List<Sub2ApiAdminProxy> mapAdminProxies(Object? data) =>
    _map(() => _array(data).map(_object).map(_proxy).toList(growable: false));

List<Sub2ApiAdminProxyAccountSummary> mapAdminProxyAccounts(Object? data) =>
    _map(
      () => _array(data)
          .map(_object)
          .map(
            (source) => Sub2ApiAdminProxyAccountSummary(
              id: _positiveInteger(source, 'id'),
              name: _nonEmptyString(source, 'name'),
              platform: _platform(_nonEmptyString(source, 'platform')),
              type: _accountType(_nonEmptyString(source, 'type')),
              notes: _nullableString(source, 'notes'),
            ),
          )
          .toList(growable: false),
    );

Sub2ApiAdminProxyStats mapAdminProxyStats(Object? data) => _map(() {
  final source = _object(data);
  final totalAccounts = _nonNegativeInteger(source, 'total_accounts');
  final activeAccounts = _nonNegativeInteger(source, 'active_accounts');
  if (activeAccounts > totalAccounts) throw const FormatException();
  return Sub2ApiAdminProxyStats(
    totalAccounts: totalAccounts,
    activeAccounts: activeAccounts,
    totalRequests: _nonNegativeInteger(source, 'total_requests'),
    successRate: _nonNegativeDecimal(source, 'success_rate'),
    averageLatency: _nonNegativeDecimal(source, 'average_latency'),
  );
});

Sub2ApiAdminProxy _proxy(Map<String, Object?> source) {
  final password = _optionalString(source, 'password');
  final accountCount = _nullableNonNegativeInteger(source, 'account_count');
  final latencyMs = _nullableNonNegativeInteger(source, 'latency_ms');
  final qualityScore = _nullableNonNegativeInteger(source, 'quality_score');
  if (qualityScore != null && qualityScore > 100) throw const FormatException();
  return Sub2ApiAdminProxy(
    id: _positiveInteger(source, 'id'),
    name: _nonEmptyString(source, 'name'),
    protocol: switch (_nonEmptyString(source, 'protocol')) {
      'http' => Sub2ApiAdminProxyProtocol.http,
      'https' => Sub2ApiAdminProxyProtocol.https,
      'socks5' => Sub2ApiAdminProxyProtocol.socks5,
      'socks5h' => Sub2ApiAdminProxyProtocol.socks5h,
      _ => throw const FormatException(),
    },
    host: _nonEmptyString(source, 'host'),
    port: _port(source, 'port'),
    username: _optionalString(source, 'username'),
    password: password.isEmpty ? null : Sub2ApiAdminProxyPassword(password),
    status: switch (_nonEmptyString(source, 'status')) {
      'active' => Sub2ApiAdminProxyStatus.active,
      'inactive' => Sub2ApiAdminProxyStatus.inactive,
      'expired' => Sub2ApiAdminProxyStatus.expired,
      _ => throw const FormatException(),
    },
    expiresAt: _nullableDateTime(source, 'expires_at'),
    fallbackMode: switch (_nonEmptyString(source, 'fallback_mode')) {
      'none' => Sub2ApiAdminProxyFallbackMode.none,
      'proxy' => Sub2ApiAdminProxyFallbackMode.proxy,
      'direct' => Sub2ApiAdminProxyFallbackMode.direct,
      _ => throw const FormatException(),
    },
    backupProxyId: _nullablePositiveInteger(source, 'backup_proxy_id'),
    expiryWarnDays: _nonNegativeInteger(source, 'expiry_warn_days'),
    createdAt: _dateTime(source, 'created_at'),
    updatedAt: _dateTime(source, 'updated_at'),
    accountCount: accountCount,
    latencyMs: latencyMs,
    latencyStatus: switch (_optionalString(source, 'latency_status')) {
      '' => null,
      'success' => Sub2ApiAdminProxyLatencyStatus.success,
      'failed' => Sub2ApiAdminProxyLatencyStatus.failed,
      _ => throw const FormatException(),
    },
    latencyMessage: _optionalString(source, 'latency_message'),
    ipAddress: _optionalString(source, 'ip_address'),
    country: _optionalString(source, 'country'),
    countryCode: _optionalString(source, 'country_code'),
    region: _optionalString(source, 'region'),
    city: _optionalString(source, 'city'),
    qualityStatus: switch (_optionalString(source, 'quality_status')) {
      '' => null,
      'healthy' => Sub2ApiAdminProxyQualityStatus.healthy,
      'warn' => Sub2ApiAdminProxyQualityStatus.warn,
      'challenge' => Sub2ApiAdminProxyQualityStatus.challenge,
      'failed' => Sub2ApiAdminProxyQualityStatus.failed,
      _ => throw const FormatException(),
    },
    qualityScore: qualityScore,
    qualityGrade: _optionalString(source, 'quality_grade'),
    qualitySummary: _optionalString(source, 'quality_summary'),
    qualityCheckedAt: _nullableUnixDateTime(source, 'quality_checked'),
  );
}

Sub2ApiAdminAccountPlatform _platform(String value) => switch (value) {
  'anthropic' => Sub2ApiAdminAccountPlatform.anthropic,
  'openai' => Sub2ApiAdminAccountPlatform.openAi,
  'gemini' => Sub2ApiAdminAccountPlatform.gemini,
  'antigravity' => Sub2ApiAdminAccountPlatform.antigravity,
  'grok' => Sub2ApiAdminAccountPlatform.grok,
  'kimi' => Sub2ApiAdminAccountPlatform.kimi,
  'zhipu' => Sub2ApiAdminAccountPlatform.zhipu,
  'deepseek' => Sub2ApiAdminAccountPlatform.deepseek,
  _ => throw const FormatException(),
};

Sub2ApiAdminAccountType _accountType(String value) => switch (value) {
  'oauth' => Sub2ApiAdminAccountType.oauth,
  'setup-token' => Sub2ApiAdminAccountType.setupToken,
  'apikey' => Sub2ApiAdminAccountType.apiKey,
  'upstream' => Sub2ApiAdminAccountType.upstream,
  'bedrock' => Sub2ApiAdminAccountType.bedrock,
  'service_account' => Sub2ApiAdminAccountType.serviceAccount,
  _ => throw const FormatException(),
};

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) throw const FormatException();
    result[entry.key as String] = entry.value;
  }
  return result;
}

List<Object?> _array(Object? value) {
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

List<Object?> _list(Map<String, Object?> source, String key) {
  if (!source.containsKey(key)) throw const FormatException();
  return _array(source[key]);
}

String _string(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! String) throw const FormatException();
  return value;
}

String _nonEmptyString(Map<String, Object?> source, String key) {
  final value = _string(source, key).trim();
  if (value.isEmpty) throw const FormatException();
  return value;
}

String _optionalString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

String? _nullableString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! String) throw const FormatException();
  return value;
}

int _integer(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! int) throw const FormatException();
  return value;
}

int _positiveInteger(Map<String, Object?> source, String key) {
  final value = _integer(source, key);
  if (value <= 0) throw const FormatException();
  return value;
}

int _nonNegativeInteger(Map<String, Object?> source, String key) {
  final value = _integer(source, key);
  if (value < 0) throw const FormatException();
  return value;
}

int? _nullableNonNegativeInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! int || value < 0) throw const FormatException();
  return value;
}

int? _nullablePositiveInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! int || value <= 0) throw const FormatException();
  return value;
}

int _port(Map<String, Object?> source, String key) {
  final value = _positiveInteger(source, key);
  if (value > 65535) throw const FormatException();
  return value;
}

Sub2ApiDecimal _nonNegativeDecimal(Map<String, Object?> source, String key) {
  final value = Sub2ApiDecimal.fromJson(source[key]);
  if (value.compareTo(Sub2ApiDecimal.zero()) < 0) throw const FormatException();
  return value;
}

DateTime _dateTime(Map<String, Object?> source, String key) {
  final value = _nonEmptyString(source, key);
  return DateTime.parse(value).toUtc();
}

DateTime? _nullableDateTime(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null || value == '') return null;
  if (value is! String) throw const FormatException();
  return DateTime.parse(value).toUtc();
}

DateTime? _nullableUnixDateTime(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! int || value <= 0) throw const FormatException();
  return DateTime.fromMillisecondsSinceEpoch(value * 1000, isUtc: true);
}

T _map<T>(T Function() action) {
  try {
    return action();
  } on Sub2ApiException catch (error) {
    if (error.code == _invalidResponse.code) rethrow;
    throw _invalidResponse;
  } on Object {
    throw _invalidResponse;
  }
}

const _invalidResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_proxy_response',
  retryable: false,
);
