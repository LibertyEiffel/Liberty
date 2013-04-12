## Updates generated classes 

## Since the actual length of C types depends on the architecture the class
## C_TYPES is generated everytime this Makefile is executed. Of course this makes
## crosscompiling really difficoult but we can live with this known bug for a
## while (Paolo 2013-04-09)

LIBRARIES=cairo \
	  common \
	  ffi \
	  llvm \
	  posix \
	  posix/dynamic-linking \
	  readline \
	  xml \
	  zmq

## To be wrapped using GObject introspection framework:  glib  gobject  gtk2 

## Unfinished wrappers: gconf gda gdk2 gio gtk-math-view gtk-source-view gtk-unix-print json-glib qt4 xml zlib

.PHONY: subdirs $(LIBRARIES)

update: common/library/c_types.e $(LIBRARIES) 
	@echo Clusters that will be updated: $^

common/library/c_types.e : common/tools/c_types_builder
	common/tools/c_types_builder >$@

common/tools/c_types_builder: common/tools/c_types_builder.c
	cc $^ -o $@

$(LIBRARIES) : common/library/c_types.e
	@echo Updating generated classes of $@
	@$(MAKE) -C $@/library/externals
