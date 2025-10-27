#!/bin/bash
# Validate production files for markdownlint compliance

echo "Validating production files..."
echo "====================================="

FILES=(
    "resources/MARKDOWN_VALIDATION_TRAPS.md"
    "rules/markdownlint-rules-reference.md"
    "rules/top-ai-violations.md"
    "tests/README.md"
)

ERRORS=0

for file in "${FILES[@]}"; do
    echo "Checking: $file"
    if markdownlint "$file" 2>&1; then
        echo "✓ PASS"
    else
        echo "✗ FAIL"
        ((ERRORS++))
    fi
    echo ""
done

echo "====================================="
if [ $ERRORS -eq 0 ]; then
    echo "All files passed validation!"
    exit 0
else
    echo "Found $ERRORS file(s) with errors"
    exit 1
fi
