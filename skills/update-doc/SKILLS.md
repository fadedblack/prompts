---
name: update-doc
description: Update existing README.adoc files by analyzing architectural changes and modifying specific sections while preserving document structure.
---

# README Updater

## When to use this skill
Use this skill when the user provides new context, code changes, or architectural updates and requests an update to an existing repository's `README.adoc` file. This is specifically for **maintenance** of documentation, ensuring the file reflects the current state of the software.

## Input Requirements
To use this skill effectively, the agent requires:
1. **Current File:** The content of the existing `README.adoc`.
2. **New Context:** A description of the changes (e.g., "We switched from MySQL to PostgreSQL," "Added a new API endpoint," or "Changed the installation flags").

## How to process updates
1. **Perform Gap Analysis:**
    - Compare the **Current File** against the **New Context**.710480
    - Identify which specific sections (Context, Tech Stack, Prerequisites, Configuration, etc.) are affected by the change.
    - *Example:* If the user says "We added Redis," identify that "Tech Stack" and "Prerequisites" need updating.

2. **Preserve Structure:**
    - Do **not** rewrite the entire file from scratch unless requested.
    - Retain the existing AsciiDoc header styles (`=`, `==`) and section order.
    - Keep the "One-Liner" and "Context" accurate to the new scope.

3. **Apply AsciiDoc Formatting Rules:**
    - Ensure all headers use the `=` syntax.
    - Ensure code blocks use `[source,bash]` or `[source,yaml]` and are delimited by `----`.
    - Use `NOTE:` or `WARNING:` admonitions if the architectural change introduces breaking changes or critical alerts.

## Execution Steps
1. **Read** the existing `README.adoc`.
2. **Locate** the sections requiring changes based on the new context.
3. **Draft** the new content for those sections, ensuring technical accuracy.
4. **Output** the fully updated `README.adoc` file.