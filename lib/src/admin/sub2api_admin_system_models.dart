final class Sub2ApiAdminSystemVersion {
  const Sub2ApiAdminSystemVersion(this.value);
  final String value;
}

enum Sub2ApiAdminSystemBuildType { source, release }

final class Sub2ApiAdminSystemReleaseAsset {
  const Sub2ApiAdminSystemReleaseAsset({
    required this.name,
    required this.downloadUrl,
    required this.sizeBytes,
  });
  final String name;
  final Uri downloadUrl;
  final int sizeBytes;
}

final class Sub2ApiAdminSystemReleaseInfo {
  Sub2ApiAdminSystemReleaseInfo({
    required this.name,
    required this.body,
    required this.publishedAt,
    required this.htmlUrl,
    required List<Sub2ApiAdminSystemReleaseAsset> assets,
  }) : assets = List.unmodifiable(assets);
  final String name;
  final String body;
  final DateTime publishedAt;
  final Uri htmlUrl;
  final List<Sub2ApiAdminSystemReleaseAsset> assets;
}

final class Sub2ApiAdminSystemUpdateInfo {
  const Sub2ApiAdminSystemUpdateInfo({
    required this.currentVersion,
    required this.latestVersion,
    required this.hasUpdate,
    required this.releaseInfo,
    required this.cached,
    required this.warning,
    required this.buildType,
  });
  final String currentVersion;
  final String latestVersion;
  final bool hasUpdate;
  final Sub2ApiAdminSystemReleaseInfo? releaseInfo;
  final bool cached;
  final String warning;
  final Sub2ApiAdminSystemBuildType buildType;
}

final class Sub2ApiAdminSystemRollbackVersion {
  const Sub2ApiAdminSystemRollbackVersion({
    required this.version,
    required this.publishedAt,
    required this.htmlUrl,
  });
  final String version;
  final DateTime publishedAt;
  final Uri htmlUrl;
}

final class Sub2ApiAdminSystemOperationRequest {
  const Sub2ApiAdminSystemOperationRequest({required this.idempotencyKey});
  final String idempotencyKey;
}

final class Sub2ApiAdminSystemRollbackRequest {
  const Sub2ApiAdminSystemRollbackRequest({
    required this.idempotencyKey,
    this.version,
  });
  final String idempotencyKey;
  final String? version;
}

sealed class Sub2ApiAdminSystemUpdateResult {
  const Sub2ApiAdminSystemUpdateResult({
    required this.message,
    required this.operationId,
  });
  final String message;
  final String operationId;
}

final class Sub2ApiAdminSystemUpdated extends Sub2ApiAdminSystemUpdateResult {
  const Sub2ApiAdminSystemUpdated({
    required super.message,
    required super.operationId,
    required this.needRestart,
  });
  final bool needRestart;
}

final class Sub2ApiAdminSystemAlreadyCurrent
    extends Sub2ApiAdminSystemUpdateResult {
  const Sub2ApiAdminSystemAlreadyCurrent({
    required super.message,
    required super.operationId,
    required this.currentVersion,
    required this.latestVersion,
  });
  final String currentVersion;
  final String latestVersion;
}

final class Sub2ApiAdminSystemRollbackResult {
  const Sub2ApiAdminSystemRollbackResult({
    required this.message,
    required this.needRestart,
    required this.version,
    required this.operationId,
  });
  final String message;
  final bool needRestart;
  final String? version;
  final String operationId;
}

final class Sub2ApiAdminSystemRestartResult {
  const Sub2ApiAdminSystemRestartResult({
    required this.message,
    required this.operationId,
  });
  final String message;
  final String operationId;
}
