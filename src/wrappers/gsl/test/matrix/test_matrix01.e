class TEST_MATRIX01

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			m: GSL_MATRIX_REAL_32
		do
			create m.make_zero(2, 5)

			assert(m.count1 = 2)

			assert(m.count2 = 5)

			assert(m.count = 10)
			
			assert(m.all_default)
			
		end

end -- TEST_MATRIX01
