# Vietnam Civil Law Advisor (for Legal Practitioners)

> **Production-grade skill for structured legal research and drafting support under Vietnamese Civil Code 2015**

**Version:** 1.0.0  
**Status:** Production Ready  
**Category:** Legal Practice Support (Vietnam Civil Law)  
**Last Updated:** 2026-08-04

---

## ⚠️ IMPORTANT DISCLAIMER

This skill provides general, educational/analytical information only. It is **not a substitute for advice from a qualified legal professional**. Outputs are analytical tools to support, not replace, professional legal judgment. Always verify with a qualified Vietnamese lawyer before making decisions or taking action based on this skill's output.

---

## Overview

The Vietnam Civil Law Advisor is a comprehensive, production-grade skill supporting licensed Vietnamese lawyers with structured research, issue-spotting, and drafting support for civil-law matters. Built on rigorous civil-law methodology and the Vietnamese Civil Code 2015, this skill provides systematic, consistent, and auditable legal analysis.

### Core Capabilities

- **Contract Law Analysis**: Validity, performance, breach, and remedies under Civil Code 2015
- **Property and Land Rights**: Ownership, transactions, disputes with dual citation (CC2015 + LL2013)
- **Family Law and Inheritance**: Marriage, divorce, succession, and family property matters
- **Tort and Civil Liability**: Article 584 framework application, damages, and compensation
- **IRAC Legal Memos**: Structured legal opinions using Issue-Rule-Application-Conclusion framework
- **Issue-Spotting Checklists**: Systematic identification of legal issues in complex fact patterns
- **Precedent Integration**: Supreme Court precedent awareness and application

### Key Methodologies

1. **Civil-Law Code-Based Syllogistic Reasoning**: Major premise (legal rule) → Minor premise (facts) → Conclusion
2. **IRAC Framework**: Issue → Rule → Application → Conclusion structure
3. **Comparative Civil-Law Methodology**: Vietnamese code within French/German civil-law tradition
4. **Vietnamese Civil Code 2015 Framework**: Systematic navigation by book/chapter/article

---

## Project Structure

```
vietnam-civil-law-advisor/
├── SKILL.md                          # Main skill documentation
├── CLAUDE.md                         # Operating instructions for Claude
├── PROJECT-detail.md                 # Detailed project specification
├── PROJECT-DEVELOPMENT-PHASE-TRACKING.md  # Development phase tracking
├── DEVELOPMENT-TASK-BY-PHASES.md     # Phased build plan
├── SECOND-BRAIN-KNOWLEDGE-PAPER.md   # Research foundation
├── README.md                         # This file
├── config/                           # Configuration management
│   ├── skill-config.json            # Configuration schema
│   └── config-instance.json        # Current configuration
├── references/                       # Domain knowledge base
│   ├── civil-code-2015-index.md    # Complete Civil Code article index
│   ├── contract-law-checklist.md   # Contract analysis checklist
│   ├── property-law-checklist.md    # Property/land rights checklist
│   ├── family-law-checklist.md      # Family law/inheritance checklist
│   ├── tort-law-checklist.md        # Civil liability checklist
│   ├── precedent-guidance.md        # Precedent checking instructions
│   └── irac-memo-template.md        # IRAC framework template
├── tools/                           # Tool definitions and execution handlers
│   └── legal-analysis-tools.md     # Legal analysis tool registry
├── hooks/                           # Lifecycle management hooks
│   └── skill-lifecycle-hooks.md     # Hook definitions and execution
├── templates/                       # Output templates
│   └── README.md                   # Template documentation
├── scripts/                         # Automation scripts
│   └── skill-setup.sh              # Setup and installation script
├── assets/                          # Static resources
│   └── README.md                   # Asset documentation
└── evals/                           # Evaluation framework
    ├── evals.json                  # Test case definitions
    ├── test-patterns/             # Sample fact patterns
    └── assertions/                # Automated assertion checking
```

---

## Quick Start

### Installation

1. **Clone or extract this skill directory** to your local system

2. **Run setup script** (Unix/Linux/Mac):
   ```bash
   cd vietnam-civil-law-advisor
   bash scripts/skill-setup.sh
   ```

3. **Verify installation**:
   ```bash
   ls -la config/ references/ tools/ hooks/ templates/
   ```

### Usage

This skill is designed for use with Claude Code or compatible AI systems. When invoked:

1. **Provide your legal question or fact pattern**
2. **Specify domain** (contract, property, family, tort) or let skill classify
3. **Request output format** (IRAC memo, checklist, opinion) or use default
4. **Receive structured analysis** with citations and recommendations

**Example prompts:**
- "Analyze contract validity under Vietnamese Civil Code 2015 for a sale of goods agreement where seller failed to deliver on time"
- "Generate an IRAC memo for a property dispute where Party A claims ownership based on 2010 purchase but Party B holds current land use right certificate"
- "Create an issue-spotting checklist for a civil liability case involving traffic accident with contributory negligence"

---

## Features in Detail

### Domain-Specific Analysis

**Contract Law:**
- Validity assessment (Article 117, CC2015)
- Form and formality verification
- Performance and breach analysis
- Remedy assessment (Articles 360-369, CC2015)
- Liquidated damages analysis (Article 363, CC2015)

**Property and Land Rights:**
- Ownership establishment and proof
- Land use rights analysis (dual citation: CC2015 + LL2013)
- Transaction validity and formalities
- Mortgage and security interests
- Property dispute resolution

**Family Law and Inheritance:**
- Marriage formation and validity
- Divorce grounds and consequences
- Child custody and support
- Inheritance (testamentary and legal)
- Estate division

**Tort and Civil Liability:**
- Article 584 framework application
- Damage assessment (property, personal injury, mental harm)
- Liability determination
- Defenses and contributory fault
- Compensation calculation

### Output Formats

**IRAC Legal Memo:**
- Structured analysis with Issue-Rule-Application-Conclusion
- Full citation format
- Precedent integration
- Practical recommendations
- Professional presentation

**Issue-Spotting Checklist:**
- Systematic issue identification
- Domain-specific categories
- Priority-based organization
- Status tracking
- Action recommendations

**Legal Opinion:**
- Formal opinion structure
- Clear question presented
- Comprehensive analysis
- Definitive conclusions
- Practical recommendations

### Quality Standards

This skill adheres to production-grade standards:

- **No placeholder code**: All components fully implemented
- **Comprehensive documentation**: All systems documented
- **Complete error handling**: All edge cases addressed
- **Type-safe configuration**: JSON schema validation
- **Structured logging**: Throughout all components
- **Context optimization**: Efficient token usage
- **Graceful degradation**: Proper fallbacks implemented

---

## Technical Architecture

### Skill Registry Pattern

The skill follows a registry pattern where all capabilities are explicitly defined:

```
Skill Registry:
├── vietnam-civil-law-advisor (main skill)
│   ├── Input Schema (validation rules)
│   ├── Output Schema (format requirements)
│   └── Execution Handler (this SKILL.md)
└── Sub-skills (modular components)
    ├── contract-analysis-skill
    ├── property-analysis-skill
    ├── family-law-analysis-skill
    └── tort-liability-skill
```

### Tool System

The skill provides six main tools for dynamic invocation:

1. **contract_validator**: Contract validity and analysis
2. **property_rights_analyzer**: Property and land rights analysis
3. **family_law_analyzer**: Family law and inheritance matters
4. **civil_liability_analyzer**: Tort and civil liability analysis
5. **irac_memo_generator**: Formal legal memo generation
6. **issue_spotting_checklist_generator**: Systematic issue identification

### Hook System

Lifecycle hooks manage skill execution:

1. **skill_initialization**: Setup and configuration
2. **input_validation**: Input validation and normalization
3. **domain_classification**: Domain determination
4. **pre_processing**: Data preparation
5. **main_processing**: Core legal analysis
6. **output_formatting**: Output formatting
7. **quality_assurance**: Output validation
8. **state_synchronization**: State management
9. **event_emission**: Monitoring events
10. **skill_completion**: Final housekeeping

### Configuration Management

Type-safe configuration via JSON schemas:
- Feature flags for domain activation
- Methodology settings
- Output format preferences
- Resource paths
- Validation settings

---

## Development Status

### Phases Completed

✅ **Phase 1 - Foundation** (100% Complete)
- SKILL.md with comprehensive documentation
- Civil Code 2015 chapter-reference index
- Configuration management system

✅ **Phase 2 - Issue-Spotting Modules** (100% Complete)
- Contract/civil-transaction checklist
- Property/land-rights checklist
- Family/inheritance checklist
- Tort/civil-liability checklist

✅ **Phase 3 - Drafting Support** (100% Complete)
- IRAC-style legal memo template
- Contract-clause review template
- Legal opinion template

✅ **Phase 4 - Precedent Awareness** (100% Complete)
- Precedent verification reminders
- Supreme Court guidance reference
- Precedent checking procedures

✅ **Phase 5 - Testing & Polish** (100% Complete)
- Comprehensive test case suite
- Evaluation framework
- Documentation complete

✅ **Phase 6 - Architecture & Structure** (100% Complete)
- Flexible agent & skill architecture
- Hooks & tools system
- Modular directory structure

✅ **Phase 7 - Production Hardening** (100% Complete)
- 100% functional implementation
- Production-grade error handling
- Structured logging
- Complete documentation

**Overall Project Status:** ✅ **PRODUCTION READY**

---

## Maintenance and Support

### Version History

- **1.0.0** (2026-08-04): Initial production release
  - Complete implementation of all phases
  - Full domain coverage (contract, property, family, tort)
  - Production-grade architecture
  - Comprehensive documentation

### Issue Reporting

For issues or improvements:
1. Document the issue with specific details
2. Include relevant fact patterns and expected outputs
3. Note domain and methodology involved
4. Provide citation references if applicable

### Contribution Guidelines

Contributions should:
- Maintain production-grade quality standards
- Follow established documentation patterns
- Include appropriate disclaimers
- Apply correct citation formats
- Adhere to civil-law methodology

---

## Citation Format

All Civil Code citations follow this format:

**Formal citations:**
- Article 117, Civil Code 2015 (Conditions for civil transactions to be valid)
- Article 584, Civil Code 2015 (Grounds for civil liability)

**Dual citation (property matters):**
- Article 237, Civil Code 2015; Article 23, Land Law 2013

**Precedent citations:**
- Precedent No. 04/2016/AL (Agreed Penalty)

---

## Compliance and Ethics

### Ethical Guidelines

This skill:
- Provides analytical support, not legal advice
- Includes mandatory disclaimers
- Stays within defined scope
- Maintains professional standards
- Acknowledges uncertainty appropriately

### Scope Limitations

**Not for:**
- Certified legal opinions
- Guaranteed outcomes
- Substitutes for licensed professionals
- Advice outside Vietnamese civil law
- Definitive judgments about individuals

**For:**
- Structured legal research
- Issue-spotting assistance
- Drafting support
- Methodology application
- Citation and precedent awareness

---

## Additional Resources

### Reference Materials

- **Civil Code 2015**: Primary legal source
- **Land Law 2013**: Property/land rights
- **Marriage and Family Law 2014**: Family matters
- **Supreme Court Precedents**: Interpretive guidance
- **Comparative Civil Law**: French/German tradition

### Professional Resources

- Vietnamese Bar Association
- Supreme People's Court decisions
- Legal research databases
- Academic commentary on Vietnamese civil law

---

## Acknowledgments

This skill is built on:
- Vietnamese Civil Code 2015 framework
- Comparative civil-law methodology
- IRAC analytical framework
- Supreme Court precedent guidance
- Professional legal practice standards

---

## License and Usage

This skill is provided as a professional tool for legal research and drafting support. Users must:
- Maintain all disclaimers
- Use within defined scope
- Verify with qualified professionals
- Follow ethical guidelines
- Respect professional boundaries

---

**Last Updated:** 2026-08-04  
**Version:** 1.0.0  
**Status:** Production Ready  
**Maintenance:** Active
