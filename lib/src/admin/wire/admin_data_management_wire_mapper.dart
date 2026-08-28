import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../sub2api_admin_data_management_models.dart';

Sub2ApiAdminDataAgentHealth mapDataHealth(Object? d) => _g(() {
  final s = _o(d), a = s['agent'] == null ? null : _o(s['agent']);
  return Sub2ApiAdminDataAgentHealth(
    enabled: _b(s['enabled']),
    reason: _t(s['reason']),
    socketPath: Sub2ApiAdminDataManagementPath(_t(s['socket_path'])),
    agent: a == null
        ? null
        : Sub2ApiAdminDataAgentInfo(
            status: _t(a['status']),
            version: _t(a['version']),
            uptime: Duration(seconds: _nn(a['uptime_seconds'])),
          ),
  );
});
Sub2ApiAdminDataConfig mapDataConfig(Object? d) => _g(() => _config(d));
List<Sub2ApiAdminDataSourceProfile> mapDataSources(Object? d) =>
    _g(() => _l(_o(d)['items']).map(_source).toList(growable: false));
Sub2ApiAdminDataSourceProfile mapDataSource(Object? d) => _g(() => _source(d));
List<Sub2ApiAdminDataS3Profile> mapDataS3Profiles(Object? d) =>
    _g(() => _l(_o(d)['items']).map(_s3p).toList(growable: false));
Sub2ApiAdminDataS3Profile mapDataS3Profile(Object? d) => _g(() => _s3p(d));
Sub2ApiAdminDataMutationResult mapDataDeleted(Object? d) =>
    _g(() => Sub2ApiAdminDataMutationResult(ok: _b(_o(d)['deleted'])));
Sub2ApiAdminDataConnectionResult mapDataConnection(Object? d) => _g(() {
  final s = _o(d);
  return Sub2ApiAdminDataConnectionResult(
    ok: _b(s['ok']),
    message: Sub2ApiAdminOpsErrorContent(_t(s['message'])),
  );
});
Sub2ApiAdminDataBackupJobCreated mapDataBackupCreated(Object? d) => _g(() {
  final s = _o(d);
  return Sub2ApiAdminDataBackupJobCreated(
    jobId: _r(s['job_id']),
    status: _r(s['status']),
  );
});
Sub2ApiAdminDataBackupJobPage mapDataBackupPage(Object? d) => _g(() {
  final s = _o(d);
  return Sub2ApiAdminDataBackupJobPage(
    items: _l(s['items']).map(_job).toList(growable: false),
    nextPageToken: _t(s['next_page_token']),
  );
});
Sub2ApiAdminDataBackupJob mapDataBackupJob(Object? d) => _g(() => _job(d));
Sub2ApiAdminDataConfig _config(Object? d) {
  final s = _o(d);
  return Sub2ApiAdminDataConfig(
    sourceMode: _t(s['source_mode']),
    backupRoot: Sub2ApiAdminDataManagementPath(_t(s['backup_root'])),
    sqlitePath: _sec(s['sqlite_path'], Sub2ApiAdminDataManagementPath.new),
    retentionDays: _nn(s['retention_days']),
    keepLast: _nn(s['keep_last']),
    activePostgresProfileId: _t(s['active_postgres_profile_id']),
    activeRedisProfileId: _t(s['active_redis_profile_id']),
    postgres: _sourceConfig(s['postgres']),
    redis: _sourceConfig(s['redis']),
    s3: _s3(s['s3']),
    activeS3ProfileId: _t(s['active_s3_profile_id']),
  );
}

Sub2ApiAdminDataSourceProfile _source(Object? d) {
  final s = _o(d);
  return Sub2ApiAdminDataSourceProfile(
    sourceType: _type(s['source_type']),
    profileId: _r(s['profile_id']),
    name: _r(s['name']),
    isActive: _b(s['is_active']),
    config: _sourceConfig(s['config']),
    passwordConfigured: _b(s['password_configured']),
    createdAt: _date(s['created_at']),
    updatedAt: _date(s['updated_at']),
  );
}

Sub2ApiAdminDataSourceConfig _sourceConfig(Object? d) {
  final s = _o(d);
  return Sub2ApiAdminDataSourceConfig(
    host: _t(s['host']),
    port: _nn(s['port']),
    user: _t(s['user']),
    database: _t(s['database']),
    sslMode: _t(s['ssl_mode']),
    address: _t(s['addr']),
    username: _t(s['username']),
    databaseIndex: _nn(s['db']),
    containerName: _t(s['container_name']),
  );
}

Sub2ApiAdminDataS3Config _s3(Object? d) {
  final s = _o(d);
  return Sub2ApiAdminDataS3Config(
    enabled: _b(s['enabled']),
    endpoint: _uri(s['endpoint']),
    region: _t(s['region']),
    bucket: _t(s['bucket']),
    accessKeyId: _sec(s['access_key_id'], Sub2ApiAdminBackupAccessKeyId.new),
    secretConfigured: s['secret_access_key_configured'] == null
        ? false
        : _b(s['secret_access_key_configured']),
    prefix: _t(s['prefix']),
    forcePathStyle: _b(s['force_path_style']),
    useSsl: _b(s['use_ssl']),
  );
}

Sub2ApiAdminDataS3Profile _s3p(Object? d) {
  final s = _o(d);
  return Sub2ApiAdminDataS3Profile(
    profileId: _r(s['profile_id']),
    name: _r(s['name']),
    isActive: _b(s['is_active']),
    s3: _s3(s['s3']),
    secretConfigured: _b(s['secret_access_key_configured']),
    createdAt: _date(s['created_at']),
    updatedAt: _date(s['updated_at']),
  );
}

Sub2ApiAdminDataBackupJob _job(Object? d) {
  final s = _o(d), a = _o(s['artifact']), x = _o(s['s3']);
  return Sub2ApiAdminDataBackupJob(
    jobId: _r(s['job_id']),
    backupType: _backupType(s['backup_type']),
    status: _r(s['status']),
    triggeredBy: _t(s['triggered_by']),
    idempotencyKey: _t(s['idempotency_key']),
    uploadToS3: _b(s['upload_to_s3']),
    s3ProfileId: _t(s['s3_profile_id']),
    postgresProfileId: _t(s['postgres_profile_id']),
    redisProfileId: _t(s['redis_profile_id']),
    startedAt: _date(s['started_at']),
    finishedAt: _date(s['finished_at']),
    errorMessage: Sub2ApiAdminOpsErrorContent(_t(s['error_message'])),
    artifact: Sub2ApiAdminDataArtifact(
      localPath: Sub2ApiAdminDataManagementPath(_t(a['local_path'])),
      sizeBytes: _nn(a['size_bytes']),
      sha256: _t(a['sha256']),
    ),
    s3Object: Sub2ApiAdminDataS3Object(
      bucket: _t(x['bucket']),
      objectKey: Sub2ApiAdminBackupObjectKey(_t(x['key'])),
      etag: _t(x['etag']),
    ),
  );
}

Sub2ApiAdminDataSourceType _type(Object? v) => switch (_r(v)) {
  'postgres' => Sub2ApiAdminDataSourceType.postgres,
  'redis' => Sub2ApiAdminDataSourceType.redis,
  _ => throw const FormatException(),
};
Sub2ApiAdminDataBackupType _backupType(Object? v) => switch (_r(v)) {
  'postgres' => Sub2ApiAdminDataBackupType.postgres,
  'redis' => Sub2ApiAdminDataBackupType.redis,
  'full' => Sub2ApiAdminDataBackupType.full,
  _ => throw const FormatException(),
};
Map<String, Object?> _o(Object? v) {
  if (v is! Map) throw const FormatException();
  return Map<String, Object?>.from(v);
}

List<Object?> _l(Object? v) {
  if (v is! List) throw const FormatException();
  return v.cast<Object?>();
}

String _t(Object? v) {
  if (v == null) return '';
  if (v is! String) throw const FormatException();
  return v;
}

String _r(Object? v) {
  final s = _t(v);
  if (s.trim().isEmpty) throw const FormatException();
  return s;
}

bool _b(Object? v) {
  if (v is! bool) throw const FormatException();
  return v;
}

int _nn(Object? v) {
  if (v is! int || v < 0) throw const FormatException();
  return v;
}

Uri? _uri(Object? v) {
  final s = _t(v);
  if (s.isEmpty) return null;
  return Uri.parse(s);
}

DateTime? _date(Object? v) {
  final s = _t(v);
  return s.isEmpty ? null : DateTime.parse(s).toUtc();
}

T? _sec<T>(Object? v, T Function(String) f) {
  final s = _t(v);
  return s.isEmpty ? null : f(s);
}

T _g<T>(T Function() f) {
  try {
    return f();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_data_management_response',
  retryable: false,
);
