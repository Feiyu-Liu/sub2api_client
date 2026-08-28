import '../shared/models/sub2api_decimal.dart';

final class Sub2ApiAdminOpsQpsUpdate {
  const Sub2ApiAdminOpsQpsUpdate({
    required this.timestamp,
    required this.qps,
    required this.tps,
    required this.requestCount,
  });

  final DateTime timestamp;
  final Sub2ApiDecimal qps;
  final Sub2ApiDecimal tps;
  final int requestCount;
}
