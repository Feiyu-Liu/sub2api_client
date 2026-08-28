import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../sub2api_admin_antigravity_oauth_models.dart';

Sub2ApiAdminAntigravityOAuthAuthorization mapAdminAntigravityOAuthAuthorization(
  Object? data,
) => _map(() {
  final source = _object(data);
  final url = Uri.parse(_nonEmptyString(source, 'auth_url'));
  if (url.scheme != 'https' ||
      url.host.isEmpty ||
      url.userInfo.isNotEmpty ||
      url.hasFragment) {
    throw const FormatException();
  }
  return Sub2ApiAdminAntigravityOAuthAuthorization(
    authorizationUrl: url,
    sessionId: Sub2ApiAdminOAuthSessionId(
      _nonEmptyString(source, 'session_id'),
    ),
    state: Sub2ApiAdminOAuthState(_nonEmptyString(source, 'state')),
  );
});

Sub2ApiAdminAntigravityTokenInfo mapAdminAntigravityTokenInfo(Object? data) =>
    _map(() {
      final source = _object(data);
      final refreshToken = _optionalString(source, 'refresh_token').trim();
      return Sub2ApiAdminAntigravityTokenInfo(
        accessToken: Sub2ApiAccessToken(
          _nonEmptyString(source, 'access_token'),
        ),
        refreshToken: refreshToken.isEmpty
            ? null
            : Sub2ApiRefreshToken(refreshToken),
        expiresIn: Duration(seconds: _positiveInteger(source, 'expires_in')),
        expiresAt: DateTime.fromMillisecondsSinceEpoch(
          _positiveInteger(source, 'expires_at') * 1000,
          isUtc: true,
        ),
        tokenType: _nonEmptyString(source, 'token_type'),
        email: _optionalString(source, 'email'),
        projectId: _optionalString(source, 'project_id'),
      );
    });

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) throw const FormatException();
    result[entry.key as String] = entry.value;
  }
  return result;
}

String _nonEmptyString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! String || value.trim().isEmpty) throw const FormatException();
  return value;
}

String _optionalString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

int _positiveInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! int || value <= 0) throw const FormatException();
  return value;
}

T _map<T>(T Function() action) {
  try {
    return action();
  } on Sub2ApiException catch (error) {
    if (error.code == _invalidResponse.code) rethrow;
    throw _invalidResponse;
  } on Object {
    throw _invalidResponse;
  }
}

const _invalidResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_antigravity_oauth_response',
  retryable: false,
);
