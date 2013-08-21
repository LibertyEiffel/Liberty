class BAD_ADDRESS_OF4

create {}
   main

feature {}
   main is
      local
         pointer: POINTER
      do
         pointer := $constant_attribute
      end

   constant_attribute: INTEGER is 4

end
