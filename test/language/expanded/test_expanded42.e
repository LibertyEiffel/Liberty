class TEST_EXPANDED42
   --
   -- Try to print an ARRAY of expanded values
   --

insert EIFFELTEST_TOOLS redefine default_create end

create {ANY} default_create -- make

feature {ANY}

   default_create -- make
      local
         foo, bar: AUX_EXPANDED40_EXP -- an empty expanded class
         -- array, a_twin, a_deep_twin: ARRAY[AUX_EXP]
      do
         -- foo.set_value(42)         -- foo.value := 42
         -- bar.set_value(97)

         -- create array.make(1,2) -- instead of array := << foo, bar >>
         (<< foo, bar >> ).print_on(io)
         io.put_new_line
      end

end -- class TEST_EXP_ARRAY
