# Project Structure

**Version:** 1.1.2  
**Last Updated:** 2025-10-27

## Overview

This document describes the complete file and directory structure of the
GitHub Flavored Markdown (GFM) Skill project, explaining the purpose of each
component and how they relate to the development and deployment workflow.

## Directory Tree

```text
md_skill_md/
├── Root Documentation
│   ├── README.md                          # Main project documentation
│   ├── SKILL.md                           # Core skill document (dev version)
│   ├── CHANGELOG.md                       # Version history
│   ├── CONTRIBUTING.md                    # Contribution guidelines
│   ├── INTEGRATION.md                     # Integration guide for Claude
│   ├── LICENSE                            # MIT License
│   ├── PROJECT-STRUCTURE.md              # This file
│   ├── QUICK_REFERENCE.md                # Quick reference card
│   ├── RELEASE_WORKFLOW.md               # Release process
│   ├── ROADMAP.md                        # Future development plans
│   ├── UPDATES_COMPLETE.md               # Latest update summary
│   ├── USAGE.md                          # Usage instructions
│   └── CREATE_ZIP_NOW.md                 # Quick packaging guide
│
├── Configuration
│   ├── .gitignore                        # Git ignore rules
│   ├── .gitattributes                    # Git attributes
│   └── .markdownlintrc                   # Markdownlint config (root)
│
├── Distribution Scripts
│   ├── create_zip.py                     # Python zip creator (recommended)
│   ├── create-skill-zip.bat             # Windows batch script
│   ├── create-skill-zip.sh              # Unix/Mac shell script
│   └── markdown.zip                      # Generated package (gitignored)
│
├── markdown/                             # 📦 Distribution Package
│   ├── SKILL.md                         # Production skill (lean version)
│   ├── README.md                        # Package documentation
│   ├── LICENSE                          # MIT License copy
│   └── references/                      # Supporting documentation
│       ├── .markdownlintrc              # Linter config
│       ├── README.md                    # References index
│       ├── complete-rules.md            # All markdownlint rules
│       ├── edge-cases.md                # Platform compatibility
│       └── examples.md                  # Example patterns
│
├── rules/                               # Rule Documentation
│   ├── markdownlint-rules-reference.md  # Complete rule catalog
│   └── top-ai-violations.md            # Common AI mistakes
│
├── examples/                            # Example Files
│   ├── correct/                        # Correct patterns
│   │   ├── code-blocks-correct.md
│   │   ├── headings-correct.md
│   │   └── lists-correct.md
│   └── incorrect/                      # Anti-patterns
│       └── lists-incorrect.md
│
├── tests/                               # Test Suite
│   ├── README.md                       # Test documentation
│   ├── QUICK-REFERENCE.md              # Quick test commands
│   ├── run-tests.bat                   # Windows test runner
│   ├── run-tests.sh                    # Unix test runner
│   ├── flawed/                         # Intentionally broken files
│   │   ├── md001-heading-increment.md
│   │   ├── md004-inconsistent-list-markers.md
│   │   ├── md022-headings-without-blanks.md
│   │   ├── md031-md040-code-blocks.md
│   │   ├── md032-lists-without-blanks.md
│   │   └── multiple-violations.md
│   ├── perfect/                        # Correctly formatted files
│   │   ├── perfect-code-blocks.md
│   │   ├── perfect-comprehensive.md
│   │   ├── perfect-heading-increment.md
│   │   ├── perfect-headings.md
│   │   └── perfect-lists.md
│   └── validation/                     # Test results
│       ├── TEST-PLAN.md               # Detailed test plan
│       └── results/                   # Auto-generated results (gitignored)
│           ├── README.md
│           ├── test-run-20251022_123631.txt
│           └── test-run-20251022_142240.txt
│
├── resources/                          # Extended Documentation
│   └── MARKDOWN_VALIDATION_TRAPS.md   # Edge cases & compatibility
│
├── roadwork/                           # Development Workspace
│   ├── README.md                      # Roadwork index
│   ├── PHASE_0_RESEARCH.md           # Phase 0 research
│   ├── PHASE_0_COMPLETE.md           # Phase 0 summary
│   ├── PHASE_2_CHECKLIST.md          # Phase 2 verification
│   ├── PHASE_2_COMPLETE.md           # Phase 2 summary
│   ├── PHASE_2_SUMMARY.md            # Phase 2 overview
│   ├── PHASE_3_*.md                  # Phase 3 documentation (20+ files)
│   ├── PHASE_4_COMPLETE.md           # Phase 4 summary
│   ├── PHASE_5_COMPLETE.md           # Phase 5 summary
│   ├── PHASE_6_COMPLETE.md           # Phase 6 summary
│   ├── phase6/                       # Phase 6 detailed docs
│   │   ├── DOCUMENTATION_UPDATES_COMPLETE.md
│   │   ├── EXECUTION_COMMANDS.md
│   │   ├── FILE_MANAGEMENT_PLAN.md
│   │   ├── FINAL_COMMIT.md
│   │   ├── PHASE_6_PROGRESS.md
│   │   ├── PHASE_6_STATUS_CHECK.md
│   │   ├── QUICK_FIX_SUMMARY.md
│   │   └── VALIDATION_DECISION.md
│   ├── AI_FEEDBACK_COMPARISON.md     # AI system feedback analysis
│   ├── GEMINI_FEEDBACK_ANALYSIS.md
│   ├── GROK_FEEDBACK_ANALYSIS.md
│   ├── MANUS_FEEDBACK_ANALYSIS.md
│   ├── NBSP_ENHANCEMENT_COMPLETE.md  # Invisible char work
│   ├── MARKDOWNLINT_*.md             # Linting documentation
│   ├── ORGANIZATION_SUMMARY.md       # Repo organization
│   ├── STATUS_REPORT.md              # Current status
│   ├── v1.1.2_*.md                   # Version 1.1.2 docs
│   └── *.sh                          # Utility scripts
│
└── archive/                            # Historical Development
    └── v1.1.1_nbsp_development/       # v1.1.1 NBSP feature work
        ├── ACTION_PLAN_NBSP.md
        ├── FIX_GUIDE.md
        ├── SKILL_BACKUP_PRE_NBSP.md
        ├── SKILL_FIXED.md
        ├── SKILL_UPDATE_NBSP.md
        └── VISUAL_FIX.md
```

## Key Locations by Purpose

### 📖 For New Users

**Start here:**

1. `README.md` - Project overview and quick start
2. `SKILL.md` - Full skill documentation (development version)
3. `QUICK_REFERENCE.md` - One-page reference card
4. `USAGE.md` - How to use the skill

**Install the skill:**

1. `CREATE_ZIP_NOW.md` - Quick packaging instructions
2. `create_zip.py` - Run this to create markdown.zip
3. Upload `markdown.zip` to Claude.ai

### 🔧 For Development

**Core skill content:**

- `SKILL.md` - Comprehensive development version
- `markdown/SKILL.md` - Lean production version
- `CHANGELOG.md` - Track all changes here

**Rule documentation:**

- `rules/markdownlint-rules-reference.md` - Complete rule reference
- `rules/top-ai-violations.md` - Common mistakes catalog
- `resources/MARKDOWN_VALIDATION_TRAPS.md` - Edge cases

**Testing:**

- `tests/README.md` - Test suite documentation
- `tests/run-tests.bat` or `tests/run-tests.sh` - Execute tests
- `tests/validation/TEST-PLAN.md` - Test specifications

### 📦 For Distribution

**The markdown/ directory contains ONLY what gets distributed:**

- `markdown/SKILL.md` - Production skill (267 lines, lean)
- `markdown/README.md` - Package documentation
- `markdown/LICENSE` - MIT License
- `markdown/references/` - Reference documentation (progressive disclosure)

**Create distribution package:**

```bash
python create_zip.py
```

This creates `markdown.zip` containing only the `markdown/` directory.

### 📊 For Project Management

**Phase tracking:**

- `roadwork/PHASE_*_COMPLETE.md` - Phase completion summaries
- `roadwork/phase6/` - Current phase detailed documentation
- `ROADMAP.md` - Future development plans

**Development history:**

- `archive/` - Historical development artifacts
- `roadwork/` - Current development workspace
- `CHANGELOG.md` - Version history

## File Categories

### Production Files (Essential)

These files are required for the skill to function:

```text
✅ SKILL.md                    # Core skill document
✅ markdown/                   # Distribution package
✅ LICENSE                     # MIT License
✅ README.md                   # Documentation
✅ create_zip.py              # Packaging script
```

### Development Files (Work-in-Progress)

These files support active development:

```text
🔧 tests/                     # Test suite
🔧 examples/                  # Example files
🔧 rules/                     # Rule documentation
🔧 roadwork/                  # Development workspace
🔧 .markdownlintrc           # Linting configuration
```

### Archive Files (Historical)

These files document past development:

```text
📁 archive/                   # Historical artifacts
📁 roadwork/PHASE_*          # Phase documentation
```

## Development Workflow

### 1. Make Changes

Edit files in the appropriate location:

- Core skill: `SKILL.md` (root) and `markdown/SKILL.md` (distribution)
- Rules: `rules/`
- Examples: `examples/`
- Tests: `tests/`

### 2. Validate Changes

```bash
# Lint all markdown
markdownlint **/*.md

# Run test suite
bash tests/run-tests.sh  # or tests\run-tests.bat on Windows
```

### 3. Update Documentation

- `CHANGELOG.md` - Document the change
- `SKILL.md` - Update version number if needed
- `markdown/SKILL.md` - Sync production version

### 4. Create Distribution Package

```bash
python create_zip.py
```

### 5. Test Distribution Package

Upload `markdown.zip` to Claude.ai and test functionality.

### 6. Commit Changes

```bash
git add .
git commit -m "type(scope): description"
git push origin main
```

### 7. Create Release (for versions)

```bash
git tag v1.1.2
git push origin v1.1.2
```

Attach `markdown.zip` to the GitHub release.

## File Count Summary

**Total Directories:** 15

- Root: 7 subdirectories
- archive: 1 subdirectory
- tests: 3 subdirectories
- roadwork: 1 subdirectory
- markdown: 1 subdirectory
- examples: 2 subdirectories

**Total Files:** ~100+

- Root documentation: 15 files
- Configuration: 3 files
- Scripts: 3 files
- Distribution package: 7 files
- Rules: 2 files
- Examples: 4 files
- Tests: 15+ files
- Resources: 1 file
- Roadwork: 40+ files
- Archive: 6 files

## Repository Size

**Tracked in Git:** ~2-3 MB

- Source files (markdown, scripts): ~500 KB
- Test files: ~200 KB
- Documentation: ~1.5 MB
- Git metadata: ~500 KB

**Not tracked (gitignored):**

- `markdown.zip` - Generated distribution package (~50 KB)
- `tests/validation/results/` - Test result files
- `node_modules/` - If npm used
- OS/editor files (`.DS_Store`, `.vscode/`, etc.)

## Version Control

### Tracked

All source files, documentation, tests, and scripts.

### Not Tracked (.gitignored)

- `markdown.zip` - Regenerable build artifact
- `markdown-skill-*.zip` - Versioned packages
- `tests/validation/results/` - Auto-generated
- `*.log`, `*.tmp`, `*.bak` - Temporary files
- `.DS_Store`, `Thumbs.db` - OS files
- `.vscode/`, `.idea/` - Editor config
- `node_modules/` - Dependencies

## Special Notes

### Two-Tier Structure

The project maintains two versions of the skill:

1. **Development** (`SKILL.md` in root) - Comprehensive, all details
2. **Production** (`markdown/SKILL.md`) - Lean, essential only

Both must be kept in sync when making changes.

### Progressive Disclosure

Detailed reference documentation is in `markdown/references/` rather than in
the main SKILL.md file. This keeps the core skill focused while providing
depth when needed.

### Test-Driven Development

The `tests/` directory contains both intentionally flawed files (to verify
markdownlint catches errors) and perfect files (to verify valid markdown
passes).

### Phase-Based Development

The project followed a 6-phase development approach:

0. Research & Requirements
1. Skill Development
2. Test Suite Creation
3. Fine Tuning
4. Documentation
5. Quality Assurance
6. Packaging & Deployment

Documentation for each phase is in `roadwork/`.

## Contributing

When contributing, maintain this structure:

- Core changes → Root files
- Tests → `tests/`
- Examples → `examples/`
- Documentation → Appropriate location
- Phase work → `roadwork/`
- Historical → `archive/`

See `CONTRIBUTING.md` for detailed contribution guidelines.

## Questions?

- **How do I use this skill?** → See `USAGE.md`
- **How do I install it?** → See `CREATE_ZIP_NOW.md`
- **What's the release process?** → See `RELEASE_WORKFLOW.md`
- **What's planned next?** → See `ROADMAP.md`
- **How do I contribute?** → See `CONTRIBUTING.md`

## Version Information

- **Project Version:** 1.1.2
- **Skill Version:** 1.1.2
- **Last Updated:** 2025-10-27
- **Status:** Production Ready
- **License:** MIT

---

**Maintained by:** Keith Gendron  
**Repository:** <https://github.com/RedondoK/claude-md-skill>  
**Issues:** <https://github.com/RedondoK/claude-md-skill/issues>
