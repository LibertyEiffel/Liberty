-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INTEGER1

insert
   ANY
   PLATFORM

create {}
   make

feature {ANY}
   make
      local
         tmp_string: STRING; i: INTEGER
      do
         assert(1 = 1)
         assert(0 = 0)
         assert(-1 = -1)
         assert(0 + 1 = 1)
         assert(1 = 1 + 0)
         assert(0 - 1 = -1)
         assert(-1 = -1 + 0)
         assert(2 + 2 = 4)
         assert(2 + 2 /= 3)
         assert(2 * 2 = 4)
         assert(4 = 2 * 2)
         i := 76
         assert(76 = i)
         assert(i + 1 = 77)
         assert(76 = i)
         i := 0
         assert(i // 1 = 0)
         assert(i \\ 1 = 0)
         assert(i // -1 = 0)
         assert(i \\ -1 = 0)
         assert(i // 10 = 0)
         assert(i \\ 10 = 0)
         assert(i // -10 = 0)
         assert(i \\ -10 = 0)
         assert(i // Minimum_integer = 0)
         assert(i \\ Minimum_integer = 0)
         assert(i // Maximum_integer = 0)
         assert(i \\ Maximum_integer = 0)
         assert(i // (Minimum_integer + 10) = 0)
         assert(i \\ (Minimum_integer + 10) = 0)
         assert(i // (Maximum_integer - 10) = 0)
         assert(i \\ (Maximum_integer - 10) = 0)
         assert(i = 0)
         i := 1
         assert(i // 1 = 1)
         assert(i \\ 1 = 0)
         assert(i // -1 = -1)
         assert(i \\ -1 = 0)
         assert(i // 10 = 0)
         assert(i \\ 10 = 1)
         assert(i // -10 = 0)
         assert(i \\ -10 = 1)
         assert(i // Minimum_integer = 0)
         assert(i \\ Minimum_integer = 1)
         assert(i // Maximum_integer = 0)
         assert(i \\ Maximum_integer = 1)
         assert(i // (Minimum_integer + 10) = 0)
         assert(i \\ (Minimum_integer + 10) = 1)
         assert(i // (Maximum_integer - 10) = 0)
         assert(i \\ (Maximum_integer - 10) = 1)
         assert(i = 1)
         i := -1
         assert(i // 1 = -1)
         assert(i \\ 1 = 0)
         assert(i // -1 = 1)
         assert(i \\ -1 = 0)
         assert(i // 10 = -1)
         assert(i \\ 10 = 9)
         assert(i // -10 = 1)
         assert(i \\ -10 = 9)
         assert(i // Minimum_integer_32 = 1)
         assert(i \\ Minimum_integer = Maximum_integer)
         assert(i // Maximum_integer = -1)
         assert(i \\ Maximum_integer = Maximum_integer - 1)
         assert(i // (Minimum_integer + 10) = 1)
         assert(i \\ (Minimum_integer + 10) = Maximum_integer - 10)
         assert(i // (Maximum_integer - 10) = -1)
         assert(i \\ (Maximum_integer - 10) = Maximum_integer - 11)
         assert(i = -1)
         i := 10
         assert(i // 1 = 10)
         assert(i \\ 1 = 0)
         assert(i // -1 = -10)
         assert(i \\ -1 = 0)
         assert(i // 10 = 1)
         assert(i \\ 10 = 0)
         assert(i // -10 = -1)
         assert(i \\ -10 = 0)
         assert(i // Minimum_integer = 0)
         assert(i \\ Minimum_integer = 10)
         assert(i // Maximum_integer = 0)
         assert(i \\ Maximum_integer = 10)
         assert(i // (Minimum_integer + 10) = 0)
         assert(i \\ (Minimum_integer + 10) = 10)
         assert(i // (Maximum_integer - 10) = 0)
         assert(i \\ (Maximum_integer - 10) = 10)
         assert(i = 10)
         i := -10
         assert(i // 1 = -10)
         assert(i \\ 1 = 0)
         assert(i // -1 = 10)
         assert(i \\ -1 = 0)
         assert(i // 10 = -1)
         assert(i \\ 10 = 0)
         assert(i // -10 = 1)
         assert(i \\ -10 = 0)
         assert(i // Minimum_integer = 1)
         assert(i \\ Minimum_integer = Maximum_integer - 9)
         assert(i // Maximum_integer = -1)
         assert(i \\ Maximum_integer = Maximum_integer - 10)
         assert(i // (Minimum_integer + 10) = 1)
         assert(i \\ (Minimum_integer + 10) = Maximum_integer - 19)
         assert(i // (Maximum_integer - 10) = -1)
         assert(i \\ (Maximum_integer - 10) = Maximum_integer - 20)
         assert(i = -10)
         i := 30
         assert(i // 1 = 30)
         assert(i \\ 1 = 0)
         assert(i // -1 = -30)
         assert(i \\ -1 = 0)
         assert(i // 10 = 3)
         assert(i \\ 10 = 0)
         assert(i // -10 = -3)
         assert(i \\ -10 = 0)
         assert(i // Minimum_integer = 0)
         assert(i \\ Minimum_integer = 30)
         assert(i // Maximum_integer = 0)
         assert(i \\ Maximum_integer = 30)
         assert(i // (Minimum_integer + 10) = 0)
         assert(i \\ (Minimum_integer + 10) = 30)
         assert(i // (Maximum_integer - 10) = 0)
         assert(i \\ (Maximum_integer - 10) = 30)
         assert(i = 30)
         i := -30
         assert(i // 1 = -30)
         assert(i \\ 1 = 0)
         assert(i // -1 = 30)
         assert(i \\ -1 = 0)
         assert(i // 10 = -3)
         assert(i \\ 10 = 0)
         assert(i // -10 = 3)
         assert(i \\ -10 = 0)
         assert(i // Minimum_integer = 1)
         assert(i \\ Minimum_integer = Maximum_integer - 29)
         assert(i // Maximum_integer = -1)
         assert(i \\ Maximum_integer = Maximum_integer - 30)
         assert(i // (Minimum_integer + 10) = 1)
         assert(i \\ (Minimum_integer + 10) = Maximum_integer - 39)
         assert(i // (Maximum_integer - 10) = -1)
         assert(i \\ (Maximum_integer - 10) = Maximum_integer - 40)
         assert(i = -30)
         i := 31
         assert(i // 1 = 31)
         assert(i \\ 1 = 0)
         assert(i // -1 = -31)
         assert(i \\ -1 = 0)
         assert(i // 10 = 3)
         assert(i \\ 10 = 1)
         assert(i // -10 = -3)
         assert(i \\ -10 = 1)
         assert(i // Minimum_integer = 0)
         assert(i \\ Minimum_integer = 31)
         assert(i // Maximum_integer = 0)
         assert(i \\ Maximum_integer = 31)
         assert(i // (Minimum_integer + 10) = 0)
         assert(i \\ (Minimum_integer + 10) = 31)
         assert(i // (Maximum_integer - 10) = 0)
         assert(i \\ (Maximum_integer - 10) = 31)
         assert(i = 31)
         i := -31
         assert(i // 1 = -31)
         assert(i \\ 1 = 0)
         assert(i // -1 = 31)
         assert(i \\ -1 = 0)
         assert(i // 10 = -4)
         assert(i \\ 10 = 9)
         assert(i // -10 = 4)
         assert(i \\ -10 = 9)
         assert(i // Minimum_integer = 1)
         assert(i \\ Minimum_integer = Maximum_integer - 30)
         assert(i // Maximum_integer = -1)
         assert(i \\ Maximum_integer = Maximum_integer - 31)
         assert(i // (Minimum_integer + 10) = 1)
         assert(i \\ (Minimum_integer + 10) = Maximum_integer - 40)
         assert(i // (Maximum_integer - 10) = -1)
         assert(i \\ (Maximum_integer - 10) = Maximum_integer - 41)
         assert(i = -31)
         i := 29
         assert(i // 1 = 29)
         assert(i \\ 1 = 0)
         assert(i // -1 = -29)
         assert(i \\ -1 = 0)
         assert(i // 10 = 2)
         assert(i \\ 10 = 9)
         assert(i // -10 = -2)
         assert(i \\ -10 = 9)
         assert(i // Minimum_integer = 0)
         assert(i \\ Minimum_integer = 29)
         assert(i // Maximum_integer = 0)
         assert(i \\ Maximum_integer = 29)
         assert(i // (Minimum_integer + 10) = 0)
         assert(i \\ (Minimum_integer + 10) = 29)
         assert(i // (Maximum_integer - 10) = 0)
         assert(i \\ (Maximum_integer - 10) = 29)
         assert(i = 29)
         i := -29
         assert(i // 1 = -29)
         assert(i \\ 1 = 0)
         assert(i // -1 = 29)
         assert(i \\ -1 = 0)
         assert(i // 10 = -3)
         assert(i \\ 10 = 1)
         assert(i // -10 = 3)
         assert(i \\ -10 = 1)
         assert(i // Minimum_integer = 1)
         assert(i \\ Minimum_integer = Maximum_integer - 28)
         assert(i // Maximum_integer = -1)
         assert(i \\ Maximum_integer = Maximum_integer - 29)
         assert(i // (Minimum_integer + 10) = 1)
         assert(i \\ (Minimum_integer + 10) = Maximum_integer - 38)
         assert(i // (Maximum_integer - 10) = -1)
         assert(i \\ (Maximum_integer - 10) = Maximum_integer - 39)
         assert(i = -29)
         i := Maximum_integer
         assert(i // 1 = Maximum_integer)
         assert(i \\ 1 = 0)
         assert(i // -1 = -Maximum_integer)
         assert(i \\ -1 = 0)
         assert(i // 10 = 214748364)
         assert(i \\ 10 = 7)
         assert(i // -10 = -214748364)
         assert(i \\ -10 = 7)
         assert(i // Minimum_integer = 0)
         assert(i \\ Minimum_integer = Maximum_integer)
         assert(i // Maximum_integer = 1)
         assert(i \\ Maximum_integer = 0)
         assert(i // (Minimum_integer + 10) = -1)
         assert(i \\ (Minimum_integer + 10) = 9)
         assert(i // (Maximum_integer - 10) = 1)
         assert(i \\ (Maximum_integer - 10) = 10)
         assert(i = Maximum_integer)
         i := Minimum_integer
         assert(i // 1 = Minimum_integer)
         assert(i \\ 1 = 0)
         --    assert(i // -1 = -Minimum_integer)       overflow !!
         -- *** C ANSI 99 BUG !!! (i #\\ -1) give an overflow !!!
         -- (Vincent Croizier, 02/11/2004) ***
         --         assert(i \\ -1 = 0)
         assert(i // 10 = -214748365)
         assert(i \\ 10 = 2)
         assert(i // -10 = 214748365)
         assert(i \\ -10 = 2)
         assert(i // Minimum_integer = 1)
         assert(i \\ Minimum_integer = 0)
         assert(i // Maximum_integer = -2)
         assert(i \\ Maximum_integer = Maximum_integer - 1)
         assert(i // (Minimum_integer + 10) = 2)
         assert(i \\ (Minimum_integer + 10) = Maximum_integer - 19)
         assert(i // (Maximum_integer - 10) = -2)
         assert(i \\ (Maximum_integer - 10) = Maximum_integer - 21)
         assert(i = Minimum_integer)
         assert(2 ^ 0 = 1)
         assert(2 ^ 1 = 2)
         assert(2 ^ 2 = 4)
         assert(2 ^ 3 = 8)
         assert(3 ^ 0 = 1)
         assert(3 ^ 1 = 3)
         assert(3 ^ 2 = 9)
         assert(3 ^ 3 = 27)
         assert(-3 < -1)
         assert(-1 < 0)
         assert(-1 < 1)
         assert(0 < 1)
         assert(1 < 2)
         assert(-3 <= -1)
         assert(-3 <= -3)
         assert(-1 <= 0)
         assert(-1 <= 1)
         assert(-1 <= -1)
         assert(0 <= 1)
         assert(1 <= 2)
         assert(2 <= 2)
         assert(not (3 <= 2))
         assert(3 = 3)
         assert(3 = +(1 + 2))
         assert(-3 = 3 - 6)
         assert(("0").is_equal(0.to_string))
         assert(("25").is_equal(25.to_string))
         assert(("-25").is_equal((-25).to_string))
         assert((" 25").is_equal(25.to_string_format(3)))
         assert((" -25").is_equal((-25).to_string_format(4)))
         assert('0' = 0.digit)
         assert('5' = 5.digit)
         assert('9' = 9.digit)
         assert(' ' = 32.to_character)
         assert((-25).abs = 25)
         assert(25.abs = 25)
         assert(3.max(4) = 4)
         assert(4.max(3) = 4)
         assert(3.min(4) = 3)
         assert(4.min(3) = 3)
         assert((-2).min(2) = -2)
         assert(2.max(-2) = 2)
         -- testing to_octal_in
         tmp_string := ""
         0.to_octal_in(tmp_string)
         assert(tmp_string.is_equal("000"))
         tmp_string.clear_count
         7.to_octal_in(tmp_string)
         assert(tmp_string.is_equal("007"))
         tmp_string.clear_count
         8.to_octal_in(tmp_string)
         assert(tmp_string.is_equal("010"))
         tmp_string.clear_count
         9.to_octal_in(tmp_string)
         assert(tmp_string.is_equal("011"))
         tmp_string.clear_count
         ;(-10).to_octal_in(tmp_string)
         assert(tmp_string.is_equal("366"))
         tmp_string.clear_count
         400.to_octal_in(tmp_string)
         assert(tmp_string.is_equal("000620"))
         tmp_string.clear_count
         ;(-400).to_octal_in(tmp_string)
         assert(tmp_string.is_equal("177160"))
         tmp_string.clear_count
         255.to_octal_in(tmp_string)
         assert(tmp_string.is_equal("000377"))
         tmp_string.clear_count
         127.to_octal_in(tmp_string)
         assert(tmp_string.is_equal("177"))
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            sedb_breakpoint
            std_output.put_string("TEST_INTEGER1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         end
      end

   cpt: INTEGER

end -- class TEST_INTEGER1
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
