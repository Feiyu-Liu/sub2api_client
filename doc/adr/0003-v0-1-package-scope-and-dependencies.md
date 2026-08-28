# ADR-0003：固定 v0.1 用户端范围与 package 依赖

- **状态**：Accepted（Admin/Ops 范围由 ADR-0008 替代；library lockfile、工程 Gate 与实施
  计划由 ADR-0005 部分替代）
- **日期**：2026-08-25
- **决策者**：Package 主理人
- **关联**：ADR-0001、ADR-0002
- **替代范围**：ADR-0001 中首版同时实现 Admin 的范围，以及首版生产/开发依赖清单；
  ADR-0001 的独立纯 Dart、MIT、feature-first、typed error、session store seam 和安全规则
  继续有效

## 背景

ADR-0001 建立了独立纯 Dart 客户端的总体结构，但把 User 与 Admin 都列入首版，并只允许
最小的 Dio/JSON 依赖。进一步评审确认，Codex-Trans 首次接入只需要用户端合同，而
annotation/code generation 能减少 HTTP 接线、不可变模型和多态结果的重复代码。

同时，状态管理、OS 安全存储和打开外部收银台属于调用方 App，不应进入可供 Dart CLI、
测试工具和其他 Flutter App 共同复用的协议 package。

## 决策

### 1. v0.1 只交付用户端能力

v0.1 的完成范围固定为：

- capability bootstrap；
- Auth，包括注册、登录、2FA、refresh 和 logout；
- User/Profile；
- Key / Installation Key primitive；
- Usage；
- Billing，包括支付配置、套餐、余额充值建单、查单和核验。

v0.1 不提供 `sub2api_admin_client.dart` 或 Admin/Ops endpoint。Admin 用户 session、Admin
Key 和运营自动化都不进入首版依赖、public interface 或完成标准；出现明确调用方后必须
新增 ADR 再开放。

### 2. 内部 HTTP wire 层

内部 wire 层采用：

- `dio`：HTTP transport、timeout、取消、interceptor 和测试 adapter；
- `retrofit`：通过短 spike 后用于生成 typed endpoint 实现；
- `json_annotation` + `json_serializable`：严格 wire DTO 的 JSON 代码生成。

Retrofit 只存在于内部 wire seam，不得从 package public entrypoint 导出生成 client、
`HttpResponse`、Dio、wire DTO 或原始 JSON。

短 spike 固定覆盖三个差异最大的合同：

1. `/settings/public`：普通 success envelope；
2. `/auth/login`：token pair、access-only 与 2FA；
3. `/keys`：分页和上游完整 secret 回传。

只有同时满足以下条件才完成 Retrofit 采用：

- malformed contract 继续 fail closed；
- Dio 异常和 wire envelope 不泄漏到 public interface；
- 双错误结构仍由一个共享解码位置处理；
- mock transport 和 fixture 测试不比手写 Dio 更困难；
- 生成代码确实替代 endpoint path/query/body/response 的重复接线。

若 spike 未通过，回退为手写 Dio wire client；这是内部实现回退，不改变 public interface，
也不重新选择 Chopper。

### 3. 公共模型层

公共不可变模型和多态结果采用：

- `freezed_annotation` + `freezed 3.2.5`；
- `decimal` 作为金额、余额、倍率和高精度用量模型的内部十进制实现；
- package 自有 money/decimal value object 作为稳定 public interface，不向调用方暴露裸
  `double`，也不要求调用方直接依赖第三方 `Decimal` 类型。

Freezed 适用于普通 immutable model、登录结果、支付结果和分页结果。以下敏感类型必须
手写，不使用自动生成的 `toString()`、`copyWith` 或通用 JSON 导出：

- access token；
- refresh token；
- API Key / Installation Key secret；
- 未来可能出现的 Admin Key；
- 需要隐藏完整内容的支付指令。

`Sub2ApiException` 也保持手写，以固定错误字段和脱敏字符串化。

### 4. Session 刷新实现延后到合同测试后决定

session public seam 继续使用 ADR-0001 的 `Sub2ApiSessionStore`。内部 refresh coordinator
在实现时根据合同测试选择：

- 采用 `fresh_dio`；或
- 使用 Dio 实现最小自研 coordinator。

选择前必须覆盖 refresh token rotation、并发 401 single-flight、原子保存新 token pair、
每请求最多 replay 一次、logout、session scope 和切换 origin/账号竞态。若 `fresh_dio`
需要绕过这些合同或暴露其类型，则采用自研实现。该选择不进入 public interface。

### 5. 明确不进入 package

以下依赖不进入 `sub2api_client`：

- Riverpod / `flutter_riverpod`；
- Bloc / `flutter_bloc`；
- `flutter_secure_storage`；
- `url_launcher`；
- Flutter SDK、widget、路由、WebView、deep link 或其他 native plugin。

Riverpod/Bloc 属于调用方状态管理；`flutter_secure_storage` 是 App 提供
`Sub2ApiSessionStore` adapter 的候选；`url_launcher` 是 App 消费 billing checkout
instruction 的 adapter。package 只返回 typed 事实，不拥有页面、导航或 OS 副作用。

### 6. 依赖与生成代码治理

- package 继续以 Dart `^3.11.0` 为兼容下限；
- `freezed` 精确固定为 `3.2.5`；
- 其他依赖使用与 Dart 3.11 兼容的受审约束，并由 lockfile 固定解析结果；
- 所有生成文件纳入 package 提交和发布制品；
- CI 必须验证生成代码无漂移；
- 依赖升级若改变 public model、generator output、最低 Dart SDK 或错误/刷新语义，必须
  单独评审，不能作为普通 patch 自动合入。

## 实施顺序

1. 将 Flutter 模板迁移为纯 Dart，移除 Calculator、Flutter SDK 和 `flutter_test`。
2. 写 Retrofit 三 endpoint spike 及等价 contract tests。
3. 固定最终 transport 依赖并建立共享 envelope/error/session 实现。
4. 建立 Freezed public model、json_serializable wire DTO 和手写敏感类型。
5. 通过并发 session 测试选择 `fresh_dio` 或自研 coordinator。
6. 按 Capability/Auth -> User/Profile -> Key -> Usage -> Billing 实现 v0.1。
7. 在 `linux-env` 固定版 Docker 环境运行受控集成测试。

## 验证要求

- `dart pub deps` 不包含 Flutter、Riverpod、Bloc 或 native plugin；
- public entrypoint 不导出 Dio、Retrofit、wire DTO、原始 JSON 或第三方 session 类型；
- Freezed 普通模型覆盖 equality、copy 和 union 分支测试；
- 敏感类型的 `toString()`、异常、日志和快照均不包含原值；
- 金额、余额和用量不通过裸 `double` 构成 public interface；
- Retrofit spike 的三类合同和 fallback 路径有测试证据；
- refresh 实现通过 rotation、single-flight、logout 和 session scope 竞态测试；
- v0.1 public entrypoint 不存在 Admin/Ops 能力；
- `dart format --output=none --set-exit-if-changed .`、`dart analyze --fatal-infos`、
  `dart test` 和 `dart pub publish --dry-run` 通过。

## 后果

**正向**：首版聚焦正式 App 需要的用户闭环；Retrofit/JSON/Freezed 减少机械代码；金额
精度、敏感类型和 Session 仍保留项目自有安全合同；package 不绑定任何 App 状态框架或
native plugin。

**负向 / 成本**：增加 source generation 和生成文件治理；Retrofit 与 session 方案需要
前置 spike；Freezed 版本受 Dart 3.11 工具链约束；Admin 需要未来单独排期。

**风险与缓解**：生成框架侵入 public interface -> 只在内部 wire seam 使用 Retrofit；
Freezed 泄漏 secret -> 敏感类型全部手写并做负向测试；依赖升级破坏代码生成 -> 固定版本、
提交生成文件并在 CI 检查漂移。

## 被拒绝方案

- **v0.1 同时实现 Admin/Ops**：正式 App 不消费这些能力，会扩大协议和权限测试矩阵，拒绝。
- **在 package 中提供 Riverpod 或 Bloc 状态**：绑定调用方架构并制造第二份缓存/生命周期，
  拒绝。
- **使用 Chopper**：会替换已选择的 Dio transport，且仍不能解决 Sub2API 的错误和会话
  合同，拒绝。
- **从非权威 OpenAPI 生成客户端**：上游没有固定官方 schema，会形成第二份易漂移合同，
  拒绝。
- **所有模型都使用 Freezed**：自动字符串化和复制会扩大 secret 泄漏面，拒绝。
