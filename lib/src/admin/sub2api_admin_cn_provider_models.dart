import '../shared/models/sub2api_decimal.dart';

enum Sub2ApiAdminCNProvider { kimi, zhipu, deepseek }

enum Sub2ApiAdminCNQuotaWindow { fiveHours, weekly }

final class Sub2ApiAdminCNQuotaTier {
  const Sub2ApiAdminCNQuotaTier({
    required this.window,
    required this.usedPercent,
    required this.resetAt,
  });

  final Sub2ApiAdminCNQuotaWindow window;
  final Sub2ApiDecimal usedPercent;
  final DateTime? resetAt;
}

final class Sub2ApiAdminCNQuotaResult {
  Sub2ApiAdminCNQuotaResult({
    required this.provider,
    required this.source,
    required this.success,
    required this.credentialValid,
    required List<Sub2ApiAdminCNQuotaTier> tiers,
    required this.planLevel,
    required this.statusCode,
    required this.fetchedAt,
    required this.persisted,
    required this.error,
  }) : tiers = List.unmodifiable(tiers);

  final Sub2ApiAdminCNProvider provider;
  final String source;
  final bool success;
  final bool credentialValid;
  final List<Sub2ApiAdminCNQuotaTier> tiers;
  final String planLevel;
  final int? statusCode;
  final DateTime fetchedAt;
  final bool persisted;
  final String error;
}

final class Sub2ApiAdminCNBalanceEntry {
  const Sub2ApiAdminCNBalanceEntry({
    required this.currency,
    required this.balance,
  });

  final String currency;
  final Sub2ApiDecimal balance;
}

final class Sub2ApiAdminCNBalanceResult {
  Sub2ApiAdminCNBalanceResult({
    required this.provider,
    required this.success,
    required this.balance,
    required this.currency,
    required List<Sub2ApiAdminCNBalanceEntry> balances,
    required this.available,
    required this.statusCode,
    required this.fetchedAt,
    required this.persisted,
    required this.error,
  }) : balances = List.unmodifiable(balances);

  final Sub2ApiAdminCNProvider provider;
  final bool success;
  final Sub2ApiDecimal balance;
  final String currency;
  final List<Sub2ApiAdminCNBalanceEntry> balances;
  final bool available;
  final int? statusCode;
  final DateTime fetchedAt;
  final bool persisted;
  final String error;
}
