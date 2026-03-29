#!/bin/bash
# 同步校验脚本 - 检查 _index.json 与模式文件、SKILL.md 的一致性

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
INDEX_FILE="$PROJECT_ROOT/skills/fangirl/modes/_index.json"
MODES_DIR="$PROJECT_ROOT/skills/fangirl/modes"
SKILL_FILE="$PROJECT_ROOT/skills/fangirl/SKILL.md"

ERRORS=0
WARNINGS=0

echo "🔍 开始校验 fangirl 配置同步性..."
echo ""

# 检查 _index.json 是否存在
if [ ! -f "$INDEX_FILE" ]; then
    echo "❌ 错误: _index.json 不存在于 $INDEX_FILE"
    exit 1
fi

# 函数：记录错误
log_error() {
    echo "❌ 错误: $1"
    ERRORS=$((ERRORS + 1))
}

# 函数：记录警告
log_warning() {
    echo "⚠️  警告: $1"
    WARNINGS=$((WARNINGS + 1))
}

# 函数：记录成功
log_success() {
    echo "✅ $1"
}

echo "### 1. 检查模式文件是否存在 ###"

# 提取 _index.json 中的 file 字段
if command -v jq &>/dev/null; then
    MODE_FILES=$(jq -r '.modes[].file' "$INDEX_FILE")
else
    MODE_FILES=$(grep -o '"file"[[:space:]]*:[[:space:]]*"[^"]*"' "$INDEX_FILE" | \
                 sed 's/"file"[[:space:]]*:[[:space:]]*"\([^"]*\)"/\1/')
fi

for file in $MODE_FILES; do
    MODE_PATH="$MODES_DIR/$file"
    if [ -f "$MODE_PATH" ]; then
        log_success "模式文件存在: $file"
    else
        log_error "模式文件缺失: $file"
    fi
done

echo ""
echo "### 2. 检查 ID 唯一性 ###"

if command -v jq &>/dev/null; then
    IDS=$(jq -r '.modes[].id' "$INDEX_FILE")
    DUPLICATE_IDS=$(echo "$IDS" | sort | uniq -d)
    if [ -n "$DUPLICATE_IDS" ]; then
        log_error "发现重复 ID: $DUPLICATE_IDS"
    else
        log_success "所有 ID 唯一"
    fi
else
    log_warning "需要 jq 来检查 ID 唯一性"
fi

echo ""
echo "### 3. 检查 aliases 唯一性 ###"

if command -v jq &>/dev/null; then
    ALL_ALIASES=$(jq -r '.modes[].aliases[]' "$INDEX_FILE" 2>/dev/null | sort)
    DUPLICATE_ALIASES=$(echo "$ALL_ALIASES" | uniq -d)
    if [ -n "$DUPLICATE_ALIASES" ]; then
        log_warning "发现重复 alias（可能有意为之）: $(echo "$DUPLICATE_ALIASES" | tr '\n' ' ')"
    else
        log_success "所有 alias 唯一"
    fi
fi

echo ""
echo "### 4. 检查 hookSafe 模式是否合理 ###"

if command -v jq &>/dev/null; then
    HOOK_SAFE_MODES=$(jq -r '.modes[] | select(.hookSafe == true) | .id' "$INDEX_FILE")
    EXPECTED_SAFE="fangirl fuwang jiejie bixia zen"

    for mode in $HOOK_SAFE_MODES; do
        if echo "$EXPECTED_SAFE" | grep -q "$mode"; then
            log_success "hookSafe 模式: $mode"
        else
            log_warning "新增 hookSafe 模式: $mode（请确认是否安全）"
        fi
    done
fi

echo ""
echo "### 5. 检查 SKILL.md 模式表格 ###"

# 检查 SKILL.md 是否包含所有核心模式
if [ -f "$SKILL_FILE" ]; then
    if command -v jq &>/dev/null; then
        CORE_MODES=$(jq -r '.modes[] | select(.tier == "core") | .id' "$INDEX_FILE")
        for mode in $CORE_MODES; do
            if grep -q "|.*\`$mode\`.*|" "$SKILL_FILE"; then
                log_success "SKILL.md 包含核心模式: $mode"
            else
                log_warning "SKILL.md 可能缺失核心模式: $mode"
            fi
        done
    fi
else
    log_error "SKILL.md 不存在"
fi

echo ""
echo "### 6. 检查模式文件格式 ###"

for file in $MODE_FILES; do
    MODE_PATH="$MODES_DIR/$file"
    if [ -f "$MODE_PATH" ]; then
        # 检查是否包含定位和称呼
        if grep -q "定位" "$MODE_PATH" && grep -q "称呼" "$MODE_PATH"; then
            log_success "$file 包含必要字段"
        else
            log_warning "$file 可能缺少「定位」或「称呼」字段"
        fi
    fi
done

echo ""
echo "================================"
echo "校验完成！"
echo "错误: $ERRORS"
echo "警告: $WARNINGS"
echo "================================"

if [ $ERRORS -gt 0 ]; then
    exit 1
fi

exit 0
