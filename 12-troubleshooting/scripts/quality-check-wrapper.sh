#!/bin/bash
# Quality check wrapper with diagnostics
# Use this instead of raw npm commands for better error reporting

set -e

echo "=== Quality Checks Starting ==="
echo "Working directory: $(pwd)"
echo "Node version: $(node --version 2>/dev/null || echo 'not found')"
echo "NPM version: $(npm --version 2>/dev/null || echo 'not found')"

# Ensure dependencies
if [[ ! -d "node_modules" ]]; then
    echo "Installing dependencies..."
    npm install
fi

# Run checks with clear output
echo "--- Typecheck ---"
if ! npm run typecheck; then
    echo "FAILED: Typecheck"
    exit 1
fi

echo "--- Lint ---"
if ! npm run lint; then
    echo "FAILED: Lint"
    exit 1
fi

echo "--- Tests ---"
if ! npm test; then
    echo "FAILED: Tests"
    exit 1
fi

echo "=== All Quality Checks Passed ==="
exit 0
