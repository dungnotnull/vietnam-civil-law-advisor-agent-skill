# Skill Lifecycle Hooks

Hook definitions and execution handlers for the Vietnam Civil Law Advisor skill. Hooks provide lifecycle management, state synchronization, event emission, and validation throughout skill execution.

## Hook Registry Pattern

All hooks follow this structure:
```json
{
  "hook_name": "name",
  "trigger_point": "when this hook fires",
  "input_schema": {JSON schema for input},
  "output_schema": {JSON schema for output},
  "execution_handler": "reference to execution logic",
  "priority": "execution priority"
}
```

## Hook 1: Skill Initialization Hook

**Hook Name:** `skill_initialization`

**Trigger Point:** Fires when skill is first invoked, before any processing begins.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "invocation_context": {
      "type": "object",
      "properties": {
        "user_request": {"type": "string"},
        "trigger_type": {"type": "string"},
        "session_context": {"type": "object"},
        "invocation_timestamp": {"type": "string"}
      }
    }
  },
  "required": ["invocation_context"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "initialization_result": {
      "type": "object",
      "properties": {
        "skill_ready": {"type": "boolean"},
        "configuration_loaded": {"type": "boolean"},
        "resources_available": {"type": "boolean"},
        "initialization_messages": {"type": "array", "items": {"type": "string"}},
        "state_snapshot": {"type": "object"}
      }
    }
  }
}
```

**Execution Handler:** 
1. Load configuration from `config/config-instance.json`
2. Verify reference materials availability
3. Initialize state management
4. Emit `skill_ready` event
5. Return initialization status

**Priority:** HIGH (executes before all other hooks)

## Hook 2: Input Validation Hook

**Hook Name:** `input_validation`

**Trigger Point:** Fires after skill initialization, before main processing.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "user_input": {
      "type": "object",
      "properties": {
        "domain": {"type": "string"},
        "query": {"type": "string"},
        "jurisdiction": {"type": "string"},
        "output_format": {"type": "string"},
        "additional_parameters": {"type": "object"}
      }
    },
    "validation_rules": {
      "type": "object",
      "properties": {
        "required_fields": {"type": "array", "items": {"type": "string"}},
        "field_constraints": {"type": "object"},
        "scope_constraints": {"type": "array", "items": {"type": "string"}}
      }
    }
  },
  "required": ["user_input"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "validation_result": {
      "type": "object",
      "properties": {
        "is_valid": {"type": "boolean"},
        "validation_errors": {"type": "array", "items": {"type": "string"}},
        "validation_warnings": {"type": "array", "items": {"type": "string"}},
        "normalized_input": {"type": "object"},
        "validation_timestamp": {"type": "string"}
      }
    }
  }
}
```

**Execution Handler:**
1. Apply validation schema from skill configuration
2. Check required fields presence
3. Validate field constraints (length, format, values)
4. Check scope constraints (jurisdiction, domain)
5. Normalize input data
6. Return validation result with errors/warnings

**Priority:** HIGH (blocks execution if validation fails)

## Hook 3: Domain Classification Hook

**Hook Name:** `domain_classification`

**Trigger Point:** Fires after input validation, determines which legal domain to process.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "validated_input": {
      "type": "object",
      "properties": {
        "domain_hint": {"type": "string"},
        "query_text": {"type": "string"},
        "context_clues": {"type": "array", "items": {"type": "string"}}
      }
    }
  },
  "required": ["validated_input"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "classification_result": {
      "type": "object",
      "properties": {
        "primary_domain": {"type": "string"},
        "secondary_domains": {"type": "array", "items": {"type": "string"}},
        "confidence_score": {"type": "number"},
        "classification_rationale": {"type": "string"},
        "recommended_tools": {"type": "array", "items": {"type": "string"}},
        "classification_timestamp": {"type": "string"}
      }
    }
  }
}
```

**Execution Handler:**
1. Analyze query for domain-specific keywords
2. Check context clues for domain indicators
3. Apply domain classification rules
4. Calculate confidence score
5. Recommend appropriate tools
6. Return classification result

**Priority:** MEDIUM (determines processing path)

## Hook 4: Pre-Processing Hook

**Hook Name:** `pre_processing`

**Trigger Point:** Fires after domain classification, before main analysis.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "classification_context": {
      "type": "object",
      "properties": {
        "domain": {"type": "string"},
        "input_data": {"type": "object"},
        "processing_parameters": {"type": "object"}
      }
    }
  },
  "required": ["classification_context"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "preprocessing_result": {
      "type": "object",
      "properties": {
        "processing_ready": {"type": "boolean"},
        "prepared_data": {"type": "object"},
        "resource_requirements": {"type": "array", "items": {"type": "string"}},
        "processing_strategy": {"type": "string"},
        "preprocessing_messages": {"type": "array", "items": {"type": "string"}}
      }
    }
  }
}
```

**Execution Handler:**
1. Prepare data for main processing
2. Identify required resources (checklists, templates)
3. Determine processing strategy
4. Pre-load reference materials
5. Return preprocessing status

**Priority:** MEDIUM (prepares for main processing)

## Hook 5: Main Processing Hook

**Hook Name:** `main_processing`

**Trigger Point:** Fires after pre-processing, performs main legal analysis.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "processing_context": {
      "type": "object",
      "properties": {
        "domain": {"type": "string"},
        "prepared_data": {"type": "object"},
        "processing_strategy": {"type": "string"},
        "available_resources": {"type": "array", "items": {"type": "string"}}
      }
    }
  },
  "required": ["processing_context"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "processing_result": {
      "type": "object",
      "properties": {
        "analysis_complete": {"type": "boolean"},
        "legal_analysis": {"type": "object"},
        "citations": {"type": "array", "items": {"type": "object"}},
        "recommendations": {"type": "array", "items": {"type": "string"}},
        "processing_metadata": {"type": "object"},
        "processing_messages": {"type": "array", "items": {"type": "string"}}
      }
    }
  }
}
```

**Execution Handler:**
1. Execute domain-specific analysis
2. Apply appropriate methodologies (IRAC, code-based syllogism)
3. Consult reference materials
4. Generate citations
5. Formulate recommendations
6. Return processing results

**Priority:** CRITICAL (main analysis work)

## Hook 6: Output Formatting Hook

**Hook Name:** `output_formatting`

**Trigger Point:** Fires after main processing, formats output for user.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "raw_output": {
      "type": "object",
      "properties": {
        "legal_analysis": {"type": "object"},
        "formatting_requirements": {"type": "object"},
        "user_preferences": {"type": "object"}
      }
    }
  },
  "required": ["raw_output"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "formatted_output": {
      "type": "object",
      "properties": {
        "output_ready": {"type": "boolean"},
        "formatted_content": {"type": "string"},
        "output_format": {"type": "string"},
        "content_structure": {"type": "object"},
        "formatting_messages": {"type": "array", "items": {"type": "string"}}
      }
    }
  }
}
```

**Execution Handler:**
1. Apply requested output format (IRAC, checklist, memo)
2. Structure content according to template
3. Ensure proper citation formatting
4. Include disclaimer
5. Validate output completeness
6. Return formatted output

**Priority:** HIGH (ensures proper output format)

## Hook 7: Quality Assurance Hook

**Hook Name:** `quality_assurance`

**Trigger Point:** Fires after output formatting, validates output quality.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "formatted_output": {
      "type": "object",
      "properties": {
        "content": {"type": "string"},
        "format": {"type": "string"},
        "metadata": {"type": "object"}
      }
    },
    "quality_standards": {
      "type": "object",
      "properties": {
        "citation_accuracy": {"type": "boolean"},
        "completeness": {"type": "boolean"},
        "disclaimer_inclusion": {"type": "boolean"},
        "methodology_application": {"type": "boolean"}
      }
    }
  },
  "required": ["formatted_output"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "quality_assessment": {
      "type": "object",
      "properties": {
        "meets_standards": {"type": "boolean"},
        "quality_score": {"type": "number"},
        "issues_found": {"type": "array", "items": {"type": "string"}},
        "improvements_needed": {"type": "array", "items": {"type": "string"}},
        "approval_status": {"type": "string"},
        "assessment_timestamp": {"type": "string"}
      }
    }
  }
}
```

**Execution Handler:**
1. Verify citation accuracy and completeness
2. Check disclaimer inclusion
3. Verify methodology application
4. Assess output completeness
5. Calculate quality score
6. Return quality assessment

**Priority:** HIGH (blocks output if quality standards not met)

## Hook 8: State Synchronization Hook

**Hook Name:** `state_synchronization`

**Trigger Point:** Fires after quality assurance, synchronizes state if needed.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "current_state": {
      "type": "object",
      "properties": {
        "session_state": {"type": "object"},
        "processing_state": {"type": "object"},
        "user_context": {"type": "object"}
      }
    }
  },
  "required": ["current_state"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "synchronization_result": {
      "type": "object",
      "properties": {
        "sync_complete": {"type": "boolean"},
        "updated_state": {"type": "object"},
        "sync_changes": {"type": "array", "items": {"type": "string"}},
        "state_persistence_status": {"type": "string"},
        "sync_timestamp": {"type": "string"}
      }
    }
  }
}
```

**Execution Handler:**
1. Capture current session state
2. Update processing history
3. Synchronize user context
4. Persist state for next invocation
5. Return synchronization status

**Priority:** LOW (maintenance function)

## Hook 9: Event Emission Hook

**Hook Name:** `event_emission`

**Trigger Point:** Fires after state synchronization, emits events for monitoring.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "event_context": {
      "type": "object",
      "properties": {
        "execution_summary": {"type": "object"},
        "performance_metrics": {"type": "object"},
        "user_interaction": {"type": "object"}
      }
    }
  },
  "required": ["event_context"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "emission_result": {
      "type": "object",
      "properties": {
        "events_emitted": {"type": "array", "items": {"type": "string"}},
        "event_data": {"type": "array", "items": {"type": "object"}},
        "emission_status": {"type": "string"},
        "emission_timestamp": {"type": "string"}
      }
    }
  }
}
```

**Execution Handler:**
1. Collect execution summary data
2. Gather performance metrics
3. Emit monitoring events
4. Emit user interaction events
5. Return emission status

**Priority:** LOW (monitoring function)

## Hook 10: Skill Completion Hook

**Hook Name:** `skill_completion`

**Trigger Point:** Fires as final step before skill completion.

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "completion_context": {
      "type": "object",
      "properties": {
        "execution_summary": {"type": "object"},
        "final_output": {"type": "object"},
        "user_satisfaction_indicators": {"type": "object"}
      }
    }
  },
  "required": ["completion_context"]
}
```

**Output Schema:**
```json
{
  "type": "object",
  "properties": {
    "completion_result": {
      "type": "object",
      "properties": {
        "skill_completed": {"type": "boolean"},
        "completion_summary": {"type": "string"},
        "next_steps_suggested": {"type": "array", "items": {"type": "string"}},
        "follow_up_actions": {"type": "array", "items": {"type": "string"}},
        "completion_timestamp": {"type": "string"},
        "session_id": {"type": "string"}
      }
    }
  }
}
```

**Execution Handler:**
1. Generate completion summary
2. Suggest next steps if applicable
3. Identify follow-up actions
4. Capture session metadata
5. Return completion status

**Priority:** MEDIUM (final housekeeping)

## Hook Execution Order

Hooks execute in this order:
1. `skill_initialization` (HIGH)
2. `input_validation` (HIGH)
3. `domain_classification` (MEDIUM)
4. `pre_processing` (MEDIUM)
5. `main_processing` (CRITICAL)
6. `output_formatting` (HIGH)
7. `quality_assurance` (HIGH)
8. `state_synchronization` (LOW)
9. `event_emission` (LOW)
10. `skill_completion` (MEDIUM)

## Hook Error Handling

**Error Propagation Rules:**
- HIGH priority hooks: Block execution on error
- MEDIUM priority hooks: Log error, continue with warning
- LOW priority hooks: Log error, continue
- CRITICAL hooks: Always block execution on error

**Error Response Schema:**
```json
{
  "type": "object",
  "properties": {
    "hook_error": {
      "type": "object",
      "properties": {
        "hook_name": {"type": "string"},
        "error_type": {"type": "string"},
        "error_message": {"type": "string"},
        "error_recovery": {"type": "string"},
        "error_timestamp": {"type": "string"}
      }
    }
  }
}
```

## Hook Monitoring

**Events Emitted by Hooks:**
- `hook_started`: Hook execution begun
- `hook_completed`: Hook execution finished
- `hook_failed`: Hook execution failed
- `hook_skipped`: Hook skipped due to conditions
- `hook_warning`: Hook completed with warnings

**Performance Metrics:**
- Execution time per hook
- Success/failure rates
- Error patterns
- Resource utilization

## Hook Customization

**Adding Custom Hooks:**
1. Define hook following registry pattern
2. Specify trigger point
3. Set appropriate priority
4. Implement execution handler
5. Document integration points

**Modifying Existing Hooks:**
1. Maintain backward compatibility
2. Document breaking changes
3. Update hook version
4. Test integration points
5. Update monitoring

This hook system provides comprehensive lifecycle management for the Vietnam Civil Law Advisor skill, ensuring robust execution, state management, and quality control.
