class TEST_MATRIX02

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			m: GSL_MATRIX_REAL_64
		do
				create m.from_collection2 ( {ARRAY2[REAL_64] 0,3, 0,3,
											 << 1.0, 2.0, 3.0, 4.0;
											2.0, 3.0, 4.0, 5.0;
											0.0, 0.0, 9.0, 8.0;
											 4.0, 4.0, 3.0, 3.0>>})
			assert(m.count1 = 4)

			assert(m.count2 = 4)

			assert(m.count = 16)
			
			assert(m.item(0, 0) = 1.0)
			
			assert(m.item(3, 2) = 3.0)
		end

end -- TEST_MATRIX02
