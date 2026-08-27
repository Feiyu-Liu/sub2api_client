import '../shared/models/sensitive_value.dart';

final class Sub2ApiAdminAntigravityOAuthAuthorization {
  const Sub2ApiAdminAntigravityOAuthAuthorization({
    required this.authorizationUrl,
    required this.sessionId,
    required this.state,
  });

  final Uri authorizationUrl;
  final Sub2ApiAdminOAuthSessionId sessionId;
  final Sub2ApiAdminOAuthState state;

  @override
  String toString() =>
      'Sub2ApiAdminAntigravityOAuthAuthorization(authorizationUrl: '
      '$authorizationUrl, sessionId: <redacted>, state: <redacted>)';
}

final class Sub2ApiAdminAntigravityExchangeCodeRequest {
  const Sub2ApiAdminAntigravityExchangeCodeRequest({
    required this.sessionId,
    required this.state,
    required this.code,
    this.proxyId,
  });

  final Sub2ApiAdminOAuthSessionId sessionId;
  final Sub2ApiAdminOAuthState state;
  final Sub2ApiOAuthAuthorizationCode code;
  final int? proxyId;

  @override
  String toString() =>
      'Sub2ApiAdminAntigravityExchangeCodeRequest(sessionId: <redacted>, '
      'state: <redacted>, code: <redacted>, proxyId: $proxyId)';
}

final class Sub2ApiAdminAntigravityTokenInfo {
  const Sub2ApiAdminAntigravityTokenInfo({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.expiresAt,
    required this.tokenType,
    required this.email,
    required this.projectId,
  });

  final Sub2ApiAccessToken accessToken;
  final Sub2ApiRefreshToken? refreshToken;
  final Duration expiresIn;
  final DateTime expiresAt;
  final String tokenType;
  final String email;
  final String projectId;

  @override
  String toString() =>
      'Sub2ApiAdminAntigravityTokenInfo(accessToken: <redacted>, '
      'refreshToken: <redacted>, expiresIn: $expiresIn, '
      'expiresAt: $expiresAt, tokenType: $tokenType, email: $email, '
      'projectId: $projectId)';
}
