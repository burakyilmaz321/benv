"""Test chenv functionality"""

from click.testing import CliRunner

from benv.cli import chenv


def test_chenv():
    """Test chenv"""
    runner = CliRunner()
    result = runner.invoke(chenv, ['dummy'])
    assert result.exit_code == 0
    assert result.output == "Swithced to dummy\n"
