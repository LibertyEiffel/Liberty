-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_HEXADECIMAL1

create {}
   make

feature {ANY}
   make
      local
         i8: INTEGER_8; i16: INTEGER_16; i32: INTEGER_32; i64: INTEGER_64; view: STRING
      do
         i8 := 0xFF
         assert(i8 = -1)
         i8 := 0x01
         assert(i8 = 1)
         i8 := 0x08
         assert(i8 = 8)
         i8 := 0xF8
         assert(i8 = -8)
         i8 := 0x0A
         assert(i8 = 10)
         i8 := 0x0F
         assert(i8 = 15)
         -- -------------------------------------
         i8 := 0x80
         assert(i8 = -128)
         i8 := 0x81
         assert(i8 = -127)
         i8 := 0xFE
         assert(i8 = -2)
         i8 := 0x00
         assert(i8 = 0)
         i8 := 0x01
         assert(i8 = 1)
         i8 := 0x02
         assert(i8 = 2)
         i8 := 0x7E
         assert(i8 = 126)
         i8 := 0x7F
         assert(i8 = 127)
         -- -------------------------------------
         i16 := 0x8000
         assert(i16 = -32768)
         i16 := 0x8001
         assert(i16 = -32767)
         i16 := 0xFFFE
         view := i16.to_hexadecimal
         assert(i16 = -2)
         assert({INTEGER_8 -1} = 0xFF)
         assert({INTEGER_16 -1} = 0xFFFF)
         assert(-1 = 0xFF)
         assert(-1 = 0xFFFF)
         assert(-1 = 0xFFFFffff)
         assert(-1 = 0xFFFFffffFFFFffff)
         assert(0x0000 = 0)
         assert(1 = 0x0001)
         assert(2 = 0x0002)
         assert(32767 = 0x7FFF)
         assert(32766 = 0x7FFE)
         i32 := 0x80000000
         assert(i32 = -2147483648)
         assert(-2147483647 = 0x80000001)
         assert(0xFFFFFFFE = -2)
         assert(-1 = 0xFFFFFFFF)
         assert(0 = 0x00000000)
         i32 := 0x00000001
         assert(i32 = 1)
         i32 := 0x00000002
         assert(i32 = 2)
         i32 := 0x7FFFFFFE
         view := i32.to_hexadecimal
         assert(i32 = 2147483646)
         i32 := 0x7FFFFFFF
         assert(i32 = 2147483647)
         -- -------------------------------------
         i64 := 0x8000000000000000
         assert(i64 = -9223372036854775808)
         i64 := 0xFFFFFFFF7FFFFFFF
         assert(i64 = -2147483649)
         i64 := 0x0000000080000000
         assert(i64 = 2147483648)
         i64 := 0x7fffffffffffffff
         assert(i64 = 9223372036854775807)
         -- -------------------------------------
         assert(0x0001 = 0x01)
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            sedb_breakpoint
            std_output.put_string("TEST_HEXADECIMAL1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
            crash
         end
      end

   cpt: INTEGER

end -- class TEST_HEXADECIMAL1
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
