import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sensitive_value.dart';
import '../sub2api_admin_gemini_oauth_models.dart';

Sub2ApiAdminGeminiOAuthCapabilities mapAdminGeminiOAuthCapabilities(
  Object? data,
) => _map(() {
  final source = _object(data);
  final redirects = _list(source, 'required_redirect_uris')
      .map((value) {
        if (value is! String) throw const FormatException();
        final uri = Uri.parse(value);
        final secure = uri.scheme == 'https' && uri.host.isNotEmpty;
        final loopback =
            uri.scheme == 'http' &&
            (uri.host == 'localhost' || uri.host == '127.0.0.1');
        if ((!secure && !loopback) || uri.userInfo.isNotEmpty) {
          throw const FormatException();
        }
        return uri;
      })
      .toList(growable: false);
  return Sub2ApiAdminGeminiOAuthCapabilities(
    aiStudioOAuthEnabled: _boolean(source, 'ai_studio_oauth_enabled'),
    requiredRedirectUris: redirects,
  );
});

Sub2ApiAdminGeminiOAuthAuthorization mapAdminGeminiOAuthAuthorization(
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
  return Sub2ApiAdminGeminiOAuthAuthorization(
    authorizationUrl: url,
    sessionId: Sub2ApiAdminOAuthSessionId(
      _nonEmptyString(source, 'session_id'),
    ),
    state: Sub2ApiAdminOAuthState(_nonEmptyString(source, 'state')),
  );
});

Sub2ApiAdminGeminiTokenInfo mapAdminGeminiTokenInfo(Object? data) => _map(() {
  final source = _object(data);
  final refreshToken = _optionalString(source, 'refresh_token').trim();
  final extra = source['extra'] == null
      ? const <String, Object?>{}
      : _object(source['extra']);
  final limit = _nullableNonNegativeInteger(extra, 'drive_storage_limit');
  final usage = _nullableNonNegativeInteger(extra, 'drive_storage_usage');
  final updatedAt = _nullableDateTime(extra, 'drive_tier_updated_at');
  if ((limit == null) != (usage == null) ||
      (usage == null) != (updatedAt == null) ||
      (limit != null && usage! > limit)) {
    throw const FormatException();
  }
  return Sub2ApiAdminGeminiTokenInfo(
    accessToken: Sub2ApiAccessToken(_nonEmptyString(source, 'access_token')),
    refreshToken: refreshToken.isEmpty
        ? null
        : Sub2ApiRefreshToken(refreshToken),
    tokenType: _nonEmptyString(source, 'token_type'),
    scope: _optionalString(source, 'scope'),
    expiresIn: Duration(seconds: _positiveInteger(source, 'expires_in')),
    expiresAt: DateTime.fromMillisecondsSinceEpoch(
      _positiveInteger(source, 'expires_at') * 1000,
      isUtc: true,
    ),
    projectId: _optionalString(source, 'project_id'),
    oauthType: _oauthType(_nonEmptyString(source, 'oauth_type')),
    tierId: _nonEmptyString(source, 'tier_id'),
    driveStorage: limit == null
        ? null
        : Sub2ApiAdminGeminiDriveStorage(
            limitBytes: limit,
            usageBytes: usage!,
            updatedAt: updatedAt!,
          ),
  );
});

Sub2ApiAdminGeminiOAuthType _oauthType(String value) => switch (value) {
  'code_assist' => Sub2ApiAdminGeminiOAuthType.codeAssist,
  'google_one' => Sub2ApiAdminGeminiOAuthType.googleOne,
  'ai_studio' => Sub2ApiAdminGeminiOAuthType.aiStudio,
  _ => throw const FormatException(),
};

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) throw const FormatException();
    result[entry.key as String] = entry.value;
  }
  return result;
}

List<Object?> _list(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

bool _boolean(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! bool) throw const FormatException();
  return value;
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

int? _nullableNonNegativeInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! int || value < 0) throw const FormatException();
  return value;
}

DateTime? _nullableDateTime(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! String || value.trim().isEmpty) throw const FormatException();
  return DateTime.parse(value).toUtc();
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
  code: 'protocol.invalid_admin_gemini_oauth_response',
  retryable: false,
);
