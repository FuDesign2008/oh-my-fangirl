#!/bin/bash
# 公共函数库 - fangirl hooks 共用逻辑
# 被 session-start、milestone-celebrate、emotion-comfort source

# 随机选择数组中的一个元素
# 用法: random_pick "${ARRAY[@]}"
random_pick() {
    local arr=("$@")
    local count=${#arr[@]}
    if [ $count -eq 0 ]; then
        return 1
    fi
    local index=$((RANDOM % count))
    echo "${arr[$index]}"
}

# 输出 Star 提示（10% 概率）
# 用法: maybe_show_star_hint
maybe_show_star_hint() {
    if (( RANDOM % 10 == 0 )); then
        echo "[fangirl] ⭐ 觉得好用？给个 Star 吧～ https://github.com/FuDesign2008/oh-my-fangirl" >&2
    fi
}

# 输出 Star 提示（40% 概率，用于 session-start）
# 用法: maybe_show_star_hint_session
maybe_show_star_hint_session() {
    if (( RANDOM % 10 < 4 )); then
        echo "⭐ 觉得好用？给个 Star 吧～ https://github.com/FuDesign2008/oh-my-fangirl"
    fi
}

# 安全解析 JSON 中的字段（fallback 机制）
# 优先使用 jq，其次 python3，最后 grep+sed
# 用法: json_extract "$JSON_STRING" "fieldName"
json_extract() {
    local json="$1"
    local field="$2"

    # 方法 1: 使用 jq（如果可用）
    if command -v jq &>/dev/null; then
        echo "$json" | jq -r ".$field // empty" 2>/dev/null
        return $?
    fi

    # 方法 2: 使用 python3（如果可用）
    if command -v python3 &>/dev/null; then
        python3 -c "
import json, sys
try:
    data = json.loads(sys.stdin.read())
    result = data.get('$field', '')
    print(result if result else '')
except:
    pass
" <<< "$json" 2>/dev/null
        return $?
    fi

    # 方法 3: grep + sed（fallback，不够健壮但可用）
    echo "$json" | grep -o "\"$field\"[[:space:]]*:[[:space:]]*\"[^\"]*\"" | \
        sed "s/\"$field\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\"/\1/" | head -1
}

# 输出 fangirl 消息（统一格式）
# 用法: output_message "消息内容"
output_message() {
    local msg="$1"
    echo "[fangirl] $msg" >&2
}

# 获取插件根目录
# 用法: PLUGIN_ROOT=$(get_plugin_root "$SCRIPT_DIR")
get_plugin_root() {
    local script_dir="$1"
    dirname "$script_dir"
}
