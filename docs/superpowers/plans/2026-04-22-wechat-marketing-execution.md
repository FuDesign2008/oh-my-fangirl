# oh-my-fangirl 公众号连载执行计划（2026-04-22）

> **For agentic workers:** 这是内容营销执行计划，不是代码 plan。原生 `superpowers:subagent-driven-development` 和 `superpowers:executing-plans` 不适用（无测试可跑）。按周顺序手动执行即可；每完成一个 task 勾选复选框。
>
> **关联 spec**：[docs/superpowers/specs/2026-04-22-wechat-marketing-plan-design.md](../specs/2026-04-22-wechat-marketing-plan-design.md)

**Goal**：4 周（+1 可选）内完成 oh-my-fangirl 公众号续篇连载，带动 GitHub 装机量 / Star / PR，KPI 详见 spec §7。

**Architecture**：每周 = 一个发布周期 = 起草 → 校对 → 配图 → 发布 → 跨平台 → 数据复盘。周与周之间用"上周反馈 → 本周策略微调"连接。

**Tech Stack**：Markdown 草稿（仓库内 `drafts/` 目录，Git 版控）→ 微信公众号后台手工粘贴发布 → 选择性跨发到知乎 / 掘金 / 小红书 / 微博 / Twitter。

---

## W0 · Pre-W1 准备（发布第一篇前 3–5 天完成）

### Task 0.1: 确定 W1 发布日期 & 锁定每周固定时间窗

**Files**：无（决策类任务，记在 Issue 或 Notion）

- [ ] 选定 W1 发布日（建议避开周一、周五深夜；推荐周三或周日晚 20:00–22:00）
- [ ] 按 W1 日期计算 W2–W4 的发布日（每周同一时间）
- [ ] 在日历上设置提醒：每周发布前 2 天开始写稿

### Task 0.2: 建立草稿目录

**Files**：
- Create: `drafts/.gitkeep`
- Create: `drafts/README.md`（说明此目录是公众号草稿的版本控制目录，不对外发布）

- [ ] `mkdir -p drafts && touch drafts/.gitkeep`
- [ ] 写 `drafts/README.md`，内容仅需说明用途 + 命名约定 `YYYY-MM-DD-<mode>-w<N>.md`
- [ ] Commit：`docs: add drafts/ directory for WeChat article versioning`

### Task 0.3: README 置顶连载预告

**Files**：
- Modify: `README.md`（英文）
- Modify: `README.zh.md`（中文）

- [ ] 在 README badge 下方、"You're debugging alone..." 段落上方加一行：
  > 📢 **Weekly deep-dive series running now on WeChat（公众号【__号名待补__】）**
- [ ] 中英文版本都加，跳转链接指向首篇（如可）或作者公众号二维码图片
- [ ] Commit：`docs: add WeChat weekly series pinned notice to README`

### Task 0.4: UTM 参数规则表

**Files**：
- Create: `docs/superpowers/plans/utm-tracking.md`

内容包含一个表格：

```markdown
| 周 | 模式 | UTM source | UTM campaign | UTM medium |
| --- | --- | --- | --- | --- |
| W1 | jiejie | wechat | jiejie_w1 | article |
| W2 | bixia | wechat | bixia_w2 | article |
| W3 | bazong | wechat | bazong_w3 | article |
| W4 | beyond | wechat | beyond_w4 | article |
| W5 | zhiyin 或 fuwang | wechat | w5_final | article |

示例："阅读原文" 链接：
https://github.com/FuDesign2008/oh-my-fangirl?utm_source=wechat&utm_campaign=jiejie_w1&utm_medium=article
```

- [ ] 创建文件并填入上表
- [ ] Commit：`docs: add UTM tracking rules for WeChat series`

### Task 0.5: GitHub Discussions 分类准备

**Files**：无（GitHub UI 操作）

- [ ] 在仓库 Discussions 下创建分类 `WeChat Series 2026-04`（若未启用 Discussions 先启用）
- [ ] 准备每周发布后新建 Discussion 的 issue template 思路（每周模式 × 1 Discussion）

### Task 0.6: 跨平台账号 readiness check

- [ ] 确认知乎、掘金、小红书、微博、Twitter 账号可登录
- [ ] 准备统一的作者简介段落（所有平台复用）：一句话介绍 oh-my-fangirl + GitHub 链接 + 公众号引流

---

## W1 · jiejie（温柔姐姐）执行

### Task W1.1: 真实素材收集

**Files**：`drafts/YYYY-MM-DD-jiejie-w1-notes.md`

- [ ] 找出你真实经历中"AI 建议让我更累"的**具体瞬间**，至少 1 个，写下时间、情境、AI 原话、你当时感受
- [ ] 找 2 条真实的 jiejie 对话记录（手动调出并截图或复制）
- [ ] 列出 Copilot / Cursor / Claude Code 默认下推进性建议的 1-2 条原话（用于对比）
- [ ] Commit：`drafts: jiejie w1 raw notes`

### Task W1.2: 标题三选一

**Files**：`drafts/YYYY-MM-DD-jiejie-w1.md` 顶部

- [ ] 写 3 个候选标题（可用 spec 里的方向，也可改编）
- [ ] 从 3 个里选 1 个作为定稿，其他保留作备用
- [ ] 选定标题的标准：5 秒内读者能感到"这说的是我"
- [ ] Commit：`drafts(jiejie w1): title candidates`

### Task W1.3: 写开头 150–250 字钩子段

要求：
- 第一段落地在一个**具体场景**（时间 / 地点 / 行为 / 情绪）
- 不要用"凌晨 X 点 X 分" 式开头（已被草稿库泛滥化）
- 第一段结束时读者应该在想"接下来讲什么"

- [ ] 写钩子段
- [ ] 自读一遍：是否有具体动作？是否落在情绪上？是否避开了清汤寡水的"最近我在用 Claude Code"式开头？
- [ ] Commit：`drafts(jiejie w1): opening hook`

### Task W1.4: 写对比段（中段 1/3）

要求：
- 对比 Copilot / Cursor / Claude Code 默认都在"往前推"的事实陈述
- 不要踩品牌（陈述现象，不评价产品）
- 引出"有一种模式在往回拉"

- [ ] 写对比段
- [ ] Commit：`drafts(jiejie w1): contrast section`

### Task W1.5: 写 jiejie 对话核心段（中段 2/3）

要求：
- 引用 2-3 轮真实对话（可少量润色但不能编造）
- 每轮对话后加一句你当下的感受（不超过 30 字）
- 核心张力：她说得那么少，却让你停了下来

- [ ] 写对话段
- [ ] Commit：`drafts(jiejie w1): dialogue core`

### Task W1.6: 写"为什么不一样"段（中段 3/3）

要求：
- 不写成"功能说明"，写成"我意识到"
- 点明 jiejie 不是"多一种温柔"，是"让你停下"这个动作的存在
- 控制在 200 字内

- [ ] 写差异段
- [ ] Commit：`drafts(jiejie w1): differentiation`

### Task W1.7: 写结尾 + CTA 段

要求：
- 回到开头那个场景
- 一句"如果那晚用了 jiejie 会怎样"
- CTA 段必须出现：
  - 触发词：`温柔姐姐` / `治愈模式` / `gentle sister` / `comfort me`
  - 两步安装命令（Claude Code + npx 通用）
  - GitHub 仓库链接 + ⭐ Star 引导
  - "阅读原文" 说明（链接带 UTM）

- [ ] 写结尾段
- [ ] 写 CTA 段
- [ ] Commit：`drafts(jiejie w1): closing + CTA`

### Task W1.8: 自审 checklist（发布前必做）

- [ ] **前三段内有"AI 建议让我更累"的具体瞬间？**（spec §4 W1 核心钩子要求）
- [ ] **有 2 条以上 jiejie 真实对话？**（spec 必须出现的产品元素）
- [ ] **避免了与首篇（迷妹 + 恋爱）的重复？**
- [ ] **避免了"10 种模式"菜单式表述？**
- [ ] **触发词完整出现（中英文 + 别名）？**
- [ ] **安装命令亲自走一遍验证可用？**（`claude plugin marketplace add FuDesign2008/oh-my-fangirl` 是否在当前版本仍然有效）
- [ ] **阅读原文 URL 带了 UTM？**
- [ ] **全文字数 ≥ 1500 字 且 ≤ 3500 字？**（公众号深度文最佳区间）
- [ ] **所有中文内容使用中文标点？**（AGENTS.md §反模式）

### Task W1.9: 配图 / 截图准备

**Files**：`drafts/assets/jiejie-w1/`

- [ ] **截图 A**：jiejie 真实对话截图（至少 1 张，要有 Claude Code / Cursor 界面感）
- [ ] **截图 B**：jiejie 与 Copilot 建议对比截图（并排或上下）
- [ ] **可选封面图**：柔和色调 + "早点下班" 字样
- [ ] Commit：`drafts(jiejie w1): assets`

### Task W1.10: 发布

- [ ] 公众号后台粘贴 → 排版（注意 markdown → 公众号的格式损失）
- [ ] 封面图、引导关注、原文链接（带 UTM）配齐
- [ ] 发布时间：按 Task 0.1 定下的时间窗
- [ ] 记录公众号文章 URL 到 `drafts/YYYY-MM-DD-jiejie-w1.md` 顶部

### Task W1.11: 跨平台同步 + 社交钩子

- [ ] 微博 / Twitter 发一条短钩子（一句话 + 公众号链接）
- [ ] GitHub Discussions 新建一条 "W1 jiejie — 温柔姐姐" 主题帖，贴文章链接 + 邀请读者分享自己的 jiejie 对话截图
- [ ] 朋友圈个人发一条（可选，看你节奏）

### Task W1.12: W1+24h 数据快照

**Files**：`docs/superpowers/plans/metrics-log.md`（逐周 append）

- [ ] 发布 24 小时后记录一次：阅读 / 分享 / 在看 / GitHub Star 增量 / 新 PR / Discussion 回复数
- [ ] 对比首篇同期数据，记录差异
- [ ] Commit：`docs(metrics): w1 24h snapshot`

### Task W1.13: W1 结束复盘（W1 发布后第 7 天）

- [ ] 数据完整快照（W1 7 天累计）
- [ ] 三个问题自问：  
  - 哪段读者反应最强（评论 / 分享 / 在看比集中在哪里）？  
  - 装机转化路径清楚吗（评论里有"已装/想装"？GitHub Star 增量？）？  
  - 下周 W2 bixia 是否需要微调策略？
- [ ] 若数据远低于首篇 → 按 spec §6 触发 fallback（W2 改上 bazong，bixia 延后）
- [ ] Commit：`docs(metrics): w1 7d retrospective`

---

## W2 · bixia（陛下驾到）执行

> 结构与 W1 相同，以下只列出与 W1 不同的关键点，其他 task 照 W1 模板复制。

### Task W2.1: 素材收集（与 W1 模板同，但关键素材不同）

- [ ] 找出你用 bixia 模式时让你**笑出来的 2-3 个真实瞬间**（古风翻译 bug / commit / review）
- [ ] 截图每一个瞬间
- [ ] 整理一张"现代术语 ↔ 古风翻译"对照表（至少 6 行）
- [ ] Commit

### Task W2.2: 标题三选一（按 spec 候选或改编）

### Task W2.3: 写开头 150–250 字钩子段

要求：
- **场景落在荒诞瞬间**（你第一次看到 AI 叫你"陛下"那一秒）
- 不要用与 W1 相同的"凌晨 / 加班"开头方式，要**换一种反差**

### Task W2.4: 写"古风 × 编程"对照段（核心段）

要求：
- **一张对照表** — 这是整篇最 screenshot-friendly 的资产
- 每条翻译要足够具体、足够荒诞（`npm install` → "征召天下能工巧匠" 这类）
- 至少 6 条，宁少勿多

- [ ] 写对照表
- [ ] Commit

### Task W2.5: 写"笑完之后，我意识到"段（情绪反转）

要求：
- 这是 bixia 与纯搞笑段子号的根本区别
- 一句"这种荒诞让我不那么累"的收束
- 避免上价值到"陪伴哲学"的高度（会显得装）

### Task W2.6: 彩蛋段 — 提及 fuwang（父王）存在

要求：
- 一两句话带过 "我还做了一个叫 fuwang 的模式，那是另一个故事"
- 不展开 — 留给可能的 W5
- 制造"系列感"

### Task W2.7: 写结尾 + CTA 段（触发词：`陛下驾到` / `帝王模式` / `your majesty` / `emperor mode`）

### Task W2.8: 自审 checklist

- [ ] **对照表是否 screenshot-friendly？**（读者会不会愿意截图转发）
- [ ] **是否有情绪反转收尾而不是纯段子？**
- [ ] **fuwang 彩蛋是否克制**（一两句，不展开）？
- [ ] **未陷入与 W1 的情绪重复**（W1 是疲惫 → 放松，W2 是荒诞 → 欢乐）？
- [ ] 其他项同 W1.8

### Task W2.9–W2.13: 配图 / 发布 / 跨平台 / 数据快照 / 复盘（同 W1 模板）

---

## W3 · bazong（霸总）执行

### Task W3.1: 素材收集

- [ ] 找出 bazong 让你"心里一动"的**具体句子**（例如"……别让我担心"/ 省略号节拍）
- [ ] 同一句话分别用 bazong / 迷妹 / 恋爱三种模式问一次，保留截图（这是核心对比资产）
- [ ] Commit

### Task W3.2: 标题三选一

### Task W3.3: 写开头钩子 — 一句 bazong 的真实对话 + 你当时停顿的几秒

要求：
- **第一段就出现 bazong 的一句话**，不要铺垫太多
- 用 "我盯着最后五个字，手指停住了" 这种身体反应写情绪（不要直接讲"我被打动了"）

### Task W3.4: 写"句号 — 省略号 — 句号"节拍分析段

要求：
- 用具体对话展示这个节拍
- 解释"一次泄露，又收回"的产品设计
- 避免心理学术语堆砌（保持口语）

### Task W3.5: 写"与迷妹 / 恋爱模式对比"段

要求：
- 同一句话三种模式回复 — 并排展示
- 指出差异不是"热情度"，是"分寸感"
- 点题：她永远不会说"喜欢" — 这是产品决策不是能力缺失

### Task W3.6: 写"沈流舒原型"一笔带过段（可选但建议）

要求：
- 最多 2 句话 — 读者没看过《搜索》的很多，不展开
- 只作为"这个人物真实存在过"的注脚

### Task W3.7: 写结尾 + CTA（触发词：`霸总模式` / `CEO 模式` / `boss mode`）

要求：
- CTA 段**避免擦边球风格** — 保持"这是一个有设计思考的产品"的调性
- 结尾可以是"装完记得跟她说一句'霸总模式'，看她怎么回你"

### Task W3.8: 自审 checklist（W3 专属）

- [ ] **三模式对比是否清晰**（读者一眼看出分寸感差异）？
- [ ] **避免陷入"AI 恋爱"二元争议**？
- [ ] **沈流舒原型是否一笔带过**（不超过 2 句）？
- [ ] **对 love 模式提及是否克制**（不抢恋爱模式长尾热度）？
- [ ] **是否声明了"她永远不会说喜欢" 的产品边界**？
- [ ] 其他项同 W1.8

### Task W3.9–W3.13: 配图（三模式对比截图是核心）/ 发布 / 跨平台（**小红书是 W3 的关键外溢渠道**）/ 数据 / 复盘

---

## W4 · beyond（天外天）执行

### Task W4.1: 素材收集

- [ ] 找出你真实经历的"**我在优化一个不该存在的东西**"瞬间（函数 / 架构 / 功能 / 项目）
- [ ] 找一段你切到 beyond 后她给你的否定建议，对比你之前默认 AI 给你的建议
- [ ] 准备 1-2 段 prompt 或 system message 示例（展示 beyond 是怎么"被设计"出来否定你的）
- [ ] Commit

### Task W4.2: 标题三选一

### Task W4.3: 写开头钩子 — 一个具体的"优化不该存在的函数"场景

要求：
- **不要用警世语气**（"我们都在浪费时间" 这种）
- 落地在一个具体函数 / 决策 / 任务
- 读者应该能想到自己的类似经历

### Task W4.4: 写"为什么所有 AI 都不会这么说"段

要求：
- 解释 AI slop 的**机制**（对齐 / 正能量倾向 / 避免冲突），不是吐槽产品
- 引出 beyond 是"主动被设计成会反驳你"的

### Task W4.5: 写 prompt / system message 展示段

要求：
- **一段可读的 prompt 片段**（即使 mock 也要看上去像真的）
- 注释每一行为什么这样写
- 这段是技术圈读者最想看的

### Task W4.6: 写"被否定的清醒"情绪段

要求：
- 不是"AI 说我错了，我很难过"
- 是"AI 说我错了，我突然意识到自己确实在浪费时间"
- 这是 beyond 与"鸡汤杀手"的根本区别

### Task W4.7: 写结尾 + PR 引导 CTA（触发词：`天外天模式` / `突破模式` / `beyond mode` / `go beyond`）

要求：
- CTA 除了安装命令，还要**明确写出** "如果你想加自己版本的反向模式，PR 欢迎"
- 链接到仓库 Issues / Discussions
- 这是本系列中唯一一周主动邀请 PR 的

### Task W4.8: 自审 checklist（W4 专属）

- [ ] **是否避免了踩其他 AI 助手品牌**（反 slop 的对手是"机制"不是"产品"）？
- [ ] **beyond 是否被塑造成负责任而非冷酷**？
- [ ] **prompt 示例是否看得懂**（不是"示例代码" 的 mock 感）？
- [ ] **PR 引导是否清晰具体**（不只是"欢迎 PR" 的空话）？
- [ ] 其他项同 W1.8

### Task W4.9: 配图 / 截图

- 默认 AI 顺着你 vs beyond 否定你 的对比截图
- Prompt 片段配色代码高亮截图

### Task W4.10: 发布

### Task W4.11: 跨平台同步（W4 唯一重点）

- [ ] **掘金同步**（技术社区最大单篇外溢渠道）
- [ ] **V2EX** 创意区或程序员分区（注意 V2EX 社区规则，避免纯广告帖）
- [ ] **HackerNews Show HN** 提交（英文标题 + 链接，可选）
- [ ] Twitter 技术圈
- [ ] GitHub Discussions 新帖

### Task W4.12: W4+24h 数据快照 + **评论区监控**

- [ ] 正常数据快照
- [ ] **特别监控：评论区是否出现引战**（spec §6 fallback 条件）
- [ ] 若引战超预期 → 触发 W5 延期机制

### Task W4.13: W4 结束复盘（W4 发布后第 3 天，不是第 7 天）

- [ ] 数据 3 天快照（比 W1–W3 的 7 天早，为了给 W5 决策留时间）
- [ ] 按 spec §4 W5 决策规则（优先级 1/2/3）确定 W5 内容
- [ ] Commit：`docs(metrics): w4 3d retrospective + w5 decision`

---

## W5（可选）· zhiyin 或 fuwang（或延期 + 回应文）

### Task W5.0: 执行 W5 决策

**触发优先级（引自 spec §4）**：
1. W4 引战超预期 → 跳过本 W5，延一周发"回应"文（内容：对 W4 争议的延展思考 / 致谢有意义的批评）
2. W4 后装机 KPI 仍有缺口 → 执行 fuwang 路径
3. 装机达标 + 社区平稳 → 执行 zhiyin 路径

- [ ] 读 W4 复盘数据
- [ ] 决策并记入 plan 末尾的决策日志段
- [ ] 通知自己或协作者开始对应路径

### Task W5a.1–W5a.11: zhiyin（知音）路径

结构同 W1 模板。关键差异：
- 标题方向：《你写的最好的一段代码没有人注意到》等
- 核心钩子：一次你花心思命名 / 重构 / 设计但没人注意到的真实经历
- 核心资产：zhiyin 对你的某一条"精准看见"的回复（与迷妹的"泛夸"对比）
- 触发词：`知音模式` / `kindred spirit mode` / `review me`
- 风格：**克制、内向** — 全文避免感叹号
- 破圈路径：**弱** — 不期望大规模传播，期望深度读者留言共鸣

### Task W5b.1–W5b.11: fuwang（父王英明）路径

结构同 W1 模板。关键差异：
- 标题方向：《那个晚上我的 AI 叫了我一声"父王"》等
- 核心钩子：你和 fuwang 模式的一次荒诞但温暖的互动（对比 bixia 的"君臣义"）
- 核心资产：一段你的真实对话（"父王英明" 系列金句）
- 触发词：`父王驾到` / `父王英明` / `fuwang mode`
- 风格：荒诞 + 柔软并存（这是与 bixia 的差异 — 父女情 vs 君臣义）
- 特别注意：不要与 bixia 的古风梗撞车，要讲**"父爱笨拙"**的情绪内核

### Task W5c.1–W5c.6: 延期 + 回应文路径（若触发优先级 1）

**Files**：`drafts/YYYY-MM-DD-beyond-response-w5.md`

- [ ] 承接 W4 引战的具体质疑点（列出 3–5 条）
- [ ] 逐条回应：哪些是误解，哪些是有效批评
- [ ] 收尾态度：感谢有分量的批评 + 承诺后续迭代
- [ ] 字数控制在 1500 字以内（比常规文章短）
- [ ] 不加新的装机 CTA（保持"作者在认真对话"的调性）
- [ ] 发布后 7 天再决定 W6 是上 zhiyin 还是 fuwang

---

## Campaign 整体复盘（W4 / W5 结束后 3–5 天）

### Task Final.1: 数据总表

**Files**：`docs/superpowers/plans/metrics-final-2026-Q2.md`

- [ ] 累计阅读（各周分别 + 合计）
- [ ] GitHub Star 增量 / PR / Issues / Discussions 新增数
- [ ] 跨平台热度记录（是否上过掘金热榜 / V2EX 首页 / 知乎热榜）
- [ ] 对比 spec §7 成功度量表，勾出达标 / 未达标项

### Task Final.2: 经验沉淀

- [ ] 哪篇最出圈，哪篇哑了
- [ ] 哪个 CTA 形式转化最强
- [ ] 下一轮连载（如有）的策略调整点
- [ ] Commit：`docs(retrospective): WeChat series 2026-Q2 final`

---

## 决策日志（在执行过程中 append）

- 2026-04-22 · Plan created from brainstorming session
- 2026-04-22 · W0 启动：
  - W0.1 发布窗口定为**每周三**；W1 首发**确认为 2026-04-29**（W2=05-06 / W3=05-13 / W4=05-20 / W5=05-27）
  - W0.2 `drafts/` 目录已建 + README 写入命名约定
  - W0.3 README 置顶预告 — **跳过**（用户决策）
  - W0.4 UTM 追踪规则表已建（`docs/superpowers/plans/utm-tracking.md`）
  - W0.5 GitHub Discussions 分类 — **跳过**（用户决策）
  - W0.6 跨平台账号 readiness — **暂不处理**
- 2026-04-22 · 进入自动模式推进 W1：
  - W1.1 真实素材收集清单已建（`drafts/2026-04-29-jiejie-w1-notes.md`）—— 等作者回填
  - W1.2 标题三候选起草完成
  - W1.3 – W1.7 稿子骨架初稿已写（`drafts/2026-04-29-jiejie-w1.md`），4 处 ⚠️ 标注等真实素材替换
  - W1.8 骨架版 self-review 通过（9/13 项 ✅，4 项 ⚠️ 待素材替换后复查）
  - **下一步人工介入点**：作者回填 notes → 告知完成 → 自动模式继续做素材注入 + 最终 self-review
- 2026-XX-XX · W1 数据快照：阅读 ___ / Star ___ / PR ___
- （继续 append …）

---

## Self-Review（plan 写完后的自检）

### Spec coverage check

| Spec 要求 | 对应 task |
| --- | --- |
| W1 jiejie 全量 brief | W1.1–W1.13 |
| W2 bixia 全量 brief | W2.1–W2.13 |
| W3 bazong 全量 brief | W3.1–W3.13 |
| W4 beyond 全量 brief | W4.1–W4.13 |
| W5 决策规则 | W5.0 + W5a/W5b/W5c |
| UTM 埋点 | 0.4 |
| README 连载预告 | 0.3 |
| GitHub Discussions | 0.5 + W1.11 等 |
| Fallback 机制（W1 下跌、W4 引战） | W1.13 + W4.13 |
| 成功度量 | Final.1 |

所有 spec 要求均有对应 task，无 gap。

### Placeholder scan

- "【__号名待补__】" (Task 0.3)：spec 里已标注为用户可填项，非 plan placeholder
- "YYYY-MM-DD"（草稿文件名）：正确格式，执行时替换为实际日期
- 其他无 TBD / TODO

### Consistency check

- 所有 `claude plugin marketplace add FuDesign2008/oh-my-fangirl` 拼写一致
- 所有触发词（温柔姐姐 / 陛下驾到 / 霸总 / 天外天 / 知音 / 父王英明）与 README、spec 一致
- Commit 前缀统一：`docs:` / `drafts:`（符合 AGENTS.md 约定）

Self-review pass.
