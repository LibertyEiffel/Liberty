class EXAMPLE2
   --
   -- To start with TUPLE, just compile an run it :
   --
   --            compile -o example2 -boost example2
   --

create {ANY}
   make

feature {ANY}
   make
      local
         my_large_tuple: TUPLE[INTEGER_8, STRING, INTEGER, CHARACTER, STRING, CHARACTER]
      do
         -- Creation of a new TUPLE:
         my_large_tuple := [1, "Two", {INTEGER_32 3}, '4', "Five", '6']
         -- Accessing:

         io.put_string("my_large_tuple.count = " + my_large_tuple.count.to_string + ": [" + my_large_tuple.item_1.to_string + ", " + my_large_tuple.item_2 + ", " + my_large_tuple.item_3.to_string + ", " + my_large_tuple.item_4.to_string + ", " + my_large_tuple.item_5 + ", " + my_large_tuple.item_6.to_string + "]%N")
         -- Writing:
         my_large_tuple.set_item_1(0)
         my_large_tuple.set_item_2(Void)
         my_large_tuple.set_item_3(0)
         my_large_tuple.set_item_4('0')
         my_large_tuple.set_item_5(Void)
         my_large_tuple.set_item_6('0')
         io.put_string("[
         To know more about TUPLEs, have a look at tuple.e file and keep in mind
         that a TUPLE is not an array !

         ]")
      end

end -- class EXAMPLE2
