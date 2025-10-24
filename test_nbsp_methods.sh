#!/bin/bash
# Test script for nbsp detection - validates SKILL.md updates

echo "=== Non-Breaking Space Detection Test ==="
echo ""
echo "This script validates the nbsp detection methods"
echo "documented in SKILL.md Rule 8"
echo ""

# Test 1: Create a test markdown file with nbsp
echo "1. Creating test file with nbsp characters..."
cat > /tmp/test_nbsp.md << 'TESTEOF'
# Test Document

List with nbsp indentation:

1. First item

2. Second item with code:

   ```python
   def example():
       return True
   ```

3. Third item
TESTEOF

# Insert nbsp characters (manually showing what they'd look like)
# In a real test, you'd use: sed -i 's/^   /\xc2\xa0\xc2\xa0\xc2\xa0/' /tmp/test_nbsp.md

echo "   ✓ Test file created"
echo ""

# Test 2: Detection methods
echo "2. Detection Methods:"
echo ""
echo "   Method A - grep with Unicode escape:"
echo "   Command: grep -n \$'\\u00A0' filename.md"
echo "   (Will show line numbers if nbsp found)"
echo ""

echo "   Method B - VS Code:"
echo "   View → Render Whitespace"
echo "   Look for unusual spacing symbols"
echo ""

echo "   Method C - Hex dump:"
echo "   Command: od -c filename.md | grep 240"
echo "   (240 in octal = 160 decimal = nbsp)"
echo ""

# Test 3: Fix methods
echo "3. Fix Methods:"
echo ""
echo "   Method A - sed (Linux/Mac/Git Bash):"
echo "   sed -i 's/\\xc2\\xa0/ /g' filename.md"
echo ""

echo "   Method B - VS Code Find/Replace:"
echo "   Find:    \\u00A0"
echo "   Replace: (single space)"
echo "   Mode:    Regex enabled"
echo ""

# Test 4: Validation
echo "4. Validation After Fix:"
echo "   markdownlint filename.md"
echo "   (Should show no MD029 or MD031 errors)"
echo ""

echo "=== Test Information ==="
echo "The SKILL.md update adds:"
echo "- Rule 8: Character Encoding and Spacing"
echo "- Error Pattern 7: Invisible Character Issues"
echo "- Detection commands and visual methods"
echo "- Fix procedures for nbsp in indentation"
echo ""
echo "Priority: HIGH - Critical for AI-generated markdown"
echo ""
echo "See SKILL_UPDATE_NBSP.md for full implementation details"
