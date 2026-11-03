#!/usr/bin/env bash
set -euo pipefail

REPO="AZ-104-Azure-Administrator-Study"

# Create folders.
mkdir -p "$REPO"/{00-Course-Overview,02-Topic-Notes,03-Labs,04-Troubleshooting,05-Revision,06-Evidence,07-Projects}
mkdir -p "$REPO/01-Class-Notes/Day-01-Course-Kickoff"

cd "$REPO"

# Create a file only when it does not already exist.
create_file() {
    local path="$1"

    if [[ ! -e "$path" ]]; then
        cat > "$path"
        printf 'Created: %s\n' "$path"
    else
        cat > /dev/null
        printf 'Preserved: %s\n' "$path"
    fi
}

create_file README.md <<'EOF'
# AZ-104 — Azure Administrator Study

My Microsoft Azure Administrator learning journey, including English
and Roman Urdu notes, hands-on labs, troubleshooting, and revision.

## Study Resources

- [Study Plan](00-Course-Overview/Study-Plan.md)
- [Progress Tracker](00-Course-Overview/Progress-Tracker.md)
- [Day 01 — English](01-Class-Notes/Day-01-Course-Kickoff/Notes-English.md)
- [Day 01 — Roman Urdu](01-Class-Notes/Day-01-Course-Kickoff/Notes-Roman-Urdu.md)

## Repository Sections

| Folder | Contents |
|---|---|
| 00-Course-Overview | Study plan and progress tracker |
| 01-Class-Notes | Notes organized by class |
| 02-Topic-Notes | Consolidated technical explanations |
| 03-Labs | Lab instructions, verification, and cleanup |
| 04-Troubleshooting | Problems, investigations, and solutions |
| 05-Revision | Glossary and revision questions |
| 06-Evidence | Reviewed screenshots and lab results |
| 07-Projects | Projects combining multiple skills |

## Learning Method

Understand → Practise → Verify → Explain → Review

## Publishing Guidelines

- Publish your own notes and lab documentation.
- Obtain permission before publishing trainer materials.
- Never commit passwords, keys, tokens, or sensitive screenshots.
- Review staged changes before every commit.
EOF

create_file .gitignore <<'EOF'
# Credentials and local configuration
.env
.env.*
!.env.example
*.pem
*.key
*.pfx
*.p12
.azure/

# Terraform local state and downloaded providers
.terraform/
*.tfstate
*.tfstate.*
*.tfplan
*.tfvars
*.tfvars.json
!*.tfvars.example

# Private course materials: store these in this folder
private-materials/

# Temporary and editor files
*.tmp
*.swp
*~
.vscode/
.idea/
__pycache__/
*.pyc

# Operating system files
.DS_Store
Thumbs.db
Desktop.ini
EOF

create_file 00-Course-Overview/Study-Plan.md <<'EOF'
# Study Plan

## Goal

Build practical Azure administration skills and prepare for AZ-104.

## Weekly Routine

| Day | Activity |
|---|---|
| Saturday | Attend class and capture questions |
| Sunday | Attend class and summarize key concepts |
| Monday | Review Saturday's concepts |
| Tuesday | Repeat Saturday's lab, if assigned |
| Wednesday | Review Sunday's concepts and lab |
| Thursday | Practise troubleshooting and revisit mistakes |
| Friday | Revise weak areas and prepare questions |

## Completion Checklist for Each Topic

- [ ] Explain what it is and why it is used.
- [ ] Complete the practical exercise, when applicable.
- [ ] Verify the result.
- [ ] Explain a common failure and how to investigate it.
- [ ] Record evidence and clean up lab resources.
- [ ] Review again without relying on the notes.
EOF

create_file 00-Course-Overview/Progress-Tracker.md <<'EOF'
# Progress Tracker

Update statuses based on actual study and lab results.

| Topic | Class Covered | Notes Ready | Practised | Can Explain | Needs Review |
|---|---|---|---|---|---|
| Day 01 — Course kickoff | Partial transcript available | No | N/A | Not assessed | Yes |
| Cloud fundamentals | To confirm | No | No | Not assessed | Yes |
| Identity and governance | No | No | No | Not assessed | Yes |
| Storage | No | No | No | Not assessed | Yes |
| Compute | No | No | No | Not assessed | Yes |
| Virtual networking | No | No | No | Not assessed | Yes |
| Monitoring and recovery | No | No | No | Not assessed | Yes |
EOF

create_file 01-Class-Notes/Day-01-Course-Kickoff/Notes-English.md <<'EOF'
# Day 01 — Course Kickoff and Orientation

**Status:** Starter template; available transcript is partial.

## Learning Objectives

## Key Concepts — What, Why, and How

## Familiar Examples

## Key Terms

## Practical Exercise

## Verification and Cleanup

## Troubleshooting

## Revision Summary

## Questions for the Trainer

## Sources and Corrections

Distinguish lecture content, verified corrections, and additional explanations.
EOF

create_file 01-Class-Notes/Day-01-Course-Kickoff/Notes-Roman-Urdu.md <<'EOF'
# Day 01 — Course Kickoff aur Orientation

**Haalat:** Notes ka ibtidai template; transcript abhi mukammal nahin hai.

## Seekhnay Ke Maqasid

## Aham Concepts — Kya, Kyun, aur Kaisay

## Samajhnay Ke Liye Misaalein

## Aham Technical Alfaaz

## Practical Mashq

## Result Ki Tasdeeq aur Lab Cleanup

## Masail aur Un Ka Hal

## Revision Ka Khulasa

## Trainer Se Poochnay Walay Sawalat

## Sources aur Durustgi

Lecture ki baat, tasdeeq shuda durustgi, aur mazeed wazahat alag likhein.
EOF

# Git tracks files, so add placeholders to the empty folders.
for folder in \
    02-Topic-Notes \
    03-Labs \
    04-Troubleshooting \
    05-Revision \
    06-Evidence \
    07-Projects
do
    if [[ ! -e "$folder/.gitkeep" ]]; then
        touch "$folder/.gitkeep"
    fi
done

# Initialize only if this folder is not already a Git repository.
if command -v git >/dev/null 2>&1; then
    if [[ ! -e .git ]]; then
        git init -b main
    fi
else
    printf '\nGit is unavailable. Folders and files were still created.\n'
fi

printf '\nSetup complete: %s\n' "$PWD"