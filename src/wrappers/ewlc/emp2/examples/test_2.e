class TEST_2

create {ANY} make

feature {ANY} 
	make is
		do
			from create separated
			until False -- i.e. forever
			loop
				separated.do_stuff
				make_something
				sleep(3)
			end
		end

		separated: MY_SEPARATED
		-- 
		port: MEMORY_MAPPED_MESSAGE_PORT

	make_something is
		do
			print(once "Making some random calculation")
		end

end

