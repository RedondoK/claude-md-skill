# Quick Reference: GitHub Flavored Markdown

**Version:** 1.0.2 | Print this page for desk reference

## The Golden Rules

```text
1. BLANK LINES ARE MANDATORY (not optional)
2. Use consistent list markers (-)
3. Specify language for every code block
4. Increment heading levels by one
5. Keep lines under 80 characters
```

## Every List

```markdown
text

- item
- item

text
```

## Every Heading

```markdown
text

## Heading

text
```

## Every Code Block

````markdown
text

```language
code
```

text
````

## Block Element Pattern

```text
[text]
↓ BLANK LINE
[heading]
↓ BLANK LINE
[text]
↓ BLANK LINE
[list]
↓ BLANK LINE
[text]
↓ BLANK LINE
[code]
↓ BLANK LINE
[text]
```

## Pre-Generation Checklist

Before generating markdown:

- [ ] Where are lists? (plan blank lines)
- [ ] Where are headings? (plan blank lines)
- [ ] Where are code blocks? (plan blank lines)
- [ ] What heading levels? (verify 1→2→3)
- [ ] What list style? (use `-`)
- [ ] What languages? (specify all)
- [ ] Any long lines? (keep under 80 chars)

## Post-Generation Checklist

After generating markdown:

- [ ] Lists have blank lines before/after
- [ ] Headings have blank lines before/after
- [ ] Code blocks have blank lines before/after
- [ ] Heading levels increment by one
- [ ] All list markers are `-`
- [ ] All code blocks have languages
- [ ] Lines are under 80 characters
- [ ] File ends with one newline

## Common Violations Quick Fix

### MD032: List Missing Blank Lines

**Wrong:**

```markdown
text
- item
text
```

**Right:**

```markdown
text

- item

text
```

### MD022: Heading Missing Blank Lines

**Wrong:**

```markdown
text
## Heading
text
```

**Right:**

```markdown
text

## Heading

text
```

### MD031: Code Missing Blank Lines

**Wrong:**

````markdown
text
```python
code
```
text
````

**Right:**

````markdown
text

```python
code
```

text
````

### MD001: Heading Level Skip

**Wrong:**

```markdown
# Title
### Sub (skipped H2)
```

**Right:**

```markdown
# Title

## Section

### Subsection
```

### MD040: Code Missing Language

**Wrong:**

````markdown
```
code
```
````

**Right:**

````markdown
```python
code
```
````

### MD013: Line Too Long

**Wrong:**

```markdown
This line exceeds the recommended 80 character limit and should be split.
```

**Right:**

```markdown
This line exceeds the recommended 80 character limit and should be
split.
```

### MD004: Inconsistent List Markers

**Wrong:**

```markdown
- Item
* Item
+ Item
```

**Right:**

```markdown
- Item
- Item
- Item
```

## Heading Hierarchy

```markdown
# Document Title (only one H1)

## Section

### Subsection

#### Detail

##### Minor Detail

###### Finest Detail
```

**Rule:** Always increment by one level

## List Styles

### Unordered Lists

```markdown
Previous text.

- Item one
- Item two
  - Nested item
  - Another nested
- Item three

Following text.
```

### Ordered Lists

```markdown
Previous text.

1. Step one
2. Step two
3. Step three

Following text.
```

### Task Lists

```markdown
Previous text.

- [ ] Incomplete task
- [x] Complete task
- [ ] Another task

Following text.
```

## Code Block Languages

**Common identifiers:**

```text
python      javascript   bash        html
java        typescript   sh          css
c           go          powershell   json
cpp         rust        cmd          yaml
csharp      ruby        zsh          xml
php         swift       sql          markdown
kotlin      r           text         diff
```

## Nesting Examples

### List with Code

```markdown
1. First step

2. Second step with code:

   ```python
   def example():
       return True
   ```

3. Third step
```

### List with Paragraphs

```markdown
- First item

- Second item

  Continuation paragraph for second item.

  More content in second item.

- Third item
```

### Nested Lists

```markdown
- Parent
  - Child (indent 2 or 4 spaces)
  - Child
    - Grandchild
- Parent
```

## Inline Elements

### Emphasis

```markdown
**bold text**
*italic text*
***bold and italic***
```

### Code Spans

```markdown
Use `code` for inline code
```

### Links

```markdown
[link text](https://example.com)
<https://example.com>
[reference link][ref]

[ref]: https://example.com
```

## Special Elements

### Horizontal Rule

```markdown
text

---

text
```

### Blockquote

```markdown
text

> Quote line
> Another line

text
```

### Table

```markdown
text

| Header 1 | Header 2 |
|----------|----------|
| Cell 1   | Cell 2   |

text
```

## Line Length Guidelines

**Default limit:** 80 characters

**Break long lines:**

```markdown
Wrong (90 chars):
This is a very long line that exceeds the limit and needs to be broken into parts.

Right:
This is a very long line that exceeds the limit and needs to be broken
into parts.
```

**Long URLs:**

```markdown
Option 1 - Reference:
[docs][link]

[link]: https://very-long-url.com

Option 2 - Angle brackets:
<https://very-long-url.com>
```

## File Structure

### Document Start

```markdown
# Document Title

Introduction paragraph.

## First Section
```

**Note:** No blank line before first heading

### Document End

```markdown
Last paragraph.

## Final Section

Final content.

```

**Note:** File must end with exactly one newline

## Validation Command

```bash
markdownlint filename.md
```

**Expected:** No output (zero violations)

## Mental Model

Think: **"Block → Blank Line → Block → Blank Line"**

Every transition between block elements requires a blank line.

## Error Prevention Mantras

1. **"Am I adding a list?"** → Add blank lines before/after
2. **"Am I adding a heading?"** → Add blank lines before/after
3. **"Am I adding code?"** → Add blank lines before/after
4. **"Am I nesting?"** → Check indentation
5. **"Am I using lists?"** → Use `-` consistently
6. **"Am I using code?"** → Specify language
7. **"Is this line long?"** → Keep under 80 chars

## Quick Patterns

### README Template

```markdown
# Project Name

Short description.

## Installation

Steps to install:

- Prerequisite one
- Prerequisite two

```bash
npm install project-name
```

## Usage

Basic usage example:

```javascript
const project = require('project-name');
```

## Contributing

Contribution guidelines.

## License

License information.
```

### Technical Doc Template

```markdown
# API Documentation

Overview paragraph.

## Authentication

Authentication details.

```bash
curl -H "Authorization: Bearer TOKEN"
```

## Endpoints

### GET /users

Description of endpoint.

**Request:**

```json
{
  "param": "value"
}
```

**Response:**

```json
{
  "result": "data"
}
```

## Error Handling

Error handling details.
```

### Tutorial Template

```markdown
# Tutorial Title

What you'll learn.

## Prerequisites

Requirements:

- Requirement one
- Requirement two

## Step 1: Setup

Setup instructions.

```bash
command here
```

## Step 2: Configuration

Configuration details.

```yaml
config:
  setting: value
```

## Step 3: Testing

Testing instructions.

## Next Steps

What to do next.
```

## Emergency Fixes

**If you see violations:**

1. **MD032** → Add blank lines around lists
2. **MD022** → Add blank lines around headings
3. **MD031** → Add blank lines around code blocks
4. **MD001** → Fix heading progression
5. **MD040** → Add language to code blocks
6. **MD013** → Break long lines
7. **MD004** → Use consistent list markers

## Remember

Most violations are **missing blank lines**. When in doubt, add them.

---

**Goal:** Zero violations on first generation  
**Method:** Follow these patterns  
**Validation:** `markdownlint filename.md`  
**Result:** Perfect markdown
