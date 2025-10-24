# Fixed Section for Lists with Code Blocks

Replace the section "### Lists with Code Blocks" (around line 380-395) with this:

```markdown
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
```

## What Changed

The fix adds a blank line after the closing ` ``` ` (after `return True`) and before `3. Third step`.

This is required because:
1. MD031 - Fenced code blocks must be surrounded by blank lines
2. MD029 - Without the blank line, the list sequence breaks and "3." starts a NEW list

## Visual Comparison

### ❌ WRONG (Current - Causes MD029 + MD031)
```
2. Second step with code:

   ```python
   def example():
       return True
   ```
3. Third step      ← Missing blank line above breaks list!
```

### ✅ CORRECT (Fixed)
```
2. Second step with code:

   ```python
   def example():
       return True
   ```
          ← BLANK LINE REQUIRED HERE
3. Third step
```

## How to Apply the Fix

1. Open SKILL.md in VS Code
2. Find the "Lists with Code Blocks" section (around line 380)
3. Locate the line that shows: `   ```  ` (closing fence)
4. Ensure there's a blank line after it before "3. Third step"
5. Save and re-run markdownlint

The example inside the code block demonstrates the CORRECT way to format lists with nested code blocks.
