class TEST_ASSIGN

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         a: AUX_DESIGN
      do
         create a
         a.item := 4
         assert(a.item = 4)
      end

end
