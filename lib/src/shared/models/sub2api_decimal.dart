import 'package:decimal/decimal.dart';

import '../errors/sub2api_exception.dart';

/// Exact decimal value used for money, balances, multipliers, and billed usage.
final class Sub2ApiDecimal implements Comparable<Sub2ApiDecimal> {
  const Sub2ApiDecimal._(this._value);

  /// Zero without a floating-point conversion.
  factory Sub2ApiDecimal.zero() => Sub2ApiDecimal._(Decimal.zero);

  /// Parses an exact decimal representation.
  factory Sub2ApiDecimal.parse(String source) {
    try {
      return Sub2ApiDecimal._(Decimal.parse(source));
    } on FormatException {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.protocol,
        code: 'protocol.invalid_decimal',
        retryable: false,
      );
    }
  }

  /// Converts a JSON number or decimal string without exposing a public double.
  factory Sub2ApiDecimal.fromJson(Object? value) {
    if (value is num || value is String) {
      return Sub2ApiDecimal.parse(value.toString());
    }
    throw const Sub2ApiException(
      kind: Sub2ApiFailureKind.protocol,
      code: 'protocol.invalid_decimal',
      retryable: false,
    );
  }

  final Decimal _value;

  /// JSON-safe exact representation for request DTO conversion.
  String toJson() => _value.toString();

  @override
  int compareTo(Sub2ApiDecimal other) => _value.compareTo(other._value);

  @override
  bool operator ==(Object other) =>
      other is Sub2ApiDecimal && _value == other._value;

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() => _value.toString();
}
