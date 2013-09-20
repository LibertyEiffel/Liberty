# Needs DIR and LANGUAGE variables do be defined

bench: $(DIR:%=bench-%)

bench-%: compile-%
	@export cmd="./$*.exe" ; if [ -f $*.exe ] ; then \
		$(shell grep "^$*:" ../../data/exec_info |cut -f 2- -d :) > /tmp/out ; \
		head -50 /tmp/out > /tmp/out2 ;\
		if diff /tmp/out2 ../../data/$*.out > /dev/null ; then \
			echo "Benching $*" ; \
			export timing=time ; \
			$(shell grep "^$*:" ../../data/exec_info |cut -f 2- -d :) > /dev/null 2> /tmp/time ; \
			$(shell grep "^$*:" ../../data/exec_info |cut -f 2- -d :) > /dev/null 2>> /tmp/time ; \
			$(shell grep "^$*:" ../../data/exec_info |cut -f 2- -d :) > /dev/null 2>> /tmp/time ; \
			$(shell grep "^$*:" ../../data/exec_info |cut -f 2- -d :) > /dev/null 2>> /tmp/time ; \
			unset timing ; \
			echo -n "$* $(LANGUAGE): " >> ../results/recent_times ; \
			../../tools/print_min_time < /tmp/time >> ../results/recent_times ; \
			echo -n "         " ; tail -1 ../results/recent_times ; \
		else \
			echo "No bench for bad program $*" ; \
		fi ; \
	fi
