import 'dart:convert';

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

Sub2ApiAdminProxyActionResult mapAdminProxyActionResult(Object? data) => _map(
  () =>
      Sub2ApiAdminProxyActionResult(_nonEmptyString(_object(data), 'message')),
);

Sub2ApiAdminBatchCreateProxiesResult mapAdminBatchCreateProxiesResult(
  Object? data,
) => _map(() {
  final source = _object(data);
  return Sub2ApiAdminBatchCreateProxiesResult(
    created: _nonNegativeInteger(source, 'created'),
    skipped: _nonNegativeInteger(source, 'skipped'),
  );
});

Sub2ApiAdminProxyBatchDeleteResult mapAdminProxyBatchDeleteResult(
  Object? data,
) => _map(() {
  final source = _object(data);
  final deletedIds = _list(source, 'deleted_ids')
      .map((value) {
        if (value is! int || value <= 0) throw const FormatException();
        return value;
      })
      .toList(growable: false);
  final skipped = _list(source, 'skipped')
      .map(_object)
      .map(
        (item) => Sub2ApiAdminProxyBatchDeleteSkipped(
          proxyId: _positiveInteger(item, 'id'),
          reason: _nonEmptyString(item, 'reason'),
        ),
      )
      .toList(growable: false);
  final deletedSet = deletedIds.toSet();
  final skippedSet = skipped.map((item) => item.proxyId).toSet();
  if (deletedSet.length != deletedIds.length ||
      skippedSet.length != skipped.length ||
      deletedSet.intersection(skippedSet).isNotEmpty) {
    throw const FormatException();
  }
  return Sub2ApiAdminProxyBatchDeleteResult(
    deletedIds: deletedIds,
    skipped: skipped,
  );
});

Sub2ApiAdminProxyTestResult mapAdminProxyTestResult(Object? data) => _map(() {
  final source = _object(data);
  final success = _boolean(source, 'success');
  final latencyMs = _nullableNonNegativeInteger(source, 'latency_ms');
  if (!success && latencyMs != null) throw const FormatException();
  return Sub2ApiAdminProxyTestResult(
    success: success,
    message: _nonEmptyString(source, 'message'),
    latencyMs: latencyMs,
    ipAddress: _optionalString(source, 'ip_address'),
    city: _optionalString(source, 'city'),
    region: _optionalString(source, 'region'),
    country: _optionalString(source, 'country'),
    countryCode: _optionalString(source, 'country_code'),
  );
});

Sub2ApiAdminProxyQualityResult mapAdminProxyQualityResult(Object? data) =>
    _map(() {
      final source = _object(data);
      final score = _nonNegativeInteger(source, 'score');
      if (score > 100) throw const FormatException();
      final items = _list(source, 'items')
          .map(_object)
          .map(
            (item) => Sub2ApiAdminProxyQualityItem(
              target: _nonEmptyString(item, 'target'),
              status: switch (_nonEmptyString(item, 'status')) {
                'pass' => Sub2ApiAdminProxyQualityItemStatus.pass,
                'warn' => Sub2ApiAdminProxyQualityItemStatus.warn,
                'fail' => Sub2ApiAdminProxyQualityItemStatus.fail,
                'challenge' => Sub2ApiAdminProxyQualityItemStatus.challenge,
                _ => throw const FormatException(),
              },
              httpStatus: _nullableNonNegativeInteger(item, 'http_status'),
              latencyMs: _nullableNonNegativeInteger(item, 'latency_ms'),
              message: _optionalString(item, 'message'),
              cfRay: _optionalString(item, 'cf_ray'),
            ),
          )
          .toList(growable: false);
      final passed = _nonNegativeInteger(source, 'passed_count');
      final warned = _nonNegativeInteger(source, 'warn_count');
      final failed = _nonNegativeInteger(source, 'failed_count');
      final challenged = _nonNegativeInteger(source, 'challenge_count');
      if (passed + warned + failed + challenged != items.length) {
        throw const FormatException();
      }
      return Sub2ApiAdminProxyQualityResult(
        proxyId: _positiveInteger(source, 'proxy_id'),
        score: score,
        grade: _nonEmptyString(source, 'grade'),
        summary: _nonEmptyString(source, 'summary'),
        exitIp: _optionalString(source, 'exit_ip'),
        country: _optionalString(source, 'country'),
        countryCode: _optionalString(source, 'country_code'),
        baseLatencyMs: _nullableNonNegativeInteger(source, 'base_latency_ms'),
        passedCount: passed,
        warnCount: warned,
        failedCount: failed,
        challengeCount: challenged,
        checkedAt: _unixDateTime(source, 'checked_at'),
        items: items,
      );
    });

Sub2ApiAdminProxyDataExport mapAdminProxyDataExport(Object? data) => _map(() {
  final source = _object(data);
  _validateDataHeader(source);
  final proxies = _list(source, 'proxies').map(_object).toList();
  final accounts = _list(source, 'accounts');
  if (accounts.isNotEmpty) throw const FormatException();
  for (final proxy in proxies) {
    _validateDataProxy(proxy);
  }
  return Sub2ApiAdminProxyDataExport(
    exportedAt: _dateTime(source, 'exported_at'),
    proxyCount: proxies.length,
    archive: Sub2ApiAdminProxyDataArchive(jsonEncode(source)),
  );
});

Sub2ApiAdminProxyDataImportResult mapAdminProxyDataImportResult(Object? data) =>
    _map(() {
      final source = _object(data);
      final accountCreated = _nonNegativeInteger(source, 'account_created');
      final accountFailed = _nonNegativeInteger(source, 'account_failed');
      if (accountCreated != 0 || accountFailed != 0) {
        throw const FormatException();
      }
      final errors = source['errors'] == null
          ? <Object?>[]
          : _array(source['errors']);
      return Sub2ApiAdminProxyDataImportResult(
        created: _nonNegativeInteger(source, 'proxy_created'),
        reused: _nonNegativeInteger(source, 'proxy_reused'),
        failed: _nonNegativeInteger(source, 'proxy_failed'),
        errors: errors
            .map(_object)
            .map((error) {
              if (_nonEmptyString(error, 'kind') != 'proxy') {
                throw const FormatException();
              }
              return Sub2ApiAdminProxyDataImportError(
                name: _optionalString(error, 'name'),
                proxyKey: _optionalString(error, 'proxy_key'),
                message: _nonEmptyString(error, 'message'),
              );
            })
            .toList(growable: false),
      );
    });

void _validateDataHeader(Map<String, Object?> source) {
  final type = _optionalString(source, 'type');
  if (type.isNotEmpty && type != 'sub2api-data' && type != 'sub2api-bundle') {
    throw const FormatException();
  }
  final version = source['version'];
  if (version != null && version != 0 && version != 1) {
    throw const FormatException();
  }
}

void _validateDataProxy(Map<String, Object?> source) {
  _nonEmptyString(source, 'proxy_key');
  _nonEmptyString(source, 'name');
  final protocol = _nonEmptyString(source, 'protocol');
  if (!const {'http', 'https', 'socks5', 'socks5h'}.contains(protocol)) {
    throw const FormatException();
  }
  _nonEmptyString(source, 'host');
  _port(source, 'port');
  _optionalString(source, 'username');
  _optionalString(source, 'password');
  final status = _nonEmptyString(source, 'status');
  if (status != 'active' && status != 'inactive' && status != 'expired') {
    throw const FormatException();
  }
  final expiresAt = source['expires_at'];
  if (expiresAt != null && (expiresAt is! int || expiresAt <= 0)) {
    throw const FormatException();
  }
  final fallback = _optionalString(source, 'fallback_mode');
  if (fallback.isNotEmpty &&
      !const {'none', 'proxy', 'direct'}.contains(fallback)) {
    throw const FormatException();
  }
  _optionalString(source, 'backup_proxy_name');
  final warnDays = source['expiry_warn_days'];
  if (warnDays != null && (warnDays is! int || warnDays < 0)) {
    throw const FormatException();
  }
}

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

bool _boolean(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! bool) throw const FormatException();
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

DateTime _unixDateTime(Map<String, Object?> source, String key) {
  final value = _positiveInteger(source, key);
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
