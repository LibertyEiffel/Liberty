-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_TO_HEXADECIMAL

create {}
   make

feature {ANY}
   make
      local
         i8: INTEGER_8; i16: INTEGER_16; i32: INTEGER_32; i64: INTEGER_64; view: STRING
      do
         i8 := 0
         assert(i8.hexadecimal_digit = '0')
         assert(0.hexadecimal_digit = '0')
         i8 := 1
         assert(i8.hexadecimal_digit = '1')
         assert(1.hexadecimal_digit = '1')
         i8 := 8
         assert(i8.hexadecimal_digit = '8')
         assert(8.hexadecimal_digit = '8')
         i8 := 9
         assert(i8.hexadecimal_digit = '9')
         assert(9.hexadecimal_digit = '9')
         i8 := 10
         assert(i8.hexadecimal_digit = 'A')
         assert(10.hexadecimal_digit = 'A')
         i8 := 15
         assert(i8.hexadecimal_digit = 'F')
         assert(15.hexadecimal_digit = 'F')
         -- -------------------------------------
         i8 := -128
         view := i8.to_hexadecimal
         assert(("80").is_equal(view))
         i8 := -127
         view := i8.to_hexadecimal
         assert(("81").is_equal(view))
         i8 := -2
         view := i8.to_hexadecimal
         assert(("FE").is_equal(view))
         i8 := -1
         view := i8.to_hexadecimal
         assert(("FF").is_equal(view))
         i8 := 0
         view := i8.to_hexadecimal
         assert(("00").is_equal(view))
         i8 := 1
         view := i8.to_hexadecimal
         assert(("01").is_equal(view))
         i8 := 2
         view := i8.to_hexadecimal
         assert(("02").is_equal(view))
         i8 := 126
         view := i8.to_hexadecimal
         assert(("7E").is_equal(view))
         i8 := 127
         view := i8.to_hexadecimal
         assert(("7F").is_equal(view))
         -- -------------------------------------
         i16 := -32768
         view := i16.to_hexadecimal
         assert(("8000").is_equal(view))
         i16 := -32767
         view := i16.to_hexadecimal
         assert(("8001").is_equal(view))
         i16 := -2
         view := i16.to_hexadecimal
         assert(("FFFE").is_equal(view))
         i16 := -1
         view := i16.to_hexadecimal
         assert(("FFFF").is_equal(view))
         i16 := 0
         view := i16.to_hexadecimal
         assert(("0000").is_equal(view))
         i16 := 1
         view := i16.to_hexadecimal
         assert(("0001").is_equal(view))
         i16 := 2
         view := i16.to_hexadecimal
         assert(("0002").is_equal(view))
         i16 := 32767
         view := i16.to_hexadecimal
         assert(("7FFF").is_equal(view))
         i16 := 32766
         view := i16.to_hexadecimal
         assert(("7FFE").is_equal(view))
         i32 := -2147483648
         view := i32.to_hexadecimal
         assert(("80000000").is_equal(view))
         i32 := -2147483647
         view := i32.to_hexadecimal
         assert(("80000001").is_equal(view))
         i32 := -2
         view := i32.to_hexadecimal
         assert(("FFFFFFFE").is_equal(view))
         i32 := -1
         view := i32.to_hexadecimal
         assert(("FFFFFFFF").is_equal(view))
         i32 := 0
         view := i32.to_hexadecimal
         assert(("00000000").is_equal(view))
         i32 := 1
         view := i32.to_hexadecimal
         assert(("00000001").is_equal(view))
         i32 := 2
         view := i32.to_hexadecimal
         assert(("00000002").is_equal(view))
         i32 := 2147483646
         view := i32.to_hexadecimal
         assert(("7FFFFFFE").is_equal(view))
         i32 := 2147483647
         view := i32.to_hexadecimal
         assert(("7FFFFFFF").is_equal(view))
         -- -------------------------------------
         i64 := -2147483649
         view := i64.to_hexadecimal
         assert(("FFFFFFFF7FFFFFFF").is_equal(view))
         i64 := 2147483648
         view := i64.to_hexadecimal
         assert(("0000000080000000").is_equal(view))
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            sedb_breakpoint
            std_output.put_string("TEST_TO_HEXADECIMAL: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
            crash
         end
      end

   cpt: INTEGER

end -- class TEST_TO_HEXADECIMAL
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
