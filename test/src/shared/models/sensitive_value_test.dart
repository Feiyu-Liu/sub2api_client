import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:test/test.dart';

void main() {
  test('sensitive values reveal only through the explicit API', () {
    const sentinel = 'sentinel-super-secret';
    const values = [
      Sub2ApiAccessToken(sentinel),
      Sub2ApiRefreshToken(sentinel),
      Sub2ApiApiKeySecret(sentinel),
      Sub2ApiCheckoutSecret(sentinel),
      Sub2ApiPassword(sentinel),
      Sub2ApiVerificationCode(sentinel),
      Sub2ApiTwoFactorTemporaryToken(sentinel),
      Sub2ApiPasswordResetToken(sentinel),
      Sub2ApiPasskeySessionToken(sentinel),
      Sub2ApiTotpSecret(sentinel),
      Sub2ApiTotpQrCodeUri(sentinel),
      Sub2ApiTotpSetupToken(sentinel),
      Sub2ApiOAuthPendingToken(sentinel),
      Sub2ApiNotificationUnsubscribeToken(sentinel),
    ];

    for (final value in values) {
      expect(value.reveal(), sentinel);
      expect(value.toString(), isNot(contains(sentinel)));
    }
  });
}
