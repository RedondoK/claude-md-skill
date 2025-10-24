# Proposed SKILL.md Updates - Non-Breaking Space Issue

## Issue Found

When AI generates markdown with nested code blocks in lists, it may use non-breaking space characters (`&nbsp;`, Unicode 160) for indentation instead of regular spaces (Unicode 32). This causes markdown parsers to fail to recognize proper nesting, breaking list context.

## Locations to Update

### 1. Add to Core Principles (after "Structure Matters")

Add a new section:

```markdown
### 4. Invisible Characters Matter

- Use ONLY regular spaces (U+0020) for indentation, never tabs or non-breaking spaces
- Non-breaking spaces (U+00A0, `&nbsp;`) break markdown parsing
- Ensure proper character encoding (UTF-8)
- Watch for zero-width characters that can break parsing
```

### 2. Add to Pre-Generation Checklist

Add new item:

```markdown
- [ ] Will I use proper spacing? (Regular spaces only, no nbsp or tabs)
```

### 3. Add New Rule (Rule 8: Character Encoding and Spacing)

Insert after Rule 7 (Special Elements):

```markdown
### Rule 8: Character Encoding and Spacing (Critical for AI Generation)

**ALWAYS:**

- Use regular ASCII spaces (U+0020, character code 32) for ALL indentation
- Never use non-breaking spaces (U+00A0, `&nbsp;`, character code 160)
- Never use tabs for indentation (use spaces)
- Use UTF-8 encoding without BOM
- Avoid zero-width characters (U+200B, U+200C, U+200D, U+FEFF)

**Common Sources of Invisible Characters:**

- **AI/LLM output** - May generate nbsp instead of regular spaces
- **Copy/paste from web** - Websites often use nbsp in rendered HTML
- **Word processors** - Documents may contain non-breaking spaces
- **HTML conversion** - `&nbsp;` entities may not convert properly

**How to Detect:**

In VS Code:
1. View → Render Whitespace (or press `Ctrl+Shift+P` → "View: Toggle Render Whitespace")
2. Regular spaces appear as small dots: `·`
3. Non-breaking spaces appear as a different symbol or may not show at all
4. Tabs appear as arrows: `→`

**How to Fix:**

Find and replace in VS Code:
1. Open Find/Replace (`Ctrl+H`)
2. Enable regex mode (click `.*` button)
3. Find: `\u00A0` (matches non-breaking spaces)
4. Replace: ` ` (regular space)
5. Click Replace All

Or use this regex to fix indentation in lists:
- Find: `^(\u00A0+)([-*+]|\d+\.)` 
- Replace with proper spaces based on indent level

**Template (Correct):**

```markdown
- List item with nested code:

   ```python
   # Three regular spaces before the fence
   code_here()
   ```

- Next item
```

Note: The three spaces before the fence are regular spaces (U+0020), not nbsp (U+00A0).

**NEVER:**

```markdown
- List item with nested code:

   ```python
   # If these spaces are nbsp, the block won't nest properly!
   code_here()
   ```

- Next item will start a new list instead of continuing
```
```

### 4. Add New Error Pattern (Error Pattern 7)

Insert in "Critical Error Prevention" section:

```markdown
### Error Pattern 7: Invisible Character Issues (Non-Breaking Spaces)

**Wrong (using non-breaking space for indentation):**

Note: The following example uses nbsp (U+00A0) characters which are invisible:

```markdown
- List item

   ```python  
   code()
   ```

- Next item (will be renumbered as item 1!)
```

**Right (using regular spaces):**

```markdown
- List item

   ```python
   code()
   ```

- Next item (continues properly)
```

**How This Manifests:**

- MD029: List numbering restarts or is inconsistent
- MD031: Code blocks reported as not having blank lines
- List items appear outside of list context in rendered output
- Nested code blocks don't maintain list numbering

**Prevention:**

1. Configure your editor to show all whitespace
2. After generating markdown, verify indentation uses regular spaces
3. Run find/replace to convert nbsp to regular spaces: `\u00A0` → ` `
4. Use a hex editor or "View > Show Invisible Characters" to diagnose

**Detection Command:**

In bash:
```bash
# Find lines with non-breaking spaces
grep -n $'\u00A0' filename.md

# Count non-breaking spaces
grep -o $'\u00A0' filename.md | wc -l

# Show hex dump to see character codes
od -c filename.md | grep -C2 '240'  # 240 octal = 160 decimal = U+00A0
```

**This is especially critical for AI-generated markdown** as language models may output non-breaking spaces in certain contexts.
```

### 5. Update Post-Generation Validation

Add new item:

```markdown
10. **Character encoding:** Only regular spaces used for indentation (no nbsp, no tabs)
```

### 6. Add to "Remember" Section

Add new bullet point:

```markdown
8. Use regular spaces only (never nbsp or tabs)
```

### 7. Add to Quick Reference Card

Add new card:

```markdown
### Every Time You Indent (Lists, Code Blocks)

Use regular spaces (U+0020), never:
- Non-breaking spaces (U+00A0, &nbsp;)
- Tabs
- Other invisible characters
```

### 8. Update Version History

Add to the next version (v1.1.1):

```markdown
### v1.1.1 (2025-10-24)

- **CRITICAL FIX:** Added Rule 8 on character encoding and spacing
- Added Error Pattern 7 for non-breaking space issues
- Updated pre-generation checklist to verify proper spacing
- Updated post-generation validation to check for invisible characters
- Added detection and fix commands for nbsp issues
- Enhanced documentation for AI-generated markdown pitfalls
```

### 9. Add to "Advanced: Edge Cases" Section

Add to "Quick Edge Case Reference" list:

```markdown
9. **Non-breaking spaces:** Use only regular spaces (U+0020) for indentation; 
   nbsp (U+00A0) breaks list/code block nesting. Use `\u00A0` regex to find/replace.
```

### 10. Update resources/MARKDOWN_VALIDATION_TRAPS.md

Add a new major section:

```markdown
## Invisible Character Traps

### Non-Breaking Spaces in Indentation

**Problem:** Non-breaking space characters (U+00A0, `&nbsp;`) look identical to 
regular spaces but are not recognized as indentation by markdown parsers.

**Symptoms:**
- Code blocks don't nest properly in lists
- List numbering restarts unexpectedly (MD029)
- Items appear outside list context when rendered
- markdownlint reports missing blank lines around code blocks (MD031)

**Root Cause:**
- AI/LLM-generated content may use nbsp
- Copy/paste from websites (HTML uses nbsp)
- Word processor conversions

**Detection:**
```bash
# Find all nbsp characters
grep -n $'\u00A0' file.md

# Visual detection in VS Code
# View → Render Whitespace (regular spaces = dots, nbsp = different/absent)
```

**Fix:**
```bash
# Replace all nbsp with regular spaces
sed -i 's/\xc2\xa0/ /g' file.md  # UTF-8 encoding of U+00A0

# Or in VS Code: Find \u00A0, Replace with (space)
```

**Prevention:**
- Always verify indentation uses regular spaces
- Enable "Render Whitespace" in editor
- Run nbsp detection before committing markdown
- Configure editor to convert nbsp to regular spaces on save
```

## Summary of Changes

The update addresses:

1. **Documentation** - Explains the invisible character issue
2. **Prevention** - Pre-generation checklist item
3. **Detection** - Commands and visual methods
4. **Correction** - Find/replace patterns
5. **Validation** - Post-generation check
6. **Context** - Why this matters for AI generation
7. **Troubleshooting** - Error patterns and symptoms

## Priority

**HIGH** - This is a critical, non-obvious error that:
- Affects AI-generated content specifically
- Is invisible to visual inspection
- Causes confusing validation errors
- Is difficult to debug without knowing about it

## Implementation Notes

When updating SKILL.md:
1. Make these changes in order (affects multiple sections)
2. Update version number to v1.1.1
3. Add "CRITICAL FIX" tag to version history
4. Test with actual nbsp characters to verify detection methods work
5. Consider adding a test file with intentional nbsp errors

## Files to Update

1. `SKILL.md` - All sections listed above
2. `resources/MARKDOWN_VALIDATION_TRAPS.md` - New section on invisible characters
3. `CHANGELOG.md` - Document this as a critical fix
4. `tests/` - Add test cases with nbsp characters (intentional errors)
5. `examples/incorrect/` - Add example with nbsp indentation issue

This turns a bug discovery into an improved skill!
