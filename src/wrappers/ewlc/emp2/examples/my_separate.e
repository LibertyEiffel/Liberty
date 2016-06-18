class MY_SEPARATE
	-- An example for SEPARATE objects
inherit SEPARATE

feature {ANY} 
	main
		local rem: INTEGER
		do
			-- 	
			from until False loop
				print("I'm d, pid ") std_output.flush
				rem:=sleep(2)
			end
		end
end -- class MY_SEPARATE


