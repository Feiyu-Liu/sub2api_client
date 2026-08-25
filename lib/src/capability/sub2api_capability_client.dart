import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'models/sub2api_capabilities.dart';
import 'wire/capability_wire_service.dart';
import 'wire/sub2api_public_settings_dto.dart';

/// Provides public capability bootstrap for a Sub2API server.
abstract interface class Sub2ApiCapabilityClient {
  /// Reads server-controlled capability flags without authentication.
  Future<Sub2ApiCapabilities> getCapabilities({
    Sub2ApiRequestOptions? requestOptions,
  });
}

/// Creates the package-internal capability implementation.
///
/// This factory is deliberately not exported from `sub2api_client.dart`.
Sub2ApiCapabilityClient createSub2ApiCapabilityClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
}) => _Sub2ApiCapabilityClient(dio: dio, requestExecutor: requestExecutor);

final class _Sub2ApiCapabilityClient implements Sub2ApiCapabilityClient {
  /// Creates a capability client backed by the package's shared executor.
  _Sub2ApiCapabilityClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
  }) : _requestExecutor = requestExecutor,
       _service = CapabilityWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final CapabilityWireService _service;

  /// Reads server-controlled capability flags without authentication.
  @override
  Future<Sub2ApiCapabilities> getCapabilities({
    Sub2ApiRequestOptions? requestOptions,
  }) {
    return _requestExecutor.publicRequest<Sub2ApiCapabilities>(
      send: _service.getCapabilities,
      decode: _decodeCapabilities,
      requestOptions: requestOptions,
    );
  }

  static Sub2ApiCapabilities _decodeCapabilities(Object? data) {
    try {
      return Sub2ApiPublicSettingsDto.fromJson(
        _objectMap(data),
      ).toPublicModel();
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.protocol,
        code: 'protocol.invalid_public_settings',
        retryable: false,
      );
    }
  }
}

Map<String, Object?> _objectMap(Object? value) {
  if (value is! Map) {
    throw const Sub2ApiException(
      kind: Sub2ApiFailureKind.protocol,
      code: 'protocol.invalid_public_settings',
      retryable: false,
    );
  }
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.protocol,
        code: 'protocol.invalid_public_settings',
        retryable: false,
      );
    }
    result[entry.key as String] = entry.value;
  }
  return result;
}
