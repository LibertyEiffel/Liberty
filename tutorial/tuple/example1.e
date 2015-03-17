class EXAMPLE1
   --
   -- To start with TUPLE, just compile an run it :
   --
   --            compile -o example1 -boost example1
   --

create {ANY}
   make

feature {ANY}
   make
      local
         my_tuple: TUPLE[INTEGER_8, STRING, REAL]
      do
         -- Creation of a new TUPLE:
         my_tuple := [2, "Lucien", 6.5] -- Accessing:
         io.put_string("my_tuple.count = ")
         io.put_integer(my_tuple.count)
         io.put_string("%Nmy_tuple.item_1 = ")
         io.put_integer(my_tuple.item_1)
         io.put_string("%Nmy_tuple.item_2 = ")
         io.put_string(my_tuple.item_2)
         io.put_string("%Nmy_tuple.item_3 = ")
         io.put_real(my_tuple.item_3)
         -- Writing:
         my_tuple.set_item_1(3)
         my_tuple.set_item_2("Marie")
         my_tuple.set_item_3(4.5)
         -- Accessing:
         io.put_string("%Nmy_tuple.item_1 = ")
         io.put_integer(my_tuple.item_1)
         io.put_string("%Nmy_tuple.item_2 = ")
         io.put_string(my_tuple.item_2)
         io.put_string("%Nmy_tuple.item_3 = ")
         io.put_real(my_tuple.item_3)
         io.put_string("[
         To know more about TUPLEs, have a look at example #2.

         ]")
      end

end -- class EXAMPLE1
