#!/bin/bash
# Auto-fix script for MD029 and MD031 errors in SKILL.md

echo "Fixing MD029 and MD031 errors in SKILL.md..."

# Backup the original file
cp SKILL.md SKILL.md.backup
echo "✓ Created backup: SKILL.md.backup"

# The fix: Ensure proper blank lines in the Lists with Code Blocks section
# This script will normalize the spacing in that section

# Create a temporary file with the fixed content
cat > /tmp/skill_fix.txt << 'EOF'
### Lists with Code Blocks

Proper indentation maintains list context:

```markdown
1. First step

2. Second step with code:

   ```python
   def example():
       return True
   ```

3. Third step

Done.
```

### Lists with Multiple Paragraphs
EOF

# Use sed to replace the problematic section
# First, let's find the line numbers
START_LINE=$(grep -n "^### Lists with Code Blocks" SKILL.md | cut -d: -f1)
END_LINE=$(grep -n "^### Lists with Multiple Paragraphs" SKILL.md | cut -d: -f1)

if [ -z "$START_LINE" ] || [ -z "$END_LINE" ]; then
    echo "❌ Could not find the section to fix"
    echo "   Looking for: '### Lists with Code Blocks'"
    exit 1
fi

echo "Found section at lines $START_LINE to $END_LINE"

# Extract everything before the section
head -n $((START_LINE - 1)) SKILL.md > SKILL.md.new

# Add the fixed section
cat /tmp/skill_fix.txt >> SKILL.md.new

# Add everything after the section
tail -n +$END_LINE SKILL.md >> SKILL.md.new

# Replace the original with the fixed version
mv SKILL.md.new SKILL.md

echo "✓ Fixed the section"
echo ""
echo "Running markdownlint to verify..."
markdownlint SKILL.md 2>&1 | grep -E "(MD029|MD031|error)" || echo "✓ No MD029 or MD031 errors found!"

echo ""
echo "Done! Check SKILL.md to verify the fix."
echo "If something went wrong, restore from backup:"
echo "  cp SKILL.md.backup SKILL.md"
