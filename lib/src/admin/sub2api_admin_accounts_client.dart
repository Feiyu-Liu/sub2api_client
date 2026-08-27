import 'dart:convert';

import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/models/sensitive_value.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_account_models.dart';
import 'sub2api_admin_credential_mode.dart';
import 'wire/admin_account_wire_mapper.dart';
import 'wire/admin_account_wire_service.dart';

abstract interface class Sub2ApiAdminAccountsClient {
  Future<Sub2ApiAdminAccountPage> list({
    Sub2ApiAdminAccountListQuery query = const Sub2ApiAdminAccountListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccount> getById(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccount> duplicate(
    int accountId,
    Sub2ApiAdminDuplicateAccountRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountActionResult> delete(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountBatchDeleteResult> batchDelete(
    List<int> accountIds, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountBatchMaintenanceResult> batchClearErrors(
    List<int> accountIds, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountBatchMaintenanceResult> batchRefreshCredentials(
    List<int> accountIds, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountBatchMaintenanceResult> batchRefreshGoogleOneTiers({
    List<int> accountIds = const [],
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountRefreshResult> refreshCredentials(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountTierRefreshResult> refreshGoogleOneTier(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<String>> previewUpstreamModels(
    Sub2ApiAdminUpstreamModelPreviewRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUpstreamBillingProbeSettings>
  getUpstreamBillingProbeSettings({Sub2ApiRequestOptions? requestOptions});

  Future<Sub2ApiAdminUpstreamBillingProbeSettings>
  updateUpstreamBillingProbeSettings({
    required bool enabled,
    required int intervalMinutes,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUpstreamBillingProbeBatchResult> probeUpstreamBillingBatch(
    List<int> accountIds, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountProbeToggleResult> setUpstreamBillingProbeEnabled(
    int accountId, {
    required bool enabled,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminUpstreamBillingProbeResult> probeUpstreamBilling(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOllamaCloudUsageSettings> getOllamaCloudUsageSettings({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOllamaCloudUsageSettings> updateOllamaCloudUsageSettings({
    required bool enabled,
    required int intervalMinutes,
    required int debounceMinutes,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOllamaCloudUsageState> getOllamaCloudUsage(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOllamaCloudUsageState> saveOllamaCloudUsageSession(
    int accountId,
    Sub2ApiOllamaCloudSession session, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOllamaCloudUsageState> deleteOllamaCloudUsageSession(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOllamaCloudUsageState> setOllamaCloudUsageAutoRefresh(
    int accountId, {
    required bool enabled,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOllamaCloudUsageState> refreshOllamaCloudUsage(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccount> recoverState(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccount> clearError(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountActionResult> revertProxyFallback(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccount> clearRateLimit(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccount> resetQuota(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountActionResult> clearTempUnschedulable(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccount> setSchedulable(
    int accountId, {
    required bool schedulable,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccount> setPrivacy(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountBatchUsage> getBatchUsage(
    List<int> accountIds, {
    bool force = false,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountBatchTodayStats> getBatchTodayStats(
    List<int> accountIds, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminMixedChannelCheck> checkMixedChannel({
    required Sub2ApiAdminAccountPlatform platform,
    required List<int> groupIds,
    int? accountId,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<String>> syncUpstreamModels(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountStats> getStats(
    int accountId, {
    int days = 30,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountUsage> getUsage(
    int accountId, {
    Sub2ApiAdminAccountUsageSource source =
        Sub2ApiAdminAccountUsageSource.active,
    bool force = false,
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountTempUnschedulable> getTempUnschedulable(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminAccountTodayStats> getTodayStats(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminAccountModel>> getModels(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Map<String, String>> getAntigravityDefaultModelMapping({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<List<Sub2ApiAdminScheduledTestPlan>> getScheduledTestPlans(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminAccountsClient createSub2ApiAdminAccountsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Sub2ApiAdminAccountsClient(
  dio: dio,
  requestExecutor: requestExecutor,
  credentialMode: credentialMode,
);

final class _Sub2ApiAdminAccountsClient implements Sub2ApiAdminAccountsClient {
  _Sub2ApiAdminAccountsClient({
    required Dio dio,
    required Sub2ApiRequestExecutor requestExecutor,
    required Sub2ApiAdminCredentialMode credentialMode,
  }) : _requestExecutor = requestExecutor,
       _credentialMode = credentialMode,
       _service = AdminAccountWireService(dio);

  final Sub2ApiRequestExecutor _requestExecutor;
  final Sub2ApiAdminCredentialMode _credentialMode;
  final AdminAccountWireService _service;

  @override
  Future<Sub2ApiAdminAccountPage> list({
    Sub2ApiAdminAccountListQuery query = const Sub2ApiAdminAccountListQuery(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validatePage(query.page, query.pageSize);
    if (query.search != null && query.search!.runes.length > 100) {
      throw _validation('admin.accounts.search_too_long');
    }
    if (query.groupId != null && query.groupId! <= 0) {
      throw _validation('admin.accounts.invalid_group_id');
    }
    if (query.groupId != null && query.ungrouped) {
      throw _validation('admin.accounts.conflicting_group_filter');
    }
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.listAccounts(
        <String, dynamic>{
          if (query.page != null) 'page': query.page,
          if (query.pageSize != null) 'page_size': query.pageSize,
          if (query.platform != null)
            'platform': _wirePlatform(query.platform!),
          if (query.type != null) 'type': _wireType(query.type!),
          if (query.status != null) 'status': query.status!.name,
          if (query.search != null) 'search': query.search!.trim(),
          if (query.groupId != null)
            'group': query.groupId
          else if (query.ungrouped)
            'group': 'ungrouped',
          if (query.privacyMode != null)
            'privacy_mode': query.privacyMode!.trim(),
          'sort_by': _wireSort(query.sortBy),
          'sort_order': query.sortDescending ? 'desc' : 'asc',
          if (query.lite) 'lite': true,
          if (query.includeSchedulerScore) 'include_scheduler_score': true,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAccountPage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccount> getById(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.getAccount(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAccount,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccount> duplicate(
    int accountId,
    Sub2ApiAdminDuplicateAccountRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    final key = request.idempotencyKey.trim();
    if (key.isEmpty) {
      throw _validation('admin.accounts.idempotency_key_required');
    }
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.duplicateAccount(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
        key,
      ),
      decode: mapAdminAccount,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccountActionResult> delete(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.deleteAccount(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAccountActionResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccountBatchDeleteResult> batchDelete(
    List<int> accountIds, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final normalizedIds = _normalizeAccountIds(accountIds);
    if (normalizedIds.isEmpty) {
      throw _validation('admin.accounts.account_ids_required');
    }
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.batchDeleteAccounts(
        <String, Object?>{'account_ids': normalizedIds},
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAccountBatchDeleteResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccountBatchMaintenanceResult> batchClearErrors(
    List<int> accountIds, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final normalizedIds = _requiredAccountIds(accountIds);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.batchClearAccountErrors(
            <String, Object?>{'account_ids': normalizedIds},
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminAccountBatchMaintenanceResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccountBatchMaintenanceResult> batchRefreshCredentials(
    List<int> accountIds, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final normalizedIds = _requiredAccountIds(accountIds);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.batchRefreshAccountCredentials(
            <String, Object?>{'account_ids': normalizedIds},
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminAccountBatchRefreshResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccountBatchMaintenanceResult> batchRefreshGoogleOneTiers({
    List<int> accountIds = const [],
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final normalizedIds = _normalizeAccountIds(accountIds);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.batchRefreshAccountTiers(
            <String, Object?>{'account_ids': normalizedIds},
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminAccountBatchMaintenanceResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccountRefreshResult> refreshCredentials(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.refreshAccountCredentials(
            accountId,
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminAccountRefreshResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccountTierRefreshResult> refreshGoogleOneTier(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.refreshAccountTier(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAccountTierRefreshResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<String>> previewUpstreamModels(
    Sub2ApiAdminUpstreamModelPreviewRequest request, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final apiKey = request.apiKey.reveal().trim();
    if (apiKey.isEmpty) {
      throw _validation('admin.accounts.api_key_required');
    }
    final baseUrl = request.baseUrl;
    if (baseUrl != null &&
        (!baseUrl.hasScheme ||
            (baseUrl.scheme != 'http' && baseUrl.scheme != 'https') ||
            baseUrl.host.isEmpty ||
            baseUrl.userInfo.isNotEmpty ||
            baseUrl.hasFragment)) {
      throw _validation('admin.accounts.invalid_base_url');
    }
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.previewUpstreamModels(
            <String, Object?>{
              'platform': _wirePlatform(request.platform),
              'type': _wireType(request.type),
              'base_url': baseUrl?.toString() ?? '',
              'api_key': apiKey,
            },
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminSyncedUpstreamModels,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUpstreamBillingProbeSettings>
  getUpstreamBillingProbeSettings({Sub2ApiRequestOptions? requestOptions}) =>
      _requestExecutor.protectedRequest(
        send: (cancelToken, options, credential) =>
            _service.upstreamBillingProbeSettings(
              cancelToken,
              options,
              _authorization(credential),
              _apiKey(credential),
            ),
        decode: mapAdminUpstreamBillingProbeSettings,
        requestOptions: requestOptions,
      );

  @override
  Future<Sub2ApiAdminUpstreamBillingProbeSettings>
  updateUpstreamBillingProbeSettings({
    required bool enabled,
    required int intervalMinutes,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateUpstreamBillingProbeInterval(intervalMinutes);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.updateUpstreamBillingProbeSettings(
            <String, Object?>{
              'enabled': enabled,
              'interval_minutes': intervalMinutes,
            },
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminUpstreamBillingProbeSettings,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUpstreamBillingProbeBatchResult> probeUpstreamBillingBatch(
    List<int> accountIds, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final normalizedIds = _validateProbeBatch(accountIds);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.probeUpstreamBillingBatch(
            <String, Object?>{'account_ids': normalizedIds},
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminUpstreamBillingProbeBatchResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccountProbeToggleResult> setUpstreamBillingProbeEnabled(
    int accountId, {
    required bool enabled,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.setUpstreamBillingProbeEnabled(
            accountId,
            <String, Object?>{'enabled': enabled},
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminAccountProbeToggleResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminUpstreamBillingProbeResult> probeUpstreamBilling(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.probeUpstreamBilling(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminUpstreamBillingProbeResult,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOllamaCloudUsageSettings> getOllamaCloudUsageSettings({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, credential) =>
        _service.ollamaCloudUsageSettings(
          cancelToken,
          options,
          _authorization(credential),
          _apiKey(credential),
        ),
    decode: mapAdminOllamaCloudUsageSettings,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminOllamaCloudUsageSettings> updateOllamaCloudUsageSettings({
    required bool enabled,
    required int intervalMinutes,
    required int debounceMinutes,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateOllamaCloudUsageSettings(intervalMinutes, debounceMinutes);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.updateOllamaCloudUsageSettings(
            <String, Object?>{
              'enabled': enabled,
              'interval_minutes': intervalMinutes,
              'debounce_minutes': debounceMinutes,
            },
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminOllamaCloudUsageSettings,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOllamaCloudUsageState> getOllamaCloudUsage(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.ollamaCloudUsage(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminOllamaCloudUsageState,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOllamaCloudUsageState> saveOllamaCloudUsageSession(
    int accountId,
    Sub2ApiOllamaCloudSession session, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    final normalizedSession = _validateOllamaCloudSession(session.reveal());
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.saveOllamaCloudUsageSession(
            accountId,
            <String, Object?>{'session': normalizedSession},
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminOllamaCloudUsageState,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOllamaCloudUsageState> deleteOllamaCloudUsageSession(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.deleteOllamaCloudUsageSession(
            accountId,
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminOllamaCloudUsageState,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOllamaCloudUsageState> setOllamaCloudUsageAutoRefresh(
    int accountId, {
    required bool enabled,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.setOllamaCloudUsageAutoRefresh(
            accountId,
            <String, Object?>{'enabled': enabled},
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminOllamaCloudUsageState,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminOllamaCloudUsageState> refreshOllamaCloudUsage(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.refreshOllamaCloudUsage(
            accountId,
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminOllamaCloudUsageState,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccount> recoverState(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _accountAction(
    accountId,
    send: (cancelToken, options, credential) => _service.recoverAccountState(
      accountId,
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminAccount> clearError(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _accountAction(
    accountId,
    send: (cancelToken, options, credential) => _service.clearAccountError(
      accountId,
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminAccountActionResult> revertProxyFallback(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _messageAction(
    accountId,
    send: (cancelToken, options, credential) =>
        _service.revertAccountProxyFallback(
          accountId,
          cancelToken,
          options,
          _authorization(credential),
          _apiKey(credential),
        ),
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminAccount> clearRateLimit(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _accountAction(
    accountId,
    send: (cancelToken, options, credential) => _service.clearAccountRateLimit(
      accountId,
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminAccount> resetQuota(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _accountAction(
    accountId,
    send: (cancelToken, options, credential) => _service.resetAccountQuota(
      accountId,
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminAccountActionResult> clearTempUnschedulable(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _messageAction(
    accountId,
    send: (cancelToken, options, credential) => _service.clearTempUnschedulable(
      accountId,
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminAccount> setSchedulable(
    int accountId, {
    required bool schedulable,
    Sub2ApiRequestOptions? requestOptions,
  }) => _accountAction(
    accountId,
    send: (cancelToken, options, credential) => _service.setAccountSchedulable(
      accountId,
      <String, Object?>{'schedulable': schedulable},
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminAccount> setPrivacy(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _accountAction(
    accountId,
    send: (cancelToken, options, credential) => _service.setAccountPrivacy(
      accountId,
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminAccountBatchUsage> getBatchUsage(
    List<int> accountIds, {
    bool force = false,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final normalizedIds = _normalizeAccountIds(accountIds);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.batchAccountUsage(
        <String, Object?>{'account_ids': normalizedIds, 'force': force},
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAccountBatchUsage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccountBatchTodayStats> getBatchTodayStats(
    List<int> accountIds, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    final normalizedIds = _normalizeAccountIds(accountIds);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) =>
          _service.batchAccountTodayStats(
            <String, Object?>{'account_ids': normalizedIds},
            cancelToken,
            options,
            _authorization(credential),
            _apiKey(credential),
          ),
      decode: mapAdminAccountBatchTodayStats,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminMixedChannelCheck> checkMixedChannel({
    required Sub2ApiAdminAccountPlatform platform,
    required List<int> groupIds,
    int? accountId,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    if (accountId != null) _validateAccountId(accountId);
    final normalizedGroupIds = _normalizePositiveIds(
      groupIds,
      code: 'admin.accounts.invalid_group_id',
    );
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.checkMixedChannel(
        <String, Object?>{
          'platform': _wirePlatform(platform),
          'group_ids': normalizedGroupIds,
          'account_id': ?accountId,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminMixedChannelCheck,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<String>> syncUpstreamModels(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.syncUpstreamModels(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminSyncedUpstreamModels,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccountStats> getStats(
    int accountId, {
    int days = 30,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    if (days < 1 || days > 90) {
      throw _validation('admin.accounts.invalid_stats_days');
    }
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.accountStats(
        accountId,
        <String, dynamic>{'days': days},
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAccountStats,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccountUsage> getUsage(
    int accountId, {
    Sub2ApiAdminAccountUsageSource source =
        Sub2ApiAdminAccountUsageSource.active,
    bool force = false,
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.accountUsage(
        accountId,
        <String, dynamic>{'source': source.name, if (force) 'force': true},
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAccountUsage,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccountTempUnschedulable> getTempUnschedulable(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.tempUnschedulable(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAccountTempUnschedulable,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminAccountTodayStats> getTodayStats(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.todayStats(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAccountTodayStats,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<List<Sub2ApiAdminAccountModel>> getModels(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedRequest(
      send: (cancelToken, options, credential) => _service.accountModels(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminAccountModels,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Map<String, String>> getAntigravityDefaultModelMapping({
    Sub2ApiRequestOptions? requestOptions,
  }) => _requestExecutor.protectedRequest(
    send: (cancelToken, options, credential) =>
        _service.antigravityDefaultModelMapping(
          cancelToken,
          options,
          _authorization(credential),
          _apiKey(credential),
        ),
    decode: mapAdminAntigravityDefaultModelMapping,
    requestOptions: requestOptions,
  );

  @override
  Future<List<Sub2ApiAdminScheduledTestPlan>> getScheduledTestPlans(
    int accountId, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedRequestAllowingRawSuccess(
      send: (cancelToken, options, credential) => _service.scheduledTestPlans(
        accountId,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminScheduledTestPlans,
      requestOptions: requestOptions,
    );
  }

  String? _authorization(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.jwt ? credential : null;

  String? _apiKey(String? credential) =>
      _credentialMode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;

  Future<Sub2ApiAdminAccount> _accountAction(
    int accountId, {
    required Sub2ApiWireCall send,
    required Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: send,
      decode: mapAdminAccount,
      requestOptions: requestOptions,
    );
  }

  Future<Sub2ApiAdminAccountActionResult> _messageAction(
    int accountId, {
    required Sub2ApiWireCall send,
    required Sub2ApiRequestOptions? requestOptions,
  }) {
    _validateAccountId(accountId);
    return _requestExecutor.protectedNonReplayableRequest(
      send: send,
      decode: mapAdminAccountActionResult,
      requestOptions: requestOptions,
    );
  }
}

void _validateAccountId(int accountId) {
  if (accountId <= 0) throw _validation('admin.accounts.invalid_account_id');
}

void _validateUpstreamBillingProbeInterval(int intervalMinutes) {
  if (intervalMinutes < 5 || intervalMinutes > 1440) {
    throw _validation('admin.accounts.invalid_upstream_probe_interval');
  }
}

List<int> _validateProbeBatch(List<int> accountIds) {
  if (accountIds.isEmpty || accountIds.length > 20) {
    throw _validation('admin.accounts.invalid_probe_batch_size');
  }
  if (accountIds.any((accountId) => accountId <= 0)) {
    throw _validation('admin.accounts.invalid_account_id');
  }
  return <int>{...accountIds}.toList(growable: false);
}

List<int> _normalizeAccountIds(List<int> accountIds) => _normalizePositiveIds(
  accountIds,
  code: 'admin.accounts.invalid_account_id',
);

List<int> _requiredAccountIds(List<int> accountIds) {
  final normalizedIds = _normalizeAccountIds(accountIds);
  if (normalizedIds.isEmpty) {
    throw _validation('admin.accounts.account_ids_required');
  }
  return normalizedIds;
}

List<int> _normalizePositiveIds(List<int> ids, {required String code}) {
  if (ids.any((id) => id <= 0)) throw _validation(code);
  return <int>{...ids}.toList(growable: false);
}

void _validateOllamaCloudUsageSettings(
  int intervalMinutes,
  int debounceMinutes,
) {
  if (intervalMinutes < 15 || intervalMinutes > 1440) {
    throw _validation('admin.accounts.invalid_ollama_usage_interval');
  }
  if (debounceMinutes < 1 || debounceMinutes > 60) {
    throw _validation('admin.accounts.invalid_ollama_usage_debounce');
  }
  if (debounceMinutes >= intervalMinutes) {
    throw _validation('admin.accounts.ollama_usage_debounce_not_less');
  }
}

String _validateOllamaCloudSession(String value) {
  if (utf8.encode(value).length > 16 * 1024) {
    throw _validation('admin.accounts.ollama_session_too_large');
  }
  if (value.contains('\r') || value.contains('\n')) {
    throw _validation('admin.accounts.invalid_ollama_session_header');
  }
  final raw = value.trim();
  if (raw.isEmpty) {
    throw _validation('admin.accounts.ollama_session_required');
  }
  final normalized = <String>[];
  final seen = <String>{};
  for (final rawPart in raw.split(';')) {
    final part = rawPart.trim();
    final separator = part.indexOf('=');
    if (separator <= 0 || separator == part.length - 1) {
      throw _validation('admin.accounts.invalid_ollama_session_cookie');
    }
    final name = part.substring(0, separator).trim();
    final cookieValue = part.substring(separator + 1).trim();
    if (!_cookieNamePattern.hasMatch(name) ||
        name.startsWith(r'$') ||
        cookieValue.isEmpty ||
        cookieValue.contains(';') ||
        cookieValue.contains('\r') ||
        cookieValue.contains('\n')) {
      throw _validation('admin.accounts.invalid_ollama_session_cookie');
    }
    final lowerName = name.toLowerCase();
    if (_setCookieAttributes.contains(lowerName)) {
      throw _validation('admin.accounts.ollama_session_set_cookie_attribute');
    }
    if (!seen.add(lowerName)) {
      throw _validation('admin.accounts.ollama_session_duplicate_cookie');
    }
    if (!_isAllowedOllamaSessionCookie(name)) {
      throw _validation('admin.accounts.ollama_session_cookie_not_allowed');
    }
    normalized.add('$name=$cookieValue');
  }
  return normalized.join('; ');
}

bool _isAllowedOllamaSessionCookie(String name) {
  if (_allowedOllamaSessionCookieNames.contains(name)) return true;
  return _allowedOllamaSessionShardPattern.hasMatch(name);
}

void _validatePage(int? page, int? pageSize) {
  if (page != null && page <= 0) {
    throw _validation('admin.accounts.invalid_page');
  }
  if (pageSize != null && (pageSize <= 0 || pageSize > 100)) {
    throw _validation('admin.accounts.invalid_page_size');
  }
}

String _wirePlatform(Sub2ApiAdminAccountPlatform platform) =>
    switch (platform) {
      Sub2ApiAdminAccountPlatform.openAi => 'openai',
      _ => platform.name,
    };

String _wireType(Sub2ApiAdminAccountType type) => switch (type) {
  Sub2ApiAdminAccountType.setupToken => 'setup-token',
  Sub2ApiAdminAccountType.apiKey => 'apikey',
  Sub2ApiAdminAccountType.serviceAccount => 'service_account',
  _ => type.name,
};

String _wireSort(Sub2ApiAdminAccountSort sort) => switch (sort) {
  Sub2ApiAdminAccountSort.rateMultiplier => 'rate_multiplier',
  Sub2ApiAdminAccountSort.lastUsedAt => 'last_used_at',
  Sub2ApiAdminAccountSort.expiresAt => 'expires_at',
  Sub2ApiAdminAccountSort.createdAt => 'created_at',
  Sub2ApiAdminAccountSort.upstreamBillingRate => 'upstream_billing_rate',
  _ => sort.name,
};

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);

final _cookieNamePattern = RegExp(r"^[!#$%&'*+.^_`|~0-9A-Za-z-]+$");
final _allowedOllamaSessionShardPattern = RegExp(
  r'^(?:next-auth\.session-token|__Secure-next-auth\.session-token|authjs\.session-token|__Secure-authjs\.session-token)\.\d+$',
);
const _allowedOllamaSessionCookieNames = <String>{
  'wos-session',
  '__Secure-session',
  'session',
  'ollama_session',
  '__Host-ollama_session',
  'next-auth.session-token',
  '__Secure-next-auth.session-token',
  'authjs.session-token',
  '__Secure-authjs.session-token',
};
const _setCookieAttributes = <String>{
  'domain',
  'path',
  'expires',
  'max-age',
  'samesite',
  'secure',
  'httponly',
  'partitioned',
};
