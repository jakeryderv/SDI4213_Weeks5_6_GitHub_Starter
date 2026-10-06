# SDI 4213 – Weeks 5–6 Individual Exercise Starter

This repository is the starter project for the **Weeks 5–6 Individual Exercise** in **SDI 4213-980: DevOps – CI/CD**.

You will extend a working CI project by adding two major capabilities:

1. **Week 5 – Build and Release Automation**
   - preserve the existing automated tests
   - create a packaged ZIP build artifact
   - upload the artifact from GitHub Actions
   - use the `VERSION` file
   - create a Git tag
   - create a GitHub Release
   - document the release in `CHANGELOG.md`

2. **Week 6 – Docker Containerization**
   - complete the starter `Dockerfile`
   - complete `.dockerignore`
   - build a versioned Docker image
   - run the container
   - publish port 8000
   - verify `/health`
   - inspect logs
   - stop and remove the container

## Repository Structure

```text
.
├── .github/
│   ├── ISSUE_TEMPLATE/
│   ├── workflows/
│   │   └── ci.yml
│   └── PULL_REQUEST_TEMPLATE.md
├── app/
├── tests/
├── docs/
│   ├── evidence-template.md
│   └── Weeks5_6_Individual_Exercise.docx
├── student-resources/
│   └── Dockerfile_hints.md
├── .dockerignore
├── .env.example
├── .gitignore
├── .python-version
├── CHANGELOG.md
├── Dockerfile
├── Makefile
├── README.md
├── VERSION
├── pyproject.toml
├── requirements.txt
└── uv.lock
```

## Before You Begin

Local development uses **uv** and **Python 3.13**. `.python-version` selects Python 3.13, and `pyproject.toml` restricts the project to Python 3.13.x. Runtime dependencies, development dependencies, and pytest/Ruff configuration live in `pyproject.toml`; `uv.lock` records the resolved dependency versions.

Install the locked dependencies, including the development tools:

```bash
uv sync --locked
```

uv creates `.venv` automatically. No activation is needed when using `uv run`.

Run the automated tests:

```bash
uv run python -m pytest
```

The starter project should pass all tests before you make Week 5 or Week 6 changes.

Run the application locally:

```bash
uv run uvicorn app.main:app --reload
```

Then visit:

- `http://127.0.0.1:8000`
- `http://127.0.0.1:8000/health`

### Development Commands

With Make installed, run `make` to list the available targets, their descriptions, and the commands they execute. The Makefile uses a POSIX shell, suitable for Linux/macOS or Windows through WSL/MSYS2.

| Command | Purpose |
| --- | --- |
| `make lint` | Check for Ruff lint issues. |
| `make lint-fix` | Apply automatically fixable lint changes. |
| `make format` | Apply Ruff formatting. |
| `make format-check` | Check formatting without changing files. |
| `make fix` | Apply lint fixes, then formatting. |
| `make test` | Run the automated tests. |
| `make check` | Check lint, formatting, and tests in sequence. |
| `make app` | Start the development server. |
| `make requirements` | Export locked dependencies to `requirements.txt`. |
| `make package` | Export locked dependencies and create `dist/sdi4213-app.zip`. Requires `zip`. |

### Requirements Export for the Exercise

`requirements.txt` is generated from `uv.lock` for the assignment's Dockerfile and ZIP package. GitHub Actions installs dependencies directly with `uv sync --locked`. Change dependencies through uv or `pyproject.toml`, then regenerate the export:

```bash
make requirements
```

Without Make, run:

```bash
uv export --locked --format requirements.txt --no-emit-project --output-file requirements.txt
```

The export includes development dependencies to preserve the instructor's pip-based test workflow. Commit `pyproject.toml`, `uv.lock`, `.python-version`, and the generated `requirements.txt`; do not edit the export by hand or commit `.venv`.

The instructor's pip workflow remains supported in an activated Python 3.13 virtual environment: install with `python -m pip install -r requirements.txt`, then run `python -m pytest -v`.

## Required Git Workflow

Use the same workflow throughout the exercise:

```text
Issue → Branch → Change → Commit → Push → Pull Request → CI → Review → Merge
```

Do not perform routine assignment work directly on `main`.

## Week 5 Starting Point

The workflow in `.github/workflows/ci.yml` installs locked dependencies with uv, checks lint and formatting, runs automated tests, creates a ZIP package, and uploads it using `actions/upload-artifact@v4`.

Build the same package locally with:

```bash
make package
```

Packaging requires Make and `zip`. The resulting `dist/sdi4213-app.zip` contains `app/`, `requirements.txt`, `README.md`, and `VERSION`. Python caches are excluded.

CI checks that the exported `requirements.txt` matches the committed file. Run `make requirements` and commit the updated export whenever dependencies change.

The uv and Make development commands require the full repository checkout. To run an extracted ZIP, create and activate a Python 3.13 virtual environment, then run:

```bash
python -m pip install -r requirements.txt
python -m uvicorn app.main:app
```

After merging the build pull request, follow the assignment's tagging and GitHub Release steps.

## Week 6 Starting Point

The repository contains a starter `Dockerfile` and `.dockerignore` with TODO comments. Complete them using the assignment instructions and course lecture material.

## Evidence

Use `docs/evidence-template.md` to record links, commands, screenshots, and reflections required by the assignment.

## Important

Do not add passwords, API keys, tokens, or other secrets to this repository.
