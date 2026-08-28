import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../sub2api_admin_cn_provider_models.dart';

Sub2ApiAdminCNQuotaResult mapAdminCNQuotaResult(Object? data) => _map(() {
  final source = _object(data);
  return Sub2ApiAdminCNQuotaResult(
    provider: _provider(_nonEmptyString(source, 'provider')),
    source: _nonEmptyString(source, 'source'),
    success: _boolean(source, 'success'),
    credentialValid: _boolean(source, 'credential_valid'),
    tiers: _optionalList(source, 'tiers')
        .map(_object)
        .map((tier) {
          return Sub2ApiAdminCNQuotaTier(
            window: switch (_nonEmptyString(tier, 'window')) {
              '5h' => Sub2ApiAdminCNQuotaWindow.fiveHours,
              'weekly' => Sub2ApiAdminCNQuotaWindow.weekly,
              _ => throw const FormatException(),
            },
            usedPercent: _decimal(tier, 'used_percent'),
            resetAt: _optionalDateTime(tier, 'reset_at'),
          );
        })
        .toList(growable: false),
    planLevel: _optionalString(source, 'plan_level'),
    statusCode: _optionalStatusCode(source, 'status_code'),
    fetchedAt: _unixDateTime(source, 'fetched_at'),
    persisted: _boolean(source, 'persisted'),
    error: _optionalString(source, 'error'),
  );
});

Sub2ApiAdminCNBalanceResult mapAdminCNBalanceResult(Object? data) => _map(() {
  final source = _object(data);
  return Sub2ApiAdminCNBalanceResult(
    provider: _provider(_nonEmptyString(source, 'provider')),
    success: _boolean(source, 'success'),
    balance: _decimal(source, 'balance'),
    currency: _optionalString(source, 'currency'),
    balances: _optionalList(source, 'balances')
        .map(_object)
        .map((entry) {
          return Sub2ApiAdminCNBalanceEntry(
            currency: _nonEmptyString(entry, 'currency'),
            balance: _decimal(entry, 'balance'),
          );
        })
        .toList(growable: false),
    available: _boolean(source, 'available'),
    statusCode: _optionalStatusCode(source, 'status_code'),
    fetchedAt: _unixDateTime(source, 'fetched_at'),
    persisted: _boolean(source, 'persisted'),
    error: _optionalString(source, 'error'),
  );
});

Sub2ApiAdminCNProvider _provider(String value) => switch (value) {
  'kimi' => Sub2ApiAdminCNProvider.kimi,
  'zhipu' => Sub2ApiAdminCNProvider.zhipu,
  'deepseek' => Sub2ApiAdminCNProvider.deepseek,
  _ => throw const FormatException(),
};

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

List<Object?> _optionalList(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return const <Object?>[];
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

String _nonEmptyString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! String || value.trim().isEmpty) throw const FormatException();
  return value;
}

String _optionalString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

bool _boolean(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! bool) throw const FormatException();
  return value;
}

Sub2ApiDecimal _decimal(Map<String, Object?> source, String key) {
  if (!source.containsKey(key)) throw const FormatException();
  return Sub2ApiDecimal.fromJson(source[key]);
}

int? _optionalStatusCode(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null || value == 0) return null;
  if (value is! int || value < 100 || value > 599) {
    throw const FormatException();
  }
  return value;
}

DateTime _unixDateTime(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! int || value <= 0) throw const FormatException();
  return DateTime.fromMillisecondsSinceEpoch(value * 1000, isUtc: true);
}

DateTime? _optionalDateTime(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null || value == '') return null;
  if (value is! String) throw const FormatException();
  return DateTime.parse(value).toUtc();
}

T _map<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalidResponse;
  }
}

const _invalidResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_cn_provider_response',
  retryable: false,
);
