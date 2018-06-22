#!/usr/bin/make -f

PACKAGE = menu-icons-plus
VERSION = 3.2.6-dev
EXT = $(PACKAGE)-$(VERSION)

ICON16_SRC := \
	identity/default.svg \
	identity/default-hover.svg \
	identity/notice.svg \
	identity/notice-hover.svg

ICON24_SRC := \
	identity/conn-not-secure.svg \
	identity/permissions.svg

ICONS16 = $(patsubst %.svg,skin/%.png,$(ICON16_SRC))
ICONS24 = $(patsubst %.svg,skin/%.png,$(ICON24_SRC))

EXT_FILES = \
	install.rdf \
	chrome.manifest

FILES = \
	content \
	defaults \
	locale \
	skin


# tools
ZIP = /usr/bin/zip -r -q
RSVG_CONV := /usr/bin/rsvg-convert
OPTIPNG := /usr/bin/optipng -q

.SUFFIXES: .png .svg
.PHONY: icons16 icons24
ifneq (${V},1)
.SILENT:
endif

all: $(EXT)

skin/%.png: src/%.svg
	@echo -e "   \e[1;34mGEN\e[0m   "[png] $*.svg "(height $(I_H)px)"
	$(RSVG_CONV) -f png -o $@ -h $(I_H) $<
	$(OPTIPNG) -o7 -strip all $@

icons16: I_H := 16
icons16: $(ICONS16)

icons24: I_H := 24
icons24: $(ICONS24)

$(EXT): icons16 icons24
	@echo "build '$(EXT)' extension"
	@cd ext; $(ZIP) ../$(EXT).xpi $(EXT_FILES)
	$(ZIP) $(EXT).xpi $(FILES)

clean:
	@echo -e '\e[1m$@ $(PACKAGE)\e[0m'
	@if [ -e $(EXT).xpi ] ; then \
		echo -e "  \e[1;31mRM\e[0m\t"$(EXT).xpi ; \
		$(RM) $(EXT).xpi ; \
	fi
