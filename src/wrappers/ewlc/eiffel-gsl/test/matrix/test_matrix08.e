class TEST_MATRIX08

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			m: GSL_MATRIX_REAL_64
			min_x: TUPLE[INTEGER_32, INTEGER_32]
			max_x: TUPLE[INTEGER_32, INTEGER_32]
		do
			create m.make_zero(10, 3)

			assert(m.min = 0.0)
			
			assert(m.max = 0.0)
			
			min_x := m.min_index
			
			assert(min_x.item_1 = 0)
			
			assert(min_x.item_2 = 0)
			
			max_x := m.max_index
			
			assert(max_x.item_1 = 0)
			
			assert(max_x.item_2 = 0)
			
			assert(m.all_default)
			
		end

end -- TEST_MATRIX08
