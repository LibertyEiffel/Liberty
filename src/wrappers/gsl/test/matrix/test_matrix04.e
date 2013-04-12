class TEST_MATRIX04

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			m: GSL_MATRIX_REAL_64
			i, j: INTEGER_32
		do
			create m.make_zero(5, 4)

			assert(m.count1 = 5)

			assert(m.count2 = 4)
			
			assert(m.count = 20)

			from
				i := 0
			until
				i > m.upper1
			loop
				from
					j := 0
				until
					j > m.upper2
				loop
					assert(m.item(i, j) = 0.0)
					j := j + 1
				end
				i := i + 1
			end
			
		end

end -- TEST_MATRIX04
