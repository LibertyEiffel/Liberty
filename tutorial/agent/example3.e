class EXAMPLE3
   --
   -- In the DICTIONARY class, the `for_each' feature has an agent argument
   -- which is a procedure with two arguments, one for the value (type `V') and
   -- one for the key (type `K').
   --

create {ANY}
   make

feature {ANY}
   make
      local
         my_array: ARRAY[STRING]
      do
         my_array := {ARRAY[STRING] 1, << "Benedicte", "Lucien", "Marie" >> }
         create my_dictionary.make
         -- Using an agent to fill `my_dictionary' with `my_array':
         my_array.for_each(agent fill_it(?))
         -- Using another agent to print `my_dictionary':
         my_dictionary.for_each(agent print_key_value(?, ?))
      end

feature {}
   my_dictionary: HASHED_DICTIONARY[INTEGER, STRING]

   fill_it (value: STRING)
      do
         my_dictionary.put(next_key, value)
      end

   next_key: INTEGER
      do
         counter.increment
         Result := counter.item
      end

   counter: COUNTER
      once
         create Result
      end

   print_key_value (key: INTEGER; value: STRING)
      do
         std_output.put_integer(key)
         std_output.put_character(' ')
         std_output.put_string(value)
         std_output.put_character('%N')
      end

end -- class EXAMPLE3
