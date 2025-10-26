# Incorrect List Formatting Examples

**WARNING:** This document contains intentional markdownlint violations for educational purposes.

## Common Mistakes

### Missing Blank Line Before List (MD032 Violation)

<!-- markdownlint-disable MD032 -->

This is a paragraph before the list.
- First item
- Second item
- Third item

This is a paragraph after the list.

<!-- markdownlint-enable MD032 -->

### Missing Blank Line After List (MD032 Violation)

Here's another example:

<!-- markdownlint-disable MD032 -->

- Item one
- Item two
- Item three
The list ends but there's no blank line before this text.

<!-- markdownlint-enable MD032 -->

### Missing Blank Lines Before AND After List

<!-- markdownlint-disable MD032 -->

Text before list.
- Item 1
- Item 2
Text after list.

<!-- markdownlint-enable MD032 -->

### Inconsistent List Markers (MD004 Violation)

Introduction text.

<!-- markdownlint-disable MD004 -->

- First item using dash
* Second item using asterisk
+ Third item using plus
- Fourth item back to dash

<!-- markdownlint-enable MD004 -->

End text.

### Mixed Marker Styles in Nested Lists

More confusion:

<!-- markdownlint-disable MD004 -->

- Top level with dash
  * Nested with asterisk
  + Another nested with plus
- Back to dash

<!-- markdownlint-enable MD004 -->

This is confusing!

### No Blank Line Before Nested List

This causes problems:

<!-- markdownlint-disable MD032 -->

- Parent item
  - Nested item appears immediately
  - Another nested item
- Back to parent

<!-- markdownlint-enable MD032 -->

### Indented Headings (MD023 Violation)

<!-- markdownlint-disable MD023 -->

  ## This Heading Is Indented

Don't indent headings!

  ### Another Indented Heading

This violates MD023.

<!-- markdownlint-enable MD023 -->

## Code Block Issues

### Missing Blank Lines Around Code Blocks (MD031 Violation)

<!-- markdownlint-disable MD031 MD040 -->

Here's some code:
```python
def hello():
    print("Hello")
```
The code block has no blank lines around it.

<!-- markdownlint-enable MD031 MD040 -->

### Missing Language Identifier (MD040 Violation)

Another code example:

<!-- markdownlint-disable MD040 -->

```
function test() {
    return true;
}
```

<!-- markdownlint-enable MD040 -->

This code block doesn't specify the language.

## Heading Issues

### Skipping Heading Levels (MD001 Violation)

<!-- markdownlint-disable MD001 MD003 -->

# Top Level Heading

### Level 3 Heading (Skipped Level 2!)

This violates proper heading hierarchy.

##### Level 5 Heading (Skipped Level 4 too!)

Very bad!

<!-- markdownlint-enable MD001 MD003 -->

### Missing Blank Lines Around Headings (MD022 Violation)

<!-- markdownlint-disable MD022 -->

This is text right before a heading.
## Heading Without Blank Line Before
And text immediately after without a blank line.

More violations:
### Another Heading
With no spacing.

<!-- markdownlint-enable MD022 -->

## Trailing Spaces (MD009 Violation)

<!-- markdownlint-disable MD009 -->

Lines in this section have trailing spaces:  
This line ends with two spaces.   
This one ends with three spaces.    
Can you see them? Probably not!  

<!-- markdownlint-enable MD009 -->

## Multiple Issues Combined

<!-- markdownlint-disable MD032 MD004 MD022 MD031 MD040 -->

The worst example:
- No blank line before this list
* Mixed markers
- And more items
Here's text with no blank line after the list.
## Heading with no blank line before
Text with no blank line after heading.
```
Code with no language
And no blank lines
```
More text immediately after code.

<!-- markdownlint-enable MD032 MD004 MD022 MD031 MD040 -->

This is markdown chaos!

## File Ending Issues (MD047 Violation)

This file should end with exactly one newline character, but it might not...
