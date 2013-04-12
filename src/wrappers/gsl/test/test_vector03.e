class TEST_VECTOR03

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			v: GSL_VECTOR_REAL_64
		do
			v := {GSL_VECTOR_REAL_64 4, << 1.1, 1.2, 1.3, 1.4 >>}

			assert(v.count = 4)

			assert(not v.all_default)

			assert(v.item(0) = 1.1)
			assert(v.item(1) = 1.2)
			assert(v.item(2) = 1.3)
			assert(v.item(3) = 1.4)
		end

end -- TEST_VECTOR03
