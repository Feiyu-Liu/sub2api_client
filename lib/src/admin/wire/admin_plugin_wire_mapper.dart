import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../sub2api_admin_plugin_models.dart';
import '../sub2api_admin_user_models.dart';

List<Sub2ApiAdminPlugin> mapAdminPlugins(Object? data) =>
    _guard(() => _list(data).map(_object).map(_plugin).toList(growable: false));

Sub2ApiAdminPlugin mapAdminPlugin(Object? data) =>
    _guard(() => _plugin(_object(data)));

Sub2ApiAdminPluginConfig mapAdminPluginConfig(Object? data) =>
    _guard(() => Sub2ApiAdminPluginConfig(_jsonObject(data)));

Sub2ApiAdminPluginTestResult mapAdminPluginTest(Object? data) => _guard(() {
  final source = _object(data);
  return Sub2ApiAdminPluginTestResult(
    success: _bool(source['success']),
    message: _text(source['message']),
    latency: Duration(milliseconds: _nonNegativeInt(source['latency_ms'])),
  );
});

Sub2ApiAdminPluginDeleteResult mapAdminPluginDelete(Object? data) => _guard(
  () => Sub2ApiAdminPluginDeleteResult(
    message: _requiredText(_object(data)['message']),
  ),
);

Sub2ApiAdminPluginUiSession mapAdminPluginUiSession(Object? data) => _guard(() {
  final source = _object(data);
  return Sub2ApiAdminPluginUiSession(
    url: Sub2ApiAdminPluginUiUrl(_requiredText(source['url'])),
    bridgeToken: Sub2ApiAdminPluginBridgeToken(
      _requiredText(source['bridge_token']),
    ),
    uiBridgeVersion: _positiveInt(source['ui_bridge_version']),
    expiresAt: _date(source['expires_at']),
  );
});

Sub2ApiAdminPlugin _plugin(Map<String, Object?> source) => Sub2ApiAdminPlugin(
  id: _positiveInt(source['id']),
  pluginKey: _requiredText(source['plugin_key']),
  name: _requiredText(source['name']),
  version: _requiredText(source['version']),
  description: _text(source['description']),
  author: _text(source['author']),
  manifest: _manifest(_object(source['manifest'])),
  binarySha256: _sha256(source['binary_sha256']),
  signatureStatus: _signature(_requiredText(source['signature_status'])),
  state: _state(_requiredText(source['state'])),
  lastError: _text(source['last_error']),
  installedBy: _optionalPositiveInt(source['installed_by']),
  installedAt: _date(source['installed_at']),
  enabledAt: _optionalDate(source['enabled_at']),
  updatedAt: _date(source['updated_at']),
  bindings: _list(
    source['bindings'],
  ).map(_object).map(_binding).toList(growable: false),
  compatibility: _compatibility(_object(source['compatibility'])),
  runtimeHealthy: _bool(source['runtime_healthy']),
  runtimeMessage: _text(source['runtime_message']),
);

Sub2ApiAdminPluginManifest _manifest(Map<String, Object?> source) {
  final runtimes = <String, Sub2ApiAdminPluginRelativePath>{};
  for (final entry in _object(source['runtimes']).entries) {
    runtimes[entry.key] = _path(_object(entry.value)['path']);
  }
  final files = <Sub2ApiAdminPluginFileDigest>[];
  for (final entry in _object(source['files']).entries) {
    files.add(
      Sub2ApiAdminPluginFileDigest(
        path: _path(entry.key),
        sha256: _sha256(entry.value),
      ),
    );
  }
  final ui = _object(source['ui']);
  final entrypoint = _text(ui['entrypoint']);
  return Sub2ApiAdminPluginManifest(
    schemaVersion: _positiveInt(source['schema_version']),
    id: _requiredText(source['id']),
    name: _requiredText(source['name']),
    version: _requiredText(source['version']),
    description: _text(source['description']),
    author: _text(source['author']),
    requires: _requirements(_object(source['requires'])),
    capabilities: _list(source['capabilities'])
        .map(_object)
        .map(
          (item) => Sub2ApiAdminPluginCapability(
            id: _requiredText(item['id']),
            platform: _requiredText(item['platform']),
            accountType: _requiredText(item['account_type']),
          ),
        )
        .toList(),
    runtimes: runtimes,
    uiEntrypoint: entrypoint.isEmpty ? null : _path(entrypoint),
    files: files,
  );
}

Sub2ApiAdminPluginRequirements _requirements(Map<String, Object?> source) =>
    Sub2ApiAdminPluginRequirements(
      sub2api: _requiredText(source['sub2api']),
      recommendedSub2apiVersion: _text(source['recommended_sub2api_version']),
      testedSub2apiVersions: _stringList(source['tested_sub2api_versions']),
      pluginProtocol: _positiveInt(source['plugin_protocol']),
      transportApi: _positiveInt(source['transport_api']),
      uiBridge: _nonNegativeInt(source['ui_bridge']),
    );

Sub2ApiAdminPluginBinding _binding(Map<String, Object?> source) =>
    Sub2ApiAdminPluginBinding(
      id: _positiveInt(source['id']),
      pluginId: _positiveInt(source['plugin_id']),
      capability: _requiredText(source['capability']),
      platform: _requiredText(source['platform']),
      accountType: _requiredText(source['account_type']),
      enabled: _bool(source['enabled']),
      rolloutPercent: _positiveInt(source['rollout_percent']),
      createdAt: _date(source['created_at']),
      updatedAt: _date(source['updated_at']),
    );

Sub2ApiAdminPluginCompatibility _compatibility(Map<String, Object?> source) =>
    Sub2ApiAdminPluginCompatibility(
      compatible: _bool(source['compatible']),
      tested: _bool(source['tested']),
      status: _requiredText(source['status']),
      message: _text(source['message']),
      currentSub2apiVersion: _requiredText(source['current_sub2api_version']),
      requiredSub2apiVersion: _requiredText(source['required_sub2api_version']),
      recommendedSub2apiVersion: _text(source['recommended_sub2api_version']),
      pluginProtocol: _positiveInt(source['plugin_protocol']),
      transportApi: _positiveInt(source['transport_api']),
      uiBridge: _nonNegativeInt(source['ui_bridge']),
    );

Sub2ApiAdminPluginState _state(String value) => switch (value) {
  'disabled' => Sub2ApiAdminPluginState.disabled,
  'starting' => Sub2ApiAdminPluginState.starting,
  'enabled' => Sub2ApiAdminPluginState.enabled,
  'error' => Sub2ApiAdminPluginState.error,
  'incompatible' => Sub2ApiAdminPluginState.incompatible,
  _ => throw const FormatException(),
};

Sub2ApiAdminPluginSignatureStatus _signature(String value) => switch (value) {
  'trusted' => Sub2ApiAdminPluginSignatureStatus.trusted,
  'unsigned' => Sub2ApiAdminPluginSignatureStatus.unsigned,
  _ => throw const FormatException(),
};

Sub2ApiAdminPluginRelativePath _path(Object? value) {
  final path = _requiredText(value).replaceAll('\\', '/');
  if (path.startsWith('/') ||
      path.split('/').any((segment) => segment.isEmpty || segment == '..')) {
    throw const FormatException();
  }
  return Sub2ApiAdminPluginRelativePath(path);
}

String _sha256(Object? value) {
  final hash = _requiredText(value).toLowerCase();
  if (!RegExp(r'^[0-9a-f]{64}$').hasMatch(hash)) {
    throw const FormatException();
  }
  return hash;
}

Sub2ApiAdminJsonObject _jsonObject(Object? value) {
  final source = _object(value);
  return Sub2ApiAdminJsonObject(
    source.map((key, item) => MapEntry(key, _jsonValue(item))),
  );
}

Sub2ApiAdminJsonValue _jsonValue(Object? value) {
  if (value == null) return const Sub2ApiAdminJsonNull();
  if (value is bool) return Sub2ApiAdminJsonBool(value);
  if (value is num) {
    return Sub2ApiAdminJsonNumber(Sub2ApiDecimal.fromJson(value));
  }
  if (value is String) return Sub2ApiAdminJsonString(value);
  if (value is List) {
    return Sub2ApiAdminJsonArray(value.map(_jsonValue).toList(growable: false));
  }
  if (value is Map) return _jsonObject(value);
  throw const FormatException();
}

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

List<Object?> _list(Object? value) {
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

List<String> _stringList(Object? value) {
  if (value == null) return const [];
  return _list(value).map(_requiredText).toList(growable: false);
}

String _text(Object? value) {
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

String _requiredText(Object? value) {
  final text = _text(value);
  if (text.trim().isEmpty) throw const FormatException();
  return text;
}

bool _bool(Object? value) {
  if (value is! bool) throw const FormatException();
  return value;
}

int _positiveInt(Object? value) {
  if (value is! int || value <= 0) throw const FormatException();
  return value;
}

int _nonNegativeInt(Object? value) {
  if (value is! int || value < 0) throw const FormatException();
  return value;
}

int? _optionalPositiveInt(Object? value) =>
    value == null ? null : _positiveInt(value);

DateTime _date(Object? value) => DateTime.parse(_requiredText(value)).toUtc();

DateTime? _optionalDate(Object? value) => value == null ? null : _date(value);

T _guard<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_plugin_response',
  retryable: false,
);
