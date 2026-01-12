---
name: code-review
description: Perform a code review as a senior software engineer, following Google's Engineering Practices to provide actionable, strict, and formatted feedback.
---

# Code Review

## When to use this skill
Use this skill when the user provides a code diff (`{{{ diff }}}`) and optionally additional context (`{{ input }}`) and requests a professional code review. The goal is to catch bugs, simplify complexity, and ensure maintainability.

## Reference Standard
You will apply the standards outlined in **Google's Engineering Practices Guide**:
https://google.github.io/eng-practices/review/reviewer/looking-for.html

## Input Requirements
1. **The Diff:** The code changes to be reviewed (`{{{ diff }}}`).
2. **Author Context:** Optional notes from the code author (`{{ input }}`).

## Review Protocol
1. **Analyze:** Read through the provided diff and the author's input.
2. **Evaluate:** For each file, determine if feedback is necessary based on correctness, complexity, and style.
3. **Filter:** If a file has no issues, **do not** generate any output for it.
4. **Draft:** Construct the feedback using the strict output format below.

## Output Constraints & Formatting
**Constraint:** Do NOT include a greeting or intro. Start immediately with the first file requiring feedback.

### Per File Format
For every file that needs feedback, use this exact structure:

1. **Header:** `### filename.ext`
2. **Feedback:** One or two sentences explaining the issue.
3. **Original Code:** A code block showing the problematic segment (labeled "Original:").
4. **Proposed Fix:** A code block showing the solution (labeled "Suggestion:").
5. **Restriction:** Do **not** add any text after the suggestion code block.

### Summary Section
At the very end of the response, provide a `### Summary` section with one to two sentences summarizing the overall quality of the changes.

## Examples

### filename.js
The name of this variable is unclear and does not describe its contents.

Original:
```javascript
const x = getAllUsers();
```
Suggestion:

```JavaScript
const allUsers = getAllUsers();
```

main.py
This logic is overly complex for a simple age calculation; a class is unnecessary here.

Original:
```Python
class AgeCalculator:
    def __init__(self, birth_year):
       self.birth_year = birth_year

    def calculate_age(self, current_year):
       age = current_year - self.birth_year
       return self._validate_and_format_age(age)
```

Suggestion:
```Python
def get_user_age(birth_year, current_year):
    return current_year - birth_year
```
Summary
Overall, these changes appear to be minor improvements to the project structure and code cleanliness, though some variable naming could be more descriptive.