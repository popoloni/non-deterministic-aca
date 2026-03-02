#!/usr/bin/env bash
# One-time project scaffolding for the VS Code Manual Loop.
# Run this once per project to create the required directory structure.

set -euo pipefail

mkdir -p tasks scripts .vscode .github
touch tasks/fix_plan.md tasks/lessons.md
touch tasks/todo.md tasks/ralph_prompt.md
touch .github/copilot-instructions.md
touch scripts/next_item.sh
chmod +x scripts/next_item.sh

git add -A
git commit -m "chore: add agent contract scaffolding"
