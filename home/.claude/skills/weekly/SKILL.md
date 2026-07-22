---
name: weekly
description: Summarize what tasnimAlam did in this repository over the last N weeks (default 1). Use when the user invokes /weekly, optionally with a number of weeks, e.g. /weekly 4.
---

# Weekly Activity Summary

When this skill is invoked, summarize what the author **tasnimAlam** has done in the current repository over the last N weeks, written in the first person and in plain, simple language that anyone (including non-developers) can understand.

## 1. Parse the argument

- `$ARGUMENTS` may contain a number of weeks (e.g. `4` from `/weekly 4`).
- If empty or not a valid positive number, default to **1** week.
- Use `--since="N weeks ago"` in the git commands below.

## 2. Gather data (read-only)

Run these in the current repository:

```bash
git log --author="tasnimAlam" --since="N weeks ago" --all --date=short --pretty=format:"%h %ad %s"
```

If that returns nothing, the author string may differ — retry with the email:

```bash
git log --author="tasnim@strativ.se" --since="N weeks ago" --all --date=short --pretty=format:"%h %ad %s"
```

Then get change stats for the matching author:

```bash
git log --author="<matched author>" --since="N weeks ago" --all --shortstat --pretty=format:"%h %s"
```

If commit messages alone are unclear, you may inspect a few commits with `git show --stat <hash>` to understand what area of the code they touched. Do not modify anything — this skill is strictly read-only.

## 3. Write the summary

Rules for the output:

- **First person**: "I worked on...", "I fixed...", "I added...".
- **Easy words**: no jargon, no technical shorthand. Write it so a project manager or client understands. E.g. instead of "refactored the auth middleware", say "I cleaned up and improved the code that handles user login".
- **Group by theme**, not by commit. Combine related commits into one bullet (e.g. all login-related work becomes one point).
- Keep it **short** — a few bullets under a one-line heading like "What I did in the last N week(s)".
- End with one small stats line: number of commits, roughly how many files were touched.
- If there is no activity in the window, say so plainly: "I didn't make any changes in this repository in the last N week(s)."
