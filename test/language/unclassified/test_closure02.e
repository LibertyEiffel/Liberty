class TEST_CLOSURE02

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         a: INTEGER; p: PROCEDURE[TUPLE[INTEGER]]
      do
         p := agent (i: INTEGER) is
                 do
                    assert(a = 3)
                    assert(i = 5)
                 end (?)
         a := 3
         p.call([5])
      end

end -- class TEST_CLOSURE02
