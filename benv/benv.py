"""Command lina application"""

import click


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
    print("Here are some environments")


@cli.command()
@click.argument('env_name')
def rmenv(env_name):
    """Remove environment"""
    print(f"Removed environment {env_name}")
