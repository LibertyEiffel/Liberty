class TEST_VECTOR07

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			m, n: GSL_VECTOR_REAL_32
		do
			create m.make_zero(2)
			create n.make_zero(2)

			m.put({REAL_32 1.0}, 0)
			m.put({REAL_32 2.0}, 1)

			n.put({REAL_32 1.0}, 0)
			n.put({REAL_32 2.0}, 1)

			assert(m.dot(n) = 5)
			assert(m.dot(n) = n.dot(m))
			
		end

end -- TEST_VECTOR07
