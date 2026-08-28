import '../shared/models/sensitive_value.dart';

final class Sub2ApiAdminApiKeyStatus {
  const Sub2ApiAdminApiKeyStatus({required this.exists, this.maskedKey});
  final bool exists;
  final Sub2ApiAdminMaskedCredential? maskedKey;
}

final class Sub2ApiAdminApiKeyRegenerationResult {
  const Sub2ApiAdminApiKeyRegenerationResult({required this.key});
  final Sub2ApiAdminApiKey key;
}

final class Sub2ApiAdminSettingActionResult {
  const Sub2ApiAdminSettingActionResult({required this.message});
  final String message;
}

final class Sub2ApiAdminTestSmtpRequest {
  const Sub2ApiAdminTestSmtpRequest({
    this.host = '',
    this.port = 0,
    this.username = '',
    this.password,
    this.useTls = true,
  });
  final String host;
  final int port;
  final String username;
  final Sub2ApiAdminSmtpPassword? password;
  final bool useTls;
}

final class Sub2ApiAdminSendTestEmailRequest {
  const Sub2ApiAdminSendTestEmailRequest({
    required this.email,
    this.host = '',
    this.port = 0,
    this.username = '',
    this.password,
    this.fromEmail = '',
    this.fromName = '',
    this.useTls = true,
  });
  final String email;
  final String host;
  final int port;
  final String username;
  final Sub2ApiAdminSmtpPassword? password;
  final String fromEmail;
  final String fromName;
  final bool useTls;
}

final class Sub2ApiAdminEmailTemplateEvent {
  const Sub2ApiAdminEmailTemplateEvent({
    required this.value,
    required this.label,
    required this.description,
    required this.category,
    required this.optional,
  });
  final String value;
  final String label;
  final String description;
  final String category;
  final bool optional;
}

final class Sub2ApiAdminEmailTemplateSummary {
  const Sub2ApiAdminEmailTemplateSummary({
    required this.event,
    required this.locale,
    required this.subject,
    required this.isCustom,
    this.updatedAt,
  });
  final String event;
  final String locale;
  final String subject;
  final bool isCustom;
  final DateTime? updatedAt;
}

final class Sub2ApiAdminEmailTemplateList {
  Sub2ApiAdminEmailTemplateList({
    required List<Sub2ApiAdminEmailTemplateEvent> events,
    required List<String> locales,
    required List<Sub2ApiAdminEmailTemplateSummary> templates,
    required List<String> placeholders,
  }) : events = List.unmodifiable(events),
       locales = List.unmodifiable(locales),
       templates = List.unmodifiable(templates),
       placeholders = List.unmodifiable(placeholders);
  final List<Sub2ApiAdminEmailTemplateEvent> events;
  final List<String> locales;
  final List<Sub2ApiAdminEmailTemplateSummary> templates;
  final List<String> placeholders;
}

final class Sub2ApiAdminEmailTemplateDetail {
  Sub2ApiAdminEmailTemplateDetail({
    required this.event,
    required this.locale,
    required this.subject,
    required this.html,
    required this.isCustom,
    required List<String> placeholders,
    this.updatedAt,
  }) : placeholders = List.unmodifiable(placeholders);
  final String event;
  final String locale;
  final String subject;
  final Sub2ApiAdminEmailTemplateContent html;
  final bool isCustom;
  final DateTime? updatedAt;
  final List<String> placeholders;
}

final class Sub2ApiAdminUpdateEmailTemplateRequest {
  const Sub2ApiAdminUpdateEmailTemplateRequest({
    required this.subject,
    required this.html,
  });
  final String subject;
  final Sub2ApiAdminEmailTemplateContent html;
}

final class Sub2ApiAdminPreviewEmailTemplateRequest {
  Sub2ApiAdminPreviewEmailTemplateRequest({
    required this.event,
    required this.locale,
    required this.subject,
    required this.html,
    Map<String, String> variables = const <String, String>{},
  }) : variables = Map.unmodifiable(variables);
  final String event;
  final String locale;
  final String subject;
  final Sub2ApiAdminEmailTemplateContent html;
  final Map<String, String> variables;
}

final class Sub2ApiAdminEmailTemplatePreview {
  const Sub2ApiAdminEmailTemplatePreview({
    required this.subject,
    required this.html,
  });
  final String subject;
  final Sub2ApiAdminEmailTemplateContent html;
}

final class Sub2ApiAdminOverloadCooldownSettings {
  const Sub2ApiAdminOverloadCooldownSettings({
    required this.enabled,
    required this.cooldownMinutes,
  });
  final bool enabled;
  final int cooldownMinutes;
}

final class Sub2ApiAdminRateLimit429CooldownSettings {
  const Sub2ApiAdminRateLimit429CooldownSettings({
    required this.enabled,
    required this.cooldownSeconds,
  });
  final bool enabled;
  final int cooldownSeconds;
}

final class Sub2ApiAdminPanelRateLimitSettings {
  const Sub2ApiAdminPanelRateLimitSettings({
    required this.enabled,
    required this.userRpm,
    required this.heavyRpm,
    required this.exemptAdmin,
    required this.publicIpRpm,
  });
  final bool enabled;
  final int userRpm;
  final int heavyRpm;
  final bool exemptAdmin;
  final int publicIpRpm;
}

enum Sub2ApiAdminStreamTimeoutAction { tempUnsched, error, none }

final class Sub2ApiAdminStreamTimeoutSettings {
  const Sub2ApiAdminStreamTimeoutSettings({
    required this.enabled,
    required this.action,
    required this.tempUnschedMinutes,
    required this.thresholdCount,
    required this.thresholdWindowMinutes,
  });
  final bool enabled;
  final Sub2ApiAdminStreamTimeoutAction action;
  final int tempUnschedMinutes;
  final int thresholdCount;
  final int thresholdWindowMinutes;
}

final class Sub2ApiAdminRectifierSettings {
  Sub2ApiAdminRectifierSettings({
    required this.enabled,
    required this.thinkingSignatureEnabled,
    required this.thinkingBudgetEnabled,
    required this.apiKeySignatureEnabled,
    required List<String> apiKeySignaturePatterns,
  }) : apiKeySignaturePatterns = List.unmodifiable(apiKeySignaturePatterns);
  final bool enabled;
  final bool thinkingSignatureEnabled;
  final bool thinkingBudgetEnabled;
  final bool apiKeySignatureEnabled;
  final List<String> apiKeySignaturePatterns;
}

enum Sub2ApiAdminBetaPolicyAction { pass, filter, block }

enum Sub2ApiAdminBetaPolicyScope { all, oauth, apiKey, bedrock }

final class Sub2ApiAdminBetaPolicyRule {
  Sub2ApiAdminBetaPolicyRule({
    required this.betaToken,
    required this.action,
    required this.scope,
    this.errorMessage = '',
    List<String> modelWhitelist = const <String>[],
    this.fallbackAction,
    this.fallbackErrorMessage = '',
  }) : modelWhitelist = List.unmodifiable(modelWhitelist);
  final String betaToken;
  final Sub2ApiAdminBetaPolicyAction action;
  final Sub2ApiAdminBetaPolicyScope scope;
  final String errorMessage;
  final List<String> modelWhitelist;
  final Sub2ApiAdminBetaPolicyAction? fallbackAction;
  final String fallbackErrorMessage;
}

final class Sub2ApiAdminBetaPolicySettings {
  Sub2ApiAdminBetaPolicySettings({
    required List<Sub2ApiAdminBetaPolicyRule> rules,
  }) : rules = List.unmodifiable(rules);
  final List<Sub2ApiAdminBetaPolicyRule> rules;
}

enum Sub2ApiAdminWebSearchProviderType { brave, tavily }

final class Sub2ApiAdminWebSearchProvider {
  const Sub2ApiAdminWebSearchProvider({
    required this.type,
    this.apiKey,
    required this.apiKeyConfigured,
    this.quotaLimit,
    this.subscribedAt,
    required this.quotaUsed,
    this.proxyId,
    this.expiresAt,
  });
  final Sub2ApiAdminWebSearchProviderType type;
  final Sub2ApiAdminCredentialSecret? apiKey;
  final bool apiKeyConfigured;
  final int? quotaLimit;
  final DateTime? subscribedAt;
  final int quotaUsed;
  final int? proxyId;
  final DateTime? expiresAt;
}

final class Sub2ApiAdminWebSearchConfig {
  Sub2ApiAdminWebSearchConfig({
    required this.enabled,
    required List<Sub2ApiAdminWebSearchProvider> providers,
  }) : providers = List.unmodifiable(providers);
  final bool enabled;
  final List<Sub2ApiAdminWebSearchProvider> providers;
}

final class Sub2ApiAdminWebSearchResult {
  const Sub2ApiAdminWebSearchResult({
    required this.url,
    required this.title,
    required this.snippet,
    required this.pageAge,
  });
  final Uri url;
  final String title;
  final String snippet;
  final String pageAge;
}

final class Sub2ApiAdminWebSearchTestResult {
  Sub2ApiAdminWebSearchTestResult({
    required this.provider,
    required this.query,
    required List<Sub2ApiAdminWebSearchResult> results,
  }) : results = List.unmodifiable(results);
  final String provider;
  final String query;
  final List<Sub2ApiAdminWebSearchResult> results;
}
