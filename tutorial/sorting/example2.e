class EXAMPLE2
   --
   -- Yes it is easy to sort any COLLECTION :
   --
   --            compile -o example2 -boost example2
   --

create {ANY}
   make

feature {ANY}
   make
      local
         c: COLLECTION[STRING]; sorter: COLLECTION_SORTER[STRING]; reverse_sorter: REVERSE_COLLECTION_SORTER[STRING]
      do
         c := {TWO_WAY_LINKED_LIST[STRING] << "dd", "bb", "aa", "cc" >> }
         io.put_string("My collection not sorted : ")
         print_collection(c)
         io.put_string("My sorted collection     : ")
         sorter.sort(c)
         print_collection(c)
         io.put_string("Reverse sorting          : ")
         reverse_sorter.sort(c)
         print_collection(c)
      end

feature {}
   print_collection (c: COLLECTION[STRING])
      local
         i: INTEGER
      do
         from
            i := c.lower
         until
            i > c.upper
         loop
            io.put_string(c.item(i))
            io.put_character(' ')
            i := i + 1
         end
         io.put_character('%N')
      end

end -- class EXAMPLE2
