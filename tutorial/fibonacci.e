class FIBONACCI

insert
   ARGUMENTS

create {ANY}
   make

feature {ANY}
   make
      do
         if argument_count /= 1 or else not argument(1).is_integer then
            io.put_string("Usage: ")
            io.put_string(argument(0))
            io.put_string(" <Integer_value>%N")
            die_with_code(exit_failure_code)
         end
         io.put_integer(fibonacci(argument(1).to_integer))
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
