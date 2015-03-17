class TEST_CLOSURE03

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         run("foo")
      end

   run (a: STRING)
      local
         p: PROCEDURE[TUPLE[STRING]]
      do
         p := agent (i: STRING)
                 do
                    assert(a ~ "foo")
                    assert(i ~ "bar")
                 end (?)
         p.call(["bar"])
      end

end -- class TEST_CLOSURE03
