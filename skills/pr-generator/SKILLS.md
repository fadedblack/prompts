---
name: pr-generator
description: Generate a structured Pull Request body from git commits and automatically raise the PR on GitHub using the CLI.
allowed-tools: zsh
---

# PR Generator

## When to use this skill
Use this skill when the user provides git logs or a summary of changes and asks to "Create a PR" or "Raise a Pull Request".

## Workflow

### Step 1: Content Generation
1.  **Load Template:** Read the standard PR template from `assets/pr_template.md`.
2.  **Analyze Commits:** Parse the user's commit logs.
3.  **Draft Content:** Fill in the template sections:
    * **Title:** Concise, imperative mood (e.g., "Add user authentication").
    * **Summary:** A paragraph explaining *what* changed and *why*.
    * **Change List:** Bullet points of specific modifications.
    * **Type of Change:** Check the correct box [x] based on commit types (feat, fix, etc.).

### Step 2: User Confirmation (CRITICAL)
**Before running any scripts**, you must present the generated Title and Body to the user.
* Ask: *"Here is the proposed PR. Do you want me to proceed with raising this on GitHub?"*
* **STOP** and wait for the user to reply "Yes".

### Step 3: Execution
Once confirmed, use the script located at `scripts/git-pr-push.zsh` to raise the PR.

**Command Syntax:**
```zsh
./scripts/git-pr-push.zsh "<Title>" "<Body>"