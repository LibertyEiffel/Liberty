class TEST_ALIAS_01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         a, b: AUX_ALIAS_01
      do
         create a
         b := a + 18
         assert(a = b)
         assert(a.i = 18)
         b := a + 12
         assert(a = b)
         assert(a.i = 30)
         b := -a
         assert(a = b)
         assert(a.i = -30)
         b := a - 12
         assert(a = b)
         assert(a.i = -42)
      end

end
