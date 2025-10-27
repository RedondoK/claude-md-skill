# Release Workflow

**Purpose:** Document the complete process for creating and releasing new
versions of the markdown skill.

**Audience:** Maintainers creating new releases

## Overview

This workflow covers:

1. Version preparation and testing
2. Creating the distribution package
3. GitHub release process
4. Deployment to Claude
5. Post-release verification

## Version Numbering

Follow Semantic Versioning (SemVer):

- **MAJOR.MINOR.PATCH** (e.g., 1.2.3)
- **MAJOR:** Breaking changes (rare for documentation skills)
- **MINOR:** New features, significant improvements
- **PATCH:** Bug fixes, minor corrections

**Current Version:** 1.1.2

## Pre-Release Checklist

### 1. Update Version Numbers

Update version in these files:

- [ ] `SKILL.md` (root)
- [ ] `markdown/SKILL.md`
- [ ] `markdown/README.md`
- [ ] `README.md` (root)
- [ ] `CHANGELOG.md`

### 2. Update CHANGELOG.md

Add entry for new version:

```markdown
### vX.Y.Z (YYYY-MM-DD)

- Feature/fix description
- Another change
- Impact assessment
```

### 3. Test Everything

Run validation suite:

```bash
# Test all files
cd tests
./run-tests.sh    # Unix/Mac
run-tests.bat     # Windows

# Validate skill documents
markdownlint SKILL.md
markdownlint markdown/SKILL.md
markdownlint README.md
```

Expected: Zero violations across all files

### 4. Verify Documentation

Check that all documentation is current:

- [ ] README.md reflects latest features
- [ ] USAGE.md is up to date
- [ ] examples/ folder has relevant examples
- [ ] rules/ documentation is accurate

## Creating the Distribution Package

### Step 1: Clean Previous Builds

Remove old distribution files:

```bash
# Remove old ZIP
rm markdown.zip  # Unix/Mac
del markdown.zip # Windows
```

### Step 2: Create Package

Run one of the packaging scripts:

```bash
# Option 1: Python (recommended for automation)
python create_zip.py

# Option 2: Windows Batch (manual)
create-skill-zip.bat

# Option 3: Bash (Unix/Mac/Git Bash)
./create-skill-zip.sh
```

### Step 3: Verify Package Contents

Check the ZIP file:

```bash
# List contents (Unix/Mac)
unzip -l markdown.zip

# List contents (Windows PowerShell)
Expand-Archive -Path markdown.zip -DestinationPath temp_check
tree temp_check /F
rmdir /s /q temp_check
```

Expected structure:

```text
markdown.zip
└── markdown/
    ├── SKILL.md
    ├── README.md
    ├── LICENSE
    └── references/
        ├── .markdownlintrc
        ├── complete-rules.md
        ├── edge-cases.md
        ├── examples.md
        └── README.md
```

### Step 4: Test the Package

Extract and test locally:

```bash
# Extract to temp location
unzip markdown.zip -d temp_test

# Validate extracted files
cd temp_test/markdown
markdownlint SKILL.md
markdownlint README.md
cd ../..
rm -rf temp_test
```

## GitHub Release Process

### Step 1: Commit and Tag

```bash
# Stage all changes
git add .

# Commit with version message
git commit -m "Release v1.X.Y: Brief description"

# Create annotated tag
git tag -a v1.X.Y -m "Version 1.X.Y - Description"

# Push commits and tags
git push origin main
git push origin v1.X.Y
```

### Step 2: Create GitHub Release

1. Go to <https://github.com/RedondoK/claude-md-skill/releases>
2. Click "Draft a new release"
3. Choose tag: `v1.X.Y`
4. Release title: `Version 1.X.Y - Title`
5. Description: Copy from CHANGELOG.md entry
6. Attach `markdown.zip` file
7. Click "Publish release"

### Release Description Template

```markdown
## What's New in v1.X.Y

[Brief summary of changes]

### Features

- New feature 1
- New feature 2

### Improvements

- Enhancement 1
- Enhancement 2

### Bug Fixes

- Fix 1
- Fix 2

### Installation

Download `markdown.zip` and upload to Claude:
1. Go to Claude Settings > Capabilities
2. Enable Code execution and file creation
3. Upload markdown.zip
4. Toggle skill ON

See README.md for detailed installation instructions.

### Full Changelog

See [CHANGELOG.md](CHANGELOG.md) for complete version history.
```

## Deploying to Claude

### For Maintainers

Test the release yourself first:

1. Download `markdown.zip` from GitHub release
2. Go to <https://claude.ai/settings/capabilities>
3. Upload the ZIP file
4. Toggle skill ON
5. Test with: "Create a README.md for a sample project"
6. Verify zero markdownlint violations

### For Users

Update the README.md with installation instructions (already done in main
README).

## Post-Release Verification

### 1. Test in Production

Create test queries with Claude:

```text
Test 1: "Create a README.md for a Python data analysis project"
Test 2: "Generate a CONTRIBUTING.md file for an open source project"
Test 3: "Write documentation for a REST API with multiple endpoints"
```

Verify:

- [ ] Claude automatically uses the skill
- [ ] Generated markdown has zero violations
- [ ] All formatting rules are followed
- [ ] No regressions from previous version

### 2. Monitor for Issues

Watch for:

- User feedback on GitHub Issues
- Claude behavior anomalies
- New edge cases discovered
- Rule interpretation problems

### 3. Update Documentation

If issues are found:

1. Document in GitHub Issues
2. Plan fix for next patch version
3. Update tracking in project board

## Quick Reference Commands

### Create Distribution Package

```bash
python create_zip.py
```

### Validate Everything

```bash
markdownlint **/*.md --ignore node_modules --ignore archive
```

### Create Release

```bash
git add .
git commit -m "Release v1.X.Y: Description"
git tag -a v1.X.Y -m "Version 1.X.Y"
git push origin main --tags
```

## Automated Release (Future)

### GitHub Actions Workflow (Planned)

```yaml
# .github/workflows/release.yml
name: Create Release Package

on:
  push:
    tags:
      - 'v*'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Create ZIP
        run: python create_zip.py
      - name: Upload to Release
        uses: actions/upload-release-asset@v1
        with:
          upload_url: ${{ github.event.release.upload_url }}
          asset_path: ./markdown.zip
          asset_name: markdown.zip
          asset_content_type: application/zip
```

## Version History Tracking

Document each release in these locations:

1. **CHANGELOG.md** - Detailed changes
2. **README.md** - Version History section
3. **GitHub Releases** - Full release notes
4. **Git Tags** - Version markers
5. **markdown/SKILL.md** - Version in frontmatter

## Emergency Patch Process

For critical fixes:

1. Create hotfix branch: `git checkout -b hotfix/1.X.Y`
2. Make minimal necessary changes
3. Test thoroughly
4. Increment PATCH version
5. Follow standard release process
6. Merge back to main

## Long-Term Maintenance

### Quarterly Reviews

Every 3 months:

- [ ] Review markdownlint rule changes
- [ ] Test with latest Claude version
- [ ] Update examples if needed
- [ ] Refresh documentation
- [ ] Consider community feedback

### Annual Updates

Once per year:

- [ ] Major documentation refresh
- [ ] Review all examples
- [ ] Update test suite
- [ ] Consider MINOR version bump

## File Locations Reference

**Distribution scripts:**

- `create_zip.py` - Python packaging script
- `create-skill-zip.bat` - Windows batch script
- `create-skill-zip.sh` - Bash packaging script

**Output:**

- `markdown.zip` - Distribution package (created in repo root)

**Source for distribution:**

- `markdown/` folder - Contains all files that go into markdown.zip

**Version numbers to update:**

- `SKILL.md` (root)
- `markdown/SKILL.md`
- `markdown/README.md`
- `README.md`
- `CHANGELOG.md`

## Support Channels

For release questions:

- GitHub Issues: <https://github.com/RedondoK/claude-md-skill/issues>
- GitHub Discussions: <https://github.com/RedondoK/claude-md-skill/discussions>

## Success Criteria

A release is successful when:

- ✅ All tests pass with zero violations
- ✅ Package creates without errors
- ✅ GitHub release is published
- ✅ ZIP file is attached to release
- ✅ Documentation is updated
- ✅ Version numbers are consistent
- ✅ Personal testing in Claude succeeds
- ✅ No critical issues reported within 48 hours

## Rollback Procedure

If a release has critical issues:

1. Document the issue in GitHub
2. Revert to previous tag: `git revert v1.X.Y`
3. Create new patch with fix
4. Release as v1.X.(Y+1)
5. Update all documentation about the issue

## Notes

- Always test the ZIP file before releasing
- Never skip validation steps
- Keep CHANGELOG.md up to date
- Use semantic versioning consistently
- Tag releases in Git for easy rollback
- Attach ZIP to GitHub releases for easy user access

---

**Last Updated:** 2025-10-27
**Current Version:** 1.1.2
**Next Review:** 2026-01-27
