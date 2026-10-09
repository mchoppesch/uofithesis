TEXLIVE_BIN ?= /usr/local/texlive/2026/bin/universal-darwin
export PATH := $(TEXLIVE_BIN):$(PATH)

LATEXMK ?= latexmk
THESIS ?= thesis.tex
BUILD_DIR ?= .make-build
PDF = $(basename $(THESIS)).pdf

.PHONY: all clean distclean

all:
	@mkdir -p "$(BUILD_DIR)"
	$(LATEXMK) -lualatex -outdir="$(BUILD_DIR)" $(THESIS)
	cp "$(BUILD_DIR)/$(notdir $(PDF))" "$(PDF)"

clean:
	$(LATEXMK) -c -outdir="$(BUILD_DIR)" $(THESIS)
	rm -f "$(BUILD_DIR)/$(basename $(THESIS))-luamml-mathml.html"

distclean:
	$(LATEXMK) -C -outdir="$(BUILD_DIR)" $(THESIS)
	rm -f "$(BUILD_DIR)/$(basename $(THESIS))-luamml-mathml.html"
	rm -f "$(PDF)"
