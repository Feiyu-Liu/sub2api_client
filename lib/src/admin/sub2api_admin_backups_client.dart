import 'package:dio/dio.dart';
import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sensitive_value.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_backup_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'wire/admin_backup_wire_mapper.dart';
import 'wire/admin_backup_wire_service.dart';

abstract interface class Sub2ApiAdminBackupsClient {
  Future<Sub2ApiAdminBackupS3Config> getS3Config({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminBackupS3Config> updateS3Config(
    Sub2ApiAdminBackupS3ConfigInput input, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminBackupConnectionResult> testS3Connection(
    Sub2ApiAdminBackupS3ConfigInput input, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminImageStorageSnapshot> getImageStorage({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminImageStorageSettings> updateImageStorage(
    Sub2ApiAdminImageStorageSettingsInput input, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminBackupConnectionResult> testImageStorage(
    Sub2ApiAdminImageStorageSettingsInput input, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminBackupSchedule> getSchedule({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminBackupSchedule> updateSchedule(
    Sub2ApiAdminBackupSchedule schedule, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminBackupRecord> createBackup({
    int? expireDays,
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<List<Sub2ApiAdminBackupRecord>> listBackups({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminBackupRecord> getBackup(
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminBackupMutationResult> deleteBackup(
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminBackupDownload> getDownload(
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminBackupRecord> restoreBackup(
    String id,
    Sub2ApiPassword password, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminBackupsClient createSub2ApiAdminBackupsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, credentialMode);

final class _Client implements Sub2ApiAdminBackupsClient {
  _Client(Dio d, this.e, this.m) : s = AdminBackupWireService(d);
  final Sub2ApiRequestExecutor e;
  final Sub2ApiAdminCredentialMode m;
  final AdminBackupWireService s;
  String? a(String? v) => m == Sub2ApiAdminCredentialMode.jwt ? v : null;
  String? k(String? v) => m == Sub2ApiAdminCredentialMode.apiKey ? v : null;
  @override
  Future<Sub2ApiAdminBackupS3Config> getS3Config({
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedRequest(
    send: (c, o, v) => s.getS3(c, o, a(v), k(v)),
    decode: mapBackupS3,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminBackupS3Config> updateS3Config(
    Sub2ApiAdminBackupS3ConfigInput i, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) => s.updateS3(_s3(i), c, o, a(v), k(v)),
    decode: mapBackupS3,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminBackupConnectionResult> testS3Connection(
    Sub2ApiAdminBackupS3ConfigInput i, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) => s.testS3(_s3(i), c, o, a(v), k(v)),
    decode: mapBackupConnection,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminImageStorageSnapshot> getImageStorage({
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedRequest(
    send: (c, o, v) => s.getImage(c, o, a(v), k(v)),
    decode: mapImageSnapshot,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminImageStorageSettings> updateImageStorage(
    Sub2ApiAdminImageStorageSettingsInput i, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) => s.updateImage(_image(i), c, o, a(v), k(v)),
    decode: mapImageSettings,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminBackupConnectionResult> testImageStorage(
    Sub2ApiAdminImageStorageSettingsInput i, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) => s.testImage(_image(i), c, o, a(v), k(v)),
    decode: mapBackupConnection,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminBackupSchedule> getSchedule({
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedRequest(
    send: (c, o, v) => s.getSchedule(c, o, a(v), k(v)),
    decode: mapBackupSchedule,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminBackupSchedule> updateSchedule(
    Sub2ApiAdminBackupSchedule x, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (x.retainDays < 0 || x.retainCount < 0) {
      throw _v('admin.backups.invalid_retention');
    }
    return e.protectedNonReplayableRequest(
      send: (c, o, v) => s.updateSchedule(
        {
          'enabled': x.enabled,
          'cron_expr': x.cronExpression.trim(),
          'retain_days': x.retainDays,
          'retain_count': x.retainCount,
        },
        c,
        o,
        a(v),
        k(v),
      ),
      decode: mapBackupSchedule,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminBackupRecord> createBackup({
    int? expireDays,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (expireDays != null && expireDays < 0) {
      throw _v('admin.backups.invalid_expire_days');
    }
    return e.protectedNonReplayableRequest(
      send: (c, o, v) =>
          s.create({'expire_days': ?expireDays}, c, o, a(v), k(v)),
      decode: mapBackup,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminBackupRecord>> listBackups({
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedRequest(
    send: (c, o, v) => s.list(c, o, a(v), k(v)),
    decode: mapBackups,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminBackupRecord> getBackup(
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedRequest(
    send: (c, o, v) => s.get(_id(id), c, o, a(v), k(v)),
    decode: mapBackup,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminBackupMutationResult> deleteBackup(
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) => s.delete(_id(id), c, o, a(v), k(v)),
    decode: mapBackupDeleted,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminBackupDownload> getDownload(
    String id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedRequest(
    send: (c, o, v) => s.download(_id(id), c, o, a(v), k(v)),
    decode: mapBackupDownload,
    requestOptions: requestOptions,
  );
  @override
  Future<Sub2ApiAdminBackupRecord> restoreBackup(
    String id,
    Sub2ApiPassword p, {
    Sub2ApiRequestOptions? requestOptions,
  }) => e.protectedNonReplayableRequest(
    send: (c, o, v) =>
        s.restore(_id(id), {'password': p.reveal()}, c, o, a(v), k(v)),
    decode: mapBackup,
    requestOptions: requestOptions,
  );
}

Map<String, Object?> _s3(Sub2ApiAdminBackupS3ConfigInput i) {
  final b = i.bucket.trim(), ak = i.accessKeyId.reveal().trim();
  if (b.isEmpty || ak.isEmpty) throw _v('admin.backups.invalid_s3_config');
  return {
    'endpoint': i.endpoint?.toString() ?? '',
    'region': i.region.trim(),
    'bucket': b,
    'access_key_id': ak,
    'secret_access_key': i.secretAccessKey?.reveal() ?? '',
    'prefix': i.prefix.trim(),
    'force_path_style': i.forcePathStyle,
  };
}

Map<String, Object?> _image(Sub2ApiAdminImageStorageSettingsInput i) {
  if (i.presignExpiryHours < 0 || i.maxDownloadBytes < 0) {
    throw _v('admin.backups.invalid_image_storage');
  }
  return {
    'enabled': i.enabled,
    'reuse_backup_s3': i.reuseBackupS3,
    'bucket': i.bucket.trim(),
    'prefix': i.prefix.trim(),
    'public_base_url': i.publicBaseUrl?.toString() ?? '',
    'presign_expiry_hours': i.presignExpiryHours,
    'max_download_bytes': i.maxDownloadBytes,
    'endpoint': i.endpoint?.toString() ?? '',
    'region': i.region.trim(),
    'access_key_id': i.accessKeyId?.reveal() ?? '',
    'secret_access_key': i.secretAccessKey?.reveal() ?? '',
    'force_path_style': i.forcePathStyle,
  };
}

String _id(String v) {
  final s = v.trim();
  if (s.isEmpty) throw _v('admin.backups.invalid_id');
  return s;
}

Sub2ApiException _v(String c) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: c,
  retryable: false,
);
