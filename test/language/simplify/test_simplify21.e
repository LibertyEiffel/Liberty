-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SIMPLIFY21

insert
   PLATFORM
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         -- Testing infix "+":
         if -128 + 127  = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #1 in TEST_SIMPLIFY21 ***")
         end

         if Maximum_integer_8 + Minimum_integer_8 = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #2 in TEST_SIMPLIFY21 ***")
         end

         if -32768 + 32767 = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #3 in TEST_SIMPLIFY21 ***")
         end

         if Maximum_integer_16 + Minimum_integer_16 = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #4 in TEST_SIMPLIFY21 ***")
         end

         if -2147483648 + 2147483647  = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #5 in TEST_SIMPLIFY21 ***")
         end

         if Maximum_integer_32 + Minimum_integer_32 = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #6 in TEST_SIMPLIFY21 ***")
         end

         if 9223372036854775807 + Minimum_integer_64 = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #7 in TEST_SIMPLIFY21 ***")
         end

         if Maximum_integer_64 + Minimum_integer_64 = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #8 in TEST_SIMPLIFY21 ***")
         end

         -- Testing infix "-":
         if 127 - 127 - 127 - 1 = -128 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #9 in TEST_SIMPLIFY21 ***")
         end

         if Maximum_integer_8 - Maximum_integer_8 = 0 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #10 in TEST_SIMPLIFY21 ***")
         end

         if 32767 - 32767 - 32767 = - 32767  then
            assert(True)
         else
            c_inline_c("*** WrongCcode #11 in TEST_SIMPLIFY21 ***")
         end

         if Maximum_integer_16 - Maximum_integer_16 = 0 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #12 in TEST_SIMPLIFY21 ***")
         end

         if 2147483647 - 2147483647 - 2147483647 = - 2147483647 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #13 in TEST_SIMPLIFY21 ***")
         end

         if Maximum_integer_32 - Maximum_integer_32 = 0 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #14 in TEST_SIMPLIFY21 ***")
         end

         if 9223372036854775807 - 9223372036854775807 - 9223372036854775807 = - 9223372036854775807 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #15 in TEST_SIMPLIFY21 ***")
         end

         if Maximum_integer_64 - Maximum_integer_64 = 0 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #16 in TEST_SIMPLIFY21 ***")
         end

         -- Testing infix "*":
         if 1 * Minimum_integer_8 = -128 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #17 in TEST_SIMPLIFY21 ***")
         end

         if {INTEGER_16 2} * Minimum_integer_8 = -256 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #18 in TEST_SIMPLIFY21 ***")
         end

         if {INTEGER_32 2} * Maximum_integer_16 = 65534 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #19 in TEST_SIMPLIFY21 ***")
         end

         if {INTEGER_64 2} * Maximum_integer_16 * Maximum_integer_16 = 2147352578 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #20 in TEST_SIMPLIFY21 ***")
         end

         -- Testing {INTEGER_*}.to_character:
         if 32.to_character = ' ' then
            assert(True)
         else
            c_inline_c("*** WrongCcode #20 in TEST_SIMPLIFY21 ***")
         end

         -- Testing {INTEGER_*}.bit_shift_right:
         if 2.bit_shift_right(1) = 1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #21 in TEST_SIMPLIFY21 ***")
         end
         if 64.bit_shift_right(6) = 1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #22 in TEST_SIMPLIFY21 ***")
         end
         if {INTEGER_16 2}.bit_shift_right(1) = 1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #23 in TEST_SIMPLIFY21 ***")
         end
         if 16384.bit_shift_right(14) = 1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #24 in TEST_SIMPLIFY21 ***")
         end
         if {INTEGER_32 2}.bit_shift_right(1) = 1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #25 in TEST_SIMPLIFY21 ***")
         end
         if 1073741824.bit_shift_right(30) = 1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #26 in TEST_SIMPLIFY21 ***")
         end
         if {INTEGER_64 2}.bit_shift_right(1) = 1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #27 in TEST_SIMPLIFY21 ***")
         end
         if 4611686018427387904.bit_shift_right(62) = 1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #28 in TEST_SIMPLIFY21 ***")
         end

         -- Testing {INTEGER_*}.bit_not:
         if 0.bit_not = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #29 in TEST_SIMPLIFY21 ***")
         end
         if {INTEGER_16 0}.bit_not = {INTEGER_16 -1} then
            assert(True)
         else
            c_inline_c("*** WrongCcode #30 in TEST_SIMPLIFY21 ***")
         end
         if {INTEGER_32 0}.bit_not = {INTEGER_32 -1} then
            assert(True)
         else
            c_inline_c("*** WrongCcode #31 in TEST_SIMPLIFY21 ***")
         end

         if {INTEGER_64 0}.bit_not = {INTEGER_64 -1} then
            assert(True)
         else
            c_inline_c("*** WrongCcode #32 in TEST_SIMPLIFY21 ***")
         end
         -- Testing {INTEGER_*}.bit_and:
         if 1.bit_and(-1) = 1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #33 in TEST_SIMPLIFY21 ***")
         end
         if 193.bit_and(64) = 64 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #34 in TEST_SIMPLIFY21 ***")
         end
         if 2147483647.bit_and(-1) = 2147483647 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #35 in TEST_SIMPLIFY21 ***")
         end
         if Minimum_integer_64.bit_and(-1) = Minimum_integer_64 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #36 in TEST_SIMPLIFY21 ***")
         end
         -- Testing {INTEGER_*}.bit_or:
         if 1.bit_or(64) = 65 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #37 in TEST_SIMPLIFY21 ***")
         end
         if 128.bit_or(1) = 129 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #38 in TEST_SIMPLIFY21 ***")
         end
         if 32768.bit_or(1) = 32769 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #39 in TEST_SIMPLIFY21 ***")
         end
         if Maximum_integer_64.bit_or(Minimum_integer_64) = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #40 in TEST_SIMPLIFY21 ***")
         end
         if Maximum_integer_32.bit_or(Minimum_integer_32) = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #41 in TEST_SIMPLIFY21 ***")
         end
         if Maximum_integer_16.bit_or(Minimum_integer_16) = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #42 in TEST_SIMPLIFY21 ***")
         end
         -- Testing {INTEGER_*}.bit_xor:
         if Maximum_integer_8.bit_xor(Minimum_integer_8) = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #43 in TEST_SIMPLIFY21 ***")
         end
         if Maximum_integer_16.bit_xor(Minimum_integer_16) = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #44 in TEST_SIMPLIFY21 ***")
         end
         if Maximum_integer_32.bit_xor(Minimum_integer_32) = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #45 in TEST_SIMPLIFY21 ***")
         end
         if Maximum_integer_64.bit_xor(Minimum_integer_64) = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #46 in TEST_SIMPLIFY21 ***")
         end
         if 128.bit_xor(64) = 192 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #47 in TEST_SIMPLIFY21 ***")
         end
         -- Testing {INTEGER_*}.#-:
         if #- 1 = -1 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #48 in TEST_SIMPLIFY21 ***")
         end
         if #- 128 = -128 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #49 in TEST_SIMPLIFY21 ***")
         end
         if #- Minimum_integer_64 = Minimum_integer_64 then
            assert(True)
         else
            c_inline_c("*** WrongCcode #50 in TEST_SIMPLIFY21 ***")
         end

         assert(assert_counter.item = 51)
      end

end -- class TEST_SIMPLIFY21
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
