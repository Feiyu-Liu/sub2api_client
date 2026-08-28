import '../shared/models/sensitive_value.dart';

enum Sub2ApiAdminGeminiOAuthType { codeAssist, googleOne, aiStudio }

final class Sub2ApiAdminGeminiOAuthCapabilities {
  Sub2ApiAdminGeminiOAuthCapabilities({
    required this.aiStudioOAuthEnabled,
    required List<Uri> requiredRedirectUris,
  }) : requiredRedirectUris = List.unmodifiable(requiredRedirectUris);

  final bool aiStudioOAuthEnabled;
  final List<Uri> requiredRedirectUris;
}

final class Sub2ApiAdminGeminiOAuthAuthorization {
  const Sub2ApiAdminGeminiOAuthAuthorization({
    required this.authorizationUrl,
    required this.sessionId,
    required this.state,
  });

  final Uri authorizationUrl;
  final Sub2ApiAdminOAuthSessionId sessionId;
  final Sub2ApiAdminOAuthState state;

  @override
  String toString() =>
      'Sub2ApiAdminGeminiOAuthAuthorization(authorizationUrl: '
      '$authorizationUrl, sessionId: <redacted>, state: <redacted>)';
}

final class Sub2ApiAdminGeminiExchangeCodeRequest {
  const Sub2ApiAdminGeminiExchangeCodeRequest({
    required this.sessionId,
    required this.state,
    required this.code,
    this.proxyId,
    this.oauthType = Sub2ApiAdminGeminiOAuthType.codeAssist,
    this.tierId,
  });

  final Sub2ApiAdminOAuthSessionId sessionId;
  final Sub2ApiAdminOAuthState state;
  final Sub2ApiOAuthAuthorizationCode code;
  final int? proxyId;
  final Sub2ApiAdminGeminiOAuthType oauthType;
  final String? tierId;

  @override
  String toString() =>
      'Sub2ApiAdminGeminiExchangeCodeRequest(sessionId: <redacted>, '
      'state: <redacted>, code: <redacted>, proxyId: $proxyId, '
      'oauthType: $oauthType, tierId: $tierId)';
}

final class Sub2ApiAdminGeminiDriveStorage {
  const Sub2ApiAdminGeminiDriveStorage({
    required this.limitBytes,
    required this.usageBytes,
    required this.updatedAt,
  });

  final int limitBytes;
  final int usageBytes;
  final DateTime updatedAt;
}

final class Sub2ApiAdminGeminiTokenInfo {
  const Sub2ApiAdminGeminiTokenInfo({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.scope,
    required this.expiresIn,
    required this.expiresAt,
    required this.projectId,
    required this.oauthType,
    required this.tierId,
    required this.driveStorage,
  });

  final Sub2ApiAccessToken accessToken;
  final Sub2ApiRefreshToken? refreshToken;
  final String tokenType;
  final String scope;
  final Duration expiresIn;
  final DateTime expiresAt;
  final String projectId;
  final Sub2ApiAdminGeminiOAuthType oauthType;
  final String tierId;
  final Sub2ApiAdminGeminiDriveStorage? driveStorage;

  @override
  String toString() =>
      'Sub2ApiAdminGeminiTokenInfo(accessToken: <redacted>, '
      'refreshToken: <redacted>, tokenType: $tokenType, scope: $scope, '
      'expiresIn: $expiresIn, expiresAt: $expiresAt, '
      'projectId: $projectId, oauthType: $oauthType, tierId: $tierId, '
      'driveStorage: $driveStorage)';
}
