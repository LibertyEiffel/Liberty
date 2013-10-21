class PROLOG_PARSER

create {ANY}
   make

feature {ANY}
   make (b: like base) is
      do
         base := b
         state := 0
         create stack_of_states.with_capacity(10)
      end

   put_line (s: STRING) is
      do
         put_string(s)
         put_character('%N')
      end

   put_string (s: STRING) is
      local
         i: INTEGER
      do
         from
            i := s.lower
         until
            i > s.upper
         loop
            put_character(s.item(i))
            i := i + 1
         end
      end

   put_character (c: CHARACTER) is
      do
         inspect
            state
         when 0 then
         else
         end
      end

   base: PROLOG_DATABASE

   state: INTEGER

   stack_of_states: FAST_ARRAY[like state]

end -- class PROLOG_PARSER
