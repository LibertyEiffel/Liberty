class TEST_VECTOR09

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			v: GSL_VECTOR_REAL_64
		do
			create v.make_zero(5)
			assert(v.absolut_sum < 0.00000001)
			
			v.put({REAL_32 1.0}, 0)
			v.put({REAL_32 2.0}, 1)
			v.put({REAL_32 3.0}, 2)
			v.put({REAL_32 4.0}, 3)
			v.put({REAL_32 5.0}, 4)
			assert((v.absolut_sum - 15).abs < 0.00000001)
			
		end

end -- TEST_VECTOR09
