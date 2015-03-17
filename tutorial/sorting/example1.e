class EXAMPLE1
   --
   -- Yes it is easy to sort any COLLECTION:
   --
   --            compile -o example1 -boost example1
   --

create {ANY}
   make

feature {ANY}
   make
      local
         c: COLLECTION[CHARACTER]; sorter: COLLECTION_SORTER[CHARACTER]
      do
         c := {FAST_ARRAY[CHARACTER] << 'z', 'a', 'X', 'y', 'Z' >> }
         io.put_string("My collection not sorted : ")
         print_collection(c)
         io.put_string("My sorted collection     : ")
         sorter.sort(c)
         print_collection(c)
         io.put_string("To know more about sorting, have a look at example #2.%N")
      end

feature {}
   print_collection (c: COLLECTION[CHARACTER])
      local
         i: INTEGER
      do
         from
            i := c.lower
         until
            i > c.upper
         loop
            io.put_character(c.item(i))
            io.put_character(' ')
            i := i + 1
         end
         io.put_character('%N')
      end

end -- class EXAMPLE1
