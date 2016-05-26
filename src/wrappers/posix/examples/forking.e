class FORKING
insert 
   MULTIPROCESSING
   ANY
create {ANY} make
feature {ANY} 
	make
		do
			print("Parent forking 5 children%N")
			create children.with_capacity(5);
            5.times(agent do children.add_last(create {MY_CHILD}) end)
            children.for_each (agent {POSIX_PROCESS}.start)
			-- Eventually children.for_all(agent {MY_CHILD}.wait or join...)
			children.for_each(agent {POSIX_PROCESS}.wait)
			print("All processes finished%N")
		end

	children: FAST_ARRAY[POSIX_PROCESS]
	-- add_child is 
	-- 	do 
	-- 		children.add_last(create {MY_CHILD}.start) 
	-- 	end
end
