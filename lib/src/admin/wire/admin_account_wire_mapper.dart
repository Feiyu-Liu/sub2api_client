import '../../shared/errors/sub2api_exception.dart';
import '../../shared/models/sub2api_decimal.dart';
import '../../shared/models/sub2api_page.dart';
import '../sub2api_admin_account_models.dart';
import '../sub2api_admin_user_models.dart';

Sub2ApiAdminAccountPage mapAdminAccountPage(Object? data) => _map(() {
  final source = _object(data);
  return Sub2ApiPage<Sub2ApiAdminAccount>(
    items: _list(
      source,
      'items',
    ).map(_object).map(_account).toList(growable: false),
    total: _integer(source, 'total'),
    page: _integer(source, 'page'),
    pageSize: _integer(source, 'page_size'),
    pages: _integer(source, 'pages'),
  );
});

Sub2ApiAdminAccount mapAdminAccount(Object? data) =>
    _map(() => _account(_object(data)));

Sub2ApiAdminAccountActionResult mapAdminAccountActionResult(Object? data) =>
    _map(() {
      final source = _object(data);
      return Sub2ApiAdminAccountActionResult(
        message: _nonEmptyString(source, 'message'),
      );
    });

Sub2ApiAdminAccountBatchDeleteResult mapAdminAccountBatchDeleteResult(
  Object? data,
) => _map(() {
  final source = _object(data);
  final total = _nonNegativeInteger(source, 'total');
  final success = _nonNegativeInteger(source, 'success');
  final failed = _nonNegativeInteger(source, 'failed');
  final successIds = _positiveIntegerList(source, 'success_ids');
  final failedIds = _positiveIntegerList(source, 'failed_ids');
  final errors = _list(source, 'errors')
      .map(_object)
      .map((error) {
        return Sub2ApiAdminAccountBatchError(
          accountId: _positiveInteger(error, 'account_id'),
          error: _nonEmptyString(error, 'error'),
        );
      })
      .toList(growable: false);
  final successSet = successIds.toSet();
  final failedSet = failedIds.toSet();
  final errorIds = errors.map((error) => error.accountId).toSet();
  if (success + failed != total ||
      successIds.length != success ||
      failedIds.length != failed ||
      successSet.length != successIds.length ||
      failedSet.length != failedIds.length ||
      successSet.intersection(failedSet).isNotEmpty ||
      errors.length != failed ||
      errorIds.length != errors.length ||
      !errorIds.containsAll(failedSet) ||
      !failedSet.containsAll(errorIds)) {
    throw const FormatException();
  }
  return Sub2ApiAdminAccountBatchDeleteResult(
    total: total,
    success: success,
    failed: failed,
    successIds: successIds,
    failedIds: failedIds,
    errors: errors,
  );
});

Sub2ApiAdminAccountBatchUsage mapAdminAccountBatchUsage(Object? data) =>
    _map(() {
      final source = _object(data);
      return Sub2ApiAdminAccountBatchUsage(
        usage: _intKeyedMap(
          source['usage'],
          (value) => mapAdminAccountUsage(value),
        ),
        errors: _intKeyedMap(source['errors'], (value) {
          if (value is! String || value.trim().isEmpty) {
            throw const FormatException();
          }
          return value;
        }),
      );
    });

Sub2ApiAdminAccountBatchTodayStats mapAdminAccountBatchTodayStats(
  Object? data,
) => _map(() {
  final source = _object(data);
  return Sub2ApiAdminAccountBatchTodayStats(
    _intKeyedMap(source['stats'], (value) => _todayStats(_object(value))),
  );
});

Sub2ApiAdminMixedChannelCheck mapAdminMixedChannelCheck(Object? data) =>
    _map(() {
      final source = _object(data);
      final hasRisk = _boolean(source, 'has_risk');
      final error = _optionalString(source, 'error');
      final message = _optionalString(source, 'message');
      final details = source['details'] == null
          ? null
          : _mixedChannelDetails(_object(source['details']));
      if (hasRisk) {
        if (error != 'mixed_channel_warning' ||
            message.trim().isEmpty ||
            details == null) {
          throw const FormatException();
        }
      } else if (error.isNotEmpty || message.isNotEmpty || details != null) {
        throw const FormatException();
      }
      return Sub2ApiAdminMixedChannelCheck(
        hasRisk: hasRisk,
        error: error,
        message: message,
        details: details,
      );
    });

List<String> mapAdminSyncedUpstreamModels(Object? data) => _map(() {
  final source = _object(data);
  final models = _list(source, 'models')
      .map((value) {
        if (value is! String || value.trim().isEmpty) {
          throw const FormatException();
        }
        return value;
      })
      .toList(growable: false);
  if (models.isEmpty || models.toSet().length != models.length) {
    throw const FormatException();
  }
  return List.unmodifiable(models);
});

Sub2ApiAdminUpstreamBillingProbeSettings mapAdminUpstreamBillingProbeSettings(
  Object? data,
) => _map(() {
  final source = _object(data);
  return Sub2ApiAdminUpstreamBillingProbeSettings(
    enabled: _boolean(source, 'enabled'),
    intervalMinutes: _positiveInteger(source, 'interval_minutes'),
  );
});

Sub2ApiAdminAccountProbeToggleResult mapAdminAccountProbeToggleResult(
  Object? data,
) => _map(() {
  final source = _object(data);
  return Sub2ApiAdminAccountProbeToggleResult(
    accountId: _positiveInteger(source, 'account_id'),
    enabled: _boolean(source, 'enabled'),
  );
});

Sub2ApiAdminUpstreamBillingProbeResult mapAdminUpstreamBillingProbeResult(
  Object? data,
) => _map(() => _upstreamBillingProbeResult(_object(data)));

Sub2ApiAdminUpstreamBillingProbeBatchResult
mapAdminUpstreamBillingProbeBatchResult(Object? data) => _map(() {
  final source = _object(data);
  return Sub2ApiAdminUpstreamBillingProbeBatchResult(
    _list(
      source,
      'results',
    ).map(_object).map(_upstreamBillingProbeResult).toList(growable: false),
  );
});

Sub2ApiAdminOllamaCloudUsageSettings mapAdminOllamaCloudUsageSettings(
  Object? data,
) => _map(() {
  final source = _object(data);
  return Sub2ApiAdminOllamaCloudUsageSettings(
    enabled: _boolean(source, 'enabled'),
    intervalMinutes: _positiveInteger(source, 'interval_minutes'),
    debounceMinutes: _positiveInteger(source, 'debounce_minutes'),
  );
});

Sub2ApiAdminOllamaCloudUsageState mapAdminOllamaCloudUsageState(Object? data) =>
    _map(() => _ollamaState(_object(data)));

Sub2ApiAdminAccountStats mapAdminAccountStats(Object? data) => _map(() {
  final source = _object(data);
  return Sub2ApiAdminAccountStats(
    history: _list(
      source,
      'history',
    ).map(_object).map(_usageHistory).toList(growable: false),
    summary: _usageSummary(_object(source['summary'])),
    models: _list(
      source,
      'models',
    ).map(_object).map(_modelStats).toList(growable: false),
    endpoints: _list(
      source,
      'endpoints',
    ).map(_object).map(_endpointStats).toList(growable: false),
    upstreamEndpoints: _list(
      source,
      'upstream_endpoints',
    ).map(_object).map(_endpointStats).toList(growable: false),
  );
});

Sub2ApiAdminAccountUsage mapAdminAccountUsage(Object? data) => _map(() {
  final source = _object(data);
  const windowKeys = <String>{
    'five_hour',
    'seven_day',
    'seven_day_sonnet',
    'seven_day_fable',
    'gemini_shared_daily',
    'gemini_pro_daily',
    'gemini_flash_daily',
    'gemini_shared_minute',
    'gemini_pro_minute',
    'gemini_flash_minute',
    'thirty_day',
  };
  final windows = <String, Sub2ApiAdminAccountUsageProgress>{};
  for (final key in windowKeys) {
    if (source[key] != null) {
      windows[key] = _usageProgress(_object(source[key]));
    }
  }
  final providerDetails = <String, Sub2ApiAdminJsonValue>{};
  for (final entry in source.entries) {
    if (entry.key == 'source' ||
        entry.key == 'updated_at' ||
        windowKeys.contains(entry.key)) {
      continue;
    }
    providerDetails[entry.key] = _jsonValue(entry.value);
  }
  return Sub2ApiAdminAccountUsage(
    source: _optionalString(source, 'source'),
    updatedAt: _nullableDateTime(source, 'updated_at'),
    windows: windows,
    providerDetails: Sub2ApiAdminJsonObject(providerDetails),
  );
});

Sub2ApiAdminAccountTempUnschedulable mapAdminAccountTempUnschedulable(
  Object? data,
) => _map(() {
  final source = _object(data);
  final active = _boolean(source, 'active');
  final rawState = source['state'];
  if (!active && rawState != null) throw const FormatException();
  if (active && rawState == null) throw const FormatException();
  return Sub2ApiAdminAccountTempUnschedulable(
    active: active,
    state: rawState == null ? null : _tempState(_object(rawState)),
  );
});

Sub2ApiAdminAccountTodayStats mapAdminAccountTodayStats(Object? data) =>
    _map(() => _todayStats(_object(data)));

List<Sub2ApiAdminAccountModel> mapAdminAccountModels(Object? data) => _map(
  () => _array(data).map(_object).map(_accountModel).toList(growable: false),
);

Map<String, String> mapAdminAntigravityDefaultModelMapping(Object? data) =>
    _map(() {
      final source = _object(data);
      return Map.unmodifiable(
        source.map((key, value) {
          if (value is! String || value.isEmpty) throw const FormatException();
          return MapEntry(key, value);
        }),
      );
    });

List<Sub2ApiAdminScheduledTestPlan> mapAdminScheduledTestPlans(Object? data) =>
    _map(
      () => _array(
        data,
      ).map(_object).map(_scheduledTestPlan).toList(growable: false),
    );

Sub2ApiAdminAccount _account(Map<String, Object?> source) {
  final credentials = _jsonObjectOrEmpty(source['credentials']);
  for (final key in credentials.values.keys) {
    if (_sensitiveCredentialKeys.contains(key)) throw const FormatException();
  }
  final extra = _jsonObjectOrEmpty(source['extra']);
  if (extra.values.keys.any(_managedOllamaExtraKeys.contains)) {
    throw const FormatException();
  }
  return Sub2ApiAdminAccount(
    id: _positiveInteger(source, 'id'),
    name: _nonEmptyString(source, 'name'),
    notes: _nullableString(source, 'notes'),
    platform: _platform(_nonEmptyString(source, 'platform')),
    type: _accountType(_nonEmptyString(source, 'type')),
    credentials: credentials,
    credentialsStatus: _booleanMap(source['credentials_status']),
    extra: extra,
    ollamaCloudUsage: source['ollama_cloud_usage'] == null
        ? null
        : _ollamaState(_object(source['ollama_cloud_usage'])),
    proxyId: _nullablePositiveInteger(source, 'proxy_id'),
    proxyFallbackOriginId: _nullablePositiveInteger(
      source,
      'proxy_fallback_origin_id',
    ),
    proxyFallbackOriginName: _nullableString(
      source,
      'proxy_fallback_origin_name',
    ),
    proxy: source['proxy'] == null ? null : _proxy(_object(source['proxy'])),
    concurrency: _nonNegativeInteger(source, 'concurrency'),
    loadFactor: _nullableNonNegativeInteger(source, 'load_factor'),
    priority: _integer(source, 'priority'),
    rateMultiplier: _decimal(source, 'rate_multiplier'),
    status: _status(_nonEmptyString(source, 'status')),
    errorMessage: _string(source, 'error_message'),
    lastUsedAt: _nullableDateTime(source, 'last_used_at'),
    expiresAt: _nullableUnixDateTime(source, 'expires_at'),
    autoPauseOnExpired: _boolean(source, 'auto_pause_on_expired'),
    createdAt: _dateTime(source, 'created_at'),
    updatedAt: _dateTime(source, 'updated_at'),
    schedulable: _boolean(source, 'schedulable'),
    rateLimitedAt: _nullableDateTime(source, 'rate_limited_at'),
    rateLimitResetAt: _nullableDateTime(source, 'rate_limit_reset_at'),
    overloadUntil: _nullableDateTime(source, 'overload_until'),
    tempUnschedulableUntil: _nullableDateTime(
      source,
      'temp_unschedulable_until',
    ),
    tempUnschedulableReason: _optionalString(
      source,
      'temp_unschedulable_reason',
    ),
    sessionWindowStart: _nullableDateTime(source, 'session_window_start'),
    sessionWindowEnd: _nullableDateTime(source, 'session_window_end'),
    sessionWindowStatus: _optionalString(source, 'session_window_status'),
    windowCostLimit: _nullableDecimal(source, 'window_cost_limit'),
    windowCostStickyReserve: _nullableDecimal(
      source,
      'window_cost_sticky_reserve',
    ),
    maxSessions: _nullablePositiveInteger(source, 'max_sessions'),
    sessionIdleTimeoutMinutes: _nullablePositiveInteger(
      source,
      'session_idle_timeout_minutes',
    ),
    baseRpm: _nullablePositiveInteger(source, 'base_rpm'),
    rpmStrategy: _nullableString(source, 'rpm_strategy'),
    rpmStickyBuffer: _nullableNonNegativeInteger(source, 'rpm_sticky_buffer'),
    userMessageQueueMode: _nullableString(source, 'user_msg_queue_mode'),
    tlsFingerprintEnabled: _nullableBoolean(source, 'enable_tls_fingerprint'),
    tlsFingerprintProfileId: _nullablePositiveInteger(
      source,
      'tls_fingerprint_profile_id',
    ),
    sessionIdMaskingEnabled: _nullableBoolean(
      source,
      'session_id_masking_enabled',
    ),
    cacheTtlOverrideEnabled: _nullableBoolean(
      source,
      'cache_ttl_override_enabled',
    ),
    cacheTtlOverrideTarget: _nullableString(
      source,
      'cache_ttl_override_target',
    ),
    customBaseUrlEnabled: _nullableBoolean(source, 'custom_base_url_enabled'),
    customBaseUrl: _nullableString(source, 'custom_base_url'),
    quotaLimit: _nullableDecimal(source, 'quota_limit'),
    quotaUsed: _nullableDecimal(source, 'quota_used'),
    quotaDailyLimit: _nullableDecimal(source, 'quota_daily_limit'),
    quotaDailyUsed: _nullableDecimal(source, 'quota_daily_used'),
    quotaWeeklyLimit: _nullableDecimal(source, 'quota_weekly_limit'),
    quotaWeeklyUsed: _nullableDecimal(source, 'quota_weekly_used'),
    parentAccountId: _nullablePositiveInteger(source, 'parent_account_id'),
    quotaDimension: _optionalString(source, 'quota_dimension'),
    parentEmail: _optionalString(source, 'parent_email'),
    parentPlanType: _optionalString(source, 'parent_plan_type'),
    parentPrivacyMode: _optionalString(source, 'parent_privacy_mode'),
    parentSubscriptionExpiresAt: _optionalString(
      source,
      'parent_subscription_expires_at',
    ),
    parentChatGptAccountId: _optionalString(
      source,
      'parent_chatgpt_account_id',
    ),
    groupIds: _integerList(source['group_ids']),
    accountGroups: _optionalList(
      source,
      'account_groups',
    ).map(_object).map(_accountGroup).toList(growable: false),
    groups: _optionalList(
      source,
      'groups',
    ).map(_object).map(_groupSummary).toList(growable: false),
    currentConcurrency: _optionalNonNegativeInteger(
      source,
      'current_concurrency',
    ),
    schedulerScore: source['scheduler_score'] == null
        ? null
        : _schedulerScore(_object(source['scheduler_score'])),
    schedulerScores: _optionalList(
      source,
      'scheduler_scores',
    ).map(_object).map(_schedulerGroupScore).toList(growable: false),
    currentWindowCost: _nullableDecimal(source, 'current_window_cost'),
    activeSessions: _nullableNonNegativeInteger(source, 'active_sessions'),
    currentRpm: _nullableNonNegativeInteger(source, 'current_rpm'),
  );
}

Sub2ApiAdminAccountProxy _proxy(Map<String, Object?> source) =>
    Sub2ApiAdminAccountProxy(
      id: _positiveInteger(source, 'id'),
      name: _nonEmptyString(source, 'name'),
      protocol: _nonEmptyString(source, 'protocol'),
      host: _nonEmptyString(source, 'host'),
      port: _positiveInteger(source, 'port'),
      username: _string(source, 'username'),
      status: _nonEmptyString(source, 'status'),
      createdAt: _dateTime(source, 'created_at'),
      updatedAt: _dateTime(source, 'updated_at'),
      expiresAt: _nullableDateTime(source, 'expires_at'),
      fallbackMode: _string(source, 'fallback_mode'),
      backupProxyId: _nullablePositiveInteger(source, 'backup_proxy_id'),
      expiryWarningDays: _nonNegativeInteger(source, 'expiry_warn_days'),
    );

Sub2ApiAdminAccountGroupBinding _accountGroup(Map<String, Object?> source) =>
    Sub2ApiAdminAccountGroupBinding(
      accountId: _positiveInteger(source, 'account_id'),
      groupId: _positiveInteger(source, 'group_id'),
      priority: _integer(source, 'priority'),
      createdAt: _dateTime(source, 'created_at'),
    );

Sub2ApiAdminAccountGroupSummary _groupSummary(Map<String, Object?> source) =>
    Sub2ApiAdminAccountGroupSummary(
      id: _positiveInteger(source, 'id'),
      name: _nonEmptyString(source, 'name'),
      platform: _nonEmptyString(source, 'platform'),
      status: _nonEmptyString(source, 'status'),
    );

Sub2ApiAdminAccountSchedulerScore _schedulerScore(
  Map<String, Object?> source,
) => Sub2ApiAdminAccountSchedulerScore(
  baseScore: _decimal(source, 'base_score'),
  stickyScore: _decimal(source, 'sticky_score'),
  stickyScoreInfinity: _boolean(source, 'sticky_score_infinity'),
  stickyWeightedEnabled: _boolean(source, 'sticky_weighted_enabled'),
);

Sub2ApiAdminAccountSchedulerGroupScore _schedulerGroupScore(
  Map<String, Object?> source,
) => Sub2ApiAdminAccountSchedulerGroupScore(
  groupId: _nullablePositiveInteger(source, 'group_id'),
  groupName: _nullableString(source, 'group_name'),
  groupPriority: _nullableInteger(source, 'group_priority'),
  score: _schedulerScore(source),
);

Sub2ApiAdminOllamaCloudUsageState _ollamaState(Map<String, Object?> source) =>
    Sub2ApiAdminOllamaCloudUsageState(
      accountId: _positiveInteger(source, 'account_id'),
      eligible: _boolean(source, 'eligible'),
      configured: _boolean(source, 'configured'),
      autoRefreshEnabled: _boolean(source, 'auto_refresh_enabled'),
      encryptionKeyConfigured: _boolean(source, 'encryption_key_configured'),
      snapshot: source['snapshot'] == null
          ? null
          : _ollamaSnapshot(_object(source['snapshot'])),
    );

Sub2ApiAdminOllamaCloudUsageSnapshot _ollamaSnapshot(
  Map<String, Object?> source,
) => Sub2ApiAdminOllamaCloudUsageSnapshot(
  status: _nonEmptyString(source, 'status'),
  data: source['data'] == null ? null : _ollamaData(_object(source['data'])),
  fetchedAt: _nullableDateTime(source, 'fetched_at'),
  lastAttemptAt: _dateTime(source, 'last_attempt_at'),
  nextRefreshAt: _dateTime(source, 'next_refresh_at'),
  failureCount: _optionalNonNegativeInteger(source, 'failure_count'),
  httpStatus: _optionalNonNegativeInteger(source, 'http_status'),
  lastError: _optionalString(source, 'last_error'),
);

Sub2ApiAdminOllamaCloudUsageData _ollamaData(Map<String, Object?> source) =>
    Sub2ApiAdminOllamaCloudUsageData(
      plan: _optionalString(source, 'plan'),
      fiveHour: source['five_hour'] == null
          ? null
          : _ollamaWindow(_object(source['five_hour'])),
      sevenDay: source['seven_day'] == null
          ? null
          : _ollamaWindow(_object(source['seven_day'])),
      balance: _optionalString(source, 'balance'),
      models: _optionalList(source, 'models')
          .map(_object)
          .map(
            (model) => Sub2ApiAdminOllamaCloudUsageModel(
              model: _nonEmptyString(model, 'model'),
              window: _nonEmptyString(model, 'window'),
              requests: _nonNegativeInteger(model, 'requests'),
            ),
          )
          .toList(growable: false),
    );

Sub2ApiAdminOllamaCloudUsageWindow _ollamaWindow(Map<String, Object?> source) =>
    Sub2ApiAdminOllamaCloudUsageWindow(
      usedPercent: _decimal(source, 'used_percent'),
      resetAt: _nullableDateTime(source, 'reset_at'),
      resetText: _optionalString(source, 'reset_text'),
    );

Sub2ApiAdminMixedChannelRiskDetails _mixedChannelDetails(
  Map<String, Object?> source,
) => Sub2ApiAdminMixedChannelRiskDetails(
  groupId: _positiveInteger(source, 'group_id'),
  groupName: _nonEmptyString(source, 'group_name'),
  currentPlatform: _nonEmptyString(source, 'current_platform'),
  otherPlatform: _nonEmptyString(source, 'other_platform'),
);

Sub2ApiAdminUpstreamBillingProbeResult _upstreamBillingProbeResult(
  Map<String, Object?> source,
) {
  final snapshot = source['snapshot'] == null
      ? null
      : _upstreamBillingProbeSnapshot(_object(source['snapshot']));
  final error = _optionalString(source, 'error');
  if ((snapshot == null) == error.trim().isEmpty) {
    throw const FormatException();
  }
  return Sub2ApiAdminUpstreamBillingProbeResult(
    accountId: _positiveInteger(source, 'account_id'),
    snapshot: snapshot,
    error: error,
  );
}

Sub2ApiAdminUpstreamBillingProbeSnapshot _upstreamBillingProbeSnapshot(
  Map<String, Object?> source,
) => Sub2ApiAdminUpstreamBillingProbeSnapshot(
  status: _nonEmptyString(source, 'status'),
  data: source['data'] == null
      ? null
      : _upstreamBillingProbeData(_object(source['data'])),
  receivedAt: _nullableDateTime(source, 'received_at'),
  freshUntil: _nullableDateTime(source, 'fresh_until'),
  lastAttemptAt: _dateTime(source, 'last_attempt_at'),
  nextProbeAt: _dateTime(source, 'next_probe_at'),
  failureCount: _optionalNonNegativeInteger(source, 'failure_count'),
  httpStatus: _optionalNonNegativeInteger(source, 'http_status'),
  lastError: _optionalString(source, 'last_error'),
  syncedRateMultiplier: _nullableDecimal(source, 'synced_rate_multiplier'),
);

Sub2ApiAdminUpstreamBillingProbeData _upstreamBillingProbeData(
  Map<String, Object?> source,
) => Sub2ApiAdminUpstreamBillingProbeData(
  object: _nonEmptyString(source, 'object'),
  schemaVersion: _positiveInteger(source, 'schema_version'),
  billingScope: _nonEmptyString(source, 'billing_scope'),
  groupRateMultiplier: _nullableDecimal(source, 'group_rate_multiplier'),
  userRateMultiplier: _nullableDecimal(source, 'user_rate_multiplier'),
  resolvedRateMultiplier: _nullableDecimal(source, 'resolved_rate_multiplier'),
  peakRateEnabled: _nullableBoolean(source, 'peak_rate_enabled'),
  peakStart: _nullableString(source, 'peak_start'),
  peakEnd: _nullableString(source, 'peak_end'),
  peakRateMultiplier: _nullableDecimal(source, 'peak_rate_multiplier'),
  appliedPeakMultiplier: _nullableDecimal(source, 'applied_peak_multiplier'),
  effectiveRateMultiplier: _nullableDecimal(
    source,
    'effective_rate_multiplier',
  ),
  timezone: _nullableString(source, 'timezone'),
  observedAt: _dateTime(source, 'observed_at'),
);

Sub2ApiAdminAccountUsageHistory _usageHistory(Map<String, Object?> source) =>
    Sub2ApiAdminAccountUsageHistory(
      date: _nonEmptyString(source, 'date'),
      label: _string(source, 'label'),
      requests: _nonNegativeInteger(source, 'requests'),
      tokens: _nonNegativeInteger(source, 'tokens'),
      cost: _decimal(source, 'cost'),
      actualCost: _decimal(source, 'actual_cost'),
      userCost: _decimal(source, 'user_cost'),
    );

Sub2ApiAdminAccountUsageSummary _usageSummary(Map<String, Object?> source) =>
    Sub2ApiAdminAccountUsageSummary(
      days: _positiveInteger(source, 'days'),
      actualDaysUsed: _nonNegativeInteger(source, 'actual_days_used'),
      totalCost: _decimal(source, 'total_cost'),
      totalUserCost: _decimal(source, 'total_user_cost'),
      totalStandardCost: _decimal(source, 'total_standard_cost'),
      totalRequests: _nonNegativeInteger(source, 'total_requests'),
      totalTokens: _nonNegativeInteger(source, 'total_tokens'),
      averageDailyCost: _decimal(source, 'avg_daily_cost'),
      averageDailyUserCost: _decimal(source, 'avg_daily_user_cost'),
      averageDailyRequests: _decimal(source, 'avg_daily_requests'),
      averageDailyTokens: _decimal(source, 'avg_daily_tokens'),
      averageDurationMs: _decimal(source, 'avg_duration_ms'),
    );

Sub2ApiAdminAccountModelStats _modelStats(Map<String, Object?> source) =>
    Sub2ApiAdminAccountModelStats(
      model: _nonEmptyString(source, 'model'),
      requests: _nonNegativeInteger(source, 'requests'),
      inputTokens: _nonNegativeInteger(source, 'input_tokens'),
      outputTokens: _nonNegativeInteger(source, 'output_tokens'),
      cacheCreationTokens: _nonNegativeInteger(source, 'cache_creation_tokens'),
      cacheReadTokens: _nonNegativeInteger(source, 'cache_read_tokens'),
      totalTokens: _nonNegativeInteger(source, 'total_tokens'),
      cost: _decimal(source, 'cost'),
      actualCost: _decimal(source, 'actual_cost'),
      accountCost: _decimal(source, 'account_cost'),
    );

Sub2ApiAdminAccountEndpointStats _endpointStats(Map<String, Object?> source) =>
    Sub2ApiAdminAccountEndpointStats(
      endpoint: _nonEmptyString(source, 'endpoint'),
      requests: _nonNegativeInteger(source, 'requests'),
      totalTokens: _nonNegativeInteger(source, 'total_tokens'),
      cost: _decimal(source, 'cost'),
      actualCost: _decimal(source, 'actual_cost'),
    );

Sub2ApiAdminAccountUsageProgress _usageProgress(Map<String, Object?> source) =>
    Sub2ApiAdminAccountUsageProgress(
      utilization: _decimal(source, 'utilization'),
      resetsAt: _nullableDateTime(source, 'resets_at'),
      remainingSeconds: _nonNegativeInteger(source, 'remaining_seconds'),
      windowStats: source['window_stats'] == null
          ? null
          : _todayStats(_object(source['window_stats'])),
      usedRequests: _optionalNonNegativeInteger(source, 'used_requests'),
      limitRequests: _optionalNonNegativeInteger(source, 'limit_requests'),
    );

Sub2ApiAdminAccountTodayStats _todayStats(Map<String, Object?> source) =>
    Sub2ApiAdminAccountTodayStats(
      requests: _nonNegativeInteger(source, 'requests'),
      tokens: _nonNegativeInteger(source, 'tokens'),
      cost: _decimal(source, 'cost'),
      standardCost: _decimal(source, 'standard_cost'),
      userCost: _decimal(source, 'user_cost'),
    );

Sub2ApiAdminAccountTempUnschedulableState _tempState(
  Map<String, Object?> source,
) => Sub2ApiAdminAccountTempUnschedulableState(
  until: _unixDateTime(source, 'until_unix'),
  triggeredAt: _unixDateTime(source, 'triggered_at_unix'),
  statusCode: _positiveInteger(source, 'status_code'),
  matchedKeyword: _string(source, 'matched_keyword'),
  ruleIndex: _nonNegativeInteger(source, 'rule_index'),
  errorMessage: _string(source, 'error_message'),
  triggerCount: _optionalNonNegativeInteger(source, 'trigger_count'),
  triggerThreshold: _optionalNonNegativeInteger(source, 'trigger_threshold'),
  triggerWindowMinutes: _optionalNonNegativeInteger(
    source,
    'trigger_window_minutes',
  ),
);

Sub2ApiAdminAccountModel _accountModel(Map<String, Object?> source) =>
    Sub2ApiAdminAccountModel(
      id: _nonEmptyString(source, 'id'),
      type: _optionalString(source, 'type'),
      displayName: _optionalString(source, 'display_name'),
      object: _optionalString(source, 'object'),
      ownedBy: _optionalString(source, 'owned_by'),
      created: _nullableNonNegativeInteger(source, 'created'),
      createdAt: _nullableDateTime(source, 'created_at'),
    );

Sub2ApiAdminScheduledTestPlan _scheduledTestPlan(Map<String, Object?> source) =>
    Sub2ApiAdminScheduledTestPlan(
      id: _positiveInteger(source, 'id'),
      accountId: _positiveInteger(source, 'account_id'),
      modelId: _string(source, 'model_id'),
      cronExpression: _nonEmptyString(source, 'cron_expression'),
      enabled: _boolean(source, 'enabled'),
      maxResults: _nonNegativeInteger(source, 'max_results'),
      autoRecover: _boolean(source, 'auto_recover'),
      lastRunAt: _nullableDateTime(source, 'last_run_at'),
      nextRunAt: _nullableDateTime(source, 'next_run_at'),
      createdAt: _dateTime(source, 'created_at'),
      updatedAt: _dateTime(source, 'updated_at'),
    );

Sub2ApiAdminAccountPlatform _platform(String value) => switch (value) {
  'anthropic' => Sub2ApiAdminAccountPlatform.anthropic,
  'openai' => Sub2ApiAdminAccountPlatform.openAi,
  'gemini' => Sub2ApiAdminAccountPlatform.gemini,
  'antigravity' => Sub2ApiAdminAccountPlatform.antigravity,
  'grok' => Sub2ApiAdminAccountPlatform.grok,
  'kimi' => Sub2ApiAdminAccountPlatform.kimi,
  'zhipu' => Sub2ApiAdminAccountPlatform.zhipu,
  'deepseek' => Sub2ApiAdminAccountPlatform.deepseek,
  _ => throw const FormatException(),
};

Sub2ApiAdminAccountType _accountType(String value) => switch (value) {
  'oauth' => Sub2ApiAdminAccountType.oauth,
  'setup-token' => Sub2ApiAdminAccountType.setupToken,
  'apikey' => Sub2ApiAdminAccountType.apiKey,
  'upstream' => Sub2ApiAdminAccountType.upstream,
  'bedrock' => Sub2ApiAdminAccountType.bedrock,
  'service_account' => Sub2ApiAdminAccountType.serviceAccount,
  _ => throw const FormatException(),
};

Sub2ApiAdminAccountStatus _status(String value) => switch (value) {
  'active' => Sub2ApiAdminAccountStatus.active,
  'inactive' => Sub2ApiAdminAccountStatus.inactive,
  'error' => Sub2ApiAdminAccountStatus.error,
  _ => throw const FormatException(),
};

Sub2ApiAdminJsonObject _jsonObject(Object? value) {
  final source = _object(value);
  return Sub2ApiAdminJsonObject(
    source.map((key, value) => MapEntry(key, _jsonValue(value))),
  );
}

Sub2ApiAdminJsonObject _jsonObjectOrEmpty(Object? value) =>
    value == null ? const Sub2ApiAdminJsonObject({}) : _jsonObject(value);

Sub2ApiAdminJsonValue _jsonValue(Object? value) => switch (value) {
  null => const Sub2ApiAdminJsonNull(),
  bool() => Sub2ApiAdminJsonBool(value),
  num() => Sub2ApiAdminJsonNumber(Sub2ApiDecimal.fromJson(value)),
  String() => Sub2ApiAdminJsonString(value),
  List() => Sub2ApiAdminJsonArray(
    value.map(_jsonValue).toList(growable: false),
  ),
  Map() => _jsonObject(value),
  _ => throw const FormatException(),
};

Map<String, bool> _booleanMap(Object? value) {
  if (value == null) return const {};
  final source = _object(value);
  return Map.unmodifiable(
    source.map((key, value) {
      if (value is! bool) throw const FormatException();
      return MapEntry(key, value);
    }),
  );
}

Map<String, Object?> _object(Object? value) {
  if (value is! Map) throw const FormatException();
  final result = <String, Object?>{};
  for (final entry in value.entries) {
    if (entry.key is! String) throw const FormatException();
    result[entry.key as String] = entry.value;
  }
  return result;
}

Map<int, T> _intKeyedMap<T>(Object? value, T Function(Object? value) decode) {
  final source = _object(value);
  final result = <int, T>{};
  for (final entry in source.entries) {
    final id = int.tryParse(entry.key);
    if (id == null || id <= 0 || id.toString() != entry.key) {
      throw const FormatException();
    }
    result[id] = decode(entry.value);
  }
  return Map.unmodifiable(result);
}

List<Object?> _array(Object? value) {
  if (value is! List) throw const FormatException();
  return value.cast<Object?>();
}

List<Object?> _list(Map<String, Object?> source, String key) {
  if (!source.containsKey(key)) throw const FormatException();
  return _array(source[key]);
}

List<Object?> _optionalList(Map<String, Object?> source, String key) {
  final value = source[key];
  return value == null ? const [] : _array(value);
}

List<int> _positiveIntegerList(Map<String, Object?> source, String key) =>
    _list(source, key)
        .map((item) {
          if (item is! int || item <= 0) throw const FormatException();
          return item;
        })
        .toList(growable: false);

List<int> _integerList(Object? value) {
  if (value == null) return const [];
  return _array(value)
      .map((item) {
        if (item is! int || item <= 0) throw const FormatException();
        return item;
      })
      .toList(growable: false);
}

String _string(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! String) throw const FormatException();
  return value;
}

String _nonEmptyString(Map<String, Object?> source, String key) {
  final value = _string(source, key).trim();
  if (value.isEmpty) throw const FormatException();
  return value;
}

String _optionalString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return '';
  if (value is! String) throw const FormatException();
  return value;
}

String? _nullableString(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! String) throw const FormatException();
  return value;
}

bool _boolean(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! bool) throw const FormatException();
  return value;
}

bool? _nullableBoolean(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! bool) throw const FormatException();
  return value;
}

int _integer(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value is! int) throw const FormatException();
  return value;
}

int _positiveInteger(Map<String, Object?> source, String key) {
  final value = _integer(source, key);
  if (value <= 0) throw const FormatException();
  return value;
}

int _nonNegativeInteger(Map<String, Object?> source, String key) {
  final value = _integer(source, key);
  if (value < 0) throw const FormatException();
  return value;
}

int _optionalNonNegativeInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return 0;
  if (value is! int || value < 0) throw const FormatException();
  return value;
}

int? _nullableInteger(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! int) throw const FormatException();
  return value;
}

int? _nullablePositiveInteger(Map<String, Object?> source, String key) {
  final value = _nullableInteger(source, key);
  if (value != null && value <= 0) throw const FormatException();
  return value;
}

int? _nullableNonNegativeInteger(Map<String, Object?> source, String key) {
  final value = _nullableInteger(source, key);
  if (value != null && value < 0) throw const FormatException();
  return value;
}

Sub2ApiDecimal _decimal(Map<String, Object?> source, String key) {
  if (!source.containsKey(key)) throw const FormatException();
  return Sub2ApiDecimal.fromJson(source[key]);
}

Sub2ApiDecimal? _nullableDecimal(Map<String, Object?> source, String key) {
  final value = source[key];
  return value == null ? null : Sub2ApiDecimal.fromJson(value);
}

DateTime _dateTime(Map<String, Object?> source, String key) {
  final value = _nonEmptyString(source, key);
  return DateTime.parse(value).toUtc();
}

DateTime? _nullableDateTime(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null || value == '') return null;
  if (value is! String) throw const FormatException();
  return DateTime.parse(value).toUtc();
}

DateTime _unixDateTime(Map<String, Object?> source, String key) =>
    DateTime.fromMillisecondsSinceEpoch(
      _positiveInteger(source, key) * 1000,
      isUtc: true,
    );

DateTime? _nullableUnixDateTime(Map<String, Object?> source, String key) {
  final value = source[key];
  if (value == null) return null;
  if (value is! int || value <= 0) throw const FormatException();
  return DateTime.fromMillisecondsSinceEpoch(value * 1000, isUtc: true);
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

const _sensitiveCredentialKeys = <String>{
  'access_token',
  'refresh_token',
  'id_token',
  'agent_private_key',
  'api_key',
  'session_key',
  'cookie',
  'password',
  'sso_token',
  'sso',
  'sso-rw',
  'clearTextPassword',
  'aws_secret_access_key',
  'aws_session_token',
  'service_account_json',
  'service_account',
  'private_key',
};

const _managedOllamaExtraKeys = <String>{
  'ollama_cloud_usage_session',
  'ollama_cloud_usage_auto_refresh',
  'ollama_cloud_usage_snapshot',
};

const _invalidResponse = Sub2ApiException(
  kind: Sub2ApiFailureKind.protocol,
  code: 'protocol.invalid_admin_account_response',
  retryable: false,
);
