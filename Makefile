.PHONY: help
help: # Show this
	@echo "Recipes:"
	@grep --extended-regexp "^[a-z-]+: #" "$(MAKEFILE_LIST)" | \
		awk 'BEGIN {FS = ": # "}; {printf "  %-9s%s\n", $$1, $$2}'

.PHONY: lint
lint: # Lint scripts
	@shellcheck *.sh
	@shfmt --diff *.sh
