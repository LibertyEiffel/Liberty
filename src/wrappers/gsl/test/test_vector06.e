class TEST_VECTOR06

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			v, u: GSL_VECTOR_REAL_64
		do
			v := {GSL_VECTOR_REAL_64 4, << 1.1, 1.2, 1.3, 1.4 >>}
			u := v.twin
			assert(u.count = 4)

			assert(v.is_equal(u))
			assert(u.is_equal(v))

			v.put(2.3, 3)
			assert(not u.is_equal(v))
			assert(u.is_equal(v) = v.is_equal(u))
			
			assert(u.item(3) = 1.4)
		end

end
