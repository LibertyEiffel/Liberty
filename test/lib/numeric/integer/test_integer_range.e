class TEST_INTEGER_RANGE

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         sum: INTEGER
      do
         sum := (1 |..| 1000).aggregate(agent add, 0)
         assert(sum = (1000*1001)//2)
      end

   add (a, b: INTEGER): INTEGER is
      do
         Result := a + b
      end

end
