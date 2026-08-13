#!/usr/bin/env bash
# Vietnam Civil Law Advisor - Skill Setup Script
# Production-grade setup script for skill initialization and configuration

set -euo pipefail  # Exit on error, undefined variables, pipe failures
IFS=$'\n\t'        # Set safe Internal Field Separator

# Script metadata
readonly SCRIPT_NAME="$(basename "$0")"
readonly SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
readonly PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
readonly VERSION="1.0.0"

# Color codes for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[0;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $*"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $*"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $*"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $*"
}

# Error handling
error_exit() {
    log_error "$1"
    exit "${2:-1}"
}

# Validation functions
validate_environment() {
    log_info "Validating environment..."

    # Check required commands
    local required_commands=("node" "python3" "git")
    for cmd in "${required_commands[@]}"; do
        if ! command -v "$cmd" &> /dev/null; then
            error_exit "Required command '$cmd' not found. Please install it." 2
        fi
    done

    # Check project structure
    if [[ ! -d "$PROJECT_ROOT" ]]; then
        error_exit "Project root directory not found: $PROJECT_ROOT" 3
    fi

    log_success "Environment validation complete"
}

# Directory setup
setup_directories() {
    log_info "Setting up directory structure..."

    local directories=(
        "config"
        "references"
        "templates"
        "scripts"
        "hooks"
        "tools"
        "assets"
        "evals/test-patterns"
        "evals/assertions"
    )

    for dir in "${directories[@]}"; do
        local full_path="$PROJECT_ROOT/$dir"
        if [[ ! -d "$full_path" ]]; then
            mkdir -p "$full_path"
            log_success "Created directory: $dir"
        else
            log_info "Directory exists: $dir"
        fi
    done

    log_success "Directory structure setup complete"
}

# Configuration setup
setup_configuration() {
    log_info "Setting up configuration files..."

    # Check if config instance exists
    if [[ ! -f "$PROJECT_ROOT/config/config-instance.json" ]]; then
        error_exit "Configuration file not found: config/config-instance.json" 4
    fi

    # Validate JSON configuration
    if ! python3 -m json.tool "$PROJECT_ROOT/config/config-instance.json" > /dev/null 2>&1; then
        error_exit "Invalid JSON in configuration file" 5
    fi

    log_success "Configuration validation complete"
}

# Reference materials setup
setup_references() {
    log_info "Verifying reference materials..."

    local required_references=(
        "references/civil-code-2015-index.md"
        "references/contract-law-checklist.md"
        "references/property-law-checklist.md"
        "references/family-law-checklist.md"
        "references/tort-law-checklist.md"
        "references/precedent-guidance.md"
        "references/irac-memo-template.md"
    )

    local missing_references=()
    for ref in "${required_references[@]}"; do
        local full_path="$PROJECT_ROOT/$ref"
        if [[ ! -f "$full_path" ]]; then
            missing_references+=("$ref")
        fi
    done

    if [[ ${#missing_references[@]} -gt 0 ]]; then
        log_warning "Missing reference materials:"
        for ref in "${missing_references[@]}"; do
            log_warning "  - $ref"
        done
        log_warning "Some skill features may not function properly"
    else
        log_success "All reference materials verified"
    fi
}

# Template setup
setup_templates() {
    log_info "Setting up template files..."

    # Create template index if it doesn't exist
    local template_index="$PROJECT_ROOT/templates/README.md"
    if [[ ! -f "$template_index" ]]; then
        cat > "$template_index" << 'EOF'
# Templates Directory

This directory contains output templates for the Vietnam Civil Law Advisor skill.

## Available Templates

- `irac-memo-template.md`: IRAC legal memo template
- `checklist-template.md`: Issue-spotting checklist template
- `legal-opinion-template.md`: Legal opinion template

## Template Usage

Templates are used by the skill to generate consistent, structured outputs.
Each template follows the appropriate legal methodology and citation standards.

## Template Customization

Templates can be customized for specific use cases while maintaining:
- Proper legal structure
- Citation standards
- Disclaimer inclusion
- Methodology application

EOF
        log_success "Created template index"
    fi

    log_success "Template setup complete"
}

# Evaluation setup
setup_evals() {
    log_info "Setting up evaluation framework..."

    # Create evals structure if it doesn't exist
    local evals_json="$PROJECT_ROOT/evals/evals.json"
    if [[ ! -f "$evals_json" ]]; then
        cat > "$evals_json" << 'EOF'
{
  "skill_name": "vietnam-civil-law-advisor",
  "version": "1.0.0",
  "evals": [
    {
      "id": 1,
      "name": "contract-validity-analysis",
      "prompt": "Analyze the validity of a contract where Company A agrees to sell goods to Company B for $1,000,000 with liquidated damages at 20% of contract value. Actual damage from breach is estimated at 12% of contract value.",
      "expected_output": "Analysis should identify that the contract is valid but liquidated damages may be reduced under Article 363 CC2015 as they substantially exceed actual damage.",
      "domain": "contract",
      "files": [],
      "assertions": [
        {
          "id": "contract-validity-assertion-1",
          "description": "Identifies contract validity under Article 117",
          "check_type": "content_contains",
          "expected_value": "Article 117",
          "weight": 1.0
        },
        {
          "id": "liquidated-damages-assertion-1",
          "description": "Identifies liquidated damages may be reduced",
          "check_type": "content_contains",
          "expected_value": "Article 363",
          "weight": 1.0
        }
      ]
    },
    {
      "id": 2,
      "name": "property-ownership-analysis",
      "prompt": "Analyze a property dispute where Party A claims ownership of land based on a 2010 purchase agreement, but Party B holds a current land use right certificate issued in 2020.",
      "expected_output": "Analysis should identify that Party B has superior title due to current land use right certificate under Land Law 2013.",
      "domain": "property",
      "files": [],
      "assertions": [
        {
          "id": "property-ownership-assertion-1",
          "description": "Identifies land use right certificate authority",
          "check_type": "content_contains",
          "expected_value": "Land Law 2013",
          "weight": 1.0
        }
      ]
    },
    {
      "id": 3,
      "name": "civil-liability-analysis",
      "prompt": "Analyze civil liability where Driver A runs a red light and hits Pedestrian B in a crosswalk, causing $50,000 in medical expenses. Pedestrian B was partially distracted by phone.",
      "expected_output": "Analysis should apply Article 584 framework and address contributory fault.",
      "domain": "tort",
      "files": [],
      "assertions": [
        {
          "id": "civil-liability-assertion-1",
          "description": "Applies Article 584 framework",
          "check_type": "content_contains",
          "expected_value": "Article 584",
          "weight": 1.0
        }
      ]
    }
  ]
}
EOF
        log_success "Created evaluation framework"
    fi

    log_success "Evaluation setup complete"
}

# Asset setup
setup_assets() {
    log_info "Setting up asset files..."

    # Create assets index if it doesn't exist
    local assets_index="$PROJECT_ROOT/assets/README.md"
    if [[ ! -f "$assets_index" ]]; then
        cat > "$assets_index" << 'EOF'
# Assets Directory

This directory contains static assets for the Vietnam Civil Law Advisor skill.

## Asset Types

- **Images**: Diagrams, flowcharts, illustrations
- **Documents**: Reference materials in document format
- **Data**: Static data files for lookup tables
- **Styles**: Formatting and styling resources

## Asset Usage

Assets are referenced by the skill for:
- Enhanced output formatting
- Visual aids in analysis
- Quick reference materials
- Template styling

## Asset Management

When adding assets:
1. Organize by type in subdirectories
2. Use clear, descriptive filenames
3. Document asset purpose in this README
4. Maintain appropriate file sizes

EOF
        log_success "Created assets index"
    fi

    log_success "Asset setup complete"
}

# Permission setup
setup_permissions() {
    log_info "Setting up file permissions..."

    # Make scripts executable
    find "$PROJECT_ROOT/scripts" -type f -name "*.sh" -exec chmod +x {} \;

    log_success "File permissions configured"
}

# Installation verification
verify_installation() {
    log_info "Verifying installation..."

    local checks=(
        "Configuration:config/config-instance.json"
        "References:references/civil-code-2015-index.md"
        "Tools:tools/legal-analysis-tools.md"
        "Hooks:hooks/skill-lifecycle-hooks.md"
        "Templates:templates/README.md"
        "Evaluation:evals/evals.json"
    )

    local all_passed=true
    for check in "${checks[@]}"; do
        local name="${check%%:*}"
        local path="${check##*:}"
        local full_path="$PROJECT_ROOT/$path"

        if [[ -f "$full_path" ]]; then
            log_success "✓ $name verified"
        else
            log_error "✗ $name failed - missing: $path"
            all_passed=false
        fi
    done

    if [[ "$all_passed" == "true" ]]; then
        log_success "Installation verification complete - all checks passed"
        return 0
    else
        log_warning "Installation verification complete - some checks failed"
        return 1
    fi
}

# Main installation flow
main() {
    log_info "Vietnam Civil Law Advisor - Skill Setup v$VERSION"
    log_info "================================================"

    validate_environment
    setup_directories
    setup_configuration
    setup_references
    setup_templates
    setup_evals
    setup_assets
    setup_permissions

    if verify_installation; then
        log_success "================================================"
        log_success "Skill setup completed successfully!"
        log_success "The skill is ready for use."
        return 0
    else
        log_warning "================================================"
        log_warning "Skill setup completed with warnings."
        log_warning "Please review missing components."
        return 1
    fi
}

# Run main function
main "$@"
