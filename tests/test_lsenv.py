"""Test lenv functionality"""

from click.testing import CliRunner

from benv.cli import lsenv


def test_lsenv():
    """Test lenv"""
    runner = CliRunner()
    result = runner.invoke(lsenv)
    assert result.exit_code == 0
    assert result.output == "* venv_1\n* venv_2\n"
