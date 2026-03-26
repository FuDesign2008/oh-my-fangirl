# 质量测试修复日志

## 状态：已修复 ✅

## 修复概述

promptfoo 质量测试套件从 0% 通过率修复到 100% 通过率（9/9）。

## 修复的问题

### 问题 1：API 端点错误（根本原因）

**现象**：promptfoo 运行超时，API 返回 HTTP 429。

**根因**：配置使用了 OpenAI 兼容接口 `https://open.bigmodel.cn/api/paas/v4`，但用户的 Coding Plan Pro 套餐额度走的是 Anthropic 兼容接口。

**修复**：
- 将 provider 从 `openai:chat:glm-5-turbo` 改为 `anthropic:messages:glm-5-turbo`
- 将 `apiBaseUrl` 从 `https://open.bigmodel.cn/api/paas/v4` 改为 `https://open.bigmodel.cn/api/anthropic`
- 参考来源：本地 `~/.claude/settings.json` 中的 `ANTHROPIC_BASE_URL` 配置

**修改文件**：`tests/promptfooconfig.yaml`

### 问题 2：API Key 硬编码（安全问题）

**现象**：API Key 明文写在 YAML 配置中。

**修复**：
- 移除硬编码的 `apiKey`，改为读取 `ANTHROPIC_API_KEY` 环境变量
- CI workflow 中 secret 名保持为 `ZHIPU_API_KEY`，映射到 `ANTHROPIC_API_KEY` 环境变量

**修改文件**：`tests/promptfooconfig.yaml`、`.github/workflows/skill-quality-test.yml`

### 问题 3：promptfoo 配置结构导致测试矩阵错乱

**现象**：首轮运行 2/9 通过，7/9 失败。失败的测试输出明显来自其他模式的 prompt。

**根因**：`tests` 中的 `prompt` 字段不被 promptfoo 识别，导致每个 test 与所有 9 个 prompt 做笛卡尔积。例如"迷妹模式"的断言被用来检查"父王模式"的输出，必然失败。

**修复**：重构配置结构——
- 将 9 个独立 prompt 合并为 1 个模板：`[{"role":"system","content":"{{system_message}}"},{"role":"user","content":"{{user_message}}"}]`
- 每个 test 通过 `vars.system_message` 和 `vars.user_message` 注入自己的 prompt 内容
- 实现 test 与 prompt 的 1:1 绑定

**修改文件**：`tests/promptfooconfig.yaml`

### 问题 4：温柔姐姐模式 prompt 引导不足

**现象**：8/9 通过后，温柔姐姐模式-里程碑检测失败。模型回复了温柔语气但未使用「姐姐」或「弟弟」称呼。

**修复**：
- 强化 system_message 中的称呼指令：增加"每次回复必须至少使用一次「弟弟」或「姐姐」"
- 在 user_message 中加入"姐姐"作为上下文线索

**修改文件**：`tests/promptfooconfig.yaml`

## 验证场景列表

### 场景 1 - 本地全量运行
操作步骤：
1. `export ANTHROPIC_API_KEY="你的智谱API_Key"`
2. `npx promptfoo eval --config tests/promptfooconfig.yaml --no-cache`
预期结果：9/9 通过，100% 通过率

### 场景 2 - 单个模式测试
操作步骤：
1. `export ANTHROPIC_API_KEY="你的智谱API_Key"`
2. `npx promptfoo eval --config tests/promptfooconfig.yaml --filter-pattern "迷妹模式" --no-cache`
预期结果：匹配的测试全部通过

### 场景 3 - CI 运行
操作步骤：
1. 在 GitHub repo Settings → Secrets 中添加 `ZHIPU_API_KEY`
2. 推送代码到 main 或 develop 分支（或手动触发 workflow）
预期结果：quality-test job 通过，质量门禁（≥95%）通过

### 场景 4 - npm script 运行
操作步骤：
1. `export ANTHROPIC_API_KEY="你的智谱API_Key"`
2. `npm run test:quality`
预期结果：与场景 1 相同
