#!/bin/bash
# Test Suite Execution Script
# Version: 1.0.0
# Purpose: Run all markdown validation tests and generate results

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "========================================"
echo "GFM Skill Test Suite"
echo "Date: $(date)"
echo "========================================"
echo ""

# Check if markdownlint is installed
if ! command -v markdownlint &> /dev/null; then
    echo -e "${RED}ERROR: markdownlint not found${NC}"
    echo "Install with: npm install -g markdownlint-cli"
    exit 1
fi

# Get markdownlint version
MDLINT_VERSION=$(markdownlint --version)
echo "markdownlint version: $MDLINT_VERSION"
echo ""

# Initialize counters
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0

# Results directory
RESULTS_DIR="tests/validation/results"
mkdir -p "$RESULTS_DIR"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
RESULTS_FILE="$RESULTS_DIR/test-run-$TIMESTAMP.txt"

# Start results file
{
    echo "TEST RUN: $(date)"
    echo "MARKDOWNLINT VERSION: $MDLINT_VERSION"
    echo ""
    echo "========================================"
    echo "FLAWED DOCUMENTS (Should Have Violations)"
    echo "========================================"
    echo ""
} > "$RESULTS_FILE"

# Test flawed documents (should fail)
echo "Testing Flawed Documents (should have violations)..."
echo "------------------------------------------------------"

FLAWED_DIR="tests/flawed"
FLAWED_PASS=0
FLAWED_FAIL=0

for file in "$FLAWED_DIR"/*.md; do
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    filename=$(basename "$file")
    
    # Run markdownlint and capture output
    if markdownlint "$file" > /dev/null 2>&1; then
        echo -e "${RED}✗ FAIL${NC}: $filename (expected violations, got none)"
        FAILED_TESTS=$((FAILED_TESTS + 1))
        FLAWED_FAIL=$((FLAWED_FAIL + 1))
        {
            echo "FAIL: $filename"
            echo "Expected: Violations"
            echo "Got: No violations"
            echo ""
        } >> "$RESULTS_FILE"
    else
        echo -e "${GREEN}✓ PASS${NC}: $filename (has violations as expected)"
        PASSED_TESTS=$((PASSED_TESTS + 1))
        FLAWED_PASS=$((FLAWED_PASS + 1))
        violations=$(markdownlint "$file" 2>&1 | wc -l)
        {
            echo "PASS: $filename"
            echo "Violations found: $violations"
            markdownlint "$file" 2>&1
            echo ""
        } >> "$RESULTS_FILE"
    fi
done

echo ""

# Test perfect documents (should pass)
{
    echo "========================================"
    echo "PERFECT DOCUMENTS (Should Have No Violations)"
    echo "========================================"
    echo ""
} >> "$RESULTS_FILE"

echo "Testing Perfect Documents (should have no violations)..."
echo "---------------------------------------------------------"

PERFECT_DIR="tests/perfect"
PERFECT_PASS=0
PERFECT_FAIL=0

for file in "$PERFECT_DIR"/*.md; do
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    filename=$(basename "$file")
    
    # Run markdownlint and capture output
    if markdownlint "$file" > /dev/null 2>&1; then
        echo -e "${GREEN}✓ PASS${NC}: $filename (no violations)"
        PASSED_TESTS=$((PASSED_TESTS + 1))
        PERFECT_PASS=$((PERFECT_PASS + 1))
        {
            echo "PASS: $filename"
            echo "No violations found"
            echo ""
        } >> "$RESULTS_FILE"
    else
        echo -e "${RED}✗ FAIL${NC}: $filename (has unexpected violations)"
        FAILED_TESTS=$((FAILED_TESTS + 1))
        PERFECT_FAIL=$((PERFECT_FAIL + 1))
        {
            echo "FAIL: $filename"
            echo "Expected: No violations"
            echo "Got violations:"
            markdownlint "$file" 2>&1
            echo ""
        } >> "$RESULTS_FILE"
    fi
done

echo ""
echo "========================================"
echo "TEST SUMMARY"
echo "========================================"

{
    echo "========================================"
    echo "SUMMARY"
    echo "========================================"
    echo ""
    echo "FLAWED DOCUMENTS:"
    echo "  Passed: $FLAWED_PASS (correctly detected violations)"
    echo "  Failed: $FLAWED_FAIL (missed violations)"
    echo ""
    echo "PERFECT DOCUMENTS:"
    echo "  Passed: $PERFECT_PASS (correctly clean)"
    echo "  Failed: $PERFECT_FAIL (false positives)"
    echo ""
    echo "OVERALL:"
    echo "  Total Tests: $TOTAL_TESTS"
    echo "  Passed: $PASSED_TESTS"
    echo "  Failed: $FAILED_TESTS"
} >> "$RESULTS_FILE"

echo "Flawed Documents: $FLAWED_PASS passed, $FLAWED_FAIL failed"
echo "Perfect Documents: $PERFECT_PASS passed, $PERFECT_FAIL failed"
echo "Total: $PASSED_TESTS/$TOTAL_TESTS tests passed"

if [ $FAILED_TESTS -eq 0 ]; then
    SUCCESS_RATE=100
    echo -e "${GREEN}Success Rate: 100%${NC}"
else
    SUCCESS_RATE=$((PASSED_TESTS * 100 / TOTAL_TESTS))
    echo -e "${YELLOW}Success Rate: $SUCCESS_RATE%${NC}"
fi

{
    if [ $FAILED_TESTS -eq 0 ]; then
        echo "  Success Rate: 100%"
        echo ""
        echo "STATUS: ALL TESTS PASSED ✓"
    else
        echo "  Success Rate: $SUCCESS_RATE%"
        echo ""
        echo "STATUS: SOME TESTS FAILED ✗"
    fi
} >> "$RESULTS_FILE"

echo ""
echo "Results saved to: $RESULTS_FILE"
echo ""

# Exit with appropriate code
if [ $FAILED_TESTS -eq 0 ]; then
    exit 0
else
    exit 1
fi
