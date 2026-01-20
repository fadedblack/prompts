---
name: pr-generator
description: Generate a structured Pull Request body based on a "Gold Standard" example, then raise the PR using the GitHub CLI.
allowed-tools: zsh
---

# PR Generator

## When to use this skill
Use this skill when the user provides git logs or a summary of changes and asks to "Create a PR". You must generate a PR that strictly follows the style and structure of the provided reference example.

## Resources
1.  **Reference Style:** `references/pr_example.md` (Read this first to understand the required tone, emojis, and formatting).
2.  **Output Template:** `assets/pr_template.md` (Use this file to structure your final output).

## Content Generation Workflow

### Step 1: Style Analysis
Read `references/pr_example.md`. Note the following specific style requirements:
* **Emojis:** usage of `🔍`, `✨`, and `⚙️`.
* **Headers:** Specific casing and structure.
* **API Contracts:** The requirement to show JSON snippets for new endpoints.

### Step 2: Context Analysis
Read the provided git commits.
* **Determine Title:** Use Conventional Commits format: `type(scope): description`.
* **Identify Changes:** Group changes by component (Controller, Service, DTO, Config).

### Step 3: Fill Template
Load `assets/pr_template.md` and populate it with your analyzed content, applying the style rules learned from the reference file.

### Step 4: User Confirmation (CRITICAL)
**Before running any scripts**, present the generated Title and Body to the user.
* Ask: *"Here is the generated PR. Do you want to proceed?"*
* **STOP** and wait for "Yes".

### Step 5: Execution
Once confirmed, run the script:
```zsh
./scripts/git-pr-push.zsh "<Title>" "<Body>"