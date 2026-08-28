import '../../shared/errors/sub2api_exception.dart';
import '../sub2api_admin_tls_fingerprint_models.dart';

List<Sub2ApiAdminTLSFingerprintProfile> mapAdminTLSFingerprintProfiles(
  Object? data,
) => _map(() {
  if (data is! List) throw const FormatException();
  return data.map(_object).map(_profile).toList(growable: false);
});

Sub2ApiAdminTLSFingerprintProfile mapAdminTLSFingerprintProfile(Object? data) =>
    _map(() => _profile(_object(data)));

Sub2ApiAdminDeleteTLSFingerprintProfileResult
mapAdminDeleteTLSFingerprintProfile(Object? data) => _map(
  () => Sub2ApiAdminDeleteTLSFingerprintProfileResult(
    _nonEmptyString(_object(data), 'message'),
  ),
);

Sub2ApiAdminTLSFingerprintProfile _profile(Map<String, Object?> source) =>
    Sub2ApiAdminTLSFingerprintProfile(
      id: _positiveInteger(source, 'id'),
      name: _nonEmptyString(source, 'name'),
      description: _nullableString(source, 'description'),
      enableGrease: _boolean(source, 'enable_grease'),
      cipherSuites: _uint16List(source, 'cipher_suites'),
      curves: _uint16List(source, 'curves'),
      pointFormats: _uint16List(source, 'point_formats'),
      signatureAlgorithms: _uint16List(source, 'signature_algorithms'),
      alpnProtocols: _stringList(source, 'alpn_protocols'),
      supportedVersions: _uint16List(source, 'supported_versions'),
      keyShareGroups: _uint16List(source, 'key_share_groups'),
      pskModes: _uint16List(source, 'psk_modes'),
      extensions: _uint16List(source, 'extensions'),
      createdAt: _dateTime(source, 'created_at'),
      updatedAt: _dateTime(source, 'updated_at'),
    );

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

String _nonEmptyString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! String || value.trim().isEmpty) throw const FormatException();
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

int _positiveInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! int || value <= 0) throw const FormatException();
  return value;
}

List<int> _uint16List(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! List ||
      value.any((item) => item is! int || item < 0 || item > 65535)) {
    throw const FormatException();
  }
  return value.cast<int>().toList(growable: false);
}

List<String> _stringList(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! List || value.any((item) => item is! String)) {
    throw const FormatException();
  }
  return value.cast<String>().toList(growable: false);
}

DateTime _dateTime(Map<String, Object?> source, String key) =>
    DateTime.parse(_nonEmptyString(source, key)).toUtc();
T _map<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalidResponse;
  }
}

const _invalidResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_tls_fingerprint_response',
  retryable: false,
);
