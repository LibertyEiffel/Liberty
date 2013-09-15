# Needs DIR, COMPILER and EXTENSION variables do be defined

compile: $(DIR:%=compile-%)

compile-%:
	@echo "Compiling $*"
	@if [ -f $*/$(shell echo $* |tr -d -).$(EXTENSION) ] ; then \
		cd $*; $(COMPILER) $(shell grep $* compile_options |cut -f 2- -d :) $(shell echo $* |tr -d -).$(EXTENSION) -o ../$*.exe ;\
	else \
		echo "*** No program for $*" ;\
	fi
