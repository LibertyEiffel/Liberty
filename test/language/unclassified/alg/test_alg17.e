-- This file is part of LibertEiffel The GNU Eiffel Compiler Tools and Libraries.
--
class TEST_ALG17
   -- derived from TEST_ALG14

inherit
   ANY

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   t1: STRING
   t2: STRING

   make
      do
         t1 := "string1"
         t2 := "string2"
         assert(not t1.is_deep_equal(t2))
      end

end -- class TEST_ALG17
