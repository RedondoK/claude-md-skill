<!-- markdownlint-disable MD013 MD029 MD031 MD032 MD040 -->

# Markdown Examples: Correct and Incorrect Patterns

**Version:** 1.1.2  
**Purpose:** Comprehensive examples showing correct markdown formatting and
common mistakes to avoid.

## List Examples

### ✅ Correct: Basic Unordered List

This is a paragraph before the list.

- First item
- Second item
- Third item

This is a paragraph after the list.

**Why correct:** Blank lines before and after list, consistent markers.

### ❌ Incorrect: List Without Blank Lines

```markdown
This is a paragraph before the list.
- First item
- Second item
- Third item
This is a paragraph after the list.
```

**Problem:** Missing blank lines (MD032 violation). Parser may not recognize
as list.

### ✅ Correct: Nested Lists

Here's a nested list example:

- Top level item
  - Nested item 1
  - Nested item 2
    - Deeply nested item
  - Back to second level
- Another top level item

The list ends here.

**Why correct:** Proper 2-space indentation, consistent markers, blank lines.

### ❌ Incorrect: Inconsistent List Markers

```markdown
- Item 1
* Item 2
+ Item 3
```

**Problem:** Mixed markers (MD004 violation). Use one style throughout.

### ✅ Correct: List with Code Blocks

More complex example:

1. Create a new file

2. Add the following code:

   ```javascript
   function hello() {
       console.log("Hello, World!");
   }
   ```

3. Save the file

Process complete.

**Why correct:** Code block properly indented (3 spaces for numbered lists),
maintains list context.

### ❌ Incorrect: Code Block Breaks List

```markdown
1. First step
2. Second step with code:
```python
code here
```
3. Third step
```

**Problem:** Code block not indented, breaks list continuity. Step 3 becomes
new list starting at 1.

## Heading Examples

### ✅ Correct: Heading Hierarchy

```markdown
# Level 1 Heading

## Level 2 Heading

### Level 3 Heading

#### Level 4 Heading
```

**Why correct:** Increments by one level, blank lines around headings.

### ❌ Incorrect: Skipped Heading Levels

```markdown
# Level 1 Heading

### Level 3 Heading (skipped level 2!)

##### Level 5 Heading (skipped level 4!)
```

**Problem:** MD001 violation. Breaks document hierarchy and accessibility.

### ✅ Correct: Heading with Blank Lines

This paragraph comes before the heading.

## A Section Heading

This paragraph comes after the heading with proper blank lines.

**Why correct:** Blank lines before and after heading ensure proper parsing.

### ❌ Incorrect: Heading Without Blank Lines

```markdown
This paragraph comes before the heading.
## A Section Heading
This paragraph comes after the heading.
```

**Problem:** MD022 violation. May not render correctly in all parsers.

### ✅ Correct: ATX Heading Style

```markdown
# Heading 1

## Heading 2

### Heading 3
```

**Why correct:** Consistent ATX style, space after hashes.

### ❌ Incorrect: No Space After Hash

```markdown
#Heading 1
##Heading 2
###Heading 3
```

**Problem:** MD018 violation. Requires space after hash symbols.

## Code Block Examples

### ✅ Correct: Basic Code Block with Language

Here's a Python example:

```python
def hello_world():
    print("Hello, World!")
    return True
```

The code block has blank lines before and after.

**Why correct:** Blank lines, language specified, proper formatting.

### ❌ Incorrect: Code Block Without Language

````markdown
Here's an example:
```
def hello_world():
    print("Hello, World!")
```
More text.
````

**Problem:** MD040 violation (no language), MD031 violation (missing blank
lines).

### ✅ Correct: Multiple Language Examples

Python implementation:

```python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)
```

JavaScript implementation:

```javascript
function fibonacci(n) {
    if (n <= 1) return n;
    return fibonacci(n-1) + fibonacci(n-2);
}
```

Both properly formatted with blank lines.

**Why correct:** Each code block has language and proper spacing.

## Line Length Examples

### ✅ Correct: Proper Line Breaking

```markdown
This is a very long line that exceeds the recommended 80 character limit
and should be broken up into multiple shorter lines for better readability.
```

**Why correct:** Lines broken at natural points, under 80 characters.

### ❌ Incorrect: Line Too Long

```markdown
This is a very long line that exceeds the recommended 80 character limit and should be broken up into multiple shorter lines for better readability.
```

**Problem:** MD013 violation (line exceeds 80 characters).

### ✅ Correct: Long URLs Handled Properly

Reference style for long URLs:

Check the [documentation][docs] for more details.

[docs]: https://very-long-url-that-would-exceed-line-length-limit.com/path

Or with angle brackets:

<https://very-long-url.com/path>

**Why correct:** Uses reference links or angle brackets to handle long URLs.

## Complex Structure Examples

### ✅ Correct: List with Multi-Paragraph Items

Complex list with multiple paragraphs:

- First item with a single paragraph

- Second item with multiple paragraphs

  This is the second paragraph of the second item. It needs to be indented to
  maintain the list structure.

  And here's a third paragraph in the same item.

- Third item returns to simple format

End of list.

**Why correct:** Continuation paragraphs indented properly, blank lines
separate items.

### ✅ Correct: Mixed List Types

You can mix ordered and unordered lists:

1. First ordered item
   - Unordered sub-item
   - Another unordered sub-item
2. Second ordered item
   - More unordered items
     1. Ordered sub-sub-item
     2. Another ordered sub-sub-item

End of mixed list.

**Why correct:** Proper indentation at each level, consistent within each
level.

### ✅ Correct: Table with Proper Structure

Here's a properly formatted table:

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |

End of table.

**Why correct:** Blank lines before and after, proper column alignment.

### ✅ Correct: Task List

Task list example:

- [ ] Incomplete task
- [x] Complete task
- [ ] Another incomplete task

More content.

**Why correct:** Proper checkbox format, blank lines around list.

## Emphasis and Inline Elements

### ✅ Correct: Emphasis Styles

```markdown
**Bold text** using double asterisks.

*Italic text* using single asterisks.

***Bold and italic*** using triple asterisks.

`Inline code` using backticks.
```

**Why correct:** No spaces inside markers, consistent style.

### ❌ Incorrect: Spaces Inside Emphasis

```markdown
** bold **
* italic *
` code `
```

**Problem:** Spaces inside markers (MD037, MD038 violations). Won't render
correctly.

## Link Examples

### ✅ Correct: Link Formats

Standard link:

```markdown
[Link text](https://example.com)
```

Auto-link:

```markdown
<https://example.com>
```

Reference link:

```markdown
[Link text][ref]

[ref]: https://example.com
```

**Why correct:** Proper formatting, no spaces in wrong places.

### ✅ Correct: URL with Underscores

```markdown
<http://example.com/__word__/path>
```

**Why correct:** Angle brackets prevent underscore parsing as emphasis.

### ❌ Incorrect: URL Without Angle Brackets

```markdown
http://example.com/__word__/path
```

**Problem:** `__word__` parsed as strong emphasis, corrupts the link.

## Special Cases

### ✅ Correct: Blockquote

Regular text.

> Quote line 1
> Quote line 2

More regular text.

**Why correct:** Blank lines before and after blockquote.

### ✅ Correct: Horizontal Rule

Text before.

---

Text after.

**Why correct:** Blank lines before and after horizontal rule.

### ✅ Correct: Definition List (if supported)

```markdown
Term 1
: Definition 1

Term 2
: Definition 2a
: Definition 2b
```

**Note:** Not all parsers support definition lists.

## Character Encoding Examples

### ✅ Correct: Regular Spaces for Indentation

```markdown
- List item

    ```python
    # Four regular spaces (U+0020) before fence
    code_here()
    ```

- Next item
```

**Why correct:** Uses regular ASCII spaces (U+0020) for indentation.

### ❌ Incorrect: Non-Breaking Spaces

```markdown
- List item

   ```python
   # Three nbsp (U+00A0) break parsing
   code_here()
   ```

- Next item (will restart numbering!)
```

**Problem:** Non-breaking spaces aren't recognized as indentation. Code block
doesn't nest properly.

**Detection:** Use `grep $'\u00A0' file.md` to find nbsp characters.

**Fix:** Replace with regular spaces using find/replace: `\u00A0` → ` `

## File Structure Examples

### ✅ Correct: Document Start

```markdown
# Document Title

Introduction paragraph.

## First Section
```

**Why correct:** No blank line needed before first heading.

### ✅ Correct: Document End

```markdown
Last paragraph.

## Final Section

Final content.

```

**Why correct:** File ends with exactly one newline.

### ❌ Incorrect: Multiple Trailing Newlines

```markdown
Final content.



```

**Problem:** MD047 violation. File should end with exactly one newline.

## Summary

**Key Patterns to Remember:**

1. **Always use blank lines** around lists, headings, code blocks
2. **Consistent markers** for lists (use `-` throughout)
3. **Language identifiers** for all code blocks
4. **Proper indentation** for nested structures
5. **Line length** under 80 characters (when possible)
6. **Regular spaces only** for indentation (never nbsp or tabs)
7. **Heading hierarchy** increments by one level
8. **One H1** per document
9. **File ending** with exactly one newline
10. **No spaces** inside emphasis or code span markers

These examples demonstrate the most common patterns and mistakes. For complete
rule documentation, see `complete-rules.md`.
