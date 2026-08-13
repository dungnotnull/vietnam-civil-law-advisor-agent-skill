# Templates Directory

This directory contains output templates for the Vietnam Civil Law Advisor skill. Templates ensure consistent, structured outputs that adhere to legal methodology and citation standards.

## Available Templates

### 1. IRAC Memo Template (`irac-memo-template.md`)

**Purpose:** Generate formal legal memos using the IRAC (Issue-Rule-Application-Conclusion) framework

**When Used:**
- Client advice memoranda
- Formal legal opinions
- Case analysis documents
- Legal research summaries

**Structure:**
- Executive Summary
- Disclaimer (mandatory)
- Issue Statement
- Rule Section (Civil Code articles + precedent)
- Application Section (systematic fact analysis)
- Conclusion (answer to legal question)
- Recommendations (practical next steps)
- Precedent Considerations
- Footnotes (citations)

**Methodology Applied:**
- Code-based syllogistic reasoning
- IRAC framework
- Civil-law methodology
- Comparative analysis when applicable

### 2. Issue-Spotting Checklist Template (`checklist-template.md`)

**Purpose:** Generate comprehensive issue-spotting checklists for systematic legal analysis

**When Used:**
- Complex fact pattern analysis
- Due diligence investigations
- Risk assessment reviews
- Comprehensive case evaluation

**Structure:**
- Fact Pattern Analysis
- Issue Identification Checklist (by category)
- Priority Issues Identification
- Recommended Actions
- Precedent Considerations
- Disclaimer

**Methodology Applied:**
- Systematic issue identification
- Domain-specific checklists
- Risk-based prioritization
- Legal requirement verification

### 3. Legal Opinion Template (`legal-opinion-template.md`)

**Purpose:** Generate formal legal opinion documents

**When Used:**
- Formal legal opinions for clients
- Regulatory compliance opinions
- Transaction opinions
- Legal position statements

**Structure:**
- Opinion Header
- Executive Summary
- Disclaimer (mandatory)
- Question Presented
- Applicable Law
- Analysis (IRAC framework)
- Conclusion
- Recommendations
- Precedent Considerations
- Signature Block

**Methodology Applied:**
- Formal opinion structure
- IRAC framework
- Comprehensive legal analysis
- Clear conclusions with reasoning

### 4. Contract Review Template (`contract-review-template.md`)

**Purpose:** Generate structured contract review and analysis

**When Used:**
- Contract due diligence
- Contract negotiation support
- Contract validity analysis
- Contract risk assessment

**Structure:**
- Contract Overview
- Validity Assessment
- Performance Analysis
- Breach and Remedies Assessment
- Risk Identification
- Recommendations
- Precedent Considerations
- Disclaimer

**Methodology Applied:**
- Contract law checklist application
- Systematic clause analysis
- Risk identification
- Practical recommendations

### 5. Property Analysis Template (`property-analysis-template.md`)

**Purpose:** Generate property and land rights analysis

**When Used:**
- Ownership verification
- Property transaction analysis
- Property dispute resolution
- Land use rights assessment

**Structure:**
- Property Overview
- Ownership Analysis
- Land Use Rights Analysis (if applicable)
- Transaction Analysis (if applicable)
- Dispute Analysis (if applicable)
- Recommendations
- Precedent Considerations
- Disclaimer

**Methodology Applied:**
- Dual citation (CC2015 + LL2013)
- Property law checklist application
- Transaction validity analysis
- Dispute resolution assessment

## Template Usage Guidelines

### Selecting the Appropriate Template

**For Legal Analysis:**
- Use IRAC Memo Template for comprehensive legal analysis
- Use Legal Opinion Template for formal opinions
- Use Issue-Spotting Checklist for systematic issue identification

**For Specific Domains:**
- Use Contract Review Template for contract matters
- Use Property Analysis Template for property/land matters
- Use Family Law Template for family matters
- Use Tort Liability Template for civil liability matters

### Template Customization

**Customization Rules:**
1. **Maintain Structure**: Keep overall template structure intact
2. **Preserve Disclaimers**: Never remove or modify mandatory disclaimers
3. **Citation Standards**: Maintain proper citation format
4. **Methodology Application**: Apply designated methodology consistently
5. **Content Adaptation**: Adapt content depth for specific use cases

**Allowed Modifications:**
- Add specific sections for specialized use cases
- Adjust detail level for audience
- Include additional precedent as relevant
- Customize recommendations for specific context
- Add factual summaries as needed

**Prohibited Modifications:**
- Remove disclaimer sections
- Change fundamental structure
- Modify citation format
- Skip methodology application
- Remove mandatory sections

## Template Quality Standards

### Completeness Checklist

Every template output must include:
- [ ] All required sections filled
- [ ] Mandatory disclaimer included
- [ ] Proper citations with article numbers
- [ ] Methodology explicitly applied
- [ ] Clear conclusions supported by analysis
- [ ] Practical recommendations provided
- [ ] Precedent considerations addressed

### Quality Metrics

**Content Quality:**
- Legal analysis accuracy
- Citation completeness
- Methodology application
- Reasoning soundness
- Conclusion clarity

**Format Quality:**
- Structure adherence
- Citation format consistency
- Disclaimer placement
- Section completeness
- Professional presentation

## Template Maintenance

### Version Control

- Templates are version-controlled
- Changes documented in changelog
- Breaking changes clearly marked
- Backward compatibility maintained when possible

### Update Process

1. Identify need for template update
2. Document rationale for change
3. Implement update with testing
4. Update version number
5. Document changes in changelog

### Template Testing

Templates are tested with:
- Sample fact patterns
- Edge case scenarios
- Different legal domains
- Various complexity levels

## Template Reference Materials

Templates integrate with reference materials:

**Primary References:**
- `references/civil-code-2015-index.md` - Article citations
- `references/precedent-guidance.md` - Precedent integration
- Domain-specific checklists - Issue identification

**Supporting References:**
- `config/config-instance.json` - Configuration parameters
- `tools/legal-analysis-tools.md` - Tool integration
- `hooks/skill-lifecycle-hooks.md` - Output formatting

## Template Error Handling

### Missing Template Elements

**If template element is missing:**
1. Log error for missing element
2. Use default structure if available
3. Notify user of limitation
4. Continue with available elements
5. Flag output as partial

### Template Validation Failures

**If template validation fails:**
1. Identify validation error
2. Attempt to correct if safe
3. Fall back to simpler template if available
4. Document validation failure
5. Notify user of issue

## Template Performance

### Rendering Performance

Templates are optimized for:
- Fast rendering (< 2 seconds standard)
- Efficient token usage
- Clear output structure
- Minimal processing overhead

### Scalability

Template system supports:
- Multiple concurrent uses
- Large document generation
- Complex analysis scenarios
- Customization requests

## Template Documentation

Each template file includes:
- Purpose and usage
- Structure description
- Methodology applied
- Integration points
- Quality standards
- Customization guidelines

This template system ensures consistent, high-quality legal outputs that adhere to Vietnamese civil-law methodology and professional standards.
