-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INTEGER4

create {}
   make

feature {ANY}
   make
      local
         a32, b32: INTEGER_32; a64, b64: INTEGER_64
      do
         a32 := 0xFFFFF000
         b32 := a32.bit_shift_right(4)
         assert(b32 = 0xFFFFFF00)
         a32 := 0xFFFFF000
         b32 := a32.bit_shift_right(8)
         assert(b32 = 0xFFFFFFF0)
         a32 := 0xFFFFF000
         b32 := a32.bit_shift_right(12)
         assert(b32 = 0xFFFFFFFF)
         a32 := 0xFFFFF000
         b32 := a32.bit_shift_right(16)
         assert(b32 = 0xFFFFFFFF)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_right(4)
         assert(b64 = 0xFFFFFF000FFFFF00)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_right(8)
         assert(b64 = 0xFFFFFFF000FFFFF0)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_right(12)
         assert(b64 = 0xFFFFFFFF000FFFFF)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_right(16)
         assert(b64 = 0xFFFFFFFFF000FFFF)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_right(24)
         assert(b64 = 0xFFFFFFFFFFF000FF)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_right(32)
         assert(b64 = 0xFFFFFFFFFFFFF000)
         -- -----------------------------------------------------
         a32 := 0x7FFFF000
         b32 := a32.bit_shift_right(4)
         assert(b32 = 0x07FFFF00)
         a32 := 0x7FFFF000
         b32 := a32.bit_shift_right(8)
         assert(b32 = 0x007FFFF0)
         a32 := 0x7FFFF000
         b32 := a32.bit_shift_right(12)
         assert(b32 = 0x0007FFFF)
         a32 := 0x7FFFF000
         b32 := a32.bit_shift_right(16)
         assert(b32 = 0x00007FFF)
         a64 := 0x7FFFF000FFFFF000
         b64 := a64.bit_shift_right(4)
         assert(b64 = 0x07FFFF000FFFFF00)
         a64 := 0x7FFFF000FFFFF000
         b64 := a64.bit_shift_right(8)
         assert(b64 = 0x007FFFF000FFFFF0)
         a64 := 0x7FFFF000FFFFF000
         b64 := a64.bit_shift_right(12)
         assert(b64 = 0x0007FFFF000FFFFF)
         a64 := 0x7FFFF000FFFFF000
         b64 := a64.bit_shift_right(16)
         assert(b64 = 0x00007FFFF000FFFF)
         a64 := 0x7FFFF000FFFFF000
         b64 := a64.bit_shift_right(24)
         assert(b64 = 0x0000007FFFF000FF)
         a64 := 0x7FFFF000FFFFF000
         b64 := a64.bit_shift_right(32)
         assert(b64 = 0x000000007FFFF000)
         -- -----------------------------------------------------
         a32 := 0xFFFFF000
         assert(a32.bit_not = 0x00000FFF)
         b32 := a32.bit_shift_right_unsigned(4)
         assert(b32 = 0x0FFFFF00)
         a32 := 0xFFFFF000
         b32 := a32.bit_shift_right_unsigned(8)
         assert(b32 = 0x00FFFFF0)
         a32 := 0xFFFFF000
         b32 := a32.bit_shift_right_unsigned(12)
         assert(b32 = 0x000FFFFF)
         a32 := 0xFFFFF000
         b32 := a32.bit_shift_right_unsigned(16)
         assert(b32 = 0x0000FFFF)
         a64 := 0xFFFFF000FFFFF000
         sedb_breakpoint
         b64 := a64.bit_shift_right_unsigned(8)
         assert(b64 = 0x00FFFFF000FFFFF0)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_right_unsigned(16)
         assert(b64 = 0x0000FFFFF000FFFF)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_right_unsigned(24)
         assert(b64 = 0x000000FFFFF000FF)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_right_unsigned(32)
         assert(b64 = 0x00000000FFFFF000)
         -- -----------------------------------------------------
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            sedb_breakpoint
            std_output.put_string("TEST_INTEGER4: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         end
      end

   cpt: INTEGER

end -- class TEST_INTEGER4
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
