import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:sub2api_client/sub2api_admin_client.dart';
import 'package:sub2api_client/sub2api_client.dart';
import 'package:sub2api_client/sub2api_ops_client.dart';
import 'package:test/test.dart';

const _fixedCommit = 'e8cb019fabf8b55199436229044cbf9aa7a82564';

void main() {
  test(
    'controlled v0.1.183 deployment enforces privileged credential and step-up boundaries',
    () async {
      expect(Platform.environment['SUB2API_INTEGRATION_ENABLED'], 'true');
      expect(Platform.environment['SUB2API_INTEGRATION_COMMIT'], _fixedCommit);
      final origin = _required('SUB2API_INTEGRATION_ORIGIN');
      final adminEmail = _required('SUB2API_INTEGRATION_ADMIN_EMAIL');
      final adminPassword = _required('SUB2API_INTEGRATION_ADMIN_PASSWORD');
      final configuration = Sub2ApiConfiguration(
        origin: Uri.parse(origin),
        allowInsecureHttp: origin.startsWith('http://'),
      );
      final adminStore = Sub2ApiMemorySessionStore();
      final userStore = Sub2ApiMemorySessionStore();
      final adminUserClient = Sub2ApiClient(
        configuration: configuration,
        sessionStore: adminStore,
      );
      final admin = Sub2ApiAdminClient(
        configuration: configuration,
        sessionStore: adminStore,
      );
      final userClient = Sub2ApiClient(
        configuration: configuration,
        sessionStore: userStore,
      );
      final nonAdmin = Sub2ApiAdminClient(
        configuration: configuration,
        sessionStore: userStore,
      );
      Sub2ApiOpsClient? ops;
      Sub2ApiOpsClient? invalidOps;
      try {
        final login = await adminUserClient.auth.login(
          Sub2ApiLoginRequest(
            email: adminEmail,
            password: Sub2ApiPassword(adminPassword),
          ),
        );
        expect(login, isA<Sub2ApiAuthenticated>());
        expect((await admin.bootstrap()).currentUser.role, 'admin');

        final compliance = await admin.compliance.getStatus();
        if (compliance.required) {
          await admin.compliance.accept(
            Sub2ApiAdminAcceptComplianceRequest(
              phrase: compliance.phraseFor(Sub2ApiAdminComplianceLanguage.zh),
              language: Sub2ApiAdminComplianceLanguage.zh,
            ),
          );
        }
        await admin.dashboard.getStats();

        await admin.settings.updateSystemSettings(
          Sub2ApiAdminSystemSettingsPatch.empty().withValue(
            Sub2ApiAdminSystemSettingUpdates.totpEnabled,
            true,
          ),
        );
        final proof = Sub2ApiTotpIdentityProof.password(
          Sub2ApiPassword(adminPassword),
        );
        if ((await adminUserClient.totp.getStatus()).enabled) {
          await adminUserClient.totp.disable(proof);
        }
        final setup = await adminUserClient.totp.beginSetup(proof);
        await adminUserClient.totp.enable(
          Sub2ApiEnableTotpRequest(
            code: Sub2ApiVerificationCode(_totp(setup.secret.reveal())),
            setupToken: setup.setupToken,
          ),
        );

        final suffix = DateTime.now().microsecondsSinceEpoch;
        final userEmail = 'e2e-user-$suffix@sub2api.test';
        final userPassword = 'e2e-password-$suffix';
        await admin.users.create(
          Sub2ApiAdminCreateUserRequest(
            email: userEmail,
            password: Sub2ApiPassword(userPassword),
            role: Sub2ApiAdminUserRole.user,
          ),
        );
        expect(
          await userClient.auth.login(
            Sub2ApiLoginRequest(
              email: userEmail,
              password: Sub2ApiPassword(userPassword),
            ),
          ),
          isA<Sub2ApiAuthenticated>(),
        );
        await userClient.user.getProfile();
        await _expectCode(() => nonAdmin.bootstrap(), 'auth.admin_required');

        final regenerated = await admin.settings.regenerateAdminApiKey();
        ops = Sub2ApiOpsClient(
          configuration: configuration,
          credentialProvider: Sub2ApiStaticAdminApiKeyProvider(regenerated.key),
        );
        await ops.dashboard.getStats();
        invalidOps = Sub2ApiOpsClient(
          configuration: configuration,
          credentialProvider: const Sub2ApiStaticAdminApiKeyProvider(
            Sub2ApiAdminApiKey('invalid-admin-api-key'),
          ),
        );
        await _expectUnauthorized(() => invalidOps!.dashboard.getStats());

        await admin.settings.updateSystemSettings(
          Sub2ApiAdminSystemSettingsPatch.empty().withValue(
            Sub2ApiAdminSystemSettingUpdates.stepUpEnabled,
            true,
          ),
        );
        await _expectCode(
          () => admin.backups.getDownload('missing-backup'),
          'auth.step_up_required',
        );
        await _expectCode(
          () => ops!.backups.getDownload('missing-backup'),
          'auth.step_up_admin_api_key_forbidden',
        );
        expect(
          (await adminUserClient.totp.stepUp(
            Sub2ApiVerificationCode(_totp(setup.secret.reveal())),
          )).verified,
          isTrue,
        );
        await _expectNonStepUpFailure(
          () => admin.backups.getDownload('missing-backup'),
        );
        await _expectCode(
          () => ops!.dataManagement.getConfig(),
          'admin.data_management_deprecated',
        );
      } finally {
        try {
          await admin.settings.updateSystemSettings(
            Sub2ApiAdminSystemSettingsPatch.empty().withValue(
              Sub2ApiAdminSystemSettingUpdates.stepUpEnabled,
              false,
            ),
          );
          await admin.settings.updateSystemSettings(
            Sub2ApiAdminSystemSettingsPatch.empty().withValue(
              Sub2ApiAdminSystemSettingUpdates.totpEnabled,
              false,
            ),
          );
        } on Object {
          // The controlled deployment is discarded after this suite.
        }
        invalidOps?.close();
        ops?.close();
        nonAdmin.close();
        userClient.close();
        admin.close();
        adminUserClient.close();
      }
    },
  );
}

Future<void> _expectCode(
  Future<Object?> Function() operation,
  String expected,
) async {
  try {
    await operation();
  } on Sub2ApiException catch (error) {
    expect(error.code, expected);
    return;
  }
  fail('Expected $expected');
}

Future<void> _expectUnauthorized(Future<Object?> Function() operation) async {
  try {
    await operation();
  } on Sub2ApiException catch (error) {
    expect(
      error.kind,
      anyOf(Sub2ApiFailureKind.unauthorized, Sub2ApiFailureKind.forbidden),
    );
    return;
  }
  fail('Invalid Admin API Key unexpectedly succeeded');
}

Future<void> _expectNonStepUpFailure(
  Future<Object?> Function() operation,
) async {
  try {
    await operation();
  } on Sub2ApiException catch (error) {
    expect(
      error.code,
      isNot(
        anyOf(
          'auth.step_up_required',
          'auth.step_up_totp_not_enabled',
          'auth.step_up_admin_api_key_forbidden',
        ),
      ),
    );
    return;
  }
  fail('Missing backup unexpectedly succeeded');
}

String _totp(String base32Secret) {
  const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';
  var bits = 0;
  var value = 0;
  final bytes = <int>[];
  for (final rune in base32Secret.toUpperCase().runes) {
    final index = alphabet.indexOf(String.fromCharCode(rune));
    if (index < 0) continue;
    value = (value << 5) | index;
    bits += 5;
    if (bits >= 8) {
      bytes.add((value >> (bits - 8)) & 0xff);
      bits -= 8;
    }
  }
  final counter = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 30000;
  final buffer = ByteData(8)..setUint64(0, counter, Endian.big);
  final digest = Hmac(sha1, bytes).convert(buffer.buffer.asUint8List()).bytes;
  final offset = digest.last & 0x0f;
  final binary =
      ((digest[offset] & 0x7f) << 24) |
      (digest[offset + 1] << 16) |
      (digest[offset + 2] << 8) |
      digest[offset + 3];
  return (binary % 1000000).toString().padLeft(6, '0');
}

String _required(String name) {
  final value = Platform.environment[name];
  if (value == null || value.isEmpty) fail('Missing $name');
  return value;
}
