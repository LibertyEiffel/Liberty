-- This file is part of LibertEiffel The GNU Eiffel Compiler Tools and Libraries.
--
class TEST_ALG18
   -- derived from TEST_ALG14, test basic is_deep_equal functionality 
   -- on expanded types

inherit
   ANY

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   t1: INTEGER
   t2: INTEGER
   t3: INTEGER

   make
      do
         t1 := 1
         t2 := 2
         t3 := 2
         label_assert("different", not t1.is_deep_equal(t2))
         label_assert("identical", t2.is_deep_equal(t2))
         label_assert("equal", t2.is_deep_equal(t3))
      end

end -- class TEST_ALG18
