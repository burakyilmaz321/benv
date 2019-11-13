"""Command lina application"""

import os

import click


RED = "\033[1;31m"
RESET = "\033[0;0m"

try:
    BENV_HOME = os.environ["BENV_HOME"]
except KeyError:
    raise KeyError(
        "Cannot find environment variable BENV_HOME. "
        "Please create it like: "
        "$ export BENV_HOME=~/.envs"
    )

VIRTUAL_ENV = os.environ.get("VIRTUAL_ENV")


@click.group()
def cli():
    """Entry point of the application"""


@cli.command()
@click.argument('env_name')
def chenv(env_name):
    """Change environment"""
    print(f"Swithced to {env_name}")


@cli.command()
@click.argument('env_name')
def mkenv(env_name):
    """Make environment"""
    print(f"Created environment {env_name}")


@cli.command()
def lsenv():
    """List environment"""
    envdir = os.scandir(BENV_HOME)
    envs = filter(lambda entry: entry.is_dir(), envdir)
    for env in envs:
        if VIRTUAL_ENV and os.path.basename(VIRTUAL_ENV) == env.name:
            print(f"{RED}* {env.name}{RESET}")
        else:
            print(f"* {env.name}")


@cli.command()
@click.argument('env_name')
def rmenv(env_name):
    """Remove environment"""
    print(f"Removed environment {env_name}")
