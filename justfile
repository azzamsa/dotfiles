#!/usr/bin/env -S just --justfile

alias f := fmt
alias l := lint
alias c := comply
alias k := check
alias p := deploy

[doc('List available commands')]
_default:
    just --list --unsorted

[doc('Set up the repository')]
setup:

[doc('Publish the binaries')]
deploy:
    just --justfile utils/snacks/justfile deploy
    dotter deploy

[doc('Make the codebase comply with formatting and linting rules (used in git hooks)')]
comply: fmt lint
    just --justfile utils/snacks/justfile comply

[doc('Check if the repository complies with rules and is ready to push')]
check: fmt-check lint
    just --justfile utils/snacks/justfile check

[doc('Format the codebase')]
fmt:
    dprint fmt

[doc('Check if the codebase is properly formatted')]
fmt-check:
    dprint check

[doc('Lint the codebase')]
lint:
    typos

[doc('Create a new release. Example: just release v2.2.0')]
release version:
    ./release {{ version }}

[doc('Check dependencies health. Pass `--write` to upgrade dependencies')]
up arg="":
    #!/usr/bin/env bash
    cargo upgrade --incompatible --recursive --verbose
    cargo update
    dprint config update
