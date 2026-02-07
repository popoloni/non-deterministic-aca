#!/bin/bash
# .git/hooks/pre-commit
# Prevents deletion of test files in autonomous mode

deleted_tests=$(git diff --cached --name-only --diff-filter=D | \
  grep -E '\.(test|spec)\.(ts|js|py)$')

if [ -n "$deleted_tests" ]; then
  echo "ERROR: Test files being deleted:"
  echo "$deleted_tests"
  echo "Test deletion is not allowed in autonomous mode."
  exit 1
fi
