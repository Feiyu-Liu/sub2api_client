import 'package:dio/dio.dart';

import '../shared/errors/sub2api_exception.dart';
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

  Future<Sub2ApiAdminUpstreamBillingProbeSettings>
  getUpstreamBillingProbeSettings({Sub2ApiRequestOptions? requestOptions});

  Future<Sub2ApiAdminOllamaCloudUsageSettings> getOllamaCloudUsageSettings({
    Sub2ApiRequestOptions? requestOptions,
  });

  Future<Sub2ApiAdminOllamaCloudUsageState> getOllamaCloudUsage(
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
}

void _validateAccountId(int accountId) {
  if (accountId <= 0) throw _validation('admin.accounts.invalid_account_id');
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
