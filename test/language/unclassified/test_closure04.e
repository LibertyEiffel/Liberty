class TEST_CLOSURE04

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         a: INTEGER; p: PROCEDURE[TUPLE]
      do
         p := agent is
                 local
                    i: INTEGER
                 do
                    i := a
                    assert(i = 5)
                 end
         a := 3
         p.call([])
      end

end -- class TEST_CLOSURE04
