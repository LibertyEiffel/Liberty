class TEST
create {ANY} make
feature {ANY} 
	make is
		local rem: INTEGER
		do
			create separated
			from until False loop
				print("I'm father%N")
				std_output.flush 
			 rem := sleep(1)
			end
		end
	
	separated: MY_SEP
	sleep (a_sec: INTEGER): INTEGER is
		external "C use <unistd.h>"
		end
end

