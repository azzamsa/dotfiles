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

[doc('deploy the binaries')]
deploy:
    dotter deploy

# Tasks to make the code-base comply with the rules. Mostly used in git hooks.
comply: fmt lint
  just --justfile utils/snacks/justfile comply

# Check if the repository comply with the rules and ready to be pushed.
check: fmt-check lint
  just --justfile utils/snacks/justfile check

# Format the codebase.
fmt:
    dprint fmt

# Check is the codebase properly formatted.
fmt-check:
    dprint check

# Lint the codebase.
lint:
    typos

# Create a new release. Example `just release v2.2.0`
release version:
    ./release {{ version }}

[doc('Check dependencies health. Pass `--write` to upgrade dependencies')]
up arg="":
    #!/usr/bin/env bash
    cargo upgrade --incompatible --recursive --verbose
    cargo update
    dprint config update
