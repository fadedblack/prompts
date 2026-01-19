---
name: agile-story-generator
description: Generate an Agile Story Card by analyzing git commits and populating a strict template with Scope, Gherkin ACs, and Tech Tasks.
---

# Agile Story Generator

## When to use this skill
Use this skill when the user provides technical context (git commits, diffs, or requirements) and needs a formal **Agile Story Card**. You must strictly adhere to the structure defined in the reference template.

## Reference Material
**Template File:** `references/story-template.md`
You must read and instantiate this template for the output.

## Execution Process

### Step 1: Load Template
Load the content of `references/story-template.md`. Your final output must match this markdown structure exactly.

### Step 2: Analyze & Fill "User Story Statement"
* **Actor:** Identify who is impacted (User, System, Admin).
* **Action:** Identify the core functionality added.
* **Value:** Deduce the "So that" (Business Value) from the context of the changes.

### Step 3: Analyze & Fill "In Scope / Out of Scope"
* **In Scope:** List specific components, validations, or logic *actually modified* in the provided commits.
* **Out of Scope:** Explicitly list:
    * UI changes (if only backend was touched).
    * Backend changes (if only UI was touched).
    * Related features that were not modified.
    * Refactoring of unrelated legacy code.

### Step 4: Analyze & Fill "Acceptance Criteria"
You must generate a Markdown Table with columns: `| Sr No | Given (Context) | When (Action) | Then (Outcome) |`.
* **Derivation:** Convert every logic check or validation in the code into a row.
* **Format:** Use Gherkin syntax.
    * *Given:* The state before the user acts (e.g., "User is on the login page").
    * *When:* The action performed (e.g., "User enters invalid email").
    * *Then:* The system response (e.g., "Error message 'Invalid Email' is displayed").

### Step 5: Analyze & Fill "Tech Tasks"
Group the technical changes found in the commits into the template's categories:
* **Database Layer:** SQL queries, schema changes, repository updates.
* **Service Layer:** Business logic, calculations, transformations.
* **Controller/API:** Endpoint definitions, payload validation.
* **DTO/Model:** New classes, fields added.
* **QA:** Unit/Integration tests added.

## Final Output Generation
Produce the complete markdown document based on the template, ensuring no sections are skipped.