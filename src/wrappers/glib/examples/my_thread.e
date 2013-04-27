class MY_THREAD
inherit G_THREAD 
feature {ANY} 
	run is
		do
			-- print("I'm a new thread, doing hard work (sleeping) for "+secs.to_string+" seconds%N")
			-- sleep(secs.to_natural_32)
			-- print("Done!%N")
			(1|..|upper).for_all(agent is_prime)
		end
	

	upper: INTEGER_32
	set(n: like upper) is do upper:=n end
	sleep (a: NATURAL_32) is
		external "C use <unistd.h>"
		end
end
