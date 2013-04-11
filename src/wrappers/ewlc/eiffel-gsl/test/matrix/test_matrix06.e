class TEST_MATRIX06

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			m, n: GSL_MATRIX_REAL_64
			i, j: INTEGER_32
		do
			create m.from_model({LINKED_LIST[COLLECTION[REAL_64]] <<
										{ARRAY[REAL_64] 3, << 1.1, 1.2, 1.3, 1.4>>},
										{FAST_ARRAY[REAL_64] << 2.1, 2.2, 2.3, 2.4>>},
										{LINKED_LIST[REAL_64] << 3.1, 3.2, 3.3, 3.4>>}
										>>})

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

			from
				i := 0
			until
				i > m.upper1
			loop
				from
					j := 0
				until
					j > m.upper2
				loop
					assert(m.item(i, j) = n.item(i, j))
					j := j + 1
				end
				i := i + 1
			end

			assert(m.is_equal(n))
			assert(n.is_equal(m))
			
			n.put(3.5, 2, 3)
			assert(not m.is_equal(n))
			assert(not n.is_equal(m))
		end

end -- TEST_MATRIX06
