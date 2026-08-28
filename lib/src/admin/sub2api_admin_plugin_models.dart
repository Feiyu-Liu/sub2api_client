import 'dart:typed_data';

import '../shared/models/sensitive_value.dart';
import 'sub2api_admin_user_models.dart';

enum Sub2ApiAdminPluginState {
  disabled,
  starting,
  enabled,
  error,
  incompatible,
}

enum Sub2ApiAdminPluginSignatureStatus { trusted, unsigned }

final class Sub2ApiAdminPluginRelativePath {
  const Sub2ApiAdminPluginRelativePath(this.value);
  final String value;
}

final class Sub2ApiAdminPluginPackage {
  Sub2ApiAdminPluginPackage({required this.filename, required Uint8List bytes})
    : bytes = Uint8List.fromList(bytes);
  final String filename;
  final Uint8List bytes;
  @override
  String toString() =>
      'Sub2ApiAdminPluginPackage($filename, ${bytes.length} bytes)';
}

final class Sub2ApiAdminPluginRequirements {
  Sub2ApiAdminPluginRequirements({
    required this.sub2api,
    required this.recommendedSub2apiVersion,
    required List<String> testedSub2apiVersions,
    required this.pluginProtocol,
    required this.transportApi,
    required this.uiBridge,
  }) : testedSub2apiVersions = List.unmodifiable(testedSub2apiVersions);
  final String sub2api;
  final String recommendedSub2apiVersion;
  final List<String> testedSub2apiVersions;
  final int pluginProtocol;
  final int transportApi;
  final int uiBridge;
}

final class Sub2ApiAdminPluginCapability {
  const Sub2ApiAdminPluginCapability({
    required this.id,
    required this.platform,
    required this.accountType,
  });
  final String id;
  final String platform;
  final String accountType;
}

final class Sub2ApiAdminPluginFileDigest {
  const Sub2ApiAdminPluginFileDigest({
    required this.path,
    required this.sha256,
  });
  final Sub2ApiAdminPluginRelativePath path;
  final String sha256;
}

final class Sub2ApiAdminPluginManifest {
  Sub2ApiAdminPluginManifest({
    required this.schemaVersion,
    required this.id,
    required this.name,
    required this.version,
    required this.description,
    required this.author,
    required this.requires,
    required List<Sub2ApiAdminPluginCapability> capabilities,
    required Map<String, Sub2ApiAdminPluginRelativePath> runtimes,
    required this.uiEntrypoint,
    required List<Sub2ApiAdminPluginFileDigest> files,
  }) : capabilities = List.unmodifiable(capabilities),
       runtimes = Map.unmodifiable(runtimes),
       files = List.unmodifiable(files);
  final int schemaVersion;
  final String id;
  final String name;
  final String version;
  final String description;
  final String author;
  final Sub2ApiAdminPluginRequirements requires;
  final List<Sub2ApiAdminPluginCapability> capabilities;
  final Map<String, Sub2ApiAdminPluginRelativePath> runtimes;
  final Sub2ApiAdminPluginRelativePath? uiEntrypoint;
  final List<Sub2ApiAdminPluginFileDigest> files;
}

final class Sub2ApiAdminPluginCompatibility {
  const Sub2ApiAdminPluginCompatibility({
    required this.compatible,
    required this.tested,
    required this.status,
    required this.message,
    required this.currentSub2apiVersion,
    required this.requiredSub2apiVersion,
    required this.recommendedSub2apiVersion,
    required this.pluginProtocol,
    required this.transportApi,
    required this.uiBridge,
  });
  final bool compatible;
  final bool tested;
  final String status;
  final String message;
  final String currentSub2apiVersion;
  final String requiredSub2apiVersion;
  final String recommendedSub2apiVersion;
  final int pluginProtocol;
  final int transportApi;
  final int uiBridge;
}

final class Sub2ApiAdminPluginBinding {
  const Sub2ApiAdminPluginBinding({
    required this.id,
    required this.pluginId,
    required this.capability,
    required this.platform,
    required this.accountType,
    required this.enabled,
    required this.rolloutPercent,
    required this.createdAt,
    required this.updatedAt,
  });
  final int id;
  final int pluginId;
  final String capability;
  final String platform;
  final String accountType;
  final bool enabled;
  final int rolloutPercent;
  final DateTime createdAt;
  final DateTime updatedAt;
}

final class Sub2ApiAdminPlugin {
  Sub2ApiAdminPlugin({
    required this.id,
    required this.pluginKey,
    required this.name,
    required this.version,
    required this.description,
    required this.author,
    required this.manifest,
    required this.binarySha256,
    required this.signatureStatus,
    required this.state,
    required this.lastError,
    required this.installedBy,
    required this.installedAt,
    required this.enabledAt,
    required this.updatedAt,
    required List<Sub2ApiAdminPluginBinding> bindings,
    required this.compatibility,
    required this.runtimeHealthy,
    required this.runtimeMessage,
  }) : bindings = List.unmodifiable(bindings);
  final int id;
  final String pluginKey;
  final String name;
  final String version;
  final String description;
  final String author;
  final Sub2ApiAdminPluginManifest manifest;
  final String binarySha256;
  final Sub2ApiAdminPluginSignatureStatus signatureStatus;
  final Sub2ApiAdminPluginState state;
  final String lastError;
  final int? installedBy;
  final DateTime installedAt;
  final DateTime? enabledAt;
  final DateTime updatedAt;
  final List<Sub2ApiAdminPluginBinding> bindings;
  final Sub2ApiAdminPluginCompatibility compatibility;
  final bool runtimeHealthy;
  final String runtimeMessage;
}

final class Sub2ApiAdminEnablePluginRequest {
  const Sub2ApiAdminEnablePluginRequest({
    this.acceptUntested = false,
    this.rolloutPercent = 100,
  });
  final bool acceptUntested;
  final int rolloutPercent;
}

final class Sub2ApiAdminPluginConfig {
  const Sub2ApiAdminPluginConfig._(this._value);
  factory Sub2ApiAdminPluginConfig(Sub2ApiAdminJsonObject value) =>
      Sub2ApiAdminPluginConfig._(value);
  final Sub2ApiAdminJsonObject _value;
  Sub2ApiAdminJsonObject reveal() => _value;
  @override
  String toString() => '<redacted-plugin-config>';
}

final class Sub2ApiAdminPluginTestResult {
  const Sub2ApiAdminPluginTestResult({
    required this.success,
    required this.message,
    required this.latency,
  });
  final bool success;
  final String message;
  final Duration latency;
}

final class Sub2ApiAdminPluginDeleteResult {
  const Sub2ApiAdminPluginDeleteResult({required this.message});
  final String message;
}

final class Sub2ApiAdminPluginUiSession {
  const Sub2ApiAdminPluginUiSession({
    required this.url,
    required this.bridgeToken,
    required this.uiBridgeVersion,
    required this.expiresAt,
  });
  final Sub2ApiAdminPluginUiUrl url;
  final Sub2ApiAdminPluginBridgeToken bridgeToken;
  final int uiBridgeVersion;
  final DateTime expiresAt;
}
