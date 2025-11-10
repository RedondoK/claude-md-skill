<!-- markdownlint-disable MD013 MD029 MD031 MD032 MD040 -->

# markdownlint Rules Reference

**Version:** 1.2.0
**Source:** DavidAnson/markdownlint
**Latest:** 53+ rules
**Purpose:** Comprehensive reference for markdown validation

## Rule Categories

### blank_lines

- MD012, MD022, MD031, MD032, MD047

### blockquote

- MD027, MD028

### bullet

- MD004, MD005, MD006, MD007, MD030, MD032

### code

- MD014, MD031, MD038, MD040, MD046, MD048

### emphasis

- MD036, MD037, MD049, MD050

### hard_tab

- MD010

### headings

- MD001, MD003, MD018, MD019, MD020, MD021, MD022, MD023, MD024, MD025, MD026, MD036, MD041, MD043

### hr

- MD035

### html

- MD033

### images

- MD045

### line_length

- MD013

### links

- MD034, MD039, MD042, MD044, MD045

### spaces

- MD009, MD010, MD027, MD028, MD030, MD037, MD038

### spelling

- MD044

### url

- MD034

## CRITICAL RULES FOR AI MARKDOWN GENERATION

## 1. MD032 - Lists should be surrounded by blank lines

**Category:** blank_lines, bullet
**Severity:** CRITICAL
**Impact:** List rendering failure in many parsers

### Rule Description

Lists (ordered and unordered) MUST have blank lines before and after them, except when:

- At the beginning of a document
- At the end of a document
- Inside another list item

### Incorrect Examples

```markdown
Some text
- Item 1
- Item 2
More text
```

```markdown
A paragraph.
1. First
2. Second
Another paragraph.
```

### Correct Examples

```markdown
Some text

- Item 1
- Item 2

More text
```

```markdown
A paragraph.

1. First
2. Second

Another paragraph.
```

### Rationale

Without blank lines, many markdown parsers (including CommonMark) will not recognize the list and will render it as plain text or incorrectly.

## 2. MD004 - Unordered list style

**Category:** bullet
**Severity:** HIGH
**Impact:** Consistency and readability

### Rule Description

Unordered list markers should be consistent throughout the document. Valid markers are:

- `-` (dash) - RECOMMENDED
- `*` (asterisk)
- `+` (plus)

### Incorrect Example

```markdown
- Item 1
* Item 2
+ Item 3
```

### Correct Example

```markdown
- Item 1
- Item 2
- Item 3
```

### Rationale

Consistent markers improve readability and make the document structure clearer.

## 3. MD047 - Files should end with a single newline character

**Category:** blank_lines
**Severity:** MEDIUM
**Impact:** POSIX standard compliance

### Rule Description

Files should end with exactly one newline character.

### Incorrect Examples

```markdown
# Document
Content here[EOF - no newline]
```

```markdown
# Document
Content here


[EOF - multiple blank lines]
```

### Correct Example

```markdown
# Document
Content here
[EOF - single newline]
```

### Rationale

This is a POSIX standard that many tools expect. Git and other version control systems work better with files ending in newlines.

## 4. MD001 - Heading levels should only increment by one level at a time

**Category:** headings
**Severity:** HIGH
**Impact:** Document structure and accessibility

### Rule Description

When increasing heading levels, increment by only one level. Don't skip levels.

### Incorrect Example

```markdown
# Heading 1

### Heading 3 (skipped level 2!)

##### Heading 5 (skipped level 4!)
```

### Correct Example

```markdown
# Heading 1

## Heading 2

### Heading 3

#### Heading 4
```

### Rationale

Screen readers and document navigation tools rely on proper heading hierarchy. Skipping levels creates confusion and breaks accessibility.

## 5. MD003 - Heading style

**Category:** headings
**Severity:** MEDIUM
**Impact:** Consistency

### Rule Description

Use consistent heading style throughout the document. Options:

- ATX style: `# Heading` (RECOMMENDED for GFM)
- ATX closed: `# Heading #`
- Setext: Underlined with `=` or `-`

### Incorrect Example (mixed styles)

```markdown
# Heading 1

Heading 2
---------

# Heading 3
```

### Correct Example

```markdown
# Heading 1

## Heading 2

### Heading 3
```

### Rationale

Consistent style improves maintainability and reduces cognitive load.

## 6. MD022 - Headings should be surrounded by blank lines

**Category:** headings, blank_lines
**Severity:** HIGH
**Impact:** Rendering and readability

### Rule Description

Headings should have blank lines before and after them, except:

- At the beginning of a document (no blank line before)
- At the end of a document (no blank line after)
- When immediately followed by another heading

### Incorrect Example

```markdown
Some text
## Heading
More text
```

### Correct Example

```markdown
Some text

## Heading

More text
```

### Rationale

Blank lines around headings improve readability and ensure proper parsing.

## 7. MD031 - Fenced code blocks should be surrounded by blank lines

**Category:** code, blank_lines
**Severity:** HIGH
**Impact:** Code block rendering

### Rule Description

Fenced code blocks (using ``` or ~~~) should have blank lines before and after them.

### Incorrect Example

```markdown
Some text
```javascript
const x = 1;
```
More text
```

### Correct Example

```markdown
Some text

```javascript
const x = 1;
```

More text
```

### Rationale

Without blank lines, some parsers may not recognize the code block boundaries correctly.

## 8. MD040 - Fenced code blocks should have a language specified

**Category:** code
**Severity:** MEDIUM
**Impact:** Syntax highlighting

### Rule Description

Always specify a language identifier for fenced code blocks.

### Incorrect Example

````markdown
```
const x = 1;
```
````

### Correct Example

````markdown
```javascript
const x = 1;
```
````

### Rationale

Language identifiers enable syntax highlighting in most renderers and improve readability.

## 9. MD009 - Trailing spaces

**Category:** spaces
**Severity:** MEDIUM
**Impact:** Clean diffs and version control

### Rule Description

Lines should not have trailing spaces, except when creating hard line breaks (2+ spaces).

### Rationale

Trailing spaces create noise in version control diffs and can cause unexpected rendering.

## 10. MD010 - Hard tabs

**Category:** hard_tab
**Severity:** MEDIUM
**Impact:** Consistent rendering

### Rule Description

Use spaces instead of tabs for indentation.

### Rationale

Tabs render differently in different environments. Spaces ensure consistent rendering.

## Professional Quality Rules

### MD034 - No Bare URLs

**Category:** url, links
**Severity:** HIGH
**Impact:** Clickability, linting, professionalism

#### Rule Description

Bare URLs and email addresses must be wrapped in angle brackets or formatted
as proper links.

#### Incorrect Examples

```markdown
Visit https://example.com for details.
Contact support@example.com for help.
```

#### Correct Examples

```markdown
Visit <https://example.com> for details.
Contact <support@example.com> for help.

Or with descriptive text:
Visit [our website](https://example.com) for details.
Contact [support](mailto:support@example.com) for help.
```

#### Rationale

Bare URLs may not be clickable in all markdown renderers. Wrapping in angle
brackets ensures proper linking and prevents auto-link parsing issues with
underscores or other special characters.

### MD041 - First Line Should Be Top-Level Heading

**Category:** headings
**Severity:** MEDIUM-HIGH
**Impact:** Document structure, accessibility, navigation

#### Rule Description

The first line of content should be a top-level (H1) heading, except when
preceded by front matter.

#### Incorrect Example

```markdown
This is an introduction paragraph.

## Section Heading
```

#### Correct Examples

```markdown
# Document Title

This is an introduction paragraph.

## Section Heading
```

With front matter:

```markdown
---
title: My Document
---

# Document Title

Content here.
```

#### Rationale

Starting with H1 provides clear document structure for screen readers,
document outlines, and SEO. It establishes the document's primary topic
immediately.

### MD029 - Ordered List Item Prefix

**Category:** bullet
**Severity:** MEDIUM
**Impact:** Consistency, maintainability

#### Rule Description

Ordered list items should use consistent prefixes. The recommended style is
to use `1.` for all items, allowing the renderer to auto-number.

#### Incorrect Example

```markdown
1. First item
2. Second item
3. Third item
```

#### Correct Example

```markdown
1. First item
1. Second item
1. Third item
```

#### Rationale

Using `1.` for all items makes reordering easier (no renumbering needed) and
is the standard in many style guides. Markdown renderers automatically
display correct sequential numbers.

### MD033 - No Inline HTML

**Category:** html
**Severity:** MEDIUM-HIGH
**Impact:** Platform compatibility, security

#### Rule Description

Avoid using raw HTML in markdown. Use markdown syntax instead.

#### Incorrect Examples

```markdown
<div>Content here</div>
<br>
<strong>Bold text</strong>
```

#### Correct Examples

```markdown
Content here

Use two trailing spaces for line breaks.

**Bold text**
```

#### Allowed Exceptions

Some HTML may be necessary for:

- Complex tables
- Specific formatting not available in markdown
- Platform-specific features

#### Rationale

Many platforms strip or sanitize HTML for security. Pure markdown ensures
maximum compatibility across renderers.

### MD026 - No Trailing Punctuation in Headings

**Category:** headings
**Severity:** MEDIUM
**Impact:** Consistency, style

#### Rule Description

Headings should not end with punctuation marks (`.`, `,`, `:`, `;`).
Question marks and exclamation points may be allowed depending on
configuration.

#### Incorrect Examples

```markdown
## Installation.
## Prerequisites:
## Getting Started;
```

#### Correct Examples

```markdown
## Installation
## Prerequisites
## Getting Started

## What's Next (question marks often allowed)
```

#### Rationale

Headings are labels, not sentences. Trailing punctuation is unnecessary and
inconsistent with standard style guides.

### MD045 - Images Should Have Alt Text

**Category:** images, links
**Severity:** MEDIUM
**Impact:** Accessibility, SEO

#### Rule Description

All images must include alt text for accessibility.

#### Incorrect Examples

```markdown
![](image.png)
![](https://example.com/photo.jpg)
```

#### Correct Examples

```markdown
![Architecture diagram showing three-tier design](diagram.png)
![Team photo from 2024 conference](https://example.com/photo.jpg)
```

#### Rationale

Alt text is essential for:

- Screen readers for visually impaired users
- When images fail to load
- Search engine optimization
- Understanding content without images

### MD048 - Code Fence Style

**Category:** code
**Severity:** LOW-MEDIUM
**Impact:** Consistency

#### Rule Description

Use consistent code fence style throughout document. Options:

- Backticks: `` ``` `` (RECOMMENDED)
- Tildes: `~~~`

#### Incorrect Example (mixed styles)

````markdown
```python
code1()
```

~~~javascript
code2();
~~~
````

#### Correct Example

````markdown
```python
code1()
```

```javascript
code2();
```
````

#### Rationale

Consistent fence style improves readability and maintainability. Backticks are
more widely recognized and supported.

## Additional Important Rules

### MD013 - Line length

Lines should not exceed a specified length (default 80 characters). Often set
to 120 for modern documents.

### MD018/MD019 - No space after hash on atx style heading

**Incorrect:** `#Heading`
**Correct:** `# Heading`

### MD023 - Headings must start at the beginning of the line

Don't indent headings.

### MD024 - Multiple headings with the same content

**Category:** headings
**Severity:** LOW
**Impact:** Navigation, anchor conflicts

#### Description

Avoid duplicate heading text in the same document section.

#### Incorrect

```markdown
## Introduction

Content.

## Introduction

More content.
```

#### Correct

```markdown
## Introduction

Content.

## Implementation

More content.
```

#### Rationale

Duplicate headings create ambiguous anchor links and confuse document
navigation.

### MD025 - Multiple top-level headings

Only one `#` (H1) heading per document for proper hierarchy.

### MD036 - No Emphasis as Heading Substitute

**Category:** emphasis, headings
**Severity:** MEDIUM
**Impact:** Document structure, accessibility

#### Incorrect

```markdown
**Section Title**

Content here.
```

#### Correct

```markdown
## Section Title

Content here.
```

#### Rationale

Bold text is not a structural element. Screen readers and document outlines
require proper heading tags.

### MD037 - No Spaces Inside Emphasis Markers

**Incorrect:** `** bold **` or `* italic *`
**Correct:** `**bold**` or `*italic*`

### MD038 - No Spaces Inside Code Spans

**Incorrect:** `` ` code ` ``
**Correct:** `` `code` ``

### MD046 - Consistent Code Block Style

**Category:** code
**Severity:** LOW
**Impact:** Consistency

#### Description

Use consistent code block style throughout document:

- Fenced (` ``` `) - RECOMMENDED
- Indented (4 spaces)

Fenced blocks allow language specification for syntax highlighting.

## Rule Priority for AI Generation

### MUST FIX (Critical)

1. MD032 - Blank lines around lists
2. MD022 - Blank lines around headings
3. MD031 - Blank lines around code blocks
4. MD001 - Heading increment

### SHOULD FIX (High Priority)

5. MD004 - Consistent list style
6. MD047 - File ends with newline
7. MD003 - Heading style consistency
8. MD040 - Code block language

### NICE TO FIX (Medium Priority)

9. MD009 - Trailing spaces
10. MD010 - Hard tabs
11. MD018 - Space after hash
12. MD023 - Headings at start of line

## Testing Strategy

To validate markdown against these rules:

```bash
# Install markdownlint-cli
npm install -g markdownlint-cli

# Check a file
markdownlint document.md

# Check and fix automatically
markdownlint --fix document.md
```

## References

- [markdownlint GitHub](https://github.com/DavidAnson/markdownlint)
- [markdownlint Rules Documentation](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md)
- [markdownlint npm package](https://www.npmjs.com/package/markdownlint)
