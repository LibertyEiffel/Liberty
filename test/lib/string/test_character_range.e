class TEST_CHARACTER_RANGE

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   counter: INTEGER

   make is
      do
         generate(8, new_range, "")
         assert(counter = 26 ^ 8)
      end

   generate (depth: INTEGER; range: like new_range; buffer: STRING) is
      do
         if depth = 0 then
            debug
               std_output.put_line(buffer)
            end
         else
            from
               range.start
            until
               range.is_off
            loop
               buffer.extend(range.item)
               generate(depth - 1, new_range, buffer)
               buffer.remove_last
               range.next
            end
         end
      end

   new_range: ITERATOR[CHARACTER] is
      do
         Result := ('a' |..| 'z').new_iterator
      end

end -- class TEST_CHARACTER_RANGE
