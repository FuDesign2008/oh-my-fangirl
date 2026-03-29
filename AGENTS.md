# oh-my-fangirl 项目知识库

本文件为 Claude Code 等 AI 在本仓库工作时的项目知识库。

## 概述

AI 编码陪伴小迷妹。Markdown + JSON + Shell + JS/TS 构成的多平台插件项目。支持 Claude Code、Cursor、OpenCode 三个平台。

## 结构

```
oh-my-fangirl/
├── skills/
│   └── fangirl/          # 核心 Skill
│       ├── SKILL.md      # 必需文件，含 frontmatter 元数据
│       ├── context.json  # Hook 使用的精简上下文
│       └── modes/        # _index.json + 各模式 *.md
├── commands/
│   └── fangirl.md        # 快捷命令
├── hooks/                # Shell 脚本 + hooks.json
│   ├── hooks.json
│   ├── session-start
│   ├── milestone-celebrate
│   └── emotion-comfort
├── .claude-plugin/       # Claude Code 平台配置
├── .cursor-plugin/       # Cursor 平台配置
├── .opencode/            # OpenCode 平台
│   ├── plugins/oh-my-fangirl.js   # 系统提示注入
│   └── plugin/fangirl-hooks.ts    # 里程碑 Hook
└── .github/workflows/release.yml  # CI 自动版本递增
```

## 钩子机制

| 钩子 | 触发时机 | Shell 脚本 | 作用 |
|------|---------|-----------|------|
| SessionStart | 会话启动/恢复 | `hooks/session-start` | 欢迎语 + 加载 fangirl 上下文 |
| PostToolUse | Bash 工具调用后 | `hooks/milestone-celebrate` | 检测 git commit/push/test/build 并庆祝 |
| UserPromptSubmit | 用户发送消息 | `hooks/emotion-comfort` | 检测负面情绪并安慰 |

## Skill — fangirl

- **目录**：`skills/fangirl/`
- **模式数**：10 种（core × 9 + extended × 1）
- **模式索引**：`skills/fangirl/modes/_index.json`
- **新增模式**：在 `modes/` 新增 `.md` 并在 `_index.json` 登记

### 模式准入标准（必须满足）

> **一个模式，必须能在第一次交互、零关系基础的情况下，就让用户感觉更好。**

用户安装插件是为了让自己更舒服，而不是更不舒服。因此：

- ✅ **合格**：价值即时兑现——第一句话就在给用户（被欣赏、被看见、被渴望、被仰望）
- ❌ **不合格**：价值需要用户先承受不适才能兑现——如先被批评再被帮助（傲娇）、先被拒绝答案再自己挣扎（挑战）

**反模式（禁止新增此类模式）**：
- 依赖长期关系积累才能兑现价值的模式（傲娇的可爱感需要信任基础，AI 无法建立）
- 依赖真实双向投入的模式（竞争的爽感来自真实性，AI 给不了）
- 任何「先扣你一下再补回来」结构的模式

## Git 工作流

- **禁止直接推送 main**：必须先创建 feature 分支
- **版本号禁止手动修改**：CI 自动递增
- Commit 前缀：`feat:` 新功能、`fix:` 修复、`docs:` 文档、`chore:` 杂项

## 版本管理

本项目存在多个独立的版本号，各自用途不同：

| 文件 | 当前版本 | 含义 | 管理方式 |
|------|---------|------|---------|
| `.claude-plugin/plugin.json`、`.claude-plugin/marketplace.json`、`.cursor-plugin/plugin.json` | 1.6.x | 插件发布版本 | CI 自动递增，禁止手动修改 |
| `skills/fangirl/SKILL.md` frontmatter | 6.x.x | Skill 内容版本 | 手动管理，Skill 内容变更时递增 |
| `skills/fangirl/modes/_index.json` | 4 | 模式索引格式版本 | 手动管理，索引结构变更时递增 |
| `package.json` | 1.0.0 | 测试套件版本 | 不随插件递增，仅测试框架自身变更时更新 |

CI（`.github/workflows/release.yml`）自动递增插件版本：
- `feat:` → MINOR
- `fix:` → PATCH
- `BREAKING CHANGE` → MAJOR

## 验证命令

```bash
# JSON 格式校验
node -e "JSON.parse(require('fs').readFileSync('.claude-plugin/plugin.json'))"
node -e "JSON.parse(require('fs').readFileSync('hooks/hooks.json'))"

# SKILL.md frontmatter
grep -r "^---$" skills/*/SKILL.md

# OpenCode 插件语法
node --check .opencode/plugins/oh-my-fangirl.js
```

## 反模式（禁止）

- ❌ 手动修改版本号
- ❌ 直接推送 main 分支
- ❌ SKILL.md 缺少 frontmatter 或遗漏触发词
- ❌ Hook 脚本阻塞主流程（必须静默失败）
- ❌ OpenCode 插件用 CommonJS（必须 ES Module）
- ❌ 中文内容混用英文标点
