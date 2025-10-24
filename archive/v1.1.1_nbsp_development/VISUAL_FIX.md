# Visual Fix: MD029 + MD031 Errors

## Your Current Code (WRONG - Causes Errors)

Based on your VS Code screenshots showing errors on lines 498 and 501:

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
3. Third step                    ← MD029 ERROR: No blank line above!

Done.
~~~                              ← MD031 ERROR: Missing blank lines!

### Lists with Multiple Paragraphs
````

## The Correct Code (FIXED - No Errors)

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

3. Third step                    ← ✓ Blank line above maintains list!

Done.
```

### Lists with Multiple Paragraphs
````

## What Changed

| Issue | Before | After | Why |
|-------|--------|-------|-----|
| MD029 | No blank line before "3. Third step" | Added blank line | Maintains list sequence |
| MD031 | Closing fence ~~~without blank lines | Changed to ``` with blank lines | Proper code block termination |
| Consistency | Mixed fence types | All use ``` | Standard practice (avoid ~~~) |

## Key Points

### Issue #1: Missing Blank Line (MD029)

The code block's closing fence MUST be followed by a blank line before the next list item:

```
   ```                 ← closing fence
                       ← BLANK LINE REQUIRED HERE
3. Third step          ← next list item
```

### Issue #2: Closing Fence Problems (MD031)

The outer code block's closing fence must:
1. Match the opening fence type (``` not ~~~)
2. Have blank lines before AND after it

```
Done.                  ← end of list content
                       ← BLANK LINE BEFORE FENCE
```                    ← closing fence (matches opening)
                       ← BLANK LINE AFTER FENCE
### Lists with...      ← next heading
```

## The Rule

When nesting code blocks inside numbered lists:

1. **Opening**: Blank line after list item text
2. **Indentation**: 3-4 spaces for inner fences
3. **Closing**: Blank line after code block's closing fence
4. **Continuation**: Next list item continues numbering

## Memory Aid

Think of it like breathing:

```
2. List item text
   (inhale - blank line)
   ```code
   content
   ```
   (exhale - blank line)
3. Next item continues
```

Always "breathe" (blank line) before and after code blocks!

## Quick Test

After fixing, run:

```bash
cd ~/Projects/md_skill_md
markdownlint SKILL.md | grep -E "^SKILL.md:498|^SKILL.md:501"
```

**Expected output:** (nothing - no errors on those lines)

If you see output, the errors still exist. If you see nothing, it's fixed!

## File Locations

- **Fix Guide:** `~/Projects/md_skill_md/FIX_GUIDE.md` (detailed instructions)
- **Auto-fix Script:** `~/Projects/md_skill_md/fix_md_errors.sh` (automated fix)
- **This File:** `~/Projects/md_skill_md/VISUAL_FIX.md` (visual comparison)

Choose your preferred method to apply the fix!
