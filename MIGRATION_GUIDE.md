# Apply the New Class-Based Structure

## Before You Start

This package was built from the supplied Azure repository ZIP. It does not include or replace `.git`, commits, remotes, or credentials. The migration utility changes the existing working tree only after source checks pass, and creates a backup outside the repository before applying changes. It does not commit or push.

The structure follows the established DevOps pattern: `2026/day-XX`, `Original_Assignment`, `Additional_Resources`, a README, a move map and review notes. The live reference GitHub tree could not be fetched; no exact live-tree match is claimed.

16 classes is a planning estimate. Two classes each weekend would mean eight teaching weekends, but the actual course schedule is unconfirmed. Placeholder days record missing materials, not missed attendance.

## 1. Extract Outside the Existing Repository

For example, extract to:

```text
C:/Linux/AZ-104-Restructure-Package/AZ-104-Azure-Administrator-Study/
```

Keep the existing checkout at:

```text
C:/Linux/AZ-104-Azure-Administrator-Study/
```

Do not drag the whole extracted folder into the existing repository. Merely copying new folders over old ones would leave duplicate old paths.

## 2. Check Your Current Work

In Git Bash:

```bash
cd /c/Linux/AZ-104-Azure-Administrator-Study
git status
```

The migration utility requires a clean working tree. Preserve pending work first. Do not discard changes to force it through. It also checks that source files match the ZIP, allowing Windows CRLF versus LF differences for text.

## 3. Preview

Python 3 is required. From Git Bash, use `python` or `python3`, whichever invokes Python 3 on your computer:

```bash
python /c/Linux/AZ-104-Restructure-Package/AZ-104-Azure-Administrator-Study/tools/apply-layout.py --repo C:/Linux/AZ-104-Azure-Administrator-Study
```

The default is preview only. Read any source or destination mismatch. If your checkout has changed since the supplied ZIP, stop and compare it; send an updated ZIP if needed. The utility does not bypass those checks.

## 4. Apply the Checked Migration

```bash
python /c/Linux/AZ-104-Restructure-Package/AZ-104-Azure-Administrator-Study/tools/apply-layout.py --repo C:/Linux/AZ-104-Azure-Administrator-Study --apply
```

The command prints the backup folder location. Keep the backup until you have reviewed the result. Unrelated files are retained; old managed paths are retired only after checked copies are prepared. Only empty directories are removed.

## 5. Review and Commit

```bash
cd /c/Linux/AZ-104-Azure-Administrator-Study
git status
git diff --stat
git diff -- README.md 00-Course-Overview/Progress-Tracker.md
```

Open `README.md`, `2026/README.md`, and `2026/day-01/README.md`. Check the English/Roman Urdu notes and PDFs. Open the quiz HTML locally in a browser. Review `Review_Items` and `FILE_MOVE_MAP.csv`.

Once the result is correct:

```bash
git add -A
git diff --cached --stat
git commit -m "Organize Azure course into class-based learning folders"
git push
git status
```

Use `git add -A` only after reviewing the repository status; it stages additions, changes and removals. Git may recognize preserved files as renames.

## Adding the Next Class

Use the next `2026/day-XX` folder and update its title and date in README.md. Preserve original trainer material in Original_Assignment. Put bilingual notes and exercises in Additional_Resources; add subfolders for Revision, Labs, Evidence or Troubleshooting only when useful. Link reusable references from Shared_Resources. Update the class index and progress tracker based on actual work.

If the course exceeds 16 sessions, add day-17 with the same pattern. There is no need to rename existing days.

## Recovery

The printed backup contains the affected original files under `files/` and a BACKUP_INDEX.json describing files that did not exist before migration. The utility attempts to restore original file contents if its apply phase fails. Stop on any error and preserve the backup. If you need help undoing a successful migration before committing, share `git status` and the backup location rather than deleting directories blindly.
