# Phase 6: Untracked Files Management Plan

**Date:** 2025-10-24
**Task:** Decide what to keep, delete, or archive

## Untracked Files Analysis

### Current Untracked Files

```text
ACTION_PLAN_NBSP.md
FIX_GUIDE.md
PHASE_5_COMPLETE.md
SKILL_BACKUP_PRE_NBSP.md
SKILL_FIXED.md
SKILL_UPDATE_NBSP.md
VISUAL_FIX.md
fix_md_errors.sh
phase6/
temp_skill_test.md
test_nbsp_methods.sh
```

## File-by-File Recommendations

### 1. PHASE_5_COMPLETE.md

**Type:** Phase documentation
**Status:** ✅ **KEEP - ADD TO GIT**
**Reason:** Official phase completion documentation

**Action:**

```bash
git add PHASE_5_COMPLETE.md
```

### 2. fix_md_errors.sh

**Type:** Utility script
**Status:** ✅ **KEEP - ADD TO GIT**
**Reason:** Useful utility for fixing markdown violations

**Action:**

```bash
git add fix_md_errors.sh
```

### 3. test_nbsp_methods.sh

**Type:** Utility script
**Status:** ✅ **KEEP - ADD TO GIT**
**Reason:** Useful for testing nbsp detection methods

**Action:**

```bash
git add test_nbsp_methods.sh
```

### 4. temp_skill_test.md

**Type:** Temporary test file
**Status:** ❌ **DELETE**
**Reason:** Temporary file not needed

**Action:**

```bash
rm temp_skill_test.md
```

### 5. Development Working Files

**Files:**

- ACTION_PLAN_NBSP.md
- FIX_GUIDE.md
- SKILL_BACKUP_PRE_NBSP.md
- SKILL_FIXED.md
- SKILL_UPDATE_NBSP.md
- VISUAL_FIX.md

**Status:** 📦 **ARCHIVE**
**Reason:** Historical development artifacts - useful for reference but not needed
in main repo

**Action:**

```bash
# Create archive directory
mkdir -p archive/v1.1.1_nbsp_development

# Move files to archive
mv ACTION_PLAN_NBSP.md archive/v1.1.1_nbsp_development/
mv FIX_GUIDE.md archive/v1.1.1_nbsp_development/
mv SKILL_BACKUP_PRE_NBSP.md archive/v1.1.1_nbsp_development/
mv SKILL_FIXED.md archive/v1.1.1_nbsp_development/
mv SKILL_UPDATE_NBSP.md archive/v1.1.1_nbsp_development/
mv VISUAL_FIX.md archive/v1.1.1_nbsp_development/

# Add archive directory to git
git add archive/
```

### 6. phase6/ directory

**Type:** Working directory (created by me today)
**Status:** ⚠️ **USER DECISION**
**Reason:** Contains Phase 6 working documents

**Options:**

**Option A - Keep and add to git:**

```bash
git add phase6/
```

**Pros:** Complete documentation of Phase 6 process
**Cons:** Adds extra files to repo

**Option B - Archive it:**

```bash
mv phase6/ archive/
git add archive/phase6/
```

**Pros:** Keeps history but out of main directory
**Cons:** Less accessible

**Option C - Delete it (keep Phase 6 docs in root):**

```bash
# First extract any useful docs to root
cp phase6/PHASE_6_PROGRESS.md ./
git add PHASE_6_PROGRESS.md

# Then delete directory
rm -rf phase6/
```

**Pros:** Cleaner root directory
**Cons:** Loses detailed working notes

**My Recommendation:** Option A - Keep it. Phase 6 documentation is useful.

## Recommended Workflow

### Step 1: Add Important Files

```bash
cd /c/Users/kgend/Projects/md_skill_md

# Add phase documentation
git add PHASE_5_COMPLETE.md

# Add utility scripts
git add fix_md_errors.sh
git add test_nbsp_methods.sh
```

### Step 2: Create Archive Directory

```bash
# Create archive structure
mkdir -p archive/v1.1.1_nbsp_development
```

### Step 3: Move Development Files to Archive

```bash
# Move working files
mv ACTION_PLAN_NBSP.md archive/v1.1.1_nbsp_development/
mv FIX_GUIDE.md archive/v1.1.1_nbsp_development/
mv SKILL_BACKUP_PRE_NBSP.md archive/v1.1.1_nbsp_development/
mv SKILL_FIXED.md archive/v1.1.1_nbsp_development/
mv SKILL_UPDATE_NBSP.md archive/v1.1.1_nbsp_development/
mv VISUAL_FIX.md archive/v1.1.1_nbsp_development/

# Add archive to git
git add archive/
```

### Step 4: Delete Temporary Files

```bash
# Remove temp test file
rm temp_skill_test.md
```

### Step 5: Handle phase6/ Directory

**If keeping (recommended):**

```bash
git add phase6/
```

**If archiving:**

```bash
mv phase6/ archive/
git add archive/phase6/
```

**If deleting:**

```bash
# Extract useful docs first
cp phase6/PHASE_6_PROGRESS.md ./
git add PHASE_6_PROGRESS.md

# Delete directory
rm -rf phase6/
```

### Step 6: Add Updated Documentation

```bash
# Add all the files we just updated
git add README.md
git add ROADMAP.md
git add USAGE.md
git add INTEGRATION.md
git add QUICK_REFERENCE.md
git add PROJECT-STRUCTURE.md
```

### Step 7: Check Status

```bash
git status
```

**Expected Result:**

```text
Changes to be committed:
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
  new file:   test_nbsp_methods.sh
  new file:   phase6/PHASE_6_PROGRESS.md
  new file:   phase6/PHASE_6_STATUS_CHECK.md
```

## Alternative: Minimal Approach

If you want to keep the repo minimal:

```bash
# Add only critical phase documentation
git add PHASE_5_COMPLETE.md

# Add updated docs
git add README.md ROADMAP.md USAGE.md INTEGRATION.md QUICK_REFERENCE.md PROJECT-STRUCTURE.md

# Delete everything else
rm ACTION_PLAN_NBSP.md FIX_GUIDE.md SKILL_BACKUP_PRE_NBSP.md SKILL_FIXED.md SKILL_UPDATE_NBSP.md VISUAL_FIX.md temp_skill_test.md
rm -rf phase6/

# Optionally keep scripts
git add fix_md_errors.sh test_nbsp_methods.sh
```

## Summary of Changes

### Files to Add (Minimum)

1. PHASE_5_COMPLETE.md
2. README.md (updated)
3. ROADMAP.md (updated)
4. USAGE.md (updated)
5. INTEGRATION.md (updated)
6. QUICK_REFERENCE.md (updated)
7. PROJECT-STRUCTURE.md (updated)

### Files to Add (Recommended)

8. fix_md_errors.sh
9. test_nbsp_methods.sh
10. archive/ (with development artifacts)
11. phase6/ (working documentation)

### Files to Delete

1. temp_skill_test.md

### Archive Candidates

1. ACTION_PLAN_NBSP.md
2. FIX_GUIDE.md
3. SKILL_BACKUP_PRE_NBSP.md
4. SKILL_FIXED.md
5. SKILL_UPDATE_NBSP.md
6. VISUAL_FIX.md

## User Decision Required

**Question 1:** Do you want to archive the development working files, or just
delete them?

- **Archive** = Keep history in archive/ directory
- **Delete** = Remove permanently

**Question 2:** What should we do with the phase6/ directory?

- **Keep** = Add to git (recommended)
- **Archive** = Move to archive/
- **Delete** = Remove after extracting key docs

**Question 3:** Should we keep the utility scripts (fix_md_errors.sh,
test_nbsp_methods.sh)?

- **Keep** = Useful for future maintenance
- **Delete** = Keep repo minimal

## My Recommendations

✅ **Keep and add to git:**

- PHASE_5_COMPLETE.md
- fix_md_errors.sh
- test_nbsp_methods.sh
- phase6/ directory
- All updated documentation

📦 **Archive (historical reference):**

- ACTION_PLAN_NBSP.md
- FIX_GUIDE.md
- SKILL_BACKUP_PRE_NBSP.md
- SKILL_FIXED.md
- SKILL_UPDATE_NBSP.md
- VISUAL_FIX.md

❌ **Delete:**

- temp_skill_test.md

**Rationale:** This keeps the useful artifacts while archiving the development
process documentation for future reference.

---

**Ready to proceed?** Let me know your preferences for the untracked files and
I'll provide the exact commands to execute.
