#!/usr/bin/make -f

PACKAGE = menu-icons-plus
VERSION = 3.2.4
EXT = $(PACKAGE)-$(VERSION)

EXT_FILES = \
	install.rdf \
	chrome.manifest

FILES = \
	content \
	defaults \
	locale \
	skin


ZIP = /usr/bin/zip -r -q

all: $(EXT)

$(EXT):
	@echo "build '$(EXT)' extension"
	@cd ext; $(ZIP) ../$(EXT).xpi $(EXT_FILES)
	@$(ZIP) $(EXT).xpi $(FILES)

clean:
	@echo -e '\e[1m$@ $(PACKAGE)\e[0m'
	@if [ -e $(EXT).xpi ] ; then \
		echo -e "  \e[1;31mRM\e[0m\t"$(EXT).xpi ; \
		$(RM) $(EXT).xpi ; \
	fi
