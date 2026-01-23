# GitHub Release Creation Guide - Version 1.2.0

**Date:** 2025-11-10  
**Release:** v1.2.0  
**Repository:** RedondoK/claude-md-skill

## Prerequisites

### 1. Ensure Everything is Committed and Pushed

```bash
cd /c/Users/kgend/Projects/md_skill_md

# Commit all changes
git commit -F roadwork/COMMIT_MESSAGE_v1.2.0.txt

# Tag the release
git tag -a v1.2.0 -m "Version 1.2.0: Professional quality rules"

# Push everything
git push origin main
git push origin v1.2.0
```

**Verify pushed:**

```bash
# Check remote tags
git ls-remote --tags origin

# Should show: refs/tags/v1.2.0
```

### 2. Create the Skill Package

```bash
# Generate markdown.zip
python create_zip.py

# Verify file exists
ls -lh markdown.zip

# Should show: markdown.zip (approximately 50-60 KB)
```

**Keep this file ready** - you'll upload it to the release.

## Step-by-Step: Creating the GitHub Release

### Step 1: Navigate to Releases Page

1. Open your browser
1. Go to: <https://github.com/RedondoK/claude-md-skill>
1. Click the **"Releases"** link on the right sidebar
   - It's between "About" and "Packages"
   - Shows current release count (e.g., "X releases")

**Direct link:** <https://github.com/RedondoK/claude-md-skill/releases>

### Step 2: Create New Release

1. Click the green **"Draft a new release"** button (top right)
   - Or click **"Create a new release"** if this is your first release

This opens the release creation form.

### Step 3: Choose Your Tag

**Option A: Tag Already Pushed (Recommended)**

1. Click the **"Choose a tag"** dropdown
1. Select **"v1.2.0"** from the list
   - Should show: `v1.2.0` with a green checkmark
   - Shows: "Existing tag"

**Option B: Create Tag During Release**

If you didn't push the tag yet:

1. Click **"Choose a tag"**
1. Type: **v1.2.0**
1. Click **"+ Create new tag: v1.2.0 on publish"**
1. Keep **"Target: main"** selected

### Step 4: Release Title

In the **"Release title"** field, enter:

```text
Version 1.2.0: Professional Quality Rules
```

### Step 5: Release Description

Click in the large **"Describe this release"** text area.

**Option A: Use Prepared Notes (Recommended)**

1. Open `roadwork/RELEASE_NOTES_v1.2.0.md` in VS Code
1. Select all content (Ctrl+A)
1. Copy (Ctrl+C)
1. Paste into GitHub release description field

**Option B: Manual Entry**

Start typing or paste custom release notes.

**GitHub will render markdown preview** on the "Preview" tab - check it looks good!

### Step 6: Attach the Skill Package

This is **critical** - users need this file!

1. Scroll down to the **"Attach binaries"** section at the bottom
1. Click the dashed box or drag/drop **"markdown.zip"**
1. Wait for upload progress (should be quick, ~50-60 KB)
1. Verify file appears: `markdown.zip` with a checkmark

**The ZIP file will be automatically available for download on the release page.**

### Step 7: Release Options

Review these checkboxes:

- [ ] **Set as a pre-release** - Leave UNCHECKED (this is production)
- [ ] **Set as the latest release** - Leave CHECKED (default)
  - This makes it the featured release on your repo
- [x] **Create a discussion for this release** - OPTIONAL
  - Check if you want auto-created discussion thread
  - Appears in Discussions tab

### Step 8: Generate Release Notes (Optional)

GitHub can auto-generate release notes from commits:

1. Click **"Generate release notes"** button (top right of description area)
1. GitHub will populate with:
   - Commit messages since last release
   - New contributors
   - Full changelog link
1. **You can edit** this auto-generated content
1. **Or keep your custom notes** - delete auto-generated if you prefer

**Recommendation:** Keep your custom notes from RELEASE_NOTES_v1.2.0.md as
they're more polished and user-focused.

### Step 9: Preview Your Release

1. Click the **"Preview"** tab (next to "Write")
1. Review how the markdown renders
1. Check all sections look correct
1. Verify emoji render properly (🎯 ✨ 📈 etc.)
1. Click back to **"Write"** to make any edits

### Step 10: Publish the Release

**Two Options:**

**Option A: Publish Immediately**

1. Click the green **"Publish release"** button at the bottom
1. GitHub will:
   - Create the release
   - Tag the commit (if not already tagged)
   - Make markdown.zip available for download
   - Send notifications to watchers
   - Update the "latest release" badge

**Option B: Save as Draft**

1. Click **"Save draft"** (gray button next to Publish)
1. Come back later to review/edit
1. Find it under "Releases" → "Drafts"
1. Click "Edit" → then "Publish release"

**Recommended:** Publish immediately - you've prepared everything!

## After Publishing

### Verify the Release

1. Go to: <https://github.com/RedondoK/claude-md-skill/releases>
1. Check you see: **v1.2.0 - Version 1.2.0: Professional Quality Rules**
1. Verify:
   - [x] Release notes display correctly
   - [x] markdown.zip is listed under "Assets"
   - [x] Tag v1.2.0 appears
   - [x] "Latest" badge is green

### Download Link

Your skill package is now available at:

```text
https://github.com/RedondoK/claude-md-skill/releases/download/v1.2.0/markdown.zip
```

Users can also click **"markdown.zip"** under Assets on the release page.

### Update README Badges (Optional)

If you have version badges in README.md, update them:

```markdown
![Version](https://img.shields.io/badge/version-1.2.0-blue)
![Release](https://img.shields.io/github/v/release/RedondoK/claude-md-skill)
```

### Share the Release

**Post about it:**

- LinkedIn (you have content prepared!)
- Twitter/X
- Reddit (r/ClaudeAI, r/ArtificialIntelligence)
- Claude Discord
- Hacker News (if it gains traction)

**Direct link to share:**

```text
https://github.com/RedondoK/claude-md-skill/releases/tag/v1.2.0
```

## Troubleshooting

### "Tag already exists" Error

**Solution:** You pushed the tag already - this is correct!

- Use **"Choose a tag"** → Select existing **v1.2.0**
- Don't create a new tag

### Can't Find "Releases" Link

**Solution:** On repository main page, right sidebar:

```text
About
↓
Releases (X releases) ← Click here
↓
Packages
```

### Markdown.zip Upload Fails

**Solution:**

- Check file size (should be < 1 MB)
- Try different browser (Chrome/Edge/Firefox)
- Re-create ZIP if corrupted: `python create_zip.py`

### Release Notes Don't Render

**Solution:**

- Check markdown syntax in Preview tab
- Ensure no special characters breaking formatting
- Copy/paste may include hidden characters - retype if needed

### Want to Edit After Publishing

**Solution:**

1. Go to release page
1. Click **"Edit release"** button (top right)
1. Make changes
1. Click **"Update release"**

Releases can be edited anytime!

### Want to Delete and Start Over

**Solution:**

1. Go to release page
1. Click **"Edit release"**
1. Scroll to bottom
1. Click **"Delete release"** (red button)
1. Confirm deletion
1. Start over with "Draft a new release"

**Note:** This does NOT delete the git tag - tag remains in repository.

## Quick Reference

### Essential URLs

- **Repository:** <https://github.com/RedondoK/claude-md-skill>
- **Releases:** <https://github.com/RedondoK/claude-md-skill/releases>
- **New Release:** <https://github.com/RedondoK/claude-md-skill/releases/new>
- **Tags:** <https://github.com/RedondoK/claude-md-skill/tags>

### Git Commands

```bash
# Check current tags
git tag -l

# Check remote tags
git ls-remote --tags origin

# View tag details
git show v1.2.0

# Delete local tag (if needed)
git tag -d v1.2.0

# Delete remote tag (if needed)
git push origin --delete v1.2.0
```

## Best Practices

### Release Naming Convention

- **Tag:** `v1.2.0` (with 'v' prefix)
- **Title:** `Version 1.2.0: Professional Quality Rules` (descriptive)

### Release Notes Structure

1. Overview (what this release does)
1. New features (bulleted list)
1. Improvements (what changed)
1. Metrics (quantifiable impact)
1. Installation instructions
1. What's inside (package contents)
1. Testing status
1. Links to documentation
1. Upgrade notes
1. What's next (future plans)

### Timing

- **Best time:** Weekday mornings (9-11 AM your timezone)
- **Avoid:** Weekends, holidays, Friday afternoons
- **Why:** Maximum visibility when developers are active

### File Attachments

- **Always include:** Primary artifact (markdown.zip)
- **Consider including:**
  - Source code (GitHub auto-generates)
  - Checksum file (for verification)
  - Quick start PDF (optional)

### Versioning

Follow Semantic Versioning (semver):

- **Major (X.0.0):** Breaking changes
- **Minor (1.X.0):** New features, backward compatible
- **Patch (1.2.X):** Bug fixes only

This release: **1.2.0** = Minor (new features, no breaking changes)

## Checklist

Before publishing, verify:

- [x] All changes committed and pushed
- [x] Tag v1.2.0 created and pushed
- [x] markdown.zip created and tested
- [x] Release notes prepared and reviewed
- [x] Version numbers consistent across all files
- [x] CHANGELOG.md updated
- [x] README.md updated
- [ ] Release title descriptive
- [ ] Release notes comprehensive
- [ ] markdown.zip attached
- [ ] "Latest release" checkbox checked
- [ ] Preview looks good
- [ ] Ready to publish!

## Post-Release

After publishing:

- [ ] Verify release appears on GitHub
- [ ] Download markdown.zip and test installation
- [ ] Update any external documentation
- [ ] Share on social media
- [ ] Monitor for issues/questions
- [ ] Close related issues/PRs
- [ ] Update project board
- [ ] Celebrate! 🎉

---

**You're ready to create the release!** Follow the steps above and you'll have
v1.2.0 published in minutes.

Good luck! 🚀
