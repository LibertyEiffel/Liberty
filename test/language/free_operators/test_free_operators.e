class TEST_FREE_OPERATORS
   --
   -- Test free operators
   --
insert
   EIFFELTEST_TOOLS
create {ANY}
   make

feature {ANY}
   make
      do
         assert (a + 42)
         assert (b - 12)
         assert (a * 11)
         assert (a | 11)
         assert (b & 99)
         assert (#b)
         -- Following are commented code that is
         -- syntactically correct but that it is rejectecd
         -- by current version of the compier
         assert (+b)
         assert (not -b)
         -- print( (*b).to_string)
      end

   a, b: AUX_OPERATORS

end -- class TEST_FREE_OPERATORS
