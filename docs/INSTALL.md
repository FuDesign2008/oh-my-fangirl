# oh-my-fangirl 安装指南

## 两种安装方式

| 类型 | 你会得到什么 |
|------|----------------|
| **通用安装** | 仅 **SKILL.md**（`npx skills`）。不含 Hooks、Commands、OpenCode 插件 |
| **全能力安装** | Hooks（自动感知里程碑与情绪）、Commands（`/fangirl`）、各平台原生集成 |

---

## 全能力安装

### Claude Code

在会话中执行：

```
/plugin install oh-my-fangirl@oh-my-fangirl-marketplace
```

**更新**：

```bash
claude plugin update oh-my-fangirl@oh-my-fangirl-marketplace
```

### Cursor

在会话中执行：

```
/plugin-add oh-my-fangirl
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
| Cursor | `~/.cursor/extensions/oh-my-fangirl` |
| OpenCode | `~/.config/opencode/oh-my-fangirl` |
