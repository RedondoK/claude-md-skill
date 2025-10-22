# Correct Heading Formatting Examples

This document demonstrates proper heading formatting that passes markdownlint validation.

## Proper Heading Hierarchy

### Incrementing by One Level

Headings should increment by only one level at a time:

# Level 1 Heading

## Level 2 Heading

### Level 3 Heading

#### Level 4 Heading

##### Level 5 Heading

###### Level 6 Heading

## Blank Lines Around Headings

### Proper Spacing

This paragraph comes before the heading.

## A Section Heading

This paragraph comes after the heading with proper blank lines.

### Another Subsection

More content here with correct spacing.

## Consecutive Headings

When headings appear consecutively, they should still have blank lines:

### First Heading

### Second Heading

### Third Heading

Content follows.

## Heading Styles

### ATX Style (Recommended)

Use ATX style headings with `#` symbols:

# Heading 1

## Heading 2

### Heading 3

This is the preferred and most consistent style.

## Headings with Text Emphasis

### Headings Can Contain **Bold** Text

They can also contain *italic* text and even `code`.

### But Keep It Simple

Generally, plain text headings are clearest.

## Headings in Lists

Headings work within list items:

- List item with heading

  ### Heading Inside List

  Content inside the list item.

- Another list item

End of list.

## Headings Near Code Blocks

Proper spacing between headings and code:

### Code Example

Here's the code:

```python
def example():
    return "Hello"
```

### Another Example

More code:

```javascript
function test() {
    return true;
}
```

All properly spaced.

## Headings with Links

### [Link in Heading](https://example.com)

This is valid but use sparingly.

## Single H1 Per Document

There should be only one level 1 heading per document (MD025).

This document follows that rule - only the title at the top is H1.

## Proper ATX Heading Format

### Correct Space After Hash

Always include a space after the `#` symbols:

## Good Heading

Not:

##Bad Heading (no space)

## Headings at Beginning of Line

Headings must start at the beginning of the line (MD023):

### This Is Correct

Not:

  ### This Is Indented (Wrong!)

## Long Headings

### This Is a Very Long Heading That Exceeds Normal Length But Is Still Valid Because Markdownlint Typically Doesn't Enforce Length Limits on Headings

Long headings are allowed, though shorter is usually better for readability.

## Headings with Special Characters

### Heading with "Quotes" and (Parentheses)

### Heading with: Colons and - Dashes

### Heading with Numbers 123 and Symbols $%^

All valid.

## Summary

Proper heading formatting requires:

- Blank lines before and after (except at document boundaries)
- Incremental level progression (don't skip levels)
- Space after hash symbols
- No indentation
- ATX style for consistency
- Only one H1 per document
