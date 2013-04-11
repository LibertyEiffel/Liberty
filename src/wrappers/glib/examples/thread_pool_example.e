class THREAD_POOL_EXAMPLE
inherit G_THREAD_POOL [DO_STUFF]
creation main

feature {ANY} 
	main is
		-- Starting point
	do
		make(12, False) -- maximum twelve non exclusive threads.
		(1|..|100).do_all(agent (i: INTEGER_32) is 
			do
				push (create {DO_STUFF}.make(100000+i))
			end)
	end

	new_routine: DO_STUFF is
		do
			create Result
		end
end
