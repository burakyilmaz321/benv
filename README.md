# benv

A minimalistic Python virtual environment manager that no one needs.

![](https://github.com/burakyilmaz321/benv/workflows/Python%20package/badge.svg)

## Requirements

- Python >= 3.3

## Installation

Clone this repo

```bash
git clone git@github.com:burakyilmaz321/benv.git
```

Source `benv.sh` in your `.bashrc`

```bash
# anywhere in ~/.bashrc
source /path/to/benv.sh
```

## Usage

Create a home directory for environments

```bash
mkdir ~/.envs
```

Export this folder's path as `BENV_HOME`

```bash
BENV_HOME=~/.envs
```

There are four basic functions to call

- **mkenv** Create a new virtual environment
- **lsenv** List all existing virtual environments
- **chenv** Activate an existing virtual environment
- **rmenv** Remove a virtual environment

## License
[MIT](https://choosealicense.com/licenses/mit/)
