# Markdownlint Fix Guide for Reference Files

**Date:** 2025-10-26  
**Issue:** Reference files contain intentional error examples that trigger
markdownlint violations

## Understanding the Problem

The reference files (`complete-rules.md`, `edge-cases.md`, `examples.md`) are
**teaching documents** that show both correct and incorrect markdown patterns.
The "incorrect" examples intentionally violate markdownlint rules to
demonstrate what NOT to do.

## Solution: Two Approaches

### Option 1: Wrap Intentional Errors (Recommended)

Add `<!-- markdownlint-disable -->` and `<!-- markdownlint-enable -->` comments
around each intentional error example.

### Option 2: Configure Lenient Rules for Reference Files

Create `.markdownlintrc` specifically for reference files or use inline config.

## Recommendation

**Use Option 1** for intentional error examples.  
**Use Option 2** for MD013 (line length) in reference files - these are
detailed explanations that benefit from longer lines.

## Quick Fix Commands

### Step 1: Allow longer lines in reference files

Add this to the top of each reference file:

```markdown
<!-- markdownlint-configure-file { "MD013": { "line_length": 120 } } -->
```

Or create `markdown/references/.markdownlintrc`:

```json
{
  "extends": "../../.markdownlintrc",
  "MD013": {
    "line_length": 120,
    "code_blocks": false,
    "tables": false
  },
  "MD029": false
}
```

### Step 2: Automated fix for some issues

```bash
cd C:/Users/kgend/Projects/md_skill_md/markdown/references

# Auto-fix what's possible (but this will break intentional errors!)
# markdownlint --fix *.md

# Better: Fix only safe rules
markdownlint --fix --disable MD031 MD032 MD040 MD029 *.md
```

## Manual Fixes Needed

Since auto-fix would break intentional error examples, here's what needs manual
attention:

### complete-rules.md

**Line 324-326** - Intentional error showing code without blank lines:

```markdown
### Incorrect Example

<!-- markdownlint-disable MD031 MD040 -->

```markdown
Some text
```javascript
const x = 1;
```
More text
```

<!-- markdownlint-enable MD031 MD040 -->
```

**Line 338-340** - Same pattern, repeat fix

**Line 357-361** - Same pattern, repeat fix

**Line 455-465** - Ordered list numbering is intentional example:

```markdown
<!-- markdownlint-disable MD029 -->

5. MD004 - Consistent list style
6. MD047 - File ends with newline
7. MD003 - Heading style consistency
8. MD040 - Code block language

<!-- markdownlint-enable MD029 -->
```

### edge-cases.md

**Line 72-82** - Intentional nbsp example:

```markdown
<!-- markdownlint-disable MD032 MD031 MD040 -->

```markdown
- List item

   ```python
   code()
   ```

- Next item (will be renumbered as item 1!)
```

<!-- markdownlint-enable MD032 MD031 MD040 -->
```

**Line 164-174** - Intentional code nesting example, repeat fix

### examples.md

**Line 83-89** - Intentional list break example:

```markdown
### ❌ Incorrect: Code Block Breaks List

<!-- markdownlint-disable MD031 MD032 MD040 MD029 -->

```markdown
1. First step
2. Second step with code:
```python
code here
```
3. Third step
```

<!-- markdownlint-enable MD031 MD032 MD040 MD029 -->
```

**Line 440-449** - Intentional nbsp example, repeat fix

## Automated Fix Script

I'll create a Python script to add these comments automatically.

## Alternative: Simpler Solution

**Just configure markdownlint to be lenient on reference files.**

Create `markdown/references/.markdownlintrc`:

```json
{
  "default": true,
  "MD013": {
    "line_length": 120,
    "code_blocks": false,
    "tables": false
  },
  "MD029": false,
  "MD031": false,
  "MD032": false,
  "MD040": false
}
```

This tells markdownlint: "Reference files are special - they contain examples
of violations, so don't enforce these rules."

## My Recommendation

**Use the lenient config approach** for reference files because:

1. They're teaching documents, not production markdown
2. They intentionally show incorrect patterns
3. Wrapping every example adds clutter
4. The SKILL.md (the actual guide) is already clean

**Action:** Create `.markdownlintrc` in the references folder with lenient
rules.

---

**Next step:** Tell me which approach you prefer and I'll implement it.
