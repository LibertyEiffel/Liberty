class EXAMPLE3
   --
   -- To start with NUMBERs, just compile and run it :
   --
   --            compile -o example3 -boost example3
   --

insert
   ARGUMENTS

create {ANY}
   make

feature {ANY}
   make
      local
         n: NUMBER; s: STRING
      do
         if argument_count = 0 then
            io.put_string("[
               You are supposed to pass some argument to this command
               in order to compute factorial for this argument.
               As an example, if you pass 50 as an argument, it gives:

                           ]")
            n := 50.to_number
         else
            s := argument(1)
            if s.is_number then
               n := s.to_number
               if not n.is_integer_general_number then
                  io.put_number(n)
                  io.put_string(" : this is not an integer !%N")
                  die_with_code(exit_failure_code)
               end

               if n @< 0 then
                  io.put_number(n)
                  io.put_string(" : this is not a positive integer !%N")
                  die_with_code(exit_failure_code)
               end
            else
               io.put_string(s)
               io.put_string(" : this is not a number !%N")
               die_with_code(exit_failure_code)
            end
         end
         compute_factorial(n)
      end

   compute_factorial (n: NUMBER)
      do
         io.put_character('(')
         io.put_number(n)
         io.put_string(").factorial = ")
         io.put_number(n.factorial)
         io.put_character('%N')
      end

end -- class EXAMPLE3
