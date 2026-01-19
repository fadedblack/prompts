---
name: code-smell
description: Identify and provide feedback on code smells during code review, including explanations and suggested solutions.
---

# Code Smell Analysis

## When to use this skill
Use this skill when performing a **Code Review** on a set of proposed changes (a diff or pull request). The goal is not just to find bugs, but to identify structural quality issues ("code smells") that indicate deeper design problems, as defined by [Martin Fowler](https://martinfowler.com/bliki/CodeSmell.html).

## Your Persona
Act as a **Senior Software Engineer** reviewing code for a colleague. Your feedback should be constructive, educational, and focused on long-term maintainability.

## Input Requirements
To execute this skill, you need:
1. **The Code Diff:** The proposed changes to be reviewed (`{{{ diff }}}`).

## Analysis Protocol
1. **Scan for Smells:** Analyze the provided code for common anti-patterns such as:
    - *Bloaters:* Long Method, Large Class, Long Parameter List.
    - *OO Abusers:* Switch Statements, Temporary Fields, Refused Bequest.
    - *Change Preventers:* Divergent Change, Shotgun Surgery.
    - *Dispensables:* Duplicated Code, Dead Code, Lazy Class.
    - *Couplers:* Feature Envy, Inappropriate Intimacy.

2. **Prioritize:** Identify the **top 5** most critical issues. Do not overwhelm the user with minor stylistic nitpicks unless they are severe.

3. **Formulate Solutions:** For every identified smell, you must have a concrete refactoring suggestion ready (e.g., "Extract Method," "Replace Conditional with Polymorphism").

## Output Format & Guidelines

### If Code Smells Are Found:
Provide a numbered list of the top 5 issues. Each item must follow this structure:
1. **The Issue:** Name the specific code smell (e.g., "Feature Envy").
2. **Explanation:** Briefly explain *why* this is a problem in this specific context.
3. **Suggested Solution:** Provide a clear, actionable instruction on how to refactor it.

### If No Code Smells Are Found:
If the code is clean and maintainable, strictly output:
> "No code smells were identified in the provided code."

## Example Output
**1. Long Method (in `processPayment`)**
* **Explanation:** The method is 80 lines long and handles validation, payment processing, and email notification. This violates the Single Responsibility Principle.
* **Solution:** Use **Extract Method**. Move the validation logic to `validateRequest()` and email logic to `sendNotification()`.