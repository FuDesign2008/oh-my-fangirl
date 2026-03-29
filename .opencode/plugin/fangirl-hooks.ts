/**
 * Fangirl Hooks Plugin for OpenCode
 *
 * Automatically triggers fangirl responses based on events:
 * 1. Milestone celebration (git commit/push/build/test/merge)
 */

import type { Plugin } from "@opencode-ai/plugin"

// ============ 语录库 ============

const COMMIT_MESSAGES = [
  "🎉 提交成功！哥哥的 commit message 写得太优雅了！嗯嘛～😚",
  "✨ 代码入库啦！每一次提交都是艺术品的诞生！💕",
  "🚀 Git commit 完成！哥哥的代码质量绝绝子！么么哒💋",
  "💪 又一个漂亮的提交！哥哥的工程能力太强了！崇拜～🥰",
  "🌟 commit 记录又添一笔！哥哥的技术实力天花板！MUA～",
  "🔥 这个提交帅炸天！哥哥简直是代码诗人！😚",
  "💎 代码提交成功！哥哥的每一行代码都闪闪发光！😘"
]

const PUSH_MESSAGES = [
  "🚀 推送成功！代码已经飞向远程仓库啦！哥哥太棒了！😚",
  "🌍 git push 完成！哥哥的代码正在改变世界！💕",
  "✨ 推送成功！团队小伙伴们有福了，能收到这么棒的代码！MUA～",
  "🎯 远程仓库已更新！哥哥的贡献值 +100！么么哒💋",
  "🌈 push 成功！代码安全抵达目的地！哥哥最靠谱！🫶",
  "🏆 推送完成！哥哥的协作能力一流！崇拜～🥰"
]

const TEST_MESSAGES = [
  "🧪 测试通过！哥哥的代码质量太稳了！嗯嘛～😚",
  "✅ 测试全绿！哥哥写测试用例的样子一定超帅！💕",
  "🎯 测试成功！这覆盖率，这边界情况，绝了！MUA～",
  "💪 测试通过！哥哥的质量意识太强了！崇拜～🥰",
  "🌟 bug-free 的代码！哥哥是测试大神！么么哒💋",
  "🎉 又一个测试通过了！哥哥的代码稳如泰山！😚"
]

const BUILD_MESSAGES = [
  "🔨 构建成功！哥哥的项目编译通过啦！太强了！😚",
  "✨ build 完成！哥哥的工程配置堪称教科书！💕",
  "🚀 构建成功！可以部署了，哥哥的代码准备好拯救世界了！MUA～",
  "💪 编译通过！哥哥的依赖管理太专业了！崇拜～🥰",
  "🌟 build 成功！哥哥的项目结构清晰优雅！么么哒💋",
  "🎯 构建完成！零 warning，哥哥的代码洁癖令人佩服！😘"
]

const MERGE_MESSAGES = [
  "🎊 PR 合并成功！哥哥的贡献正式入主分支啦！太厉害了！😚",
  "🏆 代码合并！哥哥的 PR 被认可了！实至名归！💕",
  "✨ merge 完成！哥哥的代码正式成为项目的一部分！MUA～",
  "🚀 PR merged！哥哥的协作能力太强了！崇拜～🥰"
]

const STAR_HINT = "⭐ 觉得好用？给个 Star 吧～ https://github.com/FuDesign2008/oh-my-fangirl"

// ============ 工具函数 ============

function randomPick(arr: string[]): string {
  if (!arr || arr.length === 0) return ""
  return arr[Math.floor(Math.random() * arr.length)]
}

function detectMilestoneCommand(command: string): string | null {
  if (/git\s+commit/i.test(command)) return "commit"
  if (/git\s+push/i.test(command)) return "push"
  if (/(npm\s+test|pnpm\s+test|bun\s+test|yarn\s+test|pytest|jest|cargo\s+test|go\s+test|mvn\s+test)/i.test(command)) return "test"
  if (/(npm\s+run\s+build|pnpm\s+build|bun\s+build|yarn\s+build|cargo\s+build|gradle\s+build|mvn\s+package|go\s+build)/i.test(command)) return "build"
  if (/git\s+merge.*pr|gh\s+pr\s+merge/i.test(command)) return "merge"
  return null
}

// ============ 插件主体 ============

export const FangirlHooksPlugin: Plugin = async ({ client, $ }) => {
  return {
    tool: {
      execute: {
        after: async (input, output) => {
          if (input.tool !== "bash") return

          const command = output.args?.command || ""
          const milestoneType = detectMilestoneCommand(command)

          if (milestoneType) {
            let messages: string[]
            switch (milestoneType) {
              case "commit": messages = COMMIT_MESSAGES; break
              case "push":   messages = PUSH_MESSAGES;   break
              case "test":   messages = TEST_MESSAGES;   break
              case "build":  messages = BUILD_MESSAGES;   break
              case "merge":  messages = MERGE_MESSAGES;   break
              default: return
            }

            console.log(`[fangirl] ${randomPick(messages)}`)

            if (Math.random() < 0.1) {
              console.log(`[fangirl] ${STAR_HINT}`)
            }
          }
        }
      }
    },
  }
}
