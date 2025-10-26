# Phase 3 Test Execution Guide

**Purpose:** Step-by-step instructions for executing Phase 3 tests  
**Date:** 2025-10-22  
**For:** Windows 11 Pro system

## Prerequisites Check

Before running tests, verify:

### 1. Check markdownlint Installation

Open Command Prompt or PowerShell and run:

```cmd
markdownlint --version
```

**Expected output:** Version number (e.g., `0.33.0`)

**If not installed:**

```cmd
npm install -g markdownlint-cli
```

### 2. Verify Project Location

```cmd
cd C:\Users\kgend\Projects\md_skill_md
dir tests
```

**Expected:** You should see `flawed`, `perfect`, and `validation` directories.

### 3. Check Test Files

**Flawed documents (should be 6 files):**

```cmd
dir tests\flawed
```

**Perfect documents (should be 5 files):**

```cmd
dir tests\perfect
```

## Quick Test Execution

### Option 1: Run Automated Test Suite (Recommended)

Open Command Prompt in the project root:

```cmd
cd C:\Users\kgend\Projects\md_skill_md
tests\run-tests.bat
```

This will:

- Test all 6 flawed documents (should find violations)
- Test all 5 perfect documents (should find no violations)
- Generate a timestamped results file
- Display summary on screen

**Results location:**

```text
tests\validation\results\test-run-YYYYMMDD_HHMMSS.txt
```

### Option 2: Manual Step-by-Step Testing

If you prefer to run tests individually for detailed observation:

#### Test Flawed Documents

Each command should produce violations:

```cmd
cd C:\Users\kgend\Projects\md_skill_md

markdownlint tests\flawed\md001-heading-increment.md
markdownlint tests\flawed\md004-inconsistent-list-markers.md
markdownlint tests\flawed\md022-headings-without-blanks.md
markdownlint tests\flawed\md031-md040-code-blocks.md
markdownlint tests\flawed\md032-lists-without-blanks.md
markdownlint tests\flawed\multiple-violations.md
```

**Expected:** Each file should show violation messages with line numbers.

#### Test Perfect Documents

Each command should produce NO output (clean pass):

```cmd
markdownlint tests\perfect\perfect-code-blocks.md
markdownlint tests\perfect\perfect-comprehensive.md
markdownlint tests\perfect\perfect-heading-increment.md
markdownlint tests\perfect\perfect-headings.md
markdownlint tests\perfect\perfect-lists.md
```

**Expected:** No output = success. Files are clean.

## Understanding Test Results

### Successful Flawed Document Test

**Example output for md032-lists-without-blanks.md:**

```text
tests\flawed\md032-lists-without-blanks.md:5 MD032/blanks-around-lists Lists should be surrounded by blank lines
tests\flawed\md032-lists-without-blanks.md:13 MD032/blanks-around-lists Lists should be surrounded by blank lines
tests\flawed\md032-lists-without-blanks.md:13 MD004/ul-style Unordered list style
tests\flawed\md032-lists-without-blanks.md:21 MD032/blanks-around-lists Lists should be surrounded by blank lines
tests\flawed\md032-lists-without-blanks.md:29 MD032/blanks-around-lists Lists should be surrounded by blank lines
```

This means:

- ✅ Test PASSED - violations were correctly detected
- Line numbers show where violations occur
- Rule codes (MD032, MD004) identify the violation types

### Successful Perfect Document Test

**Example output for perfect-lists.md:**

```text
(no output)
```

This means:

- ✅ Test PASSED - file is clean
- No violations detected
- File is correctly formatted

### Failed Flawed Document Test

If a flawed document produces no output:

```text
(no output)
```

This means:

- ❌ Test FAILED - expected violations were NOT detected
- File might have been accidentally fixed
- Or test file doesn't actually contain violations

### Failed Perfect Document Test

If a perfect document shows violations:

```text
tests\perfect\perfect-lists.md:5 MD032/blanks-around-lists Lists should be surrounded by blank lines
```

This means:

- ❌ Test FAILED - unexpected violations detected
- File might have formatting errors
- Or SKILL.md guidance might be incorrect

## Detailed Test Scenarios

### Scenario 1: All Tests Pass (Best Case)

**Console output:**

```text
========================================
GFM Skill Test Suite
Date: 10/22/2025 14:30:22
========================================

markdownlint version: 0.33.0

Testing Flawed Documents (should have violations)...
------------------------------------------------------
[PASS] md001-heading-increment.md - has violations as expected
[PASS] md004-inconsistent-list-markers.md - has violations as expected
[PASS] md022-headings-without-blanks.md - has violations as expected
[PASS] md031-md040-code-blocks.md - has violations as expected
[PASS] md032-lists-without-blanks.md - has violations as expected
[PASS] multiple-violations.md - has violations as expected

Testing Perfect Documents (should have no violations)...
---------------------------------------------------------
[PASS] perfect-code-blocks.md - no violations
[PASS] perfect-comprehensive.md - no violations
[PASS] perfect-heading-increment.md - no violations
[PASS] perfect-headings.md - no violations
[PASS] perfect-lists.md - no violations

========================================
TEST SUMMARY
========================================
Flawed Documents: 6 passed, 0 failed
Perfect Documents: 5 passed, 0 failed
Total: 11/11 tests passed
Success Rate: 100%

Results saved to: tests\validation\results\test-run-20251022_143022.txt
```

**Action:** Proceed to complete Phase 3. No skill improvements needed.

### Scenario 2: Some Perfect Documents Fail

**Example:**

```text
[FAIL] perfect-lists.md - has unexpected violations
```

**Possible causes:**

1. File actually has formatting errors
2. SKILL.md guidance is incorrect
3. markdownlint config is too strict

**Action:**

1. Open the failing file in VSCode
2. Check for actual violations
3. Compare against SKILL.md examples
4. If file is correct, investigate markdownlint config
5. If file is wrong, fix it
6. If SKILL.md is wrong, update it

### Scenario 3: Some Flawed Documents Pass

**Example:**

```text
[FAIL] md032-lists-without-blanks.md - expected violations, got none
```

**Possible causes:**

1. File was accidentally fixed
2. File doesn't actually contain violations
3. markdownlint config is too lenient

**Action:**

1. Open the file and verify it contains violations
2. Manually run: `markdownlint tests\flawed\md032-lists-without-blanks.md`
3. Check if violations are shown
4. If no violations, recreate the flawed file
5. Document the issue

## Recording Results

After running tests, record results in `PHASE_3_EXECUTION.md`:

### Template for Results Entry

```markdown
### Run 1: [Date/Time]

**markdownlint Version:** [version]

**Results:**
- Flawed Tests: [X passed / Y failed]
- Perfect Tests: [X passed / Y failed]
- Success Rate: [percentage]%

**Status:** [PASS / FAIL]

**Violations Found in Flawed Documents:**
- md001-heading-increment.md: [count] violations
- md004-inconsistent-list-markers.md: [count] violations
- md022-headings-without-blanks.md: [count] violations
- md031-md040-code-blocks.md: [count] violations
- md032-lists-without-blanks.md: [count] violations
- multiple-violations.md: [count] violations

**Issues Found (if any):**
[List any unexpected results]

**Action Items:**
[What needs to be fixed]
```

## Troubleshooting

### Issue: "markdownlint is not recognized"

**Solution:**

```cmd
npm install -g markdownlint-cli
```

Then restart your terminal.

### Issue: "npm is not recognized"

**Solution:** Install Node.js from <https://nodejs.org/>

### Issue: Results file not created

**Check:**

```cmd
dir tests\validation\results
```

**If directory missing:**

```cmd
mkdir tests\validation\results
```

### Issue: Permission denied

**Solution:** Run Command Prompt as Administrator:

1. Right-click Command Prompt
2. Select "Run as administrator"
3. Navigate to project and run tests

### Issue: Tests show different violations than expected

**Check:**

1. Is there a `.markdownlintrc` file in the project?
2. Run: `markdownlint --help` to see default rules
3. Compare actual vs expected violations in TEST-PLAN.md

## Next Steps After Testing

### If All Tests Pass (100%)

1. Update `PHASE_3_EXECUTION.md` with results
2. Create `PHASE_3_COMPLETE.md` summary
3. Document success metrics
4. Proceed to Phase 4: Documentation

### If Some Tests Fail

1. Document which tests failed
2. Analyze root cause
3. Fix issues (either files or SKILL.md)
4. Update version numbers
5. Re-run tests
6. Repeat until 100% pass rate

## Validation Checklist

After test execution, verify:

- [ ] All 6 flawed documents triggered violations
- [ ] All 5 perfect documents passed cleanly
- [ ] Results file was generated
- [ ] Results are documented in PHASE_3_EXECUTION.md
- [ ] Success rate calculated
- [ ] Action items identified (if needed)
- [ ] Next steps are clear

## Results Analysis Template

Use this template to analyze detailed results:

```markdown
## Test Results Analysis

### Test File: [filename]

**Expected Behavior:** [what should happen]
**Actual Behavior:** [what did happen]
**Status:** [PASS / FAIL]

**Violations Detected:**
1. [Line number] [Rule code] [Description]
2. [Line number] [Rule code] [Description]

**Analysis:**
[Why did this pass/fail?]

**Action Required:**
[What needs to be done, if anything]
```

## Success Criteria

Phase 3 is complete when:

- [ ] All automated tests pass (11/11)
- [ ] Results are documented
- [ ] SKILL.md is validated
- [ ] No outstanding issues
- [ ] Ready for Phase 4

## Contact Information

If you encounter issues not covered in this guide:

1. Check `tests/README.md` for additional info
2. Review `tests/validation/TEST-PLAN.md` for expected results
3. Examine individual test files
4. Check markdownlint documentation

## Time Estimate

**Quick test (automated):** 1-2 minutes  
**Manual detailed testing:** 10-15 minutes  
**Results documentation:** 5-10 minutes  
**Total:** 15-30 minutes for first complete run

## Files You'll Need

Before starting:

- This guide: `PHASE_3_TEST_GUIDE.md`
- Execution log: `PHASE_3_EXECUTION.md`
- Test plan: `tests/validation/TEST-PLAN.md`
- Skill document: `SKILL.md`

## Ready to Begin?

1. Open Command Prompt
2. Navigate to project: `cd C:\Users\kgend\Projects\md_skill_md`
3. Run: `tests\run-tests.bat`
4. Review results
5. Document findings in `PHASE_3_EXECUTION.md`

Good luck! 🚀
