# Test Suite Validation Plan

**Version:** 1.0.0  
**Date:** 2025-10-22  
**Purpose:** Document test cases, expected results, and validation procedures

## Overview

This test suite validates the GFM skill's ability to prevent markdownlint violations. Each test case includes:

- Test file location
- Expected violations
- Validation command
- Success criteria

## Test Categories

### Category 1: Flawed Documents

Intentionally broken files that should trigger specific markdownlint violations.

### Category 2: Perfect Documents

Correctly formatted files that should pass markdownlint with zero violations.

### Category 3: Skill-Generated Documents

New documents created using the skill that should be perfect.

## Flawed Document Test Cases

### Test Case 1: MD032 - Lists Without Blank Lines

**File:** `tests/flawed/md032-lists-without-blanks.md`

**Expected Violations:**

- MD032: Multiple instances of lists without surrounding blank lines
- MD004: Inconsistent list markers (mixes `-` and `*`)

**Validation Command:**

```bash
markdownlint tests/flawed/md032-lists-without-blanks.md
```

**Expected Output:**

```text
tests/flawed/md032-lists-without-blanks.md:5 MD032/blanks-around-lists Lists should be surrounded by blank lines
tests/flawed/md032-lists-without-blanks.md:13 MD032/blanks-around-lists Lists should be surrounded by blank lines
tests/flawed/md032-lists-without-blanks.md:13 MD004/ul-style Unordered list style
tests/flawed/md032-lists-without-blanks.md:21 MD032/blanks-around-lists Lists should be surrounded by blank lines
tests/flawed/md032-lists-without-blanks.md:29 MD032/blanks-around-lists Lists should be surrounded by blank lines
```

**Success Criteria:** All expected violations are detected by markdownlint.

### Test Case 2: MD022 - Headings Without Blank Lines

**File:** `tests/flawed/md022-headings-without-blanks.md`

**Expected Violations:**

- MD022: Multiple instances of headings without surrounding blank lines

**Validation Command:**

```bash
markdownlint tests/flawed/md022-headings-without-blanks.md
```

**Expected Output:**

```text
tests/flawed/md022-headings-without-blanks.md:3 MD022/blanks-around-headings Headings should be surrounded by blank lines
tests/flawed/md022-headings-without-blanks.md:6 MD022/blanks-around-headings Headings should be surrounded by blank lines
tests/flawed/md022-headings-without-blanks.md:9 MD022/blanks-around-headings Headings should be surrounded by blank lines
tests/flawed/md022-headings-without-blanks.md:12 MD022/blanks-around-headings Headings should be surrounded by blank lines
tests/flawed/md022-headings-without-blanks.md:14 MD022/blanks-around-headings Headings should be surrounded by blank lines
```

**Success Criteria:** All expected violations are detected by markdownlint.

### Test Case 3: MD031 and MD040 - Code Block Issues

**File:** `tests/flawed/md031-md040-code-blocks.md`

**Expected Violations:**

- MD031: Code blocks without surrounding blank lines
- MD040: Code blocks without language identifiers

**Validation Command:**

```bash
markdownlint tests/flawed/md031-md040-code-blocks.md
```

**Expected Output:**

```text
tests/flawed/md031-md040-code-blocks.md:6 MD031/blanks-around-fences Fenced code blocks should be surrounded by blank lines
tests/flawed/md031-md040-code-blocks.md:6 MD040/fenced-code-language Fenced code blocks should have a language specified
tests/flawed/md031-md040-code-blocks.md:13 MD031/blanks-around-fences Fenced code blocks should be surrounded by blank lines
tests/flawed/md031-md040-code-blocks.md:13 MD040/fenced-code-language Fenced code blocks should have a language specified
tests/flawed/md031-md040-code-blocks.md:21 MD031/blanks-around-fences Fenced code blocks should be surrounded by blank lines
tests/flawed/md031-md040-code-blocks.md:28 MD040/fenced-code-language Fenced code blocks should have a language specified
```

**Success Criteria:** All expected violations are detected by markdownlint.

### Test Case 4: MD001 - Heading Level Increment

**File:** `tests/flawed/md001-heading-increment.md`

**Expected Violations:**

- MD001: Heading levels that skip increments

**Validation Command:**

```bash
markdownlint tests/flawed/md001-heading-increment.md
```

**Expected Output:**

```text
tests/flawed/md001-heading-increment.md:3 MD001/heading-increment Heading levels should only increment by one level at a time
tests/flawed/md001-heading-increment.md:11 MD001/heading-increment Heading levels should only increment by one level at a time
tests/flawed/md001-heading-increment.md:17 MD001/heading-increment Heading levels should only increment by one level at a time
```

**Success Criteria:** All expected violations are detected by markdownlint.

### Test Case 5: MD004 - Inconsistent List Markers

**File:** `tests/flawed/md004-inconsistent-list-markers.md`

**Expected Violations:**

- MD004: Mixed list marker styles

**Validation Command:**

```bash
markdownlint tests/flawed/md004-inconsistent-list-markers.md
```

**Expected Output:**

```text
tests/flawed/md004-inconsistent-list-markers.md:7 MD004/ul-style Unordered list style
tests/flawed/md004-inconsistent-list-markers.md:8 MD004/ul-style Unordered list style
tests/flawed/md004-inconsistent-list-markers.md:16 MD004/ul-style Unordered list style
tests/flawed/md004-inconsistent-list-markers.md:22 MD004/ul-style Unordered list style
tests/flawed/md004-inconsistent-list-markers.md:23 MD004/ul-style Unordered list style
```

**Success Criteria:** All expected violations are detected by markdownlint.

### Test Case 6: Multiple Violations

**File:** `tests/flawed/multiple-violations.md`

**Expected Violations:**

- MD022: Headings without blank lines
- MD032: Lists without blank lines
- MD031: Code blocks without blank lines
- MD040: Code blocks without language
- MD004: Inconsistent list markers
- MD001: Heading level skips

**Validation Command:**

```bash
markdownlint tests/flawed/multiple-violations.md
```

**Expected Output:**

```text
Multiple violations from different rules
```

**Success Criteria:** All violation types are detected by markdownlint.

## Perfect Document Test Cases

### Test Case 7: Perfect Lists

**File:** `tests/perfect/perfect-lists.md`

**Expected Violations:** None

**Validation Command:**

```bash
markdownlint tests/perfect/perfect-lists.md
```

**Expected Output:**

```text
(No output - file passes)
```

**Success Criteria:** Zero violations reported.

### Test Case 8: Perfect Headings

**File:** `tests/perfect/perfect-headings.md`

**Expected Violations:** None

**Validation Command:**

```bash
markdownlint tests/perfect/perfect-headings.md
```

**Expected Output:**

```text
(No output - file passes)
```

**Success Criteria:** Zero violations reported.

### Test Case 9: Perfect Code Blocks

**File:** `tests/perfect/perfect-code-blocks.md`

**Expected Violations:** None

**Validation Command:**

```bash
markdownlint tests/perfect/perfect-code-blocks.md
```

**Expected Output:**

```text
(No output - file passes)
```

**Success Criteria:** Zero violations reported.

### Test Case 10: Perfect Heading Increment

**File:** `tests/perfect/perfect-heading-increment.md`

**Expected Violations:** None

**Validation Command:**

```bash
markdownlint tests/perfect/perfect-heading-increment.md
```

**Expected Output:**

```text
(No output - file passes)
```

**Success Criteria:** Zero violations reported.

### Test Case 11: Perfect Comprehensive

**File:** `tests/perfect/perfect-comprehensive.md`

**Expected Violations:** None

**Validation Command:**

```bash
markdownlint tests/perfect/perfect-comprehensive.md
```

**Expected Output:**

```text
(No output - file passes)
```

**Success Criteria:** Zero violations reported.

## Validation Procedure

### Step 1: Validate Flawed Documents

Run markdownlint on all flawed documents:

```bash
markdownlint tests/flawed/*.md
```

**Expected Result:** All expected violations are detected and reported.

### Step 2: Validate Perfect Documents

Run markdownlint on all perfect documents:

```bash
markdownlint tests/perfect/*.md
```

**Expected Result:** Zero violations reported for all files.

### Step 3: Compare Results

Create a results log documenting:

- Date and time of test
- markdownlint version
- Each test file result
- Pass/fail status
- Any unexpected results

### Step 4: Analyze Discrepancies

If actual results differ from expected:

- Document the discrepancy
- Determine if issue is with test file or skill
- Update test file or skill as needed
- Revalidate

## Batch Validation Commands

### Validate All Flawed Files

```bash
markdownlint tests/flawed/*.md > tests/validation/flawed-results.txt 2>&1
```

### Validate All Perfect Files

```bash
markdownlint tests/perfect/*.md > tests/validation/perfect-results.txt 2>&1
```

### Check Exit Codes

```bash
markdownlint tests/flawed/*.md
echo "Flawed exit code: $?"

markdownlint tests/perfect/*.md
echo "Perfect exit code: $?"
```

**Expected:** Flawed should return non-zero, perfect should return 0.

## Success Criteria Summary

### Flawed Documents

- All expected violations are detected
- No unexpected violations occur
- Violation line numbers are accurate

### Perfect Documents

- Zero violations reported
- All files pass cleanly
- No false positives

### Overall Test Suite

- 100% of flawed documents fail validation
- 100% of perfect documents pass validation
- All violation types are represented in tests
- Test coverage is comprehensive

## Test Results Template

```text
TEST RUN: [DATE/TIME]
MARKDOWNLINT VERSION: [VERSION]

FLAWED DOCUMENTS:
- md032-lists-without-blanks.md: [PASS/FAIL] - [VIOLATION COUNT]
- md022-headings-without-blanks.md: [PASS/FAIL] - [VIOLATION COUNT]
- md031-md040-code-blocks.md: [PASS/FAIL] - [VIOLATION COUNT]
- md001-heading-increment.md: [PASS/FAIL] - [VIOLATION COUNT]
- md004-inconsistent-list-markers.md: [PASS/FAIL] - [VIOLATION COUNT]
- multiple-violations.md: [PASS/FAIL] - [VIOLATION COUNT]

PERFECT DOCUMENTS:
- perfect-lists.md: [PASS/FAIL] - [VIOLATION COUNT]
- perfect-headings.md: [PASS/FAIL] - [VIOLATION COUNT]
- perfect-code-blocks.md: [PASS/FAIL] - [VIOLATION COUNT]
- perfect-heading-increment.md: [PASS/FAIL] - [VIOLATION COUNT]
- perfect-comprehensive.md: [PASS/FAIL] - [VIOLATION COUNT]

SUMMARY:
- Total Tests: 11
- Passed: [COUNT]
- Failed: [COUNT]
- Success Rate: [PERCENTAGE]%

NOTES:
[Any observations or issues]
```

## Next Steps

After validation:

1. Document actual results in results log
2. Compare against expected results
3. Identify any skill improvements needed
4. Update skill documentation
5. Create additional test cases if gaps found
6. Proceed to Phase 3: Skill Testing & Iteration

## Test Maintenance

### Adding New Tests

When adding new test cases:

1. Create test file in appropriate directory
2. Document expected results here
3. Run validation
4. Update success criteria
5. Add to batch validation commands

### Updating Tests

When updating existing tests:

1. Document reason for update
2. Update expected results
3. Revalidate
4. Update version history
5. Commit changes

## Version History

### v1.0.0 (2025-10-22)

- Initial test suite creation
- 6 flawed document tests
- 5 perfect document tests
- Comprehensive validation plan
