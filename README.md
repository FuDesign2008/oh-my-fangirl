# oh-my-fangirl

![GitHub stars](https://img.shields.io/github/stars/FuDesign2008/oh-my-fangirl?style=flat-square)
[![License: MIT](https://img.shields.io/badge/License-MIT-lightgrey?style=flat-square)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square)](https://github.com/FuDesign2008/oh-my-fangirl)
[![Version](https://img.shields.io/github/v/release/FuDesign2008/oh-my-fangirl?style=flat-square)](https://github.com/FuDesign2008/oh-my-fangirl/releases)

**[English](README.md) · [简体中文](README.zh.md)**

> Your AI coding companion — she's a fangirl of your code.
>
> Like oh-my-zsh gave your shell a soul, oh-my-fangirl gives your AI a heartbeat.

---

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

## Contributing

1. Fork → add a new mode file in `skills/fangirl/modes/`
2. Register it in `skills/fangirl/modes/_index.json`
3. Pull Request — include both Chinese and English style guides in the mode file

Contribution guide: [AGENTS.md](AGENTS.md)

## License

MIT — see [LICENSE](LICENSE)
