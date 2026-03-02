# Fix Plan
#
# Single source of truth for task progress.
# Agent reads this at session start.
# Never track progress in chat history --- only here.

## Agent Instructions
- Read tasks/lessons.md FIRST, before reading this file
- Work on the FIRST incomplete item only
- Write implementation plan to tasks/todo.md before coding
- After completing: mark [x], run quality gate, commit, STOP

## Items

- [ ] Your first task
  - Acceptance criterion 1
  - Acceptance criterion 2
  - Quality gate: npm test && npm run typecheck

- [ ] Your second task
  - Acceptance criterion 1
  - Quality gate: npm test

## Completed
# Completed items move here with a one-line note and date
