# Legal Analysis Tools

Tool definitions and execution handlers for the Vietnam Civil Law Advisor skill. These tools can be dynamically invoked by agents to perform specific legal analysis tasks.

## Tool Registry Pattern

All tools follow this structure:
```json
{
  "tool_name": "name",
  "description": "When to invoke this tool",
  "input_schema": {JSON schema for input},
  "output_schema": {JSON schema for output},
  "execution_handler": "reference to execution logic"
}
```

## Tool 1: Contract Validator

**Tool Name:** `contract_validator`

**Description:** Invoke this tool when the user needs to validate contract validity, check contract form requirements, or identify potential contract issues under Vietnamese Civil Code 2015. Use for any contract analysis, validity checks, or contract review tasks.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "contract_type": {
      "type": "string",
      "enum": ["sale_purchase", "lease", "loan", "service", "gift", "construction", "insurance", "agency", "other"],
      "description": "Type of contract"
    },
    "parties": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "name": {"type": "string"},
          "type": {"type": "string", "enum": ["individual", "legal_entity", "foreign_entity"]},
          "capacity_indicators": {"type": "array", "items": {"type": "string"}}
        }
      }
    },
    "contract_terms": {
      "type": "object",
      "properties": {
        "written_form": {"type": "boolean"},
        "notarized": {"type": "boolean"},
        "registered": {"type": "boolean"},
        "essential_terms": {"type": "array", "items": {"type": "string"}},
        "special_clauses": {"type": "array", "items": {"type": "string"}}
      }
    },
    "analysis_focus": {
      "type": "array",
      "items": {"type": "string", "enum": ["validity", "performance", "breach", "remedies", "special_terms"]},
      "description": "Specific aspects to analyze"
    }
  },
  "required": ["contract_type", "parties", "contract_terms"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "validity_assessment": {
      "type": "object",
      "properties": {
        "is_valid": {"type": "boolean"},
        "issues_found": {"type": "array", "items": {"type": "string"}},
        "recommendations": {"type": "array", "items": {"type": "string"}}
      }
    },
    "performance_analysis": {
      "type": "object",
      "properties": {
        "obligations_summary": {"type": "array", "items": {"type": "string"}},
        "potential_issues": {"type": "array", "items": {"type": "string"}},
        "risk_assessment": {"type": "string"}
      }
    },
    "breach_consequences": {
      "type": "object",
      "properties": {
        "remedies_available": {"type": "array", "items": {"type": "string"}},
        "damage_assessment": {"type": "string"},
        "enforcement_considerations": {"type": "array", "items": {"type": "string"}}
      }
    },
    "citations": {
      "type": "array",
      "items": {"type": "object"},
      "properties": {
        "article": {"type": "string"},
        "title": {"type": "string"},
        "relevance": {"type": "string"}
      }
    }
  }
}
```

**Execution Handler:** Consult `references/contract-law-checklist.md` and apply IRAC methodology to each identified issue. Return structured output following the output schema.

## Tool 2: Property Rights Analyzer

**Tool Name:** `property_rights_analyzer`

**Description:** Invoke this tool when the user needs to analyze property ownership, land use rights, property transfers, or property disputes. Use for any property law matters including ownership verification, transfer analysis, or dispute resolution.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "property_type": {
      "type": "string",
      "enum": ["immovable", "movable", "land_use_rights", "business_assets", "other"],
      "description": "Type of property"
    },
    "ownership_claim": {
      "type": "object",
      "properties": {
        "current_owner": {"type": "string"},
        "ownership_basis": {"type": "string"},
        "documentation": {"type": "array", "items": {"type": "string"}},
        "registration_status": {"type": "string"}
      }
    },
    "transaction_details": {
      "type": "object",
      "properties": {
        "transaction_type": {"type": "string", "enum": ["transfer", "lease", "mortgage", "gift", "other"]},
        "parties_involved": {"type": "array", "items": {"type": "string"}},
        "consideration": {"type": "string"},
        "formalities_completed": {"type": "array", "items": {"type": "string"}}
      }
    },
    "dispute_elements": {
      "type": "object",
      "properties": {
        "has_dispute": {"type": "boolean"},
        "dispute_type": {"type": "string"},
        "parties_in_dispute": {"type": "array", "items": {"type": "string"}},
        "relief_sought": {"type": "array", "items": {"type": "string"}}
      }
    },
    "foreign_considerations": {
      "type": "object",
      "properties": {
        "involves_foreign_party": {"type": "boolean"},
        "foreign_entity_type": {"type": "string"},
        "investment_registration": {"type": "string"}
      }
    }
  },
  "required": ["property_type", "ownership_claim"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "ownership_analysis": {
      "type": "object",
      "properties": {
        "ownership_valid": {"type": "boolean"},
        "ownership_basis_assessment": {"type": "string"},
        "documentation_sufficiency": {"type": "array", "items": {"type": "string"}},
        "recommendations": {"type": "array", "items": {"type": "string"}}
      }
    },
    "transaction_analysis": {
      "type": "object",
      "properties": {
        "transaction_validity": {"type": "boolean"},
        "required_formalities": {"type": "array", "items": {"type": "string"}},
        "missing_requirements": {"type": "array", "items": {"type": "string"}},
        "risk_assessment": {"type": "string"}
      }
    },
    "dispute_resolution_analysis": {
      "type": "object",
      "properties": {
        "available_forums": {"type": "array", "items": {"type": "string"}},
        "standing_assessment": {"type": "array", "items": {"type": "string"}},
        "likely_remedies": {"type": "array", "items": {"type": "string"}},
        "procedural_requirements": {"type": "array", "items": {"type": "string"}}
      }
    },
    "citations": {
      "type": "array",
      "items": {"type": "object"},
      "properties": {
        "source": {"type": "string", "enum": ["CC2015", "LL2013"]},
        "article": {"type": "string"},
        "title": {"type": "string"},
        "relevance": {"type": "string"}
      }
    }
  }
}
```

**Execution Handler:** Consult `references/property-law-checklist.md` and apply dual citation format (CC2015 + LL2013). Return structured output following the output schema.

## Tool 3: Family Law Analyzer

**Tool Name:** `family_law_analyzer`

**Description:** Invoke this tool when the user needs to analyze marriage, divorce, child custody, adoption, inheritance, or family property matters. Use for any family law issues including divorce consequences, inheritance disputes, or family property division.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "matter_type": {
      "type": "string",
      "enum": ["marriage_formation", "divorce", "child_custody", "adoption", "inheritance", "family_property", "other"],
      "description": "Type of family law matter"
    },
    "parties_involved": {
      "type": "array",
      "items": {"type": "object"},
      "properties": {
        "role": {"type": "string"},
        "capacity": {"type": "string"},
        "specific_circumstances": {"type": "array", "items": {"type": "string"}}
      }
    },
    "children_considerations": {
      "type": "object",
      "properties": {
        "children_involved": {"type": "boolean"},
        "number_of_children": {"type": "number"},
        "ages": {"type": "array", "items": {"type": "number"}},
        "special_circumstances": {"type": "array", "items": {"type": "string"}}
      }
    },
    "property_considerations": {
      "type": "object",
      "properties": {
        "property_involved": {"type": "boolean"},
        "property_type": {"type": "array", "items": {"type": "string"}},
        "property_regime": {"type": "string"},
        "division_requested": {"type": "boolean"}
      }
    },
    "inheritance_considerations": {
      "type": "object",
      "properties": {
        "deceased_estate": {"type": "boolean"},
        "will_exists": {"type": "boolean"},
        "heirs_identified": {"type": "array", "items": {"type": "string"}},
        "estate_value": {"type": "string"}
      }
    }
  },
  "required": ["matter_type", "parties_involved"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "legal_analysis": {
      "type": "object",
      "properties": {
        "applicable_law": {"type": "array", "items": {"type": "string"}},
        "legal_framework": {"type": "string"},
        "key_issues_identified": {"type": "array", "items": {"type": "string"}},
        "analysis_summary": {"type": "string"}
      }
    },
    "rights_and_obligations": {
      "type": "object",
      "properties": {
        "party_rights": {"type": "array", "items": {"type": "string"}},
        "party_obligations": {"type": "array", "items": {"type": "string"}},
        "children_rights": {"type": "array", "items": {"type": "string"}},
        "property_rights": {"type": "array", "items": {"type": "string"}}
      }
    },
    "outcomes_assessment": {
      "type": "object",
      "properties": {
        "likely_outcomes": {"type": "array", "items": {"type": "string"}},
        "available_remedies": {"type": "array", "items": {"type": "string"}},
        "procedural_requirements": {"type": "array", "items": {"type": "string"}},
        "timeline_considerations": {"type": "string"}
      }
    },
    "citations": {
      "type": "array",
      "items": {"type": "object"},
      "properties": {
        "source": {"type": "string", "enum": ["CC2015", "MFL2014"]},
        "article": {"type": "string"},
        "title": {"type": "string"},
        "relevance": {"type": "string"}
      }
    }
  }
}
```

**Execution Handler:** Consult `references/family-law-checklist.md` and apply dual citation format (CC2015 + MFL2014). Return structured output following the output schema.

## Tool 4: Civil Liability Analyzer

**Tool Name:** `civil_liability_analyzer`

**Description:** Invoke this tool when the user needs to analyze civil liability, tort claims, damage compensation, or Article 584 matters. Use for any tort or civil liability analysis including liability determination, damage assessment, or compensation calculation.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "liability_context": {
      "type": "string",
      "enum": ["contract_breach", "tort", "strict_liability", "vicarious_liability", "other"],
      "description": "Type of liability context"
    },
    "alleged_wrongful_act": {
      "type": "object",
      "properties": {
        "act_description": {"type": "string"},
        "act_type": {"type": "string", "enum": ["action", "omission"]},
        "alleged_illegality": {"type": "array", "items": {"type": "string"}},
        "fault_type": {"type": "string", "enum": ["intentional", "negligent", "strict"]},
        "perpetrator": {"type": "string"}
      }
    },
    "damage_description": {
      "type": "object",
      "properties": {
        "damage_type": {"type": "array", "items": {"type": "string", "enum": ["property_damage", "personal_injury", "mental_harm", "economic_loss"]}},
        "damage_extent": {"type": "string"},
        "damage_value_estimate": {"type": "string"},
        "damage_documentation": {"type": "array", "items": {"type": "string"}}
      }
    },
    "causation_elements": {
      "type": "object",
      "properties": {
        "direct_causation_claimed": {"type": "boolean"},
        "causation_chain_description": {"type": "string"},
        "intervening_causes": {"type": "array", "items": {"type": "string"}},
        "proximate_cause_arguments": {"type": "array", "items": {"type": "string"}}
      }
    },
    "defenses_available": {
      "type": "object",
      "properties": {
        "force_majeure": {"type": "boolean"},
        "victim_fault": {"type": "boolean"},
        "contributory_negligence": {"type": "boolean"},
        "consent": {"type": "boolean"},
        "other_defenses": {"type": "array", "items": {"type": "string"}}
      }
    }
  },
  "required": ["liability_context", "alleged_wrongful_act", "damage_description"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "article_584_analysis": {
      "type": "object",
      "properties": {
        "illegal_act_element": {"type": "string"},
        "damage_element": {"type": "string"},
        "causation_element": {"type": "string"},
        "fault_element": {"type": "string"},
        "overall_assessment": {"type": "string"}
      }
    },
    "liability_determination": {
      "type": "object",
      "properties": {
        "liability_type": {"type": "string"},
        "liability_likelihood": {"type": "string"},
        "liability_scope": {"type": "string"},
        "potential_modifications": {"type": "array", "items": {"type": "string"}}
      }
    },
    "damage_assessment": {
      "type": "object",
      "properties": {
        "compensable_damage": {"type": "array", "items": {"type": "string"}},
        "damage_calculation_method": {"type": "string"},
        "estimated_compensation": {"type": "string"},
        "compensation_limitations": {"type": "array", "items": {"type": "string"}}
      }
    },
    "defenses_analysis": {
      "type": "object",
      "properties": {
        "available_defenses": {"type": "array", "items": {"type": "string"}},
        "defense_strength": {"type": "array", "items": {"type": "string"}},
        "likely_defense_outcome": {"type": "string"}
      }
    },
    "citations": {
      "type": "array",
      "items": {"type": "object"},
      "properties": {
        "article": {"type": "string"},
        "title": {"type": "string"},
        "relevance": {"type": "string"}
      }
    }
  }
}
```

**Execution Handler:** Consult `references/tort-law-checklist.md` and apply Article 584 framework systematically. Return structured output following the output schema.

## Tool 5: IRAC Memo Generator

**Tool Name:** `irac_memo_generator`

**Description:** Invoke this tool when the user needs to generate a formal legal memo using IRAC methodology. Use for creating structured legal opinion documents for any civil law matter.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "memo_details": {
      "type": "object",
      "properties": {
        "recipient": {"type": "string"},
        "sender": {"type": "string"},
        "subject": {"type": "string"},
        "reference_matter": {"type": "string"}
      }
    },
    "legal_issue": {
      "type": "object",
      "properties": {
        "issue_statement": {"type": "string"},
        "issue_domain": {"type": "string", "enum": ["contract", "property", "family", "tort", "other"]},
        "key_facts": {"type": "array", "items": {"type": "string"}}
      }
    },
    "legal_authorities": {
      "type": "object",
      "properties": {
        "civil_code_articles": {"type": "array", "items": {"type": "string"}},
        "precedent_references": {"type": "array", "items": {"type": "string"}},
        "other_authorities": {"type": "array", "items": {"type": "string"}}
      }
    },
    "analysis_instructions": {
      "type": "object",
      "properties": {
        "focus_areas": {"type": "array", "items": {"type": "string"}},
        "output_length": {"type": "string", "enum": ["brief", "standard", "detailed"]},
        "include_precedent_section": {"type": "boolean"},
        "include_recommendations": {"type": "boolean"}
      }
    }
  },
  "required": ["memo_details", "legal_issue", "legal_authorities"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "memo_content": {
      "type": "object",
      "properties": {
        "header": {"type": "string"},
        "executive_summary": {"type": "string"},
        "disclaimer": {"type": "string"},
        "issue_section": {"type": "string"},
        "rule_section": {"type": "string"},
        "application_section": {"type": "string"},
        "conclusion_section": {"type": "string"},
        "recommendations_section": {"type": "string"},
        "precedent_section": {"type": "string"},
        "footnotes": {"type": "array", "items": {"type": "string"}}
      }
    },
    "metadata": {
      "type": "object",
      "properties": {
        "word_count": {"type": "number"},
        "citations_count": {"type": "number"},
        "generation_timestamp": {"type": "string"}
      }
    }
  }
}
```

**Execution Handler:** Consult `references/irac-memo-template.md` and generate memo following the template structure. Return structured output following the output schema.

## Tool 6: Issue-Spotting Checklist Generator

**Tool Name:** `issue_spotting_checklist_generator`

**Description:** Invoke this tool when the user needs to generate a comprehensive issue-spotting checklist for a civil law matter. Use for systematic identification of legal issues in complex fact patterns.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "domain": {
      "type": "string",
      "enum": ["contract", "property", "family", "tort", "comprehensive"],
      "description": "Legal domain for issue spotting"
    },
    "fact_pattern": {
      "type": "object",
      "properties": {
        "narrative": {"type": "string"},
        "key_parties": {"type": "array", "items": {"type": "string"}},
        "key_events": {"type": "array", "items": {"type": "string"}},
        "key_documents": {"type": "array", "items": {"type": "string"}},
        "timeline": {"type": "array", "items": {"type": "string"}}
      }
    },
    "checklist_parameters": {
      "type": "object",
      "properties": {
        "completeness_level": {"type": "string", "enum": ["basic", "standard", "comprehensive"]},
        "include_explanations": {"type": "boolean"},
        "include_citations": {"type": "boolean"},
        "prioritization": {"type": "string", "enum": ["risk_based", "chronological", "legal_element"]}
      }
    }
  },
  "required": ["domain", "fact_pattern"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "checklist_content": {
      "type": "array",
      "items": {"type": "object"},
      "properties": {
        "category": {"type": "string"},
        "checklist_item": {"type": "string"},
        "explanation": {"type": "string"},
        "citation": {"type": "string"},
        "priority_level": {"type": "string"},
        "status": {"type": "string"},
        "notes": {"type": "string"}
      }
    },
    "summary": {
      "type": "object",
      "properties": {
        "total_items": {"type": "number"},
        "priority_issues": {"type": "number"},
        "items_requiring_attention": {"type": "number"},
        "domain_coverage": {"type": "array", "items": {"type": "string"}}
      }
    }
  }
}
```

**Execution Handler:** Consult relevant domain checklist from references/ and generate structured checklist. Return output following the output schema.

## Tool Invocation Protocol

**For Agents Using These Tools:**

1. **Tool Selection**: Choose appropriate tool based on user request
2. **Input Validation**: Validate input against tool's input schema
3. **Execution**: Follow execution handler instructions
4. **Output Generation**: Return output conforming to output schema
5. **Error Handling**: Return structured error if input invalid or execution fails

**Error Response Schema:**
```json
{
  "type": "object",
  "properties": {
    "error": {
      "type": "object",
      "properties": {
        "error_type": {"type": "string"},
        "error_message": {"type": "string"},
        "validation_errors": {"type": "array", "items": {"type": "string"}},
        "recovery_suggestions": {"type": "array", "items": {"type": "string"}}
      }
    }
  }
}
```

## Tool Maintenance

**When Updating Tools:**
1. Update tool descriptions for better triggering accuracy
2. Maintain JSON schema compatibility
3. Update execution handler references
4. Add new tools following this pattern
5. Document breaking changes

**Tool Versioning:**
- Maintain version history in tool metadata
- Tag breaking changes with major version increments
- Maintain backward compatibility when possible
- Document deprecation timeline for obsolete tools

This tool system provides a robust, extensible framework for legal analysis tasks within the Vietnam Civil Law Advisor skill architecture.
