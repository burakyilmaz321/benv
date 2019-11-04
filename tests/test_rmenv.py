from click.testing import CliRunner

from benv.cli import rmenv


def test_rmenv():
    runner = CliRunner()
    result = runner.invoke(rmenv, ['dummy'])
    assert result.exit_code == 0
    assert result.output == "Removed environment dummy\n"
