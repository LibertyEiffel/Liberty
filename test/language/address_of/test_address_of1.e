class TEST_ADDRESS_OF1

insert
   EIFFELTEST_TOOLS
   
create {}
   main

feature {}
   main is
      do
         proc($function)
      end

   function: INTEGER is
      do
      end

   proc (pointer: POINTER) is
      do
         assert(pointer.is_not_null)
      end

end
