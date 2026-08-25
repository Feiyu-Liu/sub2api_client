import 'dart:convert';
import 'dart:io';

/// Pinned Sub2API source metadata for the checked-in v0.1.155 fixtures.
final class Sub2ApiFixtureManifest {
  const Sub2ApiFixtureManifest({required this.tag, required this.commit});

  /// Immutable Sub2API source commit used to derive every fixture.
  final String commit;

  /// Immutable upstream tag represented by the fixture directory.
  final String tag;
}

/// Reads the fixed Sub2API source metadata for this fixture directory.
Sub2ApiFixtureManifest readFixtureManifest() {
  final manifest = readFixture('manifest.json');
  final tag = manifest['sub2api_tag'];
  final commit = manifest['sub2api_commit'];
  if (tag is! String || commit is! String) {
    throw const FormatException('Fixture manifest is missing source metadata.');
  }
  return Sub2ApiFixtureManifest(tag: tag, commit: commit);
}

/// Reads a checked-in v0.1.155 JSON fixture as a typed wire map.
Map<String, Object?> readFixture(String relativePath) {
  final decoded = jsonDecode(
    File('test/fixtures/v0_1_155/$relativePath').readAsStringSync(),
  );
  if (decoded is! Map) {
    throw FormatException('Fixture $relativePath is not a JSON object.');
  }
  return decoded.map<String, Object?>((key, value) {
    if (key is! String) {
      throw FormatException('Fixture $relativePath contains a non-string key.');
    }
    return MapEntry<String, Object?>(key, value);
  });
}

/// Reads the success-envelope data portion of a checked-in fixture.
Map<String, Object?> readSuccessFixtureData(String relativePath) {
  final fixture = readFixture(relativePath);
  final data = fixture['data'];
  if (fixture['code'] != 0 || data is! Map) {
    throw FormatException('Fixture $relativePath is not a success envelope.');
  }
  return data.map<String, Object?>((key, value) {
    if (key is! String) {
      throw FormatException('Fixture $relativePath contains a non-string key.');
    }
    return MapEntry<String, Object?>(key, value);
  });
}
