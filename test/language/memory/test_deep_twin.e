class TEST_DEEP_TWIN
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
         foo: STRING
         aux, aux_twin, aux_deep_twin: AUX_DEEP_TWIN
      do
         foo := "text1"

         -- let's create an array with some strings in it
         create aux.make(foo)

         aux_twin := aux.twin
         aux_deep_twin := aux.deep_twin
         
         aux.item.clear_count
         aux.item.append("text2")

         assert(foo.is_equal("text2"))
         assert(aux.item.is_equal("text2"))
         assert(aux_twin.item.is_equal("text2"))
         assert(aux_twin.item = aux.item)

         assert(aux_deep_twin.item.is_equal("text1"))
         assert(aux_deep_twin.item /= aux.item)

      end

end -- class TEST_DEEP_TWIN
