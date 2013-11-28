class TEST_CLOSURE03

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      do
         run("foo")
      end

   run (a: STRING) is
      local
         p: PROCEDURE[TUPLE[STRING]]
      do
         p := agent (i: STRING) is
                 do
                    assert(a ~ "foo")
                    assert(i ~ "bar")
                 end (?)
         p.call(["bar"])
      end

end -- class TEST_CLOSURE03
