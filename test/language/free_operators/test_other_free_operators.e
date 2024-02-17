class TEST_OTHER_FREE_OPERATORS
   --
   -- Test free operators that are legal but are rejectecd by current version
   -- of the compiler (2024-02)
   --
insert
   EIFFELTEST_TOOLS
create {ANY}
   make

feature {ANY}
   make
      local r: BOOLEAN
      do
         -- assert (a§b)
         assert (a <-< b)
         assert (a -> b)
         assert (a >> b)
         assert (a << b )
      end

   a, b: FREE_OPERATORS

end -- class TEST_FREE_OPERATORS
