class TEST_MATRIX07

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			m, n: GSL_MATRIX_REAL_64
		do
			m := {GSL_MATRIX_REAL_64 3, 4, << 1.1, 1.2, 1.3, 1.4;
												 2.1, 2.2, 2.3, 2.4;
												 3.1, 3.2, 3.3, 3.4
											 >>}

			create n.make(3, 4)
			n.put(1.1, 0, 0)
			n.put(1.2, 0, 1)
			n.put(1.3, 0, 2)
			n.put(1.4, 0, 3)
			n.put(2.1, 1, 0)
			n.put(2.2, 1, 1)
			n.put(2.3, 1, 2)
			n.put(2.4, 1, 3)
			n.put(3.1, 2, 0)
			n.put(3.2, 2, 1)
			n.put(3.3, 2, 2)
			n.put(3.4, 2, 3)

			assert(m.is_equal(n))
			assert(n.is_equal(m))
		end

end -- TEST_MATRIX07
