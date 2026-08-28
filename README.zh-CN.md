# sub2api_client

[English](README.md) | **简体中文**

面向 Sub2API 管理 API 的强类型纯 Dart 客户端。当前版本 `0.1.0-dev.4` 对应
Sub2API `v0.1.183`，固定源码 commit 为
`e8cb019fabf8b55199436229044cbf9aa7a82564`。

本 package 负责 HTTP、JSON、错误映射、会话轮换以及并发刷新一致性。它不依赖
Flutter SDK、UI 状态管理框架、安全存储插件、浏览器启动器或任何原生依赖。

## 支持的用户 API

- 服务端能力初始化。
- 注册、登录、双因素登录、刷新会话、退出登录、发送邮箱验证码、校验邀请码和密码重置；
  支持服务端声明的 Turnstile、腾讯云及阿里云验证码证明。
- 完整的当前用户、角色和身份初始化，并以 fail-secure 方式撤销该用户的全部会话。
- 强类型 Passkey 登录与注册仪式，以及凭据列表、重命名和密码确认删除。宿主应用负责提供
  浏览器或平台 WebAuthn 适配器；本 package 只负责协议事实。
- TOTP 状态、身份验证策略、设置、启用/禁用、验证码发送，以及与会话绑定的 step-up 授权。
- 本地邮箱和第三方身份绑定指令，以及通知邮箱的验证、开关和移除操作。
- OAuth POST 启动、依赖 Cookie 的待处理账号/登录完成流程、提供方兼容路由、浏览器 GET
  导航构建器和稳定的待处理会话错误。浏览器 callback 仍属于服务端入口。
- 用户资料读取/更新和密码修改。
- API Key/Installation Key 的列表、详情、创建、更新和删除。
- 用户可见的分组、费率、渠道、平台配额和每个 Key 的每日用量。
- Usage 列表、详情、统计、失败请求视图和全部用户 Dashboard 聚合数据。
- 公告、兑换历史、订阅、模型广场、推广配额和两代渠道监控。
- 支付配置、限制、套餐、结账信息、余额或订阅订单创建、本人订单查询、取消、退款申请、
  可用支付提供方查询，以及签名或旧版公开订单恢复。

固定合同中的 127 条用户管理目标路由和 425 条 Admin 管理目标路由均已完成强类型建模和
传输测试。隔离的 `Sub2ApiAdminClient` 与 `Sub2ApiOpsClient` 覆盖固定合同的完整管理面，
包括 Admin JWT 角色初始化、默认脱敏的 Admin API Key provider、严格的凭证隔离，以及禁止
凭证自动回退。支付 UI 和本地安全存储仍由调用方负责。

固定路由清单位于
[`tool/contracts/v0_1_183_route_manifest.json`](tool/contracts/v0_1_183_route_manifest.json)。
其中记录了 552 条目标管理路由和 14 条明确排除的服务端入口，并保存每条目标路由的实现与
测试状态。Gateway 数据面、callback/webhook、setup、健康检查和静态资源入口不在当前范围内。

高权限客户端使用独立入口：

```dart
import 'package:sub2api_client/sub2api_admin_client.dart';
import 'package:sub2api_client/sub2api_ops_client.dart';
```

用户客户端不会暴露 `.admin` 或 `.ops`。Admin 客户端只使用 JWT 会话，并验证
`role == admin`；Ops 客户端只使用 `x-api-key`，不会读取、刷新或回退到 JWT 会话。

## 安装

该 package 当前以开发版本发布，请显式指定预发布版本约束：

```sh
dart pub add sub2api_client:^0.1.0-dev.4
```

## 基本用法

```dart
import 'package:sub2api_client/sub2api_client.dart';

final client = Sub2ApiClient(
  configuration: Sub2ApiConfiguration(
    origin: Uri.parse('https://sub2api.example.com'),
  ),
  // 生产环境应使用基于操作系统安全存储的实现。
  sessionStore: Sub2ApiMemorySessionStore(),
);

try {
  final capabilities = await client.capabilities.getCapabilities();
  final login = await client.auth.login(
    const Sub2ApiLoginRequest(
      email: 'user@example.com',
      password: Sub2ApiPassword('obtained-interactively'),
    ),
  );
  if (login case Sub2ApiAuthenticated()) {
    final profile = await client.user.getProfile();
    print(profile.balance);
  }
} on Sub2ApiException catch (error) {
  print(error.code);
} finally {
  client.close();
}
```

`Sub2ApiSessionStore` 是纯 Dart 扩展接口。Flutter 应用可以用所选的安全存储适配器实现它，
而无需让本 package 依赖 Flutter 或原生插件。敏感值必须显式调用 `reveal()` 才能读取，
其 `toString()` 输出默认会被脱敏。

## 支付流程

本 package 返回结账所需的协议事实；宿主应用负责启动浏览器、渲染二维码、调用
Stripe/微信 SDK、处理深链和管理 UI 状态。余额充值使用精确的 `Sub2ApiDecimal`；如果数值
无法由 Sub2API v0.1.183 的 `float64` `amount` 字段表示，请求会在发送前被拒绝。

```dart
final checkout = await client.billing.checkoutInfo();
final paymentType = checkout.limits.methods.keys.first;
final result = await client.billing.createBalanceOrder(
  Sub2ApiCreateBalanceOrderRequest(
    amount: Sub2ApiDecimal.parse('10.00'),
    paymentType: paymentType,
  ),
);

switch (result) {
  case Sub2ApiOrderCreated(:final payUrl):
    // 宿主应用可在明确需要时读取 payUrl?.reveal()。
    // 本 package 不会启动浏览器或渲染支付 UI。
  case Sub2ApiOrderOAuthRequired(:final oauth):
    // 使用宿主应用的微信 OAuth 适配器继续处理 oauth。
  case Sub2ApiOrderJsapiReady(:final jsapi):
    // 微信适配器在明确需要时读取 jsapi.packageValue.reveal()
    // 和 jsapi.paySign.reveal()；不要记录这些敏感值。
}
```

订单创建不会自动重试或重放。如果网络故障导致结果未知，应先调用
`client.billing.listOwnOrders(...)` 或 `client.billing.verifyOrder(outTradeNo)` 核实，
再决定是否创建新订单。创建 Key 时必须提供明确的幂等键。Key 的 5h/1d/7d 限制表示
美元消费窗口，而不是每个 Key 的 RPM。

## 开发与验证

```sh
dart pub get
dart run build_runner build
dart format --output=none --set-exit-if-changed lib test example integration_test
dart analyze --fatal-infos
dart test
dart doc
dart pub publish --dry-run
```

默认测试全部离线运行。受控实机测试必须显式执行 `dart test integration_test`，并设置
[`integration_test/controlled_linux_env_test.dart`](integration_test/controlled_linux_env_test.dart)
中记录的 opt-in 环境变量。
