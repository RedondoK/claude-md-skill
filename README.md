# GitHub Flavored Markdown Skill for AI Systems

**Version:** 1.1.2
**Status:** Production Ready
**Last Updated:** 2025-10-24

## Overview

This skill transforms AI-generated markdown from "close enough" to "perfect."
It provides comprehensive guidance for creating GitHub Flavored Markdown (GFM)
that passes markdownlint validation with zero violations.

## Purpose

AI systems frequently generate markdown that looks correct but fails automated
validation due to missing blank lines, inconsistent formatting, or structural
issues. This skill eliminates those problems by providing:

- Complete markdownlint rule coverage
- Pre-generation checklists
- Post-generation validation steps
- Common error patterns and corrections
- Real-world examples and templates

## Key Features

- **Zero Violations Goal:** Generate markdown that passes markdownlint
  immediately
- **Comprehensive Rule Coverage:** All critical markdownlint rules documented
- **Invisible Character Detection:** Identifies and prevents nbsp/tab issues
- **Error Prevention:** Catch common mistakes before they happen
- **Practical Examples:** Correct vs incorrect patterns for every rule
- **VSCode Compatible:** Works seamlessly with popular validation tools

## Quick Start

### For AI Systems

1. Load `SKILL.md` into your context
2. Review the pre-generation checklist before creating markdown
3. Generate markdown following the documented rules
4. Apply post-generation validation steps
5. Validate with markdownlint

### For Users

1. Point your AI system to this skill directory
2. Request markdown generation using the skill
3. Validate output with: `markdownlint filename.md`
4. Expect zero violations

## What Problems Does This Solve?

### Before This Skill

```markdown
Here are the steps:
- Step 1
- Step 2
Let's continue with...
```

**Result:** MD032 violation (missing blank lines around list)

### After This Skill

```markdown
Here are the steps:

- Step 1
- Step 2

Let's continue with...
```

**Result:** Zero violations

## Repository Structure

```text
md_skill_md/
├── SKILL.md                          # Main skill document (load this!)
├── README.md                         # Project overview (this file)
├── USAGE.md                          # Detailed usage guide
├── QUICK_REFERENCE.md                # One-page quick reference card
├── INTEGRATION.md                    # Integration guide for workflows
├── ROADMAP.md                        # Project roadmap and future plans
├── CHANGELOG.md                      # Version history and updates
├── LICENSE                           # License information
├── PROJECT-STRUCTURE.md              # Detailed structure documentation
├── .gitignore                        # Git ignore patterns
├── .gitattributes                    # Git line ending normalization
├── .markdownlintrc                   # Markdownlint configuration
├── examples/                         # Example markdown files
│   ├── correct/                      # Correctly formatted examples
│   │   ├── code-blocks-correct.md
│   │   ├── headings-correct.md
│   │   └── lists-correct.md
│   └── incorrect/                    # Incorrectly formatted examples
│       └── lists-incorrect.md
├── tests/                            # Comprehensive test suite
│   ├── README.md                     # Test documentation
│   ├── QUICK-REFERENCE.md            # Test quick reference
│   ├── run-tests.sh                  # Unix test runner
│   ├── run-tests.bat                 # Windows test runner
│   ├── flawed/                       # Intentionally flawed test files
│   ├── perfect/                      # Perfect reference files
│   └── validation/                   # Validation test plans
│       ├── TEST-PLAN.md
│       └── results/                  # Test results directory
├── rules/                            # Rule reference documentation
│   ├── markdownlint-rules-reference.md
│   └── top-ai-violations.md
├── markdown/                         # Standalone markdown skill
│   ├── SKILL.md                      # Markdown-specific skill variant
│   ├── README.md
│   ├── LICENSE
│   └── references/                   # Markdown references
├── resources/                        # Additional resources
│   └── MARKDOWN_VALIDATION_TRAPS.md  # Edge cases and gotchas
├── archive/                          # Archived versions
│   └── v1.1.1_nbsp_development/      # Historical development files
└── roadwork/                         # Development/working files
    ├── phase6/                       # Phase 6 working directory
    ├── PHASE_*.md                    # Phase documentation
    ├── *_ANALYSIS.md                 # AI feedback analysis
    ├── *_FIX_*.md                    # Fix guides and summaries
    └── *.sh                          # Working scripts
```

### Directory Descriptions

**Root Files (Deliverables):**

- Core skill and documentation files that users interact with directly
- All essential guides and references
- Configuration files for tools and git

**examples/:** Correct and incorrect markdown examples for learning

**tests/:** Comprehensive test suite with automated runners and validation

**rules/:** Detailed rule documentation and violation references

**markdown/:** Standalone variant of the skill focused on markdown-only use

**resources/:** Additional reference materials and edge case documentation

**archive/:** Historical versions and development snapshots

**roadwork/:** Development artifacts, working files, and process documentation
(not part of deliverables)

## Core Principles

### 1. Blank Lines Are Mandatory

Not optional, not stylistic - **mandatory**:

- Before and after lists
- Before and after headings (except document start)
- Before and after code blocks
- Between all block-level elements

### 2. Consistency Is Required

- One list marker style (`-` recommended)
- One heading style (ATX `#` recommended)
- Consistent indentation
- Predictable patterns

### 3. Structure Matters

- Heading hierarchy increments by one (1→2→3, not 1→3)
- Only one H1 per document
- Files end with exactly one newline
- Proper nesting and indentation

### 4. Invisible Characters Matter

- Use ONLY regular spaces (U+0020) for indentation
- Never use non-breaking spaces (U+00A0, `&nbsp;`)
- Never use tabs for indentation
- Watch for zero-width characters that break parsing

## Common Use Cases

### Technical Documentation

Generate API docs, developer guides, and technical specifications with:

- Clear heading hierarchy
- Code blocks with language identifiers
- Lists for features and requirements
- Proper spacing throughout

### README Files

Create professional README files with:

- Project title (single H1)
- Section organization (H2 headings)
- Installation instructions (lists + code)
- Usage examples (code blocks)

### Tutorials and Guides

Build step-by-step guides with:

- Sequential instructions (ordered lists)
- Code examples with context
- Multi-paragraph list items
- Nested content structures

## Validation

### Recommended Tools

- **markdownlint-cli:** `npm install -g markdownlint-cli`
- **VSCode Extension:** markdownlint by David Anson
- **GitHub Actions:** Automated validation in CI/CD

### Validation Command

```bash
markdownlint filename.md
```

**Expected Result:** No output (zero violations)

## Success Metrics

- ✅ Zero markdownlint violations
- ✅ Zero user corrections needed
- ✅ 100% VSCode compatibility
- ✅ Immediate usability in production

## Version History

### v1.1.2 (2025-10-24)

- Fixed line length violations in SKILL.md
- Added GitHub repository links
- Enhanced resource accessibility
- Zero violations in skill document itself

### v1.1.1 (2025-10-24)

- **CRITICAL FIX:** Added invisible character detection and prevention
- Added Core Principle 4 on invisible characters
- Added Rule 8: Character Encoding and Spacing
- Added Error Pattern 7 for non-breaking space issues
- Enhanced documentation for AI-generated markdown pitfalls
- Impact: HIGH - Prevents hard-to-debug nbsp parsing issues

### v1.1.0 (2025-10-24)

- Added edge cases and cross-platform compatibility section
- Added two-space line break standard and guidance
- Enhanced Rule 5 with line break instructions
- Created comprehensive edge case documentation
- Phase 5 QA complete

### v1.0.2 (2025-10-22)

- Added MD013 rule documentation (line length)
- Updated validation checklist
- Phase 3 testing complete

### v1.0.1 (2025-10-22)

- Fixed all violations in skill document
- Added comprehensive examples
- Enhanced error prevention

### v1.0.0 (2025-10-22)

- Initial release
- Complete markdownlint coverage
- Pre/post generation checklists

## Contributing

Found a violation pattern not covered? Have a suggestion for improvement?

1. Document the issue with examples
2. Propose a solution
3. Test against markdownlint
4. Submit updates

## Support

For issues or questions:

- Check `USAGE.md` for detailed instructions
- Review `QUICK_REFERENCE.md` for fast answers
- Validate with markdownlint to identify specific violations
- Consult `rules/` directory for rule-specific guidance

## License

This skill is provided as-is for use with AI systems and markdown generation.

## Credits

Built from real-world AI markdown generation failures and markdownlint
documentation. Tested with actual validation tools to ensure accuracy.

---

**Remember:** The most common violation is missing blank lines. If you remember
nothing else, remember that blank lines around lists, headings, and code blocks
are **mandatory**, not optional.
