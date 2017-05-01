#!/usr/bin/make -f

PACKAGE = menu-icons-plus
VERSION = 3.2.1
EXT = $(PACKAGE)-$(VERSION)

EXT_FILES = \
	install.rdf \
	chrome.manifest

FILES = \
	content \
	defaults \
	locale \
	skin


ZIP = /usr/bin/zip -rv
RM = /usr/bin/rm -v

all: $(EXT)

$(EXT):
	@echo "build '$(EXT)' extension"
	@cd ext; $(ZIP) ../$(EXT).xpi $(EXT_FILES)
	$(ZIP) $(EXT).xpi $(FILES)

clean:
	@if [ -e $(EXT).xpi ] ; then \
		$(RM) $(EXT).xpi ; \
	fi
