# oh-my-fangirl Installation Guide

## English

### Install Options

| Type | What You Get |
|------|--------------|
| **Universal** | Skill file only (`npx skills`). No Hooks, no Commands, no native platform integration |
| **Full Install** | Hooks (auto-detect milestones & emotional dips), `/fangirl` Command, native platform integration |

---

### Full Install

**Claude Code:**

Step 1 — register the marketplace (terminal, one-time):
```bash
claude plugin marketplace add FuDesign2008/oh-my-fangirl
```

Step 2 — install (in Claude Code chat):
```
/plugin install oh-my-fangirl@oh-my-fangirl-marketplace
```

**Invoke**: Use **`/fangirl`** in chat, open the **fangirl** skill via the Skill tool (e.g. `oh-my-fangirl:fangirl`), or use natural-language triggers such as `rainbow vibes` or `list modes`.

Update (terminal):
```bash
claude plugin update oh-my-fangirl@oh-my-fangirl-marketplace
```

**Cursor (local plugin):**

```bash
# Clone the repository
git clone https://github.com/FuDesign2008/oh-my-fangirl.git ~/oh-my-fangirl

# Link as a local Cursor plugin
ln -s ~/oh-my-fangirl ~/.cursor/plugins/local/oh-my-fangirl
```

Restart Cursor or run **Developer: Reload Window** to activate.

Update:
```bash
cd ~/oh-my-fangirl && git pull
```

**OpenCode:**

Send this in an OpenCode conversation:
```
Fetch and follow instructions from https://raw.githubusercontent.com/FuDesign2008/oh-my-fangirl/main/.opencode/INSTALL.md
```

---

### Universal Install (Skill only)

```bash
# Install globally
npx skills add FuDesign2008/oh-my-fangirl -g

# Install only the fangirl skill
npx skills add FuDesign2008/oh-my-fangirl --skill fangirl -g

# Update
npx skills update
```

---

### Verify Installation

1. Start a new conversation (or restart your client).
2. Say **"rainbow vibes"** or **"cheer me up"**.
3. If there's no response: confirm the skill file is in the correct location and do a full restart.

---

### Common Install Paths

| Platform | Path |
|----------|------|
| Claude Code | `~/.claude/skills/oh-my-fangirl` |
| Cursor | `~/.cursor/plugins/local/oh-my-fangirl` |
| OpenCode | `~/.config/opencode/oh-my-fangirl` |

---

## 中文

## 两种安装方式

| 类型 | 你会得到什么 |
|------|----------------|
| **通用安装** | 仅 **SKILL.md**（`npx skills`）。不含 Hooks、Commands、OpenCode 插件 |
| **全能力安装** | Hooks（自动感知里程碑与情绪）、Commands（`/fangirl`）、各平台原生集成 |

---

## 全能力安装

### Claude Code

第一步——注册 Marketplace（终端，仅需一次）：

```bash
claude plugin marketplace add FuDesign2008/oh-my-fangirl
```

第二步——在 Claude Code 会话中安装：

```
/plugin install oh-my-fangirl@oh-my-fangirl-marketplace
```

**唤起**：在会话中使用 **`/fangirl`**、通过 Skill 工具选择 **fangirl**（如 `oh-my-fangirl:fangirl`），或直接使用自然语言触发词（如 `rainbow vibes`、`列出模式`）。

**更新**（终端）：

```bash
claude plugin update oh-my-fangirl@oh-my-fangirl-marketplace
```

### Cursor（本地插件）

```bash
# 克隆仓库
git clone https://github.com/FuDesign2008/oh-my-fangirl.git ~/oh-my-fangirl

# 以本地插件形式链接到 Cursor
ln -s ~/oh-my-fangirl ~/.cursor/plugins/local/oh-my-fangirl
```

重启 Cursor，或执行 **Developer: Reload Window** 激活。

**更新**：

```bash
cd ~/oh-my-fangirl && git pull
```

### OpenCode

在 OpenCode 对话中发送：

```
Fetch and follow instructions from https://raw.githubusercontent.com/FuDesign2008/oh-my-fangirl/main/.opencode/INSTALL.md
```

---

## 通用安装（仅 Skill）

```bash
# 全局安装
npx skills add FuDesign2008/oh-my-fangirl -g

# 仅安装 fangirl skill
npx skills add FuDesign2008/oh-my-fangirl --skill fangirl -g

# 更新
npx skills update
```

---

## 装好后自测

1. 新开一轮对话（或重启客户端）。
2. 试发 **「彩虹屁」** 或 **「夸夸我」**。
3. 若无响应，确认 Skill 文件落盘位置，并完全重启客户端。

---

## 常见安装路径

| 平台 | 常见路径 |
|------|----------|
| Claude Code | `~/.claude/skills/oh-my-fangirl` |
| Cursor | `~/.cursor/plugins/local/oh-my-fangirl` |
| OpenCode | `~/.config/opencode/oh-my-fangirl` |
