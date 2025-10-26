# Markdown Skill

**Version:** 1.1.2
**Type:** Claude Skill
**Purpose:** Generate 100% markdownlint-compliant GitHub Flavored Markdown

## Overview

This skill enables Claude to generate markdown that passes markdownlint
validation with zero violations on the first attempt. It provides
comprehensive guidance for creating professional, standards-compliant markdown
for technical documentation, README files, guides, and tutorials.

## Skill Contents

### SKILL.md

Core skill document containing essential rules, pre/post generation checklists,
error prevention patterns, and quick reference guides. This is the primary file
Claude uses when generating markdown.

### references/

Detailed documentation loaded by Claude as needed:

- **complete-rules.md** - Full markdownlint rule catalog with examples
- **edge-cases.md** - Platform quirks, compatibility issues, and traps
- **examples.md** - Comprehensive correct/incorrect pattern examples

## Quick Start

### For Claude

When generating markdown:

1. Read SKILL.md for core guidance
2. Apply pre-generation checklist
3. Follow essential generation rules
4. Validate using post-generation checklist
5. Reference bundled documentation as needed

### For Users

To use this skill with Claude:

1. Install the skill in Claude
2. Request markdown generation
3. Validate output with: `markdownlint filename.md`
4. Expect zero violations

## Key Principles

1. **Blank lines are mandatory** around lists, headings, and code blocks
2. **Consistency is required** in list markers and heading styles
3. **Structure matters** for heading hierarchy and indentation
4. **Invisible characters matter** - use only regular spaces

## Success Metrics

- Zero markdownlint violations
- Zero user corrections needed
- 100% VSCode compatibility
- Immediate production readiness

## Validation

Users validate generated markdown with:

```bash
markdownlint filename.md
```

Expected result: No output (zero violations)

## License

MIT License - See LICENSE for complete terms

## Version History

**v1.1.2** - Line length fixes, documentation improvements
**v1.1.1** - Critical invisible character detection and prevention
**v1.1.0** - Edge cases and cross-platform compatibility
**v1.0.0** - Initial release

## Support

For issues or questions about this skill:

- Review SKILL.md for core guidance
- Check references/ for detailed documentation
- Validate with markdownlint for specific violations
- Consult examples.md for pattern examples
