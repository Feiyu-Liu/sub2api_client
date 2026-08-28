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
