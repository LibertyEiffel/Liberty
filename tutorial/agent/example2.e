class EXAMPLE2
   --
   -- Actually, agents are available for all kinds of COLLECTION (i.e. ARRAY,
   -- FAST_ARRAY, LINKED_LIST, TWO_WAY_LINKED_LIST), but also for class SET
   -- as well as for class DICTIONARY.
   --

create {ANY}
   make

feature {ANY}
   make
      local
         my_collection: COLLECTION[STRING]; my_list: LINKED_LIST[STRING]; my_set: SET[STRING]
      do
         my_collection := {ARRAY[STRING] 1, << "Benedicte", "Lucien", "Marie" >> }
         create my_list.make
         -- Using an agent to fill `my_list' using `my_collection':
         my_collection.for_each(agent my_list.add_last(?))
         create {HASHED_SET[STRING]} my_set.make
         -- Using an agent to fill `my_set' with `my_list':
         my_list.for_each(agent my_set.add(?))
         -- Using an agent to print `my_set':
         my_set.for_each(agent print_item(?))
      end

feature {}
   print_item (item: STRING)
      do
         std_output.put_string(item)
         std_output.put_character('%N')
      end

end -- class EXAMPLE2
