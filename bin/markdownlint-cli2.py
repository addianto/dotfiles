#!/usr/bin/env python3
# /// script
# requires-python = ">=3.11"
# ///
# SPDX-License-Identifier: MIT
import subprocess
import sys

MARKDOWNLINT_CLI2_VERSION: str = "0.23.3"


def main() -> None:
    command = [
        "pnpm",
        "dlx",
        f"markdownlint-cli2=={MARKDOWNLINT_CLI2_VERSION}",
    ] + sys.argv[1:]

    try:
        result = subprocess.run(command, check=True)
        sys.exit(result.returncode)
    except FileNotFoundError:
        print(
            "Error: 'pnpm' command not found. Please ensure 'pnpm' is installed and available in your PATH.",
            file=sys.stderr,
        )
        sys.exit(127)
