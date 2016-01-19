class TEST_VECTOR08

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			v: GSL_VECTOR_REAL_32
		do
			create v.make_zero(5)
			assert(v.norm.abs < 0.00000001)
			
			v.put({REAL_32 1.0}, 0)
			v.put({REAL_32 2.0}, 1)
			v.put({REAL_32 3.0}, 2)
			v.put({REAL_32 4.0}, 3)
			v.put({REAL_32 5.0}, 4)
			assert((v.norm - 7.416198487).abs < 0.000001)
			
		end

end -- TEST_VECTOR08
