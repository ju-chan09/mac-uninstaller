"""Entry point for pip/pipx installs — loads the standalone `uninstall` script."""
import importlib.util
import sys
from pathlib import Path


def main():
    here = Path(__file__).resolve().parent
    spec = importlib.util.spec_from_file_location("_uninstall", here / "uninstall")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    mod.main()
