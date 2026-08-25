# ADR-0005：按官方 Dart package 实践收敛 v0.1 工程计划

- **状态**：Accepted
- **日期**：2026-08-25
- **决策者**：Package 主理人
- **关联**：ADR-0001、ADR-0002、ADR-0003、ADR-0004
- **替代范围**：ADR-0001 的 v0.1 测试目录和实施顺序；ADR-0003 中“用已提交 lockfile
  固定 library 依赖解析”的规则；ADR-0004 的 JSON 兼容、refresh replay 和 client 生命周期
  未明确部分

## 背景

现有 ADR 已正确选择纯 Dart、typed public API、Dio、条件 Retrofit、
`json_serializable`、Freezed、十进制金额和 Future single-flight，但还没有把 Dart 官方
package 目录、依赖约束、严格分析、代码生成、测试分层和公开客户端生命周期变成可执行
Gate。

本 package 是 reusable library，不是 Flutter App。官方 Flutter 的 UI / Logic / Data 分层
原则需要按边界应用，而不是在 package 内照搬 ViewModel 或 Repository：package 自身只
拥有协议服务和领域事实；调用方 App 才拥有 Repository、ViewModel、Riverpod/Bloc 和 UI
异步状态。

## 决策

### 1. 使用 library 适用的深分层，不引入 App 级状态层

内部依赖方向固定为：

```text
public facade + public models
              ↓
feature client / mapping
              ↓
internal wire service + DTO
              ↓
shared transport / session / errors
              ↓
dio + Dart SDK
```

- public facade 只暴露稳定业务操作、请求对象、结果模型和 package 自有异常；
- feature client 负责编排该 feature 的 endpoint 和 wire-to-public mapping；
- Retrofit endpoint、Dio、wire DTO、JSON map 和 transport metadata 全部留在 `lib/src`；
- 不在 package 中增加 Repository、ViewModel、Riverpod、Bloc 或 Flutter SDK；
- Codex-Trans 在 App adapter / Repository 层把 package 结果转换为 App 领域状态。

这符合职责分离，但避免为单一远程协议数据源建立没有第二数据源或缓存职责的浅
Repository。

### 2. package 目录遵循 Dart 公共/内部边界

v0.1 采用以下渐进目录；没有实现的目录不预建：

```text
lib/
├── sub2api_client.dart
└── src/
    ├── client/
    ├── shared/
    │   ├── configuration/
    │   ├── errors/
    │   ├── serialization/
    │   ├── session/
    │   └── transport/
    ├── capability/
    ├── auth/
    ├── user/
    ├── keys/
    ├── usage/
    └── billing/
test/
├── fixtures/v0_1_155/
└── src/                         # 尽量镜像 lib/src
integration_test/                # 显式运行，不进入默认 dart test
example/
└── sub2api_client_example.dart
tool/                            # 仅在确有生成/校验脚本时创建
```

`lib/sub2api_client.dart` 是 v0.1 唯一 public library。调用方不得导入
`package:sub2api_client/src/...`。v0.1 不创建 Admin public entrypoint。

### 3. library 不提交 `pubspec.lock`

`sub2api_client` 是被其他 package 依赖的 library，不是 runnable application，因此：

- `pubspec.lock` 保持在 `.gitignore`，不得提交；
- 普通依赖使用经测试的兼容约束；用户已明确固定的 `freezed 3.2.5` 继续精确约束；
- code generator 和测试工具的 dev dependency 下限必须对应实际使用的最低版本；
- CI 分别验证允许范围内的最新解析和 `dart pub downgrade` 最低解析；
- `pubspec_overrides.yaml` 只用于未提交的本地联调，不得进入发布制品。

依赖可重复性由明确 constraints、固定 Dart SDK CI 镜像、生成代码漂移检查和上下界测试
共同保证，不把 application lockfile 规则错误套用到 library。

### 4. JSON 对固定合同严格、对新增字段前向兼容

`json_serializable` wire DTO 采用以下统一策略：

- envelope 形态、必填字段、字段类型、枚举和 wire-to-public invariant 不匹配时 fail
  closed 为 `protocol.*`；
- 未识别的新增 JSON 字段默认忽略，以允许同一合同内的 additive server change；不得全局
  启用 `disallowUnrecognizedKeys`；
- response-only DTO 默认不生成 `toJson()`；request-only DTO 只生成发送所需方向；
- 密码、token、Key secret、支付指令不得获得通用 public JSON 导出；
- 嵌套 DTO 使用显式生成映射，解析异常在共享 decoder 中转换为稳定 typed failure；
- `dynamic` 只允许停留在 JSON/wire 边界，映射后立即收敛成具体类型，不进入 public API。

“忽略未知字段”不允许演变为多字段猜测。字段改名、必填字段缺失、类型改变或 envelope
改变仍属于协议不兼容。

### 5. refresh 与 replay 必须避免 interceptor 递归

在 ADR-0004 single-flight 规则之外，补充：

- 只有携带当前 session 的受保护请求才有资格因 401 进入 refresh；capability、login、
  register、2FA、refresh 和 logout 不进入递归刷新；
- refresh 使用绕过认证/refresh interceptor 的独立内部 wire path，不能被自己的 401 再次
  拦截；
- 触发 401 的请求 token、scope 和 generation 必须仍与当前 session 一致，否则只返回旧
  请求失败，不刷新新 session；
- shared refresh Future 的单个等待者取消，只取消该等待者的原请求/重放，不取消其他请求
  正在等待的 refresh；
- replay 继承原请求的取消信号和总 deadline，不重新获得一整套 timeout 预算；
- 只有可重复构造的 typed JSON/form request 才允许自动 replay；stream/upload body 在 v0.1
  不进入该机制；
- refresh 完成后必须在 `finally` 中只清理自己 generation 的 in-flight slot，避免失败
  Future 污染后续 session。

并发测试继续使用 barrier / `Completer` 控制顺序，不使用 sleep 猜测竞态。

### 6. 公开异步 API 与 client 生命周期明确化

- 所有网络操作稳定返回 `Future<T>`；无返回值的异步操作使用 `Future<void>`；不返回
  `FutureOr<T>`；
- `Sub2ApiClient` 对自己创建的 transport 负责并提供显式 `close()`；close 后的新请求返回
  稳定 `client.closed` failure；
- 调用方注入且声明为 externally owned 的测试 transport 不由 client 擅自关闭；
- facade、feature client 和 session coordinator 的生命周期一致，不在 feature 内创建
  隐藏的第二个长期 Dio 实例；refresh 专用 wire path 可共享底层 adapter，但必须绕过递归
  interceptor；
- package 不创建后台 timer、永久轮询任务或未被调用方持有的 fire-and-forget Future。

### 7. analyzer、生成代码和文档成为 Gate

迁移为纯 Dart 后，`analysis_options.yaml` 必须：

```yaml
include: package:lints/recommended.yaml

analyzer:
  language:
    strict-casts: true
    strict-inference: true
    strict-raw-types: true
```

项目可对 generated files 做最小、明确的 lint exclusion，但不能用整库 ignore 隐藏手写代码
问题。手写代码不得使用宽泛 `ignore_for_file: type=lint`。

生成流程固定为一次性、可重复命令：

```text
dart run build_runner build --delete-conflicting-outputs
```

生成文件纳入 package 源码提交；CI 重新生成后必须证明无 diff。发布前还需要 `dart doc`、
README、CHANGELOG、完整 MIT LICENSE、example 和 `dart pub publish --dry-run`。

### 8. 测试按证据层级分离

默认 `dart test` 只运行快速、离线、确定性的 unit/contract tests：

- `test/src/...` 尽量镜像 `lib/src/...`；
- fixture 固定 `v0.1.155` 和 commit；
- transport 使用可编程 fake adapter；只有交互验证显著受益时才引入 mock generator；
- JSON 生成器本身不重复测试，但每个服务端 contract 必须测试 envelope、必填字段、类型、
  additive unknown field 和 public mapping；
- concurrency tests 覆盖 single-flight、rotation、generation、取消、deadline、replay 上限和
  close；
- 敏感类型与日志使用负向测试证明原值不可见。

受控真实服务测试放在 `integration_test/`，必须显式运行：

```text
dart test integration_test
```

它需要环境变量显式启用，只允许连接 `linux-env` 的固定版测试部署，不得复用生产凭证、
真实支付或用户数据。

## 修订后的实施计划

### Phase 0：package hygiene

1. 为独立 package 初始化自己的 Git 仓库和提交边界。
2. 将 Flutter 模板迁移为纯 Dart：删除 Flutter SDK、`flutter_test`、Calculator、Flutter
   metadata 和未提交 lockfile。
3. 补齐合法 MIT LICENSE、README、CHANGELOG、strict analyzer 与基础 example。
4. 建立 format/analyze/test/publish-dry-run 命令。

### Phase 1：contract-first 基础

1. 固定 capability、双错误 envelope、login 和 Key 的 `v0.1.155` fixtures。
2. 先写 origin、status、JSON、error、money 和 sensitive value object 的失败/成功测试。
3. 建立 fake transport、shared decoder、trace ID 和 public exception。

### Phase 2：Retrofit 三端点 spike

1. 只实现 `/settings/public`、`/auth/login`、`/keys`。
2. 证明 generated endpoint 不泄漏 wire 类型，且共享错误 decoder、取消和 fixture 测试不比
   手写 Dio 更复杂。
3. 通过则采用 Retrofit；失败则删除 spike 生成层并回退手写 Dio，不改 public API。

### Phase 3：session concurrency

1. 先完成 deterministic refresh tests，再实现 coordinator。
2. 对 `fresh_dio` 和最小自研实现运行同一套 rotation/single-flight/generation/cancel/
   deadline/replay tests。
3. 选择满足全部合同且代码更浅的一方，记录实现决策和测试证据。

### Phase 4：用户域纵向切片

按以下顺序，每个 feature 都执行 fixture -> wire DTO -> mapping -> public API -> unit tests：

```text
Capability/Auth -> User/Profile -> Key -> Usage -> Billing
```

Billing 建单保持零自动重试；`COMPLETED` 后重新读取余额的规则由 package 返回事实、App
状态机负责展示。

### Phase 5：受控集成与发布准备

1. 在 `linux-env` 固定部署 `v0.1.155` 或不可变 image digest。
2. 运行显式 `integration_test/`，记录脱敏环境摘要、commit/digest 和清理结果。
3. 在允许依赖的最新解析与 `dart pub downgrade` 两端分别通过 analyze/test。
4. 重新生成代码并确认无 diff，运行 `dart doc` 和 `dart pub publish --dry-run`。
5. 之后才为 Codex-Trans 新增真实 adapter/secure-storage/checkout 实施 ADR；package 测试通过
   不等于正式 App 或 GUI 完成。

## 完成标准

- production dependency graph 不包含 Flutter、Riverpod、Bloc 或 native plugin；
- public library 不导出 Dio、Retrofit、wire DTO、`dynamic` JSON 或第三方 session 类型；
- 默认 unit/contract suite 不访问网络，live integration 必须显式运行；
- latest 与 downgraded dependency resolution 均通过 format、analyze 和 tests；
- code generation 无漂移，API docs/example/publish dry-run 通过；
- refresh 竞态、取消、deadline、close、支付零重试和 secret redaction 有确定性测试；
- `linux-env` 证据只声明受控后端合同通过，不冒充 App、GUI 或 production 验收。

## 后果

**正向**：实现步骤与 Dart package 规则一致；library 不再误提交 lockfile；默认测试保持快
且离线；公开 API、JSON 兼容和 refresh 生命周期更明确。

**负向 / 成本**：增加依赖上下界矩阵、生成漂移检查、close/cancel/deadline 测试和显式
integration suite；初始骨架阶段工作量略增。

**风险与缓解**：过度照搬 Flutter App 分层会制造浅抽象，因此只保留 public/feature/
wire/transport 边界；忽略未知 JSON 字段可能掩盖字段改名，因此必填字段、类型和 invariant
仍 fail closed；Retrofit 或 `fresh_dio` 若破坏这些 Gate，均允许在不改变 public API 的
前提下回退。

## 被拒绝方案

- **在 package 内加入 ViewModel/Repository/Riverpod**：职责属于调用方 App，拒绝。
- **把 live tests 放在默认 `test/`**：会让普通开发和 CI 隐式访问网络，拒绝。
- **提交 library 的 `pubspec.lock`**：与 Dart package 官方约定冲突，拒绝。
- **全局拒绝任何未知 JSON 字段**：会把 additive change 错判为破坏性变更，拒绝。
- **refresh 复用同一认证 interceptor 链**：可能递归或死锁，拒绝。
- **replay 时重置 timeout 或重放 stream body**：会延长调用边界或产生不可重复副作用，拒绝。

## 参考

- Dart package layout conventions：`https://dart.dev/tools/pub/package-layout`
- Dart package dependencies：`https://dart.dev/tools/pub/dependencies`
- Dart static analysis：`https://dart.dev/tools/analysis`
- Dart testing：`https://dart.dev/tools/testing`
- Dart concurrency：`https://dart.dev/language/concurrency`
- Effective Dart design：`https://dart.dev/effective-dart/design`
- Flutter JSON serialization：
  `https://docs.flutter.dev/data-and-backend/serialization/json`
