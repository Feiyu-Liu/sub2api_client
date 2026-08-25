import 'package:sub2api_client/src/shared/models/sub2api_decimal.dart';
import 'package:test/test.dart';

void main() {
  test('preserves exact wire decimal text without a public double', () {
    final value = Sub2ApiDecimal.fromJson('0.100000000000000001');

    expect(value.toString(), '0.100000000000000001');
    expect(value, Sub2ApiDecimal.parse('0.100000000000000001'));
  });
}
