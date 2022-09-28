.DEFAULT_GOAL := help

help: # https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: ## Setup the repository
	shellcheck --version || sudo apt install -y shellcheck
	which shfmt || ./scripts/ci_prepare
	black --version || pip install --user black

fmt: ## Format the codebase.
	./scripts/ci_sh fmt

fmt_check: ## Check is the codebase properly formatted.
	./scripts/ci_sh fmt

lint: ## Lint the codebase.
	./scripts/ci_sh lint

comply: fmt lint  ## Tasks to make the code-base comply with the rules. Mostly used in git hooks.

check:  fmt_check lint  ## Check if the repository comply with the rules and ready to be pushed.

release: ## Create a new release. Example `make release version=v2.2.0`
	bash scripts/release.sh $(version)

