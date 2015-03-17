class TEST_IMPLICIT_TUPLE_02

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         printf
      end

   printf (arg: TUPLE)
      do
         assert(arg.count = 0)
         assert(arg.out.is_equal("[]"))
      end

end
