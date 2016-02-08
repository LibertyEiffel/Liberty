-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ARGUMENT_FILLING
   -- Test `arg' infix "#" operators in ABSTRACT_STRING, actually also testing FILLABLE_STRING.

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      do
         assert(("# is not changed").arg(1, "dummy").is_equal("# is not changed"))
         assert(("And also #(12345 is not changed").arg(1, "dummy").is_equal("And also #(12345 is not changed"))
         assert(("#(1) is nice").arg(1, "Eiffel").is_equal("Eiffel is nice"))
         assert(("But #(1) and #(2) are").arg(1, "one").arg(2, "another").is_equal("But one and another are"))
         assert(("But #(1) and #(2) are").arg(2, "another").arg(1, "one").is_equal("But one and another are"))
         assert(("But #(1) and #(2) are").arg(1, "one").arg(2, "another").is_equal("But one and another are"))
         assert(("Hey #(2) I got #(1) with #(3)!").arg(1, "an apple").arg(2, "teacher").arg(3, "a worm").is_equal("Hey teacher I got an apple with a worm!"))
         assert(("#(1) is #(1)").arg(1, "life").is_equal("life is life"))
         assert(("He sang «#(1) is #(1)»").arg(1, "life").is_equal("He sang «life is life»"))
         assert(("Also ## is not changed" # "dummy").is_equal("Also # is not changed")) -- ## is used to escape #
         assert(("Even #( is not changed" # "dummy").is_equal("Even #( is not changed"))
         assert(("#(1) is nice" # "Eiffel").is_equal("Eiffel is nice"))
         assert(("But #(1) and #(2) are" # "one" # "another").is_equal("But one and another are"))
         assert(("Hey #(2) I got #(1) with #(3)!" # "an apple" # "teacher" # "a worm").is_equal("Hey teacher I got an apple with a worm!"))
         assert(("#(1) is #(1)" # "life").is_equal("life is life"))
         assert(("He sang «#(1) is #(1)»" # "life").is_equal("He sang «life is life»"))
      end

end -- class TEST_ARGUMENT_FILLING
