include ../docker.mk
include ../help.mk
include ../shell.mk

IMAGE_NAME=aws-cdk

.PHONY: clean
clean: ## Clean up after the build process.

.PHONY: lint
lint: shell-lint docker-lint ## Lint all of the files for this Action.

.PHONY: build
build: docker-build ## Build this Action.

.PHONY: test
test: shell-test ## Test the components of this Action.

.PHONY: publish
publish: docker-publish ## Publish this Action.
