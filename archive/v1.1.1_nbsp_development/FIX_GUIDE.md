# How to Fix MD029 and MD031 Errors in SKILL.md

## The Problem (Based on Your Screenshots)

**Line 498:** MD029 - Ordered list item prefix [Expected: 1; Actual: 3; Style: 1/1/1]
**Line 501:** MD031 - Fenced code blocks should be surrounded by blank lines

## Root Cause

The nested code block inside the numbered list is breaking the list sequence. This happens when:
1. The code block doesn't have a blank line after it (before the next list item)
2. The outer closing fence doesn't have proper blank lines around it

## The Fix

Find the "Lists with Code Blocks" section in your SKILL.md (around line 380-400) and ensure it looks EXACTLY like this:

````markdown
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
````

## Critical Requirements

1. **Blank line after "Second step with code:"** ✓
2. **3 spaces before the opening \`\`\`python fence** ✓
3. **3 spaces before the closing \`\`\` fence** ✓
4. **BLANK LINE after the closing fence** (before "3. Third step") ✓ ← THIS IS KEY!
5. **Blank line after "Done."** ✓
6. **Blank line before the closing \`\`\` of the outer block** ✓

## Step-by-Step Fix Instructions

1. Open SKILL.md in VS Code
2. Press `Ctrl+G` and type `498` to go to line 498
3. Look at the lines around 488-503
4. Find where "3. Third step" appears
5. **Ensure there is a BLANK LINE above it** (after the code block's closing ```)
6. Find the closing fence (might be ``` or ~~~)
7. **Ensure there are BLANK LINES before and after it**

## Visual Guide - Correct Format

```
### Lists with Code Blocks

Proper indentation maintains list context:
                                                ← blank line here
```markdown                                     ← opening fence with language
1. First step                                   ← list item 1
                                                ← blank line
2. Second step with code:                       ← list item 2
                                                ← blank line
   ```python                                    ← indented inner fence (3 spaces)
   def example():                               ← indented code (3 spaces)
       return True                              ← indented code (7 spaces)
   ```                                          ← indented closing fence (3 spaces)
                                                ← BLANK LINE REQUIRED HERE!
3. Third step                                   ← list item 3 continues
                                                ← blank line
Done.                                           ← end of list
                                                ← BLANK LINE REQUIRED HERE!
```                                             ← closing fence of outer block
                                                ← BLANK LINE REQUIRED HERE!
### Lists with Multiple Paragraphs              ← next section
```

## Quick Fix Command

If you're comfortable with regex, use Find & Replace in VS Code:

**Find:** `(   \`\`\`\n)(3\. Third step)`
**Replace:** `$1\n$2`

This adds a blank line between the closing fence and "3. Third step"

## Verify the Fix

After making changes, save the file and run:

```bash
cd ~/Projects/md_skill_md
markdownlint SKILL.md
```

You should see NO errors on lines 498 and 501.

## If Errors Persist

If you still see errors after the fix:

1. **Check for hidden characters:** Use VS Code's "Toggle Render Whitespace" (Ctrl+Shift+P → "View: Toggle Render Whitespace")
2. **Check line endings:** Ensure you're using LF (not CRLF) - look at bottom right of VS Code
3. **Reload the file:** Close and reopen SKILL.md in VS Code
4. **Clear VS Code cache:** Reload window (Ctrl+Shift+P → "Developer: Reload Window")

## Alternative: Replace the Entire Section

Copy this entire section and replace lines 380-420 in your SKILL.md:

````markdown
## Nesting and Complex Structures

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

Indent continuation paragraphs:

```markdown
- First item

- Second item with multiple paragraphs

  This is the continuation of the second item. It must be indented to maintain list context.

  Even more content in the second item.

- Third item

End.
```
````

## Common Mistake Pattern

**❌ WRONG** (causes MD029 + MD031):
````
   ```python
   def example():
       return True
   ```
3. Third step        ← No blank line above = list breaks!
````

**✅ CORRECT**:
````
   ```python
   def example():
       return True
   ```
                     ← BLANK LINE
3. Third step        ← List continues properly
````

Save this file for reference and follow the steps above to fix the errors.
