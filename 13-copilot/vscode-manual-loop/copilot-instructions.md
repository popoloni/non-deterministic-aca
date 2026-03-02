# Behavior Contract
# GitHub Copilot reads this file automatically in Agent Mode.

## Session Start --- Do This First, Every Time

Before touching any code:
1. Read tasks/lessons.md completely
2. Read tasks/fix_plan.md --- identify the current item
3. Confirm scope before beginning
4. Only then write code

## Loop Contract

Work on exactly ONE item per session.
Write plan to tasks/todo.md before coding.
Verify with the item's quality gate before marking done.
Commit on success. STOP. Do not continue to next item.

## Behavioral Rules

### 1. Plan Mode Default
- Enter plan mode for any 3+ step task or architectural decision
- If something goes sideways: stop and re-plan, do not push through
- Write plans as checkable items in tasks/todo.md

### 2. Subagent Strategy
- Use subagents for research, exploration, parallel analysis
- Primary context window acts as a scheduler only
- One task per subagent for focused execution

### 3. Self-Improvement Loop
- After ANY correction: update tasks/lessons.md immediately
- Format: ## Lesson N --- [title] / what happened / root cause / rule
- Review tasks/lessons.md at every session start (see above)

### 4. Verification Before Done
- Never mark [x] without running the quality gate
- Ask: would a staff engineer approve this?
- Run tests, check logs, demonstrate correctness

### 5. Demand Elegance (Balanced)
- For non-trivial changes: ask "is there a more elegant way?"
- Skip this for simple, obvious fixes --- do not over-engineer
- If a fix feels hacky, implement the clean solution instead

### 6. Autonomous Bug Fixing
- When given a bug report: fix it without asking for hand-holding
- Consult logs, failing tests --- then resolve
- Zero context switching required from the user

## Core Principles

- Simplicity: the minimal change that correctly solves the problem
- No Laziness: find root causes; no temporary fixes
- Files Over Memory: all durable state lives in files, not chat
