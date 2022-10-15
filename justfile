#!/usr/bin/env -S just --justfile

# List available commands.
_default:
    just --list --unsorted

# Setup the repository
setup:
    shellcheck --version || sudo apt install -y shellcheck
    which shfmt || ./scripts/ci_prepare
    black --version || pip install --user black

# Format the codebase.
fmt:
    ./scripts/ci_sh fmt
    ./scripts/ci_rust fmt

# Check is the codebase properly formatted.
fmt-check:
    ./scripts/ci_sh fmt
    ./scripts/ci_rust fmt

# Lint the codebase.
lint:
    ./scripts/ci_sh lint

# Tasks to make the code-base comply with the rules. Mostly used in git hooks.
comply: fmt lint

# Check if the repository comply with the rules and ready to be pushed.
check: fmt-check lint

# Create a new release. Example `just release v2.2.0`
release version:
    bash scripts/release.sh {{ version }}

# Local Variables:
# mode: makefile
# End:
# vim: set ft=make :
