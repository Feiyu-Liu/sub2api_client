import 'package:sub2api_client/src/capability/wire/sub2api_public_settings_dto.dart';
import 'package:test/test.dart';

import '../../support/fixture_reader.dart';

void main() {
  final publicSettings = readSuccessFixtureData(
    'capability/settings_public_success.json',
  );

  test('maps the fixed public capability contract', () {
    final capabilities = Sub2ApiPublicSettingsDto.fromJson(
      publicSettings,
    ).toPublicModel();

    expect(capabilities.version, '0.1.183');
    expect(capabilities.oauth.github, isTrue);
    expect(capabilities.oauth.linuxDo, isTrue);
    expect(capabilities.paymentEnabled, isTrue);
    expect(capabilities.passkeyEnabled, isTrue);
    expect(capabilities.promoCodeEnabled, isTrue);
    expect(capabilities.registrationEmailDomainQuotaEnabled, isTrue);
    expect(capabilities.tencentCaptchaEnabled, isTrue);
    expect(capabilities.tencentCaptchaAppId, 'tencent-public-app-id');
    expect(capabilities.aliyunCaptchaEnabled, isTrue);
    expect(capabilities.aliyunCaptchaSceneId, 'aliyun-scene-id');
  });

  test('ignores additive fields but rejects a required field type change', () {
    final additive = {...publicSettings, 'future_setting': 'ignored'};
    expect(
      Sub2ApiPublicSettingsDto.fromJson(additive).toPublicModel().version,
      '0.1.183',
    );

    expect(
      () => Sub2ApiPublicSettingsDto.fromJson({
        ...publicSettings,
        'payment_enabled': 'yes',
      }),
      throwsA(isA<Exception>()),
    );
  });
}
