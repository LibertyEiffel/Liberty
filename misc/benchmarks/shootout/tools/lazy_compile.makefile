# Needs DIR, COMPILER and EXTENSION variables do be defined

compile: $(DIR:%=compile-%)

compile-%:
	@echo "Compiling $* (lazy mode)"
	@if [ -f $*/$(shell echo $* |tr -d -).$(EXTENSION) ] ; then \
		cd $*; $(COMPILER) $(shell grep $* compile_options |cut -f 2- -d :) $(shell echo $* |tr -d -).$(EXTENSION) -o ../$*.exe || echo "*** Compilation error for $*. This benchmark is ignored.";\
	else \
		echo "*** No program for $*" ;\
	fi
