# Integration Guide: GitHub Flavored Markdown Skill

**Version:** 1.0.2  
**Purpose:** Integrate this skill into AI systems and workflows

## Overview

This guide covers integration scenarios for incorporating the GFM skill into
various AI systems, development workflows, and documentation pipelines.

## Integration Patterns

### Pattern 1: AI System with File Access

**Scenario:** AI has direct filesystem access (e.g., Claude with Filesystem
extension)

**Implementation:**

```python
# Pseudocode for integration
def generate_markdown(request):
    # Load skill
    skill = read_file("C:/path/to/SKILL.md")
    
    # Inject into context
    context = f"{skill}\n\nUser request: {request}"
    
    # Generate
    markdown = ai_model.generate(context)
    
    # Validate
    result = validate_with_markdownlint(markdown)
    
    return markdown if result.is_clean else correct_violations(markdown)
```

**Benefits:**

- Skill always up-to-date
- Direct file access
- Real-time validation

### Pattern 2: AI System with Prompt Injection

**Scenario:** AI system accepts system prompts or instruction prefixes

**Implementation:**

```python
SKILL_SUMMARY = """
When generating markdown:
1. Add blank lines before/after lists
2. Add blank lines before/after headings
3. Add blank lines before/after code blocks
4. Use consistent list markers (-)
5. Specify language for code blocks
6. Keep lines under 80 characters
7. Increment heading levels by one
"""

def generate_markdown(user_request):
    full_prompt = f"{SKILL_SUMMARY}\n\n{user_request}"
    return ai_model.generate(full_prompt)
```

**Benefits:**

- Works with any AI system
- No file access required
- Portable across platforms

### Pattern 3: Pre-Processing Pipeline

**Scenario:** Validate and correct markdown before deployment

**Implementation:**

```bash
#!/bin/bash
# Markdown generation pipeline

# Generate markdown
generate_docs.py

# Validate
markdownlint docs/*.md || {
    echo "Violations found. Running auto-fix..."
    markdownlint --fix docs/*.md
}

# Final validation
markdownlint docs/*.md

# Deploy if clean
if [ $? -eq 0 ]; then
    deploy_docs.sh
fi
```

**Benefits:**

- Automated quality control
- Pre-deployment validation
- Auto-fix capability

### Pattern 4: CI/CD Integration

**Scenario:** Validate markdown in continuous integration

**Implementation:**

```yaml
# .github/workflows/markdown-validation.yml
name: Validate Markdown

on:
  pull_request:
    paths:
      - '**.md'
  push:
    paths:
      - '**.md'

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Install markdownlint
        run: npm install -g markdownlint-cli
      
      - name: Validate markdown files
        run: markdownlint '**/*.md' --ignore node_modules
      
      - name: Report violations
        if: failure()
        run: |
          echo "::error::Markdown validation failed"
          echo "Run 'markdownlint --fix' to auto-correct"
```

**Benefits:**

- Prevents violation merges
- Automated quality gates
- Team-wide consistency

## Environment-Specific Integration

### VSCode Integration

**Setup:**

1. Install markdownlint extension
2. Add workspace settings:

```json
{
  "markdownlint.config": {
    "MD013": { "line_length": 80 },
    "MD033": false
  },
  "editor.formatOnSave": true,
  "[markdown]": {
    "editor.defaultFormatter": "DavidAnson.vscode-markdownlint"
  }
}
```

**Usage:**

- Real-time violation highlighting
- Quick fixes on save
- Integrated problem panel

### Cursor / VS Code Forks

**Implementation:**

Same as VSCode - most forks support markdownlint extension

**Custom Rules:**

Create `.markdownlint.json` in project root:

```json
{
  "default": true,
  "MD013": { "line_length": 100 },
  "MD033": { "allowed_elements": ["br"] }
}
```

### JetBrains IDEs (PyCharm, IntelliJ, etc.)

**Setup:**

1. Install Markdown plugin
2. Enable markdownlint support
3. Configure in Settings → Languages → Markdown

**Features:**

- Inline error highlighting
- Quick fix suggestions
- Format on save

### Vim/Neovim

**Setup with ALE:**

```vim
" .vimrc or init.vim
let g:ale_linters = {
\   'markdown': ['markdownlint'],
\}

let g:ale_fixers = {
\   'markdown': ['markdownlint'],
\}

let g:ale_fix_on_save = 1
```

**Usage:**

- Automatic linting
- Fix on save
- Error navigation

### Emacs

**Setup with Flycheck:**

```elisp
;; .emacs or init.el
(require 'flycheck)
(add-hook 'markdown-mode-hook #'flycheck-mode)

(flycheck-define-checker markdown-markdownlint
  "Markdown checker using markdownlint."
  :command ("markdownlint" source)
  :error-patterns
  ((warning line-start (file-name) ":" line " " (message) line-end))
  :modes markdown-mode)

(add-to-list 'flycheck-checkers 'markdown-markdownlint)
```

## API Integration

### REST API Wrapper

**Example:** Create validation service

```python
from flask import Flask, request, jsonify
import subprocess
import tempfile
import os

app = Flask(__name__)

@app.route('/validate', methods=['POST'])
def validate_markdown():
    markdown_content = request.json.get('content')
    
    # Write to temp file
    with tempfile.NamedTemporaryFile(mode='w', suffix='.md', 
                                     delete=False) as f:
        f.write(markdown_content)
        temp_path = f.name
    
    # Validate
    result = subprocess.run(
        ['markdownlint', temp_path],
        capture_output=True,
        text=True
    )
    
    # Clean up
    os.unlink(temp_path)
    
    return jsonify({
        'valid': result.returncode == 0,
        'errors': result.stdout if result.returncode != 0 else None
    })

if __name__ == '__main__':
    app.run(port=5000)
```

**Usage:**

```bash
curl -X POST http://localhost:5000/validate \
  -H "Content-Type: application/json" \
  -d '{"content": "# Title\n\nContent here."}'
```

### Python Integration

**Direct validation:**

```python
import subprocess
from pathlib import Path

def validate_markdown_file(filepath):
    """Validate a markdown file with markdownlint."""
    result = subprocess.run(
        ['markdownlint', str(filepath)],
        capture_output=True,
        text=True
    )
    return {
        'valid': result.returncode == 0,
        'violations': result.stdout if result.returncode != 0 else None
    }

def validate_markdown_content(content):
    """Validate markdown content string."""
    with tempfile.NamedTemporaryFile(mode='w', suffix='.md', 
                                     delete=False) as f:
        f.write(content)
        temp_path = f.name
    
    result = validate_markdown_file(temp_path)
    Path(temp_path).unlink()
    return result
```

### Node.js Integration

**Using markdownlint library:**

```javascript
const markdownlint = require('markdownlint');
const fs = require('fs');

function validateMarkdown(filepath) {
  const options = {
    files: [filepath],
    config: {
      "default": true,
      "MD013": { "line_length": 80 }
    }
  };

  const result = markdownlint.sync(options);
  
  return {
    valid: Object.keys(result[filepath]).length === 0,
    violations: result[filepath]
  };
}

// Usage
const validation = validateMarkdown('README.md');
if (!validation.valid) {
  console.error('Violations found:', validation.violations);
}
```

## Documentation Pipeline Integration

### MkDocs

**Setup:**

```yaml
# mkdocs.yml
plugins:
  - search
  - markdownlint:
      enabled: true
      strict: true

markdown_extensions:
  - admonition
  - codehilite
  - toc:
      permalink: true
```

**Pre-build validation:**

```bash
#!/bin/bash
# validate-before-build.sh

markdownlint docs/**/*.md || exit 1
mkdocs build
```

### Sphinx with MyST

**Setup:**

```python
# conf.py
extensions = [
    'myst_parser',
]

myst_enable_extensions = [
    "colon_fence",
    "deflist",
]

# Pre-build script
import subprocess
subprocess.run(['markdownlint', 'docs/*.md'], check=True)
```

### Docusaurus

**Setup:**

```javascript
// docusaurus.config.js
module.exports = {
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          remarkPlugins: [
            [require('remark-lint-markdownlint'), { config: '.markdownlint.json' }]
          ],
        },
      },
    ],
  ],
};
```

### Hugo

**Setup:**

```toml
# config.toml
[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true
```

**Build script:**

```bash
#!/bin/bash
# build.sh

# Validate all content
markdownlint content/**/*.md || exit 1

# Build site
hugo
```

## Git Hooks Integration

### Pre-Commit Hook

**Setup:**

```bash
# .git/hooks/pre-commit

#!/bin/bash

# Get staged markdown files
STAGED_MD=$(git diff --cached --name-only --diff-filter=ACM | grep '\.md$')

if [ -z "$STAGED_MD" ]; then
    exit 0
fi

# Validate staged markdown files
echo "Validating markdown files..."
markdownlint $STAGED_MD

if [ $? -ne 0 ]; then
    echo "Markdown validation failed. Please fix violations before committing."
    echo "Run: markdownlint --fix $STAGED_MD"
    exit 1
fi

exit 0
```

**Make executable:**

```bash
chmod +x .git/hooks/pre-commit
```

### Pre-Push Hook

**Setup:**

```bash
# .git/hooks/pre-push

#!/bin/bash

echo "Validating all markdown files..."
markdownlint '**/*.md' --ignore node_modules

if [ $? -ne 0 ]; then
    echo "Markdown validation failed. Please fix violations before pushing."
    exit 1
fi

exit 0
```

## AI Platform-Specific Integration

### OpenAI GPT Integration

**System prompt injection:**

```python
import openai

MARKDOWN_SKILL_PROMPT = """
When generating markdown:
- Add blank lines before/after lists, headings, and code blocks
- Use consistent list markers (-)
- Specify language for all code blocks
- Keep lines under 80 characters
- Increment heading levels by one
"""

def generate_markdown(user_request):
    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": MARKDOWN_SKILL_PROMPT},
            {"role": "user", "content": user_request}
        ]
    )
    return response.choices[0].message.content
```

### Anthropic Claude Integration

**Using filesystem access:**

```python
import anthropic

def generate_markdown_with_skill(user_request):
    client = anthropic.Anthropic()
    
    # Load skill
    with open('C:/path/to/SKILL.md', 'r') as f:
        skill_content = f.read()
    
    message = client.messages.create(
        model="claude-sonnet-4-5-20250929",
        max_tokens=4096,
        system=f"You are an expert at GitHub Flavored Markdown.\n\n{skill_content}",
        messages=[
            {"role": "user", "content": user_request}
        ]
    )
    
    return message.content[0].text
```

### Local LLMs (Ollama, etc.)

**Prompt template:**

```python
import requests

SKILL_SUMMARY = """
<markdown_generation_rules>
1. Blank lines before/after: lists, headings, code blocks
2. Consistent list markers: use - only
3. Language identifiers: all code blocks must specify language
4. Line length: keep under 80 characters
5. Heading progression: increment by one (1→2→3)
</markdown_generation_rules>
"""

def generate_markdown(prompt):
    response = requests.post('http://localhost:11434/api/generate', json={
        'model': 'llama2',
        'prompt': f"{SKILL_SUMMARY}\n\n{prompt}",
        'stream': False
    })
    return response.json()['response']
```

## Automation Tools

### GitHub Actions

**Complete workflow:**

```yaml
name: Markdown CI

on:
  push:
    paths:
      - '**.md'
  pull_request:
    paths:
      - '**.md'

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Setup Node.js
        uses: actions/setup-node@v2
        with:
          node-version: '16'
      
      - name: Install markdownlint-cli
        run: npm install -g markdownlint-cli
      
      - name: Lint markdown files
        run: markdownlint '**/*.md' --ignore node_modules
      
      - name: Auto-fix violations (if any)
        if: failure()
        run: markdownlint --fix '**/*.md' --ignore node_modules
      
      - name: Commit fixes
        if: failure()
        uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: "Fix markdown violations"
          file_pattern: "*.md"
```

### GitLab CI

**Configuration:**

```yaml
# .gitlab-ci.yml
stages:
  - validate

markdown_lint:
  stage: validate
  image: node:16
  before_script:
    - npm install -g markdownlint-cli
  script:
    - markdownlint '**/*.md' --ignore node_modules
  only:
    changes:
      - "**/*.md"
```

### Jenkins

**Pipeline:**

```groovy
pipeline {
    agent any
    
    stages {
        stage('Validate Markdown') {
            steps {
                sh 'npm install -g markdownlint-cli'
                sh 'markdownlint **/*.md'
            }
        }
    }
    
    post {
        failure {
            echo 'Markdown validation failed'
            sh 'markdownlint --fix **/*.md'
        }
    }
}
```

## Custom Rule Configuration

### Project-Specific Rules

**Create `.markdownlint.json`:**

```json
{
  "default": true,
  "MD013": {
    "line_length": 100,
    "code_blocks": false,
    "tables": false
  },
  "MD033": {
    "allowed_elements": ["br", "img"]
  },
  "MD041": false
}
```

### Team Standards

**Shared configuration:**

```json
{
  "extends": "markdownlint/style/prettier",
  "MD013": { "line_length": 80 },
  "MD024": { "siblings_only": true },
  "MD033": { "allowed_elements": ["details", "summary"] }
}
```

## Testing Integration

### Unit Tests

**Python example:**

```python
import unittest
from markdown_generator import generate_markdown

class TestMarkdownGeneration(unittest.TestCase):
    def test_lists_have_blank_lines(self):
        result = generate_markdown("Create a list of items")
        
        # Check for blank lines around list
        self.assertIn("\n\n-", result)
        self.assertIn("\n\n", result.split("-")[-1])
    
    def test_code_blocks_have_languages(self):
        result = generate_markdown("Show Python code example")
        
        self.assertIn("```python", result)
```

### Integration Tests

**Node.js example:**

```javascript
const { generateMarkdown } = require('./generator');
const markdownlint = require('markdownlint');

describe('Markdown Generation', () => {
  test('generates valid markdown', () => {
    const content = generateMarkdown('Create a README');
    
    const result = markdownlint.sync({
      strings: { content: content }
    });
    
    expect(Object.keys(result.content)).toHaveLength(0);
  });
});
```

## Monitoring and Metrics

### Violation Tracking

**Script to track violations over time:**

```python
import subprocess
import json
from datetime import datetime

def track_violations():
    result = subprocess.run(
        ['markdownlint', '--json', '**/*.md'],
        capture_output=True,
        text=True
    )
    
    violations = json.loads(result.stdout) if result.returncode != 0 else {}
    
    metric = {
        'timestamp': datetime.now().isoformat(),
        'total_files': len(violations),
        'total_violations': sum(len(v) for v in violations.values()),
        'files': violations
    }
    
    # Log to monitoring system
    with open('markdown_metrics.jsonl', 'a') as f:
        f.write(json.dumps(metric) + '\n')

# Run daily
track_violations()
```

### Dashboard Integration

**Send metrics to dashboard:**

```python
import requests

def send_markdown_metrics(metrics):
    requests.post('https://metrics.example.com/api/markdown', json={
        'project': 'my-project',
        'violations': metrics['total_violations'],
        'files_affected': metrics['total_files'],
        'timestamp': metrics['timestamp']
    })
```

## Troubleshooting Integration Issues

### Issue: markdownlint not found

**Solution:**

```bash
# Install globally
npm install -g markdownlint-cli

# Or use npx
npx markdownlint filename.md
```

### Issue: Different results locally vs CI

**Solution:**

Lock version in `package.json`:

```json
{
  "devDependencies": {
    "markdownlint-cli": "0.35.0"
  }
}
```

### Issue: Too many violations to fix manually

**Solution:**

```bash
# Auto-fix most violations
markdownlint --fix '**/*.md'

# Review remaining violations
markdownlint '**/*.md'
```

### Issue: Custom rules not applying

**Solution:**

Verify `.markdownlint.json` location:

```bash
# Should be in project root
ls -la .markdownlint.json

# Test with explicit config
markdownlint --config .markdownlint.json filename.md
```

## Best Practices

### For Integration

1. **Start small** - Validate one directory first
2. **Use auto-fix** - Fix bulk violations automatically
3. **Add gradually** - Don't block all PRs immediately
4. **Document standards** - Share team configuration
5. **Monitor metrics** - Track violation trends

### For Maintenance

1. **Keep markdownlint updated** - Latest version has best fixes
2. **Review rules periodically** - Adjust as needed
3. **Share violations** - Help team learn patterns
4. **Automate fixes** - Reduce manual correction burden

### For Teams

1. **Standardize config** - One `.markdownlint.json` for all
2. **Enable pre-commit** - Catch violations early
3. **CI validation** - Gate merges on clean markdown
4. **Regular audits** - Check compliance across repos

---

**Summary:** Integration success comes from automation, clear standards, and
gradual adoption. Start with validation, add auto-fix, then enforce in CI/CD.
