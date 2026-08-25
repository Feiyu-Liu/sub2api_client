import 'package:json_annotation/json_annotation.dart';

import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/session/sub2api_session.dart';
import '../models/sub2api_auth_models.dart';

part 'sub2api_auth_dto.g.dart';

/// Internal request DTO for the login endpoint.
@JsonSerializable(checked: true, createFactory: false)
final class Sub2ApiLoginRequestDto {
  const Sub2ApiLoginRequestDto({
    required this.email,
    required this.password,
    this.tencentCaptchaRandstr,
    this.tencentCaptchaTicket,
    this.turnstileToken,
  });

  factory Sub2ApiLoginRequestDto.fromPublic(Sub2ApiLoginRequest request) =>
      Sub2ApiLoginRequestDto(
        email: request.email,
        password: request.password.reveal(),
        tencentCaptchaRandstr: request.captcha.tencentCaptchaRandstr,
        tencentCaptchaTicket: request.captcha.tencentCaptchaTicket,
        turnstileToken: request.captcha.turnstileToken,
      );

  final String email;
  final String password;
  @JsonKey(name: 'tencent_captcha_randstr', includeIfNull: false)
  final String? tencentCaptchaRandstr;
  @JsonKey(name: 'tencent_captcha_ticket', includeIfNull: false)
  final String? tencentCaptchaTicket;
  @JsonKey(name: 'turnstile_token', includeIfNull: false)
  final String? turnstileToken;

  Map<String, Object?> toJson() => _$Sub2ApiLoginRequestDtoToJson(this);
}

/// Internal request DTO for the two-factor login endpoint.
@JsonSerializable(checked: true, createFactory: false)
final class Sub2ApiTwoFactorLoginRequestDto {
  const Sub2ApiTwoFactorLoginRequestDto({
    required this.tempToken,
    required this.totpCode,
  });

  factory Sub2ApiTwoFactorLoginRequestDto.fromPublic(
    Sub2ApiTwoFactorLoginRequest request,
  ) => Sub2ApiTwoFactorLoginRequestDto(
    tempToken: request.temporaryToken.reveal(),
    totpCode: request.totpCode,
  );

  @JsonKey(name: 'temp_token')
  final String tempToken;
  @JsonKey(name: 'totp_code')
  final String totpCode;

  Map<String, Object?> toJson() =>
      _$Sub2ApiTwoFactorLoginRequestDtoToJson(this);
}

/// Internal request DTO for `POST /api/v1/auth/register`.
@JsonSerializable(checked: true, createFactory: false)
final class Sub2ApiRegistrationRequestDto {
  const Sub2ApiRegistrationRequestDto({
    required this.email,
    required this.password,
    this.affCode,
    this.invitationCode,
    this.promoCode,
    this.tencentCaptchaRandstr,
    this.tencentCaptchaTicket,
    this.turnstileToken,
    this.verifyCode,
  });

  factory Sub2ApiRegistrationRequestDto.fromPublic(
    Sub2ApiRegistrationRequest request,
  ) => Sub2ApiRegistrationRequestDto(
    email: request.email,
    password: request.password.reveal(),
    affCode: request.affiliateCode,
    invitationCode: request.invitationCode,
    promoCode: request.promoCode,
    tencentCaptchaRandstr: request.captcha.tencentCaptchaRandstr,
    tencentCaptchaTicket: request.captcha.tencentCaptchaTicket,
    turnstileToken: request.captcha.turnstileToken,
    verifyCode: request.verificationCode,
  );

  @JsonKey(name: 'aff_code', includeIfNull: false)
  final String? affCode;
  final String email;
  @JsonKey(name: 'invitation_code', includeIfNull: false)
  final String? invitationCode;
  final String password;
  @JsonKey(name: 'promo_code', includeIfNull: false)
  final String? promoCode;
  @JsonKey(name: 'tencent_captcha_randstr', includeIfNull: false)
  final String? tencentCaptchaRandstr;
  @JsonKey(name: 'tencent_captcha_ticket', includeIfNull: false)
  final String? tencentCaptchaTicket;
  @JsonKey(name: 'turnstile_token', includeIfNull: false)
  final String? turnstileToken;
  @JsonKey(name: 'verify_code', includeIfNull: false)
  final String? verifyCode;

  Map<String, Object?> toJson() => _$Sub2ApiRegistrationRequestDtoToJson(this);
}

/// Internal request DTO for `POST /api/v1/auth/refresh`.
@JsonSerializable(checked: true, createFactory: false)
final class Sub2ApiRefreshRequestDto {
  const Sub2ApiRefreshRequestDto({required this.refreshToken});

  factory Sub2ApiRefreshRequestDto.fromPublic(Sub2ApiRefreshToken token) =>
      Sub2ApiRefreshRequestDto(refreshToken: token.reveal());

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  Map<String, Object?> toJson() => _$Sub2ApiRefreshRequestDtoToJson(this);
}

/// Internal request DTO for `POST /api/v1/auth/logout`.
@JsonSerializable(checked: true, createFactory: false)
final class Sub2ApiLogoutRequestDto {
  const Sub2ApiLogoutRequestDto({this.refreshToken});

  factory Sub2ApiLogoutRequestDto.fromPublic(Sub2ApiRefreshToken? token) =>
      Sub2ApiLogoutRequestDto(refreshToken: token?.reveal());

  @JsonKey(name: 'refresh_token', includeIfNull: false)
  final String? refreshToken;

  Map<String, Object?> toJson() => _$Sub2ApiLogoutRequestDtoToJson(this);
}

/// Internal response DTO for the user portion of a successful authentication.
@JsonSerializable(createToJson: false, checked: true)
final class Sub2ApiAuthenticatedUserDto {
  const Sub2ApiAuthenticatedUserDto({
    required this.email,
    required this.id,
    required this.role,
    required this.username,
  });

  factory Sub2ApiAuthenticatedUserDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiAuthenticatedUserDtoFromJson(json);

  final String email;
  final int id;
  final String role;
  final String username;

  Sub2ApiAuthenticatedUser toPublicModel() => Sub2ApiAuthenticatedUser(
    email: email,
    id: id,
    role: role,
    username: username,
  );
}

/// Internal union-shaped response DTO for password and two-factor login.
@JsonSerializable(createToJson: false, checked: true)
final class Sub2ApiLoginResponseDto {
  const Sub2ApiLoginResponseDto({
    this.accessToken,
    this.expiresIn,
    this.refreshToken,
    this.requires2fa,
    this.tempToken,
    this.tokenType,
    this.user,
    this.userEmailMasked,
  });

  factory Sub2ApiLoginResponseDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiLoginResponseDtoFromJson(json);

  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'expires_in')
  final int? expiresIn;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @JsonKey(name: 'requires_2fa')
  final bool? requires2fa;
  @JsonKey(name: 'temp_token')
  final String? tempToken;
  @JsonKey(name: 'token_type')
  final String? tokenType;
  final Sub2ApiAuthenticatedUserDto? user;
  @JsonKey(name: 'user_email_masked')
  final String? userEmailMasked;

  Sub2ApiLoginResult toPublicModel({
    required String scope,
    DateTime Function()? now,
  }) {
    if (requires2fa == true) {
      if (_notBlank(tempToken) && _notBlank(userEmailMasked)) {
        return Sub2ApiLoginResult.twoFactorRequired(
          temporaryToken: Sub2ApiTwoFactorTemporaryToken(tempToken!),
          userEmailMasked: userEmailMasked!,
        );
      }
      throw _invalidLoginResponse();
    }

    if (!_notBlank(accessToken) || !_notBlank(tokenType) || user == null) {
      throw _invalidLoginResponse();
    }
    if (refreshToken != null && !_notBlank(refreshToken)) {
      throw _invalidLoginResponse();
    }
    if (expiresIn != null && expiresIn! <= 0) {
      throw _invalidLoginResponse();
    }

    final expiry = expiresIn == null
        ? null
        : (now ?? DateTime.now)().add(Duration(seconds: expiresIn!));
    return Sub2ApiLoginResult.authenticated(
      session: Sub2ApiSession(
        accessToken: Sub2ApiAccessToken(accessToken!),
        expiresAt: expiry,
        refreshToken: refreshToken == null
            ? null
            : Sub2ApiRefreshToken(refreshToken!),
        scope: scope,
      ),
      user: user!.toPublicModel(),
    );
  }
}

/// Internal response DTO for a token rotation.
@JsonSerializable(createToJson: false, checked: true)
final class Sub2ApiRefreshResponseDto {
  const Sub2ApiRefreshResponseDto({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.tokenType,
  });

  factory Sub2ApiRefreshResponseDto.fromJson(Map<String, Object?> json) =>
      _$Sub2ApiRefreshResponseDtoFromJson(json);

  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'token_type')
  final String tokenType;

  Sub2ApiRefreshedTokens toPublicModel() {
    if (accessToken.isEmpty ||
        refreshToken.isEmpty ||
        tokenType.isEmpty ||
        expiresIn <= 0) {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.protocol,
        code: 'protocol.invalid_refresh_response',
        retryable: false,
      );
    }
    return Sub2ApiRefreshedTokens(
      accessToken: Sub2ApiAccessToken(accessToken),
      expiresIn: Duration(seconds: expiresIn),
      refreshToken: Sub2ApiRefreshToken(refreshToken),
      tokenType: tokenType,
    );
  }
}

bool _notBlank(String? value) => value != null && value.isNotEmpty;

Sub2ApiException _invalidLoginResponse() => const Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_login_response',
  retryable: false,
);
