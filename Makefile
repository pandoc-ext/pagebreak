FILTER_FILE := $(wildcard *.lua)
DIFF ?= diff
PANDOC ?= pandoc

test: test-adoc test-html test-ms test-typst test-no-form-feed.html

test-typst: $(FILTER_FILE) test/input.md test/test-typst.yaml
	@if $(PANDOC) --list-input-formats | grep -q typst; then \
	    $(PANDOC) --defaults test/test-typst.yaml | \
	      $(DIFF) test/expected.typst -; \
	fi

test-%: $(FILTER_FILE) test/input.md test/test-%.yaml
	@$(PANDOC) --defaults test/test-$*.yaml | \
	  $(DIFF) test/expected.$* -

.PHONY: test
