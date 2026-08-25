# ADR-0006：采用内部 Retrofit 与自研 Session Coordinator

- **状态**：Accepted
- **日期**：2026-08-25
- **决策者**：Package 主理人
- **关联**：ADR-0003、ADR-0004、ADR-0005

## 背景

ADR-0003 将 Retrofit 和 `fresh_dio` 都设为实现期 spike，而不是预先锁定。实现已完成固定
`v0.1.155` 的 `/settings/public`、`/auth/login` 和 `/keys` 三类 endpoint，并建立并发 401、
refresh-token rotation、generation、取消、总 deadline、replay 上限和 close 的确定性测试。

Retrofit 能减少 method/path/query/header/body 接线，同时仍允许共享 executor 统一处理成功
envelope、双错误结构、取消和 session；生成类型均保留在 `lib/src`。

`fresh_dio 0.6.0` 能处理基础 token refresh，但其状态以单一 refresh Future 和 token storage
为中心，没有 package 合同要求的 `(origin, scope, generation)` 隔离，也不拥有 logout、账号
替换、origin/client close 后旧结果失效的语义。它的 replay 还会重新获得 Dio phase timeout，
不能直接继承原请求的绝对总 deadline。为补齐这些差异仍需另写完整 coordinator 包装层，
复杂度高于直接实现最小状态机。

## 决策

### 1. 采用 Retrofit 作为内部 wire endpoint 层

- 每个 feature 使用内部 Retrofit service 描述 method、path、query、header 和 request DTO；
- Retrofit service 返回的 `HttpResponse`、Dio、wire DTO 和 JSON 不从 public library 导出；
- 成功/错误 envelope、状态码、trace ID、取消和 deadline 继续由共享 executor/decoder 处理；
- public facade 只返回 package model 或抛出 `Sub2ApiException`；
- 生成的 `.g.dart` 文件进入源码和发布制品。

三 endpoint spike 已证明：公开设置不携带 Authorization；登录 body 和 union mapping 保持
strict；Key list 丢弃 wire secret，create 显式携带 `Idempotency-Key`。

### 2. 不采用 fresh_dio，使用最小自研 coordinator

正式依赖不加入 `fresh_dio`。自研 coordinator 固定以下状态合同：

1. 每个请求捕获 session scope、generation 和同一份总 deadline；
2. 同 generation 的并发 401 共享一个 refresh Future；
3. refresh 走无认证/无 refresh interceptor 的公开 auth wire path；
4. 旋转后的 token pair 原子写入完成后才允许 replay；
5. 单个等待者取消或超时不取消共享 refresh；
6. 每个请求最多 replay 一次，建单和 Key 创建使用 non-replayable executor；
7. logout、账号替换和 client close 推进 generation，旧 refresh 不得写回或 replay；
8. access-only session 不 refresh，失效后返回 `auth.login_required`；
9. client close 后新调用稳定返回 `client.closed`。

`Sub2ApiConfiguration.totalRequestTimeout` 是公开的端到端预算；initial request、等待 refresh
和 replay 共享该预算，不用 connect/send/receive timeout 的相加值冒充总 deadline。

### 3. 实现期生成命令

当前解析的 `build_runner 2.15.x` 已移除 `--delete-conflicting-outputs` 行为并会忽略该参数，
因此实际生成命令使用：

```text
dart run build_runner build
```

生成漂移 Gate 仍通过“重新生成后 Git 无差异”验证，不降低 ADR-0005 的要求。

## 验证要求

- Retrofit spike 的 Capability、Auth、Key 测试必须保持离线通过；
- N 个并发 401 只执行一次 refresh，且 replay 发生在 session store write 完成之后；
- logout、账号替换和 close 期间完成的旧 refresh 不得覆盖当前 session；
- 单等待者取消不影响其他等待者，deadline 到期不得获得新的 replay 预算；
- replay 再次 401 时不得出现第三次 wire call；
- access-only、invalid refresh、non-replayable 和 `client.closed` 路径有独立测试；
- `dart pub deps` 不得出现 `fresh_dio` 或其 public/session 类型。

## 后果

### 正向

- endpoint 接线由生成代码承担，同时共享错误和 session 机制保持单一来源；
- concurrency、generation、deadline 和 close 语义可以直接测试，不受第三方状态机限制；
- public API 不依赖 Dio、Retrofit 或任何第三方 token 类型。

### 负向

- package 自己维护约两类共享状态：session generation 与 in-flight refresh；
- Dio/Retrofit 大版本升级需要重新运行 endpoint 和 cancellation contract tests；
- 自研 coordinator 的竞态测试是长期维护 Gate，不能简化为基于 sleep 的 happy path。

## 被拒绝方案

- **采用 fresh_dio 并增加 generation wrapper**：会同时维护第三方和自研两层状态机，拒绝。
- **用 Dio interceptor 递归调用 refresh**：refresh 401 可能递归或死锁，拒绝。
- **手写全部 Dio endpoint**：三 endpoint spike 已证明 Retrofit 能减少机械接线且不污染
  public API，拒绝。
- **replay 时重置 timeout**：会突破调用方原始时间边界，拒绝。
