import '../shared/models/sensitive_value.dart';

enum Sub2ApiAdminDataSourceType { postgres, redis }

enum Sub2ApiAdminDataBackupType { postgres, redis, full }

final class Sub2ApiAdminDataAgentInfo {
  const Sub2ApiAdminDataAgentInfo({
    required this.status,
    required this.version,
    required this.uptime,
  });
  final String status;
  final String version;
  final Duration uptime;
}

final class Sub2ApiAdminDataAgentHealth {
  const Sub2ApiAdminDataAgentHealth({
    required this.enabled,
    required this.reason,
    required this.socketPath,
    this.agent,
  });
  final bool enabled;
  final String reason;
  final Sub2ApiAdminDataManagementPath socketPath;
  final Sub2ApiAdminDataAgentInfo? agent;
}

final class Sub2ApiAdminDataSourceConfig {
  const Sub2ApiAdminDataSourceConfig({
    this.host = '',
    this.port = 0,
    this.user = '',
    this.password,
    this.database = '',
    this.sslMode = '',
    this.address = '',
    this.username = '',
    this.databaseIndex = 0,
    this.containerName = '',
  });
  final String host;
  final int port;
  final String user;
  final Sub2ApiAdminCredentialSecret? password;
  final String database;
  final String sslMode;
  final String address;
  final String username;
  final int databaseIndex;
  final String containerName;
}

final class Sub2ApiAdminDataSourceProfile {
  const Sub2ApiAdminDataSourceProfile({
    required this.sourceType,
    required this.profileId,
    required this.name,
    required this.isActive,
    required this.config,
    required this.passwordConfigured,
    this.createdAt,
    this.updatedAt,
  });
  final Sub2ApiAdminDataSourceType sourceType;
  final String profileId;
  final String name;
  final bool isActive;
  final Sub2ApiAdminDataSourceConfig config;
  final bool passwordConfigured;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}

final class Sub2ApiAdminDataSourceProfileInput {
  const Sub2ApiAdminDataSourceProfileInput({
    required this.profileId,
    required this.name,
    required this.config,
    this.setActive = false,
  });
  final String profileId;
  final String name;
  final Sub2ApiAdminDataSourceConfig config;
  final bool setActive;
}

final class Sub2ApiAdminDataS3Config {
  const Sub2ApiAdminDataS3Config({
    required this.enabled,
    this.endpoint,
    required this.region,
    required this.bucket,
    this.accessKeyId,
    this.secretAccessKey,
    required this.secretConfigured,
    required this.prefix,
    required this.forcePathStyle,
    required this.useSsl,
  });
  final bool enabled;
  final Uri? endpoint;
  final String region;
  final String bucket;
  final Sub2ApiAdminBackupAccessKeyId? accessKeyId;
  final Sub2ApiAdminBackupSecretAccessKey? secretAccessKey;
  final bool secretConfigured;
  final String prefix;
  final bool forcePathStyle;
  final bool useSsl;
}

final class Sub2ApiAdminDataS3Profile {
  const Sub2ApiAdminDataS3Profile({
    required this.profileId,
    required this.name,
    required this.isActive,
    required this.s3,
    required this.secretConfigured,
    this.createdAt,
    this.updatedAt,
  });
  final String profileId;
  final String name;
  final bool isActive;
  final Sub2ApiAdminDataS3Config s3;
  final bool secretConfigured;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}

final class Sub2ApiAdminDataS3ProfileInput {
  const Sub2ApiAdminDataS3ProfileInput({
    required this.profileId,
    required this.name,
    required this.s3,
    this.setActive = false,
  });
  final String profileId;
  final String name;
  final Sub2ApiAdminDataS3Config s3;
  final bool setActive;
}

final class Sub2ApiAdminDataConfig {
  const Sub2ApiAdminDataConfig({
    required this.sourceMode,
    required this.backupRoot,
    this.sqlitePath,
    required this.retentionDays,
    required this.keepLast,
    required this.activePostgresProfileId,
    required this.activeRedisProfileId,
    required this.postgres,
    required this.redis,
    required this.s3,
    required this.activeS3ProfileId,
  });
  final String sourceMode;
  final Sub2ApiAdminDataManagementPath backupRoot;
  final Sub2ApiAdminDataManagementPath? sqlitePath;
  final int retentionDays;
  final int keepLast;
  final String activePostgresProfileId;
  final String activeRedisProfileId;
  final Sub2ApiAdminDataSourceConfig postgres;
  final Sub2ApiAdminDataSourceConfig redis;
  final Sub2ApiAdminDataS3Config s3;
  final String activeS3ProfileId;
}

final class Sub2ApiAdminDataArtifact {
  const Sub2ApiAdminDataArtifact({
    required this.localPath,
    required this.sizeBytes,
    required this.sha256,
  });
  final Sub2ApiAdminDataManagementPath localPath;
  final int sizeBytes;
  final String sha256;
}

final class Sub2ApiAdminDataS3Object {
  const Sub2ApiAdminDataS3Object({
    required this.bucket,
    required this.objectKey,
    required this.etag,
  });
  final String bucket;
  final Sub2ApiAdminBackupObjectKey objectKey;
  final String etag;
}

final class Sub2ApiAdminDataBackupJob {
  const Sub2ApiAdminDataBackupJob({
    required this.jobId,
    required this.backupType,
    required this.status,
    required this.triggeredBy,
    required this.idempotencyKey,
    required this.uploadToS3,
    required this.s3ProfileId,
    required this.postgresProfileId,
    required this.redisProfileId,
    this.startedAt,
    this.finishedAt,
    required this.errorMessage,
    required this.artifact,
    required this.s3Object,
  });
  final String jobId;
  final Sub2ApiAdminDataBackupType backupType;
  final String status;
  final String triggeredBy;
  final String idempotencyKey;
  final bool uploadToS3;
  final String s3ProfileId;
  final String postgresProfileId;
  final String redisProfileId;
  final DateTime? startedAt;
  final DateTime? finishedAt;
  final Sub2ApiAdminOpsErrorContent errorMessage;
  final Sub2ApiAdminDataArtifact artifact;
  final Sub2ApiAdminDataS3Object s3Object;
}

final class Sub2ApiAdminDataBackupJobRequest {
  const Sub2ApiAdminDataBackupJobRequest({
    required this.backupType,
    required this.uploadToS3,
    this.s3ProfileId = '',
    this.postgresProfileId = '',
    this.redisProfileId = '',
    required this.idempotencyKey,
  });
  final Sub2ApiAdminDataBackupType backupType;
  final bool uploadToS3;
  final String s3ProfileId;
  final String postgresProfileId;
  final String redisProfileId;
  final String idempotencyKey;
}

final class Sub2ApiAdminDataBackupJobCreated {
  const Sub2ApiAdminDataBackupJobCreated({
    required this.jobId,
    required this.status,
  });
  final String jobId;
  final String status;
}

final class Sub2ApiAdminDataBackupJobPage {
  Sub2ApiAdminDataBackupJobPage({
    required List<Sub2ApiAdminDataBackupJob> items,
    required this.nextPageToken,
  }) : items = List.unmodifiable(items);
  final List<Sub2ApiAdminDataBackupJob> items;
  final String nextPageToken;
}

final class Sub2ApiAdminDataBackupJobQuery {
  const Sub2ApiAdminDataBackupJobQuery({
    this.pageSize = 20,
    this.pageToken = '',
    this.status = '',
    this.backupType,
  });
  final int pageSize;
  final String pageToken;
  final String status;
  final Sub2ApiAdminDataBackupType? backupType;
}

final class Sub2ApiAdminDataMutationResult {
  const Sub2ApiAdminDataMutationResult({required this.ok});
  final bool ok;
}

final class Sub2ApiAdminDataConnectionResult {
  const Sub2ApiAdminDataConnectionResult({
    required this.ok,
    required this.message,
  });
  final bool ok;
  final Sub2ApiAdminOpsErrorContent message;
}
