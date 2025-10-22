# markdownlint Rules Reference

**Source:** DavidAnson/markdownlint  
**Version:** Latest (53+ rules)  
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

## Additional Important Rules

### MD013 - Line length

Lines should not exceed a specified length (default 80 characters). This is often disabled or set to a higher value (e.g., 120) for modern documents.

### MD018/MD019 - No space after hash on atx style heading

**Incorrect:** `#Heading`  
**Correct:** `# Heading`

### MD023 - Headings must start at the beginning of the line

Don't indent headings.

### MD024 - Multiple headings with the same content

Avoid duplicate heading text in the same document.

### MD025 - Multiple top-level headings

Only one `#` (h1) heading per document.

### MD033 - Inline HTML

Avoid using raw HTML in markdown. Use markdown syntax instead.

### MD034 - Bare URL used

**Incorrect:** `http://example.com`  
**Correct:** `<http://example.com>` or `[example](http://example.com)`

### MD037 - Spaces inside emphasis markers

**Incorrect:** `** bold **`  
**Correct:** `**bold**`

### MD038 - Spaces inside code span elements

**Incorrect:** `` ` code ` ``  
**Correct:** `` `code` ``

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
