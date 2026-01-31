#!/bin/bash
# PR 상태 확인 스크립트
# 사용법: ./check-pr-status.sh

PR1=$(gh pr view 595 --repo hesreallyhim/awesome-claude-code --json state,mergedAt 2>/dev/null)
PR2=$(gh pr view 21 --repo ccplugins/awesome-claude-code-plugins --json state,mergedAt 2>/dev/null)

echo "=== skill-forge PR Status ==="
echo ""

# PR1 상태
STATE1=$(echo "$PR1" | jq -r '.state')
MERGED1=$(echo "$PR1" | jq -r '.mergedAt')
echo "hesreallyhim/awesome-claude-code #595:"
if [ "$STATE1" = "MERGED" ]; then
  echo "  ✅ MERGED at $MERGED1"
  osascript -e 'display notification "PR #595 merged!" with title "skill-forge"' 2>/dev/null
elif [ "$STATE1" = "CLOSED" ]; then
  echo "  ❌ CLOSED (not merged)"
else
  echo "  🟡 OPEN (waiting for review)"
fi

echo ""

# PR2 상태
STATE2=$(echo "$PR2" | jq -r '.state')
MERGED2=$(echo "$PR2" | jq -r '.mergedAt')
echo "ccplugins/awesome-claude-code-plugins #21:"
if [ "$STATE2" = "MERGED" ]; then
  echo "  ✅ MERGED at $MERGED2"
  osascript -e 'display notification "PR #21 merged!" with title "skill-forge"' 2>/dev/null
elif [ "$STATE2" = "CLOSED" ]; then
  echo "  ❌ CLOSED (not merged)"
else
  echo "  🟡 OPEN (waiting for review)"
fi
