#!/usr/bin/env -S just --justfile

# List available commands.
_default:
    just --list --unsorted

# Setup the repository
setup:

# Format the codebase.
fmt:
    just --justfile xtool/justfile fmt
    dprint fmt --config configs/dprint.json
    stylua -g '*.lua' -g '!target' --allow-hidden .

# Check is the codebase properly formatted.
fmt-check:
    just --justfile xtool/justfile fmt-check
    dprint check --config configs/dprint.json
    stylua -g '*.lua' -g '!target' --allow-hidden --check .

# Lint the codebase.
lint:
    just --justfile xtool/justfile lint

# Tasks to make the code-base comply with the rules. Mostly used in git hooks.
comply: fmt lint

# Check if the repository comply with the rules and ready to be pushed.
check: fmt-check lint

# Create a new release. Example `just release v2.2.0`
release version:
    bash scripts/release.sh {{ version }}
