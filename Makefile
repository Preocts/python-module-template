.PHONY: init
init:
	pip install --upgrade pip flit

.PHONY: install
install:
	[ -f "requirements.txt" ] && pip install -r requirements.txt
	flit install

.PHONY: install-dev
install-dev:
	[ -f "requirements.txt" ] && pip install -r requirements.txt
	[ -f "requirements-dev.txt" ] && pip install -r requirements-dev.txt
	flit install --symlink
	pre-commit install

.PHONY: build-dist
build-dist:
	flit build

.PHONY: clean-artifacts
clean-artifacts:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -rf {} +
	find . -name '.mypy_cache' -exec rm -rf {} +

.PHONY: clean-tests
clean-tests:
	rm -f coverage.xml
	rm -rf .tox
	rm -rf coverage_html_report
	rm -rf .coverage
	find . -name '.pytest_cache' -exec rm -rf {} +

.PHONY: clean-build
clean-build:
	rm -rf dist
	rm -rf build

.PHONY: clean-all
clean-all: clean-artifacts clean-tests clean-build
