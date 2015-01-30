class TEST_CLOSURE02

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         a: INTEGER; p: PROCEDURE[TUPLE[INTEGER]]
      do
         p := agent (i: INTEGER)
                 do
                    assert(a = 3)
                    assert(i = 5)
                 end (?)
         a := 3
         p.call([{INTEGER 5}])
      end

end -- class TEST_CLOSURE02
