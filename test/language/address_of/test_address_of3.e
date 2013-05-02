class TEST_ADDRESS_OF3

insert
   EIFFELTEST_TOOLS
   
create {}
   main

feature {}
   main is
      local
         i: INTEGER
      do
         i := call_foo_with_pointer($foo)
         assert(i = 7)
      end

   foo: INTEGER is
      do
         Result := 7
      end

   call_foo_with_pointer (pointer: POINTER): INTEGER is
      external "C inline"
      alias "((int (*) (void*))$pointer)(C)"
      end

end
