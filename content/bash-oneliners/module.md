# Essential Bash One-Liners

<details>
slug: bash-oneliners
published: 01/10/2026
author: Gopher Guides
seo_description: Master essential bash one-liners for text processing, file manipulation, and system administration using grep, awk, sed, find, and xargs.
tags: bash, shell, linux, devops
</details>

---

<details>
overview: true
</details>

## Overview

Bash one-liners are powerful tools for quick text processing and system administration. This collection covers the most useful patterns you'll encounter daily.

---

## The Essential Commands

Here are battle-tested one-liners for common tasks:

<code src="src/examples/oneliners.sh"></code>

## Breaking Down the Patterns

### Text Search with grep

```bash
# Case-insensitive search
grep -i "error" logfile.txt

# Show context around matches
grep -C 3 "exception" app.log

# Count matches per file
grep -c "TODO" *.go
```

### Text Processing with awk

```bash
# Sum a column of numbers
awk '{sum += $1} END {print sum}' numbers.txt

# Filter by field value
awk -F',' '$3 > 100 {print $1, $3}' data.csv
```

### Stream Editing with sed

```bash
# In-place replacement
sed -i 's/old/new/g' file.txt

# Delete lines matching pattern
sed '/DEBUG/d' logfile.txt
```

## Key Takeaways

1. **Pipe commands together** - Unix philosophy at work
2. **Use xargs for parallelism** - Speed up batch operations
3. **Test before modifying** - Remove `-i` flag when testing sed
4. **Quote your variables** - Prevent word splitting issues

## Next Steps

- Learn `jq` for JSON processing
- Explore `parallel` for better parallelism
- Master `tmux` for session management
- Study shell scripting best practices
