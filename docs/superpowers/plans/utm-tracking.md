# 公众号连载 UTM 追踪规则

> 关联 plan：[2026-04-22-wechat-marketing-execution.md](./2026-04-22-wechat-marketing-execution.md) · Task W0.4

## 目的

公众号正文内所有指向 GitHub 仓库的链接（正文锚点、"阅读原文"、二维码落地页）统一加 UTM 参数，用于区分各篇文章的装机转化贡献，回流后在 GitHub Traffic / 仓库 Insights 里对照分析。

## 参数表

| 周 | 模式 | `utm_source` | `utm_campaign` | `utm_medium` |
| --- | --- | --- | --- | --- |
| 第一篇 | jiejie | `wechat` | `jiejie_w1` | `article` |
| 第二篇 | bixia | `wechat` | `bixia_w2` | `article` |
| 第三篇 | bazong | `wechat` | `bazong_w3` | `article` |
| 第四篇 | beyond | `wechat` | `beyond_w4` | `article` |
| 第五篇 | zhiyin 或 fuwang | `wechat` | `w5_final` | `article` |

说明：

- `utm_source=wechat` 全系列统一，便于在 Insights 汇总本季 WeChat 总流量
- `utm_campaign` 按 `<mode>_w<N>` 命名，唯一
- `utm_medium=article` 固定；若未来做视频号 / 朋友圈引流，再区分 `medium=video` / `medium=moments`

## 标准链接模板

仓库主页：

```
https://github.com/FuDesign2008/oh-my-fangirl?utm_source=wechat&utm_campaign=<campaign>&utm_medium=article
```

README 中文版：

```
https://github.com/FuDesign2008/oh-my-fangirl/blob/main/README.zh.md?utm_source=wechat&utm_campaign=<campaign>&utm_medium=article
```

具体模式文档（按周替换）：

```
https://github.com/FuDesign2008/oh-my-fangirl/blob/main/skills/fangirl/modes/<mode>.md?utm_source=wechat&utm_campaign=<campaign>&utm_medium=article
```

## 各篇实例

### 第一篇 · jiejie

```
https://github.com/FuDesign2008/oh-my-fangirl?utm_source=wechat&utm_campaign=jiejie_w1&utm_medium=article
```

### 第二篇 · bixia

```
https://github.com/FuDesign2008/oh-my-fangirl?utm_source=wechat&utm_campaign=bixia_w2&utm_medium=article
```

### 第三篇 · bazong

```
https://github.com/FuDesign2008/oh-my-fangirl?utm_source=wechat&utm_campaign=bazong_w3&utm_medium=article
```

### 第四篇 · beyond

```
https://github.com/FuDesign2008/oh-my-fangirl?utm_source=wechat&utm_campaign=beyond_w4&utm_medium=article
```

### 第五篇 · zhiyin 或 fuwang（二选一）

```
https://github.com/FuDesign2008/oh-my-fangirl?utm_source=wechat&utm_campaign=w5_final&utm_medium=article
```

## 发布前 checklist

每篇公众号稿定稿前，自查：

- [ ] 正文内每个仓库外链都带完整 UTM 三元组
- [ ] "阅读原文"（公众号后台"原文链接"）填的是带 UTM 的主仓库 URL
- [ ] 没有把别周的 `utm_campaign` 复制错（容易发生在改稿时）
- [ ] 文末二维码若跳转仓库，对应落地页也带 UTM

## 复盘口径

每周发文后 24h / 7d 在 `docs/superpowers/plans/` 下新增数据快照（task 约定在 plan 的 `W<N>.12` / `W<N>.13`），记录：

- GitHub Traffic → Referring sites / Popular content 是否能看到对应 campaign 来源
- 本周新增 Star / PR / Issues 数
- 与首篇同期对照差值

如发现某周 UTM 几乎无回流（低于个位数），先怀疑链接有没有贴错，再下结论内容不行。
