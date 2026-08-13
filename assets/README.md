# Assets Directory

This directory contains static assets for the Vietnam Civil Law Advisor skill. Assets are used to enhance output formatting, provide visual aids, and support quick reference materials.

## Asset Organization

```
assets/
├── README.md (this file)
├── images/           # Diagrams, flowcharts, illustrations
├── documents/        # Reference materials in document format
├── data/            # Static data files for lookup tables
└── styles/          # Formatting and styling resources
```

## Asset Types and Usage

### Images (`images/`)

**Purpose:** Visual aids and illustrative materials

**Asset Types:**
- **Flowcharts**: Legal process diagrams (IRAC flow, analysis workflows)
- **Structures**: Code structure diagrams (Civil Code organization)
- **Illustrations**: Conceptual diagrams (property rights, liability frameworks)
- **Icons**: Visual indicators for output formatting

**Usage in Skill:**
- Enhanced memo formatting
- Visual explanations in analysis
- Process visualization
- Reference material illustration

**File Format:** PNG, SVG preferred for compatibility

### Documents (`documents/`)

**Purpose:** Reference materials in alternative formats

**Asset Types:**
- **PDF versions**: Printable reference materials
- **Quick reference guides**: Condensed checklists
- **Citation guides**: Quick citation format references
- **Methodology guides**: Framework application guides

**Usage in Skill:**
- User reference materials
- Printable analysis guides
- Quick lookup documents
- Training materials

**File Format:** PDF for portability, Markdown for editable versions

### Data (`data/`)

**Purpose:** Static lookup tables and reference data

**Asset Types:**
- **Article tables**: Cross-references between code articles
- **Citation mappings**: Standard citation formats
- **Domain mappings**: Legal domain classification data
- **Precedent tables**: Case citation and summary tables

**Usage in Skill:**
- Quick lookup during analysis
- Citation formatting
- Domain classification
- Precedent reference

**File Format:** JSON, CSV for structured data

### Styles (`styles/`)

**Purpose:** Output formatting and styling resources

**Asset Types:**
- **Markdown templates**: Output formatting templates
- **Citation styles**: Standard citation format definitions
- **Section structures**: Standard section organization
- **Formatting rules**: Style guidelines and conventions

**Usage in Skill:**
- Consistent output formatting
- Standardized citation styles
- Professional presentation
- Style compliance

**File Format:** Markdown, JSON for style definitions

## Asset Management

### Adding New Assets

**When Adding Assets:**

1. **Choose appropriate subdirectory** based on asset type
2. **Use clear, descriptive filenames** that indicate content
3. **Document asset purpose** in this README
4. **Optimize file size** for efficient loading
5. **Ensure compatibility** with skill output formats

**Asset Naming Convention:**
```
[asset-type]-[description]-[version].extension
Examples:
- flowchart-irac-framework-v1.0.svg
- citation-guide-quick-reference-v1.0.pdf
- data-article-mapping-v1.0.json
- style-memo-format-v1.0.md
```

### Asset Documentation

**Each asset file should:**
- Have clear, descriptive filename
- Include internal documentation if appropriate
- Be referenced in this README
- Have version information
- Include usage notes if needed

### Asset Versioning

**Asset Version Control:**
- Include version in filename for major changes
- Document changes in this README
- Maintain backward compatibility when possible
- Tag breaking changes clearly

## Current Assets

### Version 1.0.0 Assets (2026-08-04)

**Status:** Asset library structure established. Assets are added as needed for skill enhancement.

**Planned Assets:**
- IRAC flowchart diagram
- Civil Code structure diagram
- Quick reference citation guide
- Article cross-reference table
- Output formatting templates

## Asset Usage Guidelines

### In Skill Outputs

**When Including Assets in Outputs:**

1. **Assess relevance**: Ensure asset adds value to analysis
2. **Check compatibility**: Verify output format supports asset
3. **Optimize size**: Ensure asset doesn't exceed size limits
4. **Provide context**: Explain asset purpose in analysis
5. **Maintain quality**: Ensure professional presentation

### Asset Selection Criteria

**Include asset when:**
- Enhances understanding of legal concepts
- Provides visual clarification
- Supports methodology application
- Aids in quick reference
- Improves output professionalism

**Do not include asset when:**
- Redundant with text explanation
- Too large for output format
- Not relevant to specific analysis
- Low quality or outdated
- Distracts from main analysis

## Asset Quality Standards

### Visual Quality

- **Resolution**: Suitable for viewing and printing
- **Clarity**: Clear, readable text and graphics
- **Professionalism**: Professional appearance and design
- **Consistency**: Consistent style across assets

### Content Quality

- **Accuracy**: Legally accurate and current
- **Completeness**: Includes all relevant information
- **Clarity**: Clear and understandable
- **Authority**: Based on authoritative sources

### Technical Quality

- **Format**: Appropriate file format for use case
- **Size**: Optimized for efficient loading
- **Compatibility**: Compatible with skill output formats
- **Stability**: Reliable and error-free

## Asset Maintenance

### Regular Updates

- **Review periodically**: Ensure assets remain current
- **Update for legal changes**: Modify when laws change
- **Improve based on feedback**: Enhance based on user feedback
- **Version control**: Track changes and versions

### Deprecation

- **Mark deprecated assets**: Clearly label outdated assets
- **Provide alternatives**: Suggest replacement assets
- **Document reasons**: Explain why asset was deprecated
- **Remove safely**: Remove deprecated assets after transition period

## Asset Permissions and Copyright

### Asset Usage Rights

**Assets created for this skill:**
- May be used for skill operation
- May be included in skill outputs
- May be modified for improvement
- Should credit the skill when used externally

**External assets:**
- Must respect copyright and licenses
- Must provide attribution if required
- Must verify usage rights before inclusion
- Must document source and license

## Asset Development Roadmap

### Planned Assets (Priority Order)

1. **IRAC Framework Flowchart** (High Priority)
   - Visual representation of IRAC process
   - Integration with memo template
   - Usage in training materials

2. **Civil Code Structure Diagram** (High Priority)
   - Organization by books/chapters
   - Article cross-references
   - Navigation aid

3. **Quick Reference Citation Guide** (Medium Priority)
   - Standard citation formats
   - Examples for each domain
   - Common mistakes to avoid

4. **Article Cross-Reference Table** (Medium Priority)
   - Related articles
   - Domain groupings
   - Practical application notes

5. **Output Formatting Templates** (Low Priority)
   - Style definitions
   - Section structures
   - Formatting rules

This asset library will continue to grow as the skill evolves and user needs are identified.
