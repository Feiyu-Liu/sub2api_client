// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_wire_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthStartWireDto _$OAuthStartWireDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OAuthStartWireDto', json, ($checkedConvert) {
      final val = OAuthStartWireDto(
        authorizeUrl: $checkedConvert('authorize_url', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'authorizeUrl': 'authorize_url'});

OAuthPendingCompletionWireDto _$OAuthPendingCompletionWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'OAuthPendingCompletionWireDto',
  json,
  ($checkedConvert) {
    final val = OAuthPendingCompletionWireDto(
      accessToken: $checkedConvert('access_token', (v) => v as String?),
      adoptionRequired: $checkedConvert('adoption_required', (v) => v as bool?),
      authResult: $checkedConvert('auth_result', (v) => v as String?),
      choiceReason: $checkedConvert('choice_reason', (v) => v as String?),
      createAccountAllowed: $checkedConvert(
        'create_account_allowed',
        (v) => v as bool?,
      ),
      email: $checkedConvert('email', (v) => v as String?),
      emailBindingRequired: $checkedConvert(
        'email_binding_required',
        (v) => v as bool?,
      ),
      error: $checkedConvert('error', (v) => v as String?),
      existingAccountBindable: $checkedConvert(
        'existing_account_bindable',
        (v) => v as bool?,
      ),
      expiresIn: $checkedConvert('expires_in', (v) => (v as num?)?.toInt()),
      forceEmailOnSignup: $checkedConvert(
        'force_email_on_signup',
        (v) => v as bool?,
      ),
      intent: $checkedConvert('intent', (v) => v as String?),
      provider: $checkedConvert('provider', (v) => v as String?),
      redirect: $checkedConvert('redirect', (v) => v as String?),
      refreshToken: $checkedConvert('refresh_token', (v) => v as String?),
      requires2fa: $checkedConvert('requires_2fa', (v) => v as bool?),
      requiresEmailCompletion: $checkedConvert(
        'requires_email_completion',
        (v) => v as bool?,
      ),
      resolvedEmail: $checkedConvert('resolved_email', (v) => v as String?),
      step: $checkedConvert('step', (v) => v as String?),
      suggestedAvatarUrl: $checkedConvert(
        'suggested_avatar_url',
        (v) => v as String?,
      ),
      suggestedDisplayName: $checkedConvert(
        'suggested_display_name',
        (v) => v as String?,
      ),
      tempToken: $checkedConvert('temp_token', (v) => v as String?),
      tokenType: $checkedConvert('token_type', (v) => v as String?),
      userEmailMasked: $checkedConvert(
        'user_email_masked',
        (v) => v as String?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'accessToken': 'access_token',
    'adoptionRequired': 'adoption_required',
    'authResult': 'auth_result',
    'choiceReason': 'choice_reason',
    'createAccountAllowed': 'create_account_allowed',
    'emailBindingRequired': 'email_binding_required',
    'existingAccountBindable': 'existing_account_bindable',
    'expiresIn': 'expires_in',
    'forceEmailOnSignup': 'force_email_on_signup',
    'refreshToken': 'refresh_token',
    'requires2fa': 'requires_2fa',
    'requiresEmailCompletion': 'requires_email_completion',
    'resolvedEmail': 'resolved_email',
    'suggestedAvatarUrl': 'suggested_avatar_url',
    'suggestedDisplayName': 'suggested_display_name',
    'tempToken': 'temp_token',
    'tokenType': 'token_type',
    'userEmailMasked': 'user_email_masked',
  },
);

OAuthPendingEmailCodeWireDto _$OAuthPendingEmailCodeWireDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('OAuthPendingEmailCodeWireDto', json, ($checkedConvert) {
  final val = OAuthPendingEmailCodeWireDto(
    countdown: $checkedConvert('countdown', (v) => (v as num?)?.toInt()),
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});
