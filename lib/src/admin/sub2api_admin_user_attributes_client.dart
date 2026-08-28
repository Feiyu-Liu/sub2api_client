import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_user_attribute_models.dart';
import 'wire/admin_user_attribute_wire_mapper.dart';
import 'wire/admin_user_attribute_wire_service.dart';

abstract interface class Sub2ApiAdminUserAttributesClient {
  Future<List<Sub2ApiAdminUserAttributeDefinition>> list({
    bool enabledOnly = false,
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminUserAttributeDefinition> create(
    Sub2ApiAdminCreateUserAttributeDefinitionRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<List<Sub2ApiAdminUserAttributeSnapshot>> getBatch(
    List<int> userIds, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminUserAttributeActionResult> reorder(
    List<int> ids, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminUserAttributeDefinition> update(
    int id,
    Sub2ApiAdminUpdateUserAttributeDefinitionRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminUserAttributeActionResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminUserAttributesClient createSub2ApiAdminUserAttributesClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminUserAttributesClient {
  _Client(Dio dio, this._executor, this._mode)
    : _service = AdminUserAttributeWireService(dio);
  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminUserAttributeWireService _service;
  @override
  Future<List<Sub2ApiAdminUserAttributeDefinition>> list({
    bool enabledOnly = false,
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (c, o, k) => _service.list(enabledOnly, c, o, _auth(k), _key(k)),
    decode: mapAdminUserAttributeDefinitions,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminUserAttributeDefinition> create(
    Sub2ApiAdminCreateUserAttributeDefinitionRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final key = _required(r.key, 'admin.user_attributes.key_required', 100);
    final name = _required(r.name, 'admin.user_attributes.name_required', 255);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.create(
        <String, Object?>{
          'key': key,
          'name': name,
          'description': r.description.trim(),
          'type': _type(r.type),
          'options': _options(r.options),
          'required': r.required,
          'validation': _validationBody(r.validation),
          'placeholder': r.placeholder.trim(),
          'enabled': r.enabled,
        },
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminUserAttributeDefinition,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminUserAttributeSnapshot>> getBatch(
    List<int> userIds, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final ids = _ids(userIds, allowEmpty: true);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.batch(
        <String, Object?>{'user_ids': ids},
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminUserAttributeSnapshots,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUserAttributeActionResult> reorder(
    List<int> ids, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final values = _ids(ids, allowEmpty: true);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.reorder(
        <String, Object?>{'ids': values},
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminUserAttributeAction,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUserAttributeDefinition> update(
    int id,
    Sub2ApiAdminUpdateUserAttributeDefinitionRequest r, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    final name = r.name == null
        ? null
        : _required(r.name!, 'admin.user_attributes.name_required', 255);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.update(
        id,
        <String, Object?>{
          'name': ?name,
          'description': ?r.description?.trim(),
          'type': ?r.type == null ? null : _type(r.type!),
          'options': ?r.options == null ? null : _options(r.options!),
          'required': ?r.required,
          'validation': ?r.validation == null
              ? null
              : _validationBody(r.validation!),
          'placeholder': ?r.placeholder?.trim(),
          'enabled': ?r.enabled,
        },
        c,
        o,
        _auth(k),
        _key(k),
      ),
      decode: mapAdminUserAttributeDefinition,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUserAttributeActionResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (c, o, k) => _service.delete(id, c, o, _auth(k), _key(k)),
      decode: mapAdminUserAttributeAction,
      requestOptions: requestOptions,
    );
  }

  String? _auth(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? v : null;
  String? _key(String? v) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? v : null;
}

List<int> _ids(List<int> values, {required bool allowEmpty}) {
  if (!allowEmpty && values.isEmpty) {
    throw _validation('admin.user_attributes.ids_required');
  }
  if (values.any((id) => id <= 0)) {
    throw _validation('admin.user_attributes.invalid_id');
  }
  return values.toSet().toList();
}

void _id(int value) {
  if (value <= 0) throw _validation('admin.user_attributes.invalid_id');
}

String _required(String value, String code, int max) {
  final v = value.trim();
  if (v.isEmpty || v.length > max) throw _validation(code);
  return v;
}

List<Map<String, Object?>> _options(
  List<Sub2ApiAdminUserAttributeOption> values,
) => values
    .map((o) => <String, Object?>{'value': o.value, 'label': o.label})
    .toList();
Map<String, Object?> _validationBody(Sub2ApiAdminUserAttributeValidation v) =>
    <String, Object?>{
      'min_length': ?v.minLength,
      'max_length': ?v.maxLength,
      'min': ?v.min,
      'max': ?v.max,
      'pattern': ?v.pattern,
      'message': ?v.message,
    };
String _type(Sub2ApiAdminUserAttributeType v) =>
    v == Sub2ApiAdminUserAttributeType.multiSelect ? 'multi_select' : v.name;
Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);
