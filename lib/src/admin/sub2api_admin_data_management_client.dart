import 'package:dio/dio.dart';
import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_data_management_models.dart';
import 'wire/admin_data_management_wire_mapper.dart';
import 'wire/admin_data_management_wire_service.dart';

abstract interface class Sub2ApiAdminDataManagementClient {
  Future<Sub2ApiAdminDataAgentHealth> getAgentHealth({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDataConfig> getConfig({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDataConfig> updateConfig(
    Sub2ApiAdminDataConfig x, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<List<Sub2ApiAdminDataSourceProfile>> listSourceProfiles(
    Sub2ApiAdminDataSourceType type, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDataSourceProfile> createSourceProfile(
    Sub2ApiAdminDataSourceType type,
    Sub2ApiAdminDataSourceProfileInput x, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDataSourceProfile> updateSourceProfile(
    Sub2ApiAdminDataSourceType type,
    Sub2ApiAdminDataSourceProfileInput x, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDataMutationResult> deleteSourceProfile(
    Sub2ApiAdminDataSourceType type,
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDataSourceProfile> activateSourceProfile(
    Sub2ApiAdminDataSourceType type,
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDataConnectionResult> testS3(
    Sub2ApiAdminDataS3Config s3, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<List<Sub2ApiAdminDataS3Profile>> listS3Profiles({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDataS3Profile> createS3Profile(
    Sub2ApiAdminDataS3ProfileInput x, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDataS3Profile> updateS3Profile(
    Sub2ApiAdminDataS3ProfileInput x, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDataMutationResult> deleteS3Profile(
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDataS3Profile> activateS3Profile(
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDataBackupJobCreated> createBackupJob(
    Sub2ApiAdminDataBackupJobRequest x, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDataBackupJobPage> listBackupJobs({
    Sub2ApiAdminDataBackupJobQuery query =
        const Sub2ApiAdminDataBackupJobQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminDataBackupJob> getBackupJob(
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminDataManagementClient createSub2ApiAdminDataManagementClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _C(dio, requestExecutor, credentialMode);

final class _C implements Sub2ApiAdminDataManagementClient {
  _C(Dio d, this.e, this.m) : s = AdminDataManagementWireService(d);
  final Sub2ApiRequestExecutor e;
  final Sub2ApiAdminCredentialMode m;
  final AdminDataManagementWireService s;
  String? a(String? v) => m == Sub2ApiAdminCredentialMode.jwt ? v : null;
  String? k(String? v) => m == Sub2ApiAdminCredentialMode.apiKey ? v : null;
  @override
  Future<Sub2ApiAdminDataAgentHealth> getAgentHealth({
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedRequest(
    send: (c, o, v) => s.health(c, o, a(v), k(v)),
    decode: mapDataHealth,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminDataConfig> getConfig({
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedRequest(
    send: (c, o, v) => s.getConfig(c, o, a(v), k(v)),
    decode: mapDataConfig,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminDataConfig> updateConfig(
    Sub2ApiAdminDataConfig x, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) => s.updateConfig(_config(x), c, o, a(v), k(v)),
    decode: mapDataConfig,
    requestOptions: requestOptions,
  );
  @override
  Future<List<Sub2ApiAdminDataSourceProfile>> listSourceProfiles(
    Sub2ApiAdminDataSourceType t, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedRequest(
    send: (c, o, v) => s.listSources(t.name, c, o, a(v), k(v)),
    decode: mapDataSources,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminDataSourceProfile> createSourceProfile(
    Sub2ApiAdminDataSourceType t,
    Sub2ApiAdminDataSourceProfileInput x, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) =>
        s.createSource(t.name, _source(x, true), c, o, a(v), k(v)),
    decode: mapDataSource,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminDataSourceProfile> updateSourceProfile(
    Sub2ApiAdminDataSourceType t,
    Sub2ApiAdminDataSourceProfileInput x, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) => s.updateSource(
      t.name,
      _id(x.profileId),
      _source(x, false),
      c,
      o,
      a(v),
      k(v),
    ),
    decode: mapDataSource,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminDataMutationResult> deleteSourceProfile(
    Sub2ApiAdminDataSourceType t,
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) => s.deleteSource(t.name, _id(id), c, o, a(v), k(v)),
    decode: mapDataDeleted,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminDataSourceProfile> activateSourceProfile(
    Sub2ApiAdminDataSourceType t,
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) => s.activateSource(t.name, _id(id), c, o, a(v), k(v)),
    decode: mapDataSource,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminDataConnectionResult> testS3(
    Sub2ApiAdminDataS3Config x, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) => s.testS3(_s3(x), c, o, a(v), k(v)),
    decode: mapDataConnection,
    requestOptions: requestOptions,
  );
  @override
  Future<List<Sub2ApiAdminDataS3Profile>> listS3Profiles({
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedRequest(
    send: (c, o, v) => s.listS3(c, o, a(v), k(v)),
    decode: mapDataS3Profiles,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminDataS3Profile> createS3Profile(
    Sub2ApiAdminDataS3ProfileInput x, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) => s.createS3(_s3Profile(x, true), c, o, a(v), k(v)),
    decode: mapDataS3Profile,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminDataS3Profile> updateS3Profile(
    Sub2ApiAdminDataS3ProfileInput x, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) =>
        s.updateS3(_id(x.profileId), _s3Profile(x, false), c, o, a(v), k(v)),
    decode: mapDataS3Profile,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminDataMutationResult> deleteS3Profile(
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) => s.deleteS3(_id(id), c, o, a(v), k(v)),
    decode: mapDataDeleted,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminDataS3Profile> activateS3Profile(
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) => s.activateS3(_id(id), c, o, a(v), k(v)),
    decode: mapDataS3Profile,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminDataBackupJobCreated> createBackupJob(
    Sub2ApiAdminDataBackupJobRequest x, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final key = _id(x.idempotencyKey);
    return e.protectedNonReplayableRequest(
      send: (c, o, v) => s.createBackup(
        key,
        {
          'backup_type': x.backupType.name,
          'upload_to_s3': x.uploadToS3,
          's3_profile_id': x.s3ProfileId.trim(),
          'postgres_profile_id': x.postgresProfileId.trim(),
          'redis_profile_id': x.redisProfileId.trim(),
          'idempotency_key': key,
        },
        c,
        o,
        a(v),
        k(v),
      ),
      decode: mapDataBackupCreated,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminDataBackupJobPage> listBackupJobs({
    Sub2ApiAdminDataBackupJobQuery query =
        const Sub2ApiAdminDataBackupJobQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (query.pageSize < 1) throw _v('admin.data.invalid_page_size');
    return e.protectedRequest(
      send: (c, o, v) => s.listBackups(
        {
          'page_size': query.pageSize,
          'page_token': query.pageToken.trim(),
          'status': query.status.trim(),
          'backup_type': query.backupType?.name,
        },
        c,
        o,
        a(v),
        k(v),
      ),
      decode: mapDataBackupPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminDataBackupJob> getBackupJob(
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedRequest(
    send: (c, o, v) => s.getBackup(_id(id), c, o, a(v), k(v)),
    decode: mapDataBackupJob,
    requestOptions: requestOptions,
  );
}

Map<String, Object?> _source(
  Sub2ApiAdminDataSourceProfileInput x,
  bool create,
) => {
  'profile_id': ?create ? _id(x.profileId) : null,
  'name': _id(x.name),
  'config': _sourceConfig(x.config),
  'set_active': ?create ? x.setActive : null,
};
Map<String, Object?> _sourceConfig(Sub2ApiAdminDataSourceConfig x) => {
  'host': x.host.trim(),
  'port': x.port,
  'user': x.user.trim(),
  'password': x.password?.reveal() ?? '',
  'database': x.database.trim(),
  'ssl_mode': x.sslMode.trim(),
  'addr': x.address.trim(),
  'username': x.username.trim(),
  'db': x.databaseIndex,
  'container_name': x.containerName.trim(),
};
Map<String, Object?> _s3(Sub2ApiAdminDataS3Config x) => {
  'enabled': x.enabled,
  'endpoint': x.endpoint?.toString() ?? '',
  'region': x.region.trim(),
  'bucket': x.bucket.trim(),
  'access_key_id': x.accessKeyId?.reveal() ?? '',
  'secret_access_key': x.secretAccessKey?.reveal() ?? '',
  'prefix': x.prefix.trim(),
  'force_path_style': x.forcePathStyle,
  'use_ssl': x.useSsl,
};
Map<String, Object?> _s3Profile(
  Sub2ApiAdminDataS3ProfileInput x,
  bool create,
) => {
  'profile_id': ?create ? _id(x.profileId) : null,
  'name': _id(x.name),
  ..._s3(x.s3),
  'set_active': ?create ? x.setActive : null,
};
Map<String, Object?> _config(Sub2ApiAdminDataConfig x) => {
  'source_mode': x.sourceMode.trim(),
  'backup_root': x.backupRoot.reveal(),
  'sqlite_path': x.sqlitePath?.reveal() ?? '',
  'retention_days': x.retentionDays,
  'keep_last': x.keepLast,
  'active_postgres_profile_id': x.activePostgresProfileId,
  'active_redis_profile_id': x.activeRedisProfileId,
  'postgres': _sourceConfig(x.postgres),
  'redis': _sourceConfig(x.redis),
  's3': _s3(x.s3),
  'active_s3_profile_id': x.activeS3ProfileId,
};
String _id(String x) {
  final v = x.trim();
  if (v.isEmpty) throw _v('admin.data.invalid_id');
  return v;
}

Sub2ApiException _v(String c) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: c,
  retryable: false,
);
