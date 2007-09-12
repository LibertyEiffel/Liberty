class TEST_NATURAL
	
inherit
	EIFFELTEST_TOOLS

creation dummy, make

feature
	make is
		local
			n0, n1, n2, n3, n4, n5, n6, n7, n8, n10: NATURAL_8
		do
			n0.make_from_signed(0)
			assert(n0 = n0.zero)
			n1.make_from_signed(1)
			n2.make_from_signed(2)
			n3.make_from_signed(100)
			assert(n1 = n1)
			assert(n1 + n1 = n2)
			assert(n1 < n2)
			assert(n1 <= n2)
			assert(n2 >= n2)
			assert(n2 >= n1)
			assert(n2 > n1)
			assert(n3 > n2)
			assert(n3 = n3)
			
			n4 := n3
			n5 := n3 + n4
			assert(n5 > n3)
			assert(n5 >= n4)
			assert(n5 >= n4 + n3)
			assert(n5 <= n4 + n3)

			assert(n0 = n0)
			assert(not (n1 = n0))
			assert(not (n0 = n1))
			assert(n0 < n1)
			assert(not (n1 < n0))
			assert(n0 <= n1)
			assert(n1 > n0)
			assert(n1 >= n0)
			
			n8 := n3 + n0
			
			n10.make_from_signed(10)
			n6 := n3 // n10
			n7 := n3 \\ n10
			assert(n6 = n10)
			assert(n7 = (n1 - n1))
			assert((n1 + n2).to_integer_32 = 3)
			assert(n1.out.is_equal("1"))
			assert(n2.out.is_equal("2"))
			assert(n5.out.is_equal("200"))
		end
end
