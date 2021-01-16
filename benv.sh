#!/bin/bash
#
# A minimalistic Python virtual environment manager.
#
# benv is based on Python's (>=3.3) venv module in its standard library. A
# global variable named BENV_HOME is required. This is the path that virtual
# environments reside.
#
# There are four basic functions to call:
#
# chenv <env_name>
#   Activate an existing virtual environment
# lsenv
#   List all existing virtual environments
# mkenv <env_name>
#   Create a new virtual environment
# rmenv <env_name>
#   Remove a virtual environment
#

# Colors
GREEN="\033[1;32m"
RESET="\033[0;0m"

# Remove all white spaces
remove_whitespaces() {
  echo $1 | sed "s# ##g"
}

# Change virtual environment
chenv() {
  if [[ "$#" -ne 1 ]]; then
    echo "Usage: chenv <env_name>";
  else
    local env_name=$(remove_whitespaces $1)
    source ${BENV_HOME}/${env_name}/bin/activate
  fi
}

# List virtual environments
lsenv() {
  for i in $(ls -d $BENV_HOME/*/); do
    local env_name=$(basename $i)
    local active=""
    [[ ! -z "${VIRTUAL_ENV}" ]] && local active=$(basename $VIRTUAL_ENV)
    if [[ $env_name == $active ]]; then
      echo -e "* ${GREEN}${env_name}${RESET}"
    else
      echo "* ${env_name}"
    fi
  done
}

# Create virtual environment
mkenv() {
  if [[ "$#" -ne 1 ]]; then
    echo "Usage: mkenv <env_name>";
  else
    local env_name=$(remove_whitespaces $1)
    python3 -m venv ${BENV_HOME}/${env_name}
  fi
}

# Remove virtual environment
rmenv() {
  if [[ "$#" -ne 1 ]]; then
    echo "Usage: rmenv <env_name>";
  else
    local env_name=$(remove_whitespaces $1)
    if [[ $env_name == "" ]]; then
      echo "Env name cannot be empty"
    else
      rm -r $BENV_HOME/$env_name
    fi
  fi
}
