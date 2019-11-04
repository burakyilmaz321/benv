lint: flake8 pylint

flake8:
	flake8 --exit-zero --doctests

pylint:
	pylint --exit-zero -f parseable **/*.py

test:
	pytest
