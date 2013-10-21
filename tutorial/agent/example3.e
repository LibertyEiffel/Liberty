class EXAMPLE3
   --
   -- In the DICTIONARY class, the `do_all' feature has an agent argument wich is
   -- a routine with two arguments, one for the value (type `V') and one for
   -- the key (type `K').
   --

create {ANY}
   make

feature {ANY}
   make is
      local
         my_array: ARRAY[STRING]
      do
         my_array := {ARRAY[STRING] 1, << "Benedicte", "Lucien", "Marie" >> }
         create my_dictionary.make
         -- Using an agent to fill `my_dictionary' with `my_array':
         my_array.do_all(agent fill_it(?))
         -- Using another agent to print `my_dictionary':
         my_dictionary.do_all(agent print_key_value(?, ?))
      end

feature {}
   my_dictionary: HASHED_DICTIONARY[INTEGER, STRING]

   fill_it (value: STRING) is
      do
         my_dictionary.put(next_key, value)
      end

   next_key: INTEGER is
      do
         counter.increment
         Result := counter.item
      end

   counter: COUNTER is
      once
         create Result
      end

   print_key_value (key: INTEGER; value: STRING) is
      do
         std_output.put_integer(key)
         std_output.put_character(' ')
         std_output.put_string(value)
         std_output.put_character('%N')
      end

end -- class EXAMPLE3
