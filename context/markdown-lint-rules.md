# Markdownlint Rules Guide

## Core Rules to Follow

When creating or editing markdown files, follow these rules to avoid linting errors:

### 1. Blank Lines Around Headings (MD022)

Always add blank lines before and after headings:

```markdown
Some text here.

## Heading

Next paragraph here.
```

### 2. Blank Lines Around Lists (MD032)

Always add blank lines before and after lists:

```markdown
Some text here.

- First item
- Second item

Next paragraph here.
```

### 3. Blank Lines Around Code Blocks (MD031)

Always add blank lines before and after fenced code blocks:

```markdown
Some text here.

```python
code here
```

Next paragraph here.

```markdown

### 4. Language Specification for Code Blocks (MD040)

Always specify a language for fenced code blocks:

```markdown
```python
# Python code
```

```javascript
// JavaScript code
```

```bash
# Shell commands
```

```markdown

### 5. Avoid Emphasis as Heading (MD036)

Use proper heading syntax instead of bold/italic for headings:

```markdown
# Good: Proper Heading

**Bad: Using Bold as Heading**
```

### 6. Single Trailing Newline (MD047)

Always end files with exactly one newline character.

## Common Language Identifiers

- `python` - Python code
- `javascript` or `js` - JavaScript
- `typescript` or `ts` - TypeScript
- `bash` or `shell` - Shell scripts
- `json` - JSON data
- `yaml` - YAML configuration
- `html` - HTML markup
- `css` - CSS styles
- `markdown` or `md` - Markdown
- `sql` - SQL queries
- `plaintext` or `text` - Plain text when no syntax highlighting needed

## Quick Reference

When writing markdown:

1. Add blank line before headings
2. Add blank line after headings
3. Add blank line before lists
4. Add blank line after lists
5. Add blank line before code blocks
6. Add blank line after code blocks
7. Always specify language in code blocks
8. End file with single newline
