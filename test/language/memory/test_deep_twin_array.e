class TEST_DEEP_TWIN_ARRAY
   --
   -- Test the basic functionality of deep_twin
   --

insert
   EIFFELTEST_TOOLS

create {ANY}
   make

feature {ANY}
   make
      local
         foo, bar: STRING
         str_arr, str_twin, str_deep_twin: ARRAY[STRING]
      do
         foo := "text1"
         bar := "bar"

         -- let's create an array with some strings in it
         str_arr := {ARRAY[STRING] 1, << foo, bar >> }

         str_twin := str_arr.twin
         str_deep_twin := str_arr.deep_twin
         
         str_arr.item(1).clear_count
         str_arr.item(1).append("text2")

         assert(foo.is_equal("text2"))
         assert(str_arr.item(1).is_equal("text2"))
         assert(str_twin.item(1).is_equal("text2"))
         assert(str_twin.item(1) = str_arr.item(1))

         assert(str_deep_twin.item(1).is_equal("text1"))
         assert(str_deep_twin.item(1) /= str_arr.item(1))

      end

end -- class TEST_DEEP_TWIN_ARRAY
