.PHONY: help install install-dev test lint format clean build dist publish

help:  ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install:  ## Install the package
	pip install -e .



clean:  ## Clean build artifacts
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	find . -type d -name __pycache__ -delete
	find . -type f -name "*.pyc" -delete

build: clean  ## Build the package
	python -m build

dist: build  ## Create distribution files
	@echo "Distribution files created in dist/"

publish: dist  ## Publish to PyPI (requires twine)
	twine upload dist/*
