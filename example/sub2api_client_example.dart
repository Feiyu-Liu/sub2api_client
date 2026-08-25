import 'package:sub2api_client/sub2api_client.dart';

Future<void> main() async {
  final client = Sub2ApiClient(
    configuration: Sub2ApiConfiguration(
      origin: Uri.parse('https://sub2api.example.com'),
    ),
    // Applications should replace this with an OS-backed secure adapter.
    sessionStore: Sub2ApiMemorySessionStore(),
  );

  try {
    final capabilities = await client.capabilities.getCapabilities();
    print('Server version: ${capabilities.version}');
    print('Registration enabled: ${capabilities.registrationEnabled}');

    // After a successful login, the host application can obtain typed checkout
    // facts. This package does not launch browsers or invoke payment SDKs.
    //
    // final checkout = await client.billing.checkoutInfo();
    // if (checkout.limits.methods.isNotEmpty) {
    //   final result = await client.billing.createBalanceOrder(
    //     Sub2ApiCreateBalanceOrderRequest(
    //       amount: Sub2ApiDecimal.parse('10.00'),
    //       paymentType: checkout.limits.methods.keys.first,
    //     ),
    //   );
    //   switch (result) {
    //     case Sub2ApiOrderCreated(:final payUrl):
    //       // A browser adapter may explicitly consume payUrl?.reveal().
    //     case Sub2ApiOrderOAuthRequired(:final oauth):
    //       // Continue through the host's WeChat OAuth adapter.
    //     case Sub2ApiOrderJsapiReady(:final jsapi):
    //       // A host adapter consumes redacted JSAPI fields only when needed:
    //       // jsapi.packageValue.reveal() and jsapi.paySign.reveal().
    //   }
    // }
    //
    // If order creation ends in a network failure, first query own orders (or
    // verify a known outTradeNo) before allowing the user to create another.
  } on Sub2ApiException catch (error) {
    print('Sub2API request failed: ${error.code}');
  } finally {
    client.close();
  }
}
