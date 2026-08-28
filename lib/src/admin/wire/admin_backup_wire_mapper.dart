import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../sub2api_admin_backup_models.dart';

Sub2ApiAdminBackupS3Config mapBackupS3(Object? data) => _guard(() {
  final s = _obj(data);
  return Sub2ApiAdminBackupS3Config(
    endpoint: _uri(s['endpoint']),
    region: _text(s['region']),
    bucket: _text(s['bucket']),
    accessKeyId: _secret(s['access_key_id'], Sub2ApiAdminBackupAccessKeyId.new),
    prefix: _text(s['prefix']),
    forcePathStyle: _bool(s['force_path_style']),
  );
});
Sub2ApiAdminBackupConnectionResult mapBackupConnection(Object? data) =>
    _guard(() {
      final s = _obj(data);
      return Sub2ApiAdminBackupConnectionResult(
        ok: _bool(s['ok']),
        message: Sub2ApiAdminOpsErrorContent(_text(s['message'])),
      );
    });
Sub2ApiAdminImageStorageSnapshot mapImageSnapshot(Object? data) => _guard(() {
  final s = _obj(data);
  return Sub2ApiAdminImageStorageSnapshot(
    settings: _image(s['config']),
    secretConfigured: _bool(s['secret_configured']),
  );
});
Sub2ApiAdminImageStorageSettings mapImageSettings(Object? data) =>
    _guard(() => _image(data));
Sub2ApiAdminBackupSchedule mapBackupSchedule(Object? data) => _guard(() {
  final s = _obj(data);
  return Sub2ApiAdminBackupSchedule(
    enabled: _bool(s['enabled']),
    cronExpression: _text(s['cron_expr']),
    retainDays: _nonneg(s['retain_days']),
    retainCount: _nonneg(s['retain_count']),
  );
});
List<Sub2ApiAdminBackupRecord> mapBackups(Object? data) => _guard(
  () => _list(_obj(data)['items']).map(_record).toList(growable: false),
);
Sub2ApiAdminBackupRecord mapBackup(Object? data) => _guard(() => _record(data));
Sub2ApiAdminBackupMutationResult mapBackupDeleted(Object? data) => _guard(
  () => Sub2ApiAdminBackupMutationResult(ok: _bool(_obj(data)['deleted'])),
);
Sub2ApiAdminBackupDownload mapBackupDownload(Object? data) => _guard(() {
  final s = _obj(data);
  return Sub2ApiAdminBackupDownload(
    url: _secret(s['url'], Sub2ApiAdminBackupDownloadUrl.new),
    parts: _optionalList(s['parts'])
        .map((v) {
          final p = _obj(v);
          return Sub2ApiAdminBackupDownloadPart(
            index: _nonneg(p['index']),
            sizeBytes: _nonneg(p['size_bytes']),
            url: Sub2ApiAdminBackupDownloadUrl(_required(p['url'])),
          );
        })
        .toList(growable: false),
  );
});

Sub2ApiAdminImageStorageSettings _image(Object? data) {
  final s = _obj(data);
  return Sub2ApiAdminImageStorageSettings(
    enabled: _bool(s['enabled']),
    reuseBackupS3: _bool(s['reuse_backup_s3']),
    bucket: _text(s['bucket']),
    prefix: _text(s['prefix']),
    publicBaseUrl: _uri(s['public_base_url']),
    presignExpiryHours: _nonneg(s['presign_expiry_hours']),
    maxDownloadBytes: _nonneg(s['max_download_bytes']),
    endpoint: _uri(s['endpoint']),
    region: _text(s['region']),
    accessKeyId: _secret(s['access_key_id'], Sub2ApiAdminBackupAccessKeyId.new),
    forcePathStyle: _bool(s['force_path_style']),
  );
}

Sub2ApiAdminBackupRecord _record(Object? data) {
  final s = _obj(data);
  final restore = _text(s['restore_status']);
  return Sub2ApiAdminBackupRecord(
    id: _required(s['id']),
    status: _status(s['status']),
    backupType: _required(s['backup_type']),
    fileName: _text(s['file_name']),
    objectKey: _secret(s['s3_key'], Sub2ApiAdminBackupObjectKey.new),
    parts: _optionalList(s['parts'])
        .map((v) {
          final p = _obj(v);
          return Sub2ApiAdminBackupPart(
            index: _nonneg(p['index']),
            objectKey: Sub2ApiAdminBackupObjectKey(_required(p['s3_key'])),
            sizeBytes: _nonneg(p['size_bytes']),
            sha256: _text(p['sha256']),
          );
        })
        .toList(growable: false),
    sizeBytes: _nonneg(s['size_bytes']),
    triggeredBy: _trigger(s['triggered_by']),
    errorMessage: Sub2ApiAdminOpsErrorContent(_text(s['error_message'])),
    startedAt: _date(s['started_at']),
    finishedAt: _dateOpt(s['finished_at']),
    expiresAt: _dateOpt(s['expires_at']),
    progress: _text(s['progress']),
    restoreStatus: restore.isEmpty ? null : _restore(restore),
    restoreError: Sub2ApiAdminOpsErrorContent(_text(s['restore_error'])),
    restoredAt: _dateOpt(s['restored_at']),
  );
}

Sub2ApiAdminBackupStatus _status(Object? v) => switch (_required(v)) {
  'pending' => Sub2ApiAdminBackupStatus.pending,
  'running' => Sub2ApiAdminBackupStatus.running,
  'completed' => Sub2ApiAdminBackupStatus.completed,
  'failed' => Sub2ApiAdminBackupStatus.failed,
  _ => throw const FormatException(),
};
Sub2ApiAdminBackupTrigger _trigger(Object? v) => switch (_required(v)) {
  'manual' => Sub2ApiAdminBackupTrigger.manual,
  'scheduled' => Sub2ApiAdminBackupTrigger.scheduled,
  _ => throw const FormatException(),
};
Sub2ApiAdminBackupRestoreStatus _restore(String v) => switch (v) {
  'running' => Sub2ApiAdminBackupRestoreStatus.running,
  'completed' => Sub2ApiAdminBackupRestoreStatus.completed,
  'failed' => Sub2ApiAdminBackupRestoreStatus.failed,
  _ => throw const FormatException(),
};
Map<String, Object?> _obj(Object? v) {
  if (v is! Map) throw const FormatException();
  return Map<String, Object?>.from(v);
}

List<Object?> _list(Object? v) {
  if (v is! List) throw const FormatException();
  return v.cast<Object?>();
}

List<Object?> _optionalList(Object? v) => v == null ? const [] : _list(v);
String _text(Object? v) {
  if (v == null) return '';
  if (v is! String) throw const FormatException();
  return v;
}

String _required(Object? v) {
  final s = _text(v);
  if (s.trim().isEmpty) throw const FormatException();
  return s;
}

bool _bool(Object? v) {
  if (v is! bool) throw const FormatException();
  return v;
}

int _nonneg(Object? v) {
  if (v is! int || v < 0) throw const FormatException();
  return v;
}

Uri? _uri(Object? v) {
  final s = _text(v);
  if (s.isEmpty) return null;
  final u = Uri.parse(s);
  if (!u.isAbsolute) throw const FormatException();
  return u;
}

DateTime _date(Object? v) => DateTime.parse(_required(v)).toUtc();
DateTime? _dateOpt(Object? v) {
  final s = _text(v);
  return s.isEmpty ? null : DateTime.parse(s).toUtc();
}

T? _secret<T>(Object? v, T Function(String) f) {
  final s = _text(v);
  return s.isEmpty ? null : f(s);
}

T _guard<T>(T Function() f) {
  try {
    return f();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_backup_response',
  retryable: false,
);
