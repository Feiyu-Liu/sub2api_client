import '../shared/models/sensitive_value.dart';

final class Sub2ApiAdminGrokOAuthCapabilities {
  const Sub2ApiAdminGrokOAuthCapabilities({required this.passwordAuthEnabled});
  final bool passwordAuthEnabled;
}

final class Sub2ApiAdminGrokGenerateAuthUrlRequest {
  const Sub2ApiAdminGrokGenerateAuthUrlRequest({
    this.proxyId,
    this.redirectUri,
  });
  final int? proxyId;
  final Uri? redirectUri;
}

final class Sub2ApiAdminGrokAuthUrlResult {
  const Sub2ApiAdminGrokAuthUrlResult({
    required this.authorizationUrl,
    required this.sessionId,
    required this.state,
  });
  final Sub2ApiGrokOAuthAuthorizationUrl authorizationUrl;
  final Sub2ApiGrokOAuthSessionId sessionId;
  final Sub2ApiGrokOAuthState state;
}

final class Sub2ApiAdminGrokExchangeCodeRequest {
  const Sub2ApiAdminGrokExchangeCodeRequest({
    required this.sessionId,
    required this.code,
    required this.state,
    this.redirectUri,
    this.proxyId,
  });
  final Sub2ApiGrokOAuthSessionId sessionId;
  final Sub2ApiOAuthAuthorizationCode code;
  final Sub2ApiGrokOAuthState state;
  final Uri? redirectUri;
  final int? proxyId;
}

final class Sub2ApiAdminGrokRefreshTokenRequest {
  const Sub2ApiAdminGrokRefreshTokenRequest({
    required this.refreshToken,
    this.clientId = '',
    this.proxyId,
  });
  final Sub2ApiRefreshToken refreshToken;
  final String clientId;
  final int? proxyId;
}

final class Sub2ApiAdminGrokSsoTokenRequest {
  const Sub2ApiAdminGrokSsoTokenRequest({required this.ssoToken, this.proxyId});
  final Sub2ApiGrokSsoToken ssoToken;
  final int? proxyId;
}

final class Sub2ApiAdminGrokPasswordRequest {
  const Sub2ApiAdminGrokPasswordRequest({
    required this.email,
    required this.password,
    this.proxyId,
  });
  final String email;
  final Sub2ApiPassword password;
  final int? proxyId;
}

final class Sub2ApiAdminGrokTokenInfo {
  const Sub2ApiAdminGrokTokenInfo({
    required this.accessToken,
    required this.expiresIn,
    required this.expiresAt,
    required this.tokenType,
    required this.clientId,
    required this.scope,
    required this.email,
    required this.subject,
    required this.teamId,
    required this.subscriptionTier,
    required this.entitlementStatus,
    this.refreshToken,
    this.idToken,
  });
  final Sub2ApiAccessToken accessToken;
  final Sub2ApiRefreshToken? refreshToken;
  final Sub2ApiGrokIdToken? idToken;
  final String tokenType;
  final int expiresIn;
  final DateTime expiresAt;
  final String clientId;
  final String scope;
  final String email;
  final String subject;
  final String teamId;
  final String subscriptionTier;
  final String entitlementStatus;
}
