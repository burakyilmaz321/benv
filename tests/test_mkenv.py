"""Test mkenv functionality"""

from click.testing import CliRunner

from benv.cli import mkenv


def test_mkenv():
    """Test mkenv"""
    runner = CliRunner()
    result = runner.invoke(mkenv, ['dummy'])
    assert result.exit_code == 0
    assert result.output == "Created environment dummy\n"
