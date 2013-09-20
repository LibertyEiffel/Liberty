# Needs DIR variable do be defined

run: $(DIR:%=run-%)

run-%:
	@echo Running $*
	@rm -f /tmp/out
	@export cmd="./$*.exe" ; if [ -f $*.exe ] ; then \
		$(shell grep "^$*:" ../../data/exec_info |cut -f 2- -d :) > /tmp/out ;\
	else \
		touch /tmp/out ;\
	fi
