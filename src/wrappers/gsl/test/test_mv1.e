class TEST_MV1

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			m: GSL_MATRIX_REAL_64
			y, y2, x: GSL_VECTOR_REAL_64
		do
			m := {GSL_MATRIX_REAL_64 3, 2, << 1.1, 1.2;
														 2.1, 2.2;
														 3.1, 3.2>>}

			create x.make_one(2)
			x.scale(2.0)

			y := m.multiply_vector(x)

			y2 := {GSL_VECTOR_REAL_64 3, << 4.6, 8.6, 12.6 >>}
			assert((y - y2).norm < 0.000001)
		end

end
