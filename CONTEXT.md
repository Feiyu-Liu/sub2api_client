# Sub2API Client Context

本上下文定义 package 对 Sub2API 远程协议的稳定称谓，用于区分调用主体、权限边界和完成
口径。

## Language

**管理业务面（Management API Surface）**：
由用户管理面与 Admin 管理面组成的客户端可调用业务协议；不包含 Gateway 数据面或服务端
ingress。
_Avoid_: 完整接口、全部 API

**用户管理面（User Management Surface）**：
登录用户管理自身账号、安全凭据、访问资源、用量与商业状态的协议集合。
_Avoid_: 前台接口、普通接口

**Admin 管理面（Admin Management Surface）**：
管理员管理部署中的用户、资源、计费、配置、安全与运维状态的特权协议集合。
_Avoid_: 后台页面接口、超级接口

**Ops 凭证模式（Ops Credential Mode）**：
外部自动化使用 Admin API Key 访问服务端允许的 Admin 管理面；它不是管理员 JWT 的权限
升级或替代品。
_Avoid_: 管理员会话、万能 Key

**Gateway 数据面（Gateway Data Plane）**：
调用方使用普通 API Key 发起模型推理、媒体、搜索或 Realtime 请求的转发协议集合。
_Avoid_: 用户管理面、Admin API

**服务端 ingress（Server Ingress）**：
由第三方提供方或部署编排器调用的 callback、webhook、setup、health 与静态资源入口。
_Avoid_: SDK endpoint、客户端业务操作

**活动合同（Active Contract）**：
当前唯一用于生成模型、fixture、route manifest 和测试证据的固定 Sub2API tag 与 commit。
_Avoid_: 上游最新版本、main 分支

**完整覆盖（Complete Coverage）**：
固定 route manifest 中目标范围的每个条目都达到 typed contract、测试和 E2E 完成标准的状态。
_Avoid_: facade 已创建、路由已接线
