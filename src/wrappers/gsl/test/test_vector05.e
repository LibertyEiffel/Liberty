class TEST_VECTOR05

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			v: GSL_VECTOR_REAL_64
		do
			v := {GSL_VECTOR_REAL_64 7, << 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7 >>}
			assert(v.count = 7)

			v.remove_first
			assert(v.count = 6)
			assert(v.is_equal({GSL_VECTOR_REAL_64 6, << 1.2, 1.3, 1.4, 1.5, 1.6, 1.7 >>}))

			v.remove_last
			assert(v.count = 5)
			assert(v.is_equal({GSL_VECTOR_REAL_64 5, << 1.2, 1.3, 1.4, 1.5, 1.6 >>}))

			v.remove(1)
			v.remove(3)
			assert(v.count = 3)
			assert(v.is_equal({GSL_VECTOR_REAL_64 3, << 1.3, 1.4, 1.6 >>}))
					 
			v.remove_tail(2)
			assert(v.count = 1)
			assert(v.is_equal({GSL_VECTOR_REAL_64 1, << 1.3 >>}))

			
		end

end
