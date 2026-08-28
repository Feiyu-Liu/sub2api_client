import '../shared/models/sensitive_value.dart';

final class Sub2ApiAdminBackupS3Config {
  const Sub2ApiAdminBackupS3Config({
    this.endpoint,
    required this.region,
    required this.bucket,
    this.accessKeyId,
    required this.prefix,
    required this.forcePathStyle,
  });

  final Uri? endpoint;
  final String region;
  final String bucket;
  final Sub2ApiAdminBackupAccessKeyId? accessKeyId;
  final String prefix;
  final bool forcePathStyle;
}

final class Sub2ApiAdminBackupS3ConfigInput {
  const Sub2ApiAdminBackupS3ConfigInput({
    this.endpoint,
    required this.region,
    required this.bucket,
    required this.accessKeyId,
    this.secretAccessKey,
    required this.prefix,
    required this.forcePathStyle,
  });

  final Uri? endpoint;
  final String region;
  final String bucket;
  final Sub2ApiAdminBackupAccessKeyId accessKeyId;
  final Sub2ApiAdminBackupSecretAccessKey? secretAccessKey;
  final String prefix;
  final bool forcePathStyle;
}

final class Sub2ApiAdminBackupConnectionResult {
  const Sub2ApiAdminBackupConnectionResult({
    required this.ok,
    required this.message,
  });

  final bool ok;
  final Sub2ApiAdminOpsErrorContent message;
}

final class Sub2ApiAdminImageStorageSettings {
  const Sub2ApiAdminImageStorageSettings({
    required this.enabled,
    required this.reuseBackupS3,
    required this.bucket,
    required this.prefix,
    this.publicBaseUrl,
    required this.presignExpiryHours,
    required this.maxDownloadBytes,
    this.endpoint,
    required this.region,
    this.accessKeyId,
    required this.forcePathStyle,
  });

  final bool enabled;
  final bool reuseBackupS3;
  final String bucket;
  final String prefix;
  final Uri? publicBaseUrl;
  final int presignExpiryHours;
  final int maxDownloadBytes;
  final Uri? endpoint;
  final String region;
  final Sub2ApiAdminBackupAccessKeyId? accessKeyId;
  final bool forcePathStyle;
}

final class Sub2ApiAdminImageStorageSettingsInput {
  const Sub2ApiAdminImageStorageSettingsInput({
    required this.enabled,
    required this.reuseBackupS3,
    required this.bucket,
    required this.prefix,
    this.publicBaseUrl,
    required this.presignExpiryHours,
    required this.maxDownloadBytes,
    this.endpoint,
    required this.region,
    this.accessKeyId,
    this.secretAccessKey,
    required this.forcePathStyle,
  });

  final bool enabled;
  final bool reuseBackupS3;
  final String bucket;
  final String prefix;
  final Uri? publicBaseUrl;
  final int presignExpiryHours;
  final int maxDownloadBytes;
  final Uri? endpoint;
  final String region;
  final Sub2ApiAdminBackupAccessKeyId? accessKeyId;
  final Sub2ApiAdminBackupSecretAccessKey? secretAccessKey;
  final bool forcePathStyle;
}

final class Sub2ApiAdminImageStorageSnapshot {
  const Sub2ApiAdminImageStorageSnapshot({
    required this.settings,
    required this.secretConfigured,
  });

  final Sub2ApiAdminImageStorageSettings settings;
  final bool secretConfigured;
}

final class Sub2ApiAdminBackupSchedule {
  const Sub2ApiAdminBackupSchedule({
    required this.enabled,
    required this.cronExpression,
    required this.retainDays,
    required this.retainCount,
  });

  final bool enabled;
  final String cronExpression;
  final int retainDays;
  final int retainCount;
}

enum Sub2ApiAdminBackupStatus { pending, running, completed, failed }

enum Sub2ApiAdminBackupTrigger { manual, scheduled }

enum Sub2ApiAdminBackupRestoreStatus { running, completed, failed }

final class Sub2ApiAdminBackupPart {
  const Sub2ApiAdminBackupPart({
    required this.index,
    required this.objectKey,
    required this.sizeBytes,
    required this.sha256,
  });

  final int index;
  final Sub2ApiAdminBackupObjectKey objectKey;
  final int sizeBytes;
  final String sha256;
}

final class Sub2ApiAdminBackupRecord {
  Sub2ApiAdminBackupRecord({
    required this.id,
    required this.status,
    required this.backupType,
    required this.fileName,
    this.objectKey,
    List<Sub2ApiAdminBackupPart> parts = const <Sub2ApiAdminBackupPart>[],
    required this.sizeBytes,
    required this.triggeredBy,
    required this.errorMessage,
    required this.startedAt,
    this.finishedAt,
    this.expiresAt,
    required this.progress,
    this.restoreStatus,
    required this.restoreError,
    this.restoredAt,
  }) : parts = List.unmodifiable(parts);

  final String id;
  final Sub2ApiAdminBackupStatus status;
  final String backupType;
  final String fileName;
  final Sub2ApiAdminBackupObjectKey? objectKey;
  final List<Sub2ApiAdminBackupPart> parts;
  final int sizeBytes;
  final Sub2ApiAdminBackupTrigger triggeredBy;
  final Sub2ApiAdminOpsErrorContent errorMessage;
  final DateTime startedAt;
  final DateTime? finishedAt;
  final DateTime? expiresAt;
  final String progress;
  final Sub2ApiAdminBackupRestoreStatus? restoreStatus;
  final Sub2ApiAdminOpsErrorContent restoreError;
  final DateTime? restoredAt;
}

final class Sub2ApiAdminBackupMutationResult {
  const Sub2ApiAdminBackupMutationResult({required this.ok});

  final bool ok;
}

final class Sub2ApiAdminBackupDownloadPart {
  const Sub2ApiAdminBackupDownloadPart({
    required this.index,
    required this.sizeBytes,
    required this.url,
  });

  final int index;
  final int sizeBytes;
  final Sub2ApiAdminBackupDownloadUrl url;
}

final class Sub2ApiAdminBackupDownload {
  Sub2ApiAdminBackupDownload({
    this.url,
    List<Sub2ApiAdminBackupDownloadPart> parts =
        const <Sub2ApiAdminBackupDownloadPart>[],
  }) : parts = List.unmodifiable(parts);

  final Sub2ApiAdminBackupDownloadUrl? url;
  final List<Sub2ApiAdminBackupDownloadPart> parts;
}
