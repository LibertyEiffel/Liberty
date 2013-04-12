class TEST_VECTOR10

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			v1, v2: GSL_VECTOR_REAL_64
		do
			create v1.make_zero(5)
			create v2.make_one(5)
			v1.plus_scaled(3.0, v2)
			assert((v1.item(0) - 3.0).abs < 0.00000001) 
			assert((v1.absolut_sum - 15).abs < 0.00000001)
			
		end

end
