class EXAMPLE4
   --
   -- The target itself can be an open operand:
   --

create {ANY}
   make

feature {ANY}
   make
      local
         my_array: ARRAY[FRUIT]
      do
         my_array := {ARRAY[FRUIT] 1, << create {PEACH}, create {APPLE} >> }
         my_array.for_each(agent {FRUIT}.display)
      end

end -- class EXAMPLE4
