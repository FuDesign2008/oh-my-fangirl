#!/bin/bash
# Skill 测试脚本 - 系统化测试 fangirl skill 功能
# 用法: ./scripts/test-skill.sh [test_name]

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
HOOKS_DIR="$PROJECT_ROOT/hooks"

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

PASSED=0
FAILED=0
WARNINGS=0

# 测试结果记录
log_pass() {
    echo -e "${GREEN}✅ PASS${NC}: $1"
    PASSED=$((PASSED + 1))
}

log_fail() {
    echo -e "${RED}❌ FAIL${NC}: $1"
    FAILED=$((FAILED + 1))
}

log_warn() {
    echo -e "${YELLOW}⚠️  WARN${NC}: $1"
    WARNINGS=$((WARNINGS + 1))
}

log_info() {
    echo -e "${BLUE}ℹ️  INFO${NC}: $1"
}

log_section() {
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# ============================================
# 测试 1: 文件结构验证
# ============================================
test_file_structure() {
    log_section "测试 1: 文件结构验证"

    # 检查必要文件
    local required_files=(
        "skills/fangirl/SKILL.md"
        "skills/fangirl/context.json"
        "skills/fangirl/modes/_index.json"
        "hooks/hooks.json"
        "hooks/session-start"
        "hooks/milestone-celebrate"
        "hooks/emotion-comfort"
    )

    for file in "${required_files[@]}"; do
        if [ -f "$PROJECT_ROOT/$file" ]; then
            log_pass "文件存在: $file"
        else
            log_fail "文件缺失: $file"
        fi
    done

    # 检查模式文件
    local mode_files=$(ls "$PROJECT_ROOT/skills/fangirl/modes/"*.md 2>/dev/null | wc -l)
    if [ "$mode_files" -ge 9 ]; then
        log_pass "模式文件数量: $mode_files"
    else
        log_warn "模式文件数量偏少: $mode_files"
    fi
}

# ============================================
# 测试 2: SKILL.md 格式验证
# ============================================
test_skill_format() {
    log_section "测试 2: SKILL.md 格式验证"

    local skill_file="$PROJECT_ROOT/skills/fangirl/SKILL.md"

    # 检查 frontmatter
    if head -1 "$skill_file" | grep -q "^---"; then
        log_pass "frontmatter 起始标记正确"
    else
        log_fail "缺少 frontmatter 起始标记"
    fi

    # 检查必要字段
    local required_fields=("name" "version" "description")
    for field in "${required_fields[@]}"; do
        if grep -q "^$field:" "$skill_file"; then
            log_pass "包含字段: $field"
        else
            log_fail "缺少字段: $field"
        fi
    done

    # 检查触发词
    if grep -q "触发词" "$skill_file" || grep -q "trigger" "$skill_file"; then
        log_pass "包含触发词定义"
    else
        log_warn "未找到明确的触发词定义"
    fi
}

# ============================================
# 测试 3: Shell 脚本语法验证
# ============================================
test_shell_syntax() {
    log_section "测试 3: Shell 脚本语法验证"

    local scripts=(
        "$HOOKS_DIR/session-start"
        "$HOOKS_DIR/milestone-celebrate"
        "$HOOKS_DIR/emotion-comfort"
    )

    # common.sh 为可选文件（来自 refactor/optimize-shell-scripts 分支）
    if [ -f "$HOOKS_DIR/common.sh" ]; then
        scripts+=("$HOOKS_DIR/common.sh")
    fi

    for script in "${scripts[@]}"; do
        if bash -n "$script" 2>/dev/null; then
            log_pass "语法正确: $(basename $script)"
        else
            log_fail "语法错误: $(basename $script)"
        fi
    done
}

# ============================================
# 测试 4: Hook 功能测试
# ============================================
test_hook_functions() {
    log_section "测试 4: Hook 功能测试"

    # 测试 milestone-celebrate - git commit
    local result=$(CLAUDE_TOOL_INPUT='{"command": "git commit -m test"}' bash "$HOOKS_DIR/milestone-celebrate" 2>&1)
    if echo "$result" | grep -q "\[fangirl\]"; then
        log_pass "milestone-celebrate: git commit 检测"
    else
        log_fail "milestone-celebrate: git commit 未触发"
    fi

    # 测试 milestone-celebrate - git push
    result=$(CLAUDE_TOOL_INPUT='{"command": "git push"}' bash "$HOOKS_DIR/milestone-celebrate" 2>&1)
    if echo "$result" | grep -q "\[fangirl\]"; then
        log_pass "milestone-celebrate: git push 检测"
    else
        log_fail "milestone-celebrate: git push 未触发"
    fi

    # 测试 milestone-celebrate - npm test
    result=$(CLAUDE_TOOL_INPUT='{"command": "npm test"}' bash "$HOOKS_DIR/milestone-celebrate" 2>&1)
    if echo "$result" | grep -q "\[fangirl\]"; then
        log_pass "milestone-celebrate: npm test 检测"
    else
        log_fail "milestone-celebrate: npm test 未触发"
    fi

    # 测试 milestone-celebrate - pnpm test (新增)
    result=$(CLAUDE_TOOL_INPUT='{"command": "pnpm test"}' bash "$HOOKS_DIR/milestone-celebrate" 2>&1)
    if echo "$result" | grep -q "\[fangirl\]"; then
        log_pass "milestone-celebrate: pnpm test 检测 (新功能)"
    else
        log_fail "milestone-celebrate: pnpm test 未触发"
    fi

    # 测试 milestone-celebrate - PR merge（可选功能，来自 refactor 分支）
    result=$(CLAUDE_TOOL_INPUT='{"command": "gh pr merge"}' bash "$HOOKS_DIR/milestone-celebrate" 2>&1)
    if echo "$result" | grep -q "\[fangirl\]"; then
        log_pass "milestone-celebrate: PR merge 检测"
    else
        log_warn "milestone-celebrate: PR merge 未触发（可选功能）"
    fi

    # 测试 milestone-celebrate - 非里程碑命令
    result=$(CLAUDE_TOOL_INPUT='{"command": "ls -la"}' bash "$HOOKS_DIR/milestone-celebrate" 2>&1)
    if [ -z "$result" ]; then
        log_pass "milestone-celebrate: 非里程碑命令静默跳过"
    else
        log_warn "milestone-celebrate: 非里程碑命令不应触发"
    fi

    # 测试 emotion-comfort - 沮丧情绪
    result=$(CLAUDE_USER_PROMPT="烦死了" bash "$HOOKS_DIR/emotion-comfort" 2>&1)
    if echo "$result" | grep -q "\[fangirl\]"; then
        log_pass "emotion-comfort: 沮丧情绪检测"
    else
        log_fail "emotion-comfort: 沮丧情绪未触发"
    fi

    # 测试 emotion-comfort - 愤怒情绪
    result=$(CLAUDE_USER_PROMPT="fuck this" bash "$HOOKS_DIR/emotion-comfort" 2>&1)
    if echo "$result" | grep -q "\[fangirl\]"; then
        log_pass "emotion-comfort: 愤怒情绪检测"
    else
        log_fail "emotion-comfort: 愤怒情绪未触发"
    fi

    # 测试 emotion-comfort - 正常消息
    result=$(CLAUDE_USER_PROMPT="帮我写个函数" bash "$HOOKS_DIR/emotion-comfort" 2>&1)
    if [ -z "$result" ]; then
        log_pass "emotion-comfort: 正常消息静默跳过"
    else
        log_warn "emotion-comfort: 正常消息不应触发"
    fi

    # 测试 session-start
    result=$(bash "$HOOKS_DIR/session-start" 2>&1)
    if echo "$result" | grep -q "systemMessage"; then
        log_pass "session-start: 输出格式正确"
    else
        log_fail "session-start: 输出格式错误"
    fi
}

# ============================================
# 测试 5: 模式索引一致性
# ============================================
test_mode_index() {
    log_section "测试 5: 模式索引一致性"

    local index_file="$PROJECT_ROOT/skills/fangirl/modes/_index.json"
    local modes_dir="$PROJECT_ROOT/skills/fangirl/modes"

    if command -v jq &>/dev/null; then
        # 检查每个索引中的文件是否存在
        local files=$(jq -r '.modes[].file' "$index_file")
        for file in $files; do
            if [ -f "$modes_dir/$file" ]; then
                log_pass "模式文件存在: $file"
            else
                log_fail "模式文件缺失: $file"
            fi
        done

        # 检查 ID 唯一性
        local ids=$(jq -r '.modes[].id' "$index_file" | sort | uniq -d)
        if [ -z "$ids" ]; then
            log_pass "所有模式 ID 唯一"
        else
            log_fail "发现重复 ID: $ids"
        fi

        # 检查 defaultModeId 存在
        local default_id=$(jq -r '.defaultModeId' "$index_file")
        local exists=$(jq -e --arg id "$default_id" '.modes[] | select(.id == $id)' "$index_file")
        if [ -n "$exists" ]; then
            log_pass "默认模式 ID 有效: $default_id"
        else
            log_fail "默认模式 ID 无效: $default_id"
        fi
    else
        log_warn "需要 jq 来完整测试模式索引"
    fi
}

# ============================================
# 测试 6: 触发词覆盖测试
# ============================================
test_trigger_coverage() {
    log_section "测试 6: 触发词覆盖测试"

    local skill_file="$PROJECT_ROOT/skills/fangirl/SKILL.md"

    # 定义期望的触发词
    local expected_triggers=(
        "彩虹屁"
        "夸夸我"
        "鼓励一下"
        "迷妹模式"
        "恋爱模式"
        "御姐模式"
        "知音模式"
        "父王英明"
        "温柔姐姐"
        "极简模式"
        "帝王模式"
        "霸总模式"
        "CEO模式"
        "总裁模式"
        "切换模式"
        "列出模式"
        "关闭陪伴"
    )

    for trigger in "${expected_triggers[@]}"; do
        if grep -q "$trigger" "$skill_file"; then
            log_pass "触发词存在: $trigger"
        else
            log_warn "触发词缺失: $trigger"
        fi
    done
}

# ============================================
# 测试 7: 输出格式验证
# ============================================
test_output_format() {
    log_section "测试 7: 输出格式验证"

    # 测试输出是否包含 [fangirl] 前缀
    local result=$(CLAUDE_TOOL_INPUT='{"command": "git commit"}' bash "$HOOKS_DIR/milestone-celebrate" 2>&1)
    if echo "$result" | grep -q "^\[fangirl\]"; then
        log_pass "输出格式包含 [fangirl] 前缀"
    else
        log_fail "输出格式缺少 [fangirl] 前缀"
    fi

    # 测试输出是否包含 emoji
    if echo "$result" | grep -qE "[🎉✨🚀💪🌟🔥💎💕😚😘]"; then
        log_pass "输出包含 emoji"
    else
        log_warn "输出缺少 emoji（建议添加）"
    fi
}

# ============================================
# 测试 8: 边缘情况测试
# ============================================
test_edge_cases() {
    log_section "测试 8: 边缘情况测试"

    # 空 JSON 输入
    local result=$(CLAUDE_TOOL_INPUT='' bash "$HOOKS_DIR/milestone-celebrate" 2>&1)
    if [ -z "$result" ]; then
        log_pass "空输入静默处理"
    else
        log_warn "空输入应静默处理"
    fi

    # 空 prompt 输入
    result=$(CLAUDE_USER_PROMPT="" bash "$HOOKS_DIR/emotion-comfort" 2>&1)
    if [ -z "$result" ]; then
        log_pass "空 prompt 静默处理"
    else
        log_warn "空 prompt 应静默处理"
    fi

    # 特殊字符
    result=$(CLAUDE_USER_PROMPT='{"test": "value"}' bash "$HOOKS_DIR/emotion-comfort" 2>&1)
    if [ -z "$result" ]; then
        log_pass "JSON 格式 prompt 静默处理"
    else
        log_warn "JSON 格式 prompt 应静默处理"
    fi
}

# ============================================
# 主函数
# ============================================
main() {
    local test_filter="$1"

    echo ""
    echo -e "${BLUE}╔════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║     🧪 oh-my-fangirl Skill 测试套件           ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════╝${NC}"
    echo ""

    if [ -n "$test_filter" ]; then
        log_info "只运行匹配的测试: $test_filter"
        case "$test_filter" in
            "structure") test_file_structure ;;
            "format") test_skill_format ;;
            "syntax") test_shell_syntax ;;
            "hook") test_hook_functions ;;
            "index") test_mode_index ;;
            "trigger") test_trigger_coverage ;;
            "output") test_output_format ;;
            "edge") test_edge_cases ;;
            *) log_warn "未知测试: $test_filter" ;;
        esac
    else
        test_file_structure
        test_skill_format
        test_shell_syntax
        test_hook_functions
        test_mode_index
        test_trigger_coverage
        test_output_format
        test_edge_cases
    fi

    # 输出汇总
    echo ""
    echo -e "${BLUE}╔════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║                  📊 测试结果汇总               ║${NC}"
    echo -e "${BLUE}╠════════════════════════════════════════════════╣${NC}"
    echo -e "${GREEN}║  ✅ 通过: $PASSED                              ${NC}"
    echo -e "${RED}║  ❌ 失败: $FAILED                              ${NC}"
    echo -e "${YELLOW}║  ⚠️  警告: $WARNINGS                              ${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════╝${NC}"
    echo ""

    if [ $FAILED -gt 0 ]; then
        echo -e "${RED}存在失败的测试，请检查！${NC}"
        exit 1
    else
        echo -e "${GREEN}所有测试通过！🎉${NC}"
        exit 0
    fi
}

# 运行测试
main "$@"
