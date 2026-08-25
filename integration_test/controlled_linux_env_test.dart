import 'dart:io';

import 'package:sub2api_client/sub2api_client.dart';
import 'package:test/test.dart';

const _fixedCommit = '41cec0db059ffb82d0efdcfcf07a24ab51fbfe97';

void main() {
  test(
    'controlled v0.1.155 deployment supports the read-only user loop',
    () async {
      expect(
        Platform.environment['SUB2API_INTEGRATION_ENABLED'],
        'true',
        reason:
            'Set SUB2API_INTEGRATION_ENABLED=true only for the controlled '
            'linux-env deployment.',
      );
      expect(
        Platform.environment['SUB2API_INTEGRATION_COMMIT'],
        _fixedCommit,
        reason: 'The live suite only accepts the ADR-pinned backend commit.',
      );
      final origin = _requiredEnvironment('SUB2API_INTEGRATION_ORIGIN');
      final email = _requiredEnvironment('SUB2API_INTEGRATION_EMAIL');
      final password = _requiredEnvironment('SUB2API_INTEGRATION_PASSWORD');
      final store = Sub2ApiMemorySessionStore();
      final client = Sub2ApiClient(
        configuration: Sub2ApiConfiguration(
          origin: Uri.parse(origin),
          allowInsecureHttp: origin.startsWith('http://'),
        ),
        sessionStore: store,
      );

      try {
        final capabilities = await client.capabilities.getCapabilities();
        expect(capabilities.version, isNotEmpty);

        final login = await client.auth.login(
          Sub2ApiLoginRequest(
            email: email,
            password: Sub2ApiPassword(password),
          ),
        );
        expect(login, isA<Sub2ApiAuthenticated>());

        final profile = await client.user.getProfile();
        expect(profile.email, email);
        await client.keys.list(
          request: const Sub2ApiKeyListRequest(page: 1, pageSize: 1),
        );
        await client.usage.stats(const Sub2ApiUsageQuery());
        if (capabilities.paymentEnabled) {
          await client.billing.config();
        }
      } finally {
        try {
          await client.auth.logout();
        } on Sub2ApiException {
          // Local logout happens before the best-effort server revocation call.
        }
        client.close();
        expect(
          await store.read(),
          isNull,
          reason: 'test session must be cleared',
        );
      }
    },
  );
}

String _requiredEnvironment(String name) {
  final value = Platform.environment[name];
  if (value == null || value.isEmpty) {
    fail('Missing required integration environment variable: $name');
  }
  return value;
}
