import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'internal/user_wire_dtos.dart';
import 'internal/user_wire_service.dart';
import 'sub2api_user_models.dart';

/// Provides the authenticated user profile operations supported by v0.1.
abstract interface class Sub2ApiUserClient {
  /// Changes the current user's password.
  Future<void> changePassword(
    Sub2ApiChangePasswordRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads the current authenticated user's profile.
  Future<Sub2ApiUserProfile> getProfile({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Updates the supplied fields of the current authenticated user's profile.
  Future<Sub2ApiUserProfile> updateProfile(
    Sub2ApiUpdateUserProfileRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Reads the current user's affiliate and invitee facts.
  Future<Sub2ApiAffiliateDetail> getAffiliate({
    Sub2ApiRequestOptions? requestOptions,
  });

  /// Transfers all available affiliate quota into the current balance.
  Future<Sub2ApiAffiliateTransfer> transferAffiliateQuota({
    Sub2ApiRequestOptions? requestOptions,
  });
}

/// Creates the package-internal user implementation.
///
/// This factory is deliberately not exported from `sub2api_client.dart`.
Sub2ApiUserClient createSub2ApiUserClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
}) => _Sub2ApiUserClient(dio: dio, requestExecutor: requestExecutor);

final class _Sub2ApiUserClient implements Sub2ApiUserClient {
  /// Creates a user feature client backed by [dio] and [requestExecutor].
  _Sub2ApiUserClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
  }) : _requestExecutor = requestExecutor,
       _service = UserWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final UserWireService _service;

  /// Changes the current user's password.
  @override
  Future<void> changePassword(
    Sub2ApiChangePasswordRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    return _requestExecutor.protectedRequest<void>(
      send: (cancelToken, options, authorization) => _asObjectResponse(
        _service.changePassword(
          <String, Object?>{
            'old_password': request.oldPassword.reveal(),
            'new_password': request.newPassword.reveal(),
          },
          cancelToken,
          options,
          authorization,
        ),
      ),
      decode: (_) {},
      requestOptions: requestOptions,
    );
  }

  /// Reads the current authenticated user's profile.
  @override
  Future<Sub2ApiUserProfile> getProfile({
    Sub2ApiRequestOptions? requestOptions,
  }) {
    return _requestExecutor.protectedRequest<Sub2ApiUserProfile>(
      send: (cancelToken, options, authorization) => _asObjectResponse(
        _service.getProfile(cancelToken, options, authorization),
      ),
      decode: _decodeProfile,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAffiliateDetail> getAffiliate({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, authorization) => _asObjectResponse(
      _service.getAffiliate(cancelToken, options, authorization),
    ),
    decode: _decodeAffiliate,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAffiliateTransfer> transferAffiliateQuota({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedNonReplayableRequest(
    send: (cancelToken, options, authorization) => _asObjectResponse(
      _service.transferAffiliateQuota(cancelToken, options, authorization),
    ),
    decode: _decodeAffiliateTransfer,
    requestOptions: requestOptions,
  );

  /// Updates the supplied fields of the current authenticated user's profile.
  @override
  Future<Sub2ApiUserProfile> updateProfile(
    Sub2ApiUpdateUserProfileRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    return _requestExecutor.protectedRequest<Sub2ApiUserProfile>(
      send: (cancelToken, options, authorization) => _asObjectResponse(
        _service.updateProfile(
          _updateProfileRequestBody(request),
          cancelToken,
          options,
          authorization,
        ),
      ),
      decode: _decodeProfile,
      requestOptions: requestOptions,
    );
  }

  static Future<HttpResponse<Object?>> _asObjectResponse(
    Future<HttpResponse<Map<String, Object?>>> response,
  ) async {
    final resolved = await response;
    return HttpResponse<Object?>(resolved.data, resolved.response);
  }

  static Sub2ApiUserProfile _decodeProfile(Object? data) {
    try {
      if (data is! Map<String, Object?>) {
        throw const Sub2ApiException(
          kind: Sub2ApiFailureKind.protocol,
          code: 'protocol.invalid_user_profile',
          retryable: false,
        );
      }
      final wire = UserProfileWireDto.fromJson(data);
      return Sub2ApiUserProfile(
        id: wire.id,
        email: wire.email,
        username: wire.username,
        role: wire.role,
        balance: Sub2ApiDecimal.fromJson(wire.balance),
        frozenBalance: Sub2ApiDecimal.fromJson(wire.frozenBalance),
        concurrency: wire.concurrency,
        status: wire.status,
        allowedGroups: List<int>.unmodifiable(wire.allowedGroups),
        balanceNotifyEnabled: wire.balanceNotifyEnabled,
        balanceNotifyThresholdType: wire.balanceNotifyThresholdType,
        balanceNotifyThreshold: wire.balanceNotifyThreshold == null
            ? null
            : Sub2ApiDecimal.fromJson(wire.balanceNotifyThreshold),
        totalRecharged: Sub2ApiDecimal.fromJson(wire.totalRecharged),
        rpmLimit: wire.rpmLimit,
        createdAt: wire.createdAt,
        updatedAt: wire.updatedAt,
        lastActiveAt: wire.lastActiveAt,
        avatarUrl: wire.avatarUrl,
      );
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw const Sub2ApiException(
        kind: Sub2ApiFailureKind.protocol,
        code: 'protocol.invalid_user_profile',
        retryable: false,
      );
    }
  }

  static Sub2ApiAffiliateDetail _decodeAffiliate(Object? data) {
    try {
      final wire = AffiliateDetailWireDto.fromJson(_objectMap(data));
      if (wire.userId <= 0 || wire.affCode.isEmpty || wire.affCount < 0) {
        throw _invalidAffiliate;
      }
      return Sub2ApiAffiliateDetail(
        userId: wire.userId,
        affiliateCode: wire.affCode,
        inviterId: wire.inviterId,
        affiliateCount: wire.affCount,
        availableQuota: Sub2ApiDecimal.fromJson(wire.affQuota),
        frozenQuota: Sub2ApiDecimal.fromJson(wire.affFrozenQuota),
        historicalQuota: Sub2ApiDecimal.fromJson(wire.affHistoryQuota),
        effectiveRebateRatePercent: Sub2ApiDecimal.fromJson(
          wire.effectiveRebateRatePercent,
        ),
        invitees: wire.invitees
            .map(
              (invitee) => Sub2ApiAffiliateInvitee(
                userId: invitee.userId,
                email: invitee.email,
                username: invitee.username,
                createdAt: invitee.createdAt,
                totalRebate: Sub2ApiDecimal.fromJson(invitee.totalRebate),
              ),
            )
            .toList(growable: false),
      );
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw _invalidAffiliate;
    }
  }

  static Sub2ApiAffiliateTransfer _decodeAffiliateTransfer(Object? data) {
    try {
      final wire = AffiliateTransferWireDto.fromJson(_objectMap(data));
      return Sub2ApiAffiliateTransfer(
        transferredQuota: Sub2ApiDecimal.fromJson(wire.transferredQuota),
        balance: Sub2ApiDecimal.fromJson(wire.balance),
      );
    } on Sub2ApiException {
      rethrow;
    } on Object {
      throw _invalidAffiliateTransfer;
    }
  }

  static Map<String, Object?> _objectMap(Object? data) {
    if (data is! Map) throw _invalidAffiliate;
    final result = <String, Object?>{};
    for (final entry in data.entries) {
      if (entry.key is! String) throw _invalidAffiliate;
      result[entry.key as String] = entry.value;
    }
    return result;
  }

  static Map<String, Object?> _updateProfileRequestBody(
    Sub2ApiUpdateUserProfileRequest request,
  ) {
    return <String, Object?>{
      if (request.username != null) 'username': request.username,
      if (request.avatarUrl != null) 'avatar_url': request.avatarUrl,
      if (request.balanceNotifyEnabled != null)
        'balance_notify_enabled': request.balanceNotifyEnabled,
      if (request.balanceNotifyThreshold != null)
        'balance_notify_threshold': num.parse(
          request.balanceNotifyThreshold!.toJson(),
        ),
    };
  }
}

const _invalidAffiliate = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_affiliate_response',
  retryable: false,
);

const _invalidAffiliateTransfer = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_affiliate_transfer_response',
  retryable: false,
);
