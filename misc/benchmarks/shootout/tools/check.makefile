# Needs DIR variable do be defined

check: $(DIR:%=check-%)

check-%: run-%
	@head -50 /tmp/out > /tmp/out2
	@diff /tmp/out2 ../../data/$*.out > /dev/null && echo "        $* OK" || echo "        $* ********** ERROR **********"
