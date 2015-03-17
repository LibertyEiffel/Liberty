class TEST_ADDRESS_OF4
--
-- Accessing attribute (read/write).
--

insert
   EIFFELTEST_TOOLS
   
create {}
   main

feature {}
   field: INTEGER
   
   main
      do
         assert(field = 0)
         write_attribute1($field, 3)
         assert(field = 3)
         write_attribute2($field, 3)
         assert(field = 6)
      end

   write_attribute1 (pointer: POINTER; value: INTEGER)
      external "C inline"
      alias "*((int*)$pointer)=$value"
      end

   write_attribute2 (pointer: POINTER; value: INTEGER)
      require
         pointer.is_not_null
         value = 3
      external "C inline"
      alias "*((int*)$pointer)+=$value"
      end

end
