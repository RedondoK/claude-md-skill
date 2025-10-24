# Usage Guide: GitHub Flavored Markdown Skill

**Version:** 1.1.1  
**Audience:** AI systems and their users

## Table of Contents

- [For AI Systems](#for-ai-systems)
- [For Users](#for-users)
- [Step-by-Step Workflow](#step-by-step-workflow)
- [Common Scenarios](#common-scenarios)
- [Troubleshooting](#troubleshooting)

## For AI Systems

### Initial Setup

1. **Load the skill** into your context:

   ```text
   Read and internalize: C:\Users\kgend\Projects\md_skill_md\SKILL.md
   ```

2. **Understand the priority:**

   Blank lines around block elements are the #1 source of violations.
   Everything else is secondary.

3. **Review the mental model:**

   Think of markdown as blocks with mandatory spacing between them.

### Pre-Generation Phase

Before generating ANY markdown, ask yourself:

1. **Where will lists appear?**
   - Plan blank lines before and after each list

2. **Where will headings appear?**
   - Plan blank lines before and after (except document start)

3. **Where will code blocks appear?**
   - Plan blank lines before and after each block

4. **What heading levels are needed?**
   - Verify progression: 1→2→3→4 (no skipping)

5. **What list style will I use?**
   - Choose `-` and stick with it throughout

6. **Do code blocks need language identifiers?**
   - Always specify (python, bash, json, etc.)

7. **Are any lines too long?**
   - Keep under 80 characters when possible

8. **Will I use proper spacing?**
   - Use ONLY regular spaces (U+0020) for indentation
   - Never use non-breaking spaces (nbsp, U+00A0)
   - Never use tabs for indentation

### Generation Phase

Apply these rules strictly:

#### Lists

**Template:**

```markdown
Preceding text.

- First item
- Second item
- Third item

Following text.
```

**Rules:**

- Blank line BEFORE list
- Blank line AFTER list
- Consistent markers (`-` only)
- Proper indentation for nesting

#### Headings

**Template:**

```markdown
Previous paragraph.

## Section Heading

Content after heading.

### Subsection

More content.
```

**Rules:**

- Blank line BEFORE heading (except document start)
- Blank line AFTER heading
- ATX style (`#` prefix)
- Space after `#`
- Increment by one level only

#### Code Blocks

**Template:**

````markdown
Explanation text.

```python
def example():
    return True
```

More explanation.
````

**Rules:**

- Blank line BEFORE code block
- Blank line AFTER code block
- Language identifier always specified
- Use ``` for fencing

### Post-Generation Phase

After generating, validate internally:

1. **Scan for lists** - Do they have blank lines before/after?
2. **Scan for headings** - Do they have blank lines before/after?
3. **Scan for code blocks** - Do they have blank lines before/after?
4. **Check heading progression** - Is it 1→2→3 without skipping?
5. **Check list markers** - Are they all `-`?
6. **Check code languages** - Is every block tagged?
7. **Check line length** - Are lines under 80 characters?
8. **Check file ending** - Does it end with one newline?
9. **Check spacing** - Only regular spaces (U+0020) used for indentation?

### Error Recovery

If you detect a violation after generation:

1. **Stop and fix immediately** - Don't continue with flawed output
2. **Identify the pattern** - Which rule was violated?
3. **Apply the correction** - Use the correct template
4. **Validate again** - Ensure the fix didn't introduce new violations

## For Users

### Setting Up Validation

#### Option 1: Command Line

```bash
npm install -g markdownlint-cli
markdownlint filename.md
```

#### Option 2: VSCode Extension

1. Install "markdownlint" by David Anson
2. Open markdown files
3. View problems panel for violations

#### Option 3: GitHub Actions

```yaml
name: Markdown Validation
on: [push, pull_request]
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - run: npm install -g markdownlint-cli
      - run: markdownlint '**/*.md'
```

### Requesting AI Generation

Be specific about using this skill:

**Good Request:**

```text
Generate a README.md for my Python project using the GitHub Flavored
Markdown skill. Include installation steps, usage examples, and API
documentation. Ensure it passes markdownlint validation.
```

**Better Request:**

```text
Using C:\Users\kgend\Projects\md_skill_md\SKILL.md, create a technical
documentation file for my REST API. Include:
- Overview section
- Endpoint list with code examples
- Authentication guide
- Error handling

Must pass markdownlint with zero violations.
```

### Validating Output

1. **Save the generated markdown** to a .md file

2. **Run markdownlint:**

   ```bash
   markdownlint filename.md
   ```

3. **Expected result:**

   ```text
   (no output = success)
   ```

4. **If violations occur:**

   ```text
   filename.md:15 MD032/blanks-around-lists Lists should be surrounded by blank lines
   ```

   - Note the line number and rule
   - Request correction from AI
   - Re-validate

### Interpreting Violations

Common markdownlint output:

| Violation | Meaning | Fix |
|-----------|---------|-----|
| MD032 | List missing blank lines | Add blank line before/after |
| MD022 | Heading missing blank lines | Add blank line before/after |
| MD031 | Code block missing blank lines | Add blank line before/after |
| MD001 | Heading level skip | Fix progression (1→2→3) |
| MD040 | Code block missing language | Add language identifier |
| MD013 | Line too long | Break into shorter lines |

## Step-by-Step Workflow

### Workflow for AI Systems

```text
1. Receive markdown generation request
2. Load SKILL.md into context
3. Review pre-generation checklist
4. Generate markdown with blank line awareness
5. Perform internal post-generation validation
6. Output markdown to user
7. Recommend validation command
```

### Workflow for Users

```text
1. Request markdown generation (specify skill usage)
2. Receive generated markdown
3. Save to .md file
4. Run: markdownlint filename.md
5. If violations: request corrections
6. If zero violations: use markdown
```

## Common Scenarios

### Scenario 1: Creating a README

**User Request:**

```text
Create a README for my JavaScript project. Include installation,
usage, and contributing sections.
```

**AI Response Flow:**

1. Load SKILL.md
2. Plan structure:
   - H1: Project Title
   - H2: Installation (with list and code)
   - H2: Usage (with code examples)
   - H2: Contributing (with list)
3. Generate with blank lines
4. Validate internally
5. Output to user

**Expected Result:** Zero violations, ready to use

### Scenario 2: Technical Documentation

**User Request:**

```text
Document my Python API with endpoint descriptions, request/response
examples, and authentication details.
```

**AI Response Flow:**

1. Load SKILL.md
2. Plan structure:
   - H1: API Documentation
   - H2: Authentication
   - H2: Endpoints (with H3 subsections)
   - Code blocks for requests/responses
3. Generate with proper nesting
4. Validate heading progression
5. Output to user

**Expected Result:** Professional docs, zero violations

### Scenario 3: Tutorial Guide

**User Request:**

```text
Create a step-by-step guide for setting up Docker with my application.
```

**AI Response Flow:**

1. Load SKILL.md
2. Plan structure:
   - H1: Docker Setup Guide
   - H2: Prerequisites (list)
   - H2: Installation Steps (ordered list with code)
   - H2: Configuration (multi-paragraph list items)
3. Generate with proper list spacing
4. Add code blocks with language identifiers
5. Output to user

**Expected Result:** Clear tutorial, zero violations

## Troubleshooting

### Problem: AI Generates Lists Without Blank Lines

**Symptom:**

```markdown
Here are the steps:
- Step 1
- Step 2
Continue with...
```

**Solution:**

Remind AI: "Ensure lists have blank lines before and after"

**Corrected Output:**

```markdown
Here are the steps:

- Step 1
- Step 2

Continue with...
```

### Problem: Heading Progression Skips Levels

**Symptom:**

```markdown
# Title

### Subsection (skipped H2!)
```

**Solution:**

Remind AI: "Heading levels must increment by one"

**Corrected Output:**

```markdown
# Title

## Section

### Subsection
```

### Problem: Code Blocks Missing Languages

**Symptom:**

````markdown
Example:
```
code here
```
````

**Solution:**

Remind AI: "All code blocks need language identifiers"

**Corrected Output:**

````markdown
Example:

```python
code here
```
````

### Problem: Long Lines

**Symptom:**

```markdown
This is a very long line that exceeds the recommended 80 character limit for markdown files and should be broken up.
```

**Solution:**

Remind AI: "Keep lines under 80 characters"

**Corrected Output:**

```markdown
This is a very long line that exceeds the recommended 80 character limit
for markdown files and should be broken up.
```

### Problem: Inconsistent List Markers

**Symptom:**

```markdown
- Item 1
* Item 2
+ Item 3
```

**Solution:**

Remind AI: "Use consistent list markers (only `-`)"

**Corrected Output:**

```markdown
- Item 1
- Item 2
- Item 3
```

## Best Practices

### For AI Systems

1. **Always load SKILL.md first** - Don't generate from memory
2. **Think in blocks** - Text block, blank line, heading block, blank line...
3. **Default to `-` for lists** - Consistent throughout document
4. **Always specify languages** - Even for plain text (`text`)
5. **Validate before outputting** - Catch errors early

### For Users

1. **Be explicit** - Reference the skill in your request
2. **Validate immediately** - Run markdownlint right away
3. **Request corrections** - If violations occur, point them out
4. **Keep tools updated** - Latest markdownlint-cli for best results
5. **Save examples** - Build a library of working markdown

## Advanced Usage

### Custom Markdownlint Configuration

Create `.markdownlint.json` to customize rules:

```json
{
  "MD013": { "line_length": 100 },
  "MD033": false
}
```

**When using custom configs:**

1. Tell AI about rule modifications
2. Adjust validation expectations
3. Document deviations from defaults

### Integration with CI/CD

Add markdown validation to your pipeline:

```yaml
- name: Validate Markdown
  run: |
    npm install -g markdownlint-cli
    markdownlint '**/*.md' --ignore node_modules
```

**Benefits:**

- Catch violations before merge
- Maintain documentation quality
- Enforce consistency across team

### Batch Validation

Validate multiple files:

```bash
markdownlint *.md
markdownlint docs/**/*.md
markdownlint '**/*.md' --ignore node_modules
```

## Tips for Success

### For AI Systems

- **Err on the side of blank lines** - Extra blank lines are usually fine
- **Use templates** - Copy patterns from SKILL.md examples
- **Think hierarchically** - Plan heading structure first
- **Stay consistent** - Once you choose a style, stick with it

### For Users

- **Validate early** - Don't wait until the document is complete
- **Learn the patterns** - After a few iterations, violations become obvious
- **Use editor integration** - Real-time validation catches errors faster
- **Build a style guide** - Document your preferences for AI to follow

## Summary Checklist

**Before Generation:**

- [ ] SKILL.md loaded into context
- [ ] Structure planned (headings, lists, code)
- [ ] Blank line strategy determined
- [ ] List marker style chosen (`-`)

**During Generation:**

- [ ] Blank line before every list
- [ ] Blank line after every list
- [ ] Blank line before every heading (except document start)
- [ ] Blank line after every heading
- [ ] Blank line before every code block
- [ ] Blank line after every code block
- [ ] Language identifier on every code block
- [ ] Consistent list markers throughout
- [ ] Proper heading progression (1→2→3)
- [ ] Lines kept under 80 characters
- [ ] Regular spaces only (no nbsp, no tabs)

**After Generation:**

- [ ] Internal validation complete
- [ ] All checklists verified
- [ ] Output provided to user
- [ ] Validation command recommended

**User Validation:**

- [ ] File saved as .md
- [ ] markdownlint executed
- [ ] Zero violations confirmed
- [ ] Markdown ready for production

## Getting Help

If problems persist:

1. **Review SKILL.md** - Complete rule reference
2. **Check QUICK_REFERENCE.md** - Fast pattern lookup
3. **Examine examples/** - Correct and incorrect samples
4. **Run markdownlint** - Get specific violation details
5. **Consult rules/** - Deep dive into specific rules

---

**Remember:** The goal is zero violations on first generation. Follow the skill,
use the checklists, and validate thoroughly. With practice, perfect markdown
becomes automatic.
