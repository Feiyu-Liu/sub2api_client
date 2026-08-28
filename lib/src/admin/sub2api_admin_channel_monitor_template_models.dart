import 'sub2api_admin_user_models.dart';

enum Sub2ApiAdminMonitorTemplateProvider { openAi, anthropic, gemini, grok }

enum Sub2ApiAdminMonitorTemplateApiMode { chatCompletions, responses }

enum Sub2ApiAdminMonitorTemplateBodyMode { off, merge, replace }

final class Sub2ApiAdminChannelMonitorTemplate {
  Sub2ApiAdminChannelMonitorTemplate({
    required this.id,
    required this.name,
    required this.provider,
    required this.apiMode,
    required this.description,
    required Map<String, String> extraHeaders,
    required this.bodyOverrideMode,
    required this.bodyOverride,
    required this.createdAt,
    required this.updatedAt,
    required this.associatedMonitors,
  }) : extraHeaders = Map.unmodifiable(extraHeaders);
  final int id;
  final String name;
  final Sub2ApiAdminMonitorTemplateProvider provider;
  final Sub2ApiAdminMonitorTemplateApiMode apiMode;
  final String description;
  final Map<String, String> extraHeaders;
  final Sub2ApiAdminMonitorTemplateBodyMode bodyOverrideMode;
  final Sub2ApiAdminJsonObject? bodyOverride;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int associatedMonitors;
}

final class Sub2ApiAdminCreateChannelMonitorTemplateRequest {
  Sub2ApiAdminCreateChannelMonitorTemplateRequest({
    required this.name,
    required this.provider,
    this.apiMode = Sub2ApiAdminMonitorTemplateApiMode.chatCompletions,
    this.description = '',
    Map<String, String> extraHeaders = const {},
    this.bodyOverrideMode = Sub2ApiAdminMonitorTemplateBodyMode.off,
    this.bodyOverride,
  }) : extraHeaders = Map.unmodifiable(extraHeaders);
  final String name;
  final Sub2ApiAdminMonitorTemplateProvider provider;
  final Sub2ApiAdminMonitorTemplateApiMode apiMode;
  final String description;
  final Map<String, String> extraHeaders;
  final Sub2ApiAdminMonitorTemplateBodyMode bodyOverrideMode;
  final Sub2ApiAdminJsonObject? bodyOverride;
}

final class Sub2ApiAdminUpdateChannelMonitorTemplateRequest {
  Sub2ApiAdminUpdateChannelMonitorTemplateRequest({
    this.name,
    this.apiMode,
    this.description,
    Map<String, String>? extraHeaders,
    this.bodyOverrideMode,
    this.bodyOverride,
  }) : extraHeaders = extraHeaders == null
           ? null
           : Map.unmodifiable(extraHeaders);
  final String? name;
  final Sub2ApiAdminMonitorTemplateApiMode? apiMode;
  final String? description;
  final Map<String, String>? extraHeaders;
  final Sub2ApiAdminMonitorTemplateBodyMode? bodyOverrideMode;
  final Sub2ApiAdminJsonObject? bodyOverride;
}

final class Sub2ApiAdminAssociatedMonitor {
  const Sub2ApiAdminAssociatedMonitor({
    required this.id,
    required this.name,
    required this.provider,
    required this.apiMode,
    required this.enabled,
  });
  final int id;
  final String name;
  final Sub2ApiAdminMonitorTemplateProvider provider;
  final Sub2ApiAdminMonitorTemplateApiMode apiMode;
  final bool enabled;
}

final class Sub2ApiAdminApplyMonitorTemplateResult {
  const Sub2ApiAdminApplyMonitorTemplateResult(this.affected);
  final int affected;
}
