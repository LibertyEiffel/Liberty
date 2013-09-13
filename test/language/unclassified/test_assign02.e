class TEST_ASSIGN02

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         a: AUX_ASSIGN02
      do --| **** TODO: those kinds of assign expressions are not yet supported
         create a
         --a + 2 := 4
         --assert(a + 2 = 4)
         assert(a + 1 = 0)
         --a + 1 := 42
         --assert(a + 1 = 42)
      end

end
