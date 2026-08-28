import 'package:dio/dio.dart';
import 'package:sub2api_client/src/admin/sub2api_admin_data_management_models.dart';
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
  test('Ops executes every data-management route', () async {
    final a = JsonResponseAdapter((r) => JsonResponse(body: _response(r)));
    final client = _client(c, a);
    addTearDown(client.close);
    final health = await client.dataManagement.getAgentHealth();
    final cfg = await client.dataManagement.getConfig();
    await client.dataManagement.updateConfig(cfg);
    final sources = await client.dataManagement.listSourceProfiles(
      Sub2ApiAdminDataSourceType.postgres,
    );
    final input = Sub2ApiAdminDataSourceProfileInput(
      profileId: 'pg-main',
      name: 'Primary Postgres',
      config: sources.single.config,
      setActive: true,
    );
    await client.dataManagement.createSourceProfile(
      Sub2ApiAdminDataSourceType.postgres,
      input,
    );
    await client.dataManagement.updateSourceProfile(
      Sub2ApiAdminDataSourceType.postgres,
      input,
    );
    await client.dataManagement.deleteSourceProfile(
      Sub2ApiAdminDataSourceType.postgres,
      'pg-main',
    );
    await client.dataManagement.activateSourceProfile(
      Sub2ApiAdminDataSourceType.postgres,
      'pg-main',
    );
    await client.dataManagement.testS3(cfg.s3);
    final s3s = await client.dataManagement.listS3Profiles();
    final s3input = Sub2ApiAdminDataS3ProfileInput(
      profileId: 's3-main',
      name: 'Primary S3',
      s3: s3s.single.s3,
      setActive: true,
    );
    await client.dataManagement.createS3Profile(s3input);
    await client.dataManagement.updateS3Profile(s3input);
    await client.dataManagement.deleteS3Profile('s3-main');
    await client.dataManagement.activateS3Profile('s3-main');
    final created = await client.dataManagement.createBackupJob(
      const Sub2ApiAdminDataBackupJobRequest(
        backupType: Sub2ApiAdminDataBackupType.full,
        uploadToS3: true,
        s3ProfileId: 's3-main',
        postgresProfileId: 'pg-main',
        redisProfileId: 'redis-main',
        idempotencyKey: 'idem-81',
      ),
    );
    final jobs = await client.dataManagement.listBackupJobs(
      query: const Sub2ApiAdminDataBackupJobQuery(
        backupType: Sub2ApiAdminDataBackupType.full,
      ),
    );
    final job = await client.dataManagement.getBackupJob('job-81');
    expect(health.socketPath.toString(), '<redacted>');
    expect(cfg.backupRoot.toString(), '<redacted>');
    expect(sources.single.passwordConfigured, isTrue);
    expect(s3s.single.s3.accessKeyId.toString(), '<redacted>');
    expect(created.jobId, 'job-81');
    expect(jobs.items.single.artifact.localPath.toString(), '<redacted>');
    expect(job.s3Object.objectKey.toString(), '<redacted>');
    expect(a.requests.map((r) => r.path), [
      '/api/v1/admin/data-management/agent/health',
      '/api/v1/admin/data-management/config',
      '/api/v1/admin/data-management/config',
      '/api/v1/admin/data-management/sources/postgres/profiles',
      '/api/v1/admin/data-management/sources/postgres/profiles',
      '/api/v1/admin/data-management/sources/postgres/profiles/pg-main',
      '/api/v1/admin/data-management/sources/postgres/profiles/pg-main',
      '/api/v1/admin/data-management/sources/postgres/profiles/pg-main/activate',
      '/api/v1/admin/data-management/s3/test',
      '/api/v1/admin/data-management/s3/profiles',
      '/api/v1/admin/data-management/s3/profiles',
      '/api/v1/admin/data-management/s3/profiles/s3-main',
      '/api/v1/admin/data-management/s3/profiles/s3-main',
      '/api/v1/admin/data-management/s3/profiles/s3-main/activate',
      '/api/v1/admin/data-management/backups',
      '/api/v1/admin/data-management/backups',
      '/api/v1/admin/data-management/backups/job-81',
    ]);
    expect(a.requests[14].headers['X-Idempotency-Key'], 'idem-81');
  });
  test('deprecated data-management error is package-owned', () async {
    final a = JsonResponseAdapter(
      (_) => const JsonResponse(
        statusCode: 503,
        body: {'code': 'DATA_MANAGEMENT_DEPRECATED', 'message': 'deprecated'},
      ),
    );
    final client = _client(c, a);
    addTearDown(client.close);
    await expectLater(
      client.dataManagement.getConfig(),
      throwsA(_code('admin.data_management_deprecated')),
    );
  });
}

Map<String, Object?> _f() => readFixture('admin/data_management.json');
Object _response(RequestOptions r) {
  Object? d;
  if (r.path.endsWith('/agent/health')) {
    d = _f()['health'];
  } else if (r.path.endsWith('/config')) {
    d = _f()['config'];
  } else if (r.path.contains('/sources/')) {
    d = r.method == 'DELETE'
        ? {'deleted': true}
        : r.method == 'GET'
        ? {
            'items': [_f()['source']],
          }
        : _f()['source'];
  } else if (r.path.endsWith('/s3/test')) {
    d = {'ok': true, 'message': 'connection successful'};
  } else if (r.path.contains('/s3/profiles')) {
    d = r.method == 'DELETE'
        ? {'deleted': true}
        : r.method == 'GET'
        ? {
            'items': [_f()['s3_profile']],
          }
        : _f()['s3_profile'];
  } else if (r.path == '/api/v1/admin/data-management/backups' &&
      r.method == 'POST') {
    d = {'job_id': 'job-81', 'status': 'pending'};
  } else if (r.path == '/api/v1/admin/data-management/backups') {
    d = {
      'items': [_f()['job']],
      'next_page_token': '',
    };
  } else {
    d = _f()['job'];
  }
  return {'code': 0, 'message': 'success', 'data': d};
}

Sub2ApiOpsClient _client(Sub2ApiConfiguration c, JsonResponseAdapter a) =>
    createSub2ApiOpsClientForTesting(
      configuration: c,
      credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
        Sub2ApiAdminApiKey('data-key'),
      ),
      dio: Dio(BaseOptions(baseUrl: 'https://sub2api.test'))
        ..httpClientAdapter = a,
    );
Matcher _code(String c) =>
    isA<Sub2ApiException>().having((e) => e.code, 'code', c);
