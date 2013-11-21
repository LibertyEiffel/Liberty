class TEST_CLOSURE03

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      do
         run(3)
      end

   run (a: INTEGER) is
      local
         p: PROCEDURE[TUPLE[INTEGER]]
      do
         p := agent (i: INTEGER) is
                 do
                    assert(a = 3)
                    assert(i = 5)
                 end (?)
         p.call([5])
      end

end -- class TEST_CLOSURE03
