import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../sub2api_admin_grok_oauth_models.dart';

Sub2ApiAdminGrokOAuthCapabilities mapAdminGrokCapabilities(Object? data) =>
    _guard(() {
      final source = _object(data);
      return Sub2ApiAdminGrokOAuthCapabilities(
        passwordAuthEnabled: _bool(source['password_auth_enabled']),
      );
    });

Sub2ApiAdminGrokAuthUrlResult mapAdminGrokAuthUrl(Object? data) => _guard(() {
  final source = _object(data);
  final authUrl = _required(source['auth_url']);
  final uri = Uri.parse(authUrl);
  if (!uri.hasScheme || uri.host.isEmpty) throw const FormatException();
  return Sub2ApiAdminGrokAuthUrlResult(
    authorizationUrl: Sub2ApiGrokOAuthAuthorizationUrl(authUrl),
    sessionId: Sub2ApiGrokOAuthSessionId(_required(source['session_id'])),
    state: Sub2ApiGrokOAuthState(_required(source['state'])),
  );
});

Sub2ApiAdminGrokTokenInfo mapAdminGrokTokenInfo(Object? data) => _guard(() {
  final source = _object(data);
  final expiresAt = _positive(source['expires_at']);
  return Sub2ApiAdminGrokTokenInfo(
    accessToken: Sub2ApiAccessToken(_required(source['access_token'])),
    refreshToken: _secret(source['refresh_token'], Sub2ApiRefreshToken.new),
    idToken: _secret(source['id_token'], Sub2ApiGrokIdToken.new),
    tokenType: _text(source['token_type']),
    expiresIn: _nonNegative(source['expires_in']),
    expiresAt: DateTime.fromMillisecondsSinceEpoch(
      expiresAt * 1000,
      isUtc: true,
    ),
    clientId: _text(source['client_id']),
    scope: _text(source['scope']),
    email: _text(source['email']),
    subject: _text(source['sub']),
    teamId: _text(source['team_id']),
    subscriptionTier: _text(source['subscription_tier']),
    entitlementStatus: _text(source['entitlement_status']),
  );
});

T? _secret<T>(Object? value, T Function(String) create) {
  final text = _text(value);
  return text.isEmpty ? null : create(text);
}

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  return Map<String, Object?>.from(value);
}

String _text(Object? value) {
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

String _required(Object? value) {
  final text = _text(value);
  if (text.trim().isEmpty) throw const FormatException();
  return text;
}

bool _bool(Object? value) {
  if (value is! bool) throw const FormatException();
  return value;
}

int _integer(Object? value) {
  if (value is! int) throw const FormatException();
  return value;
}

int _positive(Object? value) {
  final number = _integer(value);
  if (number <= 0) throw const FormatException();
  return number;
}

int _nonNegative(Object? value) {
  final number = _integer(value);
  if (number < 0) throw const FormatException();
  return number;
}

T _guard<T>(T Function() action) {
  try {
    return action();
  } on Object {
    throw _invalid;
  }
}

const _invalid = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_grok_oauth_response',
  retryable: false,
);
