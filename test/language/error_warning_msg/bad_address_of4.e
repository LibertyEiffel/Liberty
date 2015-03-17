class BAD_ADDRESS_OF4

create {}
   main

feature {}
   main
      local
         pointer: POINTER
      do
         pointer := $constant_attribute
      end

   constant_attribute: INTEGER 4

end
