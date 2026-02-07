#!/bin/bash
# scripts/daily-compound-review.sh
# Job 1: Runs BEFORE auto-compound.sh to update AGENTS.md with learnings

cd ~/projects/your-project

# Ensure we're on main and up to date
git checkout main
git pull origin main

# Instruct agent to extract and persist learnings
amp execute "Load the compound-engineering skill. Look through 
and read each Amp thread from the last 24 hours. For any thread 
where we did NOT use the Compound Engineering skill to compound 
our learnings at the end, do so now - extract the key learnings 
from that thread and update the relevant AGENTS.md files so we 
can learn from our work and mistakes. Commit your changes and 
push to main."
