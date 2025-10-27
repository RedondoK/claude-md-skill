# Changelog: GitHub Flavored Markdown Skill

All notable changes to this skill will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed

- Fixed all markdownlint violations in production support files (51 total)
- Fixed resources/MARKDOWN_VALIDATION_TRAPS.md (6 violations)
  - Added blank lines around code blocks
  - Added language identifiers to code blocks
- Fixed rules/markdownlint-rules-reference.md (22 violations)
  - Fixed line length violations in multiple sections
  - Added blank lines around code blocks
  - Fixed code block examples in MD031/MD040 sections
  - Fixed ordered list numbering in priority sections
  - Added language identifiers to all code blocks
- Fixed rules/top-ai-violations.md (18 violations)
  - Fixed line length violations throughout document
  - Fixed ordered list numbering in summary sections
  - Added language identifier to mental model code block
- Fixed tests/README.md (5 violations)
  - Fixed line length violations in overview and examples
  - Wrapped long descriptions properly

### Changed

- Reorganized repository structure for clarity
- Moved development/working files to `roadwork/` directory
- Moved phase documents (PHASE_*.md) to roadwork/
- Moved AI feedback analysis files to roadwork/
- Moved fix and status documents to roadwork/
- Moved working scripts to roadwork/
- Improved repository navigation and cleanliness

### Added

- Created validate-production.sh script for pre-release validation

### Repository Structure

- Created `roadwork/` directory for development artifacts
- Separated deliverable documents from working documents
- Maintained clean root directory with only essential files

## [1.1.2] - 2025-10-24

### Fixed

- Line length violations in SKILL.md prose sections
- Missing markdownlint-disable comments around "Wrong" examples
- SKILL.md now passes markdownlint with 0 violations

### Documentation

- Added GitHub repository links to resource sections
- Clarified where referenced files are located
- Enhanced resource accessibility

### Why This Matters

This update fixes "do as I say, not as I do" inconsistencies where the skill
document itself violated some of the rules it teaches. Now the skill document
is a perfect example of markdownlint-compliant markdown.

**Impact:** HIGH - Professional consistency
**Priority:** CRITICAL - Document integrity

## [1.1.1] - 2025-10-24

### Added - CRITICAL FIXES

- **CRITICAL:** Added Core Principle 4 on invisible characters and spacing
- **CRITICAL:** Added Rule 8: Character Encoding and Spacing (AI Generation)
- **CRITICAL:** Added Error Pattern 7 for non-breaking space (nbsp) issues
- Added nbsp detection commands (grep, od, hex dump methods)
- Added nbsp fix procedures (sed, VS Code find/replace regex)
- Added invisible character documentation to Quick Reference Card
- Added spacing verification to pre-generation checklist
- Added character encoding check to post-generation validation
- Enhanced Remember section with spacing guidance (never nbsp or tabs)

### Changed

- Updated SKILL.md version to 1.1.1
- Enhanced edge case documentation with nbsp detection
- Updated Quick Edge Case Reference with nbsp item
- Improved documentation for AI-generated markdown pitfalls

### Documentation

- Updated resources/MARKDOWN_VALIDATION_TRAPS.md with Invisible Character
  Traps section
- Enhanced Defensive Authoring Checklist with spacing verification
- Updated Safe Markdown Subset with spacing guideline
- Improved Testing and Validation workflow with nbsp detection step

### Fixed

- Addressed real-world nbsp issue found in SKILL.md itself
- Prevents MD029 (list numbering) errors caused by nbsp in indentation
- Prevents MD031 (blank lines) errors caused by nbsp breaking list context
- Prevents silent failures where code blocks don't nest in lists

### Why This Matters

This update addresses a **critical but invisible** issue: AI language models
may generate non-breaking space (nbsp, U+00A0) characters instead of regular
spaces (U+0020) for indentation. These characters look identical to spaces but
break markdown parsing, causing:

- List numbering to restart unexpectedly
- Code blocks to fail nesting in lists
- Confusing validation errors on visually correct markdown

This exact issue was discovered in SKILL.md itself during validation, making
it a real-world problem that needed immediate documentation and prevention.

**Impact:** HIGH - Prevents hard-to-debug issues in AI-generated content
**Priority:** CRITICAL - Essential for reliable markdown generation
**Detection:** Added command-line and visual detection methods
**Prevention:** Enhanced skill guidance to explicitly avoid nbsp

## [1.1.0] - 2025-10-24

### Added

- Edge cases and cross-platform compatibility section
- Two-space line break standard and guidance
- Platform Testing Checklist
- When GitHub Is Not Primary Target section
- resources/MARKDOWN_VALIDATION_TRAPS.md comprehensive guide

### Changed

- Enhanced Rule 5 with line break instructions
- Updated pre-generation checklist with line break consideration
- Updated post-generation validation with line break check
- Added Quick Reference Card for line breaks

### Documentation

- Created comprehensive edge case documentation in resources/
- Documented silent failure patterns
- Platform-specific guidance (GitHub, VS Code, CommonMark)
- Added safe markdown subset recommendations

### Quality Assurance

- Phase 5 QA complete
- Cross-platform validation
- Edge case testing completed

## [1.0.2] - 2025-10-22

### Added

- MD013 rule documentation (line length limits)
- Line length examples in error patterns section
- Line length check to pre-generation checklist
- Line length validation to post-generation checklist
- Guidelines for breaking long lines
- Handling long URLs documentation
- Line length best practices

### Changed

- Updated SKILL.md with comprehensive line length guidance
- Enhanced pre-generation checklist with line length awareness
- Improved post-generation validation with line length check
- Expanded error pattern examples to include MD013 violations

### Fixed

- All line length violations in SKILL.md itself
- Long paragraphs broken into appropriate line lengths
- URL handling with reference-style links for long URLs

### Testing

- Phase 3 testing complete
- All test documents validated
- Zero violations in skill documentation
- Comprehensive violation coverage confirmed

## [1.0.1] - 2025-10-22

### Fixed

- MD031 violations in SKILL.md (blank lines around code blocks)
- MD040 violations in SKILL.md (language identifiers for code blocks)
- MD029 violations in SKILL.md (ordered list numbering)
- All markdownlint violations in primary skill document

### Changed

- Enhanced code block examples with proper spacing
- Improved nested list examples with correct indentation
- Clarified language identifier requirements

### Documentation

- Added more detailed error pattern examples
- Expanded post-generation validation checklist
- Improved quick reference patterns

### Testing

- Validated SKILL.md passes markdownlint with zero violations
- Tested nested structures for proper formatting
- Confirmed all examples are markdownlint-compliant

## [1.0.0] - 2025-10-22

### Added

- Initial skill creation for GitHub Flavored Markdown
- Complete markdownlint rule coverage (MD001-MD047)
- Pre-generation checklist for AI systems
- Post-generation validation checklist
- Comprehensive error pattern documentation
- Correct vs incorrect examples for all major rules
- Language identifier reference table
- Nesting and complex structure examples
- Mental model for markdown generation
- Quick reference card for common patterns
- Success metrics and validation instructions

### Documentation

- SKILL.md: Core skill document with all rules and examples
- README.md: Project overview and quick start guide
- Rule reference structure for future expansion
- Example directory structure for test cases

### Rules Covered

**Critical Rules:**

- MD032: Blank lines around lists
- MD022: Blank lines around headings
- MD031: Blank lines around code blocks
- MD001: Heading level increments
- MD003: Heading style consistency
- MD004: List marker consistency
- MD040: Code block language identifiers

**Supporting Rules:**

- MD013: Line length limits
- MD023: Heading indentation
- MD024: Duplicate headings
- MD025: Single H1 per document
- MD029: Ordered list numbering
- MD033: Inline HTML usage
- MD041: First line heading requirement
- MD047: File must end with newline

### Features

- Zero-violation generation goal
- Comprehensive violation prevention
- Clear correction patterns
- Real-world usage scenarios
- Tool integration guidance
- VSCode compatibility

### Testing

- Phase 1 complete: Core skill development
- Phase 2 complete: Test suite creation
- Manual validation with markdownlint-cli
- Example document validation

## [0.9.0] - 2025-10-22

### Research Phase (Pre-Release)

- Analyzed markdownlint rule set
- Extracted GFM specification details
- Identified top AI markdown violations
- Created requirements document
- Built initial rule catalog

### Development

- Developed rule documentation structure
- Created example templates
- Designed pre/post validation checklists
- Established success criteria

---

## Version Format

Format: `MAJOR.MINOR.PATCH`

- **MAJOR:** Incompatible changes to skill structure
- **MINOR:** New rules, features, or significant improvements
- **PATCH:** Bug fixes, clarifications, minor updates

## Categories

- **Added:** New features or rules
- **Changed:** Changes to existing functionality
- **Deprecated:** Soon-to-be removed features
- **Removed:** Removed features
- **Fixed:** Bug fixes and corrections
- **Security:** Security-related changes
- **Documentation:** Documentation improvements
- **Testing:** Test additions or changes

## Links

- [Latest Release](./SKILL.md)
- [Documentation](./README.md)
- [Usage Guide](./USAGE.md)
- [Quick Reference](./QUICK_REFERENCE.md)
- [Integration Guide](./INTEGRATION.md)

## Future Plans

### [1.2.0] - Planned

**Advanced Rules:**

- MD034: Bare URL detection
- MD035: Horizontal rule style
- MD036: Emphasis instead of heading
- MD037: Spaces inside emphasis markers
- MD038: Spaces inside code spans
- MD039: Spaces inside link text

**Enhanced Features:**

- Table formatting guidelines
- Footnote handling
- Definition list patterns
- GitHub-specific extensions
- Task list best practices

**Tooling:**

- Custom rule configurations
- Project-specific templates
- Auto-fix recommendations
- Editor plugin integration

### [1.3.0] - Planned

**Testing Enhancements:**

- Automated test suite
- Regression test library
- Performance benchmarks
- Cross-tool validation

**Documentation:**

- Video tutorials
- Interactive examples
- Troubleshooting guide expansion
- Case study collection

**Integration:**

- CI/CD pipeline templates
- Pre-commit hook examples
- Editor configuration samples
- API integration patterns

### [2.0.0] - Future

**Major Enhancements:**

- Multi-dialect markdown support
- Custom rule creation guide
- Plugin architecture
- Advanced nesting patterns
- Complex document structures

**Breaking Changes:**

- Possible restructuring of SKILL.md
- New validation methodology
- Updated success criteria

## Release Process

1. **Development:** Create features in working branch
2. **Testing:** Validate with markdownlint-cli
3. **Documentation:** Update SKILL.md and related docs
4. **Changelog:** Document all changes here
5. **Validation:** Zero violations in all skill files
6. **Version:** Update version numbers in all files
7. **Release:** Merge to main branch

## Reporting Issues

Found a violation pattern not covered? Skill producing incorrect markdown?

1. Document the specific violation
2. Provide the markdownlint error message
3. Share the generated markdown
4. Note expected vs actual behavior
5. Include version number

## Contributing

Contributions welcome! Please:

1. Follow existing patterns
2. Add examples for new rules
3. Validate all changes with markdownlint
4. Update changelog
5. Test against multiple documents

---

**Current Version:** 1.1.2
**Status:** Production Ready
**Last Updated:** 2025-10-26
