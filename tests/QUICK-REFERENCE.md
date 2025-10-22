# Test Suite Quick Reference

## Prerequisites

```bash
npm install -g markdownlint-cli
```

## Run All Tests

**Windows:**

```cmd
tests\run-tests.bat
```

**Unix/Linux/Mac:**

```bash
bash tests/run-tests.sh
```

## Manual Testing

### Test Single File

```bash
markdownlint tests/flawed/md032-lists-without-blanks.md
```

### Test Category

```bash
# All flawed (should show violations)
markdownlint tests/flawed/*.md

# All perfect (should be clean)
markdownlint tests/perfect/*.md
```

## Expected Results

- Flawed files: Should show violations ✓
- Perfect files: Should be clean ✓
- 11 total tests
- 100% pass rate = success

## Test Results Location

```text
tests/validation/results/test-run-[TIMESTAMP].txt
```

## Quick Validation

Check if markdownlint works:

```bash
markdownlint --version
```

## Common Commands

```bash
# Test specific violation type
markdownlint tests/flawed/md032-lists-without-blanks.md

# Test comprehensive example
markdownlint tests/perfect/perfect-comprehensive.md

# Count violations
markdownlint tests/flawed/*.md | wc -l

# Save results
markdownlint tests/flawed/*.md > violations.txt
```
