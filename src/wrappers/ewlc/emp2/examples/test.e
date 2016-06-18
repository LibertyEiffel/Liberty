class TEST
create {ANY} make
feature {ANY} 
	make
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
	sleep (a_sec: INTEGER): INTEGER
		external "C use <unistd.h>"
		end
end

