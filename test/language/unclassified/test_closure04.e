class TEST_CLOSURE04

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         a: INTEGER; p: PROCEDURE[TUPLE]
      do
         p := agent
                 local
                    i: INTEGER
                 do
                    i := a
                    assert(i = 3)
                 end
         a := 3
         p.call([])
      end

end -- class TEST_CLOSURE04
