class TEST_MATRIX00

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			m: GSL_MATRIX_REAL_64
		do
			create m.make_zero(10, 3)

			assert(m.count1 = 10)

			assert(m.count2 = 3)

			assert(m.count = 30)
			
			assert(m.all_default)
			
		end

end -- TEST_MATRIX00
