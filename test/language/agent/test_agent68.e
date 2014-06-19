class TEST_AGENT68

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   output: NULL_OUTPUT_STREAM
      once
         create Result
      end

   make
      local
         actions: FAST_ARRAY[TUPLE[STRING, PROCEDURE[TUPLE]]]
         i: INTEGER
      do
         create actions.make(0)
         actions.add_last(["one", agent say("hello")])
         actions.add_last(["two", agent say("world")])
         from
            i := actions.lower
         until
            i > actions.upper
         loop
            output.put_string(actions.item(i).first)
            output.put_character('%T')
            actions.item(i).second.call([])
            i := i + 1
         end
      end

   say (something: STRING)
      do
         output.put_line(something)
      end

end
