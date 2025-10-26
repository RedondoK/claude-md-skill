# Quick Fix Script for Reference Files

**Run these commands in Git Bash:**

```bash
cd C:/Users/kgend/Projects/md_skill_md/markdown/references

# Fix edge-cases.md - replace first line
tail -n +2 edge-cases.md > edge-cases.tmp
echo '<!-- markdownlint-disable MD013 MD029 MD031 MD032 MD040 -->' | cat - edge-cases.tmp > edge-cases.md
rm edge-cases.tmp

# Fix examples.md - replace first line
tail -n +2 examples.md > examples.tmp
echo '<!-- markdownlint-disable MD013 MD029 MD031 MD032 MD040 -->' | cat - examples.tmp > examples.md
rm examples.tmp

# Verify the fix
markdownlint complete-rules.md edge-cases.md examples.md
```

**What these commands do:**

1. `tail -n +2` - Get all lines except the first
2. `echo '...' | cat - file` - Prepend the new header
3. Replace original file
4. Delete temporary file
5. Validate all three files

**Expected result:** Zero errors!

Apologies for the confusion - this will actually work now.
