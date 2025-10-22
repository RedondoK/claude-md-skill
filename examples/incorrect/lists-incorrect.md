# Incorrect List Formatting Examples

**WARNING:** This document contains intentional markdownlint violations for educational purposes.

## Common Mistakes

### Missing Blank Line Before List (MD032 Violation)

This is a paragraph before the list.
- First item
- Second item
- Third item

This is a paragraph after the list.

### Missing Blank Line After List (MD032 Violation)

Here's another example:

- Item one
- Item two
- Item three
The list ends but there's no blank line before this text.

### Missing Blank Lines Before AND After List

Text before list.
- Item 1
- Item 2
Text after list.

### Inconsistent List Markers (MD004 Violation)

Introduction text.

- First item using dash
* Second item using asterisk
+ Third item using plus
- Fourth item back to dash

End text.

### Mixed Marker Styles in Nested Lists

More confusion:

- Top level with dash
  * Nested with asterisk
  + Another nested with plus
- Back to dash

This is confusing!

### No Blank Line Before Nested List

This causes problems:

- Parent item
  - Nested item appears immediately
  - Another nested item
- Back to parent

### Indented Headings (MD023 Violation)

  ## This Heading Is Indented

Don't indent headings!

  ### Another Indented Heading

This violates MD023.

## Code Block Issues

### Missing Blank Lines Around Code Blocks (MD031 Violation)

Here's some code:
```python
def hello():
    print("Hello")
```
The code block has no blank lines around it.

### Missing Language Identifier (MD040 Violation)

Another code example:

```
function test() {
    return true;
}
```

This code block doesn't specify the language.

## Heading Issues

### Skipping Heading Levels (MD001 Violation)

# Top Level Heading

### Level 3 Heading (Skipped Level 2!)

This violates proper heading hierarchy.

##### Level 5 Heading (Skipped Level 4 too!)

Very bad!

### Missing Blank Lines Around Headings (MD022 Violation)

This is text right before a heading.
## Heading Without Blank Line Before
And text immediately after without a blank line.

More violations:
### Another Heading
With no spacing.

## Trailing Spaces (MD009 Violation)

Lines in this section have trailing spaces:  
This line ends with two spaces.   
This one ends with three spaces.    
Can you see them? Probably not!  

## Multiple Issues Combined

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

This is markdown chaos!

## File Ending Issues (MD047 Violation)

This file should end with exactly one newline character, but it might not...
