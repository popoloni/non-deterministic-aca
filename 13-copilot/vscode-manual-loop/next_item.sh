#!/usr/bin/env bash
set -euo pipefail

PLAN="tasks/fix_plan.md"
PROMPT="tasks/ralph_prompt.md"
LESSONS="tasks/lessons.md"

echo "========================================"
echo "  VS Code Ralph --- Session Launcher"
echo "========================================"
echo ""

# Verify required files
for f in "$PLAN" "$PROMPT"; do
  [ -f "$f" ] || { echo "Missing: $f --- run setup first."; exit 1; }
done

[ -f "$LESSONS" ] || echo "# Agent Lessons" > "$LESSONS"

# Progress report
DONE=$(grep -c '^\- \[x\]' "$PLAN" 2>/dev/null || true)
REMAINING=$(grep -c '^\- \[ \]' "$PLAN" 2>/dev/null || true)
LESSON_COUNT=$(grep -c '^## Lesson' "$LESSONS" 2>/dev/null || true)

# Normalize: grep -c returns non-zero exit when count is 0 on some
# systems; the || true above preserves 0 correctly via stdout
DONE=${DONE:-0}
REMAINING=${REMAINING:-0}
LESSON_COUNT=${LESSON_COUNT:-0}

echo "Progress : $DONE done, $REMAINING remaining"
echo "Lessons  : $LESSON_COUNT captured"
echo ""

if [ "$REMAINING" -eq 0 ]; then
  echo "All items complete. Review $PLAN for the full summary."
  exit 0
fi

echo "Next item:"
grep '^\- \[ \]' "$PLAN" | head -1 | sed 's/^/  /'
echo ""
echo "Steps:"
echo "  1. Cmd/Ctrl+Shift+P -> GitHub Copilot: Open Chat"
echo "  2. Select AGENT MODE (not Ask, not Edit)"
echo "  3. Paste the prompt (already in clipboard)"
echo "  4. Let the agent run to completion without interrupting"
echo "  5. Close this chat session entirely when done"
echo "  6. Run this script again for the next item"
echo ""
echo "IMPORTANT: Always start a NEW chat session per item."
echo "Reusing a session accumulates context and degrades quality."
echo ""

# Copy prompt to clipboard (cross-platform)
if   command -v pbcopy &>/dev/null; then
  pbcopy  < "$PROMPT" && echo "Prompt copied (pbcopy --- macOS)"
elif command -v xclip  &>/dev/null; then
  xclip -selection clipboard < "$PROMPT" \
    && echo "Prompt copied (xclip --- Linux)"
elif command -v xsel   &>/dev/null; then
  xsel --clipboard --input  < "$PROMPT" \
    && echo "Prompt copied (xsel --- Linux)"
elif command -v clip   &>/dev/null; then
  clip < "$PROMPT" && echo "Prompt copied (clip --- Windows)"
else
  echo "No clipboard tool found. Copy the prompt manually:"
  echo "---"
  cat "$PROMPT"
fi
