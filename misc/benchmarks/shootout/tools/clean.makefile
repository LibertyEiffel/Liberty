# Needs DIR variable do be defined

clean: $(DIR:%=clean-%)

clean-%:
	@rm -f $*.exe
	@rm -f ../results/recent_times
