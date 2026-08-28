final class Sub2ApiAdminTLSFingerprintProfile {
  Sub2ApiAdminTLSFingerprintProfile({
    required this.id,
    required this.name,
    required this.description,
    required this.enableGrease,
    required List<int> cipherSuites,
    required List<int> curves,
    required List<int> pointFormats,
    required List<int> signatureAlgorithms,
    required List<String> alpnProtocols,
    required List<int> supportedVersions,
    required List<int> keyShareGroups,
    required List<int> pskModes,
    required List<int> extensions,
    required this.createdAt,
    required this.updatedAt,
  }) : cipherSuites = List.unmodifiable(cipherSuites),
       curves = List.unmodifiable(curves),
       pointFormats = List.unmodifiable(pointFormats),
       signatureAlgorithms = List.unmodifiable(signatureAlgorithms),
       alpnProtocols = List.unmodifiable(alpnProtocols),
       supportedVersions = List.unmodifiable(supportedVersions),
       keyShareGroups = List.unmodifiable(keyShareGroups),
       pskModes = List.unmodifiable(pskModes),
       extensions = List.unmodifiable(extensions);

  final int id;
  final String name;
  final String? description;
  final bool enableGrease;
  final List<int> cipherSuites;
  final List<int> curves;
  final List<int> pointFormats;
  final List<int> signatureAlgorithms;
  final List<String> alpnProtocols;
  final List<int> supportedVersions;
  final List<int> keyShareGroups;
  final List<int> pskModes;
  final List<int> extensions;
  final DateTime createdAt;
  final DateTime updatedAt;
}

final class Sub2ApiAdminCreateTLSFingerprintProfileRequest {
  Sub2ApiAdminCreateTLSFingerprintProfileRequest({
    required this.name,
    this.description,
    this.enableGrease = false,
    List<int> cipherSuites = const <int>[],
    List<int> curves = const <int>[],
    List<int> pointFormats = const <int>[],
    List<int> signatureAlgorithms = const <int>[],
    List<String> alpnProtocols = const <String>[],
    List<int> supportedVersions = const <int>[],
    List<int> keyShareGroups = const <int>[],
    List<int> pskModes = const <int>[],
    List<int> extensions = const <int>[],
  }) : cipherSuites = List.unmodifiable(cipherSuites),
       curves = List.unmodifiable(curves),
       pointFormats = List.unmodifiable(pointFormats),
       signatureAlgorithms = List.unmodifiable(signatureAlgorithms),
       alpnProtocols = List.unmodifiable(alpnProtocols),
       supportedVersions = List.unmodifiable(supportedVersions),
       keyShareGroups = List.unmodifiable(keyShareGroups),
       pskModes = List.unmodifiable(pskModes),
       extensions = List.unmodifiable(extensions);

  final String name;
  final String? description;
  final bool enableGrease;
  final List<int> cipherSuites;
  final List<int> curves;
  final List<int> pointFormats;
  final List<int> signatureAlgorithms;
  final List<String> alpnProtocols;
  final List<int> supportedVersions;
  final List<int> keyShareGroups;
  final List<int> pskModes;
  final List<int> extensions;
}

final class Sub2ApiAdminUpdateTLSFingerprintProfileRequest {
  Sub2ApiAdminUpdateTLSFingerprintProfileRequest({
    this.name,
    this.description,
    this.enableGrease,
    this.cipherSuites,
    this.curves,
    this.pointFormats,
    this.signatureAlgorithms,
    this.alpnProtocols,
    this.supportedVersions,
    this.keyShareGroups,
    this.pskModes,
    this.extensions,
  });

  final String? name;
  final String? description;
  final bool? enableGrease;
  final List<int>? cipherSuites;
  final List<int>? curves;
  final List<int>? pointFormats;
  final List<int>? signatureAlgorithms;
  final List<String>? alpnProtocols;
  final List<int>? supportedVersions;
  final List<int>? keyShareGroups;
  final List<int>? pskModes;
  final List<int>? extensions;
}

final class Sub2ApiAdminDeleteTLSFingerprintProfileResult {
  const Sub2ApiAdminDeleteTLSFingerprintProfileResult(this.message);
  final String message;
}
