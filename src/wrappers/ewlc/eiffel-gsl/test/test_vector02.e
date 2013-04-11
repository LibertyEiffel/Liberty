class TEST_VECTOR02

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			m: GSL_VECTOR_REAL_64
		do
			create m.make_zero(5)

			m.put(1.0, 0)
			m.put(2.0, 1)
			m.put(3.0, 2)
			m.put(4.0, 3)
			m.put(5.0, 4)

			assert(m.item(0) = 1.0)
			assert(m.item(1) = 2.0)
			assert(m.item(2) = 3.0)
			assert(m.item(3) = 4.0)
			assert(m.item(4) = 5.0)
			
		end

end -- TEST_VECTOR02
