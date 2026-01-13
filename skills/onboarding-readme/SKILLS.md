---
name: onboarding-readme-generator
description: Generate a high-quality README.adoc by analyzing code to deduce architecture, ecosystem role, and setup steps, validating assumptions with the user before generation.
---

# Onboarding README Generator

## When to use this skill
Use this skill when creating or updating a `README.adoc` for a repository. This skill minimizes user effort by actively reading the code to draft sections (like prerequisites, scripts, and configuration) and only asking the user to validate or fill in gaps.

## The Goal
Create a README in **AsciiDoc** format that answers: "What is this?", "Where does it sit in the ecosystem?", "How does it fit into the architecture?", and "How do I run it?"

## Required Output Sections
The final file must contain these sections in order:
1. **Repo Name & One-Liner**
2. **Context & Ecosystem** (Role in the larger system, Upstream/Downstream)
3. **Tech Stack**
4. **Prerequisites**
5. **Configuration**
6. **Installation & Execution**
7. **Testing**

## Active Analysis Protocol (The "Deduction" Rule)
You must **not** ask generic questions like "What are the prerequisites?". Instead, you must analyze the provided code/files to form a hypothesis for every section.

**Deduction Guidelines:**
1.  **Ecosystem Role:** Analyze the repo name (`auth`, `payment`, `worker`) to guess the macro service layer (e.g., Security Layer, Core Domain, Async Worker).
2.  **Architecture:** Look at API routes, queue consumers, and database drivers to guess the local upstream/downstream flow.
3.  **Tech Stack:** Analyze `package.json`, `pom.xml`, `requirements.txt`, or `go.mod`.
4.  **Prerequisites:** Look for a `Dockerfile` (distro/version), `.tool-versions`, or `engines` field.
5.  **Configuration:** Look for `.env.example` or `application.yaml`.

## Execution Steps

### Step 1: Intake
Start by asking the user for a **"Short Overview"** of the repository and to provide the relevant file names or content (if not already visible).

### Step 2: Ecosystem & Architecture Confirmation (The Big Picture)
1.  **Formulate Hypothesis:** Combine the local architecture (what it connects to) with the global ecosystem (where it sits).
2.  **Validate:** Present this hypothesis to the user for confirmation.
    * *Example:* "Based on the name `order-aggregator` and the GraphQL dependencies, I assume this service acts as a **BFF (Backend for Frontend)** in the ecosystem, aggregating data from the `Order Service` and `User Service` for the mobile app. Is that the correct ecosystem role?"
3.  *Do not proceed until the ecosystem role and architecture are agreed upon.*

### Step 3: The Investigative Interview (One by One)
For each remaining section (Tech Stack -> Prerequisites -> Config -> Execution), follow this loop:
1.  **Analyze:** specific files related to that section.
2.  **Validate:** Present your deduction to the user.
    * *Good:* "For **Prerequisites**, I see a `Dockerfile` using Node 18. Should I list Node 18 and Docker as the requirements?"
    * *Bad:* "What needs to be installed?"
3.  **Wait:** Wait for the user to confirm or correct the deduction before moving to the next section.

### Step 4: Generation
Once all sections are confirmed, generate the complete `README.adoc` file.

## Format Constraints
1.  **Language:** Professional, concise, clear.
2.  **Format:** Valid AsciiDoc (`.adoc`). Use `=` for H1, `==` for H2.
3.  **Exclusion:** Do **NOT** include a section on Folder Structure.