from click.testing import CliRunner

from benv.cli import lsenv


def test_lsenv():
    runner = CliRunner()
    result = runner.invoke(lsenv)
    assert result.exit_code == 0
    assert result.output == "Here are some environments\n"
