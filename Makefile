.DEFAULT_GOAL := help

.PHONY: help lint lint-fix format format-check fix test check app requirements

LINT := uv run ruff check .
LINT_FIX := uv run ruff check --fix .
FORMAT := uv run ruff format .
FORMAT_CHECK := uv run ruff format --check .
TEST := uv run python -m pytest
APP := uv run uvicorn app.main:app --reload
REQUIREMENTS := uv export --locked --format requirements.txt --no-emit-project --output-file requirements.txt

FIX := $(LINT_FIX) && $(FORMAT)
CHECK := $(LINT) && $(FORMAT_CHECK) && $(TEST)

help:
	@printf '%s\n' \
		'make help - List available commands' \
		'    Prints this help listing' \
		'' \
		'make lint - Check for lint issues' \
		'    $(LINT)' \
		'' \
		'make lint-fix - Apply automatic lint fixes' \
		'    $(LINT_FIX)' \
		'' \
		'make format - Apply code formatting' \
		'    $(FORMAT)' \
		'' \
		'make format-check - Check formatting without changes' \
		'    $(FORMAT_CHECK)' \
		'' \
		'make fix - Apply lint fixes, then formatting' \
		'    $(FIX)' \
		'' \
		'make test - Run automated tests' \
		'    $(TEST)' \
		'' \
		'make check - Check lint, formatting, and tests' \
		'    $(CHECK)' \
		'' \
		'make app - Start the development server' \
		'    $(APP)' \
		'' \
		'make requirements - Export locked dependencies' \
		'    $(REQUIREMENTS)'

lint:
	$(LINT)

lint-fix:
	$(LINT_FIX)

format:
	$(FORMAT)

format-check:
	$(FORMAT_CHECK)

fix:
	$(FIX)

test:
	$(TEST)

check:
	$(CHECK)

app:
	$(APP)

requirements:
	$(REQUIREMENTS)
