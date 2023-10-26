.PHONY = markdownlint
markdownlint:
	@./.ci/bin/markdownlint

.PHONY = markdownlint_file
markdownlint_file:
	@./.ci/bin/markdownlint "${MARKDOWN_FILE}"
