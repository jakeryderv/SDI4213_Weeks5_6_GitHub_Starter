# Week 5-6 Exercise Evidence

Name:
GitHub repository URL: https://github.com/jakeryderv/SDI4213_Weeks5_6_GitHub_Starter

## Part A - Starting validation
- Local pytest result: 15 passed, 1 deprecation warning, using Python 3.13.11 and pytest 8.4.1 in the saved screenshot.
- Local test command: `python -m pytest -v`.
- Initial CI workflow run URL: https://github.com/jakeryderv/SDI4213_Weeks5_6_GitHub_Starter/actions/runs/37495623958
- Initial CI commit: `ddfd6e30531e6638e2f2912def40f2a27ce5f521` on `main`.

![Milestone 1 - Local tests](evidence/Screenshot_2026-10-06_12-01-43.png)

Milestone 1 - All 15 starter tests pass locally with the uv setup.

The local screenshot already uses `pyproject.toml`; it records local success after setup changes rather than an untouched-project baseline.

![Milestone 2 - Baseline CI](evidence/Screenshot_2026-10-06_12-12-14.png)

Milestone 2 - Baseline GitHub Actions CI workflow passes.

Workflow run: https://github.com/jakeryderv/SDI4213_Weeks5_6_GitHub_Starter/actions/runs/37495623958

### Setup validation

- Setup issue: https://github.com/jakeryderv/SDI4213_Weeks5_6_GitHub_Starter/issues/1
- Requirements export: `make requirements` completed successfully on 2026-10-06.
- Local checks: `make check` completed successfully on 2026-10-06: Ruff lint passed, all 16 Python files were already formatted, and all 15 tests passed with 1 dependency deprecation warning.
- Warning: Starlette's test client references the deprecated `anyio.abc.BlockingPortal` alias. The warning did not fail the tests.

## Part B - Week 5 build automation
- Pull request URL:
- Successful workflow run URL:
- Artifact name:
- What files are inside the downloaded artifact?

## Part C - Version and release
- Version:
- Git tag:
- GitHub Release URL:
- Short release-note summary:

## Part D - Week 6 Docker
- Docker image name and tag:
- `docker images` evidence:
- `docker ps` evidence:
- `/health` response:
- `docker logs` evidence:

## Reflection
1. What is the difference between a workflow artifact and a Docker image?
2. Why did you tag the Git release and Docker image with a version?
3. What does `-p 8000:8000` do?
4. What would you automate next if this project were moving toward deployment?
