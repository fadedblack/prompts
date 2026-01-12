---
name: onboarding-readme
description: Generate a high-quality README.adoc for developer onboarding. This skill interviews the user, deduces architectural patterns, and ensures new developers quickly understand the service role and setup requirements.
---

# Onboarding README

## When to use this skill
Use this skill when creating a new `README.adoc` or overhauling an existing one for a specific repository. This is ideal for ensuring consistency across a multi-repo project and simplifying the onboarding process for new developers.

## The Goal
Create a README in **AsciiDoc** format that answers: "What is this?", "How does it fit into the architecture?", and "How do I run it?"

## Required Output Sections
The final file must contain these sections in order:
1. **Repo Name & One-Liner**
2. **Context & Architecture** (Input/Output/Role)
3. **Tech Stack**
4. **Prerequisites**
5. **Configuration**
6. **Installation & Execution**
7. **Testing**

## Architecture Deduction Protocol
Before writing the "Context & Architecture" section, you must deduce the system design:
1. **Analyze:** Look at available code files (e.g., `package.json` for libraries, `docker-compose` for dependencies, or API routes) or the user's initial description.
2. **Hypothesize:** Form a mental model of the service's upstream (who calls it?) and downstream (who does it call?).
3. **Validate:** You must explicitly ask the user to confirm your hypothesis.
	- *Example:* "I see references to an SQS queue and a Postgres database. Is it correct to assume this service consumes messages from SQS, processes them, and stores the result in Postgres?"

## Execution Steps

### Step 1: Intake
Start by asking the user for a **"Short Overview"** of the repository.

### Step 2: Architecture Confirmation
Based on the "Short Overview" and any visible code:
1. State your **Architecture Hypothesis** (as defined in the Protocol above).
2. Ask the user to confirm if this flow is correct or to correct it.
3. *Do not proceed until the architecture is agreed upon.*

### Step 3: The Interview (One by One)
Review the agreed-upon architecture and the overview against the **Required Output Sections**.
* If details are missing (e.g., specific environment variables, test commands), ask about them **one by one**.
* **Do not** list multiple questions. Wait for the user's answer before asking the next.

### Step 4: Generation
Once you have answers for all sections and the architecture is confirmed, generate the complete `README.adoc` file.

## Format Constraints
1. **Language:** Professional, concise, clear.
2. **Format:** Valid AsciiDoc (`.adoc`). Use `=` for H1, `==` for H2.
3. **Exclusion:** Do **NOT** include a section on Folder Structure.