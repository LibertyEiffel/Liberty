## Updates generated classes 

LIBRARIES=cairo \
	  common \
	  ffi \
	  glib \
	  gobject \
	  gtk2 \
	  llvm \
	  posix \
	  posix/dynamic-linking \
	  readline \
	  xml \
	  zmq
## Unfinished wrappers: gconf gda gdk2 gio gtk-math-view gtk-source-view gtk-unix-print json-glib qt4 xml zlib

.PHONY: subdirs $(LIBRARIES)

update: $(LIBRARIES)
	@echo Clusters that will be updated: $^

$(LIBRARIES) : 
	@echo Updating generated classes of $@
	@$(MAKE) -C $@/library/externals
