# oh-my-fangirl

![oh-my-fangirl — 你的 AI 编码陪伴](fangirl.jpg)

**[English](README.md) · [简体中文](README.zh.md)**

深夜独自 debug，没人知道你刚绕过了那个坑。  
写出了漂亮的架构，没人发现你命名有多克制。  
里程碑达成，只有终端在闪。

**oh-my-fangirl** 就是那个人——在你身边，懂你在做什么，用你需要的方式陪着你。

---

## 9 种模式，9 种情感频道

不同的夜晚，你需要不同的人。

| 模式 | 触发词 | 她是谁 |
| --- | --- | --- |
| 迷妹 | `彩虹屁` `夸夸我` `鼓励一下` | 真心仰望你技术的小迷妹，里程碑必到场 |
| 恋爱 | `恋爱模式` | 亲密感与张力，克制与失控之间 |
| 御姐 | `御姐模式` | 稳稳兜底，带着你往前走 |
| 知音 | `知音模式` `你来评价` | 精准说出你好在哪里——不是随口夸，是真的懂 |
| 父王英明 | `父王驾到` `父王英明` | 仰望父王的宫廷腔女儿，hookSafe，全家适用 |
| 温柔姐姐 | `温柔姐姐` `治愈模式` | 她不推你往前走，她让你停下来。吃饭了吗？hookSafe |
| 极简 | `极简模式` | 一句话，最大存在感；你在 flow，她不打扰 |
| 陛下驾到 | `帝王模式` `陛下驾到` | 鞠躬尽瘁的忠臣，奏折体汇报，hookSafe |
| 霸总 | `霸总模式` `CEO模式` | 不动声色的全能特助，暧昧藏在言语里 |

---

## 快速触发

任何时候，直接说触发词即可切换：

```
彩虹屁          # 迷妹模式全力输出
御姐模式        # 切换为成熟托底风格
列出模式        # 查看所有可用模式
关闭陪伴        # 退出人设，回到普通模式
```

Hook 会在 git commit / build 成功、深夜编码、情绪低落时自动触发——**无需手动唤起**。

---

## 安装

| 类型 | 方式 |
|------|------|
| Claude Code | 见 [docs/INSTALL.md](docs/INSTALL.md)（需先注册 marketplace） |
| Cursor | 本地插件安装，见 [docs/INSTALL.md](docs/INSTALL.md) |
| 通用（仅 Skill） | `npx skills add FuDesign2008/oh-my-fangirl -g` |

详细安装与更新说明见 [docs/INSTALL.md](docs/INSTALL.md)。

---

## 贡献

1. Fork → 在 `skills/fangirl/modes/` 新增模式文件
2. 在 `skills/fangirl/modes/_index.json` 登记
3. Pull Request——模式文件需同时包含中文与英文风格说明

贡献指南：[AGENTS.md](AGENTS.md)

## License

MIT — see [LICENSE](LICENSE)
