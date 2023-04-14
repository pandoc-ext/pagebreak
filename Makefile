FILTER_FILE := $(wildcard *.lua)
DIFF ?= diff
PANDOC ?= pandoc

test: test-adoc test-html test-ms test-no-form-feed.html

test-%: $(FILTER_FILE) test/input.md test/test-%.yaml
	@$(PANDOC) --defaults test/test-$*.yaml | \
	  $(DIFF) test/expected.$* -

.PHONY: test
