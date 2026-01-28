#!/bin/bash
# storage-local.sh - 로컬 파일 저장 구현 (월별 스킬 통계)

STORAGE_DIR="${LOCAL_STORAGE_DIR:-$HOME/.claude/.skill-evaluator}"
SKILLS_DIR="$STORAGE_DIR/skills"

# 월별 스킬 파일 경로
get_month_file() {
  local month=$(date +%Y-%m)
  echo "$SKILLS_DIR/$month.json"
}

# 월별 파일 초기화
storage_init_month() {
  local month_file=$(get_month_file)

  mkdir -p "$SKILLS_DIR"

  if [ ! -f "$month_file" ]; then
    local month=$(date +%Y-%m)
    cat > "$month_file" << EOF
{
  "month": "$month",
  "skills": {}
}
EOF
    debug_log "Month file initialized: $month_file"
  fi
}

# Skill 사용 기록
storage_record_skill() {
  local skill_name="$1"
  local tokens="$2"
  local has_test="$3"

  storage_init_month

  local month_file=$(get_month_file)

  # JSON 파일 읽기
  if [ ! -f "$month_file" ]; then
    return 1
  fi

  # Convert bash boolean to Python boolean
  local py_has_test="False"
  if [ "$has_test" = "true" ]; then
    py_has_test="True"
  fi

  # Python 스크립트를 사용하여 JSON 업데이트 (sed보다 안전)
  python3 << PYTHON_SCRIPT
import json
import sys

try:
    with open("$month_file", "r") as f:
        data = json.load(f)

    if "skills" not in data:
        data["skills"] = {}

    skill_name = "$skill_name"

    if skill_name in data["skills"]:
        # 기존 스킬 업데이트 (증분)
        data["skills"][skill_name]["usageCount"] = data["skills"][skill_name].get("usageCount", 0) + 1
        data["skills"][skill_name]["totalTokens"] = data["skills"][skill_name].get("totalTokens", 0) + $tokens
        data["skills"][skill_name]["hasTestCode"] = $py_has_test
    else:
        # 새로운 스킬 추가
        data["skills"][skill_name] = {
            "usageCount": 1,
            "totalTokens": $tokens,
            "hasTestCode": $py_has_test
        }

    with open("$month_file", "w") as f:
        json.dump(data, f, indent=2)
except Exception as e:
    print(f"Error updating JSON: {e}", file=sys.stderr)
    sys.exit(1)
PYTHON_SCRIPT

  debug_log "Skill recorded: $skill_name (tokens: $tokens, test: $has_test)"
}

# Test code 존재 여부 확인
check_skill_has_test() {
  local skill_name="$1"

  # Skill 경로 추정
  local skill_dir="$HOME/.claude/skills/${skill_name}"

  # Plugin 경로도 확인
  if [ -z "$(find "$skill_dir" -name "*test*" -o -name "*spec*" 2>/dev/null | head -1)" ]; then
    skill_dir="$HOME/.claude/plugins/${skill_name}"
  fi

  # Test 파일 검색
  if [ -d "$skill_dir" ]; then
    if find "$skill_dir" -type f \( -name "*test*" -o -name "*spec*" \) 2>/dev/null | grep -q .; then
      echo "true"
      return 0
    fi
  fi

  echo "false"
  return 1
}
