# GitHub Flavored Markdown (GFM) Skill

**Version:** 1.1.0
**Purpose:** Transform AI markdown generation to be 100% markdownlint-compliant
**Target:** Zero markdownlint violations in all generated markdown

## Overview

This skill provides comprehensive guidance for generating GitHub Flavored
Markdown (GFM) that passes markdownlint validation without errors. Markdown
generated using this skill should be immediately usable in VSCode without
validation warnings. This skill is used whenever markdown is generated, unless
contrary instructions are given.

## Core Principles

### 1. Blank Lines Are Not Optional

**CRITICAL:** Blank lines around block elements are MANDATORY, not stylistic
choices.

Required blank lines:

- Before and after ALL lists (MD032)
- Before and after ALL headings (MD022)
- Before and after ALL code blocks (MD031)
- Between ALL block-level elements

### 2. Consistency Is Required

- Use ONE list marker style throughout (`-` recommended)
- Use ONE heading style throughout (ATX `#` recommended)
- Maintain consistent indentation
- Follow consistent patterns

### 3. Structure Matters

- Heading hierarchy must increment by one (1→2→3, not 1→3)
- Only ONE level 1 heading per document
- Headings must start at line beginning (no indentation)
- Files must end with exactly one newline

## Pre-Generation Checklist

Before generating ANY markdown, mentally review:

- [ ] Where will lists appear? (Plan blank lines before/after)
- [ ] Where will headings appear? (Plan blank lines before/after)
- [ ] Where will code blocks appear? (Plan blank lines before/after)
- [ ] What heading levels are needed? (Verify progression)
- [ ] What list style will I use? (Stick to `-` throughout)
- [ ] Does the content need a language identifier for code? (Always specify)
- [ ] Are any lines too long? (Keep under 80 characters when possible)
- [ ] Will I need line breaks within paragraphs? (Use two trailing spaces)

## Generation Rules

### Rule 1: Lists (MD032, MD004)

**ALWAYS:**

- Add blank line BEFORE list
- Add blank line AFTER list
- Use consistent markers (use `-` exclusively)
- Maintain proper indentation for nested items

**Template:**

```markdown
Preceding paragraph text.

- First item
- Second item
- Third item

Following paragraph text.
```

**NEVER:**

```markdown
Text before
- Item 1
- Item 2
Text after
```

### Rule 2: Headings (MD001, MD003, MD022, MD023)

**ALWAYS:**

- Add blank line BEFORE heading (except at document start)
- Add blank line AFTER heading
- Use ATX style (`#` prefix)
- Include space after `#`
- Start at line beginning (no indentation)
- Increment levels by one only

**Template:**

```markdown
Previous paragraph.

## Section Heading

Content following the heading.

### Subsection

More content here.
```

**NEVER:**

```markdown
Text
## Heading
Text

# Main
### Subsection (skipped level 2!)
```

### Rule 3: Code Blocks (MD031, MD040)

**ALWAYS:**

- Add blank line BEFORE code block
- Add blank line AFTER code block
- Specify language identifier
- Use ``` for fencing (not ~~~)

**Template:**

````markdown
Here's an example:

```python
def hello():
    print("Hello, World!")
```

The code demonstrates...
````

**NEVER:**

````markdown
Here's an example:
```
code here
```
More text.
````

### Rule 4: Line Length (MD013)

**ALWAYS:**

- Keep lines under 80 characters when possible
- Break long paragraphs at natural points
- Split long sentences across multiple lines
- Watch for long URLs and file paths

**When Line Length Matters:**

- Prose text and paragraphs
- Headings and titles
- List items
- Link text

**When Line Length Is Often Ignored:**

- Code blocks (usually excluded by default)
- URLs that cannot be shortened
- Tables with required width
- HTML tags and comments

**Breaking Long Lines:**

```markdown
Wrong (95 characters):
This is a very long line that exceeds the recommended 80 character limit and should be broken up.

Right (two lines under 80 chars):
This is a very long line that exceeds the recommended 80 character limit
and should be broken up.
```

**Handling Long URLs:**

```markdown
Option 1 - Reference style:
Check the [documentation][docs] for more details.

[docs]: https://very-long-url-that-would-exceed-line-length-limit.com/path/to/page

Option 2 - Angle brackets (auto-link):
<https://very-long-url.com/path>
```

**Note:** The default limit is 80 characters. Some projects configure this
differently (100, 120, or disabled). When generating markdown, assume 80
unless told otherwise.

### Rule 5: Inline Elements and Line Breaks

**Code spans:**

- No spaces inside: `code` not ` code `
- Use for short references only

**Emphasis:**

- **Bold:** Use `**text**` (no spaces inside)
- *Italic:* Use `*text*` (no spaces inside)
- ***Both:*** Use `***text***`

**Links:**

- Standard: `[text](url)`
- Auto: `<https://example.com>`
- Reference: `[text][ref]` with `[ref]: url` elsewhere
- URLs with underscores: Use angle brackets `<http://example.com/__word__/>`

**Line breaks with two trailing spaces:**

**IMPORTANT:** Use two trailing spaces to create line breaks (`<br>` tags)
within paragraphs or list items WITHOUT starting a new paragraph.

```markdown
First line of text
Second line (line break but same paragraph)

New paragraph (blank line creates paragraph break)
```

This is the standard markdown way to create line breaks. It is NOT an error.

Configure markdownlint MD009 with `br_spaces: 2` to accept this pattern.

### Rule 6: File Structure

**Document Start:**

```markdown
# Document Title

Introduction paragraph.

## First Section
```

No blank line needed before first heading, but blank line after is required.

**Document End:**

End files with exactly one newline character (MD047).

### Rule 7: Special Elements

**Horizontal Rules:**

Use consistent style (`---`, `***`, or `___`):

```markdown
Preceding text.

---

Following text.
```

**Blockquotes:**

```markdown
Regular text.

> Quote line 1
> Quote line 2

More regular text.
```

**Tables:**

```markdown
Previous paragraph.

| Header 1 | Header 2 |
|----------|----------|
| Cell 1   | Cell 2   |
| Cell 3   | Cell 4   |

Next paragraph.
```

**Task Lists:**

```markdown
Previous text.

- [ ] Incomplete task
- [x] Complete task
- [ ] Another task

Following text.
```

## Critical Error Prevention

### Error Pattern 1: List Without Blank Lines

**Wrong:**

```markdown
Here are the items:
- Item 1
- Item 2
Let's continue.
```

**Right:**

```markdown
Here are the items:

- Item 1
- Item 2

Let's continue.
```

### Error Pattern 2: Heading Without Blank Lines

**Wrong:**

```markdown
Previous paragraph.
## Heading
Next paragraph.
```

**Right:**

```markdown
Previous paragraph.

## Heading

Next paragraph.
```

### Error Pattern 3: Code Block Without Blank Lines

**Wrong:**

````markdown
Here's the code:
```python
print("hello")
```
That's it.
````

**Right:**

````markdown
Here's the code:

```python
print("hello")
```

That's it.
````

### Error Pattern 4: Inconsistent List Markers

**Wrong:**

```markdown
- Item 1
* Item 2
+ Item 3
```

**Right:**

```markdown
- Item 1
- Item 2
- Item 3
```

### Error Pattern 5: Skipping Heading Levels

**Wrong:**

```markdown
# Main Title

### Subsection (skipped level 2!)
```

**Right:**

```markdown
# Main Title

## Section

### Subsection
```

### Error Pattern 6: Lines Too Long

**Wrong (106 characters):**

```markdown
This document demonstrates correct code block formatting with proper blank lines and language identifiers.
```

**Right (79 characters):**

```markdown
This document demonstrates correct code block formatting with proper spacing.
```

**Or break into multiple lines:**

```markdown
This document demonstrates correct code block formatting with proper blank
lines and language identifiers.
```

**Wrong:**

```markdown
# Main Title

### Subsection (skipped level 2!)
```

**Right:**

```markdown
# Main Title

## Section

### Subsection
```

## Language Identifiers for Code Blocks

Always specify the language. Common identifiers:

**Programming Languages:**

- `python`, `javascript`, `java`, `c`, `cpp`, `csharp`, `go`, `rust`
- `ruby`, `php`, `swift`, `kotlin`, `typescript`, `r`

**Shell/Command:**

- `bash`, `sh`, `powershell`, `cmd`, `zsh`

**Markup/Data:**

- `html`, `css`, `xml`, `json`, `yaml`, `toml`, `markdown`

**Database:**

- `sql`, `postgresql`, `mysql`, `mongodb`

**Other:**

- `text` (for plain text)
- `diff` (for diffs)
- `log` (for log files)

## Nesting and Complex Structures

### Lists with Code Blocks

Proper indentation maintains list context:

```markdown
1. First step

2. Second step with code:

    ```python
    def example():
        return True
    ```

3. Third step

Done.
```

### Lists with Multiple Paragraphs

Indent continuation paragraphs:

```markdown
- First item

- Second item with multiple paragraphs

  This is the continuation of the second item. It must be indented to maintain list context.

  Even more content in the second item.

- Third item

End.
```

### Nested Lists

Consistent indentation (2 or 4 spaces):

```markdown
- Parent item
  - Child item
  - Another child
    - Grandchild item
  - Back to child
- Another parent

Done.
```

## Post-Generation Validation

After generating markdown, verify:

1. **Lists:** Every list has blank lines before and after
2. **Headings:** Every heading has blank lines before and after (except
   document start)
3. **Code blocks:** Every code block has blank lines before and after
4. **Heading levels:** Progression is 1→2→3→4, no skipping
5. **List markers:** All use `-` consistently
6. **Code languages:** Every code block has a language identifier
7. **Line length:** Lines under 80 characters (check long descriptions)
8. **File ending:** File ends with exactly one newline
9. **Line breaks:** Two trailing spaces used intentionally, not accidentally

## Mental Model for Generation

Think of markdown as **blocks with mandatory spacing:**

```text
[Text Block]
↓ BLANK LINE ↓
[Heading Block]
↓ BLANK LINE ↓
[Text Block]
↓ BLANK LINE ↓
[List Block]
↓ BLANK LINE ↓
[Text Block]
↓ BLANK LINE ↓
[Code Block]
↓ BLANK LINE ↓
[Text Block]
[EOF + newline]
```

**Every block transition = blank line required**

## Quick Reference Card

### Every Time You Generate a List

```markdown
text

- item
- item

text
```

### Every Time You Generate a Heading

```markdown
text

## Heading

text
```

### Every Time You Generate Code

````markdown
text

```language
code
```

text
````

### Every Time You Nest Lists

```markdown
- parent
  - child (2 or 4 space indent)
  - child
- parent
```

### Every Time You Need a Line Break

```markdown
First line
Second line (note the two spaces after "First line")
```

## Validation Command

Users will validate generated markdown with:

```bash
markdownlint filename.md
```

**Goal:** Zero errors, zero warnings.

## Common User Scenarios

### Scenario 1: Technical Documentation

Requirements:

- Clear heading hierarchy (1→2→3)
- Code blocks with languages
- Lists for steps/features
- Proper spacing throughout

### Scenario 2: README Files

Requirements:

- Single H1 (project title)
- Section headings (H2)
- Installation steps (lists + code)
- Examples (code blocks)

### Scenario 3: Guides and Tutorials

Requirements:

- Step-by-step lists
- Code examples
- Multi-paragraph list items
- Proper nesting

## Success Metrics

- **Zero** markdownlint violations
- **Zero** user corrections needed
- **100%** VSCode compatibility
- **Immediate** usability

## Advanced: Edge Cases and Cross-Platform Compatibility

### When to Consult Edge Case Documentation

For advanced users, developers, or when encountering unusual rendering issues,
consult the comprehensive edge case documentation:

**Resource:** `resources/MARKDOWN_VALIDATION_TRAPS.md`

This document covers:

- Platform-specific differences (GitHub vs VS Code vs CommonMark)
- Silent failure patterns that pass validation but render incorrectly
- Table limitations and workarounds
- Nested structure ambiguities
- Auto-linking issues and URL escaping
- Heading anchor generation across parsers
- HTML mixing complications
- Line ending considerations (CRLF vs LF)

### Quick Edge Case Reference

**Most common cross-platform issues:**

1. **URLs with underscores:** Use angle brackets `<http://example.com/__test__/>`
2. **Pipes in tables:** Use HTML entity `&#124;` instead of `|`
3. **Code blocks in lists:** Indent fences to match list content level
4. **Line endings:** Use LF only (configure Git: `core.autocrlf input`)
5. **Nested lists:** Use marker-relative indentation (2 spaces for `-`, 4 for
   `10.`)
6. **Link references:** Cannot interrupt paragraphs (need blank line before)
7. **Duplicate headings:** GitHub appends `-1`, `-2` to anchor IDs
8. **Complex table content:** Use HTML `<ul>` or `<pre>` tags instead

### Two-Space Line Break Standard

**This project explicitly uses two trailing spaces for line breaks.**

This is intentional markdown syntax, not trailing whitespace to be removed.

Example use cases:

- Line breaks within list items
- Poetry or formatted text
- Address blocks
- Any situation requiring `<br>` without new paragraph

Markdownlint MD009 should be configured with `br_spaces: 2` to recognize this
pattern as valid.

### Platform Testing Checklist

Before considering markdown "complete," test on:

- [ ] GitHub (primary target - create gist or draft PR)
- [ ] VS Code preview (secondary target)
- [ ] Markdownlint CLI (validation tool)
- [ ] Your target platform (if different from above)

**Test specifically:**

- [ ] Nested lists render correctly (3 levels)
- [ ] Code blocks in lists maintain list numbering
- [ ] Tables with complex content display properly
- [ ] All links work (including heading anchors)
- [ ] Line breaks appear where intended (two spaces)
- [ ] Long URLs don't break layout

### When GitHub Is Not Primary Target

If generating markdown for platforms other than GitHub:

- **VS Code only:** GFM works well, no special considerations
- **Jekyll/GitHub Pages:** Be aware of Kramdown differences
- **CommonMark strict:** Avoid GFM extensions (task lists, strikethrough)
- **General markdown:** Use safe subset (no tables, no task lists)

Consult `resources/MARKDOWN_VALIDATION_TRAPS.md` for platform-specific
guidance.

## Version History

### v1.1.0 (2025-10-24)

- Added edge cases and cross-platform compatibility section
- Added two-space line break standard and guidance
- Enhanced Rule 5 with line break instructions
- Updated pre-generation checklist with line break consideration
- Updated post-generation validation with line break check
- Added Quick Reference Card for line breaks
- Created comprehensive edge case documentation in resources/
- Phase 5 QA complete

### v1.0.3 (2025-10-22)

- Added MD013 rule documentation (line length)
- Added error pattern for long lines
- Updated pre-generation checklist with line length check
- Updated post-generation validation with line length
- Phase 3 testing complete with all violations addressed

### v1.0.2 (2025-10-22)

- Fixed MD031 violations (blank lines around code blocks)
- Fixed MD040 violations (language identifiers)
- Fixed MD029 violations (ordered list numbering)
- Corrected all markdownlint violations in skill document

### v1.0.1 (2025-10-22)

- Initial skill creation
- Complete markdownlint rule coverage
- Comprehensive examples
- Pre/post generation checklists

## Additional Resources

Reference files in this skill directory:

- `rules/markdownlint-rules-reference.md` - Complete rule documentation
- `rules/top-ai-violations.md` - Common mistakes to avoid
- `examples/correct/` - Correct formatting examples
- `examples/incorrect/` - What NOT to do
- `resources/MARKDOWN_VALIDATION_TRAPS.md` - Edge cases and compatibility guide

## Usage Instructions

1. Read this entire skill before generating markdown
2. Review the pre-generation checklist
3. Generate markdown with blank line awareness
4. Apply post-generation validation
5. Correct any violations immediately
6. For complex cases, consult edge case documentation

## Remember

**The most common violation is missing blank lines around lists, headings, and
code blocks. If you remember nothing else, remember: BLANK LINES ARE
MANDATORY.**

When in doubt:

1. Add blank lines before and after block elements
2. Use `-` for list markers
3. Use `#` for headings (ATX style)
4. Specify language for code blocks
5. Increment heading levels by one
6. Use two trailing spaces for intentional line breaks
7. Test on target platform (GitHub, VS Code, etc.)

Follow these rules, and your markdown will be perfect.
