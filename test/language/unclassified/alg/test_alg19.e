-- This file is part of LibertEiffel The GNU Eiffel Compiler Tools and Libraries.
--
class TEST_ALG19
   -- derived from TEST_ALG14, test is_deep_equal for complex expandeds

inherit
   ANY

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   t1: TIME
   t2: TIME
   t3: TIME

   make
      do
         t1.update
         t2 := t1
         t2.add_second(2)
         t3 := t2

         label_assert("different", not t1.is_deep_equal(t2))
         label_assert("equal", t3.is_deep_equal(t2))
         label_assert("identical", t3.is_deep_equal(t3))
      end

end -- class TEST_ALG19
