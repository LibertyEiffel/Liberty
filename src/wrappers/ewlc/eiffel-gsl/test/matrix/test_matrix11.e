class TEST_MATRIX11

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			m, n: GSL_MATRIX_REAL_64
		do
			m := {GSL_MATRIX_REAL_64 3, 2, << 1.1, 1.2;
														 2.1, 2.2;
														 3.1, 3.2>>}
			n := m.twin
			n.scale(2.0)
			m := m + m

			assert(m.is_equal(n))
		end

end
