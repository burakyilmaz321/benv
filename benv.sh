#!/bin/bash
# A minimalistic Python virtual environment manager.

# benv is based on Python's (>=3.3) venv module in its standard library. A
# global variable named BENV_HOME is required. This is the path that virtual
# environments reside.
#
# There are four basic functions to call
# 1- chenv [env_name]: Activate an existing virtual environment
# 2- lsenv: List all existing virtual environments
# 3- mkenv [env_name]: Create a new virtual environment
# 4- rmenv [env_name]: Remove a virtual environment
#

# Remove all white spaces
remove_whitespaces() {
  echo $1 | sed "s# ##g"
}

# Change virtual environment
chenv() {
  if [[ "$#" -ne 1 ]]; then
    echo "Usage: chenv [env_name]";
  else
    local env_name=$(remove_whitespaces $1)
    source ${BENV_HOME}/${env_name}/bin/activate
  fi
}

# List virtual environments
lsenv() {
  for i in $(ls -d $BENV_HOME/*/); do
    env_name=$(basename $i)
    if [[ $env_name == $(basename $VIRTUAL_ENV) ]]; then
      echo -e "* \e[32m ${env_name}\033[0m"
    else
      echo "* ${env_name}"
    fi
  done
}

# Create virtual environment
mkenv() {
  if [[ "$#" -ne 1 ]]; then
    echo "Usage: mkenv [env_name]";
  else
    local env_name=$(remove_whitespaces $1)
    python3 -m venv ${BENV_HOME}/${env_name}
  fi
}

# Remove virtual environment
rmenv() {
  if [[ "$#" -ne 1 ]]; then
    echo "Usage: rmenv [env_name]";
  else
    local env_name=$(remove_whitespaces $1)
    if [[ $env_name == "" ]]; then
      echo "Env name cannot be empty"
    else
      rm $BENV_HOME/$env_name -r
    fi
  fi
}
