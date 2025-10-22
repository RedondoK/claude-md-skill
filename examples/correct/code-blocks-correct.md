# Correct Code Block Formatting Examples

This document demonstrates proper code block formatting that passes markdownlint validation.

## Fenced Code Blocks

### Basic Code Block with Language

Here's a Python example:

```python
def hello_world():
    print("Hello, World!")
    return True
```

The code block has blank lines before and after.

### Multiple Code Blocks

First example in JavaScript:

```javascript
function greet(name) {
    return `Hello, ${name}!`;
}
```

Second example in Bash:

```bash
#!/bin/bash
echo "Hello from bash"
ls -la
```

All properly spaced.

## Language Identifiers

### Common Languages

Python code:

```python
import sys

def main():
    print("Python example")
```

JavaScript code:

```javascript
const greeting = "Hello";
console.log(greeting);
```

Java code:

```java
public class Example {
    public static void main(String[] args) {
        System.out.println("Hello");
    }
}
```

C code:

```c
#include <stdio.h>

int main() {
    printf("Hello\n");
    return 0;
}
```

### Shell Scripts and Commands

Bash script:

```bash
#!/bin/bash
for i in {1..5}; do
    echo "Count: $i"
done
```

Shell commands:

```sh
cd /home/user
ls -l
pwd
```

PowerShell:

```powershell
Get-Process | Where-Object {$_.CPU -gt 100}
Write-Host "Done"
```

### Markup and Data Languages

HTML:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Example</title>
</head>
<body>
    <h1>Hello</h1>
</body>
</html>
```

CSS:

```css
.container {
    display: flex;
    justify-content: center;
    align-items: center;
}
```

JSON:

```json
{
    "name": "Example",
    "version": "1.0.0",
    "dependencies": {
        "express": "^4.17.1"
    }
}
```

YAML:

```yaml
name: Example
version: 1.0.0
dependencies:
  express: ^4.17.1
```

XML:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<root>
    <item>Example</item>
</root>
```

### Other Common Languages

SQL:

```sql
SELECT users.name, orders.total
FROM users
INNER JOIN orders ON users.id = orders.user_id
WHERE orders.total > 100;
```

Markdown itself:

```markdown
# Heading

This is **bold** and this is *italic*.

- List item 1
- List item 2
```

Plain text:

```text
This is plain text with no syntax highlighting.
It's useful for terminal output or generic examples.
```

## Code Blocks in Lists

### Proper Integration

Step-by-step guide:

1. First, install the package:

   ```bash
   npm install package-name
   ```

2. Create a configuration file:

   ```json
   {
       "setting": "value"
   }
   ```

3. Run the application:

   ```bash
   npm start
   ```

Complete!

## Code Blocks with Multiple Languages

### Comparing Implementations

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

Both achieve the same result.

## Inline Code vs Code Blocks

### When to Use Each

Use inline code for short references like `variable_name` or `function()` within text.

Use code blocks for longer examples:

```python
# This is a complete function
def calculate_total(items):
    total = 0
    for item in items:
        total += item.price
    return total
```

The distinction is clear.

## Code Blocks with Comments

### Documented Code

Well-commented example:

```python
# Calculate factorial recursively
def factorial(n):
    # Base case
    if n <= 1:
        return 1
    
    # Recursive case
    return n * factorial(n - 1)

# Test the function
result = factorial(5)
print(f"5! = {result}")  # Output: 5! = 120
```

Comments help explain the code.

## Output and Logs

### Terminal Output

Command execution:

```bash
$ python script.py
```

Output:

```text
Processing data...
Complete! Processed 1000 items.
Success rate: 98.5%
```

Log file:

```text
[2025-10-22 10:30:15] INFO: Application started
[2025-10-22 10:30:16] DEBUG: Loading configuration
[2025-10-22 10:30:17] INFO: Server listening on port 3000
```

## Long Code Blocks

### Handling Large Examples

Sometimes code is lengthy:

```python
"""
Complete example with multiple functions and classes
"""

class DataProcessor:
    def __init__(self, data_source):
        self.data_source = data_source
        self.results = []
    
    def load_data(self):
        """Load data from source"""
        with open(self.data_source, 'r') as f:
            return f.read()
    
    def process(self, data):
        """Process the loaded data"""
        lines = data.split('\n')
        for line in lines:
            if line.strip():
                self.results.append(self.transform(line))
    
    def transform(self, line):
        """Transform a single line"""
        return line.upper().strip()
    
    def get_results(self):
        """Return processed results"""
        return self.results


def main():
    processor = DataProcessor('data.txt')
    data = processor.load_data()
    processor.process(data)
    results = processor.get_results()
    
    print(f"Processed {len(results)} lines")
    for result in results[:5]:
        print(f"  - {result}")


if __name__ == "__main__":
    main()
```

Even long blocks need proper spacing.

## Special Cases

### Empty Code Blocks

Sometimes showing empty structure:

```python
# Empty function template
def new_function():
    pass
```

### Code with Blank Lines

Internal blank lines are fine:

```python
def function_one():
    print("First function")


def function_two():
    print("Second function")
```

The blank line is inside the code block.

## Summary

Proper code block formatting requires:

- Blank lines before and after code blocks
- Language identifier specified
- Proper indentation in lists
- Consistent formatting throughout
