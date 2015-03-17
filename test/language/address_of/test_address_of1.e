class TEST_ADDRESS_OF1

insert
   EIFFELTEST_TOOLS
   
create {}
   main

feature {}
   main
      do
         proc($function)
      end

   function: INTEGER
      do
      end

   proc (pointer: POINTER)
      do
         assert(pointer.is_not_null)
      end

end
