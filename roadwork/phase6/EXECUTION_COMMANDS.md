# Phase 6: File Management - Execution Commands

**Date:** 2025-10-24
**Status:** Ready to Execute

## Commands to Execute in Git Bash

Copy and paste these commands into Git Bash. They are safe to run.

### Step 1: Navigate to Project Directory

```bash
cd /c/Users/kgend/Projects/md_skill_md
```

### Step 2: Create Archive Directory

```bash
mkdir -p archive/v1.1.1_nbsp_development
```

### Step 3: Move Development Files to Archive

```bash
mv ACTION_PLAN_NBSP.md archive/v1.1.1_nbsp_development/
mv FIX_GUIDE.md archive/v1.1.1_nbsp_development/
mv SKILL_BACKUP_PRE_NBSP.md archive/v1.1.1_nbsp_development/
mv SKILL_FIXED.md archive/v1.1.1_nbsp_development/
mv SKILL_UPDATE_NBSP.md archive/v1.1.1_nbsp_development/
mv VISUAL_FIX.md archive/v1.1.1_nbsp_development/
```

### Step 4: Delete Temporary Files

```bash
rm temp_skill_test.md
```

### Step 5: Add Updated Documentation to Git

```bash
git add README.md
git add ROADMAP.md
git add USAGE.md
git add INTEGRATION.md
git add QUICK_REFERENCE.md
git add PROJECT-STRUCTURE.md
```

### Step 6: Add New Files to Git

```bash
# Phase documentation
git add PHASE_5_COMPLETE.md

# Utility scripts
git add fix_md_errors.sh
git add test_nbsp_methods.sh

# Archive directory
git add archive/

# Phase 6 working directory
git add phase6/
```

### Step 7: Check Git Status

```bash
git status
```

**Expected output:** You should see all the files staged for commit.

### Step 8: Review Staged Changes (Optional)

```bash
# See what changed in updated files
git diff --cached README.md
git diff --cached ROADMAP.md
```

Press `q` to exit the diff view.

---

## All Commands in One Block (Copy & Paste)

```bash
# Navigate to project
cd /c/Users/kgend/Projects/md_skill_md

# Create archive
mkdir -p archive/v1.1.1_nbsp_development

# Move development files to archive
mv ACTION_PLAN_NBSP.md archive/v1.1.1_nbsp_development/
mv FIX_GUIDE.md archive/v1.1.1_nbsp_development/
mv SKILL_BACKUP_PRE_NBSP.md archive/v1.1.1_nbsp_development/
mv SKILL_FIXED.md archive/v1.1.1_nbsp_development/
mv SKILL_UPDATE_NBSP.md archive/v1.1.1_nbsp_development/
mv VISUAL_FIX.md archive/v1.1.1_nbsp_development/

# Delete temp files
rm temp_skill_test.md

# Add updated documentation
git add README.md ROADMAP.md USAGE.md INTEGRATION.md QUICK_REFERENCE.md PROJECT-STRUCTURE.md

# Add new files
git add PHASE_5_COMPLETE.md fix_md_errors.sh test_nbsp_methods.sh archive/ phase6/

# Check status
git status
```

---

## What Will Happen

### Files Being Staged for Commit

**Modified files (6):**
- README.md (updated to v1.1.1)
- ROADMAP.md (updated to v1.1.1)
- USAGE.md (updated to v1.1.1)
- INTEGRATION.md (updated to v1.1.1)
- QUICK_REFERENCE.md (updated to v1.1.1)
- PROJECT-STRUCTURE.md (updated to v1.1.1)

**New files (added):**
- PHASE_5_COMPLETE.md
- fix_md_errors.sh
- test_nbsp_methods.sh
- archive/v1.1.1_nbsp_development/ACTION_PLAN_NBSP.md
- archive/v1.1.1_nbsp_development/FIX_GUIDE.md
- archive/v1.1.1_nbsp_development/SKILL_BACKUP_PRE_NBSP.md
- archive/v1.1.1_nbsp_development/SKILL_FIXED.md
- archive/v1.1.1_nbsp_development/SKILL_UPDATE_NBSP.md
- archive/v1.1.1_nbsp_development/VISUAL_FIX.md
- phase6/PHASE_6_STATUS_CHECK.md
- phase6/PHASE_6_PROGRESS.md
- phase6/FILE_MANAGEMENT_PLAN.md
- phase6/DOCUMENTATION_UPDATES_COMPLETE.md
- phase6/EXECUTION_COMMANDS.md (this file)

**Deleted files:**
- temp_skill_test.md

### Git Status Output Should Look Like

```text
On branch main
Your branch is up to date with 'origin/main'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   INTEGRATION.md
        modified:   PROJECT-STRUCTURE.md
        modified:   QUICK_REFERENCE.md
        modified:   README.md
        modified:   ROADMAP.md
        modified:   USAGE.md
        new file:   PHASE_5_COMPLETE.md
        new file:   archive/v1.1.1_nbsp_development/ACTION_PLAN_NBSP.md
        new file:   archive/v1.1.1_nbsp_development/FIX_GUIDE.md
        new file:   archive/v1.1.1_nbsp_development/SKILL_BACKUP_PRE_NBSP.md
        new file:   archive/v1.1.1_nbsp_development/SKILL_FIXED.md
        new file:   archive/v1.1.1_nbsp_development/SKILL_UPDATE_NBSP.md
        new file:   archive/v1.1.1_nbsp_development/VISUAL_FIX.md
        new file:   fix_md_errors.sh
        new file:   phase6/DOCUMENTATION_UPDATES_COMPLETE.md
        new file:   phase6/EXECUTION_COMMANDS.md
        new file:   phase6/FILE_MANAGEMENT_PLAN.md
        new file:   phase6/PHASE_6_PROGRESS.md
        new file:   phase6/PHASE_6_STATUS_CHECK.md
        new file:   test_nbsp_methods.sh
```

---

## After Execution

Once you've executed these commands and verified with `git status`, let me know and we'll proceed to:

**Option A: Validation Testing**

Run markdownlint on all updated files to ensure zero violations before committing.

---

**Ready to execute!** Copy the command block above into Git Bash and run it.
