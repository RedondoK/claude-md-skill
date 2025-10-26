# Reference Files

**Version:** 1.1.2  
**Purpose:** Comprehensive reference documentation for markdown generation

## Contents

- **complete-rules.md** - Full markdownlint rule catalog with examples
- **edge-cases.md** - Platform-specific quirks and edge cases
- **examples.md** - Correct and incorrect pattern examples

## Markdownlint Configuration

This directory has a lenient `.markdownlintrc` configuration because these
files are **teaching documents** that intentionally include incorrect markdown
patterns to demonstrate what to avoid.

### Rules Relaxed

- **MD013** - Line length extended to 120 chars (detailed explanations)
- **MD029** - Ordered list prefixes (intentional numbering examples)
- **MD031** - Blank lines around code (showing incorrect patterns)
- **MD032** - Blank lines around lists (showing incorrect patterns)
- **MD040** - Code language (showing incorrect patterns)

### Why This Is Correct

The main `SKILL.md` follows strict markdownlint rules. These reference files
supplement it with detailed examples of both correct AND incorrect patterns,
so they necessarily contain rule violations as teaching examples.

## Usage

These files are loaded by Claude only when needed for detailed reference
during markdown generation tasks. The SKILL.md provides the core workflow;
these files provide deep-dive details.

## Validation

To validate these files:

```bash
# This should now pass with zero errors
markdownlint complete-rules.md edge-cases.md examples.md
```

The reference folder configuration allows intentional errors while still
catching actual mistakes.
