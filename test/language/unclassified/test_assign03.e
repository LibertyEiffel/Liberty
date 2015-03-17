class TEST_ASSIGN03

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         a: AUX_ASSIGN03A
      do
         create {AUX_ASSIGN03B} a
         a.item := 4
         assert(a.item = 4)
      end

end
