-- This file is part of LibertEiffel The GNU Eiffel Compiler Tools and Libraries.
--
class TEST_ALG20
   -- derived from TEST_ALG14, test is_deep_equal for referenc types

inherit
   ANY

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   t1: AUX_ALG20
   t2: AUX_ALG20
   t3: AUX_ALG20

   make
      do
         create t1.make(1)
         create t2.make(2)
         create t3.make(2)

         label_assert("different", not t1.is_deep_equal(t2))
         label_assert("equal", t3.is_deep_equal(t2))
         label_assert("identical", t3.is_deep_equal(t3))
      end

end -- class TEST_ALG20
