# 修复与变更记录

本仓库问题追踪与变更说明。按时间倒序追加条目。

---

## 2026-03-22：Claude Code Skill 工具无法唤起 fangirl

**状态**：已修复

**修复方式**：从 `commands/fangirl.md` 移除 `disable-model-invocation: true`。该字段会导致通过 Skill 工具选择 `oh-my-fangirl:fangirl` 时报错：`cannot be used with Skill tool due to disable-model-invocation`。在 `README.md` 与 `docs/INSTALL.md`（中英文）的 Claude Code 安装说明后补充「唤起方式」：`/fangirl`、Skill 工具、自然语言触发词。

**验证场景列表**：

**场景 1 — Skill 工具**

操作步骤：

1. 安装插件并重启 Claude Code。
2. 通过 Skill 工具选择 `oh-my-fangirl:fangirl`，输入「列出模式」。

预期结果：不再出现 `disable-model-invocation` 报错，模型按 skill 列出模式。

**场景 2 — 斜杠命令**

操作步骤：

1. 在会话中输入 `/fangirl`，再输入自然语言需求。

预期结果：正常进入 fangirl skill 流程。
