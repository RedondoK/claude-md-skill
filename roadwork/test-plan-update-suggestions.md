# Test Plan Update Suggestions for Version 1.2.0

**Date:** 2025-11-10
**Version:** 1.2.0
**Purpose:** Recommendations for updating test suite to cover new rules

## Overview

Version 1.2.0 adds coverage for critical professional-quality rules that were
missing from the skill. This document outlines recommended test additions to
validate these enhancements.

## New Rules Requiring Test Coverage

### 1. MD034 - No Bare URLs (HIGH PRIORITY)

**Test file:** `test-md034-urls.md`

**Test scenarios:**

1. Bare URL in paragraph (should fail)
1. Bare email address (should fail)
1. URL wrapped in angle brackets (should pass)
1. Email wrapped in angle brackets (should pass)
1. URL as proper link with text (should pass)
1. URL with underscores bare (should fail and corrupt)
1. URL with underscores wrapped (should pass)
1. Multiple URLs in same paragraph
1. URL in list item
1. URL in heading (edge case)

**Expected violations:** 4-5 violations in negative test sections

**Example structure:**

```markdown
## Bare URLs (Should Fail)

Visit https://example.com for details.
Contact support@example.com for help.

## Wrapped URLs (Should Pass)

Visit <https://example.com> for details.
Contact <support@example.com> for help.

## Link Syntax (Should Pass)

Visit [our site](https://example.com) for details.
```

### 2. MD041 - First Line Should Be H1 (MEDIUM PRIORITY)

**Test file:** `test-md041-document-structure.md`

**Test scenarios:**

1. Document starting with paragraph (should fail)
1. Document starting with H1 (should pass)
1. Document with YAML front matter then H1 (should pass)
1. Document with TOML front matter then H1 (should pass)
1. Document starting with H2 (should fail)
1. Empty document (edge case)
1. Document with only front matter (edge case)

**Expected violations:** 2-3 violations in negative test sections

**Note:** Need to create multiple test files for different scenarios since
MD041 checks the first line.

**Suggested test files:**

- `test-md041-fail-paragraph.md` (starts with paragraph)
- `test-md041-fail-h2.md` (starts with H2)
- `test-md041-pass-h1.md` (starts with H1)
- `test-md041-pass-frontmatter.md` (YAML front matter then H1)

### 3. MD029 - Ordered List Item Prefix (MEDIUM PRIORITY)

**Test file:** `test-md029-ordered-lists.md`

**Test scenarios:**

1. Manual numbering 1, 2, 3 (should fail)
1. Using 1. for all items (should pass)
1. Nested ordered lists with manual numbering (should fail)
1. Nested ordered lists with 1. for all (should pass)
1. Mixed ordered and unordered lists
1. Ordered list with code blocks (maintaining numbering)
1. Ordered list broken by non-indented content

**Expected violations:** 3-4 violations in negative test sections

**Example structure:**

```markdown
## Manual Numbering (Should Fail)

<!-- markdownlint-disable MD029 -->

1. First item
2. Second item
3. Third item

<!-- markdownlint-enable MD029 -->

## Using 1. for All (Should Pass)

1. First item
1. Second item
1. Third item
```

### 4. MD026 - No Trailing Punctuation in Headings (LOW PRIORITY)

**Test file:** `test-md026-heading-punctuation.md`

**Test scenarios:**

1. Heading with period (should fail)
1. Heading with colon (should fail)
1. Heading with semicolon (should fail)
1. Heading with comma (should fail)
1. Heading without punctuation (should pass)
1. Heading with question mark (configuration dependent)
1. Heading with exclamation point (configuration dependent)
1. Heading with apostrophe in word (should pass)

**Expected violations:** 4 violations in negative test sections

### 5. MD045 - Images Should Have Alt Text (MEDIUM PRIORITY)

**Test file:** `test-md045-image-alt-text.md`

**Test scenarios:**

1. Image without alt text (should fail)
1. Image with descriptive alt text (should pass)
1. Image with empty alt text `![]()` (should fail)
1. Multiple images, some missing alt text
1. Image with very long descriptive alt text (should pass)
1. Image reference style without alt text
1. Image in list item without alt text

**Expected violations:** 4-5 violations in negative test sections

**Note:** Requires actual image files or will fail for missing files. Consider
using placeholder images or external URLs.

### 6. MD048 - Code Fence Style (LOW PRIORITY)

**Test file:** `test-md048-fence-style.md`

**Test scenarios:**

1. Mixed backticks and tildes (should fail)
1. All backticks (should pass)
1. All tildes (should pass but backticks preferred)
1. Nested fences with backticks
1. Multiple code blocks with consistent style

**Expected violations:** 1-2 violations in mixed style sections

**Example structure:**

````markdown
## Mixed Styles (Should Fail)

<!-- markdownlint-disable MD048 -->

```python
code1()
```

~~~javascript
code2();
~~~

<!-- markdownlint-enable MD048 -->

## Consistent Backticks (Should Pass)

```python
code1()
```

```javascript
code2();
```
````

### 7. MD033 - No Inline HTML (LOW PRIORITY)

**Test file:** `test-md033-html.md`

**Test scenarios:**

1. Inline HTML tags (should fail unless allowed)
1. Pure markdown equivalents (should pass)
1. HTML in code blocks (should pass, not parsed)
1. Allowed HTML for complex tables (configuration dependent)
1. Dangerous HTML tags (`<script>`, `<iframe>`)

**Expected violations:** 3-5 violations depending on configuration

### 8. MD036 - No Emphasis as Heading (LOW PRIORITY)

**Test file:** `test-md036-emphasis-headings.md`

**Test scenarios:**

1. Bold text as heading substitute (should fail)
1. Proper heading (should pass)
1. Bold text in paragraph (should pass)
1. Multiple emphasis-as-heading violations

**Expected violations:** 2-3 violations

### 9. MD037 and MD038 - Spaces in Markers (LOW PRIORITY)

**Test file:** `test-md037-md038-spaces.md`

**Test scenarios:**

1. Spaces inside emphasis markers (MD037)
1. Spaces inside code spans (MD038)
1. Correct emphasis without spaces
1. Correct code spans without spaces

**Expected violations:** 4-6 violations

## Integration Test Updates

**File:** Update existing comprehensive integration tests

**Additions needed:**

1. Add URL wrapping to existing test files
1. Ensure all test files start with H1
1. Convert ordered lists to use `1.` pattern
1. Add alt text to any images
1. Verify consistent fence styles
1. Remove trailing punctuation from headings

## Test Execution Priority

### Phase 1: Critical Rules (Week 1)

1. ✅ MD034 (Bare URLs) - HIGH impact on clickability
1. ✅ MD041 (Document structure) - HIGH impact on accessibility
1. ✅ MD029 (Ordered lists) - MEDIUM impact on maintainability

### Phase 2: Professional Quality (Week 2)

4. ✅ MD045 (Image alt text) - Accessibility
4. ✅ MD026 (Heading punctuation) - Consistency
4. ✅ MD048 (Fence style) - Consistency

### Phase 3: Low Priority (Week 3)

7. ✅ MD033 (Inline HTML) - Compatibility
7. ✅ MD036 (Emphasis as heading) - Structure
7. ✅ MD037/MD038 (Spaces in markers) - Formatting

## Validation Strategy

### Test File Structure

Each test file should follow this pattern:

```markdown
# Test Title

**Rule:** MD0XX
**Purpose:** Brief description

## Negative Tests (Should Fail)

<!-- markdownlint-disable MD0XX -->

[Examples that violate the rule]

<!-- markdownlint-enable MD0XX -->

## Positive Tests (Should Pass)

[Examples that follow the rule correctly]

## Edge Cases

[Unusual scenarios and boundary conditions]
```

### Automated Testing

**Command to validate all tests:**

```bash
# Check individual test file
markdownlint test-md034-urls.md

# Check all test files
markdownlint tests/*.md

# Generate report
markdownlint tests/*.md --json > test-results.json
```

**Expected results:**

- Negative test sections: Should report specific violations
- Positive test sections: Should report zero violations
- Edge cases: Document expected behavior

### Integration with CI/CD

**GitHub Actions workflow addition:**

```yaml
- name: Test MD034 Coverage
  run: |
    markdownlint tests/test-md034-urls.md
    # Expect non-zero exit code in negative sections

- name: Validate Skill Documentation
  run: |
    markdownlint markdown/SKILL.md
    markdownlint markdown/references/*.md
    # Expect zero violations
```

## Documentation Updates Required

### Update Test README

Add section describing new test files:

```markdown
## Version 1.2.0 Test Coverage

### Professional Quality Rules

- `test-md034-urls.md` - URL and email wrapping
- `test-md041-document-structure.md` - First line H1 requirement
- `test-md029-ordered-lists.md` - Ordered list prefixes
- `test-md026-heading-punctuation.md` - Heading punctuation
- `test-md045-image-alt-text.md` - Image accessibility
- `test-md048-fence-style.md` - Code fence consistency
- `test-md033-html.md` - HTML usage
- `test-md036-emphasis-headings.md` - Emphasis as heading
- `test-md037-md038-spaces.md` - Spaces in markers
```

### Update CHANGELOG.md

Add entry for version 1.2.0:

```markdown
## [1.2.0] - 2025-11-10

### Added

- MD034: No bare URLs rule with examples
- MD041: Document structure (first line H1) rule
- MD029: Ordered list prefix consistency
- MD026: No trailing punctuation in headings
- MD045: Image alt text requirement
- MD048: Code fence style consistency
- MD033: Inline HTML usage guidance
- MD036: No emphasis as heading substitute
- MD037/MD038: Spaces in markers

### Enhanced

- Pre-generation checklist with new rule checks
- Post-generation validation with additional items
- Complete rules reference with professional quality section
- Examples with comprehensive new rule coverage
- Edge cases with professional quality scenarios
```

## Test Maintenance Guidelines

### Regular Review

- ✅ Run full test suite before each release
- ✅ Update tests when skill rules change
- ✅ Add tests for any reported issues
- ✅ Verify tests pass with latest markdownlint version

### Documentation Sync

- ✅ Keep test examples aligned with SKILL.md
- ✅ Update test READMEs when adding new files
- ✅ Cross-reference between tests and documentation

### Coverage Metrics

Track test coverage for each rule:

- MD034: URLs ✅ (8-10 test cases)
- MD041: Document structure ✅ (4-7 test cases)
- MD029: Ordered lists ✅ (6-8 test cases)
- MD026: Heading punctuation ✅ (6-8 test cases)
- MD045: Image alt text ✅ (6-8 test cases)
- MD048: Fence style ✅ (4-6 test cases)
- MD033: HTML usage ✅ (4-6 test cases)
- MD036: Emphasis headings ✅ (3-4 test cases)
- MD037/MD038: Spaces ✅ (4-6 test cases)

## Implementation Notes

### Timing Estimate

- Creating test files: 4-6 hours
- Validating tests: 2-3 hours
- Documentation updates: 1-2 hours
- Integration testing: 2-3 hours
- **Total: 9-14 hours**

### Dependencies

- markdownlint-cli installed
- Test image files (for MD045 tests)
- Git for version control
- VS Code with markdownlint extension (for visual validation)

### Success Criteria

- ✅ All new test files validate correctly
- ✅ Negative sections report expected violations
- ✅ Positive sections report zero violations
- ✅ Documentation updated and validated
- ✅ Integration tests pass with new rules
- ✅ Skill generates zero-violation markdown

## Future Enhancements

### Version 1.3.0 Considerations

- Test suite automation with detailed reporting
- Performance tests for large documents
- Cross-platform renderer validation
- Accessibility testing with screen readers
- SEO impact validation for alt text
- Link checker integration for wrapped URLs

## Conclusion

This test plan provides comprehensive coverage for the new professional quality
rules added in version 1.2.0. Implementing these tests will ensure the skill
maintains its high standard of generating zero-violation markdown while
expanding coverage to include professional documentation requirements.

The phased approach allows for systematic validation while maintaining project
momentum. Priority is given to rules with the highest impact on document
quality, clickability, and accessibility.
