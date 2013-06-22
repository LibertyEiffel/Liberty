class TEST_NATURAL3

inherit
   EIFFELTEST_TOOLS

create {ANY}
   make

feature {ANY}
   make is
      local
         n0: NATURAL_8
      do
         n0.make_from_signed(4)
         assert(n0.one + n0.one + n0.one + n0.one = n0)

         assert(n0 + n0.zero = n0)
      end

end -- class TEST_NATURAL3
