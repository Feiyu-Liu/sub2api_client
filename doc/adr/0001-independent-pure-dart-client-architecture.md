# ADR-0001：采用独立 MIT 纯 Dart Sub2API 客户端架构

- **状态**：Accepted（v0.1 范围和依赖选择由 ADR-0003 部分替代；工程 Gate 与测试布局由
  ADR-0005 部分替代）
- **日期**：2026-08-25
- **决策者**：Package 主理人
- **适用范围**：`sub2api_client` 的 package 归属、分层、公共接口、协议合同、认证会话、
  User/Admin 能力、安全 seam、依赖与测试策略

## 背景

`sub2api_client` 需要为 Flutter/Dart 应用提供 Sub2API 的账号、用户、API Key、用量、
充值和管理员接口。当前目录由 Flutter package 模板生成，仍依赖 Flutter SDK，包含示例
`Calculator` 和 `flutter_test`；这些只是起始骨架，不代表目标架构。

截至本决策，没有可直接采用的 Sub2API Dart SDK。`gucooing/sub2api-app` 提供了有价值
的 Flutter 行为参考，包括统一响应封套、登录、2FA、令牌刷新、Key、用量、充值和大量
管理员接口，但它是完整 Flutter App，耦合 Riverpod、UI、本地化、native plugin 和
应用状态，并声明兼容后端 `0.1.136`，不能成为本 package 的协议权威或直接依赖。

本 package 的首个权威协议基线固定为 Sub2API `v0.1.155`，commit：

```text
41cec0db059ffb82d0efdcfcf07a24ab51fbfe97
```

Sub2API 没有可作为权威生成源的项目自有 OpenAPI 文档，因此客户端合同必须从该固定
commit 的路由、handler DTO、前端请求定义和本项目 contract fixtures 共同建立。

主理人已经明确以下产品决策：

- package 独立于 Codex-Trans workspace 维护；
- package 使用 MIT 许可证；
- package 定义自己的 typed 错误接口；
- package 长期可扩展用户端和管理员端；v0.1 只实现用户端，见 ADR-0003；
- 允许研究 `sub2api-app` 的行为和实现，但生产代码采用新结构重新编写。

## 决策驱动因素

- 同一套协议能力需要被多个 Flutter/Dart 调用方复用。
- package 不应绑定 Riverpod、Bloc、Flutter widget、路由或具体 App 的 `Result` 类型。
- 登录、refresh-token rotation、并发 401、logout 和会话失效必须只实现一次。
- User 与 Admin 能力必须在类型和导入入口上清晰分离。
- Admin 凭证、access token、refresh token、API Key 和支付信息不能进入日志或异常文案。
- 上游协议会演进，首版必须先对固定合同提供可重复的离线证据。
- 调用方需要稳定 typed model 和错误码，而不是 `DioException`、原始 `Map` 或后端展示
  文案。
- package 的架构需要足够小，不为一个远程 HTTP 数据源引入 App 级 MVVM 和空目录。

## 决策

### 1. 独立、纯 Dart、MIT

`sub2api_client` 作为独立 package 维护，并使用 MIT 许可证。目标 Dart SDK 下限为
`^3.11.0`，以兼容 Codex-Trans 当前工具链；package 不依赖 Flutter SDK。

生产依赖首版允许：

- `dio`：内部 HTTP transport；
- `json_annotation`：wire DTO 序列化注解；
- 经独立 spike 证明满足合同后，可内部使用 `fresh_dio`。

开发依赖允许 `test`、`lints`、`build_runner` 和 `json_serializable`。不得因 convenience
引入 Riverpod、Bloc、Flutter、`flutter_secure_storage`、`shared_preferences`、
`url_launcher`、WebView 或其他 native plugin。

package 可阅读并参考 `sub2api-app` 的实现，无需建立 clean-room 隔离；但不得 vendor、
复制或改名提交其 LGPL 文件。生产文件应在本项目结构中重新编写。参考基线固定为：

```text
gucooing/sub2api-app
39848a20d2821de1d367388ae298e0b42353cf92
```

该参考仓库的未提交工作区变化不属于协议证据，除非另行审查并记录精确 diff。

### 2. 采用协议能力 feature-first，不采用 App 级 MVVM

本项目是远程协议 package，不拥有 View、ViewModel、路由、App 状态或本地数据库，因而
不建立 UI/Data/Domain 三层，也不提供 Repository。调用方 App 可以在 package 之上建立
自己的 Repository、ViewModel、Riverpod provider 或 Bloc。

package 按稳定协议能力组织 feature；transport、会话和错误等跨 feature 机制进入
`shared/`：

```text
lib/
├── sub2api_client.dart                 # 用户端公共入口
├── sub2api_admin_client.dart           # 管理员公共入口
└── src/
    ├── shared/
    │   ├── configuration/
    │   ├── errors/
    │   ├── logging/
    │   ├── serialization/
    │   ├── session/
    │   └── transport/
    ├── auth/
    ├── user/
    ├── keys/
    ├── usage/
    ├── billing/
    └── admin/
        ├── users/
        ├── accounts/
        ├── groups/
        ├── billing/
        ├── monitoring/
        ├── operations/
        └── settings/
```

目录按实际实现渐进创建，不预建空的 `domain/`、`repository/`、`use_cases/` 或
`presentation/`。

依赖方向固定为：

```text
public entrypoints
        ↓
feature clients + public models
        ↓
shared session / transport / serialization / errors
        ↓
dio + Dart SDK
```

约束如下：

1. `shared/` 不依赖任何 feature。
2. User feature 不导入 Admin feature 的实现文件。
3. Admin feature 不通过 User feature 的实现获得权限；它只依赖共享认证会话抽象。
4. feature 之间确有共享协议类型时，将最小稳定类型下沉到 `shared/`，不得互相导入
   `src/` 实现。
5. 顶层入口只导出明确支持的 interface、typed model、请求对象、分页对象和错误类型。
6. 不提供公共 `request(path, map)` 或 `rawDio` 逃生口；新增 endpoint 必须先形成 typed
   contract。

### 3. User 与 Admin 使用不同公共入口

用户能力通过以下入口提供：

```dart
import 'package:sub2api_client/sub2api_client.dart';
```

管理员能力通过以下入口提供：

```dart
import 'package:sub2api_client/sub2api_admin_client.dart';
```

建议的外部 interface 是少量 facade，而不是让调用方直接组合 Dio、interceptor 和
endpoint 类：

```dart
final client = Sub2ApiClient(configuration: configuration);

await client.auth.login(...);
await client.user.getProfile();
await client.keys.list(...);
await client.usage.getStats(...);
await client.billing.createOrder(...);
```

```dart
final admin = Sub2ApiAdminClient(configuration: configuration);

await admin.users.list(...);
await admin.accounts.list(...);
await admin.groups.list(...);
await admin.billing.listOrders(...);
```

两个 facade 可共享由调用方注入的 session store 和底层 transport 配置，但
`Sub2ApiClient` 不暴露 `.admin` 属性。管理员请求发出前必须确认当前服务端用户角色为
`admin`；角色不满足时返回稳定错误码 `auth.admin_required`，不得依赖 UI 隐藏入口作为
权限控制。

`/admin/*` 的具体模块以 `v0.1.155` 固定源码为准，按 contract tests 渐进实现；不得
通过公共通用请求方法宣称“已覆盖全部 Admin API”。

### 4. Admin 会话与 Admin Key 分离

本 ADR 接受的是使用管理员用户 Bearer session 调用 `/admin/*` 的
`Sub2ApiAdminClient`。

如果后续需要使用 Admin Key 的服务端集成或运营自动化，应在同一 package 中使用独立
公共入口 `sub2api_ops_client.dart`、独立不透明凭证类型和独立测试矩阵；不得把 Admin Key
塞入用户 session store，也不得让正式用户 App 为使用 User/Admin 客户端而必须导入 Ops
入口。Admin Key 型 Ops endpoint 的精确范围可由后续 ADR 扩展，本 ADR 不自动开放任意
Admin Key 请求。

### 5. package 自有稳定错误接口

公共调用使用 `Future<T>`，失败只抛 package 自有的 `Sub2ApiException`。调用方不需要
认识 Dio 或 wire envelope。

错误 interface 至少包含：

```dart
final class Sub2ApiException implements Exception {
  final Sub2ApiFailureKind kind;
  final String code;
  final bool retryable;
  final int? statusCode;
  final String? traceId;
}
```

`Sub2ApiFailureKind` 至少区分：network、timeout、cancelled、unauthorized、forbidden、
validation、conflict、rateLimited、server、protocol 和 unknown。

错误规则：

- 不暴露 `DioException`。
- 不把原始响应 `Map`、response body 或后端 message 作为公共必需字段。
- `code` 是调用方分支判断的稳定机器码；UI 文案由调用方映射。
- `traceId` 只承载非敏感请求追踪标识。
- `toString()`、日志和 metadata 不包含密码、access token、refresh token、API Key、
  Admin Key、完整支付 URL 或完整请求/响应 body。
- JSON 类型、必填字段或 envelope 不符合固定合同时，返回 `protocol.*`，不得静默填充成
  看似成功的业务对象。

Codex-Trans 等调用方可以在 adapter 层把 `Sub2ApiException` 映射为自己的
`Result<T>` / `AppFailure`，本 package 不反向依赖调用方的错误类型。

### 6. wire DTO 与公共 model 分离

HTTP JSON 使用内部 wire DTO，并以 `json_serializable` 生成解析代码。公共 model 是不可变
typed object，不直接暴露原始 JSON。

- wire DTO 跟随固定服务端字段；
- public model 表达调用方需要的稳定语义；
- mapping 是 feature 内部实现；
- 分页接口返回 typed `Sub2ApiPage<T>`，保留 `items`、`page`、`pageSize` 和 `total`；
- 不使用 `items/list/data` 多形态猜测来掩盖协议漂移；
- 金额、余额、倍率和用量以服务端值为事实来源，客户端不得建立第二账本，也不得使用
  浮点相等判断支付或余额正确性。

首充赠额只有在服务端提供权威资格、预计赠额、订单结算和已使用状态后才能进入 public
model。客户端不得用充值历史或本地 flag 自行推断“首次充值”。

### 7. 会话存储是注入 seam，刷新语义由 package 统一负责

package 定义纯 Dart `Sub2ApiSessionStore` interface，调用方提供 adapter。package 不直接
选择 Keychain、Windows Credential Manager、`flutter_secure_storage`、文件或数据库。

session store 负责原子读取、写入和清除：

- access token；
- refresh token；
- 必要的非敏感过期信息；
- 可选账号/服务器 scope。

刷新合同固定为：

1. 携带当前 session 的受保护 endpoint 收到 HTTP 401 后才可触发 refresh。
2. 同一 session 的并发 401 共享一个 single-flight refresh。
3. refresh 成功必须先持久化旋转后的 access token 和 refresh token，再重放原请求。
4. 每个原请求最多重放一次。
5. refresh 失败或返回非法 token 时清除 session，并抛稳定 unauthorized/session-expired
   错误。
6. login、register、2FA、refresh 自身不进入递归刷新。
7. logout 尽力通知服务端，但调用方明确登出时即使服务端不可达也必须清除本地 session。
8. 切换账号或服务器时，in-flight 请求不得把旧 session 的刷新结果写入新 session。

是否使用 `fresh_dio` 是内部实现选择。只有当独立 spike 证明其完整满足上述 rotation、
single-flight、session scope、logout 和失效语义时才可采用；否则实现最小 refresh
coordinator。两种实现不得改变公共 interface。

### 8. transport、重试与支付外跳

`Sub2ApiConfiguration` 至少包含：

- 服务端 origin；package 规范化后使用 `<origin>/api/v1`；
- connect、send、receive timeout；
- session store；
- 可选 redacted logger；
- 可选测试 transport adapter。

默认要求 HTTPS。测试环境或本机开发若使用 HTTP，必须显式开启 insecure development
选项，不能由 URL 自动降级。

除一次 401 refresh/replay 外，首版不自动重试请求。尤其不得自动重试建单、修改余额、
创建 Key、删除 Key 或 Admin 写操作。若某 endpoint 日后提供并验证幂等键，应在该 feature
的 typed request 中显式建模，而不是全局猜测。

billing 只返回 typed checkout 信息、订单、支付 URL/二维码和核验结果。打开浏览器、
WebView、deep link、轮询调度、UI 倒计时和支付页面状态属于调用方 App，不进入 package。

### 9. 日志和敏感数据

logger 是可选注入 adapter，只接收已脱敏的结构化事件：

- operation 名称；
- method 和模板化 path；
- status code、稳定 failure code、duration；
- 非敏感 trace ID。

禁止记录：

- 请求/响应完整 headers 或 body；
- password、验证码、TOTP code；
- access/refresh token；
- API Key、Admin Key；
- 完整支付 URL、二维码内容；
- 用户提示词、上游供应商凭证或服务端内部配置。

凭证和 Key 类型的 `toString()` 必须固定输出脱敏占位符。

### 10. 测试结构与证据层级

测试使用 `dart test`，不使用 `flutter_test`。建议结构：

```text
test/
├── contract/
│   └── fixtures/v0_1_155/
├── shared/
│   ├── envelope_test.dart
│   ├── error_mapping_test.dart
│   └── refresh_coordinator_test.dart
├── user/
├── admin/
└── integration/
```

最低验证要求：

- 成功、业务失败、HTTP 失败和 malformed envelope；
- timeout、取消、网络错误和服务端错误映射；
- 单个 401 refresh/replay；
- 多个并发 401 只刷新一次；
- access/refresh token 同时 rotation；
- refresh 失败、logout 和 session scope 竞态；
- role 非 admin 时禁止 Admin 请求；
- User 与 Admin DTO 的固定 `v0.1.155` fixtures；
- 非幂等请求不会自动重试；
- 日志与异常不泄漏凭证。

真实服务集成测试必须显式启用，使用受控环境和通过环境变量/交互方式注入的测试凭证；
不得把真实凭证、服务地址或响应数据提交到仓库。fixture、mock 和受控集成测试均不等同于
生产验收。

## 实施顺序

1. 将模板迁移为纯 Dart package，补齐 MIT、README、分析规则和 `dart test`。
2. 建立 `v0.1.155` envelope、错误和 auth fixtures。
3. 实现 shared transport、serialization、typed exception 和 session store seam。
4. 完成 refresh coordinator spike 与并发 contract tests。
5. 实现 Auth。
6. 依次实现 User/Profile、Key、Usage、Billing。
7. 依次实现 Admin Users、Accounts、Groups、Billing、Monitoring、Operations、Settings。
8. 在受控 Sub2API 环境运行分离的非 GUI 集成测试。
9. 若需要 Admin Key 型 Ops，先补充精确 endpoint/credential ADR，再实现独立入口。

## 验证要求

每个实现阶段至少运行：

```text
dart format --output=none --set-exit-if-changed .
dart analyze --fatal-infos
dart test
```

准备发布 package 时另运行：

```text
dart pub publish --dry-run
```

架构检查必须证明：

- production dependency graph 不包含 Flutter 或 native plugin；
- public entrypoints 不导出 `src/` transport、Dio、wire DTO 或原始 JSON；
- User 入口不暴露 Admin client；
- Admin role guard、refresh single-flight、错误映射和日志脱敏由测试覆盖；
- fixture 明确标注 `v0.1.155` 和固定 commit。

## 后果

### 正向

- 独立 package 可被多个 Flutter/Dart 应用复用，不与 Codex-Trans 的 UI 或 `core` 耦合。
- User/Admin 在导入和类型层面分离，减少权限能力误用。
- refresh、envelope、错误和日志规则集中在一个深协议模块，修复一次即可覆盖所有 feature。
- typed DTO 和固定 fixtures 能及时暴露上游协议漂移。
- App 可自由选择 Riverpod、Bloc、secure storage 和支付外跳方案。

### 负向与成本

- 相比复制 `sub2api-app`，需要重新建立 DTO、mapping 和 contract tests。
- 独立 package 与 Codex-Trans 分属不同仓库，需要固定版本/commit 和升级流程。
- User/Admin 覆盖面较大，必须分阶段交付，不能把文件数量当作完成度。
- session store、logger 和测试 transport seam 增加少量初始设计成本。

### 风险与缓解

- **协议漂移**：固定 `v0.1.155` fixtures；升级时重新核对源码并记录兼容策略。
- **Admin 能力误入普通 App**：独立入口、role guard、无 `.admin` 快捷属性。
- **凭证泄漏**：opaque credential、脱敏 logger、异常字段白名单和负向测试。
- **feature-first 变成大量浅包装**：只暴露业务语义方法，transport/envelope/session 保持内部
  深实现；不提供通用 path 请求逃生口。
- **参考实现影响 MIT 边界**：不 vendor 或复制 LGPL 文件；保留参考 commit 和来源记录。
- **错误容忍掩盖后端不兼容**：malformed contract fail closed，不用多字段猜测返回成功。

## 被拒绝方案

### 1. 直接 fork 或依赖 `sub2api-app`

拒绝。它是完整 Flutter App，包含 UI、状态管理和 native plugin，Dart SDK 与目标工具链
也不同；其许可证和应用结构不适合作为 MIT 纯 Dart package 的实现基础。

### 2. 继续保留 Flutter package 形态

拒绝。协议客户端不需要 widget、asset、platform runner 或 Flutter plugin。保留 Flutter
依赖会迫使纯 Dart 调用方安装 Flutter，并模糊安全存储与协议层的职责。

### 3. 把 package 放入 Codex-Trans workspace 并依赖其 `core`

拒绝。主理人已决定独立维护。调用方适配自己的 `Result`/错误模型，package 不反向依赖
单一产品。

### 4. 使用 App 级 MVVM、Repository 和状态管理层

拒绝。这个 package 只包装一个远程协议数据源，不拥有 UI 状态或本地 SSOT。Repository、
ViewModel 和 Riverpod/Bloc provider 属于调用方 App。

### 5. 暴露 Dio、原始 Map 或通用 endpoint 方法

拒绝。该方案会把协议细节和错误处理扩散到每个调用方，削弱类型安全，并绕开 User/Admin
权限与日志约束。

### 6. 从非固定 OpenAPI 或默认分支生成全部客户端

拒绝。上游没有权威项目 OpenAPI；默认分支会漂移。后续可以维护本项目 fixture 或 schema，
但不得把倒推的 schema 宣称为上游官方合同。

## 后续决策

以下事项不由本 ADR 自动决定：

- Admin Key 型 `Sub2ApiOpsClient` 的精确 endpoint 和部署边界；
- `v0.1.155` 之后的兼容矩阵和版本协商策略；
- 调用方使用何种 secure storage、状态管理或依赖注入框架；
- 首充赠额的服务端权威合同；
- 退款、收据、托盘、跨重启产品恢复和埋点。

这些事项在进入实现或改变公共 interface 前应新增 ADR 或明确扩展本 ADR。

## 参考

- Sub2API `v0.1.155`：commit `41cec0db059ffb82d0efdcfcf07a24ab51fbfe97`
- `gucooing/sub2api-app` 行为参考：commit
  `39848a20d2821de1d367388ae298e0b42353cf92`
- Codex-Trans ADR-0017：melos 多包工作区与 `sub2api_client` 初始 package seam
- Codex-Trans 调研：`2026-08-25-sub2api-flutter-client-landscape.md`
