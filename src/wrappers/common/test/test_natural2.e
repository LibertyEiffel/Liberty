class TEST_NATURAL2
	
inherit
   EIFFELTEST_TOOLS

create {ANY} make

feature {ANY}
	make is
		local
			n0, n1: NATURAL_8
		do
			n0.make_from_signed(0)
			assert(n0 = n0.zero)

			n1.make_from_signed(1)
			assert(n1 = n0.one)
			
		end
end
