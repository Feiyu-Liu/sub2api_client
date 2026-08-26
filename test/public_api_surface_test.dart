import 'dart:io';

import 'package:sub2api_client/sub2api_client.dart';
import 'package:test/test.dart';

void main() {
  test('the root library exposes six typed feature interfaces', () {
    final client = Sub2ApiClient(
      configuration: Sub2ApiConfiguration(
        origin: Uri.parse('https://example.test'),
      ),
      sessionStore: Sub2ApiMemorySessionStore(),
    );
    addTearDown(client.close);

    final Sub2ApiCapabilityClient capabilities = client.capabilities;
    final Sub2ApiAuthenticationClient auth = client.auth;
    final Sub2ApiUserClient user = client.user;
    final Sub2ApiKeyClient keys = client.keys;
    final Sub2ApiUsageClient usage = client.usage;
    final Sub2ApiBillingClient billing = client.billing;

    final Future<Sub2ApiCapabilities> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    getCapabilities = capabilities.getCapabilities;
    final Future<Sub2ApiLoginResult> Function(
      Sub2ApiLoginRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    login = auth.login;
    final Future<Sub2ApiLoginResult> Function(
      Sub2ApiTwoFactorLoginRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    completeTwoFactorLogin = auth.completeTwoFactorLogin;
    final Future<Sub2ApiEmailVerificationCodeSent> Function(
      Sub2ApiEmailVerificationCodeRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    sendEmailVerificationCode = auth.sendEmailVerificationCode;
    final Future<Sub2ApiInvitationCodeValidation> Function(
      Sub2ApiInvitationCodeValidationRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    validateInvitationCode = auth.validateInvitationCode;
    final Future<Sub2ApiForgotPasswordResult> Function(
      Sub2ApiForgotPasswordRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    forgotPassword = auth.forgotPassword;
    final Future<Sub2ApiResetPasswordResult> Function(
      Sub2ApiResetPasswordRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    resetPassword = auth.resetPassword;
    final Future<void> Function({Sub2ApiRequestOptions? requestOptions})
    logout = auth.logout;
    final Future<Sub2ApiLoginResult> Function(
      Sub2ApiRegistrationRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    register = auth.register;
    final Future<Sub2ApiUserProfile> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    getProfile = user.getProfile;
    final Future<Sub2ApiUserProfile> Function(
      Sub2ApiUpdateUserProfileRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    updateProfile = user.updateProfile;
    final Future<void> Function(
      Sub2ApiChangePasswordRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    changePassword = user.changePassword;
    final Future<Sub2ApiKeyPage> Function({
      Sub2ApiKeyListRequest request,
      Sub2ApiRequestOptions? requestOptions,
    })
    listKeys = keys.list;
    final Future<Sub2ApiKeyDetails> Function(
      Sub2ApiCreateKeyRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    createKey = keys.create;
    final Future<Sub2ApiKeySummary> Function(
      int,
      Sub2ApiUpdateKeyRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    updateKey = keys.update;
    final Future<Sub2ApiPage<Sub2ApiUsageRecord>> Function(
      Sub2ApiUsageQuery, {
      Sub2ApiRequestOptions? requestOptions,
    })
    listUsage = usage.list;
    final Future<Sub2ApiUsageRecord> Function(
      int, {
      Sub2ApiRequestOptions? requestOptions,
    })
    usageDetail = usage.detail;
    final Future<Sub2ApiUsageStats> Function(
      Sub2ApiUsageQuery, {
      Sub2ApiRequestOptions? requestOptions,
    })
    usageStats = usage.stats;
    final Future<Sub2ApiPaymentConfig> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    paymentConfig = billing.config;
    final Future<Sub2ApiCheckoutInfo> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    checkoutInfo = billing.checkoutInfo;
    final Future<Sub2ApiCreateOrderResult> Function(
      Sub2ApiCreateBalanceOrderRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    createBalanceOrder = billing.createBalanceOrder;
    final Future<Sub2ApiCreateOrderResult> Function(
      Sub2ApiCreateSubscriptionOrderRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    createSubscriptionOrder = billing.createSubscriptionOrder;
    final Future<Sub2ApiPage<Sub2ApiPaymentOrder>> Function(
      Sub2ApiPaymentOrderQuery, {
      Sub2ApiRequestOptions? requestOptions,
    })
    listOwnOrders = billing.listOwnOrders;

    expect(<Object>[
      getCapabilities,
      login,
      completeTwoFactorLogin,
      sendEmailVerificationCode,
      validateInvitationCode,
      forgotPassword,
      resetPassword,
      logout,
      register,
      getProfile,
      updateProfile,
      changePassword,
      listKeys,
      createKey,
      updateKey,
      listUsage,
      usageDetail,
      usageStats,
      paymentConfig,
      checkoutInfo,
      createBalanceOrder,
      createSubscriptionOrder,
      listOwnOrders,
    ], everyElement(isNotNull));
  });

  test(
    'the root library excludes transport builders and Admin or Ops exports',
    () {
      final entrypoint = File('lib/sub2api_client.dart').readAsStringSync();

      expect(entrypoint, isNot(contains('createSub2Api')));
      expect(entrypoint, isNot(contains('Dio')));
      expect(entrypoint, isNot(contains('Retrofit')));
      expect(entrypoint.toLowerCase(), isNot(contains('admin')));
      expect(entrypoint.toLowerCase(), isNot(contains('ops')));
      expect(File('lib/sub2api_admin_client.dart').existsSync(), isFalse);
      expect(File('lib/sub2api_ops_client.dart').existsSync(), isFalse);
    },
  );
}
