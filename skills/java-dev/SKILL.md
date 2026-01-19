---
name: java-dev
description: Guidelines for building Java-based applications, including static analysis integration, best practices, bug patterns, and code smell prevention.
applyTo: '**/*.java'
---

# Java Development

## When to use this skill
Use this skill whenever you are **writing**, **refactoring**, or **reviewing** Java code. This applies effectively to creating new features, modernizing legacy code to newer Java versions (17+), or cleaning up technical debt.

## Guiding Principles
1. **Proactive Cleanup:** Address code smells immediately; do not let technical debt accumulate.
2. **Quality over Speed:** Prioritize readability, maintainability, and performance over "clever" one-liners.
3. **Listen to the Tools:** Treat IDE warnings and static analysis suggestions as requirements, not suggestions.

## How to Apply Modern Java Features
When generating code, prioritize these patterns:
- **Data Structures:** Use **Records** (`record User(...)`) for data carriers (DTOs, immutable structures) instead of traditional classes with getters/setters.
- **Control Flow:** Use **Pattern Matching** for `instanceof` and `switch` expressions to reduce verbosity.
- **Variables:** Use `var` for local variables only when the type is obvious from the right-hand side (e.g., `var users = new ArrayList<User>()`).
- **Immutability:**
	- Make fields `final` wherever possible.
	- Use `List.of()`, `Map.of()` for fixed collections.
	- Use `Stream.toList()` for immutable result sets.
- **Null Safety:** Never return `null`. Use `Optional<T>` for potential absence. Use `Objects.requireNonNull()` for validation.

## How to Handle Naming
Follow the **Google Java Style Guide**:
- **Classes:** `UpperCamelCase` (Noun, e.g., `PaymentProcessor`)
- **Methods:** `lowerCamelCase` (Verb, e.g., `calculateTotal`)
- **Constants:** `UPPER_SNAKE_CASE` (e.g., `MAX_RETRY_COUNT`)
- **Packages:** `lowercase`
- **Restrictions:** No abbreviations or Hungarian notation.

## Static Analysis & Refactoring Checks
Before finalizing code, check for these issues:

### 1. Prevent Common Bugs
- **Resources:** Are `InputStream`, `Connection`, or `Socket` objects closed? **Action:** Wrap them in a `try-with-resources` block.
- **Equality:** Are objects compared with `==`? **Action:** Change to `.equals()` or `Objects.equals()`.
- **Logic:** Are there unreachable conditions (always true/false)? **Action:** Remove them.

### 2. Remove Code Smells
- **Magic Numbers:** Replace bare numbers (e.g., `if status == 4`) with named constants (`if status == STATUS_ACTIVE`).
- **Cognitive Complexity:** If a method has deep nesting, **Action:** Extract logic into helper methods or use the Strategy pattern.
- **Method Size:** If a method is too long or has too many parameters, **Action:** Introduce a Builder pattern or Value Object.
- **Duplication:** Extract repeated string literals into constants.

## Build and Verification Steps
1. **Compilation:** Ensure the code compiles without errors.
2. **Build Tool:** If the project uses Gradle, run:
   ```bash
   ./gradlew build
3. **Test Suite:** Ensure all unit tests pass before considering the task complete.