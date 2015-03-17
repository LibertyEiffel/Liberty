class FIBONACCI

insert
   ARGUMENTS

create {ANY}
   make

feature {ANY}
   make
      local
         arg: STRING
      do
         if argument_count = 0 then
            std_input.read_line
            arg := std_input.last_string
         elseif argument_count = 1 then
            arg := argument(1)
         end
         if not arg.is_integer then
            std_error.put_line("Expecting an integer")
            die_with_code(exit_failure_code)
         end
         io.put_integer(fibonacci(arg.to_integer))
         io.put_new_line
      end

   fibonacci (i: INTEGER): INTEGER
      require
         i >= 0
      do
         if i < 2 then
            Result := i
         else
            Result := fibonacci(i - 2) + fibonacci(i - 1)
         end
      end

end -- class FIBONACCI
