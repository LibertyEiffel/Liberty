-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INTEGER5

create {}
   make

feature {ANY}
   make
      local
         a32, b32: INTEGER_32; a64, b64: INTEGER_64
      do
         a32 := 0xFFFFF000
         b32 := a32.bit_shift_left(4)
         assert(b32 = 0xFFFF0000)
         a32 := 0xFFFFF000
         b32 := a32.bit_shift_left(8)
         assert(b32 = 0xFFF00000)
         a32 := 0xFFFFF000
         b32 := a32.bit_shift_left(12)
         assert(b32 = 0xFF000000)
         a32 := 0xFFFFF000
         b32 := a32.bit_shift_left(16)
         assert(b32 = 0xF0000000)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_left(4)
         assert(b64 = 0xFFFF000FFFFF0000)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_left(8)
         assert(b64 = 0xFFF000FFFFF00000)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_left(12)
         assert(b64 = 0xFF000FFFFF000000)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_left(16)
         assert(b64 = 0xF000FFFFF0000000)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_left(24)
         assert(b64 = 0x00FFFFF000000000)
         a64 := 0xFFFFF000FFFFF000
         b64 := a64.bit_shift_left(32)
         assert(b64 = 0xFFFFF00000000000)
         -- -----------------------------------------------------
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            sedb_breakpoint
            std_output.put_string("TEST_INTEGER5: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         end
      end

   cpt: INTEGER

end -- class TEST_INTEGER5
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
