class TEST_ALIAS_01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
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

         assert(a[0] = -42)
         assert(a[1] = -21)

         a[1] := 12
         assert(a[1] = 12)
         assert(a[2] = 6)
         assert(a[0] = 24)
      end

end
