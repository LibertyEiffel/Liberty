class STRING_NODE

inherit
   BACKTRACKING_NODE

create {ANY}
   make

feature {ANY}
   value: STRING

   make (val: STRING) is
      do
         value := val
      ensure
         definition: value = val
      end

   explore (expander: EXPAND_EXPRESSION) is
      do
         expander.stack.add_last(value)
         expander.continue
      end

end -- class STRING_NODE
