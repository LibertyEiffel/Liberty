class TEST_FAST_ARRAY6
-- From: dubois.georges@numericable.fr
   
insert
   EIFFELTEST_TOOLS
   
create {}
   main
   
feature {ANY}
   a: FAST_ARRAY[INTEGER]
   
   j: INTEGER
   
   main
      local
         i: INTEGER
      do
         create a.with_capacity(6)
         from
            i := 0
         until
            i > 5
         loop
            a.add_last(i)
            i := i + 1
         end
         j := 2
         from
            i := 0
         until
            i >  2
         loop
            assert(item1(i) = item2(i))
            i := i + 1
         end
      end
   
   item1(i: INTEGER): INTEGER
      do
         Result := a.item(1 + (i*j))
      end
   
   item2(i: INTEGER): INTEGER
         -- same as item1 
      do
         Result := a.item((i*j) + 1)
      end
   
end
