class TEST_REPLACING

insert
        EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         x: ABSTRACT_STRING
      do
         x := "C++ is beautiful".replacing("C++","Eiffel")

         assert(x ~ "Eiffel is beautiful")
         x := "C++ is beautiful".replacing("beautiful","too complex")
         assert(x ~ "C++ is too complex")
         x := "a robot is a robot!".replacing("robot","person")
         assert(x ~ "a person is a person!")
         x:=  "a babau is a fantasy".replacing("ba","ten")
         assert(x~"a tentenu is a fantasy")

         label_assert("Replacing at beginning","C++ is beautiful".replacing("C++","Eiffel")~"Eiffel is beautiful")
         label_assert("Replacing at the end", "C++ is beautiful".replacing("beautiful","too complex")~"C++ is too complex")
         label_assert("Replacing two times", "a robot is a robot!".replacing("robot","person")~"a person is a person!")
         label_assert("Consecutive replacements", "a babau is a fantasy".replacing("ba","ten")~"a tentenu is a fantasy")
      end

   echo (s: ABSTRACT_STRING)
      do
         s.print_on(std_output)
      end
end
