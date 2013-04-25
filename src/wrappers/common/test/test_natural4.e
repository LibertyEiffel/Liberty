class TEST_NATURAL4
	
inherit
   EIFFELTEST_TOOLS

create {ANY} make

feature {ANY}
	make is
		local
			n0, n1: NATURAL_8
		do
			n0.make_from_signed(4)

			n1 := {NATURAL_8 4, << 0 >>}

			assert(n0 = n1)
		end
end
