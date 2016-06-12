class EXAMPLE1
   --
   -- How to do pattern matching with Liberty Eiffel:
   --
   --            compile -o example1 -boost example1
   --

create {ANY}
   make

feature {ANY}
   make
      local
         factory: REGULAR_EXPRESSION_BUILDER; number: REGULAR_EXPRESSION; tmp: STRING
      do
         factory.set_extended_legibility
         io.put_line(factory.has_extended_legibility.out)

         -- Create the regular expression from the pattern.
         number := factory.convert_perl_pattern("[
               [0-9]+ # one or more digits
         ]")
         check
         -- The given pattern is valid. Else, consult
         -- factory.last_error_message and factory.last_error_position
            number /= Void
         end
         io.put_string("Please write some text.%N")
         io.read_line
         -- Try if the pattern match some string
         if number.match(io.last_string) then
            io.put_string("There is a number in your text. Detected value is : ")
            tmp := ""
            -- Access to the matching text

            number.append_pattern_text(io.last_string, tmp)
            io.put_string(tmp)
            io.put_new_line
            -- Try to continue matching on the same string
            if number.match_next(io.last_string) then
               io.put_string("There is another number.%N")
            else
               io.put_string("There is no other number.%N")
            end
         else
            io.put_string("There is not any number in your text.%N")
         end
      end

end -- class EXAMPLE1
