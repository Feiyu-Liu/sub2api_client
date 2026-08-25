# ADR-0004：固定 HTTP、JSON 与并发执行策略

- **状态**：Accepted（JSON 前向兼容、refresh replay 与 client 生命周期由 ADR-0005 补充）
- **日期**：2026-08-25
- **决策者**：Package 主理人
- **关联**：ADR-0001、ADR-0002、ADR-0003

## 背景

ADR-0003 已选择 Dio、条件 Retrofit、`json_serializable`、Freezed 和可替换的 refresh
coordinator，但尚未明确以下执行边界：URI 如何构造、哪些状态码算成功、JSON 何时进入
isolate，以及并发 401、logout、切换账号或切换服务器之间如何避免旧 session 覆盖新
session。

Sub2API 用户管理接口以网络 I/O 和小型、分页 JSON 为主。把 HTTP 等待或所有 JSON
解析一律移入 isolate 不会提高吞吐，反而会增加消息复制、启动成本和会话一致性复杂度；
但若真实大响应的解析超过 Flutter 单帧预算，也不能阻塞调用方 UI isolate。

## 决策

### 1. 网络 I/O 使用 `async` / `await`，不使用 isolate

Dio 请求、超时、取消和响应等待都使用普通异步 I/O。package 不为 HTTP 请求创建
`Isolate`，也不建立常驻网络 worker。

`Sub2ApiConfiguration` 接收经过验证的 origin，而不是由 endpoint 字符串拼接完整 URL。
origin 必须是绝对 URI，不能包含 user-info、query 或 fragment；production 只允许 HTTPS。
origin path 只允许为空或 `/`。显式开启 insecure development 后，受控测试环境才可使用
HTTP。内部统一解析 origin、`/api/v1` base path、endpoint path 和 query parameters；
feature 不允许用字符串相加构造 URL。

每个 typed endpoint 明确列出其合法成功状态和 body 形态。不能把全局成功规则简化为
“只接受 200/201”，也不能只因状态码属于 2xx 就跳过 envelope 校验：

- 有 body 的成功响应必须通过固定 wire contract 解码；
- 明确声明为无 body 的 endpoint 才接受 204；
- 其他状态统一进入共享错误解码，映射双错误结构或 transport failure；
- malformed success/error body 必须 fail closed 为 `protocol.*`。

除 token refresh 后对原请求最多 replay 一次外，v0.1 不做自动网络重试。取消请求返回
`cancelled`，不能被重试或误判为 session 失效。

### 2. JSON 使用生成的 wire DTO，默认在当前 isolate 解析

HTTP JSON 只进入内部 wire DTO，并由 `json_serializable` 生成严格解析代码。嵌套 DTO
启用显式嵌套序列化；wire DTO 再映射为 Freezed public model 或手写敏感类型。公共 API
不返回原始 `Map<String, dynamic>`、原始 body 或生成的 Retrofit response 类型。

v0.1 默认在发起调用的 isolate 内解析 JSON，原因是管理面响应应分页且预计较小。不得仅
按列表条目数量猜测性能，也不得为了“后台执行”无条件复制每个 response body。

当真实 profile 证明某个独立 decode + mapping 操作在目标桌面设备上超过 16 ms 时，才
允许将该解析器内部切换为短时 `Isolate.run()`。采用前必须满足：

- 输入、输出和异常都可跨 isolate 传递；
- callback 不读取 Dio、session store、logger 或其他共享可变状态；
- 同一 fixture 的同步与 isolate 路径结果完全一致；
- isolate 的启动与复制成本低于被卸载的计算成本；
- 该优化不改变 public API。

纯 Dart package 不使用 Flutter `compute()`。v0.1 不建立 `Isolate.spawn()` + port 的常驻
JSON worker；若未来连续大数据流确实需要 worker，必须用新 ADR 说明生命周期、背压、
取消、错误传播和资源释放。

### 3. refresh single-flight 使用同一 isolate 的 Future 协调

refresh coordinator 是会话一致性机制，不是 CPU 并行任务，因此不放入 isolate。实现
使用同一 isolate 内共享的 in-flight `Future`，并按 `(origin, session scope, generation)`
隔离刷新批次。

固定顺序如下：

1. 请求捕获发送时的 session scope 与 generation。
2. 同一 scope 的并发 401 只创建一个 refresh Future，其余请求等待该 Future。
3. refresh 成功后，先原子保存旋转后的 token pair，再允许原请求 replay。
4. 每个原请求最多 replay 一次；replay 再次 401 时直接使 session 失效。
5. logout、切换账号或切换 origin 必须推进 generation，并使旧 generation 的 refresh、
   response 和 replay 结果失去提交资格。
6. refresh 失败时只清理仍与该 scope/generation 匹配的 session，不能清除用户后来建立的
   新 session。

是否采用 `fresh_dio` 仍由 ADR-0003 的 spike 决定；无论选择哪种实现，都必须满足上述
顺序和竞态合同，且不得向 public API 暴露第三方 session 类型。

### 4. 调用方拥有 UI 异步状态

package 只提供 `Future<T>` 和稳定异常，不提供 `FutureBuilder`、Riverpod、Bloc、loading
状态、轮询计时器或页面生命周期。transport 发生取消时映射为稳定的 `cancelled` failure；
Codex-Trans 在 adapter/ViewModel 层把结果映射为自己的 `Result<T>` 与异步状态；package
不建立第二份 UI cache 或业务账本。

## 验证要求

- origin 测试覆盖 HTTPS、显式 insecure HTTP、user-info、query、fragment、非根 path、
  base path 和 query encoding；
- endpoint contract tests 覆盖 200、201、适用的 204、其他 2xx malformed body、4xx/5xx、
  双错误结构和非 JSON body；
- JSON tests 覆盖嵌套 DTO、未知字段、必填字段缺失、类型错误和 wire-to-public mapping；
- 用代表性最大分页 fixture 记录 decode + mapping profile；只有测得超过 16 ms 的 parser
  才增加 `Isolate.run()` 路径；
- 并发测试使用 barrier/`Completer` 控制顺序，不依赖易抖动的 sleep；
- N 个并发 401 只产生一次 refresh，且所有 replay 都发生在新 token pair 原子保存之后；
- logout、账号切换和 origin 切换期间到达的旧 refresh/response 不得覆盖新 session；
- 每请求最多 replay 一次，取消请求不触发自动重试；
- `dart pub deps` 继续证明 package 不依赖 Flutter，因此不存在 `compute()` 或 native plugin。

## 后果

**正向**：网络等待不会阻塞 UI；状态码、错误和 JSON 都按实际 endpoint 合同处理；小响应
避免无意义 isolate 开销，大响应又保留基于 profile 的短时卸载路径；refresh rotation 与
账号/服务器切换的竞态变成可测试的确定性状态机。

**负向 / 成本**：需要 origin value object、共享 response decoder、generation guard 和
确定性并发测试；性能优化必须先有 profile 证据，不能只靠经验提前加入。

**风险与缓解**：CI 性能数据可能受机器波动影响，因此 16 ms 是目标设备 profile 的决策
阈值，不作为共享 CI 的硬失败线；未来响应体变大时，通过分页 fixture 和 profile 重新
评估；若 Retrofit 限制共享解码或取消语义，则按 ADR-0003 回退手写 Dio wire client。

## 被拒绝方案

- **改用 `http` package**：会推翻已选 Dio/Retrofit transport，且不能解决双错误、刷新
  rotation 或 typed public model，拒绝。
- **所有 JSON 都使用 isolate**：小响应的启动和复制成本更高，拒绝。
- **使用 Flutter `compute()`**：会让纯 Dart package 依赖 Flutter，拒绝。
- **v0.1 建常驻 worker isolate**：当前没有持续 CPU 流或大数据流证据，生命周期和背压
  成本不成立，拒绝。
- **把 refresh 放进 worker isolate**：session store 和 interceptor 状态不能共享，会让
  rotation 与 logout 竞态更难保证，拒绝。
