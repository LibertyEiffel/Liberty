class EXAMPLE1
	-- To execute this example with the SmartEiffel debugger,
	-- compile with:
	--                  compile -sedb example1

creation {ANY}
	main

feature {ANY}
	main is
		local
			p1, p2: POINT
		do
			create p1
			create p2
			p1.translate(1.0, 2.0)
			p2.translate(3.0, 4.0)
			sedb_breakpoint
			-- To stop here just before exit.
		end

end -- class EXAMPLE1
