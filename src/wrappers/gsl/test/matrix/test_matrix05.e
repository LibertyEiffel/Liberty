class TEST_MATRIX05

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
			create m.make_identity(5, 4)

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
					if i = j then
						assert(m.item(i, j) = 1.0)
					else
						assert(m.item(i, j) = 0.0)
					end
					j := j + 1
				end
				i := i + 1
			end
			
		end

end -- TEST_MATRIX05
