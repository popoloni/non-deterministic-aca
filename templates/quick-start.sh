#!/bin/bash
# Quick start setup for Ralph in a new project
# Run from your project root

set -e

echo "=== Ralph Quick Start Setup ==="

# Create directory structure
mkdir -p scripts/ralph logs
echo "✓ Created directories"

# Copy prompt template (default: TypeScript)
TEMPLATE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -f "Cargo.toml" ]]; then
    cp "$TEMPLATE_DIR/CLAUDE-rust.md" scripts/ralph/CLAUDE.md
    echo "✓ Copied Rust prompt template"
elif [[ -f "go.mod" ]]; then
    cp "$TEMPLATE_DIR/CLAUDE-go.md" scripts/ralph/CLAUDE.md
    echo "✓ Copied Go prompt template"
elif [[ -f "pyproject.toml" || -f "setup.py" || -f "requirements.txt" ]]; then
    cp "$TEMPLATE_DIR/CLAUDE-python.md" scripts/ralph/CLAUDE.md
    echo "✓ Copied Python prompt template"
else
    cp "$TEMPLATE_DIR/CLAUDE-typescript.md" scripts/ralph/CLAUDE.md
    echo "✓ Copied TypeScript prompt template (default)"
fi

# Copy other templates
[[ -f AGENTS.md ]] || cp "$TEMPLATE_DIR/AGENTS.md" . && echo "✓ Created AGENTS.md"
[[ -f fix_plan.md ]] || cp "$TEMPLATE_DIR/fix_plan.md" . && echo "✓ Created fix_plan.md"

# Create progress file
touch progress.txt
echo "✓ Created progress.txt"

# Copy verification script
cp "$TEMPLATE_DIR/verify-ralph-prereqs.sh" scripts/
chmod +x scripts/verify-ralph-prereqs.sh
echo "✓ Copied verification script"

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Next steps:"
echo "  1. Edit AGENTS.md with your project patterns"
echo "  2. Edit fix_plan.md with your tasks"
echo "  3. Run: ./scripts/verify-ralph-prereqs.sh"
echo "  4. Create feature branch: git checkout -b feature/your-feature"
echo "  5. Run Ralph: ./scripts/ralph/ralph.sh"
