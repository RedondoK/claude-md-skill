# Phase 0: Research & Requirements Gathering

**Status:** IN PROGRESS  
**Started:** 2025-10-22  
**Goal:** Gather comprehensive information on GFM spec and markdownlint rules to build perfect markdown generation skill

## Objectives

- [ ] Fetch GitHub Flavored Markdown Specification
- [ ] Fetch complete markdownlint rule set (53+ rules)
- [ ] Identify Top 10 violations in AI-generated markdown
- [ ] Document GFM-specific extensions
- [ ] Create requirements document
- [ ] Build reference library

## Resources Identified

### Primary Sources

1. **GitHub Flavored Markdown Spec**
   - URL: https://github.github.com/gfm/
   - Description: Official GFM specification based on CommonMark
   - Status: Access pending

2. **markdownlint by DavidAnson**
   - URL: https://github.com/DavidAnson/markdownlint
   - Documentation: https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md
   - Rule Count: 53+ validation rules
   - Status: Researching individual rules

### Secondary Sources

3. **Common Markdown Mistakes (Christian Emmer)**
   - URL: https://emmer.dev/blog/common-markdown-mistakes/
   - Key Finding: Blank lines around lists are the #1 rendering issue

4. **markdownlint Rule Tags**
   - headings: MD001, MD003, MD018, MD019, MD020, MD021, MD022, MD023, MD024, MD025, MD026, MD036, MD041, MD043
   - blanks: MD012, MD031, MD032, MD047
   - bullet: MD004, MD005, MD006, MD007, MD030, MD032
   - code: MD014, MD031, MD038, MD040, MD046, MD048

## Key Findings from Initial Research

### Critical Rules Identified

1. **MD032 - Lists should be surrounded by blank lines**
   - This is THE most critical rule
   - URL: https://github.com/DavidAnson/markdownlint/blob/main/doc/md032.md
   - Rationale: Without blank lines, many parsers fail to recognize lists

2. **MD004 - Unordered list style**
   - Ensures consistent list markers (-, *, +)
   - Recommendation: Use `-` consistently

3. **MD047 - Files should end with a single newline**
   - POSIX standard requirement

### Common Mistakes Found in Research

1. **Missing blank lines before/after lists** (MD032)
2. **Inconsistent list markers** (MD004)
3. **Missing blank lines between block elements**
4. **Improper heading formatting** (MD003, MD022, MD023)
5. **Trailing spaces** (MD009)

## GFM-Specific Extensions (vs CommonMark)

Based on research, GFM adds:

1. **Tables**
2. **Task lists** (- [ ] and - [x])
3. **Strikethrough** (~~text~~)
4. **Autolinks** (URLs without explicit markup)
5. **Disallowed Raw HTML** (filtering for security)

## Next Steps

1. Research individual markdownlint rules systematically
2. Create rule reference documents
3. Build examples of correct vs incorrect formatting
4. Identify patterns in AI-generated markdown errors
5. Draft initial SKILL.md structure

## Research Log

**2025-10-22 - Initial Search**
- Searched for GFM specification
- Searched for markdownlint documentation
- Identified DavidAnson/markdownlint as canonical source
- Found 53+ validation rules with MD### identifiers
- Confirmed blank lines around lists is critical issue

