import 'dart:io';

import 'package:sub2api_client/sub2api_client.dart';
import 'package:test/test.dart';

void main() {
  test('the root library exposes twelve typed feature interfaces', () {
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
    final Sub2ApiPasskeyClient passkeys = client.passkeys;
    final Sub2ApiTotpClient totp = client.totp;
    final Sub2ApiIdentityClient identities = client.identities;
    final Sub2ApiOAuthClient oauth = client.oauth;
    final Sub2ApiAccessClient access = client.access;
    final Sub2ApiCommerceClient commerce = client.commerce;

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
    final Future<Sub2ApiPromoCodeValidation> Function(
      Sub2ApiPromoCodeValidationRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    validatePromoCode = auth.validatePromoCode;
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
    final Future<Sub2ApiCurrentUser> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    getCurrentUser = auth.getCurrentUser;
    final Future<Sub2ApiRevokeAllSessionsResult> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    revokeAllSessions = auth.revokeAllSessions;
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
    final Future<Sub2ApiAffiliateDetail> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    getAffiliate = user.getAffiliate;
    final Future<Sub2ApiAffiliateTransfer> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    transferAffiliateQuota = user.transferAffiliateQuota;
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
    final Future<Sub2ApiPage<Sub2ApiUsageError>> Function(
      Sub2ApiUsageErrorQuery, {
      Sub2ApiRequestOptions? requestOptions,
    })
    listUsageErrors = usage.listErrors;
    final Future<Sub2ApiUsageDashboardStats> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    usageDashboardStats = usage.dashboardStats;
    final Future<Sub2ApiUsageDashboardSnapshot> Function(
      Sub2ApiUsageDashboardSnapshotRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    usageDashboardSnapshot = usage.dashboardSnapshot;
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
    final Future<Sub2ApiPaymentMutationResult> Function(
      int, {
      Sub2ApiRequestOptions? requestOptions,
    })
    cancelOrder = billing.cancelOrder;
    final Future<Sub2ApiPublicOrderVerification> Function(
      String, {
      Sub2ApiRequestOptions? requestOptions,
    })
    verifyPublicOrder = billing.verifyPublicOrder;
    final Future<Sub2ApiPasskeyLoginChallenge> Function({
      Sub2ApiCaptchaProof captcha,
      Sub2ApiRequestOptions? requestOptions,
    })
    beginPasskeyLogin = passkeys.beginLogin;
    final Future<Sub2ApiLoginResult> Function(
      Sub2ApiFinishPasskeyLoginRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    finishPasskeyLogin = passkeys.finishLogin;
    final Future<Sub2ApiPasskeyRegistrationChallenge> Function(
      Sub2ApiBeginPasskeyRegistrationRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    beginPasskeyRegistration = passkeys.beginRegistration;
    final Future<Sub2ApiPasskeyCredentialSummary> Function(
      Sub2ApiFinishPasskeyRegistrationRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    finishPasskeyRegistration = passkeys.finishRegistration;
    final Future<List<Sub2ApiPasskeyCredentialSummary>> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    listPasskeys = passkeys.list;
    final Future<Sub2ApiTotpStatus> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    getTotpStatus = totp.getStatus;
    final Future<Sub2ApiTotpVerificationMethod> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    getTotpVerificationMethod = totp.getVerificationMethod;
    final Future<void> Function({
      String? locale,
      Sub2ApiRequestOptions? requestOptions,
    })
    sendTotpEmailCode = totp.sendEmailVerificationCode;
    final Future<Sub2ApiTotpSetupResult> Function(
      Sub2ApiTotpIdentityProof, {
      Sub2ApiRequestOptions? requestOptions,
    })
    beginTotpSetup = totp.beginSetup;
    final Future<void> Function(
      Sub2ApiEnableTotpRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    enableTotp = totp.enable;
    final Future<void> Function(
      Sub2ApiTotpIdentityProof, {
      Sub2ApiRequestOptions? requestOptions,
    })
    disableTotp = totp.disable;
    final Future<Sub2ApiTotpStepUpGrant> Function(
      Sub2ApiVerificationCode, {
      Sub2ApiRequestOptions? requestOptions,
    })
    stepUp = totp.stepUp;
    final Future<Sub2ApiIdentityBindingInstruction> Function(
      Sub2ApiStartIdentityBindingRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    startIdentityBinding = identities.startBinding;
    final Future<Sub2ApiIdentityCodeSent> Function(
      String, {
      String? locale,
      Sub2ApiRequestOptions? requestOptions,
    })
    sendEmailBindingCode = identities.sendEmailBindingCode;
    final Future<Sub2ApiIdentityCodeSent> Function(
      String, {
      String? locale,
      Sub2ApiRequestOptions? requestOptions,
    })
    sendNotificationEmailCode = identities.sendNotificationEmailCode;
    final Future<Sub2ApiUserAccountSnapshot> Function(
      Sub2ApiBindEmailIdentityRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    bindEmail = identities.bindEmail;
    final Future<Sub2ApiUserAccountSnapshot> Function(
      Sub2ApiIdentityProvider, {
      Sub2ApiRequestOptions? requestOptions,
    })
    unbindIdentity = identities.unbind;
    final Future<Sub2ApiUserAccountSnapshot> Function(
      Sub2ApiVerifyNotificationEmailRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    verifyNotificationEmail = identities.verifyNotificationEmail;
    final Future<Sub2ApiUserAccountSnapshot> Function(
      String, {
      required bool disabled,
      Sub2ApiRequestOptions? requestOptions,
    })
    toggleNotificationEmail = identities.toggleNotificationEmail;
    final Future<Sub2ApiUserAccountSnapshot> Function(
      String, {
      Sub2ApiRequestOptions? requestOptions,
    })
    removeNotificationEmail = identities.removeNotificationEmail;
    final Sub2ApiNotificationUnsubscribeInstruction Function(
      Sub2ApiNotificationUnsubscribeToken,
    )
    buildNotificationUnsubscribe = identities.buildNotificationEmailUnsubscribe;
    final Future<Sub2ApiOAuthStartInstruction> Function(
      Sub2ApiOAuthStartRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    startOAuth = oauth.start;
    final Future<Sub2ApiOAuthPendingCompletion> Function({
      Sub2ApiOAuthAdoptionDecision decision,
      Sub2ApiRequestOptions? requestOptions,
    })
    exchangeOAuth = oauth.exchangePendingCompletion;
    final Future<Sub2ApiOAuthPendingCompletion> Function(
      Sub2ApiCreatePendingOAuthAccountRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    createOAuthAccount = oauth.createPendingAccount;
    final Future<void> Function({Sub2ApiRequestOptions? requestOptions})
    prepareOAuthBinding = oauth.prepareBindingCookie;
    final Sub2ApiOAuthBrowserInstruction Function(Sub2ApiOAuthStartRequest)
    buildOAuthLogin = oauth.buildLegacyLoginStart;
    final Future<List<Sub2ApiAvailableGroup>> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    getAvailableGroups = access.getAvailableGroups;
    final Future<List<Sub2ApiAvailableChannel>> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    getAvailableChannels = access.getAvailableChannels;
    final Future<List<Sub2ApiPlatformQuota>> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    getPlatformQuotas = access.getPlatformQuotas;
    final Future<List<Sub2ApiAnnouncement>> Function({
      bool unreadOnly,
      Sub2ApiRequestOptions? requestOptions,
    })
    listAnnouncements = commerce.listAnnouncements;
    final Future<Sub2ApiRedeemRecord> Function(
      Sub2ApiRedeemRequest, {
      Sub2ApiRequestOptions? requestOptions,
    })
    redeem = commerce.redeem;
    final Future<Sub2ApiSubscriptionSummary> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    getSubscriptionSummary = commerce.getSubscriptionSummary;
    final Future<Sub2ApiModelPlaza> Function({
      Sub2ApiRequestOptions? requestOptions,
    })
    getModelPlaza = commerce.getModelPlaza;
    final Future<Sub2ApiMonitorSnapshot> Function(
      Sub2ApiMonitorFilter, {
      Sub2ApiRequestOptions? requestOptions,
    })
    getMonitorSnapshot = commerce.getMonitorSnapshot;

    expect(<Object>[
      getCapabilities,
      login,
      completeTwoFactorLogin,
      sendEmailVerificationCode,
      validateInvitationCode,
      validatePromoCode,
      forgotPassword,
      resetPassword,
      logout,
      getCurrentUser,
      revokeAllSessions,
      register,
      getProfile,
      updateProfile,
      changePassword,
      getAffiliate,
      transferAffiliateQuota,
      listKeys,
      createKey,
      updateKey,
      listUsage,
      usageDetail,
      usageStats,
      listUsageErrors,
      usageDashboardStats,
      usageDashboardSnapshot,
      paymentConfig,
      checkoutInfo,
      createBalanceOrder,
      createSubscriptionOrder,
      listOwnOrders,
      cancelOrder,
      verifyPublicOrder,
      beginPasskeyLogin,
      finishPasskeyLogin,
      beginPasskeyRegistration,
      finishPasskeyRegistration,
      listPasskeys,
      getTotpStatus,
      getTotpVerificationMethod,
      sendTotpEmailCode,
      beginTotpSetup,
      enableTotp,
      disableTotp,
      stepUp,
      startIdentityBinding,
      sendEmailBindingCode,
      sendNotificationEmailCode,
      bindEmail,
      unbindIdentity,
      verifyNotificationEmail,
      toggleNotificationEmail,
      removeNotificationEmail,
      buildNotificationUnsubscribe,
      startOAuth,
      exchangeOAuth,
      createOAuthAccount,
      prepareOAuthBinding,
      buildOAuthLogin,
      getAvailableGroups,
      getAvailableChannels,
      getPlatformQuotas,
      listAnnouncements,
      redeem,
      getSubscriptionSummary,
      getModelPlaza,
      getMonitorSnapshot,
    ], everyElement(isNotNull));
  });

  test('the root library excludes transport and privileged exports', () {
    final entrypoint = File('lib/sub2api_client.dart').readAsStringSync();

    expect(entrypoint, isNot(contains('createSub2Api')));
    expect(entrypoint, isNot(contains('Dio')));
    expect(entrypoint, isNot(contains('Retrofit')));
    expect(entrypoint.toLowerCase(), isNot(contains('admin')));
    expect(entrypoint.toLowerCase(), isNot(contains('ops')));
    expect(File('lib/sub2api_admin_client.dart').existsSync(), isTrue);
    expect(File('lib/sub2api_ops_client.dart').existsSync(), isTrue);
  });
}
