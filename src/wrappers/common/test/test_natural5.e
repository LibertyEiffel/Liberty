class TEST_NATURAL5
	
inherit
   EIFFELTEST_TOOLS

create {ANY} make

feature {ANY}
	make is
		local
			n0, n1: NATURAL_8
		do
			n0.make_from_signed(5)

			n1.make_from_signed(2)
			assert(((n0 / n1) - 2.5).abs < 0.0000001)
		end
end
