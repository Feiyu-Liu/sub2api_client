import 'package:json_annotation/json_annotation.dart';

import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../../shared/session/sub2api_session.dart';
import '../sub2api_oauth_models.dart';

part 'oauth_wire_dtos.g.dart';

@JsonSerializable(createToJson: false, checked: true)
final class OAuthStartWireDto {
  const OAuthStartWireDto({required this.authorizeUrl});

  factory OAuthStartWireDto.fromJson(Map<String, Object?> json) =>
      _$OAuthStartWireDtoFromJson(json);

  @JsonKey(name: 'authorize_url')
  final String authorizeUrl;

  Uri toAuthorizeUri() {
    final uri = Uri.tryParse(authorizeUrl);
    if (uri == null || !uri.isAbsolute || uri.host.isEmpty) {
      throw invalidOAuthStartResponse;
    }
    return uri;
  }
}

const invalidOAuthStartResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_oauth_start_response',
  retryable: false,
);

@JsonSerializable(
  createToJson: false,
  checked: true,
  fieldRename: FieldRename.snake,
)
final class OAuthPendingCompletionWireDto {
  const OAuthPendingCompletionWireDto({
    this.accessToken,
    this.adoptionRequired,
    this.authResult,
    this.choiceReason,
    this.createAccountAllowed,
    this.email,
    this.emailBindingRequired,
    this.error,
    this.existingAccountBindable,
    this.expiresIn,
    this.forceEmailOnSignup,
    this.intent,
    this.provider,
    this.redirect,
    this.refreshToken,
    this.requires2fa,
    this.requiresEmailCompletion,
    this.resolvedEmail,
    this.step,
    this.suggestedAvatarUrl,
    this.suggestedDisplayName,
    this.tempToken,
    this.tokenType,
    this.userEmailMasked,
  });

  factory OAuthPendingCompletionWireDto.fromJson(Map<String, Object?> json) =>
      _$OAuthPendingCompletionWireDtoFromJson(json);

  final String? accessToken;
  final bool? adoptionRequired;
  final String? authResult;
  final String? choiceReason;
  final bool? createAccountAllowed;
  final String? email;
  final bool? emailBindingRequired;
  final String? error;
  final bool? existingAccountBindable;
  final int? expiresIn;
  final bool? forceEmailOnSignup;
  final String? intent;
  final String? provider;
  final String? redirect;
  final String? refreshToken;
  @JsonKey(name: 'requires_2fa')
  final bool? requires2fa;
  final bool? requiresEmailCompletion;
  final String? resolvedEmail;
  final String? step;
  final String? suggestedAvatarUrl;
  final String? suggestedDisplayName;
  final String? tempToken;
  final String? tokenType;
  final String? userEmailMasked;

  Sub2ApiOAuthPendingCompletion toPublicModel({
    required String scope,
    DateTime Function()? now,
  }) {
    final redirectUri = _optionalUri(redirect);
    if (_notBlank(accessToken)) {
      if (!_notBlank(refreshToken) ||
          !_notBlank(tokenType) ||
          expiresIn == null ||
          expiresIn! <= 0) {
        throw invalidOAuthPendingCompletion;
      }
      return Sub2ApiOAuthPendingCompletion.authenticated(
        authResult: authResult,
        redirectUri: redirectUri,
        session: Sub2ApiSession(
          accessToken: Sub2ApiAccessToken(accessToken!),
          expiresAt: (now ?? DateTime.now)().add(Duration(seconds: expiresIn!)),
          refreshToken: Sub2ApiRefreshToken(refreshToken!),
          scope: scope,
        ),
      );
    }
    if (requires2fa == true) {
      if (!_notBlank(tempToken) || !_notBlank(userEmailMasked)) {
        throw invalidOAuthPendingCompletion;
      }
      return Sub2ApiOAuthPendingCompletion.twoFactorRequired(
        redirectUri: redirectUri,
        temporaryToken: Sub2ApiTwoFactorTemporaryToken(tempToken!),
        userEmailMasked: userEmailMasked!,
      );
    }

    final hasAction = <Object?>[
      step,
      error,
      provider,
      intent,
      email,
      resolvedEmail,
      adoptionRequired,
      createAccountAllowed,
      forceEmailOnSignup,
      emailBindingRequired,
      existingAccountBindable,
      requiresEmailCompletion,
      choiceReason,
    ].any((value) => value != null);
    if (hasAction) {
      return Sub2ApiOAuthPendingCompletion.actionRequired(
        action: Sub2ApiOAuthPendingAction(
          adoptionRequired: adoptionRequired,
          choiceReason: choiceReason,
          createAccountAllowed: createAccountAllowed,
          email: email,
          emailBindingRequired: emailBindingRequired,
          error: error,
          existingAccountBindable: existingAccountBindable,
          forceEmailOnSignup: forceEmailOnSignup,
          intent: intent,
          provider: provider,
          redirectUri: redirectUri,
          requiresEmailCompletion: requiresEmailCompletion,
          resolvedEmail: resolvedEmail,
          step: step,
          suggestedAvatarUrl: suggestedAvatarUrl,
          suggestedDisplayName: suggestedDisplayName,
        ),
      );
    }
    return Sub2ApiOAuthPendingCompletion.bindingCompleted(
      authResult: authResult,
      redirectUri: redirectUri,
    );
  }
}

@JsonSerializable(createToJson: false, checked: true)
final class OAuthPendingEmailCodeWireDto {
  const OAuthPendingEmailCodeWireDto({this.countdown, this.message});

  factory OAuthPendingEmailCodeWireDto.fromJson(Map<String, Object?> json) =>
      _$OAuthPendingEmailCodeWireDtoFromJson(json);

  final int? countdown;
  final String? message;

  Sub2ApiOAuthPendingEmailCodeResult toCodeSent() {
    if (!_notBlank(message) || countdown == null || countdown! < 0) {
      throw invalidOAuthPendingEmailCodeResponse;
    }
    return Sub2ApiOAuthPendingEmailCodeResult.codeSent(
      cooldown: Duration(seconds: countdown!),
      message: message!,
    );
  }
}

bool _notBlank(String? value) => value != null && value.trim().isNotEmpty;

Uri? _optionalUri(String? value) {
  if (value == null || value.trim().isEmpty) return null;
  try {
    return Uri.parse(value.trim());
  } on Object {
    throw invalidOAuthPendingCompletion;
  }
}

const invalidOAuthPendingCompletion = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_oauth_pending_completion',
  retryable: false,
);

const invalidOAuthPendingEmailCodeResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_oauth_pending_email_code_response',
  retryable: false,
);
