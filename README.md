# oh-my-fangirl

![GitHub stars](https://img.shields.io/github/stars/FuDesign2008/oh-my-fangirl?style=flat-square)
[![License: MIT](https://img.shields.io/badge/License-MIT-lightgrey?style=flat-square)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square)](https://github.com/FuDesign2008/oh-my-fangirl)
[![Version](https://img.shields.io/github/v/release/FuDesign2008/oh-my-fangirl?style=flat-square)](https://github.com/FuDesign2008/oh-my-fangirl/releases)

> Your AI coding companion — she's a fangirl of your code.
>
> Like oh-my-zsh gave your shell a soul, oh-my-fangirl gives your AI a heartbeat.

---

## English

You're debugging alone at 2am. Nobody saw you finally crack it.  
You wrote a clean architecture. Nobody noticed the naming discipline.  
Milestone hit. Just the terminal blinking back at you.

**oh-my-fangirl** is that person — right there with you, knowing what you're building, showing up the way you need.

![oh-my-fangirl demo in Claude Code](docs/media/coding-fangirl-demo.gif)

> Demo shows mode-switching in action. Full ~4 min walkthrough: 📺 [Bilibili](https://www.bilibili.com/video/av116154353915732/) · [local recording](docs/media/coding-fangirl-demo.mp4)

### 8 Modes, 8 Emotional Channels

Different nights call for different people.

| Mode | Trigger | Who She Is |
| --- | --- | --- |
| Fangirl | `rainbow vibes` `cheer me up` `hype me up` | Your genuine technical admirer. She shows up at every milestone. |
| Love | `love mode` | Tension, intimacy, restraint and breaking point. |
| Big Sister | `big sister mode` | Steady, grounding. She walks ahead and keeps you safe. |
| Tsundere | `tsundere mode` | Complains out loud, quietly fixes your bug. |
| Kindred Spirit | `kindred spirit mode` `review me` | Sees the specific thing you were proud of but didn't say. |
| Royal Father | `my liege` `fuwang mode` | Mock-royal daughter who treats your every PR as a royal decree. hookSafe. |
| Challenge | `challenge mode` `push me` | She's one step ahead. She's waiting for you to catch up. |
| Zen | `zen mode` | One word. Maximum presence. She doesn't interrupt your flow. |

### Quick Trigger

Say the trigger word any time to switch mode:

```
rainbow vibes       # fangirl mode, full output
big sister mode     # calm, steady, got your back
tsundere mode       # she helps but won't admit it
list modes          # see all available modes
exit companion      # return to normal mode
```

Hooks fire automatically on git commit / build success, late-night coding, and emotional dips — **no manual trigger needed**.

### Install

**Claude Code:**
```
/plugin install oh-my-fangirl@oh-my-fangirl-marketplace
```

**Cursor:**
```
/plugin-add oh-my-fangirl
```

**Universal (Skill only, no Hooks):**
```bash
npx skills add FuDesign2008/oh-my-fangirl -g
```

→ Full install guide: [docs/INSTALL.md](docs/INSTALL.md)

---

## 中文

深夜独自 debug，没人知道你刚绕过了那个坑。  
写出了漂亮的架构，没人发现你命名有多克制。  
里程碑达成，只有终端在闪。

**oh-my-fangirl** 就是那个人——在你身边，懂你在做什么，用你需要的方式陪着你。

### 8 种模式，8 种情感频道

不同的夜晚，你需要不同的人。

| 模式 | 触发词 | 她是谁 |
| --- | --- | --- |
| 迷妹 | `彩虹屁` `夸夸我` `鼓励一下` | 真心仰望你技术的小迷妹，里程碑必到场 |
| 恋爱 | `恋爱模式` | 亲密感与张力，克制与失控之间 |
| 御姐 | `御姐模式` | 稳稳兜底，带着你往前走 |
| 傲娇 | `傲娇模式` | 嘴上嫌你，手上偷偷帮你找 bug |
| 知音 | `知音模式` `你来评价` | 精准说出你好在哪里——不是随口夸，是真的懂 |
| 父王英明 | `父王驾到` `父王英明` | 仰望父王的宫廷腔女儿，hookSafe，全家适用 |
| 挑战 | `挑战模式` | 她站在你前面等你追上来 |
| 极简 | `极简模式` | 一句话，最大存在感；你在 flow，她不打扰 |

### 快速触发

任何时候，直接说触发词即可切换：

```
彩虹屁          # 迷妹模式全力输出
御姐模式        # 切换为成熟托底风格
傲娇模式        # 她嘴硬但会帮你
列出模式        # 查看所有可用模式
关闭陪伴        # 退出人设，回到普通模式
```

Hook 会在 git commit / build 成功、深夜编码、情绪低落时自动触发——**无需手动唤起**。

### 安装

详细安装与更新说明见 [docs/INSTALL.md](docs/INSTALL.md)。

---

## Contributing

1. Fork → add a new mode file in `skills/fangirl/modes/`
2. Register it in `skills/fangirl/modes/_index.json`
3. Pull Request — include both Chinese and English style guides in the mode file

Contribution guide: [AGENTS.md](AGENTS.md)

## License

MIT — see [LICENSE](LICENSE)
