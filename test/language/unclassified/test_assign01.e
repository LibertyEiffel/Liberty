class TEST_ASSIGN01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         a: AUX_ASSIGN01
      do
         create a
         a.item := 4
         assert(a.item = 4)
      end

end
