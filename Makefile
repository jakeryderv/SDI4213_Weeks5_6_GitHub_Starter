.DEFAULT_GOAL := help

.PHONY: help lint lint-fix format format-check fix test check app requirements package

UV_RUN := uv run --locked

LINT := $(UV_RUN) ruff check .
LINT_FIX := $(UV_RUN) ruff check --fix .
FORMAT := $(UV_RUN) ruff format .
FORMAT_CHECK := $(UV_RUN) ruff format --check .
TEST := $(UV_RUN) python -m pytest
APP := $(UV_RUN) uvicorn app.main:app --reload
REQUIREMENTS := uv export --locked --format requirements.txt --no-emit-project --output-file requirements.txt

PACKAGE := rm -rf dist/package && \
	rm -f dist/sdi4213-app.zip && \
	mkdir -p dist/package && \
	cp -R app dist/package/ && \
	cp requirements.txt README.md VERSION dist/package/ && \
	cd dist/package && \
	zip -r ../sdi4213-app.zip . -x "*/__pycache__/*" "*.pyc"

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
		'    $(REQUIREMENTS)' \
		'' \
		'make package - Export dependencies and create the assignment ZIP' \
		'    $(REQUIREMENTS)' \
		'    $(PACKAGE)'

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

package: requirements
	$(PACKAGE)
