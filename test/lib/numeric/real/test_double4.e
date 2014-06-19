-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_DOUBLE4

create {}
   make

feature {ANY}
   make
      local
         d: REAL_64; i: INTEGER; r: REAL_32
      do
         i := 2
         assert(i.sign = 1)
         i := -2
         assert(i.sign = -1)
         assert(0.sign = 0)
         r := 2
         assert(r.sign = 1)
         r := -2
         assert(r.sign = -1)
         assert(0.0.sign = 0)
         d := 2
         assert(d.sign = 1)
         d := -2
         assert(d.sign = -1)
         d := 0
         assert(d.sign = 0)
         d := 3.5
         assert(d.floor = 3)
         assert(d.ceiling = 4)
         d := -3.5
         assert(d.floor = -4)
         assert(d.ceiling = -3)
         d := 2.0
         assert(d.floor = 2)
         assert(d.ceiling = 2)
         assert(0.4.rounded.force_to_integer_32 = 0)
         assert(0.51.rounded.force_to_integer_32 = 1)
         assert(1.49.rounded.force_to_integer_32 = 1)
         assert(1.51.rounded.force_to_integer_32 = 2)
         assert((-0.4).rounded.force_to_integer_32 = 0)
         assert((-0.51).rounded.force_to_integer_32 = -1)
         assert((-1.49).rounded.force_to_integer_32 = -1)
         assert((-1.51).rounded.force_to_integer_32 = -2)
         assert(0.4.rounded = 0)
         assert(0.51.rounded = 1)
         assert(1.49.rounded = 1)
         assert(1.51.rounded = 2)
         assert((-0.4).rounded = 0)
         assert((-0.51).rounded = -1)
         assert((-1.49).rounded = -1)
         assert((-1.51).rounded = -2)
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            sedb_breakpoint
            std_output.put_string("TEST_DOUBLE4: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_DOUBLE4
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
