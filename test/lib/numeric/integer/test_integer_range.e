class TEST_INTEGER_RANGE

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         sum: INTEGER
      do
         sum := ({INTEGER 1} |..| {INTEGER 1000}).aggregate(agent add(?,?), 0)
         assert(sum = (1000*1001)//2)
      end

   add (a, b: INTEGER): INTEGER
      do
         Result := a + b
      end

end
