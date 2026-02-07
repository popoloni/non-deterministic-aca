#!/bin/bash
# scripts/compound/auto-compound.sh
# Job 2: Full pipeline: report → PRD → tasks → implementation → PR

set -e
cd ~/projects/your-project

# Source environment variables
source .env.local

# Fetch latest (including tonight's AGENTS.md updates)
git fetch origin main
git reset --hard origin/main

# Find the latest prioritized report
LATEST_REPORT=$(ls -t reports/*.md | head -1)

# Analyze and pick #1 priority
ANALYSIS=$(./scripts/compound/analyze-report.sh "$LATEST_REPORT")
PRIORITY_ITEM=$(echo "$ANALYSIS" | jq -r '.priority_item')
BRANCH_NAME=$(echo "$ANALYSIS" | jq -r '.branch_name')

# Create feature branch
git checkout -b "$BRANCH_NAME"

# Create PRD from priority item
amp execute "Load the prd skill. Create a PRD for: $PRIORITY_ITEM. 
Save to tasks/prd-$(basename $BRANCH_NAME).md"

# Convert PRD to executable tasks
amp execute "Load the tasks skill. Convert the PRD to 
scripts/compound/prd.json"

# Run the execution loop
./scripts/compound/loop.sh 25

# Create PR for human review
git push -u origin "$BRANCH_NAME"
gh pr create --draft --title "Compound: $PRIORITY_ITEM" --base main
