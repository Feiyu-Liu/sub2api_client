import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_tls_fingerprint_models.dart';
import 'wire/admin_tls_fingerprint_wire_mapper.dart';
import 'wire/admin_tls_fingerprint_wire_service.dart';

abstract interface class Sub2ApiAdminTLSFingerprintsClient {
  Future<List<Sub2ApiAdminTLSFingerprintProfile>> list({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminTLSFingerprintProfile> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminTLSFingerprintProfile> create(
    Sub2ApiAdminCreateTLSFingerprintProfileRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminTLSFingerprintProfile> update(
    int id,
    Sub2ApiAdminUpdateTLSFingerprintProfileRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDeleteTLSFingerprintProfileResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminTLSFingerprintsClient createSub2ApiAdminTLSFingerprintsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminTLSFingerprintsClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminTLSFingerprintWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminTLSFingerprintWireService _service;

  @override
  Future<List<Sub2ApiAdminTLSFingerprintProfile>> list({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, k) => _service.list(c, o, _auth(k), _key(k)),
    decode: mapAdminTLSFingerprintProfiles,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminTLSFingerprintProfile> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedRequest(
      send: (c, o, k) => _service.get(id, c, o, _auth(k), _key(k)),
      decode: mapAdminTLSFingerprintProfile,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminTLSFingerprintProfile> create(
    Sub2ApiAdminCreateTLSFingerprintProfileRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final name = _name(request.name);
    final body = _body(
      name: name,
      description: request.description,
      enableGrease: request.enableGrease,
      cipherSuites: request.cipherSuites,
      curves: request.curves,
      pointFormats: request.pointFormats,
      signatureAlgorithms: request.signatureAlgorithms,
      alpnProtocols: request.alpnProtocols,
      supportedVersions: request.supportedVersions,
      keyShareGroups: request.keyShareGroups,
      pskModes: request.pskModes,
      extensions: request.extensions,
    );
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.create(body, c, o, _auth(k), _key(k)),
      decode: mapAdminTLSFingerprintProfile,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminTLSFingerprintProfile> update(
    int id,
    Sub2ApiAdminUpdateTLSFingerprintProfileRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    final name = request.name == null ? null : _name(request.name!);
    _validateLists(
      request.cipherSuites,
      request.curves,
      request.pointFormats,
      request.signatureAlgorithms,
      request.supportedVersions,
      request.keyShareGroups,
      request.pskModes,
      request.extensions,
    );
    final body = <String, Object?>{
      'name': ?name,
      'description': ?request.description?.trim(),
      'enable_grease': ?request.enableGrease,
      'cipher_suites': ?request.cipherSuites,
      'curves': ?request.curves,
      'point_formats': ?request.pointFormats,
      'signature_algorithms': ?request.signatureAlgorithms,
      'alpn_protocols': ?request.alpnProtocols,
      'supported_versions': ?request.supportedVersions,
      'key_share_groups': ?request.keyShareGroups,
      'psk_modes': ?request.pskModes,
      'extensions': ?request.extensions,
    };
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.update(id, body, c, o, _auth(k), _key(k)),
      decode: mapAdminTLSFingerprintProfile,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminDeleteTLSFingerprintProfileResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.delete(id, c, o, _auth(k), _key(k)),
      decode: mapAdminDeleteTLSFingerprintProfile,
      requestOptions: requestOptions,
    );
  }

  String? _auth(String? value) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? value : null;
  String? _key(String? value) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? value : null;
}

Map<String, Object?> _body({
  required String name,
  String? description,
  required bool enableGrease,
  required List<int> cipherSuites,
  required List<int> curves,
  required List<int> pointFormats,
  required List<int> signatureAlgorithms,
  required List<String> alpnProtocols,
  required List<int> supportedVersions,
  required List<int> keyShareGroups,
  required List<int> pskModes,
  required List<int> extensions,
}) {
  _validateLists(
    cipherSuites,
    curves,
    pointFormats,
    signatureAlgorithms,
    supportedVersions,
    keyShareGroups,
    pskModes,
    extensions,
  );
  return <String, Object?>{
    'name': name,
    'description': description?.trim(),
    'enable_grease': enableGrease,
    'cipher_suites': cipherSuites,
    'curves': curves,
    'point_formats': pointFormats,
    'signature_algorithms': signatureAlgorithms,
    'alpn_protocols': alpnProtocols,
    'supported_versions': supportedVersions,
    'key_share_groups': keyShareGroups,
    'psk_modes': pskModes,
    'extensions': extensions,
  };
}

void _validateLists(
  List<int>? a,
  List<int>? b,
  List<int>? c,
  List<int>? d,
  List<int>? e,
  List<int>? f,
  List<int>? g,
  List<int>? h,
) {
  for (final values in <List<int>?>[a, b, c, d, e, f, g, h]) {
    if (values != null && values.any((v) => v < 0 || v > 65535)) {
      throw _validation('admin.tls_fingerprints.invalid_uint16');
    }
  }
}

String _name(String value) {
  final v = value.trim();
  if (v.isEmpty) throw _validation('admin.tls_fingerprints.name_required');
  return v;
}

void _id(int value) {
  if (value <= 0) throw _validation('admin.tls_fingerprints.invalid_id');
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
