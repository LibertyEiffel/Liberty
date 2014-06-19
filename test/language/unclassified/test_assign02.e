class TEST_ASSIGN02

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         a: AUX_ASSIGN02
      do
         create a
         a + 2 := 4
         assert(a + 2 = 4)
         assert(a + 1 = 0)
         a + 1 := 42
         assert(a + 1 = 42)
      end

end
