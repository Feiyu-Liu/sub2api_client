import '../shared/models/sensitive_value.dart';

/// Third-party identity providers accepted by the fixed binding contract.
enum Sub2ApiIdentityProvider {
  linuxDo('linuxdo'),
  oidc('oidc'),
  weChat('wechat'),
  dingTalk('dingtalk');

  const Sub2ApiIdentityProvider(this.wireName);

  final String wireName;

  static Sub2ApiIdentityProvider fromWire(String value) => switch (value) {
    'linuxdo' => Sub2ApiIdentityProvider.linuxDo,
    'oidc' => Sub2ApiIdentityProvider.oidc,
    'wechat' => Sub2ApiIdentityProvider.weChat,
    'dingtalk' => Sub2ApiIdentityProvider.dingTalk,
    _ => throw const FormatException('Unknown identity provider.'),
  };
}

/// Request to prepare a third-party identity binding redirect.
final class Sub2ApiStartIdentityBindingRequest {
  const Sub2ApiStartIdentityBindingRequest({
    required this.provider,
    this.redirectTo = '/profile',
  });

  final Sub2ApiIdentityProvider provider;
  final String redirectTo;
}

/// Browser instruction for starting a third-party identity binding flow.
final class Sub2ApiIdentityBindingInstruction {
  const Sub2ApiIdentityBindingInstruction({
    required this.provider,
    required this.authorizeUri,
    required this.method,
    required this.useBrowserRedirect,
  });

  final Uri authorizeUri;
  final String method;
  final Sub2ApiIdentityProvider provider;
  final bool useBrowserRedirect;
}

/// Acknowledgement after an identity verification code is sent.
final class Sub2ApiIdentityCodeSent {
  const Sub2ApiIdentityCodeSent({required this.message});

  final String message;
}

/// Credentials used to bind a local email identity.
final class Sub2ApiBindEmailIdentityRequest {
  const Sub2ApiBindEmailIdentityRequest({
    required this.email,
    required this.verificationCode,
    required this.password,
  });

  final String email;
  final Sub2ApiPassword password;
  final Sub2ApiVerificationCode verificationCode;

  @override
  String toString() => 'Sub2ApiBindEmailIdentityRequest(<redacted>)';
}

/// Verification code used to add a notification email.
final class Sub2ApiVerifyNotificationEmailRequest {
  const Sub2ApiVerifyNotificationEmailRequest({
    required this.email,
    required this.code,
  });

  final Sub2ApiVerificationCode code;
  final String email;

  @override
  String toString() => 'Sub2ApiVerifyNotificationEmailRequest(<redacted>)';
}

/// Browser instruction for the server-rendered unsubscribe result page.
final class Sub2ApiNotificationUnsubscribeInstruction {
  const Sub2ApiNotificationUnsubscribeInstruction({required this.uri});

  final Uri uri;

  @override
  String toString() =>
      'Sub2ApiNotificationUnsubscribeInstruction(uri: <redacted>)';
}
