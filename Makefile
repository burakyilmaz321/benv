lint: flake8 pylint

flake8:
	flake8 --doctests

pylint:
	pylint -f parseable **/*.py

test:
	pytest

build:
	python setup.py sdist bdist_wheel

clean: clean-build clean-pyc clean-test

clean-build:
	rm -rf build/
	rm -rf dist/
	rm -rf benv_burakyilmaz321.egg-info/

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -rf {} +

clean-test:
	rm -rf .pytest_cache

dist-test: lint test build
	python -m twine upload --repository testpypi dist/*

dist: lint test build
	python -m twine upload --repository pypi dist/*
