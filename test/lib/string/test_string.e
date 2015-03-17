class TEST_STRING

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         echo("a string%N")
         echo("a fixed string%N".intern)
      end

   echo (s: ABSTRACT_STRING)
      do
         s.print_on(std_output)
      end
end
