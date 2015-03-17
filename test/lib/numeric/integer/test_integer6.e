-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INTEGER6
   --
   -- Balancing rule implies some weird stuff...
   --

create {}
   make

feature {ANY}
   make
      local
         a8, b8: INTEGER_8; a16: INTEGER_16; a32: INTEGER_32; a64: INTEGER_64
      do
         a8 := 0xff
         b8 := a8.bit_shift_right(1)
         assert(b8 = 0xff)
         a8 := 0xff
         b8 := a8.bit_shift_right_unsigned(1)
         assert(b8 = 0x7f)
         -- -----------------------------------------------------
         a16 := 0x00ff
         a8 := a16.low_8
         assert(a8 = 0xff)
         a8 := a16.high_8
         assert(a8 = 0x00)
         a16 := 0xffff
         a8 := a16.low_8
         assert(a8 = 0xff)
         a8 := a16.high_8
         assert(a8 = 0xff)
         a16 := 0xff7f
         a8 := a16.low_8
         assert(a8 = 0x7f)
         a8 := a16.high_8
         assert(a8 = 0xff)
         -- -----------------------------------------------------
         -- -----------------------------------------------------
         a32 := 0x0000ffff
         a16 := a32.low_16
         assert(a16 = 0xffff)
         a16 := a32.high_16
         assert(a16 = 0x0000)
         a32 := 0xffffffff
         a16 := a32.low_16
         assert(a16 = 0xffff)
         a16 := a32.high_16
         assert(a16 = 0xffff)
         a32 := 0xffff7fff
         a16 := a32.low_16
         assert(a16 = 0x7fff)
         a16 := a32.high_16
         assert(a16 = 0xffff)
         -- -----------------------------------------------------
         -- -----------------------------------------------------
         a64 := 0x00000000ffffffff
         a32 := a64.low_32
         assert(a32 = 0xffffffff)
         a32 := a64.high_32
         assert(a32 = 0x00000000)
         a64 := 0xffffffffffffffff
         a32 := a64.low_32
         assert(a32 = 0xffffffff)
         a32 := a64.high_32
         assert(a32 = 0xffffffff)
         a64 := 0xffffffff7fffffff
         a32 := a64.low_32
         assert(a32 = 0x7fffffff)
         a32 := a64.high_32
         assert(a32 = 0xffffffff)
         -- -----------------------------------------------------
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            sedb_breakpoint
            std_output.put_string("TEST_INTEGER6: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         end
      end

   cpt: INTEGER

end -- class TEST_INTEGER6
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
