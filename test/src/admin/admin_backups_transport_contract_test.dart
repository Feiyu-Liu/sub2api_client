import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_backup_models.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_client.dart';
import 'package:sub2api_client/src/admin/sub2api_ops_credentials.dart';
import 'package:sub2api_client/src/shared/configuration/sub2api_configuration.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:test/test.dart';
import '../../support/fixture_reader.dart';
import '../../support/json_response_adapter.dart';

void main() {
  final c = Sub2ApiConfiguration(origin: Uri.parse('https://sub2api.test'));
  final s3 = Sub2ApiAdminBackupS3ConfigInput(
    endpoint: Uri.parse('https://s3.example.test'),
    region: 'auto',
    bucket: 'db-backups',
    accessKeyId: const Sub2ApiAdminBackupAccessKeyId('AKIAEXAMPLE'),
    secretAccessKey: const Sub2ApiAdminBackupSecretAccessKey('secret'),
    prefix: 'backups/',
    forcePathStyle: false,
  );
  final image = Sub2ApiAdminImageStorageSettingsInput(
    enabled: true,
    reuseBackupS3: true,
    bucket: 'images',
    prefix: 'images/',
    publicBaseUrl: Uri.parse('https://cdn.example.test'),
    presignExpiryHours: 24,
    maxDownloadBytes: 10485760,
    region: '',
    forcePathStyle: false,
  );
  test('Ops executes every backup route', () async {
    final a = JsonResponseAdapter((r) => JsonResponse(body: _response(r)));
    final client = _client(c, a);
    addTearDown(client.close);
    final gotS3 = await client.backups.getS3Config();
    await client.backups.updateS3Config(s3);
    final testS3 = await client.backups.testS3Connection(s3);
    final gotImage = await client.backups.getImageStorage();
    await client.backups.updateImageStorage(image);
    await client.backups.testImageStorage(image);
    final schedule = await client.backups.getSchedule();
    await client.backups.updateSchedule(schedule);
    final created = await client.backups.createBackup(expireDays: 14);
    final list = await client.backups.listBackups();
    await client.backups.getBackup('backup-81');
    final deleted = await client.backups.deleteBackup('backup-81');
    final download = await client.backups.getDownload('backup-81');
    final restored = await client.backups.restoreBackup(
      'backup-81',
      const Sub2ApiPassword('admin-password'),
    );
    expect(gotS3.accessKeyId.toString(), '<redacted>');
    expect(testS3.message.toString(), '<redacted>');
    expect(gotImage.secretConfigured, isTrue);
    expect(created.objectKey.toString(), '<redacted>');
    expect(list.single.parts.single.objectKey.toString(), '<redacted>');
    expect(deleted.ok, isTrue);
    expect(download.url.toString(), '<redacted>');
    expect(restored.restoreStatus, Sub2ApiAdminBackupRestoreStatus.completed);
    expect(a.requests.map((r) => r.path), [
      '/api/v1/admin/backups/s3-config',
      '/api/v1/admin/backups/s3-config',
      '/api/v1/admin/backups/s3-config/test',
      '/api/v1/admin/backups/image-storage',
      '/api/v1/admin/backups/image-storage',
      '/api/v1/admin/backups/image-storage/test',
      '/api/v1/admin/backups/schedule',
      '/api/v1/admin/backups/schedule',
      '/api/v1/admin/backups',
      '/api/v1/admin/backups',
      '/api/v1/admin/backups/backup-81',
      '/api/v1/admin/backups/backup-81',
      '/api/v1/admin/backups/backup-81/download-url',
      '/api/v1/admin/backups/backup-81/restore',
    ]);
    expect(a.requests.last.data, containsPair('password', 'admin-password'));
    expect(
      a.requests.every((r) => r.headers['x-api-key'] == 'backup-key'),
      isTrue,
    );
  });
  test('backup validation fails before I/O', () async {
    final a = JsonResponseAdapter((_) {
      throw StateError('no io');
    });
    final client = _client(c, a);
    addTearDown(client.close);
    expect(
      () => client.backups.createBackup(expireDays: -1),
      throwsA(_code('admin.backups.invalid_expire_days')),
    );
    expect(
      () => client.backups.getBackup(' '),
      throwsA(_code('admin.backups.invalid_id')),
    );
    expect(a.requests, isEmpty);
  });
  test('backup mutation is not replayed', () async {
    final a = JsonResponseAdapter(
      (_) => JsonResponse(
        statusCode: 401,
        body: readFixture('admin/account_auth_failure.json'),
      ),
    );
    final client = _client(c, a);
    addTearDown(client.close);
    await expectLater(
      client.backups.deleteBackup('backup-81'),
      throwsA(isA<Sub2ApiException>()),
    );
    expect(a.requests, hasLength(1));
  });
}

Map<String, Object?> _f() => readFixture('admin/backups.json');
Object _response(RequestOptions r) {
  Object? d;
  if (r.path.endsWith('/test')) {
    d = {'ok': true, 'message': 'connection successful'};
  } else if (r.path.endsWith('/s3-config')) {
    d = _f()['s3'];
  } else if (r.path.endsWith('/image-storage')) {
    d = r.method == 'GET'
        ? {'config': _f()['image'], 'secret_configured': true}
        : _f()['image'];
  } else if (r.path.endsWith('/schedule')) {
    d = _f()['schedule'];
  } else if (r.path.endsWith('/download-url')) {
    d = _f()['download'];
  } else if (r.method == 'DELETE') {
    d = {'deleted': true};
  } else if (r.path == '/api/v1/admin/backups' && r.method == 'GET') {
    d = {
      'items': [_f()['record']],
    };
  } else {
    d = _f()['record'];
  }
  return {'code': 0, 'message': 'success', 'data': d};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('backup-key'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String c) =>
    isA<Sub2ApiException>().having((e) => e.code, 'code', c);
