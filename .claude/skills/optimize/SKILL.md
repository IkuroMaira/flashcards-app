---
name: optimize
description: Analyze code for performance issues, memory leaks, and optimization opportunities. Use when the user wants to improve code efficiency.
argument-hint: [paste code or filename]
allowed-tools: Read, Grep
---

# Code Optimization Review

## Context

- Current file: $ARGUMENTS

## Instructions

1. Read the provided code carefully
2. Identify performance bottlenecks (slow loops, redundant operations, N+1 queries)
3. Flag memory leaks or excessive allocations
4. Suggest concrete rewrites, not just descriptions of problems
5. Prioritize by impact: high/medium/low

## Output Format

For each issue:
- **Issue**: What the problem is
- **Impact**: High / Medium / Low
- **Fix**: The improved code snippet
