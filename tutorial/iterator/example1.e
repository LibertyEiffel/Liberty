class EXAMPLE1
   --
   -- Using ITERATOR allows the user to traverse any aggregate object
   -- in a more abstract way.
   --

create {ANY}
   make

feature {ANY}
   my_loop (type: STRING; my_iterator: ITERATOR[CHARACTER])
      local
         element: CHARACTER
      do
         io.put_string("Loop on ")
         io.put_string(type)
         io.put_string(": ")
         from
            my_iterator.start
         until
            my_iterator.is_off
         loop
            element := my_iterator.item
            io.put_character(element)
            my_iterator.next
         end

         io.put_new_line
      end

feature {}
   make
      do
         use_iterator_on_string
         use_iterator_on_array
         use_iterator_on_fixed_array
         use_iterator_on_linked_list
         use_iterator_on_two_way_linked_list
         io.put_string("Do you like ITERATORs ?%N")
         io.put_string("So let's see what happends with a DICTIONARY.%N")
         use_iterator_on_dictionary
         io.put_string("And this is not a bug!%N")
      end

   use_iterator_on_string
      local
         iterator: ITERATOR[CHARACTER]
      do
         iterator := ("foo").new_iterator
         my_loop("STRING", iterator)
      end

   use_iterator_on_array
      local
         iterator: ITERATOR[CHARACTER]
      do
         iterator := {FAST_ARRAY[CHARACTER] << 'b', 'a', 'r' >> }.new_iterator
         my_loop("ARRAY", iterator)
      end

   use_iterator_on_fixed_array
      local
         iterator: ITERATOR[CHARACTER]; my_fa: FAST_ARRAY[CHARACTER]
      do
         create my_fa.with_capacity(4)
         my_fa.add_last('f')
         my_fa.add_last('O')
         my_fa.add_last('o')
         iterator := my_fa.new_iterator
         my_loop("FAST_ARRAY", iterator)
      end

   use_iterator_on_linked_list
      local
         iterator: ITERATOR[CHARACTER]; ll: LINKED_LIST[CHARACTER]
      do
         create ll.make
         ll.add_last('B')
         ll.add_last('a')
         ll.add_last('R')
         iterator := ll.new_iterator
         my_loop("LINKED_LIST", iterator)
      end

   use_iterator_on_two_way_linked_list
      local
         iterator: ITERATOR[CHARACTER]; twll: TWO_WAY_LINKED_LIST[CHARACTER]
      do
         create twll.make
         twll.add_last('F')
         twll.add_last('o')
         twll.add_last('O')
         iterator := twll.new_iterator
         my_loop("TWO_WAY_LINKED_LIST", iterator)
      end

   use_iterator_on_dictionary
      local
         iterator: ITERATOR[CHARACTER]; d: DICTIONARY[CHARACTER, CHARACTER]
      do
         create {HASHED_DICTIONARY[CHARACTER, CHARACTER]} d.make
         d.put('o', 'B')
         d.put('f', 'a')
         d.put('O', 'R')
         iterator := d.new_iterator_on_items
         my_loop("DICTIONARY (items)", iterator)
         iterator := d.new_iterator_on_keys
         my_loop("DICTIONARY (keys)", iterator)
      end

end -- class EXAMPLE1
