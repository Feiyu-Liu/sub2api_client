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
