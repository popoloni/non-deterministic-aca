#!/usr/bin/env bash
# Step-by-step first session workflow.
# Run this after completing setup.sh and populating your fix plan.

# Step 1: Run the launcher --- it reports progress and copies prompt
./scripts/next_item.sh

# Step 2: Open a new Copilot chat
# Cmd/Ctrl+Shift+P -> "GitHub Copilot: Open Chat"
# Select Agent Mode from the dropdown (not Ask, not Edit)

# Step 3: Paste the prompt and press Enter
# Watch the agent read lessons, select the item, plan,
# implement, verify, and commit --- without further input.

# Step 4: When the agent stops, verify:
cat tasks/fix_plan.md    # First item should be marked [x]
git log --oneline -3     # Commit should appear
cat tasks/lessons.md     # Any new lessons from this session?

# Then close the chat session entirely and repeat from Step 1.
