---
name: agile-story-generator
description: Generate comprehensive Agile Story Cards (User Stories, Acceptance Criteria, QA Testing Guidelines, and Context) by analyzing raw git commit logs.
---

# Agile Story Generator

## When to use this skill
Use this skill when the user provides a list of **Git Commits** or technical change logs and needs them converted into a structured **Agile Story Card**. This is useful for retroactively documenting work, creating release notes, or updating Jira/Trello tickets.

## Input Requirements
1. **Commits:** A list of git messages, diff summaries, or technical notes (`{{{ commits }}}`).
2. **Context (Optional):** A brief mention of the project domain (e.g., "E-commerce checkout flow").

## Analysis Protocol

### 1. Determine the Story Type
Analyze the commits to classify the work:
- **Feature:** Adds new functionality (Keywords: `feat`, `add`, `create`).
- **Bug Fix:** Repairs broken functionality (Keywords: `fix`, `patch`, `resolve`).
- **Chore/Tech Debt:** Internal maintenance (Keywords: `chore`, `refactor`, `config`).

### 2. Identify the "Who" and "Why"
- **Actor:** Who benefits? (e.g., Admin, User, API Consumer, Developer).
- **Benefit:** Look beyond *what* changed to *why* it changed.

### 3. Derive Acceptance Criteria (AC)
Reverse-engineer the criteria based on the logic implemented in the commits.
- **Format:** Use the ✅ emoji at the end of each checklist item.

### 4. Derive QA Testing Strategy
Analyze the impact area to guide the QA engineer:
- **Data Requirements:** Does the tester need a specific user role, database state, or feature flag enabled?
- **Impact Analysis (Regression):** Based on the components touched, what existing features might break?
- **Edge Cases:** Identify specific boundary tests (e.g., "Empty strings," "Null values," "Network timeouts").

## Output Structure

You must output the story card using this exact format:

### **[Type] Story Title**
*(Create a concise, action-oriented title)*

**User Story**
> **As a** [Role]
> **I want** [Feature/Action]
> **So that** [Benefit/Value]

**Context & Implementation Details**
*(Brief summary of the technical changes based on the commits. Mention specific services or components touched.)*

**Acceptance Criteria (Definition of Done)**
**Scenario 1:** [Criterion derived from code logic] ✅
**Scenario 2:** [Criterion derived from edge cases handled in commits] ✅
**Scenario 3:** [Negative test case, e.g., error handling] ✅

**QA Testing Guidelines**
* **Test Data Needed:** [e.g., "User with Admin permissions" or "N/A"]
* **Key Test Scenarios:**
    * [Specific test case 1]
    * [Specific test case 2]
* **Regression Risks:** [What adjacent features should be double-checked?]

---

## Example Processing

**Input Commits:**
> `feat: add regex check for email input`
> `test: add unit test for invalid email domain`
> `ui: show red border on input error`
> `fix: prevent submit on empty string`

**Output:**

### **[Feature] Email Format Validation**

**User Story**
> **As a** New User
> **I want** to be warned if I enter an invalid email address
> **So that** I don't sign up with a typo and lose access to my account

**Context & Implementation Details**
Implemented Regex validation on the frontend input component. Added visual feedback states (red border) for error handling and disabled submission for empty strings.

**Acceptance Criteria (Definition of Done)**
**Verify Valid Email:** System accepts standard email formats (user@domain.com). ✅
**Verify Invalid Domain:** System rejects emails without a domain extension. ✅
**UI Feedback:** Verify the input field turns red when validation fails. ✅
**Submission Block:** Verify the "Sign Up" button is disabled until a valid email is entered. ✅

**QA Testing Guidelines**
* **Test Data Needed:** N/A (Client-side validation only).
* **Key Test Scenarios:**
    * **Boundary Test:** Try a very long email address (255+ chars).
    * **Special Chars:** Try emails with `+` symbols (e.g., `user+test@gmail.com`).
    * **Empty State:** Click submit immediately without typing anything.
* **Regression Risks:** Check the "Forgot Password" screen, as it likely uses the same Input Component.