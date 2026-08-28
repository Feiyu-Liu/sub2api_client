enum Sub2ApiAdminErrorPassthroughMatchMode { any, all }

final class Sub2ApiAdminErrorPassthroughRule {
  Sub2ApiAdminErrorPassthroughRule({
    required this.id,
    required this.name,
    required this.enabled,
    required this.priority,
    required List<int> errorCodes,
    required List<String> keywords,
    required this.matchMode,
    required List<String> platforms,
    required this.passthroughCode,
    required this.responseCode,
    required this.passthroughBody,
    required this.customMessage,
    required this.skipMonitoring,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  }) : errorCodes = List.unmodifiable(errorCodes),
       keywords = List.unmodifiable(keywords),
       platforms = List.unmodifiable(platforms);

  final int id;
  final String name;
  final bool enabled;
  final int priority;
  final List<int> errorCodes;
  final List<String> keywords;
  final Sub2ApiAdminErrorPassthroughMatchMode matchMode;
  final List<String> platforms;
  final bool passthroughCode;
  final int? responseCode;
  final bool passthroughBody;
  final String? customMessage;
  final bool skipMonitoring;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;
}

final class Sub2ApiAdminCreateErrorPassthroughRuleRequest {
  Sub2ApiAdminCreateErrorPassthroughRuleRequest({
    required this.name,
    List<int> errorCodes = const <int>[],
    List<String> keywords = const <String>[],
    List<String> platforms = const <String>[],
    this.enabled = true,
    this.priority = 0,
    this.matchMode = Sub2ApiAdminErrorPassthroughMatchMode.any,
    this.passthroughCode = true,
    this.responseCode,
    this.passthroughBody = true,
    this.customMessage,
    this.skipMonitoring = false,
    this.description,
  }) : errorCodes = List.unmodifiable(errorCodes),
       keywords = List.unmodifiable(keywords),
       platforms = List.unmodifiable(platforms);

  final String name;
  final bool enabled;
  final int priority;
  final List<int> errorCodes;
  final List<String> keywords;
  final Sub2ApiAdminErrorPassthroughMatchMode matchMode;
  final List<String> platforms;
  final bool passthroughCode;
  final int? responseCode;
  final bool passthroughBody;
  final String? customMessage;
  final bool skipMonitoring;
  final String? description;
}

final class Sub2ApiAdminUpdateErrorPassthroughRuleRequest {
  Sub2ApiAdminUpdateErrorPassthroughRuleRequest({
    this.name,
    this.enabled,
    this.priority,
    List<int>? errorCodes,
    List<String>? keywords,
    this.matchMode,
    List<String>? platforms,
    this.passthroughCode,
    this.responseCode,
    this.passthroughBody,
    this.customMessage,
    this.skipMonitoring,
    this.description,
  }) : errorCodes = errorCodes == null ? null : List.unmodifiable(errorCodes),
       keywords = keywords == null ? null : List.unmodifiable(keywords),
       platforms = platforms == null ? null : List.unmodifiable(platforms);

  final String? name;
  final bool? enabled;
  final int? priority;
  final List<int>? errorCodes;
  final List<String>? keywords;
  final Sub2ApiAdminErrorPassthroughMatchMode? matchMode;
  final List<String>? platforms;
  final bool? passthroughCode;
  final int? responseCode;
  final bool? passthroughBody;
  final String? customMessage;
  final bool? skipMonitoring;
  final String? description;
}

final class Sub2ApiAdminDeleteErrorPassthroughRuleResult {
  const Sub2ApiAdminDeleteErrorPassthroughRuleResult(this.message);

  final String message;
}
