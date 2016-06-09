class PRINT_POSITION
--
-- Little tool to view a POSITION while debugging.
--

insert
   ARGUMENTS

create {}
   make

feature {ANY}
   make
      local
         position: POSITION; integer_32: INTEGER_32

      do
         if (not argument_count.in_range(1, 2)) or else not argument(1).is_integer then
            io.put_string(once "Usage: print_position <IntegerManglingofPosition> [*.id]")
            die_with_code(exit_failure_code)
         end
         integer_32 := argument(1).to_integer
         position.set_from_integer_32(integer_32)
         io.put_string(once "Line ")
         io.put_string(position.line.to_string)
         io.put_string(once " column ")
         io.put_string(position.column.to_string)
         io.put_string(once " of ")
         --|*** Should use the second argument... to do *** (Dom. december 7th 2004). ***
         io.put_string(position.id.to_string)
         io.put_new_line
      end

end
