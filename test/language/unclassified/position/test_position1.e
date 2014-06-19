-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_POSITION1

create {}
   make

feature {ANY}
   dummy: AUX_POSITION
      do
      end

   make
      local
         p1: like dummy
      do
         assert(p1.line = 0)
         assert(p1.column = 0)
         assert(p1.id = 0)
         p1.set(1, 2, 3)
         assert(p1.line = 1)
         assert(p1.column = 2)
         assert(p1.id = 3)
         p1.set(1, 127, 3)
         assert(p1.line = 1)
         assert(p1.column = 127)
         assert(p1.id = 3)
         p1.set(8191, 126, 2047)
         assert(p1.line = 8191)
         assert(p1.column = 126)
         assert(p1.id = 2047)
         p1.set(8191, 127, 2047)
         assert(p1.line = 8191)
         assert(p1.column = 127)
         assert(p1.id = 2047)
         p1.set(8191, 128, 2047)
         assert(p1.line = 8191)
         assert(p1.column = 0)
         assert(p1.id = 2047)
         p1.set(8192, 1, 1)
         assert(p1.line = 8192)
         assert(p1.column = 0)
         assert(p1.id = 1)
         p1.set(1, 1, 2048)
         assert(p1.line = 1)
         assert(p1.column = 0)
         assert(p1.id = 2048)
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_POSITION1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
            crash
         end
      end

   cpt: INTEGER

end -- class TEST_POSITION1
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
