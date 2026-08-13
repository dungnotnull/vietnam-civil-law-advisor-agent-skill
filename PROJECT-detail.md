# PROJECT-detail.md — Vietnam Civil Law Advisor (for Legal Practitioners)

## 1. Problem Statement

A skill supporting licensed Vietnamese lawyers with structured research, issue-spotting, and drafting support for civil-law matters (contracts, property, family, inheritance, torts) under the Vietnamese Civil Code 2015, grounded in comparative civil-law methodology. Not a substitute for licensed legal advice or filings.

## 2. Target Users

Describe the primary user personas for this skill (fill in based on real usage once built): e.g., students, professionals, hobbyists, or practitioners in the relevant domain.

## 3. Functional Specification

### 3.1 Core Capabilities

- Structure issue-spotting checklists aligned to Vietnamese Civil Code 2015 chapters
- Support contract-drafting review (validity conditions, civil transaction requirements)
- Support property/land-rights issue analysis (Land Law interplay with Civil Code)
- Support family/inheritance-law issue analysis (marriage, divorce, succession)
- Support tort/civil-liability issue analysis (Article 584 general liability framework)
- Draft structured legal-memo templates citing relevant Civil Code articles
- Flag where court precedent or Supreme People's Court guidance should be checked

### 3.2 Key Methodologies & Frameworks Applied

- **Civil-law (continental) legal-method: code-based syllogistic reasoning**
- **IRAC (Issue-Rule-Application-Conclusion) legal-memo structure**
- **Comparative civil-law methodology (French/German civil-code lineage relevant to Vietnam's civil code history)**
- **Vietnamese Civil Code 2015 structural framework**

Each framework above should be operationalized as a concrete step, checklist, or template inside the skill's SKILL.md and reference files once this scaffold is turned into a runnable skill (see `DEVELOPMENT-TASK-BY-PHASES.md`).

### 3.3 Expected Input

Typical user requests this skill should handle (fill in with real example prompts during development and testing).

### 3.4 Expected Output Format

Define the structured output format(s) this skill should produce (e.g., structured report, checklist, scored recommendation, memo). Align with the methodologies above so outputs are consistent and auditable.

## 4. Out of Scope / Guardrails

- Always include the standing disclaimer for this domain (see CLAUDE.md).
- Never present output as a certified/professional determination (e.g., not a diagnosis, not a legal opinion, not a guaranteed forecast).
- Where the skill involves a named third party (e.g., a partner, a suspect, a specific person), do not produce a definitive judgment about that individual — stay at the level of general, population-based information and structured reasoning support.
- Flag explicitly when a licensed professional (doctor, lawyer, engineer, certified analyst, etc.) should be consulted.

## 5. Knowledge Base Dependency

This skill's reasoning quality depends on the research foundations catalogued in `SECOND-BRAIN-KNOWLEDGE-PAPER.md`. When building the actual skill (SKILL.md + references/), extract the operational principles from each paper into concrete reference files rather than leaving them as a flat reading list.

## 6. Success Criteria

- Output correctly applies the named methodologies rather than generic reasoning.
- Output is well-structured and consistent across repeated runs on similar inputs.
- Domain-appropriate guardrails/disclaimers are respected in every response.
- Test prompts (see `DEVELOPMENT-TASK-BY-PHASES.md`, Phase 5) produce outputs a subject-matter-competent reviewer would rate as sound.
