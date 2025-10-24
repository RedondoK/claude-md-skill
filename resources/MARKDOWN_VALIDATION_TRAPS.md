# Markdown Validation Traps: Edge Cases and Cross-Platform Compatibility

**Version:** 1.1.0  
**Date:** 2025-10-24  
**Purpose:** Reference guide for markdown edge cases that cause silent failures

## Overview

This document catalogs real-world markdown edge cases discovered through
extensive research of markdownlint rules, GFM specifications, parser
implementation discussions, and production bug reports. These patterns cause
silent failures—producing unexpected output rather than errors—making them
particularly dangerous in production environments.

**Primary Target:** GitHub (GFM)  
**Secondary Targets:** VS Code preview, CommonMark parsers, Jekyll/GitHub Pages

## Critical Edge Cases by Category

### Line Endings and Invisible Whitespace

**Problem:** CRLF vs LF line endings create 40% of validation failures.

Windows CRLF (`\r\n`) leaves carriage return characters that trigger MD009
"trailing spaces" violations when parsers split on `\n` only.

**Solution for this project:**

- Use LF line endings consistently
- Configure Git: `git config --global core.autocrlf input`
- Editor settings: set to LF for `.md` files

**Two-Space Line Breaks:**

Markdown uses two trailing spaces to create `<br>` tags. This conflicts with
auto-formatters that strip trailing whitespace.

**Our standard:** Use two trailing spaces intentionally for line breaks.  
Not an error—it's a feature. Configure MD009 with `br_spaces: 2`.

**Hard tabs vs spaces:**

Some tools render tabs as 4 spaces, others as 8, breaking list indentation.

**Solution:** Never use tabs in markdown. Use spaces only.

### Invisible Character Traps

**Problem:** Non-breaking space characters (U+00A0, `&nbsp;`) look identical
to regular spaces but are not recognized as indentation by markdown parsers.

**Symptoms:**

- Code blocks don't nest properly in lists
- List numbering restarts unexpectedly (MD029)
- Items appear outside list context when rendered
- markdownlint reports missing blank lines around code blocks (MD031)

**Root Cause:**

- AI/LLM-generated content may use nbsp instead of regular spaces
- Copy/paste from websites (HTML frequently uses nbsp)
- Word processor conversions (Word documents contain nbsp characters)
- HTML-to-markdown conversions that don't properly convert `&nbsp;` entities

**Example of the problem:**

When non-breaking spaces (U+00A0) are used for indentation in lists with
nested code blocks, the markdown parser doesn't recognize them as proper
indentation. This causes the code block to be treated as a separate entity,
breaking list continuity.

```markdown
- List item

   ```python  
   code()
   ```

- Next item (will be renumbered as item 1!)
```

In the above example, if those three spaces before the code fence are nbsp
characters instead of regular spaces, the code block won't nest properly and
the next list item will restart numbering.

**Detection:**

Command line:

```bash
# Find all nbsp characters
grep -n $'\u00A0' file.md

# Count non-breaking spaces
grep -o $'\u00A0' file.md | wc -l

# Show hex dump to see character codes
od -c file.md | grep -C2 '240'  # 240 octal = 160 decimal = U+00A0
```

Visual detection in VS Code:

1. View → Render Whitespace (or `Ctrl+Shift+P` → "View: Toggle Render
   Whitespace")
2. Regular spaces appear as small dots: `·`
3. Non-breaking spaces appear as a different symbol or may not show at all
4. Tabs appear as arrows: `→`

**Fix:**

Command line:

```bash
# Replace all nbsp with regular spaces
sed -i 's/\xc2\xa0/ /g' file.md  # UTF-8 encoding of U+00A0
```

VS Code find/replace:

1. Open Find/Replace (`Ctrl+H`)
2. Enable regex mode (click `.*` button)
3. Find: `\u00A0` (matches non-breaking spaces)
4. Replace: ` ` (single regular space)
5. Click Replace All

Or use targeted regex to fix indentation in lists:

- Find: `^(\u00A0+)([-*+]|\d+\.)`
- Replace with proper spaces based on indent level

**Prevention:**

1. Always verify indentation uses regular spaces (U+0020)
2. Enable "Render Whitespace" in editor
3. Run nbsp detection before committing markdown:
   `grep $'\u00A0' *.md && echo "Found nbsp!" || echo "Clean"`
4. Configure editor to convert nbsp to regular spaces on save
5. Be extra careful when copying content from web browsers or Word documents
6. When generating markdown with AI, explicitly verify spacing

**Why this matters for AI-generated markdown:**

Language models may output non-breaking spaces in certain contexts, especially
when trained on HTML/web content or when emulating document formatting. This
is a silent failure—the markdown looks perfect visually but fails validation
in confusing ways.

Always check for invisible characters when:

- Markdown fails validation but looks correct visually
- List numbering behaves unexpectedly
- Code blocks don't maintain list context
- MD029 or MD031 errors appear on seemingly correct code

**Configuration for code blocks in lists:**

The proper way to nest a code block in a list is to use regular spaces for
indentation, matching the list item's content indentation level:

```markdown
- First item

- Second item with code:

   ```python
   # Note: Three regular spaces (U+0020) before the fence
   def example():
       return True
   ```

- Third item (continues list properly)
```

Three spaces (for `-` marker lists) or four spaces (for numbered lists)
before the fence tell the parser this code block is part of the list item.

### Nested List Structures

**Problem:** No universal agreement on 2-space vs 4-space nested list
indentation.

CommonMark and GFM use **marker-relative indentation**: nested content must
align with first non-whitespace character after parent marker.

- Single-character markers (`-`): 2 spaces minimum for nesting
- Numbered markers (`10.`): 4 spaces required for nesting

**Example:**

```markdown
1. First item (marker is 3 chars: "1. ")
   Nested content needs 3-space indent

10. Tenth item (marker is 4 chars: "10. ")
    Nested content needs 4-space indent
```

**Our standard:** Use 2 or 4 spaces consistently. The SKILL recommends 2
spaces for unordered lists (with `-` marker).

**Code blocks inside lists:**

Must be indented to match list content level, not the list marker. Fenced
code blocks need their fences indented too.

```markdown
1. First step

2. Second step with code (4-space indent for ordered lists):

    ```python
    def example():
        return True
    ```

3. Third step
```

**Without proper indentation, the code block ends the list.**

### Table Edge Cases

**Inconsistent column counts:**

When a row has fewer cells than the header, parsers insert empty cells.  
When a row has more cells, excess data is **silently discarded**.

On some platforms, entire columns can be omitted without warning.

**Pipe character conflicts:**

The pipe `|` is both structural syntax and legitimate content.

- Backslash escape: `\|` (works on GitHub)
- HTML entity: `&#124;` (needed on GitLab in some cases)
- Inside inline code: `` `a | b` `` breaks tables on most parsers

**Solution:** Use HTML entities in tables when pipes appear in content:
`&#124;`

**Complex content limitations:**

Fenced code blocks completely break table rendering.  
Lists don't work in cells.

**Workarounds:**

- Use `<pre>` with `<br>` tags for code (loses syntax highlighting)
- Use HTML `<ul>` tags for lists
- Use `&#10;` (newline entity) to preserve syntax highlighting

**Delimiter row requirements:**

Must have at least 3 characters per column (hyphens plus optional colons).  
Two or fewer causes table to render as plain text.

- Valid: `:---`, `---:`, `:---:`
- Invalid: `--`, `: ---` (spaces around colons break alignment)

**Unicode in tables:**

Requires UTF-8 encoding throughout entire toolchain. Encoding mismatches show
as mojibake (`é` becomes `Ã©`).

### HTML Mixing

**Problem:** Markdown inside HTML blocks doesn't parse unless blank lines
separate them.

```html
<!-- Doesn't work -->
<div>**bold**</div>

<!-- Works -->
<div>

**bold**

</div>
```

**GitHub filters dangerous tags:**

`<script>`, `<iframe>`, `<style>`, `<textarea>` are replaced with
`&lt;script&gt;` for security.

**Platform differences:**

- GitHub.com uses CommonMark (strict HTML rules)
- GitHub Pages uses Kramdown (has `markdown="1"` attribute)

Documents render differently on these platforms.

### Auto-Linking Issues

**Nested anchor tags (illegal HTML):**

GFM auto-linking creates nested `<a>` tags:

```markdown
<a href="https://example.com">Visit https://example.com</a>
```

Produces illegal nested anchors that break screen readers.

**URLs with underscores:**

`http://example.com/__word__/path` gets parsed with `__word__` as strong
emphasis, corrupting the link.

**Solution:** Use angle brackets: `<http://example.com/__word__/path>`

**Trailing punctuation:**

`Visit https://example.com.` usually excludes the period, but this heuristic
fails when URLs legitimately end with punctuation.

**Parentheses in URLs:**

`https://example.com/page_(section)` frequently has closing parenthesis
excluded from the link.

**No standard way to disable auto-linking:**

Workarounds:

- Zero-width element: `ht<span></span>tp://example.com`
- HTML entities: `https&#58;//example.com`
- Inline code: `` `https://example.com` `` (but displays as code)

### Link Reference Placement

**Placement rules:**

Reference definitions **cannot interrupt paragraphs**.  
A blank line is required before the definition after paragraph text.

However, definitions can follow headings directly without blank lines.

**Example:**

```markdown
Some paragraph text.
[ref]: /url    <!-- This becomes part of the paragraph -->

<!-- Correct: -->
Some paragraph text.

[ref]: /url    <!-- This is a valid reference -->
```

**URLs with spaces:**

Must use angle brackets: `[ref]: <url with spaces>`

Without brackets, only `url` is treated as destination, `with` and `spaces`
are ignored.

### Heading Anchor Generation

**Problem:** No universal standard for duplicate heading IDs.

**GitHub:** Appends `-1`, `-2`, etc.

- `## Installation` becomes `#installation`
- Second `## Installation` becomes `#installation-1`

**Other parsers:** May use parent prefixes or leave duplicates.

**Special characters:**

GitHub converts to lowercase, removes special characters, replaces spaces with
hyphens.

`## Fruits & Vegetables (e.g.: strawberry)` becomes
`#fruits--vegetables-eg-strawberry`

Note the double hyphens where `&` was removed.

**Non-ASCII characters:**

GitHub removes them entirely. `## 日本語` becomes `#--` (effectively invalid).

This breaks internationalization for anchor linking.

**GitHub's `user-content-` prefix:**

HTML has `<h2 id="user-content-installation">` but links use `#installation`.  
JavaScript translates client-side. Static site generators must implement this
or links break.

### GFM-Specific Implementation Gaps

**Single tilde strikethrough:**

`~text~` works on GitHub.com but GFM spec requires `~~text~~`.

Choose: spec compliance (breaks on GitHub) or match GitHub (breaks with spec
parsers).

**Task list restrictions:**

- Checkbox must appear at start of first paragraph only
- Ordered lists show numbers + checkboxes (numbers hidden by CSS)
- Different implementations vary

**2017 CommonMark migration:**

Broke thousands of GitHub documents when parser switched:

- `#Heading` required changing to `# Heading` (space after hash)
- `[link] (url)` required changing to `[link](url)` (no space)

**Performance issues:**

Deep nesting (thousands of brackets/blockquotes) causes quadratic slowdown in
even optimized parsers.

Pattern `<<<<<<<<<<:/:/:/:/:/:/:/:/:/:/:` causes O(n³) backtracking in some
implementations.

## Markdownlint Rule Gotchas

**MD044 proper names:**

Too greedy—tries to fix names even inside code blocks and paths.

With `"proper-names": { "names": ["Docker"] }`, tries changing
`docker.service` to `Docker.service`, corrupting technical content.

**Workaround:** Set `code_blocks: false` or disable rule around code.

**MD046 code block style:**

Requires consistent style (fenced vs indented), but legitimate documents need
both: indented inside lists (where fencing breaks continuity), fenced
elsewhere (for syntax highlighting).

**MD013 line length:**

Default 80 characters is impractical for long URLs, wide tables, code.

**Recommended config:**

- Extend to 120 characters
- Exclude tables: `"tables": false"`
- Keep checking headings

**Configuration precedence:**

Project `.markdownlint.json` completely overrides VS Code settings (doesn't
merge). Developers expect merging—this causes confusion.

**Inline rule control:**

```html
<!-- markdownlint-disable MD013 MD033 -->
problematic content here
<!-- markdownlint-enable MD013 MD033 -->
```

Or for single line:

```html
<!-- markdownlint-disable-next-line MD013 -->
```

These must be valid HTML comments.

## Best Practices for Maximum Compatibility

### Defensive Authoring Checklist

- [ ] Always use blank lines before tables and fenced code blocks
- [ ] Stick to simple tables; use HTML for complex layouts
- [ ] Wrap problematic URLs in angle brackets
- [ ] Use LF line endings exclusively (configure Git/editor)
- [ ] Save files as UTF-8 without BOM
- [ ] Verify indentation uses regular spaces only (no nbsp, no tabs)
- [ ] Test rendering on target platform (GitHub, VS Code, etc.)
- [ ] Run markdownlint with platform-specific configuration
- [ ] Avoid nesting beyond two levels
- [ ] Use fenced code blocks everywhere (never indented blocks)
- [ ] Escape all pipe characters in tables: `&#124;`

### Two-Space Line Break Standard

**This project uses two trailing spaces for line breaks intentionally.**

This is not an error—it's the standard markdown way to create `<br>` tags
without starting a new paragraph.

When you want a line break within a list item or paragraph:

```markdown
First line of text  
Second line (line break but same paragraph)

New paragraph (blank line creates paragraph break)
```

Configure markdownlint MD009 with `br_spaces: 2` to accept this pattern.

### Platform-Specific Considerations

**For GitHub (primary target):**

- Use GFM tables format
- Auto-linking works without angle brackets
- Strikethrough: use `~~text~~` (double tilde)
- Task lists: `- [ ]` and `- [x]`
- Heading anchors: GitHub format (lowercase, hyphenated)

**For VS Code preview:**

- Renders most GFM correctly
- Extensions may add markdownlint integration
- Check preview matches GitHub rendering

**For CommonMark parsers:**

- Strict HTML block rules apply
- Auto-linking may differ from GFM
- No task list support (extension needed)

**For Jekyll/GitHub Pages:**

- Uses Kramdown (not CommonMark)
- Has `markdown="1"` attribute for HTML blocks
- Different link resolution than GitHub.com

### Safe Markdown Subset

To ensure maximum compatibility across all parsers:

1. **Lists:** Use `-` exclusively, 2-space or 4-space indent consistently
2. **Headings:** ATX style (`#`) only, always include space after hashes
3. **Code blocks:** Fenced only (never indented), always specify language
4. **Links:** Use `[text](url)` or `<url>` (no space between parts)
5. **Emphasis:** `**bold**` and `*italic*` (no underscores)
6. **Tables:** Keep simple, avoid complex content, use HTML entities for pipes
7. **Line endings:** LF only (set `core.autocrlf input` in Git)
8. **Encoding:** UTF-8 without BOM
9. **Line length:** Break at 80 characters (or project standard)
10. **Blank lines:** Always surround lists, headings, code blocks
11. **Spacing:** Use regular spaces (U+0020) only, never nbsp or tabs

## Testing and Validation

**Validation workflow:**

1. Write markdown following SKILL.md guidelines
2. Run markdownlint locally: `markdownlint filename.md`
3. Check for invisible characters: `grep $'\u00A0' filename.md`
4. Fix all violations before committing
5. Test rendering on GitHub (create draft PR or gist)
6. Check VS Code preview for consistency
7. Verify links work (including anchors)

**Tools:**

- markdownlint-cli: Command-line validator
- VS Code markdownlint extension: Real-time feedback
- GitHub preview: Final authority for GFM rendering
- grep/sed: Command-line tools for detecting/fixing invisible characters

**Common test cases:**

Create test documents with:

- Nested lists (3 levels deep)
- Tables with pipes in content
- Code blocks in lists
- Links with underscores in URLs
- Non-ASCII characters in headings
- Long lines that need breaking
- Intentional nbsp characters (for detection testing)

Validate these render correctly on all target platforms.

## Version History

### v1.1.0 (2025-10-24)

- **CRITICAL:** Added Invisible Character Traps section for nbsp detection
- Updated Defensive Authoring Checklist with spacing verification
- Updated Safe Markdown Subset with spacing guideline
- Updated Testing and Validation with nbsp detection step
- Enhanced validation workflow with invisible character checks
- This update directly addresses NBSP issues found in SKILL.md itself

### v1.0.0 (2025-10-24)

- Initial release documenting markdown edge cases
- Compiled from research on markdownlint rules, GFM specifications
- Added platform-specific guidance (GitHub, VS Code, CommonMark)
- Established two-space line break standard for project
- Created defensive authoring checklist
- Documented safe markdown subset for maximum compatibility

## Additional Resources

- [GitHub Flavored Markdown Spec](https://github.github.com/gfm/)
- [CommonMark Specification](https://commonmark.org/)
- [markdownlint Rules](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md)
- [Markdown Guide](https://www.markdownguide.org/)

## Contributing

Found an edge case not documented here? Please contribute by:

1. Documenting the edge case with examples
2. Explaining why it causes problems
3. Providing workarounds or solutions
4. Testing across multiple platforms
5. Submitting a pull request

This document is a living reference—we expect it to grow as new edge cases
are discovered in production use.
