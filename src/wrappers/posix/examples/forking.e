class FORKING
creation make
feature {ANY} 
	make is
		do
			print("Father genertaing 5 childred%N")
			create children.with_capacity(5);
			5.times(agent add_child)
			-- Eventually children.for_all(agent {MY_CHILD}.wait or join...)
			print("Done%N")
		end

	children: FAST_ARRAY[POSIX_PROCESS]
	add_child is 
		do 
			children.add_last(create {MY_CHILD}.start) 
		end
end
