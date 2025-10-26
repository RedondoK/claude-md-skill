# Contributing to GitHub Flavored Markdown Skill

Thank you for your interest in improving this skill! This document provides
guidelines for contributing to the project.

## How to Contribute

### Reporting Issues

Found a markdown violation pattern not covered by the skill? Report it!

**Include:**

1. The specific markdown that causes the violation
2. The markdownlint error message (rule number and description)
3. Expected behavior vs actual behavior
4. Platform/tool where the issue occurs
5. Version of markdownlint being used

**Example Issue Report:**

```markdown
**Violation:** MD032 - Lists should be surrounded by blank lines

**Generated Markdown:**
Here is my list:
- Item 1
- Item 2
Next paragraph.

**Error Message:**
test.md:2 MD032/blanks-around-lists Lists should be surrounded by blank lines

**Expected:** Skill should prevent this by ensuring blank lines
**Tool:** markdownlint-cli 0.35.0
**Skill Version:** 1.1.2
```

### Suggesting Enhancements

Have an idea for improving the skill?

**Include:**

1. Clear description of the enhancement
2. Why it would be valuable
3. How it would work
4. Example of before/after behavior
5. Any edge cases to consider

### Submitting Changes

#### Before You Start

1. Check if someone else is already working on it
2. Discuss major changes in an issue first
3. Ensure your idea aligns with the skill's goals

#### Development Process

**Step 1: Set Up Your Environment**

```bash
# Clone the repository
git clone https://github.com/yourusername/md_skill_md.git
cd md_skill_md

# Install markdownlint-cli
npm install -g markdownlint-cli

# Verify installation
markdownlint --version
```

**Step 2: Create a Branch**

```bash
# Create a feature branch
git checkout -b feature/your-feature-name

# Or for bug fixes
git checkout -b fix/your-fix-name
```

**Step 3: Make Your Changes**

Follow these guidelines:

- Update SKILL.md if adding/modifying rules
- Add examples to examples/ directory if helpful
- Create test cases in tests/ if applicable
- Update CHANGELOG.md with your changes
- Ensure all markdown passes markdownlint

**Step 4: Test Your Changes**

```bash
# Validate all markdown files
markdownlint '**/*.md' --ignore node_modules --ignore roadwork

# Run test suite
bash tests/run-tests.sh

# Test your specific changes
markdownlint your-new-file.md
```

**Step 5: Commit Your Changes**

Use clear, descriptive commit messages:

```bash
# Good commit messages
git commit -m "docs: add MD034 rule for bare URL handling"
git commit -m "fix: correct MD013 line length in examples"
git commit -m "feat: add table formatting guidelines"

# Commit message format
# type: subject
#
# Types: feat, fix, docs, style, refactor, test, chore
```

**Step 6: Submit a Pull Request**

1. Push your branch to GitHub
2. Create a pull request
3. Fill out the PR template
4. Wait for review

### Code Style Guidelines

#### Markdown Style

All markdown must follow the skill's own guidelines:

- Blank lines before/after lists, headings, code blocks
- Consistent list markers (use `-`)
- Language identifiers on all code blocks
- Lines under 80 characters (except URLs)
- Proper heading hierarchy
- No trailing whitespace
- File ends with single newline

#### Documentation Style

- Use clear, concise language
- Provide examples for abstract concepts
- Include both correct and incorrect examples
- Explain the "why" not just the "what"
- Keep paragraphs focused and short

#### Commit Message Style

Follow conventional commits:

```text
type(scope): subject

body (optional)

footer (optional)
```

**Types:**

- `feat:` New feature or rule addition
- `fix:` Bug fix or correction
- `docs:` Documentation changes
- `style:` Formatting changes (no logic change)
- `refactor:` Code restructuring
- `test:` Test additions or changes
- `chore:` Maintenance tasks

### Pull Request Guidelines

#### PR Title

Use the same format as commit messages:

- `feat: add table formatting guidelines`
- `fix: correct MD024 duplicate heading examples`
- `docs: improve quick reference card`

#### PR Description

Include:

1. **What:** What does this PR do?
2. **Why:** Why is this change needed?
3. **How:** How does it work?
4. **Testing:** How was it tested?
5. **Checklist:** Complete the checklist below

#### PR Checklist

```markdown
- [ ] All markdown passes markdownlint validation
- [ ] CHANGELOG.md updated with changes
- [ ] Examples added if applicable
- [ ] Tests pass (bash tests/run-tests.sh)
- [ ] Documentation updated if needed
- [ ] Commit messages follow guidelines
- [ ] No breaking changes (or documented)
```

### Review Process

**What to Expect:**

1. Automated checks run (markdownlint validation)
2. Maintainer review (usually within 1-3 days)
3. Feedback or approval
4. Iteration if changes requested
5. Merge when approved

**Review Criteria:**

- Correctness: Does it work as described?
- Quality: Is the code/documentation clear?
- Testing: Is it adequately tested?
- Style: Does it follow guidelines?
- Impact: Does it improve the skill?

### Types of Contributions

#### High Priority

- **Fixing violations** in skill documents
- **Adding missing rules** not yet covered
- **Improving examples** that are unclear
- **Documenting edge cases** found in the wild

#### Medium Priority

- **Enhancing documentation** for clarity
- **Adding test cases** for better coverage
- **Creating templates** for common use cases
- **Improving tooling** and automation

#### Low Priority (But Welcome!)

- **Typo fixes** in documentation
- **Formatting improvements** for readability
- **Link updates** for better references
- **Minor clarifications** in examples

### What Not to Contribute

Please avoid:

- **Style preferences** without markdownlint backing
- **Breaking changes** to stable APIs
- **Incomplete features** without documentation
- **Large refactors** without prior discussion
- **Dependencies** that complicate usage

### Getting Help

Need help contributing?

- **Questions:** Open an issue with `[Question]` in title
- **Discussion:** Start a discussion in GitHub Discussions
- **Clarification:** Ask in your PR or issue
- **Examples:** Check existing PRs for patterns

### Recognition

Contributors will be:

- Listed in CHANGELOG.md for their contributions
- Mentioned in release notes
- Credited in documentation they improve

### Code of Conduct

Be respectful and professional:

- **Be patient** with new contributors
- **Be constructive** in feedback
- **Be collaborative** in discussions
- **Be inclusive** of all experience levels

### Licensing

By contributing, you agree that your contributions will be licensed under
the same license as the project.

### Quick Contribution Workflow

```bash
# 1. Fork and clone
git clone https://github.com/yourusername/md_skill_md.git
cd md_skill_md

# 2. Create branch
git checkout -b fix/my-fix

# 3. Make changes
# ... edit files ...

# 4. Validate
markdownlint '**/*.md' --ignore node_modules --ignore roadwork

# 5. Test
bash tests/run-tests.sh

# 6. Commit
git add -A
git commit -m "fix: correct MD032 example in SKILL.md"

# 7. Push
git push origin fix/my-fix

# 8. Create PR on GitHub
```

### Questions?

If you have questions not covered here:

1. Check existing issues and documentation
2. Search closed issues for similar questions
3. Open a new issue with `[Question]` prefix
4. Be specific about what you need help with

---

**Thank you for contributing to make markdown generation better for everyone!**
