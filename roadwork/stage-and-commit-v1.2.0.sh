#!/bin/bash
# Stage and commit version 1.2.0 changes
# Run this from the repository root: ./roadwork/stage-and-commit-v1.2.0.sh

echo "Staging version 1.2.0 files..."

# Stage updated files
git add markdown/SKILL.md
git add markdown/README.md
git add markdown/references/README.md
git add markdown/references/complete-rules.md
git add markdown/references/examples.md
git add markdown/references/edge-cases.md
git add README.md
git add CHANGELOG.md
git add roadwork/test-plan-update-suggestions.md

echo ""
echo "Files staged. Checking status..."
git status --short

echo ""
echo "Review the staged files above."
echo ""
echo "To commit with the prepared message, run:"
echo "  git commit -F roadwork/COMMIT_MESSAGE_v1.2.0.txt"
echo ""
echo "Or to commit with a custom message, run:"
echo "  git commit"
echo ""
echo "After committing, tag the release:"
echo "  git tag -a v1.2.0 -m 'Version 1.2.0: Professional quality rules'"
echo ""
echo "Then push:"
echo "  git push origin main"
echo "  git push origin v1.2.0"
