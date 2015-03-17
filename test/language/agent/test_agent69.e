class TEST_AGENT69

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         actions: FAST_ARRAY[TUPLE[STRING, PROCEDURE[TUPLE[STRING]]]]
         t: TUPLE[STRING]
         i: INTEGER
      do
         create actions.make(0)
         actions.add_last(["one", agent verify("one", ?)])
         actions.add_last(["two", agent verify("two", ?)])
         from
            i := actions.lower
         until
            i > actions.upper
         loop
            t := [actions.item(i).first]
            actions.item(i).second.call(t)
            i := i + 1
         end
      end

   verify (expected, actual: STRING)
      do
         assert(expected.is_equal(actual))
      end

end
