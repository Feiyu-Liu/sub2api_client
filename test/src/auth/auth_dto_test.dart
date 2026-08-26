import 'package:sub2api_client/src/auth/models/sub2api_auth_models.dart';
import 'package:sub2api_client/src/auth/wire/sub2api_auth_dto.dart';
import 'package:sub2api_client/src/shared/errors/sub2api_exception.dart';
import 'package:sub2api_client/src/shared/models/sensitive_value.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';

void main() {
  final authenticated = readSuccessFixtureData('auth/login_authenticated.json');

  test('maps an authenticated login into a redacted refreshable session', () {
    final result = Sub2ApiLoginResponseDto.fromJson(authenticated)
        .toPublicModel(
          now: () => DateTime.utc(2026),
          scope: 'https://example.test',
        );

    expect(result, isA<Sub2ApiAuthenticated>());
    final session = (result as Sub2ApiAuthenticated).session;
    expect(session.isRefreshable, isTrue);
    expect(
      session.toString(),
      isNot(contains('test-access-token-not-a-real-secret')),
    );
    expect(
      session.toString(),
      isNot(contains('test-refresh-token-not-a-real-secret')),
    );
    expect(session.expiresAt, DateTime.utc(2026, 1, 1, 1));
  });

  test('maps a two-factor challenge without creating a session', () {
    final result = Sub2ApiLoginResponseDto.fromJson(const {
      'requires_2fa': true,
      'temp_token': 'two-factor-sentinel',
      'user_email_masked': 'u***@example.com',
    }).toPublicModel(scope: 'https://example.test');

    expect(result, isA<Sub2ApiTwoFactorRequired>());
    expect(result.toString(), isNot(contains('two-factor-sentinel')));
  });

  test('fails closed for an ambiguous login union', () {
    expect(
      () => Sub2ApiLoginResponseDto.fromJson(const {
        'requires_2fa': true,
        'temp_token': 'two-factor-sentinel',
      }).toPublicModel(scope: 'https://example.test'),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'protocol.invalid_login_response',
        ),
      ),
    );
  });

  test('request serialization does not alter a password value', () {
    final json = Sub2ApiLoginRequestDto.fromPublic(
      const Sub2ApiLoginRequest(
        email: 'user@example.com',
        password: Sub2ApiPassword('password-sentinel'),
      ),
    ).toJson();

    expect(json, {
      'email': 'user@example.com',
      'password': 'password-sentinel',
    });
  });

  test('maps fixed-source email verification and invitation responses', () {
    final sent = Sub2ApiEmailVerificationCodeSentDto.fromJson(
      readSuccessFixtureData('auth/send_verify_code_success.json'),
    ).toPublicModel();
    final invitation = Sub2ApiInvitationCodeValidationDto.fromJson(
      readSuccessFixtureData('auth/validate_invitation_code_invalid.json'),
    ).toPublicModel();

    expect(sent.cooldown, const Duration(seconds: 60));
    expect(sent.message, 'Verification code sent successfully');
    expect(invitation.isValid, isFalse);
    expect(invitation.errorCode, 'INVITATION_CODE_USED');
  });

  test('maps fixed-source password-reset acknowledgements', () {
    final forgot = Sub2ApiAuthMessageDto.fromJson(
      readSuccessFixtureData('auth/forgot_password_success.json'),
    ).toForgotPasswordPublicModel();
    final reset = Sub2ApiAuthMessageDto.fromJson(
      readSuccessFixtureData('auth/reset_password_success.json'),
    ).toResetPasswordPublicModel();

    expect(forgot.message, contains('password reset link'));
    expect(reset.message, contains('password has been reset'));
  });

  test('rejects malformed additional auth response payloads', () {
    expect(
      () => Sub2ApiInvitationCodeValidationDto.fromJson(const {
        'valid': false,
      }).toPublicModel(),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'protocol.invalid_invitation_code_validation_response',
        ),
      ),
    );
    expect(
      () => Sub2ApiAuthMessageDto.fromJson(const {
        'message': '',
      }).toResetPasswordPublicModel(),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'protocol.invalid_reset_password_response',
        ),
      ),
    );
  });

  test('verification codes and reset credentials are redacted', () {
    const verificationCode = Sub2ApiVerificationCode('code-sentinel');
    const resetRequest = Sub2ApiResetPasswordRequest(
      email: 'user@example.test',
      newPassword: Sub2ApiPassword('new-password-sentinel'),
      token: Sub2ApiPasswordResetToken('reset-token-sentinel'),
    );

    expect(verificationCode.toString(), isNot(contains('code-sentinel')));
    expect(resetRequest.toString(), isNot(contains('new-password-sentinel')));
    expect(resetRequest.toString(), isNot(contains('reset-token-sentinel')));
  });

  test('refresh response rejects an invalid rotating token pair', () {
    expect(
      () => Sub2ApiRefreshResponseDto.fromJson(const {
        'access_token': '',
        'refresh_token': 'refresh-sentinel',
        'expires_in': 3600,
        'token_type': 'Bearer',
      }).toPublicModel(),
      throwsA(
        isA<Sub2ApiException>().having(
          (error) => error.code,
          'code',
          'protocol.invalid_refresh_response',
        ),
      ),
    );
  });
}
