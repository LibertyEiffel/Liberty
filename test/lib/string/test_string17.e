class TEST_STRING17
   -- Test append after removing a charater at beginning and at the end of the string
insert EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         foo("-123456-","78")
      end

   foo (a,b: ABSTRACT_STRING)
      local x: STRING; l,m: INTEGER_32
      do
         l := a.count; m:= b.count
         create x.make_from_string(a)
         assert(x.count=l)
         x.remove_first
         assert(x.count=l-1)
         --x.remove_last
         --assert(x.count=l-1)
         x.append(b)
         print("'"+x+"' is "+x.count.to_string+" characters long%N")
         assert(x.count = l-1+m)
      end
end
