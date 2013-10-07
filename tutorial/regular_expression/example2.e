class EXAMPLE2
   --
   -- How to do substitution with SmartEiffel:
   --
   --            compile -o example2 -boost example2
   --

create {ANY}
   make

feature {ANY}
   make is
      local
         factory: REGULAR_EXPRESSION_BUILDER; se: REGULAR_EXPRESSION
      do
         -- Use "SmartEiffel" as spelling.
         -- Create the regular expression from the pattern.
         se := factory.convert_posix_pattern("[sS]mart.?[eE]iffel")
         check
         -- The given pattern is valid. Else, consult
         -- factory.last_error_message and factory.last_error_position
            se /= Void
         end
         -- Defines the substitution
         se.prepare_substitution("SmartEiffel")
         check
         -- This substitution pattern is valid!
            se.substitution_pattern_ready
         end
         io.put_string("Please write some text.%N")
         io.read_line
         -- Translate to the good speeling.
         se.substitute_all_in(io.last_string)
         io.put_string("The good spelling is: ")
         io.put_string(io.last_string)
         io.put_new_line
      end

end -- class EXAMPLE2
