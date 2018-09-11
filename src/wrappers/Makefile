## Updates generated classes 

## Since the actual length of C types depends on the architecture the class
## C_TYPES is generated everytime this Makefile is executed. Of course this makes
## crosscompiling really difficoult but we can live with this known bug for a
## while (Paolo 2013-04-09)

LIBRARIES=common \
	  ffi \
	  posix \
	  posix/dynamic-linking \
	  readline \
	  xml \
	  zmq
SUBMAKEFILES := $(shell find $(LIBRARIES) -name Makefile)


## Not working wrappers: llvm

## To be wrapped using GObject introspection framework:  glib  gobject  gtk2 cairo gtk3 gdk3 gconf

## Unfinished wrappers: gconf gda gdk2 gio gtk-math-view gtk-source-view gtk-unix-print json-glib qt4 xml zlib

CASTXML=$(shell which castxml)

.PHONY: subdirs $(LIBRARIES) clean

update: $(LIBRARIES) 
	@echo Clusters that will be updated: $^

clean: 
	@echo Removing generated files
	@$(MAKE) -C $@/library/externals/generated clean

$(LIBRARIES) : 
	@echo Updating generated classes of $@
	@$(MAKE) -C $@/library/externals/generated
