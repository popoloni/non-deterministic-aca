#!/bin/bash
# Install snarktank/ralph - the canonical Ralph implementation

set -e

PROJECT_DIR="${1:-.}"

echo "=== Installing snarktank/ralph ==="

# Clone the repository
git clone https://github.com/snarktank/ralph.git /tmp/snarktank-ralph

# Copy scripts to project
mkdir -p "$PROJECT_DIR/scripts/ralph"
cp /tmp/snarktank-ralph/ralph.sh "$PROJECT_DIR/scripts/ralph/"
cp /tmp/snarktank-ralph/CLAUDE.md "$PROJECT_DIR/scripts/ralph/"

# Make executable
chmod +x "$PROJECT_DIR/scripts/ralph/ralph.sh"

# Cleanup
rm -rf /tmp/snarktank-ralph

echo "Installed to $PROJECT_DIR/scripts/ralph/"
echo ""
echo "Usage:"
echo "  ./scripts/ralph/ralph.sh --tool claude 25"
