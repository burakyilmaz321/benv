lint: flake8 pylint

flake8:
	flake8 --doctests

pylint:
	pylint -f parseable **/*.py

test: test-venv
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

dist-test: clean lint test build
	python -m twine upload --repository testpypi dist/*

dist: clean lint test build
	python -m twine upload --repository pypi dist/*

test-venv:
	python -m venv ${BENV_HOME}/venv_1
	python -m venv ${BENV_HOME}/venv_2
