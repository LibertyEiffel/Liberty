class MEMORY_DEEP_TWIN
   --
   -- Here is a example on the usage of deep_twin
   --

create {ANY}
   main

feature {ANY}
   main
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

         -- as str_twin is only a shallow twin of str_arr, they 
         -- contain the references to the identical objects
         io.put_string(str_twin.item(1))
         io.put_new_line

         -- deep twin have nothing in commen anymore and also foo was twinned
         io.put_string(str_deep_twin.item(1))
         io.put_new_line

      end

end -- class MEMORY_DEEP_TWIN
