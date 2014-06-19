class TEST_LINKED_HASHED_DICTIONARY

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         dict: LINKED_HASHED_DICTIONARY[INTEGER, STRING]
         list_keys: FAST_ARRAY[STRING]
         list_items: FAST_ARRAY[INTEGER]
      do
         create dict.make
         dict.add(1, "first")
         dict.add(2, "second")
         dict.add(3, "third")

         create list_keys.make(0)
         dict.key_map_in(list_keys)
         assert(list_keys.item(0).is_equal("first"))
         assert(list_keys.item(1).is_equal("second"))
         assert(list_keys.item(2).is_equal("third"))

         create list_items.make(0)
         dict.item_map_in(list_items)
         assert(list_items.item(0) = 1)
         assert(list_items.item(1) = 2)
         assert(list_items.item(2) = 3)

         assert(dict.new_iterator_on_keys.for_all(agent check_list_keys(?, list_keys)))
         assert(dict.new_iterator_on_items.for_all(agent check_list_items(?, list_items)))
      end

   check_list_keys (key: STRING; list_keys: COLLECTION[STRING]): BOOLEAN
      do
         Result := list_keys.item(list_key_index).is_equal(key)
         list_key_index := list_key_index + 1
      end

   list_key_index: INTEGER

   check_list_items (item: INTEGER; list_items: COLLECTION[INTEGER]): BOOLEAN
      do
         Result := list_items.item(list_item_index) = item
         list_item_index := list_item_index + 1
      end

   list_item_index: INTEGER

end
