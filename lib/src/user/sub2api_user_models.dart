import 'package:freezed_annotation/freezed_annotation.dart';

import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';

part 'sub2api_user_models.freezed.dart';

/// The authenticated user's profile returned by Sub2API.
@freezed
abstract class Sub2ApiUserProfile with _$Sub2ApiUserProfile {
  /// Creates an immutable user profile snapshot.
  const factory Sub2ApiUserProfile({
    required int id,
    required String email,
    required String username,
    required String role,
    required Sub2ApiDecimal balance,
    required Sub2ApiDecimal frozenBalance,
    required int concurrency,
    required String status,
    required List<int> allowedGroups,
    required bool balanceNotifyEnabled,
    required String balanceNotifyThresholdType,
    required Sub2ApiDecimal? balanceNotifyThreshold,
    required Sub2ApiDecimal totalRecharged,
    required int rpmLimit,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? lastActiveAt,
    String? avatarUrl,
  }) = _Sub2ApiUserProfile;
}

/// A partial update to the authenticated user's profile.
@freezed
abstract class Sub2ApiUpdateUserProfileRequest
    with _$Sub2ApiUpdateUserProfileRequest {
  /// Creates a request that only sends non-null fields.
  const factory Sub2ApiUpdateUserProfileRequest({
    String? username,
    String? avatarUrl,
    bool? balanceNotifyEnabled,
    Sub2ApiDecimal? balanceNotifyThreshold,
  }) = _Sub2ApiUpdateUserProfileRequest;
}

/// Credentials for a password change operation.
///
/// The values intentionally do not participate in a generated `toString()` or
/// generic JSON serialization path.
final class Sub2ApiChangePasswordRequest {
  /// Creates credentials for a password change operation.
  const Sub2ApiChangePasswordRequest({
    required this.oldPassword,
    required this.newPassword,
  });

  /// The current password accepted by the service.
  final Sub2ApiPassword oldPassword;

  /// The replacement password accepted by the service.
  final Sub2ApiPassword newPassword;

  @override
  String toString() => 'Sub2ApiChangePasswordRequest(<redacted>)';
}
