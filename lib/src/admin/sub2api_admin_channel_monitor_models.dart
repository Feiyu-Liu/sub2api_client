import '../commerce/sub2api_monitor_models.dart';
import '../shared/models/sensitive_value.dart';
import '../shared/models/sub2api_decimal.dart';
import '../shared/models/sub2api_page.dart';
import 'sub2api_admin_user_models.dart';

typedef Sub2ApiAdminChannelMonitorPage =
    Sub2ApiPage<Sub2ApiAdminChannelMonitor>;

enum Sub2ApiAdminChannelMonitorProvider {
  openAi,
  anthropic,
  gemini,
  grok,
  antigravity,
  kimi,
  zhipu,
  deepseek,
}

enum Sub2ApiAdminChannelMonitorApiMode { chatCompletions, responses }

enum Sub2ApiAdminChannelMonitorBodyMode { off, merge, replace }

enum Sub2ApiAdminChannelMonitorCheckMode { probe, quota, quotaProbe }

final class Sub2ApiAdminChannelMonitorListQuery {
  const Sub2ApiAdminChannelMonitorListQuery({
    this.page = 1,
    this.pageSize = 20,
    this.provider,
    this.enabled,
    this.search,
  });

  final int page;
  final int pageSize;
  final Sub2ApiAdminChannelMonitorProvider? provider;
  final bool? enabled;
  final String? search;
}

final class Sub2ApiAdminChannelMonitorExtraStatus {
  const Sub2ApiAdminChannelMonitorExtraStatus({
    required this.model,
    required this.status,
    this.latencyMs,
  });

  final String model;
  final String status;
  final int? latencyMs;
}

final class Sub2ApiAdminChannelMonitor {
  Sub2ApiAdminChannelMonitor({
    required this.id,
    required this.name,
    required this.provider,
    required this.apiMode,
    required this.endpoint,
    required this.apiKeyMasked,
    required this.apiKeyDecryptFailed,
    required this.primaryModel,
    required List<String> extraModels,
    required this.groupName,
    required this.enabled,
    required this.intervalSeconds,
    required this.jitterSeconds,
    required this.lastCheckedAt,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.primaryStatus,
    required this.primaryLatencyMs,
    required this.availability7d,
    required List<Sub2ApiAdminChannelMonitorExtraStatus> extraModelsStatus,
    required this.templateId,
    required Map<String, String> extraHeaders,
    required this.bodyOverrideMode,
    required this.bodyOverride,
    required this.checkMode,
    required this.accountId,
    required this.latestQuota,
  }) : extraModels = List.unmodifiable(extraModels),
       extraModelsStatus = List.unmodifiable(extraModelsStatus),
       extraHeaders = Map.unmodifiable(extraHeaders);

  final int id;
  final String name;
  final Sub2ApiAdminChannelMonitorProvider provider;
  final Sub2ApiAdminChannelMonitorApiMode apiMode;
  final Uri? endpoint;
  final Sub2ApiAdminMaskedCredential apiKeyMasked;
  final bool apiKeyDecryptFailed;
  final String primaryModel;
  final List<String> extraModels;
  final String groupName;
  final bool enabled;
  final int intervalSeconds;
  final int jitterSeconds;
  final DateTime? lastCheckedAt;
  final int createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String primaryStatus;
  final int? primaryLatencyMs;
  final Sub2ApiDecimal availability7d;
  final List<Sub2ApiAdminChannelMonitorExtraStatus> extraModelsStatus;
  final int? templateId;
  final Map<String, String> extraHeaders;
  final Sub2ApiAdminChannelMonitorBodyMode bodyOverrideMode;
  final Sub2ApiAdminJsonObject? bodyOverride;
  final Sub2ApiAdminChannelMonitorCheckMode checkMode;
  final int? accountId;
  final Sub2ApiMonitorQuotaSnapshot? latestQuota;
}

final class Sub2ApiAdminCreateChannelMonitorRequest {
  Sub2ApiAdminCreateChannelMonitorRequest({
    required this.name,
    required this.provider,
    required this.intervalSeconds,
    this.apiMode = Sub2ApiAdminChannelMonitorApiMode.chatCompletions,
    this.endpoint,
    this.apiKey,
    this.primaryModel = '',
    List<String> extraModels = const [],
    this.groupName = '',
    this.enabled = true,
    this.jitterSeconds = 0,
    this.templateId,
    Map<String, String> extraHeaders = const {},
    this.bodyOverrideMode = Sub2ApiAdminChannelMonitorBodyMode.off,
    this.bodyOverride,
    this.checkMode = Sub2ApiAdminChannelMonitorCheckMode.probe,
    this.accountId,
  }) : extraModels = List.unmodifiable(extraModels),
       extraHeaders = Map.unmodifiable(extraHeaders);

  final String name;
  final Sub2ApiAdminChannelMonitorProvider provider;
  final Sub2ApiAdminChannelMonitorApiMode apiMode;
  final Uri? endpoint;
  final Sub2ApiAdminCredentialSecret? apiKey;
  final String primaryModel;
  final List<String> extraModels;
  final String groupName;
  final bool enabled;
  final int intervalSeconds;
  final int jitterSeconds;
  final int? templateId;
  final Map<String, String> extraHeaders;
  final Sub2ApiAdminChannelMonitorBodyMode bodyOverrideMode;
  final Sub2ApiAdminJsonObject? bodyOverride;
  final Sub2ApiAdminChannelMonitorCheckMode checkMode;
  final int? accountId;
}

final class Sub2ApiAdminUpdateChannelMonitorRequest {
  Sub2ApiAdminUpdateChannelMonitorRequest({
    this.name,
    this.provider,
    this.apiMode,
    this.endpoint,
    this.clearEndpoint = false,
    this.apiKey,
    this.primaryModel,
    List<String>? extraModels,
    this.groupName,
    this.enabled,
    this.intervalSeconds,
    this.jitterSeconds,
    this.templateId,
    this.clearTemplate = false,
    Map<String, String>? extraHeaders,
    this.bodyOverrideMode,
    this.bodyOverride,
    this.checkMode,
    this.accountId,
  }) : extraModels = extraModels == null
           ? null
           : List.unmodifiable(extraModels),
       extraHeaders = extraHeaders == null
           ? null
           : Map.unmodifiable(extraHeaders);

  final String? name;
  final Sub2ApiAdminChannelMonitorProvider? provider;
  final Sub2ApiAdminChannelMonitorApiMode? apiMode;
  final Uri? endpoint;
  final bool clearEndpoint;
  final Sub2ApiAdminCredentialSecret? apiKey;
  final String? primaryModel;
  final List<String>? extraModels;
  final String? groupName;
  final bool? enabled;
  final int? intervalSeconds;
  final int? jitterSeconds;
  final int? templateId;
  final bool clearTemplate;
  final Map<String, String>? extraHeaders;
  final Sub2ApiAdminChannelMonitorBodyMode? bodyOverrideMode;
  final Sub2ApiAdminJsonObject? bodyOverride;
  final Sub2ApiAdminChannelMonitorCheckMode? checkMode;

  /// Positive ID sets the account; zero explicitly clears it.
  final int? accountId;
}

final class Sub2ApiAdminDuplicateChannelMonitorRequest {
  const Sub2ApiAdminDuplicateChannelMonitorRequest({
    required this.idempotencyKey,
  });

  final String idempotencyKey;
}

final class Sub2ApiAdminChannelMonitorCheckResult {
  const Sub2ApiAdminChannelMonitorCheckResult({
    required this.model,
    required this.status,
    required this.message,
    required this.checkedAt,
    this.latencyMs,
    this.pingLatencyMs,
    this.quota,
  });

  final String model;
  final String status;
  final int? latencyMs;
  final int? pingLatencyMs;
  final String message;
  final DateTime checkedAt;
  final Sub2ApiMonitorQuotaSnapshot? quota;
}

final class Sub2ApiAdminChannelMonitorHistoryItem {
  const Sub2ApiAdminChannelMonitorHistoryItem({
    required this.id,
    required this.model,
    required this.status,
    required this.message,
    required this.checkedAt,
    this.latencyMs,
    this.pingLatencyMs,
    this.quota,
  });

  final int id;
  final String model;
  final String status;
  final int? latencyMs;
  final int? pingLatencyMs;
  final String message;
  final DateTime checkedAt;
  final Sub2ApiMonitorQuotaSnapshot? quota;
}
