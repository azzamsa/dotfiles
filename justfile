#!/usr/bin/env -S just --justfile

alias f := fmt
alias l := lint
alias c := comply
alias k := check

# List available commands.
_default:
    just --list --unsorted

# Setup the repository
setup:

# Tasks to make the code-base comply with the rules. Mostly used in git hooks.
comply: fmt lint

# Check if the repository comply with the rules and ready to be pushed.
check: fmt-check lint

# Format the codebase.
fmt:
    just --justfile cli/xtool/justfile fmt
    dprint fmt
    stylua . --allow-hidden
    prettier . --write --log-level error

# Check is the codebase properly formatted.
fmt-check:
    just --justfile cli/xtool/justfile fmt-check
    dprint check
    stylua . --allow-hidden --check
    prettier . --check --log-level error

# Lint the codebase.
lint:
    just --justfile cli/xtool/justfile lint
    typos
    selene . --quiet

    ./_scripts/python-tools

# Create a new release. Example `just release v2.2.0`
release version:
    ./_scripts/release.py {{ version }}
