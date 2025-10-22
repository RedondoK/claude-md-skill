# Test Suite

**Version:** 1.0.0  
**Purpose:** Comprehensive testing framework for the GFM Skill

## Overview

This test suite validates that the GFM skill correctly prevents markdownlint violations. It includes intentionally flawed documents, perfect reference documents, and automated validation tools.

## Directory Structure

```text
tests/
├── flawed/                      # Intentionally broken markdown files
│   ├── md001-heading-increment.md
│   ├── md004-inconsistent-list-markers.md
│   ├── md022-headings-without-blanks.md
│   ├── md031-md040-code-blocks.md
│   ├── md032-lists-without-blanks.md
│   └── multiple-violations.md
├── perfect/                     # Correctly formatted reference files
│   ├── perfect-code-blocks.md
│   ├── perfect-comprehensive.md
│   ├── perfect-heading-increment.md
│   ├── perfect-headings.md
│   └── perfect-lists.md
├── validation/                  # Test documentation and results
│   ├── results/                 # Generated test results (gitignored)
│   └── TEST-PLAN.md            # Detailed test plan
├── README.md                    # This file
├── run-tests.bat               # Windows test runner
└── run-tests.sh                # Unix/Linux/Mac test runner
```

## Quick Start

### Prerequisites

Install markdownlint-cli:

```bash
npm install -g markdownlint-cli
```

Verify installation:

```bash
markdownlint --version
```

### Running Tests

**Windows:**

```cmd
cd C:\Users\kgend\Projects\md_skill_md
tests\run-tests.bat
```

**Unix/Linux/Mac:**

```bash
cd /path/to/md_skill_md
bash tests/run-tests.sh
```

### Expected Output

```text
========================================
GFM Skill Test Suite
Date: 2025-10-22
========================================

markdownlint version: 0.x.x

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

Results saved to: tests/validation/results/test-run-TIMESTAMP.txt
```

## Test Categories

### Flawed Documents

These files intentionally violate markdownlint rules to verify that:

1. The violations are correctly detected by markdownlint
2. The skill documentation correctly identifies these patterns as violations

**Test Files:**

- `md001-heading-increment.md` - Tests heading level progression (MD001)
- `md004-inconsistent-list-markers.md` - Tests list marker consistency (MD004)
- `md022-headings-without-blanks.md` - Tests blank lines around headings (MD022)
- `md031-md040-code-blocks.md` - Tests code block formatting (MD031, MD040)
- `md032-lists-without-blanks.md` - Tests blank lines around lists (MD032)
- `multiple-violations.md` - Tests multiple violation types together

### Perfect Documents

These files demonstrate correct markdown formatting that passes all markdownlint rules.

**Test Files:**

- `perfect-code-blocks.md` - Correct code block formatting
- `perfect-comprehensive.md` - Complete example with all patterns
- `perfect-heading-increment.md` - Correct heading progression
- `perfect-headings.md` - Correct heading formatting
- `perfect-lists.md` - Correct list formatting

## Manual Testing

### Test Individual Files

**Flawed document (should show violations):**

```bash
markdownlint tests/flawed/md032-lists-without-blanks.md
```

**Perfect document (should show no output):**

```bash
markdownlint tests/perfect/perfect-lists.md
```

### Test All Files in a Category

**All flawed:**

```bash
markdownlint tests/flawed/*.md
```

**All perfect:**

```bash
markdownlint tests/perfect/*.md
```

## Understanding Test Results

### Success Criteria

**Flawed Documents:**

- Each file should produce markdownlint violations
- Test passes if violations are detected
- Test fails if no violations are found

**Perfect Documents:**

- Each file should produce zero violations
- Test passes if no violations are detected
- Test fails if any violations are found

### Results Files

Test results are saved to `tests/validation/results/` with timestamps:

```text
test-run-20251022_143022.txt
```

Each results file contains:

- Test run timestamp
- markdownlint version
- Detailed results for each file
- Violation details for flawed documents
- Summary statistics
- Overall pass/fail status

## Common Issues

### Issue: markdownlint not found

**Solution:**

```bash
npm install -g markdownlint-cli
```

### Issue: Permission denied on Unix/Linux

**Solution:**

```bash
chmod +x tests/run-tests.sh
```

### Issue: All flawed tests failing

**Possible causes:**

- markdownlint config file overriding rules
- Wrong markdownlint version
- Files were accidentally fixed

**Solution:** Verify files contain intentional violations.

### Issue: All perfect tests failing

**Possible causes:**

- markdownlint config file with extra rules
- Wrong markdownlint version
- Files were accidentally broken

**Solution:** Verify files are properly formatted.

## Adding New Tests

### Adding a Flawed Document

1. Create file in `tests/flawed/`
2. Add intentional violations
3. Document expected violations in `validation/TEST-PLAN.md`
4. Run test suite to verify

### Adding a Perfect Document

1. Create file in `tests/perfect/`
2. Use SKILL.md as formatting guide
3. Verify with markdownlint manually
4. Add to test suite
5. Run tests to verify

## Test Maintenance

### When to Update Tests

Update tests when:

- Skill documentation changes
- New violation patterns are discovered
- markdownlint rules change
- New use cases are identified

### Version Control

- Keep `tests/validation/results/` out of version control (.gitignore)
- Version control all test files
- Version control test scripts
- Document test changes in version history

## Integration with Development

### Phase 2 Completion Criteria

- All test files created
- Test scripts working
- All flawed tests passing (detecting violations)
- All perfect tests passing (zero violations)
- Documentation complete

### Next Phase

After Phase 2 completion, proceed to Phase 3: Skill Testing & Iteration, which uses these tests to validate the skill's effectiveness.

## Test Coverage

Current coverage includes:

- **MD001:** Heading increment violations
- **MD004:** Inconsistent list markers
- **MD022:** Blank lines around headings
- **MD031:** Blank lines around code blocks
- **MD032:** Blank lines around lists
- **MD040:** Code block language identifiers

### Coverage Gaps

Consider adding tests for:

- Line length violations (MD013)
- Multiple blank lines (MD012)
- Trailing spaces (MD009)
- Hard tabs (MD010)
- Other less common violations

## Version History

### v1.0.0 (2025-10-22)

- Initial test suite creation
- 6 flawed document tests
- 5 perfect document tests
- Windows and Unix test runners
- Comprehensive documentation

## Resources

- **Skill Documentation:** `../SKILL.md`
- **Test Plan:** `validation/TEST-PLAN.md`
- **markdownlint Rules:** <https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md>

## Questions or Issues

If tests are failing unexpectedly:

1. Check markdownlint version
2. Review test plan documentation
3. Manually validate individual files
4. Check for markdownlint config files
5. Review recent changes to test files
