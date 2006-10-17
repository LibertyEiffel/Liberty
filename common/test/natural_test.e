class NATURAL_TEST
	
inherit
   EIFFELTEST_TOOLS

creation make

feature
	make is
		local
			n1, n2, n3, n4, n5, n6, n7, n10: NATURAL_8
		do
			n1.make_from_signed(1)
			n2.make_from_signed(2)
			n3.make_from_signed(100)
			n4 := n3
			n5 := n3 + n4
			n10.make_from_signed(10)
			n6 := n3 // n10
			n7 := n3 \\ n10
			assert(n6 = n10)
			assert(n7 = n10)
			assert((n1 + n2).to_integer_32 = 3)
			print(n1.out)
			print("%N")
			print(n2.out)
			print("%N")
			print(n5.out)
			print("%N")
		end
end
