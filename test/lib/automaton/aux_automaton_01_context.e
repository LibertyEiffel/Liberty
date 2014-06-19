class AUX_AUTOMATON_01_CONTEXT

create {AUX_AUTOMATON_01}
   make

feature {AUX_AUTOMATON_01}
   output: FIXED_STRING
      do
         Result := output_memory.intern
      end

   extend
      do
         output_memory.extend(current_character)
      ensure
         output.count = old (output.count + 1)
         output.last = current_character
      end

   current_character: CHARACTER
      require
         not is_off
      do
         Result := input.item(index)
      end

   next
      do
         index := index + 1
      end

   is_off: BOOLEAN
      do
         Result := not input.valid_index(index)
      end

   success: BOOLEAN

   set_success (s: BOOLEAN)
      do
         success := s
      ensure
         success = s
      end

feature {}
   make (a_string: ABSTRACT_STRING)
      require
         a_string /= Void
      do
         input := a_string.intern
         output_memory := ""
         index := input.lower - 1
      end

   input: FIXED_STRING
   output_memory: STRING
   index: INTEGER

end
