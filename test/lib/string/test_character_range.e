class TEST_CHARACTER_RANGE

insert
   ARGUMENTS
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   power: INTEGER
   counter: INTEGER

   make
      do
         if argument_count > 0 and then argument(1).is_integer then
            power := argument(1).to_integer
            debug
               io.put_line("power is #(1)" # &power)
            end
         else
            power := 4
         end
         generate(power, range.new_iterator, "")
         assert(counter = range.count ^ power)
      end

   generate (depth: INTEGER; it: ITERATOR[CHARACTER]; buffer: STRING)
      do
         assert(buffer.count = power - depth)
         if depth = 0 then
            counter := counter + 1
         else
            from
               it.start
            until
               it.is_off
            loop
               buffer.extend(it.item)
               generate(depth - 1, range.new_iterator, buffer)
               buffer.remove_last
               it.next
            end
         end
      end

   range: ITERABLE[CHARACTER]
      once
         Result := 'a' |..| 'z'
      end

end -- class TEST_CHARACTER_RANGE
