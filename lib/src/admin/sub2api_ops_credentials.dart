import '../shared/models/sensitive_value.dart';

/// Supplies the current Admin API Key to an Ops client.
abstract interface class Sub2ApiAdminApiKeyProvider {
  Future<Sub2ApiAdminApiKey?> load();
}

/// Immutable provider suitable when key rotation recreates the Ops client.
final class Sub2ApiStaticAdminApiKeyProvider
    implements Sub2ApiAdminApiKeyProvider {
  const Sub2ApiStaticAdminApiKeyProvider(this.key);

  final Sub2ApiAdminApiKey key;

  @override
  Future<Sub2ApiAdminApiKey> load() async => key;
}
