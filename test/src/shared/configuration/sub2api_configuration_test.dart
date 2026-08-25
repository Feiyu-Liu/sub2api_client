import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:test/test.dart';

void main() {
  group('Sub2ApiConfiguration', () {
    test('accepts and normalizes an HTTPS origin', () {
      final configuration = Sub2ApiConfiguration(
        origin: Uri.parse('https://example.com/'),
      );

      expect(configuration.origin.toString(), 'https://example.com');
    });

    test('requires explicit opt-in for development HTTP', () {
      expect(
        () => Sub2ApiConfiguration(origin: Uri.parse('http://localhost:8080')),
        throwsA(
          isA<Sub2ApiException>().having(
            (error) => error.code,
            'code',
            'configuration.invalid_origin',
          ),
        ),
      );
      expect(
        Sub2ApiConfiguration(
          origin: Uri.parse('http://localhost:8080'),
          allowInsecureHttp: true,
        ).origin.host,
        'localhost',
      );
    });

    for (final invalid in [
      'https://user@example.com',
      'https://example.com/api',
      'https://example.com?query=1',
      'https://example.com#fragment',
    ]) {
      test('rejects invalid origin $invalid', () {
        expect(
          () => Sub2ApiConfiguration(origin: Uri.parse(invalid)),
          throwsA(isA<Sub2ApiException>()),
        );
      });
    }
  });
}
