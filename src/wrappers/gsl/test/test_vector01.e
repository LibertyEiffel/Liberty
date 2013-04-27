class TEST_VECTOR01

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			m: GSL_VECTOR_REAL_64
		do
			create m.make_zero(1)

			assert(m.count = 1)

			m.put(3.14, 0)
			
			assert(not m.all_default)

			assert(m.item(0) = 3.14)
			
		end

end -- TEST_VECTOR01
