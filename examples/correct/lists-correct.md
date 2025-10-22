# Correct List Formatting Examples

This document demonstrates proper list formatting that passes markdownlint validation.

## Unordered Lists

### Basic Unordered List

This is a paragraph before the list.

- First item
- Second item
- Third item

This is a paragraph after the list.

### Nested Unordered Lists

Here's a nested list example:

- Top level item
  - Nested item 1
  - Nested item 2
    - Deeply nested item
  - Back to second level
- Another top level item

The list ends here.

### Multi-paragraph List Items

Complex list with multiple paragraphs:

- First item with a single paragraph

- Second item with multiple paragraphs

  This is the second paragraph of the second item. It needs to be indented to maintain the list structure.

  And here's a third paragraph in the same item.

- Third item returns to simple format

End of list.

## Ordered Lists

### Basic Ordered List

Introduction paragraph.

1. First step
2. Second step
3. Third step

Conclusion paragraph.

### Nested Ordered Lists

Step-by-step guide:

1. Main step one
   1. Sub-step 1a
   2. Sub-step 1b
2. Main step two
   1. Sub-step 2a
   2. Sub-step 2b
3. Main step three

Process complete.

### Mixed List Types

You can mix ordered and unordered lists:

1. First ordered item
   - Unordered sub-item
   - Another unordered sub-item
2. Second ordered item
   - More unordered items
     1. Ordered sub-sub-item
     2. Another ordered sub-sub-item

End of mixed list.

## Lists with Code Blocks

### Inline Code in Lists

Installation steps:

- Install `package-name` using npm
- Configure the `settings.json` file
- Run `npm start` to begin

That's it!

### Fenced Code Blocks in Lists

More complex example:

1. Create a new file

2. Add the following code:

   ```javascript
   function hello() {
       console.log("Hello, World!");
   }
   ```

3. Save the file

4. Run the code:

   ```bash
   node hello.js
   ```

Process complete.

## Lists at Document Boundaries

### List at Start of Document

When a list appears at the very start (like below), no blank line before is needed:

- Item 1
- Item 2
- Item 3

But there should be a blank line after.

### List at End of Document

Text before the list.

- Final item 1
- Final item 2
- Final item 3
