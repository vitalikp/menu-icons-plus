#!/usr/bin/make -f

PACKAGE = menu-icons-plus
VERSION = 3.2.6-dev
EXT = $(PACKAGE)-$(VERSION)

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

ifneq (${V},1)
.SILENT:
endif

all: $(EXT)

$(EXT):
	@echo "build '$(EXT)' extension"
	@cd ext; $(ZIP) ../$(EXT).xpi $(EXT_FILES)
	$(ZIP) $(EXT).xpi $(FILES)

clean:
	@echo -e '\e[1m$@ $(PACKAGE)\e[0m'
	@if [ -e $(EXT).xpi ] ; then \
		echo -e "  \e[1;31mRM\e[0m\t"$(EXT).xpi ; \
		$(RM) $(EXT).xpi ; \
	fi
