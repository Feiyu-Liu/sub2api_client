enum Sub2ApiAdminComplianceLanguage { zh, en }

final class Sub2ApiAdminComplianceAcknowledgement {
  const Sub2ApiAdminComplianceAcknowledgement({
    required this.version,
    required this.documentZh,
    required this.documentEn,
    required this.adminUserId,
    required this.ipAddress,
    required this.userAgent,
    required this.acceptedAt,
  });

  final String version;
  final String documentZh;
  final String documentEn;
  final int adminUserId;
  final String ipAddress;
  final String userAgent;
  final DateTime acceptedAt;
}

final class Sub2ApiAdminComplianceStatus {
  const Sub2ApiAdminComplianceStatus({
    required this.required,
    required this.version,
    required this.documentPathZh,
    required this.documentPathEn,
    required this.documentUrlZh,
    required this.documentUrlEn,
    required this.ackPhraseZh,
    required this.ackPhraseEn,
    required this.acknowledgement,
  });

  final bool required;
  final String version;
  final String documentPathZh;
  final String documentPathEn;
  final Uri documentUrlZh;
  final Uri documentUrlEn;
  final String ackPhraseZh;
  final String ackPhraseEn;
  final Sub2ApiAdminComplianceAcknowledgement? acknowledgement;

  String phraseFor(Sub2ApiAdminComplianceLanguage language) =>
      language == Sub2ApiAdminComplianceLanguage.zh ? ackPhraseZh : ackPhraseEn;
}

final class Sub2ApiAdminAcceptComplianceRequest {
  const Sub2ApiAdminAcceptComplianceRequest({
    required this.phrase,
    required this.language,
  });

  final String phrase;
  final Sub2ApiAdminComplianceLanguage language;
}
