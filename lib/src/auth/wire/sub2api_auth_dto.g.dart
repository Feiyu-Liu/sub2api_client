// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub2api_auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$Sub2ApiLoginRequestDtoToJson(
  Sub2ApiLoginRequestDto instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'tencent_captcha_randstr': ?instance.tencentCaptchaRandstr,
  'tencent_captcha_ticket': ?instance.tencentCaptchaTicket,
  'turnstile_token': ?instance.turnstileToken,
};

Map<String, dynamic> _$Sub2ApiTwoFactorLoginRequestDtoToJson(
  Sub2ApiTwoFactorLoginRequestDto instance,
) => <String, dynamic>{
  'temp_token': instance.tempToken,
  'totp_code': instance.totpCode,
};

Map<String, dynamic> _$Sub2ApiRegistrationRequestDtoToJson(
  Sub2ApiRegistrationRequestDto instance,
) => <String, dynamic>{
  'aff_code': ?instance.affCode,
  'email': instance.email,
  'invitation_code': ?instance.invitationCode,
  'password': instance.password,
  'promo_code': ?instance.promoCode,
  'tencent_captcha_randstr': ?instance.tencentCaptchaRandstr,
  'tencent_captcha_ticket': ?instance.tencentCaptchaTicket,
  'turnstile_token': ?instance.turnstileToken,
  'verify_code': ?instance.verifyCode,
};

Map<String, dynamic> _$Sub2ApiEmailVerificationCodeRequestDtoToJson(
  Sub2ApiEmailVerificationCodeRequestDto instance,
) => <String, dynamic>{
  'email': instance.email,
  'tencent_captcha_randstr': ?instance.tencentCaptchaRandstr,
  'tencent_captcha_ticket': ?instance.tencentCaptchaTicket,
  'turnstile_token': ?instance.turnstileToken,
};

Map<String, dynamic> _$Sub2ApiInvitationCodeValidationRequestDtoToJson(
  Sub2ApiInvitationCodeValidationRequestDto instance,
) => <String, dynamic>{'code': instance.code};

Map<String, dynamic> _$Sub2ApiForgotPasswordRequestDtoToJson(
  Sub2ApiForgotPasswordRequestDto instance,
) => <String, dynamic>{
  'email': instance.email,
  'tencent_captcha_randstr': ?instance.tencentCaptchaRandstr,
  'tencent_captcha_ticket': ?instance.tencentCaptchaTicket,
  'turnstile_token': ?instance.turnstileToken,
};

Map<String, dynamic> _$Sub2ApiResetPasswordRequestDtoToJson(
  Sub2ApiResetPasswordRequestDto instance,
) => <String, dynamic>{
  'email': instance.email,
  'new_password': instance.newPassword,
  'token': instance.token,
};

Map<String, dynamic> _$Sub2ApiRefreshRequestDtoToJson(
  Sub2ApiRefreshRequestDto instance,
) => <String, dynamic>{'refresh_token': instance.refreshToken};

Map<String, dynamic> _$Sub2ApiLogoutRequestDtoToJson(
  Sub2ApiLogoutRequestDto instance,
) => <String, dynamic>{'refresh_token': ?instance.refreshToken};

Sub2ApiAuthenticatedUserDto _$Sub2ApiAuthenticatedUserDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('Sub2ApiAuthenticatedUserDto', json, ($checkedConvert) {
  final val = Sub2ApiAuthenticatedUserDto(
    email: $checkedConvert('email', (v) => v as String),
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    role: $checkedConvert('role', (v) => v as String),
    username: $checkedConvert('username', (v) => v as String),
  );
  return val;
});

Sub2ApiLoginResponseDto _$Sub2ApiLoginResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'Sub2ApiLoginResponseDto',
  json,
  ($checkedConvert) {
    final val = Sub2ApiLoginResponseDto(
      accessToken: $checkedConvert('access_token', (v) => v as String?),
      expiresIn: $checkedConvert('expires_in', (v) => (v as num?)?.toInt()),
      refreshToken: $checkedConvert('refresh_token', (v) => v as String?),
      requires2fa: $checkedConvert('requires_2fa', (v) => v as bool?),
      tempToken: $checkedConvert('temp_token', (v) => v as String?),
      tokenType: $checkedConvert('token_type', (v) => v as String?),
      user: $checkedConvert(
        'user',
        (v) => v == null
            ? null
            : Sub2ApiAuthenticatedUserDto.fromJson(v as Map<String, dynamic>),
      ),
      userEmailMasked: $checkedConvert(
        'user_email_masked',
        (v) => v as String?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'accessToken': 'access_token',
    'expiresIn': 'expires_in',
    'refreshToken': 'refresh_token',
    'requires2fa': 'requires_2fa',
    'tempToken': 'temp_token',
    'tokenType': 'token_type',
    'userEmailMasked': 'user_email_masked',
  },
);

Sub2ApiRefreshResponseDto _$Sub2ApiRefreshResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'Sub2ApiRefreshResponseDto',
  json,
  ($checkedConvert) {
    final val = Sub2ApiRefreshResponseDto(
      accessToken: $checkedConvert('access_token', (v) => v as String),
      expiresIn: $checkedConvert('expires_in', (v) => (v as num).toInt()),
      refreshToken: $checkedConvert('refresh_token', (v) => v as String),
      tokenType: $checkedConvert('token_type', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'accessToken': 'access_token',
    'expiresIn': 'expires_in',
    'refreshToken': 'refresh_token',
    'tokenType': 'token_type',
  },
);

Sub2ApiEmailVerificationCodeSentDto
_$Sub2ApiEmailVerificationCodeSentDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Sub2ApiEmailVerificationCodeSentDto', json, (
      $checkedConvert,
    ) {
      final val = Sub2ApiEmailVerificationCodeSentDto(
        countdown: $checkedConvert('countdown', (v) => (v as num).toInt()),
        message: $checkedConvert('message', (v) => v as String),
      );
      return val;
    });

Sub2ApiInvitationCodeValidationDto _$Sub2ApiInvitationCodeValidationDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'Sub2ApiInvitationCodeValidationDto',
  json,
  ($checkedConvert) {
    final val = Sub2ApiInvitationCodeValidationDto(
      valid: $checkedConvert('valid', (v) => v as bool),
      errorCode: $checkedConvert('error_code', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'errorCode': 'error_code'},
);

Sub2ApiPromoCodeValidationDto _$Sub2ApiPromoCodeValidationDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'Sub2ApiPromoCodeValidationDto',
  json,
  ($checkedConvert) {
    final val = Sub2ApiPromoCodeValidationDto(
      valid: $checkedConvert('valid', (v) => v as bool),
      bonusAmount: $checkedConvert('bonus_amount', (v) => v as num?),
      errorCode: $checkedConvert('error_code', (v) => v as String?),
      message: $checkedConvert('message', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'bonusAmount': 'bonus_amount', 'errorCode': 'error_code'},
);

Sub2ApiAuthMessageDto _$Sub2ApiAuthMessageDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('Sub2ApiAuthMessageDto', json, ($checkedConvert) {
  final val = Sub2ApiAuthMessageDto(
    message: $checkedConvert('message', (v) => v as String),
  );
  return val;
});
