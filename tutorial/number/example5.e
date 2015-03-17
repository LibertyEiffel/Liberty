class EXAMPLE5
   --
   -- Using the NUMBER_TOOLS parser.
   --

create {ANY}
   make

feature {}
   make
      local
         stop: BOOLEAN; formula: STRING
      do
         from
         until
            stop
         loop
            io.put_string(once "[
                Type Q to quit or ...
                Enter your NUMBER formula on a single line:

                      ]")
            io.read_line
            formula := io.last_string.twin
            if formula.is_empty then
               stop := True
            else
               if formula.count = 1 then
                  inspect
                     formula.first
                  when 'Q', 'q' then
                     stop := True
                  else
                  end
               end
               if not stop then
                  parsing_of(formula)
               end
            end
         end
         io.put_string("Bye.%N")
      end

   parsing_of (formula: STRING)
      local
         number_tools: NUMBER_TOOLS; number: NUMBER; i: INTEGER
      do
         if number_tools.is_number(formula) then
            number := number_tools.from_string(formula)
            if number /= Void then
               io.put_string(once "=%N")
               io.put_number(number)
               if number.is_fraction_general_number and then number.fit_real then
                  io.put_string(once " (")
                  io.put_real(number.force_to_real_64)
                  io.put_character(')')
               end
               io.put_new_line
            else
               io.put_string(once "Error: ")
               print_error(number_tools.parser_buffer.last_error)
            end
         else
            io.put_string(once "Syntax error: ")
            print_error(number_tools.parser_buffer.last_error)
            io.put_line(formula)
            from
               i := 1
            until
               i = number_tools.parser_buffer.current_index
            loop
               io.put_character(' ')
               i := i + 1
            end

            io.put_string(once "^%N")
         end
      end

   print_error (error: PARSE_ERROR)
      require
         error /= Void
      local
         err: PARSE_ERROR
      do
         from
            err := error
         until
            err = Void
         loop
            io.put_line(err.message)
            err := err.next
         end
      end

end -- class EXAMPLE5
