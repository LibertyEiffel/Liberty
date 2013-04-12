class TEST_MATRIX09

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			m: GSL_MATRIX_REAL_64
			r, c: GSL_VECTOR_REAL_64
		do
			m := {GSL_MATRIX_REAL_64 3, 2, << 1.1, 1.2;
														 2.1, 2.2;
														 3.1, 3.2>>}
												 
			
			r := m.get_row(0)

			c := m.get_column(1)
			
			assert(r.count = 2)
			assert(c.count = 3)
			assert(r.is_equal({GSL_VECTOR_REAL_64 2, << 1.1, 1.2 >>}))
			assert(c.is_equal({GSL_VECTOR_REAL_64 3, << 1.2, 2.2, 3.2 >>}))
			
		end

end
